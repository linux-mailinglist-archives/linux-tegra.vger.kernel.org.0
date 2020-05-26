Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41A7D1BDECA
	for <lists+linux-tegra@lfdr.de>; Wed, 29 Apr 2020 15:41:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727961AbgD2Nhq (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 29 Apr 2020 09:37:46 -0400
Received: from 8bytes.org ([81.169.241.247]:39874 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727929AbgD2Nhq (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 29 Apr 2020 09:37:46 -0400
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id 85A05CD1; Wed, 29 Apr 2020 15:37:37 +0200 (CEST)
From:   Joerg Roedel <joro@8bytes.org>
To:     Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        David Woodhouse <dwmw2@infradead.org>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc:     Daniel Drake <drake@endlessm.com>, jonathan.derrick@intel.com,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-tegra@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        Joerg Roedel <jroedel@suse.de>
Subject: [PATCH v3 12/34] iommu: Move iommu_group_create_direct_mappings() out of iommu_group_add_device()
Date:   Wed, 29 Apr 2020 15:36:50 +0200
Message-Id: <20200429133712.31431-13-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200429133712.31431-1-joro@8bytes.org>
References: <20200429133712.31431-1-joro@8bytes.org>
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Joerg Roedel <jroedel@suse.de>

After the previous changes the iommu group may not have a default
domain when iommu_group_add_device() is called. With no default domain
iommu_group_create_direct_mappings() will do nothing and no direct
mappings will be created.

Rename iommu_group_create_direct_mappings() to
iommu_create_device_direct_mappings() to better reflect that the
function creates direct mappings only for one device and not for all
devices in the group. Then move the call to the places where a default
domain actually exists.

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 drivers/iommu/iommu.c | 35 ++++++++++++++++++++++++++++++-----
 1 file changed, 30 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 7de0e29db333..834a45da0ed0 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -89,6 +89,8 @@ static int __iommu_attach_group(struct iommu_domain *domain,
 				struct iommu_group *group);
 static void __iommu_detach_group(struct iommu_domain *domain,
 				 struct iommu_group *group);
+static int iommu_create_device_direct_mappings(struct iommu_group *group,
+					       struct device *dev);
 
 #define IOMMU_GROUP_ATTR(_name, _mode, _show, _store)		\
 struct iommu_group_attribute iommu_group_attr_##_name =		\
@@ -243,6 +245,8 @@ static int __iommu_probe_device_helper(struct device *dev)
 	if (group->default_domain)
 		ret = __iommu_attach_device(group->default_domain, dev);
 
+	iommu_create_device_direct_mappings(group, dev);
+
 	iommu_group_put(group);
 
 	if (ret)
@@ -263,6 +267,7 @@ static int __iommu_probe_device_helper(struct device *dev)
 int iommu_probe_device(struct device *dev)
 {
 	const struct iommu_ops *ops = dev->bus->iommu_ops;
+	struct iommu_group *group;
 	int ret;
 
 	WARN_ON(dev->iommu_group);
@@ -285,6 +290,10 @@ int iommu_probe_device(struct device *dev)
 	if (ret)
 		goto err_module_put;
 
+	group = iommu_group_get(dev);
+	iommu_create_device_direct_mappings(group, dev);
+	iommu_group_put(group);
+
 	if (ops->probe_finalize)
 		ops->probe_finalize(dev);
 
@@ -736,8 +745,8 @@ int iommu_group_set_name(struct iommu_group *group, const char *name)
 }
 EXPORT_SYMBOL_GPL(iommu_group_set_name);
 
-static int iommu_group_create_direct_mappings(struct iommu_group *group,
-					      struct device *dev)
+static int iommu_create_device_direct_mappings(struct iommu_group *group,
+					       struct device *dev)
 {
 	struct iommu_domain *domain = group->default_domain;
 	struct iommu_resv_region *entry;
@@ -841,8 +850,6 @@ int iommu_group_add_device(struct iommu_group *group, struct device *dev)
 
 	dev->iommu_group = group;
 
-	iommu_group_create_direct_mappings(group, dev);
-
 	mutex_lock(&group->mutex);
 	list_add_tail(&device->list, &group->devices);
 	if (group->domain)
@@ -1736,6 +1743,7 @@ static void probe_alloc_default_domain(struct bus_type *bus,
 		gtype.type = iommu_def_domain_type;
 
 	iommu_group_alloc_default_domain(bus, group, gtype.type);
+
 }
 
 static int iommu_group_do_dma_attach(struct device *dev, void *data)
@@ -1760,6 +1768,21 @@ static int __iommu_group_dma_attach(struct iommu_group *group)
 					  iommu_group_do_dma_attach);
 }
 
+static int iommu_do_create_direct_mappings(struct device *dev, void *data)
+{
+	struct iommu_group *group = data;
+
+	iommu_create_device_direct_mappings(group, dev);
+
+	return 0;
+}
+
+static int iommu_group_create_direct_mappings(struct iommu_group *group)
+{
+	return __iommu_group_for_each_dev(group, group,
+					  iommu_do_create_direct_mappings);
+}
+
 static int bus_iommu_probe(struct bus_type *bus)
 {
 	const struct iommu_ops *ops = bus->iommu_ops;
@@ -1792,6 +1815,8 @@ static int bus_iommu_probe(struct bus_type *bus)
 				continue;
 			}
 
+			iommu_group_create_direct_mappings(group);
+
 			ret = __iommu_group_dma_attach(group);
 
 			mutex_unlock(&group->mutex);
@@ -2632,7 +2657,7 @@ request_default_domain_for_dev(struct device *dev, unsigned long type)
 		iommu_domain_free(group->default_domain);
 	group->default_domain = domain;
 
-	iommu_group_create_direct_mappings(group, dev);
+	iommu_create_device_direct_mappings(group, dev);
 
 	dev_info(dev, "Using iommu %s mapping\n",
 		 type == IOMMU_DOMAIN_DMA ? "dma" : "direct");
-- 
2.17.1


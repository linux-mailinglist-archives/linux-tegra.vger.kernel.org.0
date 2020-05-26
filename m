Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 153821A14CE
	for <lists+linux-tegra@lfdr.de>; Tue,  7 Apr 2020 20:40:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727845AbgDGSjg (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 7 Apr 2020 14:39:36 -0400
Received: from 8bytes.org ([81.169.241.247]:57616 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726882AbgDGSh6 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 7 Apr 2020 14:37:58 -0400
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id DA73D455; Tue,  7 Apr 2020 20:37:50 +0200 (CEST)
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
Cc:     iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-tegra@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        Joerg Roedel <jroedel@suse.de>
Subject: [RFC PATCH 13/34] iommu: Export bus_iommu_probe() and make is safe for re-probing
Date:   Tue,  7 Apr 2020 20:37:21 +0200
Message-Id: <20200407183742.4344-14-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200407183742.4344-1-joro@8bytes.org>
References: <20200407183742.4344-1-joro@8bytes.org>
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Joerg Roedel <jroedel@suse.de>

Add a check to the bus_iommu_probe() call-path to make sure it ignores
devices which have already been successfully probed. Then export the
bus_iommu_probe() function so it can be used by IOMMU drivers.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 drivers/iommu/iommu.c | 6 +++++-
 include/linux/iommu.h | 1 +
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 844613850595..cf25c1e48830 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1615,6 +1615,10 @@ static int probe_iommu_group(struct device *dev, void *data)
 	if (!dev_iommu_get(dev))
 		return -ENOMEM;
 
+	/* Device is probed already if in a group */
+	if (iommu_group_get(dev) != NULL)
+		return 0;
+
 	if (!try_module_get(ops->owner)) {
 		ret = -EINVAL;
 		goto err_free_dev_iommu;
@@ -1783,7 +1787,7 @@ static int iommu_group_create_direct_mappings(struct iommu_group *group)
 					  iommu_do_create_direct_mappings);
 }
 
-static int bus_iommu_probe(struct bus_type *bus)
+int bus_iommu_probe(struct bus_type *bus)
 {
 	const struct iommu_ops *ops = bus->iommu_ops;
 	int ret;
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 30170d191e5e..fea1622408ad 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -445,6 +445,7 @@ static inline void iommu_iotlb_gather_init(struct iommu_iotlb_gather *gather)
 #define IOMMU_GROUP_NOTIFY_UNBOUND_DRIVER	6 /* Post Driver unbind */
 
 extern int bus_set_iommu(struct bus_type *bus, const struct iommu_ops *ops);
+extern int bus_iommu_probe(struct bus_type *bus);
 extern bool iommu_present(struct bus_type *bus);
 extern bool iommu_capable(struct bus_type *bus, enum iommu_cap cap);
 extern struct iommu_domain *iommu_domain_alloc(struct bus_type *bus);
-- 
2.17.1


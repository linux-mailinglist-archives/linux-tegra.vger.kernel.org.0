Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D2171A14DD
	for <lists+linux-tegra@lfdr.de>; Tue,  7 Apr 2020 20:40:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727489AbgDGSjx (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 7 Apr 2020 14:39:53 -0400
Received: from 8bytes.org ([81.169.241.247]:57434 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726883AbgDGSh6 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 7 Apr 2020 14:37:58 -0400
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id EB8953D0; Tue,  7 Apr 2020 20:37:50 +0200 (CEST)
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
Subject: [RFC PATCH 14/34] iommu/amd: Remove dev_data->passthrough
Date:   Tue,  7 Apr 2020 20:37:22 +0200
Message-Id: <20200407183742.4344-15-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200407183742.4344-1-joro@8bytes.org>
References: <20200407183742.4344-1-joro@8bytes.org>
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Joerg Roedel <jroedel@suse.de>

Make use of generic IOMMU infrastructure to gather the same information
carried in dev_data->passthrough and remove the struct member.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 drivers/iommu/amd_iommu.c       | 10 +++++-----
 drivers/iommu/amd_iommu_types.h |  1 -
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/amd_iommu.c b/drivers/iommu/amd_iommu.c
index 3e0d27f7622e..0b4b4faa876d 100644
--- a/drivers/iommu/amd_iommu.c
+++ b/drivers/iommu/amd_iommu.c
@@ -2047,8 +2047,8 @@ static int pdev_iommuv2_enable(struct pci_dev *pdev)
 static int attach_device(struct device *dev,
 			 struct protection_domain *domain)
 {
-	struct pci_dev *pdev;
 	struct iommu_dev_data *dev_data;
+	struct pci_dev *pdev;
 	unsigned long flags;
 	int ret;
 
@@ -2067,8 +2067,10 @@ static int attach_device(struct device *dev,
 
 	pdev = to_pci_dev(dev);
 	if (domain->flags & PD_IOMMUV2_MASK) {
+		struct iommu_domain *def_domain = iommu_get_dma_domain(dev);
+
 		ret = -EINVAL;
-		if (!dev_data->passthrough)
+		if (def_domain->type != IOMMU_DOMAIN_IDENTITY)
 			goto out;
 
 		if (dev_data->iommu_v2) {
@@ -2189,9 +2191,7 @@ static int amd_iommu_add_device(struct device *dev)
 
 	/* Domains are initialized for this device - have a look what we ended up with */
 	domain = iommu_get_domain_for_dev(dev);
-	if (domain->type == IOMMU_DOMAIN_IDENTITY)
-		dev_data->passthrough = true;
-	else if (domain->type == IOMMU_DOMAIN_DMA)
+	if (domain->type == IOMMU_DOMAIN_DMA)
 		iommu_setup_dma_ops(dev, IOVA_START_PFN << PAGE_SHIFT, 0);
 
 out:
diff --git a/drivers/iommu/amd_iommu_types.h b/drivers/iommu/amd_iommu_types.h
index ca8c4522045b..d0d7b6a0c3d8 100644
--- a/drivers/iommu/amd_iommu_types.h
+++ b/drivers/iommu/amd_iommu_types.h
@@ -640,7 +640,6 @@ struct iommu_dev_data {
 	struct pci_dev *pdev;
 	u16 devid;			  /* PCI Device ID */
 	bool iommu_v2;			  /* Device can make use of IOMMUv2 */
-	bool passthrough;		  /* Device is identity mapped */
 	struct {
 		bool enabled;
 		int qdep;
-- 
2.17.1


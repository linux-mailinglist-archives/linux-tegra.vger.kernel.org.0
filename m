Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03A8B1A14A3
	for <lists+linux-tegra@lfdr.de>; Tue,  7 Apr 2020 20:39:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728024AbgDGSjU (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 7 Apr 2020 14:39:20 -0400
Received: from 8bytes.org ([81.169.241.247]:57756 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726899AbgDGSiA (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 7 Apr 2020 14:38:00 -0400
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id CC628491; Tue,  7 Apr 2020 20:37:51 +0200 (CEST)
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
Subject: [RFC PATCH 18/34] iommu/arm-smmu: Convert to probe/release_device() call-backs
Date:   Tue,  7 Apr 2020 20:37:26 +0200
Message-Id: <20200407183742.4344-19-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200407183742.4344-1-joro@8bytes.org>
References: <20200407183742.4344-1-joro@8bytes.org>
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Joerg Roedel <jroedel@suse.de>

Convert the arm-smmu and arm-smmu-v3 drivers to use the probe_device() and
release_device() call-backs of iommu_ops, so that the iommu core code does the
group and sysfs setup.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 drivers/iommu/arm-smmu-v3.c | 42 +++++++++----------------------------
 drivers/iommu/arm-smmu.c    | 30 ++++++++------------------
 2 files changed, 19 insertions(+), 53 deletions(-)

diff --git a/drivers/iommu/arm-smmu-v3.c b/drivers/iommu/arm-smmu-v3.c
index 82508730feb7..7d3c38e088d7 100644
--- a/drivers/iommu/arm-smmu-v3.c
+++ b/drivers/iommu/arm-smmu-v3.c
@@ -2914,27 +2914,26 @@ static bool arm_smmu_sid_in_range(struct arm_smmu_device *smmu, u32 sid)
 
 static struct iommu_ops arm_smmu_ops;
 
-static int arm_smmu_add_device(struct device *dev)
+static struct iommu_device *arm_smmu_probe_device(struct device *dev)
 {
 	int i, ret;
 	struct arm_smmu_device *smmu;
 	struct arm_smmu_master *master;
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
-	struct iommu_group *group;
 
 	if (!fwspec || fwspec->ops != &arm_smmu_ops)
-		return -ENODEV;
+		return ERR_PTR(-ENODEV);
 
 	if (WARN_ON_ONCE(dev_iommu_priv_get(dev)))
-		return -EBUSY;
+		return ERR_PTR(-EBUSY);
 
 	smmu = arm_smmu_get_by_fwnode(fwspec->iommu_fwnode);
 	if (!smmu)
-		return -ENODEV;
+		return ERR_PTR(-ENODEV);
 
 	master = kzalloc(sizeof(*master), GFP_KERNEL);
 	if (!master)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 
 	master->dev = dev;
 	master->smmu = smmu;
@@ -2971,34 +2970,15 @@ static int arm_smmu_add_device(struct device *dev)
 	 */
 	arm_smmu_enable_pasid(master);
 
-	if (!(smmu->features & ARM_SMMU_FEAT_2_LVL_CDTAB))
-		master->ssid_bits = min_t(u8, master->ssid_bits,
-					  CTXDESC_LINEAR_CDMAX);
-
-	ret = iommu_device_link(&smmu->iommu, dev);
-	if (ret)
-		goto err_disable_pasid;
-
-	group = iommu_group_get_for_dev(dev);
-	if (IS_ERR(group)) {
-		ret = PTR_ERR(group);
-		goto err_unlink;
-	}
-
-	iommu_group_put(group);
-	return 0;
+	return &smmu->iommu;
 
-err_unlink:
-	iommu_device_unlink(&smmu->iommu, dev);
-err_disable_pasid:
-	arm_smmu_disable_pasid(master);
 err_free_master:
 	kfree(master);
 	dev_iommu_priv_set(dev, NULL);
-	return ret;
+	return ERR_PTR(ret);
 }
 
-static void arm_smmu_remove_device(struct device *dev)
+static void arm_smmu_release_device(struct device *dev)
 {
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
 	struct arm_smmu_master *master;
@@ -3010,8 +2990,6 @@ static void arm_smmu_remove_device(struct device *dev)
 	master = dev_iommu_priv_get(dev);
 	smmu = master->smmu;
 	arm_smmu_detach_dev(master);
-	iommu_group_remove_device(dev);
-	iommu_device_unlink(&smmu->iommu, dev);
 	arm_smmu_disable_pasid(master);
 	kfree(master);
 	iommu_fwspec_free(dev);
@@ -3138,8 +3116,8 @@ static struct iommu_ops arm_smmu_ops = {
 	.flush_iotlb_all	= arm_smmu_flush_iotlb_all,
 	.iotlb_sync		= arm_smmu_iotlb_sync,
 	.iova_to_phys		= arm_smmu_iova_to_phys,
-	.add_device		= arm_smmu_add_device,
-	.remove_device		= arm_smmu_remove_device,
+	.probe_device		= arm_smmu_probe_device,
+	.release_device		= arm_smmu_release_device,
 	.device_group		= arm_smmu_device_group,
 	.domain_get_attr	= arm_smmu_domain_get_attr,
 	.domain_set_attr	= arm_smmu_domain_set_attr,
diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index 3493501d8b2c..7b13b2371ad2 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -220,7 +220,7 @@ static int arm_smmu_register_legacy_master(struct device *dev,
  * With the legacy DT binding in play, we have no guarantees about
  * probe order, but then we're also not doing default domains, so we can
  * delay setting bus ops until we're sure every possible SMMU is ready,
- * and that way ensure that no add_device() calls get missed.
+ * and that way ensure that no probe_device() calls get missed.
  */
 static int arm_smmu_legacy_bus_init(void)
 {
@@ -1062,7 +1062,6 @@ static int arm_smmu_master_alloc_smes(struct device *dev)
 	struct arm_smmu_master_cfg *cfg = dev_iommu_priv_get(dev);
 	struct arm_smmu_device *smmu = cfg->smmu;
 	struct arm_smmu_smr *smrs = smmu->smrs;
-	struct iommu_group *group;
 	int i, idx, ret;
 
 	mutex_lock(&smmu->stream_map_mutex);
@@ -1090,13 +1089,6 @@ static int arm_smmu_master_alloc_smes(struct device *dev)
 		cfg->smendx[i] = (s16)idx;
 	}
 
-	group = iommu_group_get_for_dev(dev);
-	if (IS_ERR(group)) {
-		ret = PTR_ERR(group);
-		goto out_err;
-	}
-	iommu_group_put(group);
-
 	/* It worked! Now, poke the actual hardware */
 	for_each_cfg_sme(cfg, fwspec, i, idx) {
 		arm_smmu_write_sme(smmu, idx);
@@ -1172,7 +1164,7 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
 
 	/*
 	 * FIXME: The arch/arm DMA API code tries to attach devices to its own
-	 * domains between of_xlate() and add_device() - we have no way to cope
+	 * domains between of_xlate() and probe_device() - we have no way to cope
 	 * with that, so until ARM gets converted to rely on groups and default
 	 * domains, just say no (but more politely than by dereferencing NULL).
 	 * This should be at least a WARN_ON once that's sorted.
@@ -1382,7 +1374,7 @@ struct arm_smmu_device *arm_smmu_get_by_fwnode(struct fwnode_handle *fwnode)
 	return dev ? dev_get_drvdata(dev) : NULL;
 }
 
-static int arm_smmu_add_device(struct device *dev)
+static struct iommu_device *arm_smmu_probe_device(struct device *dev)
 {
 	struct arm_smmu_device *smmu = NULL;
 	struct arm_smmu_master_cfg *cfg;
@@ -1403,7 +1395,7 @@ static int arm_smmu_add_device(struct device *dev)
 	} else if (fwspec && fwspec->ops == &arm_smmu_ops) {
 		smmu = arm_smmu_get_by_fwnode(fwspec->iommu_fwnode);
 	} else {
-		return -ENODEV;
+		return ERR_PTR(-ENODEV);
 	}
 
 	ret = -EINVAL;
@@ -1444,21 +1436,19 @@ static int arm_smmu_add_device(struct device *dev)
 	if (ret)
 		goto out_cfg_free;
 
-	iommu_device_link(&smmu->iommu, dev);
-
 	device_link_add(dev, smmu->dev,
 			DL_FLAG_PM_RUNTIME | DL_FLAG_AUTOREMOVE_SUPPLIER);
 
-	return 0;
+	return &smmu->iommu;
 
 out_cfg_free:
 	kfree(cfg);
 out_free:
 	iommu_fwspec_free(dev);
-	return ret;
+	return ERR_PTR(ret);
 }
 
-static void arm_smmu_remove_device(struct device *dev)
+static void arm_smmu_release_device(struct device *dev)
 {
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
 	struct arm_smmu_master_cfg *cfg;
@@ -1475,13 +1465,11 @@ static void arm_smmu_remove_device(struct device *dev)
 	if (ret < 0)
 		return;
 
-	iommu_device_unlink(&smmu->iommu, dev);
 	arm_smmu_master_free_smes(cfg, fwspec);
 
 	arm_smmu_rpm_put(smmu);
 
 	dev_iommu_priv_set(dev, NULL);
-	iommu_group_remove_device(dev);
 	kfree(cfg);
 	iommu_fwspec_free(dev);
 }
@@ -1632,8 +1620,8 @@ static struct iommu_ops arm_smmu_ops = {
 	.flush_iotlb_all	= arm_smmu_flush_iotlb_all,
 	.iotlb_sync		= arm_smmu_iotlb_sync,
 	.iova_to_phys		= arm_smmu_iova_to_phys,
-	.add_device		= arm_smmu_add_device,
-	.remove_device		= arm_smmu_remove_device,
+	.probe_device		= arm_smmu_probe_device,
+	.release_device		= arm_smmu_release_device,
 	.device_group		= arm_smmu_device_group,
 	.domain_get_attr	= arm_smmu_domain_get_attr,
 	.domain_set_attr	= arm_smmu_domain_set_attr,
-- 
2.17.1


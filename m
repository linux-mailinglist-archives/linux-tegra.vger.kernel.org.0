Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53E32702D12
	for <lists+linux-tegra@lfdr.de>; Mon, 15 May 2023 14:49:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241920AbjEOMty (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 15 May 2023 08:49:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241439AbjEOMtm (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 15 May 2023 08:49:42 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1141E1728
        for <linux-tegra@vger.kernel.org>; Mon, 15 May 2023 05:49:39 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6A92A4B3;
        Mon, 15 May 2023 05:50:23 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.40])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B78C33F67D;
        Mon, 15 May 2023 05:49:37 -0700 (PDT)
From:   Robin Murphy <robin.murphy@arm.com>
To:     joro@8bytes.org
Cc:     iommu@lists.linux.dev, will@kernel.org, jgg@nvidia.com,
        digetx@gmail.com, thierry.reding@gmail.com,
        linux-tegra@vger.kernel.org
Subject: [PATCH 1/4] iommu/tegra-gart: Add default identity domain support
Date:   Mon, 15 May 2023 13:49:29 +0100
Message-Id: <3a243e6e796cea4566e28297da8270482457637c.1684154219.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
In-Reply-To: <cover.1684154219.git.robin.murphy@arm.com>
References: <cover.1684154219.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The nature of a GART means that supporting identity domains is as easy
as doing nothing, so bring the Tegra driver into the modern world of
default domains with a trivial implementation. Identity domains are
allowed to exist alongside any explicit domain for the translation
aperture, since they both simply represent regions of the physical
address space with no isolation from each other. As such we'll continue
to do the "wrong" thing with groups to allow that to work, since the
notion of isolation that groups represent is counterproductive to the
GART's established usage model.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/tegra-gart.c | 39 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 20 deletions(-)

diff --git a/drivers/iommu/tegra-gart.c b/drivers/iommu/tegra-gart.c
index a482ff838b53..deedb9f0f380 100644
--- a/drivers/iommu/tegra-gart.c
+++ b/drivers/iommu/tegra-gart.c
@@ -111,7 +111,13 @@ static int gart_iommu_attach_dev(struct iommu_domain *domain,
 
 	spin_lock(&gart->dom_lock);
 
-	if (gart->active_domain && gart->active_domain != domain) {
+	if (domain->type == IOMMU_DOMAIN_IDENTITY) {
+		if (dev_iommu_priv_get(dev)) {
+			dev_iommu_priv_set(dev, NULL);
+			if (--gart->active_devices == 0)
+				gart->active_domain = NULL;
+		}
+	} else if (gart->active_domain && gart->active_domain != domain) {
 		ret = -EINVAL;
 	} else if (dev_iommu_priv_get(dev) != domain) {
 		dev_iommu_priv_set(dev, domain);
@@ -124,27 +130,14 @@ static int gart_iommu_attach_dev(struct iommu_domain *domain,
 	return ret;
 }
 
-static void gart_iommu_set_platform_dma(struct device *dev)
-{
-	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
-	struct gart_device *gart = gart_handle;
-
-	spin_lock(&gart->dom_lock);
-
-	if (dev_iommu_priv_get(dev) == domain) {
-		dev_iommu_priv_set(dev, NULL);
-
-		if (--gart->active_devices == 0)
-			gart->active_domain = NULL;
-	}
-
-	spin_unlock(&gart->dom_lock);
-}
-
 static struct iommu_domain *gart_iommu_domain_alloc(unsigned type)
 {
+	static struct iommu_domain identity;
 	struct iommu_domain *domain;
 
+	if (type == IOMMU_DOMAIN_IDENTITY)
+		return &identity;
+
 	if (type != IOMMU_DOMAIN_UNMANAGED)
 		return NULL;
 
@@ -161,7 +154,8 @@ static struct iommu_domain *gart_iommu_domain_alloc(unsigned type)
 static void gart_iommu_domain_free(struct iommu_domain *domain)
 {
 	WARN_ON(gart_handle->active_domain == domain);
-	kfree(domain);
+	if (domain->type != IOMMU_DOMAIN_IDENTITY)
+		kfree(domain);
 }
 
 static inline int __gart_iommu_map(struct gart_device *gart, unsigned long iova,
@@ -246,6 +240,11 @@ static struct iommu_device *gart_iommu_probe_device(struct device *dev)
 	return &gart_handle->iommu;
 }
 
+static int gart_iommu_def_domain_type(struct device *dev)
+{
+	return IOMMU_DOMAIN_IDENTITY;
+}
+
 static int gart_iommu_of_xlate(struct device *dev,
 			       struct of_phandle_args *args)
 {
@@ -270,9 +269,9 @@ static const struct iommu_ops gart_iommu_ops = {
 	.domain_alloc	= gart_iommu_domain_alloc,
 	.probe_device	= gart_iommu_probe_device,
 	.device_group	= generic_device_group,
-	.set_platform_dma_ops = gart_iommu_set_platform_dma,
 	.pgsize_bitmap	= GART_IOMMU_PGSIZES,
 	.of_xlate	= gart_iommu_of_xlate,
+	.def_domain_type = gart_iommu_def_domain_type,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
 		.attach_dev	= gart_iommu_attach_dev,
 		.map		= gart_iommu_map,
-- 
2.39.2.101.g768bb238c484.dirty


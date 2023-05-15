Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F626702D14
	for <lists+linux-tegra@lfdr.de>; Mon, 15 May 2023 14:49:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241613AbjEOMtz (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 15 May 2023 08:49:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241978AbjEOMto (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 15 May 2023 08:49:44 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5DB1BD2
        for <linux-tegra@vger.kernel.org>; Mon, 15 May 2023 05:49:41 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D1B991063;
        Mon, 15 May 2023 05:50:25 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.40])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2A89A3F67D;
        Mon, 15 May 2023 05:49:40 -0700 (PDT)
From:   Robin Murphy <robin.murphy@arm.com>
To:     joro@8bytes.org
Cc:     iommu@lists.linux.dev, will@kernel.org, jgg@nvidia.com,
        digetx@gmail.com, thierry.reding@gmail.com,
        linux-tegra@vger.kernel.org
Subject: [PATCH 3/4] iommu/tegra-gart: Generalise domain support
Date:   Mon, 15 May 2023 13:49:31 +0100
Message-Id: <38e4c004c6b3d0120c5dc6739301bb97bb28fcf6.1684154219.git.robin.murphy@arm.com>
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

Now that we have a clear notion of mappings being owned by a domain,
rather than the GART instance, it's easy enough to support operating on
them independently of whether the domain is currently active. This also
makes the PTE checks for debugging as cheap as testing the gart_debug
option itself, so we may as well just remove the option.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/tegra-gart.c | 46 ++++++++++++++------------------------
 1 file changed, 17 insertions(+), 29 deletions(-)

diff --git a/drivers/iommu/tegra-gart.c b/drivers/iommu/tegra-gart.c
index a74648655dac..0a121cbc17b8 100644
--- a/drivers/iommu/tegra-gart.c
+++ b/drivers/iommu/tegra-gart.c
@@ -52,8 +52,6 @@ struct gart_device {
 
 static struct gart_device *gart_handle; /* unique for a system */
 
-static bool gart_debug;
-
 /*
  * Any interaction between any block on PPSB and a block on APB or AHB
  * must have these read-back to ensure the APB/AHB bus transaction is
@@ -83,17 +81,6 @@ static inline void gart_set_pte(struct gart_device *gart,
 	writel_relaxed(pte, gart->regs + GART_ENTRY_DATA);
 }
 
-static inline unsigned long gart_read_pte(struct gart_device *gart,
-					  unsigned long iova)
-{
-	unsigned long pte;
-
-	writel_relaxed(iova, gart->regs + GART_ENTRY_ADDR);
-	pte = readl_relaxed(gart->regs + GART_ENTRY_DATA);
-
-	return pte;
-}
-
 static void do_gart_setup(struct gart_device *gart)
 {
 	unsigned long iova;
@@ -113,9 +100,9 @@ static inline bool gart_iova_range_invalid(struct gart_device *gart,
 			iova + bytes > gart->iovmm_end);
 }
 
-static inline bool gart_pte_valid(struct gart_device *gart, unsigned long iova)
+static inline bool gart_pte_valid(u32 pte)
 {
-	return !!(gart_read_pte(gart, iova) & GART_ENTRY_PHYS_ADDR_VALID);
+	return pte & GART_ENTRY_PHYS_ADDR_VALID;
 }
 
 static int gart_iommu_attach_dev(struct iommu_domain *domain,
@@ -192,18 +179,19 @@ static void gart_iommu_domain_free(struct iommu_domain *domain)
 }
 
 static inline int __gart_iommu_map(struct gart_device *gart, unsigned long iova,
-				   unsigned long pa)
+				   unsigned long pa, struct gart_domain *domain)
 {
 	int idx = gart_pte_index(gart, iova);
 	u32 pte = GART_ENTRY_PHYS_ADDR_VALID | pa;
 
-	if (unlikely(gart_debug && gart_pte_valid(gart, iova))) {
+	if (unlikely(gart_pte_valid(domain->savedata[idx]))) {
 		dev_err(gart->dev, "Page entry is in-use\n");
 		return -EINVAL;
 	}
 
-	gart->active_domain->savedata[idx] = pte;
-	gart_set_pte(gart, iova, pte);
+	domain->savedata[idx] = pte;
+	if (domain == gart->active_domain)
+		gart_set_pte(gart, iova, pte);
 
 	return 0;
 }
@@ -218,24 +206,26 @@ static int gart_iommu_map(struct iommu_domain *domain, unsigned long iova,
 		return -EINVAL;
 
 	spin_lock(&gart->pte_lock);
-	ret = __gart_iommu_map(gart, iova, (unsigned long)pa);
+	ret = __gart_iommu_map(gart, iova, (unsigned long)pa, to_gart_domain(domain));
 	spin_unlock(&gart->pte_lock);
 
 	return ret;
 }
 
 static inline int __gart_iommu_unmap(struct gart_device *gart,
-				     unsigned long iova)
+				     unsigned long iova,
+				     struct gart_domain *domain)
 {
 	int idx = gart_pte_index(gart, iova);
 
-	if (unlikely(gart_debug && !gart_pte_valid(gart, iova))) {
+	if (unlikely(!gart_pte_valid(domain->savedata[idx]))) {
 		dev_err(gart->dev, "Page entry is invalid\n");
 		return -EINVAL;
 	}
 
-	gart->active_domain->savedata[idx] = 0;
-	gart_set_pte(gart, iova, 0);
+	domain->savedata[idx] = 0;
+	if (domain == gart->active_domain)
+		gart_set_pte(gart, iova, 0);
 
 	return 0;
 }
@@ -250,7 +240,7 @@ static size_t gart_iommu_unmap(struct iommu_domain *domain, unsigned long iova,
 		return 0;
 
 	spin_lock(&gart->pte_lock);
-	err = __gart_iommu_unmap(gart, iova);
+	err = __gart_iommu_unmap(gart, iova, to_gart_domain(domain));
 	spin_unlock(&gart->pte_lock);
 
 	return err ? 0 : bytes;
@@ -261,12 +251,13 @@ static phys_addr_t gart_iommu_iova_to_phys(struct iommu_domain *domain,
 {
 	struct gart_device *gart = gart_handle;
 	unsigned long pte;
+	int idx = gart_pte_index(gart, iova);
 
 	if (gart_iova_range_invalid(gart, iova, GART_PAGE_SIZE))
 		return -EINVAL;
 
 	spin_lock(&gart->pte_lock);
-	pte = gart_read_pte(gart, iova);
+	pte = to_gart_domain(domain)->savedata[idx];
 	spin_unlock(&gart->pte_lock);
 
 	return pte & GART_PAGE_MASK;
@@ -390,6 +381,3 @@ struct gart_device *tegra_gart_probe(struct device *dev, struct tegra_mc *mc)
 
 	return ERR_PTR(err);
 }
-
-module_param(gart_debug, bool, 0644);
-MODULE_PARM_DESC(gart_debug, "Enable GART debugging");
-- 
2.39.2.101.g768bb238c484.dirty


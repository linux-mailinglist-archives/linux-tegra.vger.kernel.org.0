Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87DD4D8FF4
	for <lists+linux-tegra@lfdr.de>; Wed, 16 Oct 2019 13:50:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390897AbfJPLuf (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 16 Oct 2019 07:50:35 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:32972 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388404AbfJPLuf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 16 Oct 2019 07:50:35 -0400
Received: by mail-wr1-f66.google.com with SMTP id b9so27721512wrs.0
        for <linux-tegra@vger.kernel.org>; Wed, 16 Oct 2019 04:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Xfs3L/lYc6zDzxN7DSH41Pri4/NZ12+1KernicuYiqA=;
        b=Lmwm5xOgxzDvX0xUkGR+74pw7AOCWlzpfe1LzjT90UwFalzx2CiPCP2mNWVnAM6LF/
         8nWb1/E/TBHPIno81umCXr6TEZf46Kz2CrV61hVl99ULvxMkIbSVRkPk3poAKlJHTS4J
         cPRwvVEZmyPPj+W9bNn3OQS4flwTToroFhzySmtVFLy9Y25NbXJdRjBRVQZ+nmbFf2Xz
         WNsrke281EH1p8hX+iiOAY27Ma2P0IKRi+r17jkPfjpESZwRjNWBjyd+t2RBaEbU6M/e
         a4YCQWDzWlTkzPwdUP2oWH5CcAhbHRfycgT+CB1a12B5XDSGv8UzHkoVBxTkjizSq2vt
         Omew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Xfs3L/lYc6zDzxN7DSH41Pri4/NZ12+1KernicuYiqA=;
        b=qdfCRsqybLHBt7vIlOAD9W4cc7OPwpmze8rMM2IGRup/0QWlvLxHG9BkU8l9I4A9Rz
         pU80t9hQ33M0Ma7+PFC7MnM4PYfJD3HuuGooTjDAWRzShELwe8ffMV+WwuhW/oL1FIra
         ZbweR1CajMtPefQpsq/+eVoP14OuC81oPYX3XAjl1UyVWfahQ/Fqi3v59aIZLmxgdj+m
         kLYMML0yHepSaMqmYv0IAg0QYKa7gmwWZ9MNYQ//hhX/KzPQUwxFvZ24YZFeeBMfBkUn
         ZUjGQSTotVExvXHPlSmK66AU6ilckjoq6L9vF06N6tBPdsXyZUE/oMoZLLjfG1Lgx1rA
         lUSw==
X-Gm-Message-State: APjAAAXqAPYhFDN6xyTQzlfAx44T0ditrtrYmxf1TkddvxUf17wIhdIK
        ZUiQUxrbJL+UGoAo1lXNi/4=
X-Google-Smtp-Source: APXvYqzvIfFURxdXKSuhHE5QkOrdTS1xLwMDfrdilHnRBTrz6C24IgnISPG71UwFbpL1nbMOkFtuGg==
X-Received: by 2002:a5d:4f8f:: with SMTP id d15mr2463922wru.126.1571226633196;
        Wed, 16 Oct 2019 04:50:33 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id l6sm2573001wmg.2.2019.10.16.04.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2019 04:50:32 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Joerg Roedel <joro@8bytes.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org
Subject: [PATCH 3/3] iommu/tegra-smmu: Fix page tables in > 4 GiB memory
Date:   Wed, 16 Oct 2019 13:50:26 +0200
Message-Id: <20191016115026.1768745-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191016115026.1768745-1-thierry.reding@gmail.com>
References: <20191016115026.1768745-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Page tables that reside in physical memory beyond the 4 GiB boundary are
currently not working properly. The reason is that when the physical
address for page directory entries is read, it gets truncated at 32 bits
and can cause crashes when passing that address to the DMA API.

Fix this by first casting the PDE value to a dma_addr_t and then using
the page frame number mask for the SMMU instance to mask out the invalid
bits, which are typically used for mapping attributes, etc.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/iommu/tegra-smmu.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 9425d01a95ac..63a147b623e6 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -159,9 +159,9 @@ static bool smmu_dma_addr_valid(struct tegra_smmu *smmu, dma_addr_t addr)
 	return (addr & smmu->pfn_mask) == addr;
 }
 
-static dma_addr_t smmu_pde_to_dma(u32 pde)
+static dma_addr_t smmu_pde_to_dma(struct tegra_smmu *smmu, u32 pde)
 {
-	return pde << 12;
+	return (dma_addr_t)(pde & smmu->pfn_mask) << 12;
 }
 
 static void smmu_flush_ptc_all(struct tegra_smmu *smmu)
@@ -554,6 +554,7 @@ static u32 *tegra_smmu_pte_lookup(struct tegra_smmu_as *as, unsigned long iova,
 				  dma_addr_t *dmap)
 {
 	unsigned int pd_index = iova_pd_index(iova);
+	struct tegra_smmu *smmu = as->smmu;
 	struct page *pt_page;
 	u32 *pd;
 
@@ -562,7 +563,7 @@ static u32 *tegra_smmu_pte_lookup(struct tegra_smmu_as *as, unsigned long iova,
 		return NULL;
 
 	pd = page_address(as->pd);
-	*dmap = smmu_pde_to_dma(pd[pd_index]);
+	*dmap = smmu_pde_to_dma(smmu, pd[pd_index]);
 
 	return tegra_smmu_pte_offset(pt_page, iova);
 }
@@ -604,7 +605,7 @@ static u32 *as_get_pte(struct tegra_smmu_as *as, dma_addr_t iova,
 	} else {
 		u32 *pd = page_address(as->pd);
 
-		*dmap = smmu_pde_to_dma(pd[pde]);
+		*dmap = smmu_pde_to_dma(smmu, pd[pde]);
 	}
 
 	return tegra_smmu_pte_offset(as->pts[pde], iova);
@@ -629,7 +630,7 @@ static void tegra_smmu_pte_put_use(struct tegra_smmu_as *as, unsigned long iova)
 	if (--as->count[pde] == 0) {
 		struct tegra_smmu *smmu = as->smmu;
 		u32 *pd = page_address(as->pd);
-		dma_addr_t pte_dma = smmu_pde_to_dma(pd[pde]);
+		dma_addr_t pte_dma = smmu_pde_to_dma(smmu, pd[pde]);
 
 		tegra_smmu_set_pde(as, iova, 0);
 
-- 
2.23.0


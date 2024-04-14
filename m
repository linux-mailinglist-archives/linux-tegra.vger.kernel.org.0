Return-Path: <linux-tegra+bounces-1599-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9798A3947
	for <lists+linux-tegra@lfdr.de>; Sat, 13 Apr 2024 02:27:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A02BE1F20FC5
	for <lists+linux-tegra@lfdr.de>; Sat, 13 Apr 2024 00:27:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CE7E1CFA0;
	Sat, 13 Apr 2024 00:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="nWMLvU7n"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB7A18EB1
	for <linux-tegra@vger.kernel.org>; Sat, 13 Apr 2024 00:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712967940; cv=none; b=fGl7/xjy+DVGClhgqygE7lx5HwAtsbi4JM9N/bnuTiEwTHX8ze8B69MCnfIjuG0Sgnjl5mAHsDiBDfKqwCAzrVPCu+gE85+5WvLvmjJ0/5tFMKGlBKpcuBQ3Zq51ejoKZTWP1RnLTBwkx2uJ3mSlAnhnNZUgHuBaCM1yzFCFJyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712967940; c=relaxed/simple;
	bh=dBUhehkqWlwtuk2YExCoaUwsamRcicuKsCtw8n2OMRA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P5eUvqOxFbTLlmCwIchF63Ih5KVRq80LCXBx+GIHAO3tfxEngcdkwfrtKBr028ANIPf9FEwHJiNCYrDWHY3V9KhpGqHSifSyNmu15/Frl9SB8JAKSmjBx82TyocSJqIj1DO97+dc0Rtd8hiW5S0RrlbZHQdILof9K6XvItXDp/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=nWMLvU7n; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-78ebc7e1586so247573085a.1
        for <linux-tegra@vger.kernel.org>; Fri, 12 Apr 2024 17:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1712967934; x=1713572734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Msq3s0T9jYWGepWyMOjVGhKtsGemyt6YXf5qXgBQII=;
        b=nWMLvU7nhW6UlrenbIjiTlYFze+9c9pcfQ5bVMD3iGqMcV8TVJsFp32/ShfPbtfEk/
         KZZIaRM6hJbYOZzjeTi67Xbvr5d6F6MGLg+aXyZx8PDm6/hCOfMzvtK5aSI/shOegSgi
         ekx31utaCRcJWulpLFRyBspn16n3/26DtKJXpNVA00yyj63Qv3HHUqSJDOmC317e1ymh
         SMTzTznSoVjFPkxAx+u4MCY169N+/NS+PGmfrMWDMN/4QqcvxU2tNqyO7g2jtgEyii5K
         9L+0oABtrBIq6+pZe0rd2UqQvf9jXUVIfSOJXNZD7N+MF1vN3P24IHMx3Kg6zki9ec8P
         Nnqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712967934; x=1713572734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Msq3s0T9jYWGepWyMOjVGhKtsGemyt6YXf5qXgBQII=;
        b=YVGo5bEKJPfKxnLeWm4m4bYsnZzMKcfZp+aDIiUlZXP2v2/ira10GOyWDgJzS9tTtn
         ZweUoJQhJnnZfSv+gCLwzkcOeHjSSMWRhb7ZOL0qT3vkpfGVwxv2VSHyJt6aSfG7HHa1
         P7/8p0ljKQrBElzPhOQVUKy3E/1pApFEXWb5NQ3gC5Ne2idH/zjg+VJ67NY0UZnYoU9O
         DG5wfqv1Td71dD0kg6PoC2JBhWRMTNrdvnUfow0txigUOmR6MbAJ/laOSGP82oogdOyQ
         X47IWZgD8gQzqmvaZ6ZCe5UPkDcKfBOCQXaoxvGY+JlDUQbtUzsv1INewjZMZ5Ts03Se
         KjMA==
X-Forwarded-Encrypted: i=1; AJvYcCXOwSVfyt6khEj6nlREbXweQsmHNplEWA4Kc78BBa6H/wqO9fwxfhi3rNJQQG1GLuFWmcingcyppFMa9fPYHxxKwm+9pk0nxwrxMOo=
X-Gm-Message-State: AOJu0YyMIiv15R6rj5NE2oL/3FKoc35rTKrF6iRamEmLqGUXzEnuQnHZ
	WChEs73mt724OMj7raLFHP+AcyjLgpHHUNXi60JxRdFjUD71Ms7dVDZGhL3VpI8=
X-Google-Smtp-Source: AGHT+IFLWyccRHbQF5BJmQAmIq2yaafFcDxYEvTdEMzon+yR8BjvOaupqITKjDvsX+13T7c1AAimFg==
X-Received: by 2002:a05:620a:4606:b0:78d:77f1:6043 with SMTP id br6-20020a05620a460600b0078d77f16043mr8190515qkb.6.1712967934070;
        Fri, 12 Apr 2024 17:25:34 -0700 (PDT)
Received: from soleen.c.googlers.com.com (128.174.85.34.bc.googleusercontent.com. [34.85.174.128])
        by smtp.gmail.com with ESMTPSA id wl25-20020a05620a57d900b0078d5fece9a6sm3053490qkn.101.2024.04.12.17.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 17:25:33 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: akpm@linux-foundation.org,
	alim.akhtar@samsung.com,
	alyssa@rosenzweig.io,
	asahi@lists.linux.dev,
	baolu.lu@linux.intel.com,
	bhelgaas@google.com,
	cgroups@vger.kernel.org,
	corbet@lwn.net,
	david@redhat.com,
	dwmw2@infradead.org,
	hannes@cmpxchg.org,
	heiko@sntech.de,
	iommu@lists.linux.dev,
	jernej.skrabec@gmail.com,
	jonathanh@nvidia.com,
	joro@8bytes.org,
	krzysztof.kozlowski@linaro.org,
	linux-doc@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	lizefan.x@bytedance.com,
	marcan@marcan.st,
	mhiramat@kernel.org,
	m.szyprowski@samsung.com,
	pasha.tatashin@soleen.com,
	paulmck@kernel.org,
	rdunlap@infradead.org,
	robin.murphy@arm.com,
	samuel@sholland.org,
	suravee.suthikulpanit@amd.com,
	sven@svenpeter.dev,
	thierry.reding@gmail.com,
	tj@kernel.org,
	tomas.mudrunka@gmail.com,
	vdumpa@nvidia.com,
	wens@csie.org,
	will@kernel.org,
	yu-cheng.yu@intel.com,
	rientjes@google.com,
	bagasdotme@gmail.com,
	mkoutny@suse.com
Subject: [PATCH v6 09/11] iommu/tegra-smmu: use page allocation function provided by iommu-pages.h
Date: Sat, 13 Apr 2024 00:25:20 +0000
Message-ID: <20240413002522.1101315-10-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.44.0.683.g7961c838ac-goog
In-Reply-To: <20240413002522.1101315-1-pasha.tatashin@soleen.com>
References: <20240413002522.1101315-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert iommu/tegra-smmu.c to use the new page allocation functions
provided in iommu-pages.h.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Acked-by: David Rientjes <rientjes@google.com>
Acked-by: Thierry Reding <treding@nvidia.com>
Tested-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 drivers/iommu/tegra-smmu.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 14e525bd0d9b..f86c7ae91814 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -19,6 +19,8 @@
 #include <soc/tegra/ahb.h>
 #include <soc/tegra/mc.h>
 
+#include "iommu-pages.h"
+
 struct tegra_smmu_group {
 	struct list_head list;
 	struct tegra_smmu *smmu;
@@ -282,7 +284,7 @@ static struct iommu_domain *tegra_smmu_domain_alloc_paging(struct device *dev)
 
 	as->attr = SMMU_PD_READABLE | SMMU_PD_WRITABLE | SMMU_PD_NONSECURE;
 
-	as->pd = alloc_page(GFP_KERNEL | __GFP_DMA | __GFP_ZERO);
+	as->pd = __iommu_alloc_pages(GFP_KERNEL | __GFP_DMA, 0);
 	if (!as->pd) {
 		kfree(as);
 		return NULL;
@@ -290,7 +292,7 @@ static struct iommu_domain *tegra_smmu_domain_alloc_paging(struct device *dev)
 
 	as->count = kcalloc(SMMU_NUM_PDE, sizeof(u32), GFP_KERNEL);
 	if (!as->count) {
-		__free_page(as->pd);
+		__iommu_free_pages(as->pd, 0);
 		kfree(as);
 		return NULL;
 	}
@@ -298,7 +300,7 @@ static struct iommu_domain *tegra_smmu_domain_alloc_paging(struct device *dev)
 	as->pts = kcalloc(SMMU_NUM_PDE, sizeof(*as->pts), GFP_KERNEL);
 	if (!as->pts) {
 		kfree(as->count);
-		__free_page(as->pd);
+		__iommu_free_pages(as->pd, 0);
 		kfree(as);
 		return NULL;
 	}
@@ -599,14 +601,14 @@ static u32 *as_get_pte(struct tegra_smmu_as *as, dma_addr_t iova,
 		dma = dma_map_page(smmu->dev, page, 0, SMMU_SIZE_PT,
 				   DMA_TO_DEVICE);
 		if (dma_mapping_error(smmu->dev, dma)) {
-			__free_page(page);
+			__iommu_free_pages(page, 0);
 			return NULL;
 		}
 
 		if (!smmu_dma_addr_valid(smmu, dma)) {
 			dma_unmap_page(smmu->dev, dma, SMMU_SIZE_PT,
 				       DMA_TO_DEVICE);
-			__free_page(page);
+			__iommu_free_pages(page, 0);
 			return NULL;
 		}
 
@@ -649,7 +651,7 @@ static void tegra_smmu_pte_put_use(struct tegra_smmu_as *as, unsigned long iova)
 		tegra_smmu_set_pde(as, iova, 0);
 
 		dma_unmap_page(smmu->dev, pte_dma, SMMU_SIZE_PT, DMA_TO_DEVICE);
-		__free_page(page);
+		__iommu_free_pages(page, 0);
 		as->pts[pde] = NULL;
 	}
 }
@@ -688,7 +690,7 @@ static struct page *as_get_pde_page(struct tegra_smmu_as *as,
 	if (gfpflags_allow_blocking(gfp))
 		spin_unlock_irqrestore(&as->lock, *flags);
 
-	page = alloc_page(gfp | __GFP_DMA | __GFP_ZERO);
+	page = __iommu_alloc_pages(gfp | __GFP_DMA, 0);
 
 	if (gfpflags_allow_blocking(gfp))
 		spin_lock_irqsave(&as->lock, *flags);
@@ -700,7 +702,7 @@ static struct page *as_get_pde_page(struct tegra_smmu_as *as,
 	 */
 	if (as->pts[pde]) {
 		if (page)
-			__free_page(page);
+			__iommu_free_pages(page, 0);
 
 		page = as->pts[pde];
 	}
-- 
2.44.0.683.g7961c838ac-goog



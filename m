Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90CF444F4B
	for <lists+linux-tegra@lfdr.de>; Fri, 14 Jun 2019 00:39:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727301AbfFMWjk (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 13 Jun 2019 18:39:40 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:44659 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727244AbfFMWjj (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 13 Jun 2019 18:39:39 -0400
Received: by mail-ed1-f66.google.com with SMTP id k8so462299edr.11
        for <linux-tegra@vger.kernel.org>; Thu, 13 Jun 2019 15:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tcd-ie.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EJ0KbItdu2TxPOp6NmcZ85nVQ2e5NOhr/kYDGDu9/qE=;
        b=zeOE/zvh1TwDJgGnFD06YP/Cpej9V018Ne4naI7KcEHh0yS7cV5SkBhhiRimOFJed9
         CIVbHgAGkVuXPgPLOfb6gwAD+YbCgwAkfIEHSsQJIerHVPctg8GdW4rUuc66fIvyLXQc
         hKvR/5Hm+vo+vhl8Pwk60SN0iYyTrhzrChpV9xYcaMnUUwDpQTN98YCIy3dY/xF8bsik
         ehA0vcSZDfYqkT23eQLQ0io5L+IvUuMxuREvkRBLXsfXM+IKHUEavzf30UjqPvgz/NoB
         7cY4bUUy/3lGoZ6nsQzt1Pi0Z2M9VRpqxVv70+Ha5JbxYPs9Gi0xIP6FU1JOAMdl2dbS
         K4tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EJ0KbItdu2TxPOp6NmcZ85nVQ2e5NOhr/kYDGDu9/qE=;
        b=udbNxJ7oz0It4ddU5TsB9Ko/Q/AE3Cys4PJW8zyHHEVne3nfanUi0jwxZa2vhqXG1r
         Oj6flv4cO1zYDDfu3Y8TCODMxB7rqvVHUAmX2/cQbytk4erK6U3cTl1cpMYFH3p6mGFT
         ihi5KqKLLfeK1NIZuaseTCUikcpT2Dv/BDfd9cQrXFkgON6y56WJ6s7rtMk4MQIvgCuC
         PgcCTVlAMYYZWhJztUz6aW0s4p9r2gVxFsFwqRu7TumdCDqLmMjEZL6wOD2LOPjSVbDz
         t9iDFeXzc787HA44FMQvuRzATPUBl1Brpc7YiboEprn/Z7AzJRtOl/jyB+PApki9FyFM
         ZMmw==
X-Gm-Message-State: APjAAAVRy8UE47Rv8ozaLjaDFkb0Vo/DDCHPSquzzJfLmBkfBr3MrciC
        Ui/ps/HWYrSQZT0GiRdhc/QMJ9N9rsGyTQ==
X-Google-Smtp-Source: APXvYqx/uHASwls8eMlS/EUABG1iNxk9FfSuMbCAMjshsIltMQDse6oJS07oPnN6ZE7iiU0u7+JAvg==
X-Received: by 2002:a05:6402:8d7:: with SMTP id d23mr55678205edz.17.1560465577935;
        Thu, 13 Jun 2019 15:39:37 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8084:a0:bc00:8042:d435:a754:1f22])
        by smtp.googlemail.com with ESMTPSA id s16sm216522eji.27.2019.06.13.15.39.36
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 13 Jun 2019 15:39:37 -0700 (PDT)
From:   Tom Murphy <murphyt7@tcd.ie>
To:     iommu@lists.linux-foundation.org
Cc:     Tom Murphy <murphyt7@tcd.ie>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will.deacon@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        David Woodhouse <dwmw2@infradead.org>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-tegra@vger.kernel.org,
        virtualization@lists.linux-foundation.org
Subject: [PATCH v4 4/5] iommu/dma-iommu: Use the dev->coherent_dma_mask
Date:   Thu, 13 Jun 2019 23:38:59 +0100
Message-Id: <20190613223901.9523-5-murphyt7@tcd.ie>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190613223901.9523-1-murphyt7@tcd.ie>
References: <20190613223901.9523-1-murphyt7@tcd.ie>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Use the dev->coherent_dma_mask when allocating in the dma-iommu ops api.

Signed-off-by: Tom Murphy <murphyt7@tcd.ie>
---
 drivers/iommu/dma-iommu.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index f303bbe20e51..082fb789e3cf 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -471,7 +471,7 @@ static void __iommu_dma_unmap(struct device *dev, dma_addr_t dma_addr,
 }
 
 static dma_addr_t __iommu_dma_map(struct device *dev, phys_addr_t phys,
-		size_t size, int prot)
+		size_t size, int prot, dma_addr_t dma_mask)
 {
 	struct iommu_domain *domain = iommu_get_dma_domain(dev);
 	struct iommu_dma_cookie *cookie = domain->iova_cookie;
@@ -486,7 +486,7 @@ static dma_addr_t __iommu_dma_map(struct device *dev, phys_addr_t phys,
 		size = iova_align(&cookie->iovad, size + iova_off);
 	}
 
-	iova = iommu_dma_alloc_iova(domain, size, dma_get_mask(dev), dev);
+	iova = iommu_dma_alloc_iova(domain, size, dma_mask, dev);
 	if (!iova)
 		return DMA_MAPPING_ERROR;
 
@@ -737,7 +737,7 @@ static dma_addr_t iommu_dma_map_page(struct device *dev, struct page *page,
 	int prot = dma_info_to_prot(dir, coherent, attrs);
 	dma_addr_t dma_handle;
 
-	dma_handle = __iommu_dma_map(dev, phys, size, prot);
+	dma_handle = __iommu_dma_map(dev, phys, size, prot, dma_get_mask(dev));
 	if (!coherent && !(attrs & DMA_ATTR_SKIP_CPU_SYNC) &&
 	    dma_handle != DMA_MAPPING_ERROR)
 		arch_sync_dma_for_device(dev, phys, size, dir);
@@ -940,7 +940,8 @@ static dma_addr_t iommu_dma_map_resource(struct device *dev, phys_addr_t phys,
 		size_t size, enum dma_data_direction dir, unsigned long attrs)
 {
 	return __iommu_dma_map(dev, phys, size,
-			dma_info_to_prot(dir, false, attrs) | IOMMU_MMIO);
+			dma_info_to_prot(dir, false, attrs) | IOMMU_MMIO,
+			dma_get_mask(dev));
 }
 
 static void iommu_dma_unmap_resource(struct device *dev, dma_addr_t handle,
@@ -1049,7 +1050,8 @@ static void *iommu_dma_alloc(struct device *dev, size_t size,
 	if (!cpu_addr)
 		return NULL;
 
-	*handle = __iommu_dma_map(dev, page_to_phys(page), size, ioprot);
+	*handle = __iommu_dma_map(dev, page_to_phys(page), size, ioprot,
+			dev->coherent_dma_mask);
 	if (*handle == DMA_MAPPING_ERROR) {
 		__iommu_dma_free(dev, size, cpu_addr);
 		return NULL;
@@ -1178,7 +1180,7 @@ static struct iommu_dma_msi_page *iommu_dma_get_msi_page(struct device *dev,
 	if (!msi_page)
 		return NULL;
 
-	iova = __iommu_dma_map(dev, msi_addr, size, prot);
+	iova = __iommu_dma_map(dev, msi_addr, size, prot, dma_get_mask(dev));
 	if (iova == DMA_MAPPING_ERROR)
 		goto out_free_page;
 
-- 
2.20.1


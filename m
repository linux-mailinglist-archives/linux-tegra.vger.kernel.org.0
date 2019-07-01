Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24BCF13A24
	for <lists+linux-tegra@lfdr.de>; Sat,  4 May 2019 15:24:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727282AbfEDNYm (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sat, 4 May 2019 09:24:42 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:42583 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727448AbfEDNYm (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 4 May 2019 09:24:42 -0400
Received: by mail-ed1-f68.google.com with SMTP id l25so9447913eda.9
        for <linux-tegra@vger.kernel.org>; Sat, 04 May 2019 06:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=googlenew;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=vManM7fsE1Rfxf4LI9PE09NH5+qz6oMA7YIWPZCw8JA=;
        b=ez50CYZi1A8wSumNLxfFT5fDvjyQSthm2ImcyBgWJZNuWsYYTI+5MV7M6wdd1MdMNN
         pJwutO+Oo2R/OawUn4U/2LtJK66YGTuRSO5Gyp/pIWuGi7PrTA9NdJOUDJc/t78TKc6k
         zw4ACn7/KpWHDA2S3OCEcc88Fql/3lD2sA3zOau9aiDy6BMZx5q945EXSP1U0E8Hh+5R
         lV5GfPeFErApZvps8XsrN2CnAT0KHUS5fBuIvsTtR9oGx/0vCS1Bj+M1C3xvNh3CeDD6
         vh9+citZdv4ijxFwUP40Bdeb9ra4qfEtz9Jpn992AuvkUaU6EdbfafrSRp4lyP7xq95o
         YKbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=vManM7fsE1Rfxf4LI9PE09NH5+qz6oMA7YIWPZCw8JA=;
        b=WxY5ZCkhbh6mbaieFUQnxVOv5qr2G/MOmnOIXnqZDOPyMjDsh9tWQCZpnRdqZN5FLx
         mXnyy6WpSzTsw1BP2O9Z705fT4Su5GPddhAO9Z/yCnBzZSkmqTspSBrMt6qB9g4Ekvqn
         1NcAEoJyhys5UCmEWq9+I/txiIRci9X65Q+lY2+7348bED8ZSsx5lretDXgM2SB7CiZI
         vDsQRLXI5PepmMz0sTrMJAOkDyxIksuGnzSRWyC+SHRHY2G+4sMQcXO4k4VDkfzOn2AN
         T+9DnyIMF+U+y4/2QygMGk0tMnwW7Q6XoP5HuUjh+oRt2nIdL5XXGVfcd6vHF2muxVoV
         DvKA==
X-Gm-Message-State: APjAAAVWohzmsHyIxehX38tkc/OPNPbn58Fe4P04F9DENzp8IZuNA9r1
        RGvEoDDdsdSS/yy9zzuVgYw2kg==
X-Google-Smtp-Source: APXvYqwVWrOdcYUC7jm/t7viqs/ofzOLuJ/GlF1vnrPFUxe0Q8NSMRSZyeacAEO3a+B70xlEIX1lEQ==
X-Received: by 2002:a50:c201:: with SMTP id n1mr14701766edf.244.1556976279937;
        Sat, 04 May 2019 06:24:39 -0700 (PDT)
Received: from localhost.localdomain ([79.97.203.116])
        by smtp.gmail.com with ESMTPSA id s53sm1391106edb.20.2019.05.04.06.24.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 04 May 2019 06:24:39 -0700 (PDT)
From:   Tom Murphy <tmurphy@arista.com>
To:     iommu@lists.linux-foundation.org
Cc:     murphyt7@tcd.ie, Tom Murphy <tmurphy@arista.com>,
        Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will.deacon@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        David Woodhouse <dwmw2@infradead.org>,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Alex Williamson <alex.williamson@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <marc.zyngier@arm.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-tegra@vger.kernel.org, kvm@vger.kernel.org
Subject: [RFC 5/7] iommu/dma-iommu: add wrapper for iommu_dma_free_cpu_cached_iovas
Date:   Sat,  4 May 2019 14:23:21 +0100
Message-Id: <20190504132327.27041-6-tmurphy@arista.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190504132327.27041-1-tmurphy@arista.com>
References: <20190504132327.27041-1-tmurphy@arista.com>
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add a wrapper for iommu_dma_free_cpu_cached_iovas in the dma-iommu api
path to help with the intel-iommu driver conversion to the dma-iommu api
path

Signed-off-by: Tom Murphy <tmurphy@arista.com>
---
 drivers/iommu/dma-iommu.c | 9 +++++++++
 include/linux/dma-iommu.h | 3 +++
 2 files changed, 12 insertions(+)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 82ba500886b4..1415b6f068c1 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -49,6 +49,15 @@ struct iommu_dma_cookie {
 	struct iommu_domain		*fq_domain;
 };
 
+void iommu_dma_free_cpu_cached_iovas(unsigned int cpu,
+		struct iommu_domain *domain)
+{
+	struct iommu_dma_cookie *cookie = domain->iova_cookie;
+	struct iova_domain *iovad = &cookie->iovad;
+
+	free_cpu_cached_iovas(cpu, iovad);
+}
+
 static void iommu_dma_entry_dtor(unsigned long data)
 {
 	struct page *freelist = (struct page *)data;
diff --git a/include/linux/dma-iommu.h b/include/linux/dma-iommu.h
index 3fc76918e9bf..1e5bee193feb 100644
--- a/include/linux/dma-iommu.h
+++ b/include/linux/dma-iommu.h
@@ -25,6 +25,9 @@ void iommu_setup_dma_ops(struct device *dev, u64 dma_base, u64 size);
 void iommu_dma_map_msi_msg(int irq, struct msi_msg *msg);
 void iommu_dma_get_resv_regions(struct device *dev, struct list_head *list);
 
+void iommu_dma_free_cpu_cached_iovas(unsigned int cpu,
+		struct iommu_domain *domain);
+
 #else /* CONFIG_IOMMU_DMA */
 
 struct iommu_domain;
-- 
2.17.1


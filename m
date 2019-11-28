Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB73C10CBD8
	for <lists+linux-tegra@lfdr.de>; Thu, 28 Nov 2019 16:37:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726401AbfK1Pht (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 28 Nov 2019 10:37:49 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:53171 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726692AbfK1Pht (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 28 Nov 2019 10:37:49 -0500
Received: by mail-wm1-f65.google.com with SMTP id l1so11412486wme.2
        for <linux-tegra@vger.kernel.org>; Thu, 28 Nov 2019 07:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dNaoo3mI+xfZVrHcwdtziDtvG7sdJdHcDl5YU1IbCPI=;
        b=A02Ea3PDZO6vcgy0N6CnvrNeKVCYmC8EdeKZvajIZfa2c6r+VRck/zUsN5UwHpSuRM
         X7kx5yVWo3NcbuDOVOT9xjkUoae6pXA0AUpUyJPM2K7JEiM08ZmpqnOjIV9LHdWauIs9
         vrK0hP2mbyQ+Xaz5I0RGa0L/aYEMWoBqcUDXknB4wJN6J5G3xJLlpT9i9HRTpPF0Bl/o
         bPqsjM29bzR0hfJoqgF4Rpd2EjWUm06ai/Rb+hocVj8fUpotxuEL2jM5a0zbbMfY9EI1
         9Npvr+rAgeuIooH+BXmOWoKNfFzjKJez05QTGBrq33SjFc2GIw9Sqr10j21U1XbjInOP
         peoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dNaoo3mI+xfZVrHcwdtziDtvG7sdJdHcDl5YU1IbCPI=;
        b=LTrw1MKP14cOOUghKIA1ZPlBQw4of5l4vSbdRqkSRBcEt/ndJLgT76kyWZ2TBUjkDF
         2lAbqkIdIPaI/ZXCuDomk/rNPEbfAdFXL2+KiT1U80RFvfqBOL+1zMovLkvWt/GHXV2v
         bn2yfd4Tl+Pv1NKZzp9mP+d1yyq++rOfq10khRXXdPApfd7cBwobc1tpTstpXTclp8Lp
         Zeyi1fQqrxz71bo1L+6T9JaU1pCoVr+6LCm6fWBqKshqzVqvJT9jYiGMGl58X4kGytlc
         5RfvJomZpjiSaVQtN40J4sF/eOQgs3g+lCoObCnrnpvdUFu8Yhx6EluXxvXIIFEgIKdO
         Yqqg==
X-Gm-Message-State: APjAAAWfP6FABMc1VMNzAdfL2U6cgUE6Au7wiFzLR5I21rQ7dTiZKmx1
        n21T7YwjWRtqXLkZd5uk798=
X-Google-Smtp-Source: APXvYqzoiFXF+tYKLyY+hdee6OAJkYHDs/CjucImZ7iJ1DslaZ2xMNDMpFVD7kmM4nZlKtPsYeO6fw==
X-Received: by 2002:a1c:4e1a:: with SMTP id g26mr10460607wmh.138.1574955467207;
        Thu, 28 Nov 2019 07:37:47 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id a3sm1323242wmh.5.2019.11.28.07.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2019 07:37:46 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 2/9] drm/tegra: gem: Properly pin imported buffers
Date:   Thu, 28 Nov 2019 16:37:34 +0100
Message-Id: <20191128153741.2380419-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191128153741.2380419-1-thierry.reding@gmail.com>
References: <20191128153741.2380419-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Buffers that are imported from a DMA-BUF don't have pages allocated with
them. At the same time an SG table for them can't be derived using the
DMA API helpers because the necessary information doesn't exist. However
there's already an SG table that was created during import, so this can
simply be duplicated.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/gem.c | 43 +++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index 746dae32c484..6dfad56eee2b 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -27,6 +27,29 @@ static void tegra_bo_put(struct host1x_bo *bo)
 	drm_gem_object_put_unlocked(&obj->gem);
 }
 
+/* XXX move this into lib/scatterlist.c? */
+static int sg_alloc_table_from_sg(struct sg_table *sgt, struct scatterlist *sg,
+				  unsigned int nents, gfp_t gfp_mask)
+{
+	struct scatterlist *dst;
+	unsigned int i;
+	int err;
+
+	err = sg_alloc_table(sgt, nents, gfp_mask);
+	if (err < 0)
+		return err;
+
+	dst = sgt->sgl;
+
+	for (i = 0; i < nents; i++) {
+		sg_set_page(dst, sg_page(sg), sg->length, 0);
+		dst = sg_next(dst);
+		sg = sg_next(sg);
+	}
+
+	return 0;
+}
+
 static struct sg_table *tegra_bo_pin(struct device *dev, struct host1x_bo *bo,
 				     dma_addr_t *phys)
 {
@@ -52,11 +75,31 @@ static struct sg_table *tegra_bo_pin(struct device *dev, struct host1x_bo *bo,
 		return ERR_PTR(-ENOMEM);
 
 	if (obj->pages) {
+		/*
+		 * If the buffer object was allocated from the explicit IOMMU
+		 * API code paths, construct an SG table from the pages.
+		 */
 		err = sg_alloc_table_from_pages(sgt, obj->pages, obj->num_pages,
 						0, obj->gem.size, GFP_KERNEL);
 		if (err < 0)
 			goto free;
+	} else if (obj->sgt) {
+		/*
+		 * If the buffer object already has an SG table but no pages
+		 * were allocated for it, it means the buffer was imported and
+		 * the SG table needs to be copied to avoid overwriting any
+		 * other potential users of the original SG table.
+		 */
+		err = sg_alloc_table_from_sg(sgt, obj->sgt->sgl, obj->sgt->nents,
+					     GFP_KERNEL);
+		if (err < 0)
+			goto free;
 	} else {
+		/*
+		 * If the buffer object had no pages allocated and if it was
+		 * not imported, it had to be allocated with the DMA API, so
+		 * the DMA API helper can be used.
+		 */
 		err = dma_get_sgtable(dev, sgt, obj->vaddr, obj->iova,
 				      obj->gem.size);
 		if (err < 0)
-- 
2.23.0


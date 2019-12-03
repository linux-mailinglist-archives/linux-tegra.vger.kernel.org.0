Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB4591101F7
	for <lists+linux-tegra@lfdr.de>; Tue,  3 Dec 2019 17:19:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726363AbfLCQTV (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 3 Dec 2019 11:19:21 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:35856 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726139AbfLCQTV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 3 Dec 2019 11:19:21 -0500
Received: by mail-wr1-f68.google.com with SMTP id z3so4429547wru.3
        for <linux-tegra@vger.kernel.org>; Tue, 03 Dec 2019 08:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ak02DWSi16xtOh2ECFAWgXweAP5WExvaHVwWZOvyNnw=;
        b=RL3vCTki5+cR7UoU49Qhs4YMV6dygSXVkmjcJrGmlyiUJg7I40PArNtHDdaed3Idsp
         jqhgLSdkixx8XnwBSZnJBed9WhVY8qumrBkEf771dmfwvNKAlqBseA1KyW/3io7flDmX
         ylaS17NtXPPiCC45yXaVsWKHcYhofEuygZQ5BH1a+SN+ekT+ttVeQ9V159fDpN+Zw7Lx
         sHcJ/QPG4K/Lb6Tnkpm6EVre2n0cf96UTeXShV5FhWjBPZCahz5RfM9RgNjJXaIfJpWr
         4t09araZKxkwBgt8EB6H4p1ADwfkSsSbtC6yvhDkM2IRriGGs5LBDDNkObPp2it7sCb1
         Apyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ak02DWSi16xtOh2ECFAWgXweAP5WExvaHVwWZOvyNnw=;
        b=Q5oZZX2EEljHrOekNv9NSW6vEbRJ65j6pmG4sF8o3GEAmSZnZRD5xWz5n2y9yJl/49
         Om/ZzSlVlLIfQengks8YpWwGpvVRKB6mIPomklVBQpiMm77xRtMWd+sGhzBllmG6x69L
         z3z49ZSoQbKaPpT4c5xRic0JqfI5YSrrR+fm4fLHzV2fN4MgiYuTrO3+25rpqtN3TEof
         iQYr3TsUpzXSyzoiy+sQ5VWHi21Y6YYF9h1qCFaargqeFIsNNrFCaUt8HN9BpDNNgq6Y
         463VWlq6zQnQC/BhRK3eCwHYC7c0p4BB1EH353T4GP+y1yL41vYktzMOaXMIbv9zOwTe
         q6NA==
X-Gm-Message-State: APjAAAUlZ/kN5SOQPKQ46d5kcm6o219xO2v+SZQ0zrK2JJW/DQlY0ug0
        sPhO9sZtwvl4dzKcxOD4V9E=
X-Google-Smtp-Source: APXvYqxX2J/L0HA0d2WUetE0tWp+6QJNxQ50KMEFOyZXtSl+Lp5vT6IUI4TcSqgDC50CFxE2aJTYvw==
X-Received: by 2002:a05:6000:12c9:: with SMTP id l9mr6434660wrx.304.1575389959171;
        Tue, 03 Dec 2019 08:19:19 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id h2sm4386670wrt.45.2019.12.03.08.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2019 08:19:18 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v2 2/9] drm/tegra: gem: Properly pin imported buffers
Date:   Tue,  3 Dec 2019 17:19:07 +0100
Message-Id: <20191203161914.1312555-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191203161914.1312555-1-thierry.reding@gmail.com>
References: <20191203161914.1312555-1-thierry.reding@gmail.com>
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
Note that for proper DMA-BUF usage, the display controllers should each
attach to the DMA-BUF for imported buffers. That's a fairly large change
and will be sent out as a follow-up, targetting v5.6. This patch is a
fix for a recent regression in v5.5-rc1.

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


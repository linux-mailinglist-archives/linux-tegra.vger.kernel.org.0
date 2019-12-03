Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8C35110256
	for <lists+linux-tegra@lfdr.de>; Tue,  3 Dec 2019 17:32:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726707AbfLCQcJ (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 3 Dec 2019 11:32:09 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:33465 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725848AbfLCQcJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 3 Dec 2019 11:32:09 -0500
Received: by mail-wm1-f67.google.com with SMTP id y23so2760174wma.0
        for <linux-tegra@vger.kernel.org>; Tue, 03 Dec 2019 08:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9+5X8T1e9hRpXIXFZg1NPo8MjmX2IuYdom9kAI//J+o=;
        b=hNKazjUsDMTafj6NH2ZsTDB75Dvo/1uUIYIEBgWNqDG673w8LZtv9LEAwiZf03eBPA
         qwbZC0C3pYALrzSP4kWPEVaFwGyMSAFfg7QKaTgQkzMKMvMQvYnL3IYVBv5aO+uaTF8x
         eyE6UhCauBAn+dLdc6eIr5s2age6Y+Dy6o1ENABd2o7n6U49sYLINPWnlAMPkbHCRIVs
         p76/r9NIwJgsttgohB9COBN54M7wjPrIggT+0fJISLAiQ8IoEgT/Rpb62xz17kyr2YZ3
         ferp/EGxYz9yNnHybORwwWJkXNeNRXOd780s2HfJDGQdwSkexSg4lgg5uVDgI2IBUPrz
         ASfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9+5X8T1e9hRpXIXFZg1NPo8MjmX2IuYdom9kAI//J+o=;
        b=jljGfLl74Y8QFtRv350Xw/lEU7XceM8DVieqk0NHn7h0rOvOhgsJLUwigmwCFvMBSZ
         Soxd6BLZkjW/JLhkT9qkhfNEjjQnm2lnuYmjKc/R1IACxux60qdrCKnn/nFBcQGEqEzc
         63xqon073Q3eIlVNFQcDsHZspvCHFJ0H3qyxllvQ2DnIpsi0LcnQocRcsdSa0g44kanR
         CcnUwqOI/Ni6z79PiZBQddtAqbuR39ElUfychDaJe6R7WYW4NVgLnHG1EnFwpEPsqUnf
         A/3xdPVVNY3L1zelxIP0Md7XryacQgIS6cIs67plg2B1cDeGRvwFVUWYFETri8PKYZzV
         h/yQ==
X-Gm-Message-State: APjAAAVuut3HbdHx9RTlcU3iVmBHwizgKpVp9vB0lCArKTrGtrHJQeHZ
        kNHMhWOK3HeRAa9aNII+jRQ=
X-Google-Smtp-Source: APXvYqzOOcKTaW7GhzPsuaxOQCcVpGuf35zh5toqs1OS7u7PG84TbcFn+UpOIoBmykGNDW6kwGp2zg==
X-Received: by 2002:a1c:3803:: with SMTP id f3mr29839022wma.134.1575390727042;
        Tue, 03 Dec 2019 08:32:07 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id l17sm3559762wme.45.2019.12.03.08.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2019 08:32:06 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 2/3] drm/cma-helper: Use sgt_dma_contiguous() helper
Date:   Tue,  3 Dec 2019 17:32:02 +0100
Message-Id: <20191203163203.1486837-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191203163203.1486837-1-thierry.reding@gmail.com>
References: <20191203163203.1486837-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Functionality to count the number of contiguous DMA chunks in an SG
table has been added to the scatterlist library. Use this functionality
to replace an open-coded version in the GEM/CMA helpers.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/drm_gem_cma_helper.c | 22 ++--------------------
 1 file changed, 2 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm_gem_cma_helper.c
index 12e98fb28229..5bbae9654cc6 100644
--- a/drivers/gpu/drm/drm_gem_cma_helper.c
+++ b/drivers/gpu/drm/drm_gem_cma_helper.c
@@ -471,26 +471,8 @@ drm_gem_cma_prime_import_sg_table(struct drm_device *dev,
 {
 	struct drm_gem_cma_object *cma_obj;
 
-	if (sgt->nents != 1) {
-		/* check if the entries in the sg_table are contiguous */
-		dma_addr_t next_addr = sg_dma_address(sgt->sgl);
-		struct scatterlist *s;
-		unsigned int i;
-
-		for_each_sg(sgt->sgl, s, sgt->nents, i) {
-			/*
-			 * sg_dma_address(s) is only valid for entries
-			 * that have sg_dma_len(s) != 0
-			 */
-			if (!sg_dma_len(s))
-				continue;
-
-			if (sg_dma_address(s) != next_addr)
-				return ERR_PTR(-EINVAL);
-
-			next_addr = sg_dma_address(s) + sg_dma_len(s);
-		}
-	}
+	if (!sgt_dma_contiguous(sgt))
+		return ERR_PTR(-EINVAL);
 
 	/* Create a CMA GEM buffer. */
 	cma_obj = __drm_gem_cma_create(dev, attach->dmabuf->size);
-- 
2.23.0


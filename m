Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EECBBD630E
	for <lists+linux-tegra@lfdr.de>; Mon, 14 Oct 2019 14:51:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731617AbfJNMvV (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 14 Oct 2019 08:51:21 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:35467 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731466AbfJNMvV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 14 Oct 2019 08:51:21 -0400
Received: by mail-wm1-f66.google.com with SMTP id y21so16640716wmi.0
        for <linux-tegra@vger.kernel.org>; Mon, 14 Oct 2019 05:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=L6DFI3lr21cxldQszCfNagwz6ouXjHUUOPmyE9u059w=;
        b=iPgItiXtpgKKBpeS125en/RKu/Hj7ylehRo9pfmYEoVm4ncJ24VHPmBL8B8VHBw+3a
         UiB1RotVHIX7OrWZooxiKLMKlVGj7rmjPPWoPvXbnNCHDg0+YvwpA2h3kbpxVeWVORs+
         yHtQR19gSg3+/qHaJCo0doaCnxQWUCocX/Ly5oD5XEE15JDH/DvDa7tNCSgAIbwZRLEO
         nkGkn72PnO6vxoGEGqiszfYpQLNtCQqPYfnvLAb6gBQaiCMvkMiQ38c7TCZlk+SO90nS
         khUeK9b3HJh4m1voNL4vYIGAktkhbts7c9GwdwrvcJgKcgnoHz/bXR+xj8gaFz4WFDeb
         xA9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L6DFI3lr21cxldQszCfNagwz6ouXjHUUOPmyE9u059w=;
        b=E6c1acJC7td0f5oNxjYHLbrTqaU+fCQSL1torUT1+jwbkIMByzk3ubDtnAdp9Pp/lj
         0ZaQnV3sarBJ0vLvLKbvPHL0aPAR9Urbu2NgKIjkCKa8s8mUKBpK+Aryk26FTqI/d73y
         gHT2XEwP00rELdWqM0zBC9qhj/MkP4eXzdDbIdw+nh8vbxAg/b/rcsJrvk2w33ayIket
         FOFhdFzIh8/2z+hInHP9FfJde8Sg8iw9DlLYHBWOrieK13jNfO6YcnzAOkebQsTDqHX4
         LPW/c5mE76bWY+bta2h2PpOPpqWUvuTt8wBlXdpb4s8lcjNXDZWHHjDi7sGxGpHpoO2A
         MjAQ==
X-Gm-Message-State: APjAAAVjamHtAv4yyUp8V2GpP43iQ4B1/4gxcL2QhWNdhhnCp5cXgGnC
        UKqkD7isr2pduja3zJus7AgP7lGM
X-Google-Smtp-Source: APXvYqyN/LerxskEetZ2/hwohnBAAPRhjP7KDY4Of6Q6oxq2vm6c4N3iagQzsL2fEAFxN5yMJQiWCg==
X-Received: by 2002:a7b:ce88:: with SMTP id q8mr14001743wmj.160.1571057479883;
        Mon, 14 Oct 2019 05:51:19 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id t123sm31334879wma.40.2019.10.14.05.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2019 05:51:19 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 13/14] drm/tegra: gem: Always map SG tables for DMA-BUFs
Date:   Mon, 14 Oct 2019 14:50:48 +0200
Message-Id: <20191014125049.425101-14-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191014125049.425101-1-thierry.reding@gmail.com>
References: <20191014125049.425101-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

When an importer wants to map a DMA-BUF, make sure to always actually
map it, irrespective of whether the buffer is contiguous or not.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/gem.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index 3345cce14662..00701cadaceb 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -516,15 +516,15 @@ tegra_gem_prime_map_dma_buf(struct dma_buf_attachment *attach,
 
 		for_each_sg(sgt->sgl, sg, bo->num_pages, i)
 			sg_set_page(sg, bo->pages[i], PAGE_SIZE, 0);
-
-		if (dma_map_sg(attach->dev, sgt->sgl, sgt->nents, dir) == 0)
-			goto free;
 	} else {
 		if (dma_get_sgtable(attach->dev, sgt, bo->vaddr, bo->iova,
 				    gem->size) < 0)
 			goto free;
 	}
 
+	if (dma_map_sg(attach->dev, sgt->sgl, sgt->nents, dir) == 0)
+		goto free;
+
 	return sgt;
 
 free:
-- 
2.23.0


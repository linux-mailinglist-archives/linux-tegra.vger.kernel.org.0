Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7814913C4EC
	for <lists+linux-tegra@lfdr.de>; Wed, 15 Jan 2020 15:08:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726483AbgAOOIB (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 15 Jan 2020 09:08:01 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:45367 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726501AbgAOOIB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 15 Jan 2020 09:08:01 -0500
Received: by mail-wr1-f67.google.com with SMTP id j42so15836693wrj.12
        for <linux-tegra@vger.kernel.org>; Wed, 15 Jan 2020 06:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zOG3gslUIp2aajc8ofWEsgmTDRhGhvfYrKvkK7j/6Cw=;
        b=VDr6tDsOaWkIeJlYFoMPymy5qsLBZl/eUIpJuBCHCa2sV92O3e5g4s4ZI5FX41IL0K
         xSl9VelfzbqKmzLD12LG8Hjvwxm/YKJG7fsaHEKnrA5AwcanB3yQdcykj1nPz4A61lak
         fLrH7PL4+AlRliUHWVuhE4DSOv4TSuVAsQFUzmY8Xa79GSfQasExNbRYdzB6SQwVqjS/
         VYjybPGGUpUnE7CMPb61T3XNJDCFdIhB/VTuggXY5AbBKZBxVrA9u8/NrwH+lwjK+sNu
         oLacQysoTmyhNKswBtAPsqlXmu4Cm8UVtQzu9FwP4/zPPCirypytaWpqfAWbCSkLVbb9
         HwEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zOG3gslUIp2aajc8ofWEsgmTDRhGhvfYrKvkK7j/6Cw=;
        b=TSa8y6tmiLTSXKHEsufwqeRzn2rO+qvjgVgEvk30zTFVrKVo86NAPhHce88xg2R7Ct
         5+9a0cx2SKkzspBj88398Es/D2gFAnaqGsC8+Hms+nZNqA+7FlRFBg+FjWumRIC+uHXc
         au6RLzXPYt01qbYutSHPs4/gJ+itDwIX/3En7Smssno0JGGwBkf4Y5m8wEgEMtp4Hhy5
         77iHQ/XsPrL+o1VipH8v1us8Z4p18dfkAt+1BtYJy64D8Dfl846OZH1ILofjuZoUGIBJ
         2swgNlqP7FQXBJInvJZWPgEqC4AA2npLHenvJ7RUAoctMjgopvHpaWmx1JXWnLgF2kWb
         Uw9Q==
X-Gm-Message-State: APjAAAUuvOr2FLrMCj6TPerMVg++rYQEqeZjCGzrVxXS+z9bvZWVU7QE
        QelGfNZVMHUBIESYsiF/N7w=
X-Google-Smtp-Source: APXvYqxgQ5gs/WvwfgdNbYMteyftk+CBVLGkkImNsXns/XeT7bgOvd2hU1QLLFCsqi7S+ybXMLG5Mg==
X-Received: by 2002:a5d:4b8f:: with SMTP id b15mr33007606wrt.100.1579097278979;
        Wed, 15 Jan 2020 06:07:58 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
        by smtp.gmail.com with ESMTPSA id g2sm24872434wrw.76.2020.01.15.06.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2020 06:07:58 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Ben Skeggs <bskeggs@redhat.com>
Cc:     nouveau@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH] drm/nouveau: gp10b: Use gp100_grctx and gp100_gr_zbc
Date:   Wed, 15 Jan 2020 15:07:56 +0100
Message-Id: <20200115140756.70830-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

gp10b doesn't have all the registers that gp102_gr_zbc wants to access,
which causes IBUS MMIO faults to occur. Avoid this by using the gp100
variants of grctx and gr_zbc.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.h | 1 +
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gp100.c | 2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gp10b.c | 4 ++--
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.h b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.h
index fafdd0bbea9b..c4b2e6346684 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.h
@@ -245,6 +245,7 @@ void gp100_gr_init_fecs_exceptions(struct gf100_gr *);
 void gp100_gr_init_shader_exceptions(struct gf100_gr *, int, int);
 void gp100_gr_zbc_clear_color(struct gf100_gr *, int);
 void gp100_gr_zbc_clear_depth(struct gf100_gr *, int);
+extern const struct gf100_gr_func_zbc gp100_gr_zbc;
 
 void gp102_gr_init_swdx_pes_mask(struct gf100_gr *);
 extern const struct gf100_gr_func_zbc gp102_gr_zbc;
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gp100.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gp100.c
index 9d0521ce309a..ef16fee61327 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gp100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gp100.c
@@ -62,7 +62,7 @@ gp100_gr_zbc_clear_depth(struct gf100_gr *gr, int zbc)
 			  gr->zbc_depth[zbc].format << ((znum % 4) * 7));
 }
 
-static const struct gf100_gr_func_zbc
+const struct gf100_gr_func_zbc
 gp100_gr_zbc = {
 	.clear_color = gp100_gr_zbc_clear_color,
 	.clear_depth = gp100_gr_zbc_clear_depth,
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gp10b.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gp10b.c
index 303dceddd4a8..0b375b2587d2 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gp10b.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gp10b.c
@@ -48,8 +48,8 @@ gp10b_gr = {
 	.gpc_nr = 1,
 	.tpc_nr = 2,
 	.ppc_nr = 1,
-	.grctx = &gp102_grctx,
-	.zbc = &gp102_gr_zbc,
+	.grctx = &gp100_grctx,
+	.zbc = &gp100_gr_zbc,
 	.sclass = {
 		{ -1, -1, FERMI_TWOD_A },
 		{ -1, -1, KEPLER_INLINE_TO_MEMORY_B },
-- 
2.24.1


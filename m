Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9AFBDB3D25
	for <lists+linux-tegra@lfdr.de>; Mon, 16 Sep 2019 17:04:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730375AbfIPPEb (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 16 Sep 2019 11:04:31 -0400
Received: from mail-ed1-f53.google.com ([209.85.208.53]:34001 "EHLO
        mail-ed1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726968AbfIPPEb (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 16 Sep 2019 11:04:31 -0400
Received: by mail-ed1-f53.google.com with SMTP id c20so403264eds.1
        for <linux-tegra@vger.kernel.org>; Mon, 16 Sep 2019 08:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tEI35h92cKRPz8atJCk7hAGkg2y7SwNbjm+2sjYk9Pk=;
        b=LTkhXfTW7bFcAfitrOFPNRRYMEvgMbD48xTU63SQYgRdfkR2sIPv9BdrYgCQqV/dA0
         b3uq2CmPLGOOIK/tRQ2zHKu3L923Cvc3fOwMjNEI2i/PS/KkodgJ509Cz6Raduix/KYn
         bu1dEuXHFwO6itMgz9+Zgo7s1nLU0Pn8J+PoRHVhzqy6Bk2ZgG4YPS2k1igDQ05cdIdg
         msdJpWouJ7rB4+m0U+XY83GuuZnPBxquUzYwBb9Yy4uQZnVPMyOYuvTuNQR3hSiGzrXE
         nNil+VntfoDP/SNL49VxbUzXXtRKiRd9Ek95dtz1aXnGETMsZoA44VsElviGhA0++CiA
         y6nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tEI35h92cKRPz8atJCk7hAGkg2y7SwNbjm+2sjYk9Pk=;
        b=YakaqhlQ/55qzTnTnLO1MV3mBg6BBJ3x+5SapN0Rt843qYkvD/aCcHZYlcsPsdwu9H
         ufRpia0hA8sem+v3NApsvCo3xwV/WCMh1FMkRFsapqdSuYpen9zDjbEUm+hYNWqvrcKB
         veH6f8PohCfPDaxei0BSKh5ZS6AGRg826/mQ/sdXchT4ZB0Gj+Vvu6rx3O40fKD+3q6L
         EsgB/rLEwdGJlZOWHrymiNw5aRXi2MHqn6tP89tqFlsny9Xv12qqcK6+we9bMPLGtWAU
         jC8LVVxnlMoolaAyaTaNNHM8sZz5dcDc+ubjKwhkQcxD15xhVNxk353aq8/TQNoygaIp
         Arvg==
X-Gm-Message-State: APjAAAVpjZ9mfYkNBcDwsJtSlNC+Xk5LRNwC7/vDkKipoOY+h8m/3NqV
        9F5yiazqsCv1PXDaWT7Z6j0=
X-Google-Smtp-Source: APXvYqzvIaYhzg3s8/ZVisWsNvZKBFDkzIjVhtduBhgMy+imM0QojIwA3iv3W6whbTfuVCGCdfJd+Q==
X-Received: by 2002:a17:907:20a2:: with SMTP id pw2mr409608ejb.163.1568646267848;
        Mon, 16 Sep 2019 08:04:27 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id x12sm3576830ejv.69.2019.09.16.08.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2019 08:04:26 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Ben Skeggs <bskeggs@redhat.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 05/11] drm/nouveau: gp10b: Use correct copy engine
Date:   Mon, 16 Sep 2019 17:04:06 +0200
Message-Id: <20190916150412.10025-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190916150412.10025-1-thierry.reding@gmail.com>
References: <20190916150412.10025-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

gp10b uses the new engine enumeration mechanism introduced in the Pascal
architecture. As a result, the copy engine, which used to be at index 2
for prior Tegra GPU instantiations, has now moved to index 0. Fix up the
index and also use the gp100 variant of the copy engine class because on
gp10b the PASCAL_DMA_COPY_B class is not supported.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/device/base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
index d2d6d5f4028a..99d3fa3fad89 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
@@ -2387,7 +2387,7 @@ nv13b_chipset = {
 	.pmu = gm20b_pmu_new,
 	.timer = gk20a_timer_new,
 	.top = gk104_top_new,
-	.ce[2] = gp102_ce_new,
+	.ce[0] = gp100_ce_new,
 	.dma = gf119_dma_new,
 	.fifo = gp10b_fifo_new,
 	.gr = gp10b_gr_new,
-- 
2.23.0


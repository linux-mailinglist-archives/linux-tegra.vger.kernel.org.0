Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A2BD116CB9
	for <lists+linux-tegra@lfdr.de>; Mon,  9 Dec 2019 13:00:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727590AbfLIMA1 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 9 Dec 2019 07:00:27 -0500
Received: from mail-wr1-f53.google.com ([209.85.221.53]:46922 "EHLO
        mail-wr1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727385AbfLIMA1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 9 Dec 2019 07:00:27 -0500
Received: by mail-wr1-f53.google.com with SMTP id z7so15793574wrl.13
        for <linux-tegra@vger.kernel.org>; Mon, 09 Dec 2019 04:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hRybqVavQHo4kc2uAW1DufA56ffoS4VWZ8W5YOU7UtQ=;
        b=I3rxL24mYZqpFkBuF0tA7G5UTw3tF0TJkYyIYt79Hs3jpj9RpazUzevgJhnVEPKQrh
         SkR9egT7lgk6iOKwB4F5YgqkRiZL8tgmuul/LmLv9/k5dvjGfQ19vPp+7Mj0ab+AHBCb
         q+Qwh0vTVVvKQpz3s2qs2QZP5vpJol4KgOOPaO7aLPI0YfW5KcTzoLPQSyq/JEWVFNv6
         La0nReZlcssGJkW63OAHHdQlUsFsf5f7e5QVSOEVpm73s8AQpr6sSB12JJD1DpWyyHjw
         9zIoC1imvNgbczStN+jV6BlS9BHpOdl4TSrBrKebUIEBF0wrPJ5NOi3ldvjaU2Gn0Q8n
         8eyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hRybqVavQHo4kc2uAW1DufA56ffoS4VWZ8W5YOU7UtQ=;
        b=VzlzRD8It2qLhUTitmixbxSOGqlvlVAWmQ+mJfhMvOKhnx4EUwUgTixXYtrHIxuiGc
         fEK/OsohU2X4UOOsqniEZFy41dJEsgVUxfPO3eCDSnIfJOHL52ecRJ7K6geN6BFRvN5I
         U23Fan7PXEUoIY+/d3GTGYkgRyFwMb+R6auEdL6GRvhk809YFfsbE4wB7GokZjexyce5
         K/4xXzUhkxvdB+Y7z5omna9POUanJg2a6nCqYTfjNpKH2FEnNyTKpsnAJqLuzroEHoiP
         idzuIrlAI2KyBlFLfyGLhW9Mz7wkFVSjLUhfBrqhwBeyBRPG8Lk7EIv5YMsGA8rafxqp
         wZxA==
X-Gm-Message-State: APjAAAW8zE8FdK1ZWLTRP7UKkxsITwo9+qPLd/uN4eCw9jp8BVMQQWnD
        S0Ef9fn7TnL1JKyHI28Xb/M=
X-Google-Smtp-Source: APXvYqwGAStGmh5k52u0RoRw/k32jrc4q5lTbFOStWvlY73rNHM4OXu04y09xn3OYGOx3B/rw9LKUQ==
X-Received: by 2002:adf:b64b:: with SMTP id i11mr1683353wre.58.1575892825514;
        Mon, 09 Dec 2019 04:00:25 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id j12sm28417673wrw.54.2019.12.09.04.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2019 04:00:24 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Ben Skeggs <bskeggs@redhat.com>
Cc:     Joerg Roedel <joro@8bytes.org>, Lyude Paul <lyude@redhat.com>,
        nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v3 9/9] drm/nouveau: gp10b: Use correct copy engine
Date:   Mon,  9 Dec 2019 13:00:05 +0100
Message-Id: <20191209120005.2254786-10-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191209120005.2254786-1-thierry.reding@gmail.com>
References: <20191209120005.2254786-1-thierry.reding@gmail.com>
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
index 231ec0073af3..eba450e689b2 100644
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


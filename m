Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CC791E30C8
	for <lists+linux-tegra@lfdr.de>; Tue, 26 May 2020 22:58:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389277AbgEZU63 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 26 May 2020 16:58:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389243AbgEZU62 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 26 May 2020 16:58:28 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EE3AC061A0F
        for <linux-tegra@vger.kernel.org>; Tue, 26 May 2020 13:58:27 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id x22so13165675lfd.4
        for <linux-tegra@vger.kernel.org>; Tue, 26 May 2020 13:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=za0Xo3I0LAsRZXk95U5AbhwvFqCyP5Coh1Szk4hdFT0=;
        b=sYqdL00wxBsKV/tWk4c/6PSxudVVmlGYO0JOmSXa3vGMFJbEfYsZkZ2WKjLTUH3NIe
         GAJj1QX36IrwRg6focC8XHG6l+oVVpXsQkejxtsnxe64lRSIYubjo7ZCRJoYh8iKDEWN
         SznVDhs2V4NCL9rtvxIKN2dy+06oSC4/Vk52LKYk5KLLkyCQVM+zr3CKrBZgJNDub0G8
         nRen1btPHNviYUBqKzOeWSAQ38QWr+MOcaVvV2zM8N49pBQ/6WVvGOCAbCZYsRsBnkdf
         o2jISFaIs1Z1jGm3PkL5sruecUWjw/wZM8eO1lOkbftNZxuu5Sczjr+cXCXWR/t/hV9z
         waVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=za0Xo3I0LAsRZXk95U5AbhwvFqCyP5Coh1Szk4hdFT0=;
        b=RenR/P4YMfzF2qfYXM+mPawzYoj7uO4rv1B8QZlP4qh+ys3hvyxAs8K8rYECML2hBN
         keCl9AMWXH4RWVAr9bUuJqiDhU1Xkr2QgO8vpldsJH0RSfhDaF6uRPC18YS4Lt6s7m4c
         FFNaCpARBuIXcX66TQ/b1Grrp24Q0+7Yt9z0Rcc+4WdqdCqOWRyZbymqODtq8ACOwewL
         blaMMRIUfgBk5w6H/rn34s607wWQkIPMrjjENggJJzeb0NYKTbN0afjqHyXICTO7wClV
         YLN5QRPCI26y6dTHdI5V8FvSygqSQZLrWIdsTEnI7hE8HRrDv1xNaTrmU71mnh4KYR6E
         tKeg==
X-Gm-Message-State: AOAM5309XxSLMeDfgYE4iw0Y6l8HC4040AkdGHuhacvQ9LDfs8HRNWxp
        B26iGvEvsi5Zi9fY0l7BNBg=
X-Google-Smtp-Source: ABdhPJz2zthhB+lGno5dNWs8TPvEIizQS0U7tTQWF0e28Oqqtl5d4pIalYrtVRccmB5y8rQ0SirXwA==
X-Received: by 2002:ac2:5094:: with SMTP id f20mr1391175lfm.128.1590526704190;
        Tue, 26 May 2020 13:58:24 -0700 (PDT)
Received: from localhost.localdomain (ppp91-76-17-204.pppoe.mtu-net.ru. [91.76.17.204])
        by smtp.gmail.com with ESMTPSA id y130sm241192lfc.22.2020.05.26.13.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2020 13:58:23 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH v1] drm/tegra: gr2d: Add tiled PATBASE address register
Date:   Tue, 26 May 2020 23:57:53 +0300
Message-Id: <20200526205753.14423-1-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

There are two PATBASE address registers, one for linear layout and other
for tiled. The driver's address registers list misses the tiled PATBASE
register.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/gr2d.c | 1 +
 drivers/gpu/drm/tegra/gr2d.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/tegra/gr2d.c b/drivers/gpu/drm/tegra/gr2d.c
index 48363f744bb9..1a0d3ba6e525 100644
--- a/drivers/gpu/drm/tegra/gr2d.c
+++ b/drivers/gpu/drm/tegra/gr2d.c
@@ -177,6 +177,7 @@ static const u32 gr2d_addr_regs[] = {
 	GR2D_DSTC_BASE_ADDR,
 	GR2D_SRCA_BASE_ADDR,
 	GR2D_SRCB_BASE_ADDR,
+	GR2D_PATBASE_ADDR,
 	GR2D_SRC_BASE_ADDR_SB,
 	GR2D_DSTA_BASE_ADDR_SB,
 	GR2D_DSTB_BASE_ADDR_SB,
diff --git a/drivers/gpu/drm/tegra/gr2d.h b/drivers/gpu/drm/tegra/gr2d.h
index 2398486f0699..9b7d66e15b9f 100644
--- a/drivers/gpu/drm/tegra/gr2d.h
+++ b/drivers/gpu/drm/tegra/gr2d.h
@@ -14,6 +14,7 @@
 #define GR2D_DSTC_BASE_ADDR		0x2d
 #define GR2D_SRCA_BASE_ADDR		0x31
 #define GR2D_SRCB_BASE_ADDR		0x32
+#define GR2D_PATBASE_ADDR		0x47
 #define GR2D_SRC_BASE_ADDR_SB		0x48
 #define GR2D_DSTA_BASE_ADDR_SB		0x49
 #define GR2D_DSTB_BASE_ADDR_SB		0x4a
-- 
2.26.0


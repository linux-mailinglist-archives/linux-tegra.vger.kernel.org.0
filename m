Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1ED120CC13
	for <lists+linux-tegra@lfdr.de>; Mon, 29 Jun 2020 05:18:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726005AbgF2DS4 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 28 Jun 2020 23:18:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725976AbgF2DSz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 28 Jun 2020 23:18:55 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C861C03E979
        for <linux-tegra@vger.kernel.org>; Sun, 28 Jun 2020 20:18:55 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id y18so8225145lfh.11
        for <linux-tegra@vger.kernel.org>; Sun, 28 Jun 2020 20:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=za0Xo3I0LAsRZXk95U5AbhwvFqCyP5Coh1Szk4hdFT0=;
        b=E8gAXrM5cuu0IF442c0VUexWE3bkFUf3djAfo0y0tzrGwZDsUWKClZiplXSxevzpb6
         ORkx6IV6ae32ae/+Ty6JarojOmizz+ANLD+vKFkprJLd1ZAhcVp8XT+PfFoq0CH0rYEH
         Qu1NeRVxqOKRSBRK1gaRbYqRCnPe3rgmfDsNgG90XwZZNU9VKYb9bLZBpfi1Njq8sbZx
         TEZ0lGDpH9GvuRY6YR32oyVK7WieU9cBn/arKnRiCv9OHj7md9ZdQGlBM9Ym2mOXDs+B
         zsU3uQqnZ2QCvktCgr638zDIFMKCWDqUjY5ku+VsCIRsPf6QL/lfzpb0o/xU6oPIh1j1
         Z6hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=za0Xo3I0LAsRZXk95U5AbhwvFqCyP5Coh1Szk4hdFT0=;
        b=Gdu3thh9meMkwCqaWNM43i9wwYOEvpqDP+r7fl/eOSt4DKnl928YDUrWtsemy5ksdH
         eRp6dE6JH01n/wPhRVh6D1jUDd4S2+VkSWzI8jiWOndbwwa5xpug8LJqGWk1E0DqtZcM
         IbeEcFLshCr0uQw/vpHe1EX6vXKe22nOPv1NBal3SFzkkb9IrPbZeR5Q7DkcgJvAhr6H
         DTHKBzov5SUN8eamaTkNyeQSAteBrHrIFTY/dwOghXTq6yzRQIeLx1o3zSSydNEzSUVs
         xM5FmphvKhDbuY5csb+vmatbL6ijSkIFvQAIwvxoU87RT5ALwe3g0Lz4Au49kBRBoHTU
         jprQ==
X-Gm-Message-State: AOAM530LC8aLr25u4w+ikGY/jbKrRr6jry4Ak1ffGtmOuyZj0ShLa7iV
        fQAWsAAmeedk5AfDagzDaS8E0o6MAgU=
X-Google-Smtp-Source: ABdhPJwvYzl5MaUIZ2ARAdDQMTiYdlfoRyS1pvY1Az0U7VHaIlnyA2ud0VXw2QxY0oaAcdAKL9I7Xg==
X-Received: by 2002:a05:6512:3249:: with SMTP id c9mr697236lfr.216.1593400733792;
        Sun, 28 Jun 2020 20:18:53 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru. [79.139.237.54])
        by smtp.gmail.com with ESMTPSA id m1sm2383295ljg.60.2020.06.28.20.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2020 20:18:53 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mikko Perttunen <cyndis@kapsi.fi>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH v2 2/6] drm/tegra: gr2d: Add tiled PATBASE address register
Date:   Mon, 29 Jun 2020 06:18:38 +0300
Message-Id: <20200629031842.32463-3-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200629031842.32463-1-digetx@gmail.com>
References: <20200629031842.32463-1-digetx@gmail.com>
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


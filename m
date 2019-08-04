Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9BC8E80C66
	for <lists+linux-tegra@lfdr.de>; Sun,  4 Aug 2019 22:17:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726751AbfHDUR0 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 4 Aug 2019 16:17:26 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:34414 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726530AbfHDUR0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 4 Aug 2019 16:17:26 -0400
Received: by mail-lf1-f68.google.com with SMTP id b29so49115817lfq.1;
        Sun, 04 Aug 2019 13:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=s4/lZRelptHc104CnII3uRWlwirvAGTIUK7NUlarcVo=;
        b=hWmKbfmQQIVJxZRPfrherAkt3SNEI7zhPoih2CPXgPp9jEQCRH+yG/dl/c4qYD3qd5
         BQI3l70sYIQvQDJ9NIAS65Ozt5RyiuzKOYLtizitbR4GCGx+pB+ZedWJqT2vpMYOCLTp
         B5ECOtlrzZvDWx8KKENhQ9ldmy5PzoDHXyDkM7hz673pvh90w4XxURDWocdf0c8Y137Z
         SALN0A2sGAt6p2c2hcNPXagGlykyVJPMLdz2sy5ITY0lYhMstc5IOEAz5RiiBgYmiBvA
         10rXPPBW/fAA2pN/XyW63cSzbrBUTCCPu9UWF0Xyu2c4EqeaYded+97H70L3wbNH98Wb
         2yyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=s4/lZRelptHc104CnII3uRWlwirvAGTIUK7NUlarcVo=;
        b=ChMdXxlOr1b+GsWmKfUMVQ63+fni9hbB0y6gJsDZ8kre+jItwW4LFKdN38IXaD9cro
         +1g0NbjZKOYUCFdMbEd9TcJvYJD0jwnsq54eJCNuwhRaZbU2NeioIQE/BUs9m12YDQI1
         FkpCx17YLphngajC+vX65waKXVDsnLdVk2kPeUGg27COEw55mLPtrmL6KGEa76jkfDRW
         8FHRo99E3Am4iDtyBF0AXAHuCmdoSOW6pnzAMdK00Jk5ZhzHUmnyGmGW3GKJVcL9kRzY
         z/Xjijb1ck0DXpiPs1O1b7EkUnTnNvuoaATtwbbc5JbznghfnPF2z/foRo21XhOMAAv+
         FY+g==
X-Gm-Message-State: APjAAAWffAM6m8X/8DD5khFkj4KvrD3DekpWwQrw+kMCLfuWlcwT9o9w
        s45DjkO5eib92suXCYg6WWE=
X-Google-Smtp-Source: APXvYqxkQf3a/qXtHlYJbVGarQ0L/TPLy9TUhSmBsSYBja6fNZHhdSSpkgaaQyEfjze7v8D/ne+SQQ==
X-Received: by 2002:a19:6d02:: with SMTP id i2mr4308705lfc.191.1564949844127;
        Sun, 04 Aug 2019 13:17:24 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id p87sm16540794ljp.50.2019.08.04.13.17.22
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 04 Aug 2019 13:17:23 -0700 (PDT)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Alexios Zavras <alexios.zavras@intel.com>,
        Alison Wang <alison.wang@nxp.com>,
        Allison Randal <allison@lohutok.net>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Enrico Weigelt <info@metux.net>,
        Fabio Estevam <festevam@gmail.com>,
        Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Marek Vasut <marex@denx.de>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sam Ravnborg <sam@ravnborg.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sean Paul <sean@poorly.run>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vincent Abriou <vincent.abriou@st.com>
Subject: [PATCH v1 08/16] drm/sti: fix opencoded use of drm_panel_*
Date:   Sun,  4 Aug 2019 22:16:29 +0200
Message-Id: <20190804201637.1240-9-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190804201637.1240-1-sam@ravnborg.org>
References: <20190804201637.1240-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Use the drm_panel_(enable|disable|get_modes) functions.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Cc: Vincent Abriou <vincent.abriou@st.com>
---
 drivers/gpu/drm/sti/sti_dvo.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/sti/sti_dvo.c b/drivers/gpu/drm/sti/sti_dvo.c
index 9e6d5d8b7030..e55870190bf5 100644
--- a/drivers/gpu/drm/sti/sti_dvo.c
+++ b/drivers/gpu/drm/sti/sti_dvo.c
@@ -221,8 +221,7 @@ static void sti_dvo_disable(struct drm_bridge *bridge)
 
 	writel(0x00000000, dvo->regs + DVO_DOF_CFG);
 
-	if (dvo->panel)
-		dvo->panel->funcs->disable(dvo->panel);
+	drm_panel_disable(dvo->panel);
 
 	/* Disable/unprepare dvo clock */
 	clk_disable_unprepare(dvo->clk_pix);
@@ -262,8 +261,7 @@ static void sti_dvo_pre_enable(struct drm_bridge *bridge)
 	if (clk_prepare_enable(dvo->clk))
 		DRM_ERROR("Failed to prepare/enable dvo clk\n");
 
-	if (dvo->panel)
-		dvo->panel->funcs->enable(dvo->panel);
+	drm_panel_enable(dvo->panel);
 
 	/* Set LUT */
 	writel(config->lowbyte,  dvo->regs + DVO_LUT_PROG_LOW);
@@ -340,7 +338,7 @@ static int sti_dvo_connector_get_modes(struct drm_connector *connector)
 	struct sti_dvo *dvo = dvo_connector->dvo;
 
 	if (dvo->panel)
-		return dvo->panel->funcs->get_modes(dvo->panel);
+		return drm_panel_get_modes(dvo->panel);
 
 	return 0;
 }
-- 
2.20.1


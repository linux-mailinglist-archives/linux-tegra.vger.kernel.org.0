Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A043680C58
	for <lists+linux-tegra@lfdr.de>; Sun,  4 Aug 2019 22:17:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726694AbfHDURP (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 4 Aug 2019 16:17:15 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:44575 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726346AbfHDURP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 4 Aug 2019 16:17:15 -0400
Received: by mail-lj1-f193.google.com with SMTP id k18so77399444ljc.11;
        Sun, 04 Aug 2019 13:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OqhXxXwy9Hr3xWItmkC0WnCOZqEhN5kTgjtJyN6Z+CY=;
        b=NLLRFWKzJmEIu9OTOt7Ai8tctMWnGdjeyEFU+bfOuWd3AgIJwVV5bg33IJmsvBZup+
         JybThz+nVWyyLhyxpWRvRVqVGJqJtDYU59QsXSfu+zCyvbOcabGJOut4KqbsMVWxIH4Z
         tW+Tv7tICzEJDkmjcIBJSlRM1z6IOKUpkGKIAU/4Ybs703WZbR3nNjvMr3m+CkOHkc17
         Rb4XRehU55J1G+MqL6y4FTAHHomaoEOikxlyWWWJtnnFAqOmZ710XFHX0eWXQQL7lRT1
         f/jZm/vh9FmhUey+YmveVXZdx/reIWL8VTKKHRLpUUQZGISW6Eyybhr/rBDd1ODzkPPO
         8Y7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=OqhXxXwy9Hr3xWItmkC0WnCOZqEhN5kTgjtJyN6Z+CY=;
        b=hPnK8hMSEBmU5fOtMX0xrh4+xa+9yQcJPoYnhV+sYgG9nFmgGpxLZf+1yRftLdLUlc
         QqLm7m9aKB/6MhmKC5y6thlgTtmWqL/vhvILjBGPJhE+YSqmHX9Aig6j3mb3B5cW1wgr
         cwdhHxnqh/27hJQZ8OqdMLxwRNAciSNAV1TxwUWcV7NgcGvP9JYn4QTK9L6S7u28r72P
         QXfdP2vpQ1qbU3WzBdAh1qPqQxVbwL67adW33O8wr98cSoDvpmLYie5Aqo6WwOn6K8X1
         MVA2gB58L7TxF+1REKMAATIk7AjrQtokOnM+M6eTXSn4oFONk2q1heTIZIrwI9Fswpaj
         kfxw==
X-Gm-Message-State: APjAAAWwbXVk7RVuI2+fzyTzpySH+0ms5GsU5HZji8tj+urBBgS1nTSD
        it+FffqTsdXIGxXcMkUMRUI=
X-Google-Smtp-Source: APXvYqwr7YURU5x5uQX4eMotoB3lQEWzubIKRtOF0qGU+ymuvCnRLcgiy7sxe5BsFuWKIZGt+qJn3A==
X-Received: by 2002:a2e:86c3:: with SMTP id n3mr35048878ljj.129.1564949832447;
        Sun, 04 Aug 2019 13:17:12 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id p87sm16540794ljp.50.2019.08.04.13.17.10
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 04 Aug 2019 13:17:11 -0700 (PDT)
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
Subject: [PATCH v1 04/16] drm/imx: fix opencoded use of drm_panel_*
Date:   Sun,  4 Aug 2019 22:16:25 +0200
Message-Id: <20190804201637.1240-5-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190804201637.1240-1-sam@ravnborg.org>
References: <20190804201637.1240-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Use the drm_panel_get_modes() function to get the modes.

This patch leave one test for the function pointer:
    panel->funcs->get_modes

This is used to check if the panel may have any modes.
There is no direct replacement.
We may be able to just check that drm_panel_get_modes() return > 0,
but as this is not the same functionality it is left for later.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/imx/imx-ldb.c          | 11 ++++-------
 drivers/gpu/drm/imx/parallel-display.c | 11 ++++-------
 2 files changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/imx/imx-ldb.c b/drivers/gpu/drm/imx/imx-ldb.c
index db461b6a257f..695f307f36b2 100644
--- a/drivers/gpu/drm/imx/imx-ldb.c
+++ b/drivers/gpu/drm/imx/imx-ldb.c
@@ -124,14 +124,11 @@ static void imx_ldb_ch_set_bus_format(struct imx_ldb_channel *imx_ldb_ch,
 static int imx_ldb_connector_get_modes(struct drm_connector *connector)
 {
 	struct imx_ldb_channel *imx_ldb_ch = con_to_imx_ldb_ch(connector);
-	int num_modes = 0;
+	int num_modes;
 
-	if (imx_ldb_ch->panel && imx_ldb_ch->panel->funcs &&
-	    imx_ldb_ch->panel->funcs->get_modes) {
-		num_modes = imx_ldb_ch->panel->funcs->get_modes(imx_ldb_ch->panel);
-		if (num_modes > 0)
-			return num_modes;
-	}
+	num_modes = drm_panel_get_modes(imx_ldb_ch->panel);
+	if (num_modes > 0)
+		return num_modes;
 
 	if (!imx_ldb_ch->edid && imx_ldb_ch->ddc)
 		imx_ldb_ch->edid = drm_get_edid(connector, imx_ldb_ch->ddc);
diff --git a/drivers/gpu/drm/imx/parallel-display.c b/drivers/gpu/drm/imx/parallel-display.c
index 2e51b2fade75..e7ce17503ae1 100644
--- a/drivers/gpu/drm/imx/parallel-display.c
+++ b/drivers/gpu/drm/imx/parallel-display.c
@@ -47,14 +47,11 @@ static int imx_pd_connector_get_modes(struct drm_connector *connector)
 {
 	struct imx_parallel_display *imxpd = con_to_imxpd(connector);
 	struct device_node *np = imxpd->dev->of_node;
-	int num_modes = 0;
+	int num_modes;
 
-	if (imxpd->panel && imxpd->panel->funcs &&
-	    imxpd->panel->funcs->get_modes) {
-		num_modes = imxpd->panel->funcs->get_modes(imxpd->panel);
-		if (num_modes > 0)
-			return num_modes;
-	}
+	num_modes = drm_panel_get_modes(imxpd->panel);
+	if (num_modes > 0)
+		return num_modes;
 
 	if (imxpd->edid) {
 		drm_connector_update_edid_property(connector, imxpd->edid);
-- 
2.20.1


Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 511FC80C77
	for <lists+linux-tegra@lfdr.de>; Sun,  4 Aug 2019 22:17:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726771AbfHDURk (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 4 Aug 2019 16:17:40 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:41004 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726694AbfHDURk (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 4 Aug 2019 16:17:40 -0400
Received: by mail-lj1-f195.google.com with SMTP id d24so77414415ljg.8;
        Sun, 04 Aug 2019 13:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6MTU39yk5XE3/teu/iygu6ssiL/liUAav6Pm3DHBCYk=;
        b=ZA+/n3H1+MtW9kTQsOeyUTYBdS4nVqs91zmpewRJFA3g7GvGQHLzWjAjOA2KjxXx06
         We5wixz1fYGGRfl4QVFNMFUlpsCTWlYYKqEvsenMNEn+umCLTk9CVcDwep5AWL3nMklw
         BE0U06HBU0suEpm4nBPoJDfJhOJ3w9QwKz6jigew0xkksRe9L00eDSnEM71EoDfCTUPg
         7nrulAhNbAbTHY+edA4Z3Svw2nUDmxkVdABuSiEuGp6HMhZXFqmRCr1nFitHbmU1UlYG
         Zy65eNXTqN6bZkutzJV1YvC+78T9mG4fIKkroPYupOV3oH41jdymZWNkxjqAGh2S3boz
         c+IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=6MTU39yk5XE3/teu/iygu6ssiL/liUAav6Pm3DHBCYk=;
        b=j049xFF6c9P4JAGfPjBKwj1leOmWZSXFrR9/zJ8MpVzzNZjL8bDBSJcMkMAVG9AdhA
         0qHd577Mf8CbUIDsdwrYTKH4rQ+DOgHlhpNb9ogV14Ne+XHxXuUhFADTwCvAEaLdRKMq
         4iaWb+Jf/soRB3GTLoyP1Ay7GEhC230C8QOLR34FjhLjZdb/S9CoJEp/ulq2jN+C4Jen
         GKojuMD7D6HJOlcMp0mAxwDyGIUqcfCczIsnAXS7fu+n1hWBfcZGQke0M57eiPQ6xG1K
         MEU5BsSwOS2dZyJ8vt0i3JAHHm22q/UZSyuNGBA8nNa5N9BNNwnznCbuKcLx/TZnoI+H
         Gl/w==
X-Gm-Message-State: APjAAAWasMQmbDXIQk718LP+1I5rKt2Cp/8dNW2pB6sCJjBUkAOl16QE
        xc0JQtOPvyaoXD/Yv6GaKqI=
X-Google-Smtp-Source: APXvYqx8atks2YbWr9RifkxwlrpCrnQ0MuWxB3GhHudkPh8VHtkqm1B+XsEC8X6Ec2DIcd1SBSKPlQ==
X-Received: by 2002:a2e:9a58:: with SMTP id k24mr76690634ljj.165.1564949857549;
        Sun, 04 Aug 2019 13:17:37 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id p87sm16540794ljp.50.2019.08.04.13.17.35
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 04 Aug 2019 13:17:37 -0700 (PDT)
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
Subject: [PATCH v1 13/16] drm/panel: drop return code from drm_panel_detach()
Date:   Sun,  4 Aug 2019 22:16:34 +0200
Message-Id: <20190804201637.1240-14-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190804201637.1240-1-sam@ravnborg.org>
References: <20190804201637.1240-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

There are no errors that can be reported by this function,
so drop the return code.
Fix the only bridge driver that checked the return result.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 3 +--
 drivers/gpu/drm/drm_panel.c                        | 6 +-----
 include/drm/drm_panel.h                            | 2 +-
 3 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index f2f7f69d6cc3..22885dceaa17 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1780,8 +1780,7 @@ void analogix_dp_unbind(struct analogix_dp_device *dp)
 	if (dp->plat_data->panel) {
 		if (drm_panel_unprepare(dp->plat_data->panel))
 			DRM_ERROR("failed to turnoff the panel\n");
-		if (drm_panel_detach(dp->plat_data->panel))
-			DRM_ERROR("failed to detach the panel\n");
+		drm_panel_detach(dp->plat_data->panel);
 	}
 
 	drm_dp_aux_unregister(&dp->aux);
diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index 9946b8d9bacc..da19d5b4a2f4 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -219,15 +219,11 @@ EXPORT_SYMBOL(drm_panel_attach);
  *
  * This function should not be called by the panel device itself. It
  * is only for the drm device that called drm_panel_attach().
- *
- * Return: 0 on success or a negative error code on failure.
  */
-int drm_panel_detach(struct drm_panel *panel)
+void drm_panel_detach(struct drm_panel *panel)
 {
 	panel->connector = NULL;
 	panel->drm = NULL;
-
-	return 0;
 }
 EXPORT_SYMBOL(drm_panel_detach);
 
diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index 5e62deea49ba..624bd15ecfab 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -153,7 +153,7 @@ int drm_panel_add(struct drm_panel *panel);
 void drm_panel_remove(struct drm_panel *panel);
 
 int drm_panel_attach(struct drm_panel *panel, struct drm_connector *connector);
-int drm_panel_detach(struct drm_panel *panel);
+void drm_panel_detach(struct drm_panel *panel);
 
 int drm_panel_prepare(struct drm_panel *panel);
 int drm_panel_unprepare(struct drm_panel *panel);
-- 
2.20.1


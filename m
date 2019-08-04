Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F74480C72
	for <lists+linux-tegra@lfdr.de>; Sun,  4 Aug 2019 22:17:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726530AbfHDURi (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 4 Aug 2019 16:17:38 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:34424 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726694AbfHDURh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 4 Aug 2019 16:17:37 -0400
Received: by mail-lj1-f195.google.com with SMTP id p17so77443410ljg.1;
        Sun, 04 Aug 2019 13:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TFw8aj8TVKqYV1qdWp7H7PSv0EjnAL5XrV9yT7wyYzI=;
        b=rwd7igj5BUr8/KxH5fDWHXDr9Bb3jwowv9EXwDKoBAF6i6RKSOD2641bxv40d1HHKN
         90PRk5+MErpunsqUa+ibcmpfyC1UfMifTvwajUbZ8ZqHuCMYFJKBBAjwFBo2W68OzUai
         G53Jvo1D5DDJzo+gKXvmakpxb/DH5/PhMw8aEahnixPu/po32d3aI+NDSSadM47kTbM/
         lqjP4OcW0y9Bk1NfPNwspN6J3RHQ7WY7F72jJQW2++3tGl6ZnUz3D5o0HtacBnaewCu6
         3kXeiK7YR5BoUUssAQyLfTo21VXL0dOrPgDks3dsZ86AAQ5AoD6rN4Cu2hcIz7NKG/Ie
         NLxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=TFw8aj8TVKqYV1qdWp7H7PSv0EjnAL5XrV9yT7wyYzI=;
        b=SivAnziYJhBT8b6yxv5ceYqWVuF/MFbHFHumLqS2uN2q2qEJYDfVIyHOHOpxr3m0hq
         +yEDKf9bFfMV6Z+LMM3+C4MgkQoVmMwi+GvVS+LTfVJomcmrfdwende083t9Q0/JnThL
         DMfzkdlzVJp9FoPft1EkMLAo6t4TWTEpJOOp2Y843OdSZiqH2NzM5wjvyC8x1Xt3czOk
         fi52f4S7305IFmr1QKLsoo0r725GkajMiWGp//+1dHv35qpMlxwgDaYTjS3/CL9wW0If
         j5Zv9fvG9Ltiwkii7dfXxzRqAJU5smaKHdk4op7G6F0qzj/tTuD2wfHSXooiLlUidwFJ
         9h7w==
X-Gm-Message-State: APjAAAUfael3Pi68OSl3vsj+XMPltU3QIgAHVnzkoG6l1VP2gRgg6njG
        OwSmgpaQHOfACPNpHaOLfxU=
X-Google-Smtp-Source: APXvYqyoAufw1JJb+gisc/+GrH+nZNn6Oe74hLjpr94kfXr5VFnqYqHplX0Q3NQsQ1CxOz1UwLnarA==
X-Received: by 2002:a2e:b0ea:: with SMTP id h10mr31006790ljl.50.1564949855034;
        Sun, 04 Aug 2019 13:17:35 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id p87sm16540794ljp.50.2019.08.04.13.17.32
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 04 Aug 2019 13:17:34 -0700 (PDT)
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
Subject: [PATCH v1 12/16] drm/panel: use inline comments in drm_panel.h
Date:   Sun,  4 Aug 2019 22:16:33 +0200
Message-Id: <20190804201637.1240-13-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190804201637.1240-1-sam@ravnborg.org>
References: <20190804201637.1240-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Inline comments provide better space for additional comments.
Comments was slightly edited to follow the normal style,
but no change to actual content.
Used the opportuniy to change the order in drm_panel_funcs
to follow the order they will be used by a panel.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 include/drm/drm_panel.h | 82 +++++++++++++++++++++++++++++++++--------
 1 file changed, 66 insertions(+), 16 deletions(-)

diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index 053d611656b9..5e62deea49ba 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -36,14 +36,6 @@ struct display_timing;
 
 /**
  * struct drm_panel_funcs - perform operations on a given panel
- * @disable: disable panel (turn off back light, etc.)
- * @unprepare: turn off panel
- * @prepare: turn on panel and perform set up
- * @enable: enable panel (turn on back light, etc.)
- * @get_modes: add modes to the connector that the panel is attached to and
- * return the number of modes added
- * @get_timings: copy display timings into the provided array and return
- * the number of display timings available
  *
  * The .prepare() function is typically called before the display controller
  * starts to transmit video data. Panel drivers can use this to turn the panel
@@ -69,31 +61,89 @@ struct display_timing;
  * the panel. This is the job of the .unprepare() function.
  */
 struct drm_panel_funcs {
-	int (*disable)(struct drm_panel *panel);
-	int (*unprepare)(struct drm_panel *panel);
+	/**
+	 * @prepare:
+	 *
+	 * Turn on panel and perform set up.
+	 */
 	int (*prepare)(struct drm_panel *panel);
+
+	/**
+	 * @enable:
+	 *
+	 * Enable panel (turn on back light, etc.).
+	 */
 	int (*enable)(struct drm_panel *panel);
+
+	/**
+	 * @disable:
+	 *
+	 * Disable panel (turn off back light, etc.).
+	 */
+	int (*disable)(struct drm_panel *panel);
+
+	/**
+	 * @unprepare:
+	 *
+	 * Turn off panel.
+	 */
+	int (*unprepare)(struct drm_panel *panel);
+
+	/**
+	 * @get_modes:
+	 *
+	 * Add modes to the connector that the panel is attached to and
+	 * return the number of modes added.
+	 */
 	int (*get_modes)(struct drm_panel *panel);
+
+	/**
+	 * @get_timings:
+	 *
+	 * Copy display timings into the provided array and return
+	 * the number of display timings available.
+	 */
 	int (*get_timings)(struct drm_panel *panel, unsigned int num_timings,
 			   struct display_timing *timings);
 };
 
 /**
  * struct drm_panel - DRM panel object
- * @drm: DRM device owning the panel
- * @connector: DRM connector that the panel is attached to
- * @dev: parent device of the panel
- * @link: link from panel device (supplier) to DRM device (consumer)
- * @funcs: operations that can be performed on the panel
- * @list: panel entry in registry
  */
 struct drm_panel {
+	/**
+	 * @drm:
+	 *
+	 * DRM device owning the panel.
+	 */
 	struct drm_device *drm;
+
+	/**
+	 * @connector:
+	 *
+	 * DRM connector that the panel is attached to.
+	 */
 	struct drm_connector *connector;
+
+	/**
+	 * @dev:
+	 *
+	 * Parent device of the panel.
+	 */
 	struct device *dev;
 
+	/**
+	 * @funcs:
+	 *
+	 * Operations that can be performed on the panel.
+	 */
 	const struct drm_panel_funcs *funcs;
 
+	/**
+	 * @list:
+	 *
+	 * Panel entry in registry.
+	 */
 	struct list_head list;
 };
 
-- 
2.20.1


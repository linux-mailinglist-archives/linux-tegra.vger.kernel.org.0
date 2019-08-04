Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C6EC80C70
	for <lists+linux-tegra@lfdr.de>; Sun,  4 Aug 2019 22:17:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726761AbfHDURg (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 4 Aug 2019 16:17:36 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:42648 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726530AbfHDURg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 4 Aug 2019 16:17:36 -0400
Received: by mail-lf1-f67.google.com with SMTP id s19so56360952lfb.9;
        Sun, 04 Aug 2019 13:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zmDbQLWBPvdGtXiOhDaz/7hniPxt2/VRvQ2x7qHXkvc=;
        b=s4IADMOVf42u/6pqR78DZ9tNZGLzQlKpBIxSAXOvRnryRasEKiiKhE/sD9hrmH7nBj
         JFJsiv5xTkl/5pz0rv6qPLrZCwTDZf76EG7w8vGPr1gJbZwrC4zoo9p4n/Hm3IoVNHqI
         2bdtyQxrCXrwR0e2w3jKP0lcbaM+wwjULdRjn08W4mHfuSaraJHdkDagW9NDw8nBLypm
         ZWAI5gRs6Pm/E0kZDsBChhztPTxMo5J4a1bOBoMBQ51NlUnvfNDDB4FaD8s9Z9hCGTVU
         UBiSl3rDoJ72Lg4KsXLS6c0WqjHuSkzHl1QmJN+QM5bKEMv66d1DVQipSbeY5aPhJzYN
         Fg5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=zmDbQLWBPvdGtXiOhDaz/7hniPxt2/VRvQ2x7qHXkvc=;
        b=kv/2/uOwwmjml4oM9Bol6gwjBofnDu5X5+3G/l5jC/fVpEW7srcPZDvAWSUcxPvMNK
         wTw0Ei2Tq0s/CcqcgtMTjh+xoa8yYfNDRfn3k4n0lI160aCMasGDsn77eDptb8uIzxGW
         K4TwAtC3R6s+D/6lYm+w4LEBzRVTNoh/XfEreKBAYl9kY7XO9F5P5qxaG8RztTBBOlXd
         JCbkt7dPrYeDSMmm1YoFw3LurTRlMQMoQ485j4rcSrqEiuJpE7cklj4iHqTNO4bIi3r+
         4IwO+T5JbosdAzMsF+1MhG7EfMNF7l8yS2rDUt+6r2Z/vFOT9cBvPONad9UePEby8PlT
         ZRKQ==
X-Gm-Message-State: APjAAAXnDG5w31j5q9BfvEHLmItX1Fdg9NTIcaWxJETRp4AUn5fAz+Jm
        NUTxn0j3AUoZwVXiMNfy+Vs=
X-Google-Smtp-Source: APXvYqwXoeBAY2sI3ofQs6dNYkdTExTgHsLqUwkyioR39Y08/hYP6aps6+rfkCuVvgbQUKdUpdZ9Dw==
X-Received: by 2002:a19:8c08:: with SMTP id o8mr68661177lfd.57.1564949852351;
        Sun, 04 Aug 2019 13:17:32 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id p87sm16540794ljp.50.2019.08.04.13.17.30
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 04 Aug 2019 13:17:31 -0700 (PDT)
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
Subject: [PATCH v1 11/16] drm/panel: move drm_panel functions to .c file
Date:   Sun,  4 Aug 2019 22:16:32 +0200
Message-Id: <20190804201637.1240-12-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190804201637.1240-1-sam@ravnborg.org>
References: <20190804201637.1240-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Move inline functions from include/drm/drm_panel.h to drm_panel.c.
This is in preparation for follow-up patches that will add extra
logic to the functions.
As they are no longer static inline, EXPORT them.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/drm_panel.c | 96 +++++++++++++++++++++++++++++++++++
 include/drm/drm_panel.h     | 99 +++----------------------------------
 2 files changed, 104 insertions(+), 91 deletions(-)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index dbd5b873e8f2..9946b8d9bacc 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -54,6 +54,102 @@ void drm_panel_init(struct drm_panel *panel)
 }
 EXPORT_SYMBOL(drm_panel_init);
 
+/**
+ * drm_panel_prepare - power on a panel
+ * @panel: DRM panel
+ *
+ * Calling this function will enable power and deassert any reset signals to
+ * the panel. After this has completed it is possible to communicate with any
+ * integrated circuitry via a command bus.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int drm_panel_prepare(struct drm_panel *panel)
+{
+	if (panel && panel->funcs && panel->funcs->prepare)
+		return panel->funcs->prepare(panel);
+
+	return panel ? -ENOSYS : -EINVAL;
+}
+EXPORT_SYMBOL(drm_panel_prepare);
+
+/**
+ * drm_panel_enable - enable a panel
+ * @panel: DRM panel
+ *
+ * Calling this function will cause the panel display drivers to be turned on
+ * and the backlight to be enabled. Content will be visible on screen after
+ * this call completes.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int drm_panel_enable(struct drm_panel *panel)
+{
+	if (panel && panel->funcs && panel->funcs->enable)
+		return panel->funcs->enable(panel);
+
+	return panel ? -ENOSYS : -EINVAL;
+}
+EXPORT_SYMBOL(drm_panel_enable);
+
+/**
+ * drm_panel_disable - disable a panel
+ * @panel: DRM panel
+ *
+ * This will typically turn off the panel's backlight or disable the display
+ * drivers. For smart panels it should still be possible to communicate with
+ * the integrated circuitry via any command bus after this call.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int drm_panel_disable(struct drm_panel *panel)
+{
+	if (panel && panel->funcs && panel->funcs->disable)
+		return panel->funcs->disable(panel);
+
+	return panel ? -ENOSYS : -EINVAL;
+}
+EXPORT_SYMBOL(drm_panel_disable);
+
+/**
+ * drm_panel_unprepare - power off a panel
+ * @panel: DRM panel
+ *
+ * Calling this function will completely power off a panel (assert the panel's
+ * reset, turn off power supplies, ...). After this function has completed, it
+ * is usually no longer possible to communicate with the panel until another
+ * call to drm_panel_prepare().
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int drm_panel_unprepare(struct drm_panel *panel)
+{
+	if (panel && panel->funcs && panel->funcs->unprepare)
+		return panel->funcs->unprepare(panel);
+
+	return panel ? -ENOSYS : -EINVAL;
+}
+EXPORT_SYMBOL(drm_panel_unprepare);
+
+/**
+ * drm_panel_get_modes - probe the available display modes of a panel
+ * @panel: DRM panel
+ *
+ * The modes probed from the panel are automatically added to the connector
+ * that the panel is attached to.
+ *
+ * Return: The number of modes available from the panel on success or a
+ * negative error code on failure.
+ */
+int drm_panel_get_modes(struct drm_panel *panel)
+{
+	if (panel && panel->funcs && panel->funcs->get_modes)
+		return panel->funcs->get_modes(panel);
+
+	return panel ? -ENOSYS : -EINVAL;
+}
+EXPORT_SYMBOL(drm_panel_get_modes);
+
 /**
  * drm_panel_add - add a panel to the global registry
  * @panel: panel to add
diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index 26377836141c..053d611656b9 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -97,97 +97,6 @@ struct drm_panel {
 	struct list_head list;
 };
 
-/**
- * drm_disable_unprepare - power off a panel
- * @panel: DRM panel
- *
- * Calling this function will completely power off a panel (assert the panel's
- * reset, turn off power supplies, ...). After this function has completed, it
- * is usually no longer possible to communicate with the panel until another
- * call to drm_panel_prepare().
- *
- * Return: 0 on success or a negative error code on failure.
- */
-static inline int drm_panel_unprepare(struct drm_panel *panel)
-{
-	if (panel && panel->funcs && panel->funcs->unprepare)
-		return panel->funcs->unprepare(panel);
-
-	return panel ? -ENOSYS : -EINVAL;
-}
-
-/**
- * drm_panel_disable - disable a panel
- * @panel: DRM panel
- *
- * This will typically turn off the panel's backlight or disable the display
- * drivers. For smart panels it should still be possible to communicate with
- * the integrated circuitry via any command bus after this call.
- *
- * Return: 0 on success or a negative error code on failure.
- */
-static inline int drm_panel_disable(struct drm_panel *panel)
-{
-	if (panel && panel->funcs && panel->funcs->disable)
-		return panel->funcs->disable(panel);
-
-	return panel ? -ENOSYS : -EINVAL;
-}
-
-/**
- * drm_panel_prepare - power on a panel
- * @panel: DRM panel
- *
- * Calling this function will enable power and deassert any reset signals to
- * the panel. After this has completed it is possible to communicate with any
- * integrated circuitry via a command bus.
- *
- * Return: 0 on success or a negative error code on failure.
- */
-static inline int drm_panel_prepare(struct drm_panel *panel)
-{
-	if (panel && panel->funcs && panel->funcs->prepare)
-		return panel->funcs->prepare(panel);
-
-	return panel ? -ENOSYS : -EINVAL;
-}
-
-/**
- * drm_panel_enable - enable a panel
- * @panel: DRM panel
- *
- * Calling this function will cause the panel display drivers to be turned on
- * and the backlight to be enabled. Content will be visible on screen after
- * this call completes.
- *
- * Return: 0 on success or a negative error code on failure.
- */
-static inline int drm_panel_enable(struct drm_panel *panel)
-{
-	if (panel && panel->funcs && panel->funcs->enable)
-		return panel->funcs->enable(panel);
-
-	return panel ? -ENOSYS : -EINVAL;
-}
-
-/**
- * drm_panel_get_modes - probe the available display modes of a panel
- * @panel: DRM panel
- *
- * The modes probed from the panel are automatically added to the connector
- * that the panel is attached to.
- *
- * Return: The number of modes available from the panel on success or a
- * negative error code on failure.
- */
-static inline int drm_panel_get_modes(struct drm_panel *panel)
-{
-	if (panel && panel->funcs && panel->funcs->get_modes)
-		return panel->funcs->get_modes(panel);
-
-	return panel ? -ENOSYS : -EINVAL;
-}
-
 void drm_panel_init(struct drm_panel *panel);
 
 int drm_panel_add(struct drm_panel *panel);
@@ -196,6 +105,14 @@ void drm_panel_remove(struct drm_panel *panel);
 int drm_panel_attach(struct drm_panel *panel, struct drm_connector *connector);
 int drm_panel_detach(struct drm_panel *panel);
 
+int drm_panel_prepare(struct drm_panel *panel);
+int drm_panel_unprepare(struct drm_panel *panel);
+
+int drm_panel_enable(struct drm_panel *panel);
+int drm_panel_disable(struct drm_panel *panel);
+
+int drm_panel_get_modes(struct drm_panel *panel);
+
 #if defined(CONFIG_OF) && defined(CONFIG_DRM_PANEL)
 struct drm_panel *of_drm_find_panel(const struct device_node *np);
 #else
-- 
2.20.1


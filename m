Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5516A80C79
	for <lists+linux-tegra@lfdr.de>; Sun,  4 Aug 2019 22:17:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726780AbfHDURn (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 4 Aug 2019 16:17:43 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:43227 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726694AbfHDURm (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 4 Aug 2019 16:17:42 -0400
Received: by mail-lj1-f196.google.com with SMTP id y17so52880882ljk.10;
        Sun, 04 Aug 2019 13:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hrCo/4/IXJ1Yj7iZxjXNzvDGpEFw4E2sYzii2ko4Lpc=;
        b=H21lvLH6tpUmdeSL+ZX13j4skteYo8F27F85lXg12JKWPkHdL9eQI/B0aLzSqteuZF
         JyDo1GkMya2KG2lCA+5ozRHKZoM8bI0aMUsUg5BtlHAYP91P4BmM0zzLa4mWzMlSnA7I
         qyT/LzC1eJL/P11buVSMfZh7ZhWipjYNxIRhgMf4ylvnGbNNefyfl7yHxVBGN2ZHpQ22
         gUEEURWNc9F1uLD9qoAxlTK9z2PhqI2SkEfqyfuaRea3WQ1BR88k6Hn6mhvY6MQmx/oD
         Xi16syJcz/Ah5wLJDfB/ZZj2FJP5FKD8/fQopj0w00bxP4/2GIq+x6Nwr2fkLDpTy4ym
         dl6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=hrCo/4/IXJ1Yj7iZxjXNzvDGpEFw4E2sYzii2ko4Lpc=;
        b=Xw3ifewX3pEwXtplEt07ZbUDgOZCrZoHvoH36RBmtn0aJYJaLLJ4LNKRS7pbDn3yll
         N3pDoDjZpHumOv24Zo/lIDq+jGsbscRF3n6k27HFlUg5jJBNyLbT5u6LmiutNpWR41pW
         eE14aIMv7JOE6NFNbRd1sdtU/dQUs9rMgn8QHy9bj7D/qtWYFH7ErJPzyT1ean0qetXS
         9UfDmFmav7yU3pAvtGISImEj1wVbd9lGjJvXgYehQ4gpTjiFW/zoC+2ZzawvcyIwx5f8
         BWmH8WmV35l8/I175GnzgQitKcOqDlLLTAiAkluDsbpOT9xqXAzdaedr6ACZXgiTdT8G
         RW+A==
X-Gm-Message-State: APjAAAVdI8f2NqZv+yvA6JJ52BjzkRqYOFJIsFcktY042IGgpClLXmN/
        0hTz2IKycJfcd8gekO0hZmE=
X-Google-Smtp-Source: APXvYqyTjMcUeH7cKtM9ez8brS0M2L7PogMF1Pn26x5fiPtQY2s/TzFZyoXXnejWHprywDHCWV88IA==
X-Received: by 2002:a2e:9213:: with SMTP id k19mr73854900ljg.237.1564949860364;
        Sun, 04 Aug 2019 13:17:40 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id p87sm16540794ljp.50.2019.08.04.13.17.38
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 04 Aug 2019 13:17:39 -0700 (PDT)
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
Subject: [PATCH v1 14/16] drm/panel: call prepare/enable only once
Date:   Sun,  4 Aug 2019 22:16:35 +0200
Message-Id: <20190804201637.1240-15-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190804201637.1240-1-sam@ravnborg.org>
References: <20190804201637.1240-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Many panel drivers duplicate logic to prevent prepare to be called
for a panel that is already prepared.
Likewise for enable.

Implement this logic in drm_panel so the individual drivers
no longer needs this.
A panel is considered prepared/enabled only if the prepare/enable call
succeeds.
For disable/unprepare it is unconditionally considered
disabled/unprepared.

This allows calls to prepare/enable again, even if there were
some issue disabling a regulator or similar during disable/unprepare.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/drm_panel.c | 66 ++++++++++++++++++++++++++++++-------
 include/drm/drm_panel.h     | 21 ++++++++++++
 2 files changed, 75 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index da19d5b4a2f4..0853764040de 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -66,10 +66,21 @@ EXPORT_SYMBOL(drm_panel_init);
  */
 int drm_panel_prepare(struct drm_panel *panel)
 {
-	if (panel && panel->funcs && panel->funcs->prepare)
-		return panel->funcs->prepare(panel);
+	int ret = -ENOSYS;
 
-	return panel ? -ENOSYS : -EINVAL;
+	if (!panel)
+		return -EINVAL;
+
+	if (panel->prepared)
+		return 0;
+
+	if (panel->funcs && panel->funcs->prepare)
+		ret = panel->funcs->prepare(panel);
+
+	if (ret >= 0)
+		panel->prepared = true;
+
+	return ret;
 }
 EXPORT_SYMBOL(drm_panel_prepare);
 
@@ -85,10 +96,21 @@ EXPORT_SYMBOL(drm_panel_prepare);
  */
 int drm_panel_enable(struct drm_panel *panel)
 {
-	if (panel && panel->funcs && panel->funcs->enable)
-		return panel->funcs->enable(panel);
+	int ret = -ENOSYS;
 
-	return panel ? -ENOSYS : -EINVAL;
+	if (!panel)
+		return -EINVAL;
+
+	if (panel->enabled)
+		return 0;
+
+	if (panel->funcs && panel->funcs->enable)
+		ret = panel->funcs->enable(panel);
+
+	if (ret >= 0)
+		panel->enabled = true;
+
+	return ret;
 }
 EXPORT_SYMBOL(drm_panel_enable);
 
@@ -104,10 +126,20 @@ EXPORT_SYMBOL(drm_panel_enable);
  */
 int drm_panel_disable(struct drm_panel *panel)
 {
-	if (panel && panel->funcs && panel->funcs->disable)
-		return panel->funcs->disable(panel);
+	int ret = -ENOSYS;
 
-	return panel ? -ENOSYS : -EINVAL;
+	if (!panel)
+		return -EINVAL;
+
+	if (!panel->enabled)
+		return 0;
+
+	if (panel->funcs && panel->funcs->disable)
+		ret = panel->funcs->disable(panel);
+
+	panel->enabled = false;
+
+	return ret;
 }
 EXPORT_SYMBOL(drm_panel_disable);
 
@@ -124,10 +156,20 @@ EXPORT_SYMBOL(drm_panel_disable);
  */
 int drm_panel_unprepare(struct drm_panel *panel)
 {
-	if (panel && panel->funcs && panel->funcs->unprepare)
-		return panel->funcs->unprepare(panel);
+	int ret = -ENOSYS;
 
-	return panel ? -ENOSYS : -EINVAL;
+	if (!panel)
+		return -EINVAL;
+
+	if (!panel->prepared)
+		return 0;
+
+	if (panel->funcs && panel->funcs->unprepare)
+		ret = panel->funcs->unprepare(panel);
+
+	panel->prepared = false;
+
+	return ret;
 }
 EXPORT_SYMBOL(drm_panel_unprepare);
 
diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index 624bd15ecfab..7493500fc9bd 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -65,6 +65,9 @@ struct drm_panel_funcs {
 	 * @prepare:
 	 *
 	 * Turn on panel and perform set up.
+	 * When the panel is successfully prepared the prepare() function
+	 * will not be called again until the panel has been unprepared.
+	 *
 	 */
 	int (*prepare)(struct drm_panel *panel);
 
@@ -72,6 +75,8 @@ struct drm_panel_funcs {
 	 * @enable:
 	 *
 	 * Enable panel (turn on back light, etc.).
+	 * When the panel is successfully enabled the enable() function
+	 * will not be called again until the panel has been disabled.
 	 */
 	int (*enable)(struct drm_panel *panel);
 
@@ -79,6 +84,7 @@ struct drm_panel_funcs {
 	 * @disable:
 	 *
 	 * Disable panel (turn off back light, etc.).
+	 * If the panel is already disabled the disable() function is not called.
 	 */
 	int (*disable)(struct drm_panel *panel);
 
@@ -86,6 +92,7 @@ struct drm_panel_funcs {
 	 * @unprepare:
 	 *
 	 * Turn off panel.
+	 * If the panel is already unprepared the unprepare() function is not called.
 	 */
 	int (*unprepare)(struct drm_panel *panel);
 
@@ -145,6 +152,20 @@ struct drm_panel {
 	 * Panel entry in registry.
 	 */
 	struct list_head list;
+
+	/**
+	 * @prepared:
+	 *
+	 * Set to true when the panel is successfully prepared.
+	 */
+	bool prepared;
+
+	/**
+	 * @enabled:
+	 *
+	 * Set to true when the panel is successfully enabled.
+	 */
+	bool enabled;
 };
 
 void drm_panel_init(struct drm_panel *panel);
-- 
2.20.1


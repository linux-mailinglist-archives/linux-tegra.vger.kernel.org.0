Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 039A580C7D
	for <lists+linux-tegra@lfdr.de>; Sun,  4 Aug 2019 22:17:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726587AbfHDURq (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 4 Aug 2019 16:17:46 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:33024 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726694AbfHDURq (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 4 Aug 2019 16:17:46 -0400
Received: by mail-lf1-f66.google.com with SMTP id x3so56460025lfc.0;
        Sun, 04 Aug 2019 13:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aobqP46odx3tunBAtyyrec00lPA6Ep/KC6NYpNeo17U=;
        b=SFyUwEVzQiN+6Jh9U4W+Ou+eODKjyMW+KpMuYRXjME46CmaH8aJsl/dRMIn9p2zWZO
         G8C9gUmunvvNAfQnltvpwvvr6SZKIBTXon/9pdHoYF2OEAzg4X0T7udsIbCPJZOJcMaK
         bF7VAH94hYH9HecpdWX9NjSM2fOUXMY4DPHYOXKH4dCA1oQVpxwV9gghaBGzSrUJGnCf
         gnWSfFzy8l0vUQExN4iXCesBUcBGkrx41lBJ9v6i6fEVRhrOLfUtHJOvNoWinLnBY6Yd
         cJ8A0XDKQ6zvW2868e4DsxOCHxTkdTI4F7DukDhV0NOo+sRz6pV/i5BymdeavxXTvWwJ
         XOag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=aobqP46odx3tunBAtyyrec00lPA6Ep/KC6NYpNeo17U=;
        b=a7aM14LeH9YEAA602efTyPr3IsbCMz0P2vLgP3qsDS84BrttSl3boynELeOJgPlFv2
         N8JUQqf5Kal6eCblvxualxLO6ZXkE1TTNowN10p12mHFwvUp6bhDrOsYf+Nku7XjCyD6
         d7D7sJdPbD0bR0UrqNy/Pp3+npQGo24X59+byHbdJ2aaohkBWd4FpU5i3X5JhauPj7rI
         zTBHAlRQMW8O+bVDYXM92BSzcoRD0FyCyizDRFFiQv9MT49p2FOxxwDLaNpOjHZB9ZG1
         +djx6LsdH5hbEBhITj7TFp6PpJriD3lOOvBJqsIlv47wlwkg/dBd91VPp5saV7K9P5ms
         L5vA==
X-Gm-Message-State: APjAAAVgs0wSmpoQpxOFttPhZ8ZKbHWc9v5HglRR/rojSM5QXoOwL2dr
        ixVN8P0X3+9JWh7e5vUFwvs=
X-Google-Smtp-Source: APXvYqzTqaOH/E4yWYEObO2R5wACA7U9nuaIZddLKnxycMIdLIM6Ra7WWa7AU5/RHuBYEwNpuEELQA==
X-Received: by 2002:ac2:4289:: with SMTP id m9mr5299981lfh.49.1564949863271;
        Sun, 04 Aug 2019 13:17:43 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id p87sm16540794ljp.50.2019.08.04.13.17.41
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 04 Aug 2019 13:17:42 -0700 (PDT)
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
Subject: [PATCH v1 15/16] drm/panel: add backlight support
Date:   Sun,  4 Aug 2019 22:16:36 +0200
Message-Id: <20190804201637.1240-16-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190804201637.1240-1-sam@ravnborg.org>
References: <20190804201637.1240-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Panels often supports backlight as specified in a device tree.
Update the drm_panel infrastructure to support this to
simplify the drivers.

With this the panel driver just needs to add the following to the
probe() function:

    err = drm_panel_of_backlight(panel);
    if (err)
            return err;

Then drm_panel will handle all the rest.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/drm_panel.c | 41 +++++++++++++++++++++++++++++++++++++
 include/drm/drm_panel.h     | 23 +++++++++++++++++++++
 2 files changed, 64 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index 0853764040de..d8139674b883 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -21,6 +21,7 @@
  * DEALINGS IN THE SOFTWARE.
  */
 
+#include <linux/backlight.h>
 #include <linux/err.h>
 #include <linux/module.h>
 
@@ -110,6 +111,7 @@ int drm_panel_enable(struct drm_panel *panel)
 	if (ret >= 0)
 		panel->enabled = true;
 
+	backlight_enable(panel->backlight);
 	return ret;
 }
 EXPORT_SYMBOL(drm_panel_enable);
@@ -134,6 +136,8 @@ int drm_panel_disable(struct drm_panel *panel)
 	if (!panel->enabled)
 		return 0;
 
+	backlight_disable(panel->backlight);
+
 	if (panel->funcs && panel->funcs->disable)
 		ret = panel->funcs->disable(panel);
 
@@ -308,6 +312,43 @@ struct drm_panel *of_drm_find_panel(const struct device_node *np)
 EXPORT_SYMBOL(of_drm_find_panel);
 #endif
 
+#ifdef CONFIG_BACKLIGHT_CLASS_DEVICE
+/**
+ * drm_panel_of_backlight - use backlight device node for backlight
+ * @panel: DRM panel
+ *
+ * Use this function to enable backlight handling if your panel
+ * uses device tree and has a backlight handle.
+ *
+ * When panel is enabled backlight will be enabled after a
+ * successfull call to &drm_panel_funcs.enable()
+ *
+ * When panel is disabled backlight will be disabled before the
+ * call to &drm_panel_funcs.disable().
+ *
+ * A typical implementation for a panel driver supporting device tree
+ * will call this function and then backlight just works.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int drm_panel_of_backlight(struct drm_panel *panel)
+{
+	struct backlight_device *backlight;
+
+	if (!panel || !panel->dev)
+		return -EINVAL;
+
+	backlight = devm_of_find_backlight(panel->dev);
+
+	if (IS_ERR(backlight))
+                return PTR_ERR(backlight);
+
+	panel->backlight = backlight;
+	return 0;
+}
+EXPORT_SYMBOL(drm_panel_of_backlight);
+#endif
+
 MODULE_AUTHOR("Thierry Reding <treding@nvidia.com>");
 MODULE_DESCRIPTION("DRM panel infrastructure");
 MODULE_LICENSE("GPL and additional rights");
diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index 7493500fc9bd..31349c2393b7 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -28,6 +28,7 @@
 #include <linux/errno.h>
 #include <linux/list.h>
 
+struct backlight_device;
 struct device_node;
 struct drm_connector;
 struct drm_device;
@@ -59,6 +60,10 @@ struct display_timing;
  *
  * To save power when no video data is transmitted, a driver can power down
  * the panel. This is the job of the .unprepare() function.
+ *
+ * Backlight can be handled automatically if configured using
+ * drm_panel_of_backlight(). Then the driver do not need to implement the
+ * functionality to enable/disable backlight.
  */
 struct drm_panel_funcs {
 	/**
@@ -139,6 +144,15 @@ struct drm_panel {
 	 */
 	struct device *dev;
 
+	/**
+	 * @backlight:
+	 *
+	 * Backlight device, used to turn on backlight after
+	 * the call to enable(), and to turn off
+	 * backlight before call to disable().
+	 */
+	struct backlight_device *backlight;
+
 	/**
 	 * @funcs:
 	 *
@@ -193,4 +207,13 @@ static inline struct drm_panel *of_drm_find_panel(const struct device_node *np)
 }
 #endif
 
+#if defined(CONFIG_BACKLIGHT_CLASS_DEVICE) && defined(CONFIG_DRM_PANEL)
+int drm_panel_of_backlight(struct drm_panel *panel);
+#else
+static inline int drm_panel_of_backlight(struct drm_panel *panel)
+{
+	return -EINVAL;
+}
+#endif
+
 #endif
-- 
2.20.1


Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E38580C5A
	for <lists+linux-tegra@lfdr.de>; Sun,  4 Aug 2019 22:17:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726699AbfHDURR (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 4 Aug 2019 16:17:17 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:45811 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726346AbfHDURR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 4 Aug 2019 16:17:17 -0400
Received: by mail-lj1-f195.google.com with SMTP id m23so77345306lje.12;
        Sun, 04 Aug 2019 13:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WgVzWcgmLIPnyZKomZGLKI2l35SfEezC0RuGRG5g/EI=;
        b=Brv6b6OXXGcKeKH38lJ761HH0YTn5I9O/tREug6fGjyWJ+NCJsVZQvPQM7DlX+nsR6
         WA6HO+Rv7vxjU15u7L1NOWrHWicKyXbrTATlAAXAD8yRFsCg2XGn4VI2lwGp8s6DpiMn
         E+QAS5oYqtk6XgBCtudTDF/nIQ0Muy9Gmk0WQyu31aBZVKM5gvbZmkz16wMGlkqAX8tT
         wSS/p1pcWPPdgD67sqBEd7oUFfCCBGs7Y8NUSBCmu45zwvTYB7/dsrGKfXnKQEvSnQFP
         hjVSneDQ7YRnHrxMyOpJIf7d8FN3ltIdMphdq4MyGP2KAGXagMIV58euOaKS9DGq1EgA
         VMKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=WgVzWcgmLIPnyZKomZGLKI2l35SfEezC0RuGRG5g/EI=;
        b=n/rzj2fAH5FZn3mrEvLgBXdeKxg+RLhw+gVdvtOwJ9cn39uRDJWvFDNzHQk0/o26N7
         oU2JNmb0BKVDB3cYiKd3jjpR3Kub/scvABUbg1n66si+0jjxFpFyOmwkC2FkY+gSBnxN
         bbK4MWdbDLN7oZr8JIfgV/eftHRu6NJ5cfjHQ1p3Qr6aPjNzFqVPKzZPdQZUnl6nXoCv
         xhiHJ7H3YGg3+HpB2UuRDiz0tkSAjv6h4lawPslVmKEQQrLi/pPUDn1hsokcuwTd7iQ2
         5bI9JyFWz34+SwZAwRZ3Rqx0+6i3qwKGtaqL2vD9dxEf/3hVz5Csu4gTqGAmgivcrUny
         lK8w==
X-Gm-Message-State: APjAAAUXjNNeEbxjPkkr6hRja5hgrO1SGvlJiFJ+Kwt/2l1KumirTRai
        UqDm4kZvJGPdut+dlsaqZGs=
X-Google-Smtp-Source: APXvYqwud3tPWGlx2rT6WRxi5qtgEVcIyAyTabZz4LeIPtVV4R4zHjIsHNXrxj2gWB7phumt4Zx9PQ==
X-Received: by 2002:a2e:854d:: with SMTP id u13mr78583687ljj.236.1564949835418;
        Sun, 04 Aug 2019 13:17:15 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id p87sm16540794ljp.50.2019.08.04.13.17.13
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 04 Aug 2019 13:17:14 -0700 (PDT)
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
Subject: [PATCH v1 05/16] drm/fsl-dcu: fix opencoded use of drm_panel_*
Date:   Sun,  4 Aug 2019 22:16:26 +0200
Message-Id: <20190804201637.1240-6-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190804201637.1240-1-sam@ravnborg.org>
References: <20190804201637.1240-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Use drm_panel_get_modes() to access modes.
This has a nice side effect to simplify the code.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Stefan Agner <stefan@agner.ch>
Cc: Alison Wang <alison.wang@nxp.com>
---
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c
index 279d83eaffc0..a92fd6c70b09 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c
@@ -65,17 +65,9 @@ static const struct drm_connector_funcs fsl_dcu_drm_connector_funcs = {
 static int fsl_dcu_drm_connector_get_modes(struct drm_connector *connector)
 {
 	struct fsl_dcu_drm_connector *fsl_connector;
-	int (*get_modes)(struct drm_panel *panel);
-	int num_modes = 0;
 
 	fsl_connector = to_fsl_dcu_connector(connector);
-	if (fsl_connector->panel && fsl_connector->panel->funcs &&
-	    fsl_connector->panel->funcs->get_modes) {
-		get_modes = fsl_connector->panel->funcs->get_modes;
-		num_modes = get_modes(fsl_connector->panel);
-	}
-
-	return num_modes;
+	return drm_panel_get_modes(fsl_connector->panel);
 }
 
 static int fsl_dcu_drm_connector_mode_valid(struct drm_connector *connector,
-- 
2.20.1


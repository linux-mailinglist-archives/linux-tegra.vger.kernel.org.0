Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD3EC80C51
	for <lists+linux-tegra@lfdr.de>; Sun,  4 Aug 2019 22:17:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726659AbfHDURH (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 4 Aug 2019 16:17:07 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:41428 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726346AbfHDURH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 4 Aug 2019 16:17:07 -0400
Received: by mail-lf1-f68.google.com with SMTP id 62so51485846lfa.8;
        Sun, 04 Aug 2019 13:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZQy9HfEbGA1ab0VIPAqW/5LFlvvMfM3YtKt25w5akQg=;
        b=kU2m0+RBLUeqJOTqmN7wdIW5oOoJZk4mOVt8g2Pj9LBw8owAvIqfINDwzOdJ8fG3vY
         TmasVFXMgD9rbalVp2CRfKLF2xAY6JU4RpR/URtcsWX5hO4W1AcMMyl7KxM0EwKntN+X
         s0PmeKEE1zCtIcWZZbPwdxjRU5nYL6lOJnt+7SVLtKXAqsl18OyMoAewTdWmVuRodIhM
         KERP/ppypDVfWGQGYyvXKM9f9XAJghQ8AgeG2s18H4kOr9xhKEUbFmFZ5sLSnbcTPPgg
         zbfqIEc3h652BTSzj7i7m2PWJWdp865ZGwAZPpyW4xSJXt92fzG/ahvoGyE7oIx+IrkH
         t9mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=ZQy9HfEbGA1ab0VIPAqW/5LFlvvMfM3YtKt25w5akQg=;
        b=dHjlE4RearSkQ0dOo0ZF65v+acXvSIvyAt10ksKrhW94dFa28jlednFYYQkHcllvjx
         QUtY3LOkku1Ls656b6SZrKPoF/268Jre3qG0pruQvmt8gNbluaVmtn5yRERfRcoIUWOp
         bnvbscdJQreLfgd0Wkr1zubmoI3QBdvMW4BG0zCk/6fphsKvLt5oxJAnrOW57p/2+Hco
         EH+S5hPcd/oO4td3sCJoi/cmeEPYYe3f3HfDYACJK5qg2zVZ+LqgJ+0sXqY0agLz/E0x
         KIw0ZG8cPlqaaszWFdI66UCHsOcOVHo19zHbS/dwZlq9DIzcSA8FP7UGQayTWQAylRPm
         0kJw==
X-Gm-Message-State: APjAAAVnT6v7GmXMvCo+mJbfAO1fVMFCBMSFFD0Ig8pY3yOo+vr32AWH
        gf0h9+TD5ilKlgh1HajFiB8=
X-Google-Smtp-Source: APXvYqxrxJ6f5gcwOvxklU9HO4h4OF+p5nSRTWaf0Mi726mZOEO7tha0ZCSglPRdKYDVM/d5m/f2qg==
X-Received: by 2002:a05:6512:146:: with SMTP id m6mr5406980lfo.90.1564949824886;
        Sun, 04 Aug 2019 13:17:04 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id p87sm16540794ljp.50.2019.08.04.13.17.02
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 04 Aug 2019 13:17:04 -0700 (PDT)
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
Subject: [PATCH v1 02/16] drm/exynos: fix opencoded use of drm_panel_*
Date:   Sun,  4 Aug 2019 22:16:23 +0200
Message-Id: <20190804201637.1240-3-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190804201637.1240-1-sam@ravnborg.org>
References: <20190804201637.1240-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

drm_panel_attach() will check if there is a controller
already attached - drop the check in the driver.

Use drm_panel_get_modes() so the driver no longer uses the function
pointer.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Inki Dae <inki.dae@samsung.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
---
 drivers/gpu/drm/exynos/exynos_drm_dpi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dpi.c b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
index 3cebb19ec1c4..5479ff71cbc6 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dpi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
@@ -43,7 +43,7 @@ exynos_dpi_detect(struct drm_connector *connector, bool force)
 {
 	struct exynos_dpi *ctx = connector_to_dpi(connector);
 
-	if (ctx->panel && !ctx->panel->connector)
+	if (ctx->panel)
 		drm_panel_attach(ctx->panel, &ctx->connector);
 
 	return connector_status_connected;
@@ -85,7 +85,7 @@ static int exynos_dpi_get_modes(struct drm_connector *connector)
 	}
 
 	if (ctx->panel)
-		return ctx->panel->funcs->get_modes(ctx->panel);
+		return drm_panel_get_modes(ctx->panel);
 
 	return 0;
 }
-- 
2.20.1


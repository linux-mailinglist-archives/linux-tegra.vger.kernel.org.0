Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9032080C55
	for <lists+linux-tegra@lfdr.de>; Sun,  4 Aug 2019 22:17:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726687AbfHDURL (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 4 Aug 2019 16:17:11 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:42889 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726346AbfHDURL (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 4 Aug 2019 16:17:11 -0400
Received: by mail-lj1-f193.google.com with SMTP id t28so77424754lje.9;
        Sun, 04 Aug 2019 13:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1TEXaZ1KpdAoiO85boEPTBxnq8MPM5bbeG78Znsg1kk=;
        b=UY9E/BN/VsoWEhEtkdN8SUZ6JHfj/MBgZgo1KwFNcuBN2pN7TOGU5AbsZbBMQBBMp/
         +KPl14S0+PYrY1NlQyBlfArZikLv53LGe2G/hMahk+c88DAkGoN1qgt0F0pIFL6MlC69
         Lcg7RTaWFBAx4PfmCtkLgYHY73b8PSgMP9+nEJT1uYEv3otLP4iBzlNGlEbAcG98zDQZ
         E6yypKdyIS1mOqIB1qbZbUit/9wBYgZ6PRdzJSzvLpvas00dvht3i0+tzIDnbOuyzH3p
         RAn2m/o5JiW0VANG9Eoc7to6esERy5lprBeYjTpFb798pyI2UJNt8Ef9POkUjSlMe9BK
         Z98A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=1TEXaZ1KpdAoiO85boEPTBxnq8MPM5bbeG78Znsg1kk=;
        b=jWyHxpddpmMmDeYz4O9wM+DwQWiovQhIlbxyj0E9ZaJ1L7Cj69o7mPGtqZvRaxQDz2
         9OfNRL2RLNEcFo8hZsevOemfRtcgUtn8yZ7vgbnm1DQ/5Dgplz0zGBrsKqiLXSYIxm8G
         Z6uKNyUEMFPHPaWg2QLgyVsKimgp7l4QL0wl/4zqCRQD1ZV4roJapWhimJRl/PKHxXcu
         ErWAB0IxzWX/XenruWYm2IFqEjiKop9BYVrcJOF6rISTOXGsHzf50dXdZNB7GBi8OwrK
         shjJ534928QxTGRxHdrx2Rm3S1HTjQ8Z5m8tIoh7V1Ks+pn+rWjx2NSpTaW4uvQ/tz2v
         MHmw==
X-Gm-Message-State: APjAAAXnj0GaPfDPra/ezq5AisOdJWqwQM89ma/gLhZUVoDfC/UEhHpx
        dj/EZQNH7vjo5aI/a397j7o=
X-Google-Smtp-Source: APXvYqyX2DV4pg4STFder0QLYZxjB3cRp7z66cR5BIB23ZVo0ZMYOEKaRseLqKMG0kPOviSdCK01aQ==
X-Received: by 2002:a2e:3211:: with SMTP id y17mr38833847ljy.86.1564949828875;
        Sun, 04 Aug 2019 13:17:08 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id p87sm16540794ljp.50.2019.08.04.13.17.06
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 04 Aug 2019 13:17:08 -0700 (PDT)
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
Subject: [PATCH v1 03/16] drm/exynos: fix opencoded use of drm_panel_*
Date:   Sun,  4 Aug 2019 22:16:24 +0200
Message-Id: <20190804201637.1240-4-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190804201637.1240-1-sam@ravnborg.org>
References: <20190804201637.1240-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Call via drm_panel_get_modes().

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
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 6926cee91b36..36b02b456d9c 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1460,7 +1460,7 @@ static int exynos_dsi_get_modes(struct drm_connector *connector)
 	struct exynos_dsi *dsi = connector_to_dsi(connector);
 
 	if (dsi->panel)
-		return dsi->panel->funcs->get_modes(dsi->panel);
+		return drm_panel_get_modes(dsi->panel);
 
 	return 0;
 }
-- 
2.20.1


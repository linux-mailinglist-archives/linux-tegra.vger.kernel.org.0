Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E318F80C6A
	for <lists+linux-tegra@lfdr.de>; Sun,  4 Aug 2019 22:17:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726759AbfHDUR3 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 4 Aug 2019 16:17:29 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:41439 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726530AbfHDUR3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 4 Aug 2019 16:17:29 -0400
Received: by mail-lf1-f68.google.com with SMTP id 62so51486151lfa.8;
        Sun, 04 Aug 2019 13:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wk6pfousIAMCDI6Uyo+lM1td1MgXZzePdo2c6E2Onic=;
        b=tOCty/gZdEJZyOP/LNSmnWRovYxXff7HblVK8JBUwNKGrmTZ+mYA0XLKKLgk4z4yh/
         fBO9mOHvoad0V1tr1vvpw8D9YeCxA6tK5vJcEFMZJnwPoPsbHn+HSREVKkWjPSp9hJxn
         6O+7mFpQuChXeq8lCOSF1rKrQa9RJOuWSEaLRkkGuFO5ra4yL2+dKAYsbR4/XMyVHkWy
         Z1ut/fRIY+7glcUvkTmq+AArGP1m25gmupSXINZcKexEnrAEP9Y2L6S8eT5ly7N5HAK1
         H6xR/uxZns5l6A8wH2ZL1OO1aRJCaRQSPfhd90PwVcC82louRVZsNLqZAULk7h65wV5X
         uqYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=wk6pfousIAMCDI6Uyo+lM1td1MgXZzePdo2c6E2Onic=;
        b=ewpZfJOkBSCQjr3zQRXrKOnV+mw+0l4C1b8EC4imI7JWmmuuEonmU6oWIndY1oDZUp
         lvXth7Z3If8Wo9BhcYWt0mZe67yPKc7i3qhQ834B4AIwjNS/A5R1+cJr0Wfhd5394Cwq
         reCyiufyWC8t6F1ET0hTQIFE7+cOI4bZZ9sVXv5Zj1rikEEt1lgU8PWjzdchyYHFVfW/
         m7a07GsW7iWjRQxt/+Dn8xd+pqmfRCLf7OkeWbXyX2aPo+PxtEUndvOtSk97V3KcoprE
         tYDYT8o5WR7lUxflBBk1+YoWglH8Fgj8p6HU5VqnRg4ivNif0rbM8pu+nrGv2NWeAQ3u
         MYHw==
X-Gm-Message-State: APjAAAVFdvJF9ABZK67b2DIOZDbHuzzcK3L5uXuHPENN8x5t8n3ECujy
        +bigkb3S+cR50ZQYUQ1ArxE=
X-Google-Smtp-Source: APXvYqyLrFVeZI/lzYw2iRoU+pX5u/EBCoveXbxfKssjwJUGzKx1R2K/aZs1vIVE+lwZRLrksTI4Hg==
X-Received: by 2002:ac2:5dc3:: with SMTP id x3mr30142069lfq.168.1564949846990;
        Sun, 04 Aug 2019 13:17:26 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id p87sm16540794ljp.50.2019.08.04.13.17.25
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 04 Aug 2019 13:17:26 -0700 (PDT)
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
Subject: [PATCH v1 09/16] drm/tegra: fix opencoded use of drm_panel_*
Date:   Sun,  4 Aug 2019 22:16:30 +0200
Message-Id: <20190804201637.1240-10-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190804201637.1240-1-sam@ravnborg.org>
References: <20190804201637.1240-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Use the drm_panel_get_modes function.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org
---
 drivers/gpu/drm/tegra/output.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
index 274cb955e2e1..52b8396ec2dc 100644
--- a/drivers/gpu/drm/tegra/output.c
+++ b/drivers/gpu/drm/tegra/output.c
@@ -23,7 +23,7 @@ int tegra_output_connector_get_modes(struct drm_connector *connector)
 	 * ignore any other means of obtaining a mode.
 	 */
 	if (output->panel) {
-		err = output->panel->funcs->get_modes(output->panel);
+		err = drm_panel_get_modes(output->panel);
 		if (err > 0)
 			return err;
 	}
-- 
2.20.1


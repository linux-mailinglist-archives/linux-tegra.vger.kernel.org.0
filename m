Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31D7680C65
	for <lists+linux-tegra@lfdr.de>; Sun,  4 Aug 2019 22:17:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726346AbfHDURX (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 4 Aug 2019 16:17:23 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:35919 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726530AbfHDURX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 4 Aug 2019 16:17:23 -0400
Received: by mail-lf1-f67.google.com with SMTP id j17so2330024lfp.3;
        Sun, 04 Aug 2019 13:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OxHLOBnK1lNWSIGtczNLCozsQ3QtlSsdUZb5LP3kT0Y=;
        b=gAaQXpYAm1KYEI8rTb/OJS5eorTrd92AMU7Pgi3cS8X6yqya7FjBl9kj9ebkyM+BQ/
         kG4QjvdGy6WXSKN7R/ZQNoAxeSgQCgA1VuMB+nBFs6rk8efjjkFyzh2SrNKwlNtKxRv2
         iqFdb18qXUBYcmOjBQMer7IjewoVURBwU1mO6clB1CjpoYwMbL0dpBv5c5OlKDDciWGs
         +6s7JssXa+Tp4Fw6Xv9rE4h/pvUSUTj+AGdJZ0Y1bIflrUTi9w/c11SxgFj2XGUzbSor
         Ih7r/DdnsvWE0Xa5m0vqrhXL8QpXxKHJ2L7jKQ5/4zZoKB6An4mvQ34TzIHSV8u5sEtD
         kaxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=OxHLOBnK1lNWSIGtczNLCozsQ3QtlSsdUZb5LP3kT0Y=;
        b=YeDsGaDcHa1TyMyThPeLZuFfUB/ePpkzufG9yF66vWL89Kq3g7hZw+hzbCV0POBaLb
         rRHgxiUZ3lwiTGZ+fYcYkV/we92pPtgdmVHF6/tDQ9ayOA2H6huhnl1gYpzggm3Q05tI
         XEE0pOFmyTBchXP1EdCyxdLb9ToUD2rSQan6x6lhiUkQyhQXbShUYGQgb4sXEJl7AA5P
         6O/kUCAkyf98bssNX9mawmO4Ijzv2nMICyKAnmpXbSJjdLAQbzMVwt8FwhFU0InW9T02
         ZcKOF1tkFuwNyVvl9sOc7JghnkTgpOI0N8RVWHGQ6gv53oeMi8bvoCsqt8c188X4d7ov
         dZXg==
X-Gm-Message-State: APjAAAUH3kBefuViWWdNc5TnAueiQfuNWSiFQMONtgq+Y+wp9sVrpvuI
        jURRdR83M841OhTRZqyeMIE=
X-Google-Smtp-Source: APXvYqz3M5CTobM4ucLU8BcfTgw1LTrA2m/uc+fEekEh6iImfAPIvEukRCN6dkkcG2PkH6QhUumtFg==
X-Received: by 2002:ac2:4242:: with SMTP id m2mr7496505lfl.121.1564949841198;
        Sun, 04 Aug 2019 13:17:21 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id p87sm16540794ljp.50.2019.08.04.13.17.19
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 04 Aug 2019 13:17:20 -0700 (PDT)
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
Subject: [PATCH v1 07/16] drm/mxsfb: fix opencoded use of drm_panel_*
Date:   Sun,  4 Aug 2019 22:16:28 +0200
Message-Id: <20190804201637.1240-8-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190804201637.1240-1-sam@ravnborg.org>
References: <20190804201637.1240-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Use the drm_panel_get_modes() function.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Marek Vasut <marex@denx.de>
Cc: Stefan Agner <stefan@agner.ch>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/mxsfb/mxsfb_out.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_out.c b/drivers/gpu/drm/mxsfb/mxsfb_out.c
index 231d016c6f47..be36f4d6cc96 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_out.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_out.c
@@ -30,7 +30,7 @@ static int mxsfb_panel_get_modes(struct drm_connector *connector)
 			drm_connector_to_mxsfb_drm_private(connector);
 
 	if (mxsfb->panel)
-		return mxsfb->panel->funcs->get_modes(mxsfb->panel);
+		return drm_panel_get_modes(mxsfb->panel);
 
 	return 0;
 }
-- 
2.20.1


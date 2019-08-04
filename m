Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8EDAD80C4E
	for <lists+linux-tegra@lfdr.de>; Sun,  4 Aug 2019 22:17:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726561AbfHDURD (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 4 Aug 2019 16:17:03 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:46078 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726346AbfHDURD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 4 Aug 2019 16:17:03 -0400
Received: by mail-lf1-f66.google.com with SMTP id u10so17589880lfm.12;
        Sun, 04 Aug 2019 13:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XKQ+KJdp8Wv4Lgd7meexm5skjc2BjgchimNFn7JqqdA=;
        b=EMDl7m7xtcbiDX6T4zT9T9Oup48SB92u6hjZvbuUDysrvQ2LKT045bww+uGPRJ/wGS
         Xx9dvfCti+h8c3UbT9/vPUIBcFzKt/YnuegL1QMuENQBV1IDlbyEjCcBPVarMC4LPjqX
         2wJ/ko+exxrT8tGNbUyBXLEa3NdBap2PBiUUsZszcYc1q4mfZqrxZ1V3oXBda0LvlPu1
         nAk6RBnwnq/4JPkevOBldmHhgFYKce/qePV0wDsZ4RcHAs8Kx/0/yWesR12likoYCkG7
         qN1LiIhpYBG1MXL6JIwlhuDKzdtU9xdeprPv16WXN39mw2pQ6uz/KDJoZ0lPydP2x26B
         eZMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=XKQ+KJdp8Wv4Lgd7meexm5skjc2BjgchimNFn7JqqdA=;
        b=JJC1+G7SHWkIgtYaDNu+ORoXr+6fSbPhAZ1uajPgWJaxMugHAYrmo7ru79Gz5yUejl
         mIqQbAsV9NddA4cikmgxEu5k0iwQlVJhU0lvJtp1Hd612VLvsXsVOSXHpHgxsmbY9UBg
         RRiES3cGralzk/WAakVK41At9+yDlVtAi6hhObkTfPvI3OscX1wtV8Nj/GKtdnvQFdi2
         +eSXZ1sqgcNU56dgcPTKb/BWr5gR3uRbh3CwHzWsrd1J+7KkdCsxpTsECyV/39bPeoSu
         PL1fVIO9BEYG6VccLIa390nIXyfYxpSEUyK0bg/OmfGzl3QCdt985jyoUDmUA883wR0V
         Mkew==
X-Gm-Message-State: APjAAAW3vZI/94BE12xao6eNcyzmNohytCx8GORI8/jY2im/Riz7i3jc
        fIJLBwODYLbFybslKBAI8WA=
X-Google-Smtp-Source: APXvYqyao7EZANem5EL9cjm0IVmoUZr8fWYB9FLYhw/F/m5O3hktZo8Fs57Jvrx6gfI76gcjrnUKZw==
X-Received: by 2002:a19:c711:: with SMTP id x17mr69469503lff.147.1564949821600;
        Sun, 04 Aug 2019 13:17:01 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id p87sm16540794ljp.50.2019.08.04.13.16.59
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 04 Aug 2019 13:17:01 -0700 (PDT)
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
Subject: [PATCH v1 01/16] drm/bridge: tc358767: fix opencoded use of drm_panel_*
Date:   Sun,  4 Aug 2019 22:16:22 +0200
Message-Id: <20190804201637.1240-2-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190804201637.1240-1-sam@ravnborg.org>
References: <20190804201637.1240-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Replace open coded version with call to drm_panel_get_modes().

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/gpu/drm/bridge/tc358767.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 42f03a985ac0..cebc8e620820 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -1312,7 +1312,7 @@ static int tc_connector_get_modes(struct drm_connector *connector)
 {
 	struct tc_data *tc = connector_to_tc(connector);
 	struct edid *edid;
-	unsigned int count;
+	int count;
 	int ret;
 
 	ret = tc_get_display_props(tc);
@@ -1321,11 +1321,9 @@ static int tc_connector_get_modes(struct drm_connector *connector)
 		return 0;
 	}
 
-	if (tc->panel && tc->panel->funcs && tc->panel->funcs->get_modes) {
-		count = tc->panel->funcs->get_modes(tc->panel);
-		if (count > 0)
-			return count;
-	}
+	count = drm_panel_get_modes(tc->panel);
+	if (count > 0)
+		return count;
 
 	edid = drm_get_edid(connector, &tc->aux.ddc);
 
-- 
2.20.1


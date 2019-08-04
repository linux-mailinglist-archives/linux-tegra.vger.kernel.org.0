Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2222680C60
	for <lists+linux-tegra@lfdr.de>; Sun,  4 Aug 2019 22:17:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726702AbfHDURU (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 4 Aug 2019 16:17:20 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:44581 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726346AbfHDURU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 4 Aug 2019 16:17:20 -0400
Received: by mail-lj1-f193.google.com with SMTP id k18so77399571ljc.11;
        Sun, 04 Aug 2019 13:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yel48h0qo2wbp0mM+rNqpesYnmUiIUwuFRYEGRdGqyc=;
        b=RhcmWOYNugg3RhzTq+cei+ZzJ5PbMDYuydezLvh4SzkEdVGuUstINi6mF3JdxqSgHE
         vt/tTDGSa1SEDKK2uctzf8Q7x2lA/At+dJJvONXAfw1PG5quso6A1CYppTRQmjq2Mztz
         8+QesDo5Y3z8q6FOM3FS99qDTyn9eq0bJZAAqangO3/ERv+ON6doIPb4/KiuSEd+wtXi
         tJ+Td+ky5MuQfpIn1AOxC7vWgtQI6QRzHg+odjRtEyUsSQvmNFrXrQU7NFPkrkmguzMt
         nJHPyyRqYLsguHOCJz+yVza9xugy775zludTZthdBmnpUbY+21C3bNWQ8WuAZTw3PPVj
         S+AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=yel48h0qo2wbp0mM+rNqpesYnmUiIUwuFRYEGRdGqyc=;
        b=Wu+jlhTscL7OYutWpxhc80R3M1+8v63f0pcTk/3ZWeNidFSxWtMijCKytrbxKYRwpL
         AYw1LvAZs2aX5Xh89a/Eu+usn+WueluNSt6D2uhs2A5CawhOGEVJjhru66yASgz0woZz
         ahsbg0iukaYbuZ8bNTmIoKhmXzbUUvR4LtBjdJijAY81u+euR0yCjnfzjGFKbjuO5QQb
         5hWCEo+eZlvXbFEEidWDiiPhU7c2D9jLRG2zY4uiM8D/z3aaHJU4DNIUI2Fsrstaa7Pw
         426JGJJOhpRQXNtvHf1gOXSv6MnBx+blgha8f4IxQ0JXo6HKGbv8EoCMvsy/UoLvcctp
         4YNg==
X-Gm-Message-State: APjAAAXWR63rFrWpIjAFckIkWp27sWSkuUfPBDW8HwRMopdR9RbU0hTO
        RK8ONz0nrzd031u/nfHCd9M=
X-Google-Smtp-Source: APXvYqxdGxd0F02kFmQDzjnepawHElytfS6OgwAwlzDKWRLVxKsqajzgR4P7dB62VuLk5D8PL5TcOg==
X-Received: by 2002:a2e:88d3:: with SMTP id a19mr29864312ljk.32.1564949838298;
        Sun, 04 Aug 2019 13:17:18 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id p87sm16540794ljp.50.2019.08.04.13.17.16
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 04 Aug 2019 13:17:17 -0700 (PDT)
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
Subject: [PATCH v1 06/16] drm/msm: fix opencoded use of drm_panel_*
Date:   Sun,  4 Aug 2019 22:16:27 +0200
Message-Id: <20190804201637.1240-7-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190804201637.1240-1-sam@ravnborg.org>
References: <20190804201637.1240-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Use the function drm_panel_get_modes().

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Alexios Zavras <alexios.zavras@intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Allison Randal <allison@lohutok.net>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Enrico Weigelt <info@metux.net>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
index ecef4f5b9f26..0e21252fd1d6 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
@@ -55,7 +55,7 @@ static int mdp4_lvds_connector_get_modes(struct drm_connector *connector)
 	if (panel) {
 		drm_panel_attach(panel, connector);
 
-		ret = panel->funcs->get_modes(panel);
+		ret = drm_panel_get_modes(panel);
 
 		drm_panel_detach(panel);
 	}
-- 
2.20.1


Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D79180C4C
	for <lists+linux-tegra@lfdr.de>; Sun,  4 Aug 2019 22:17:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726530AbfHDURA (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 4 Aug 2019 16:17:00 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:42876 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726346AbfHDUQ7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 4 Aug 2019 16:16:59 -0400
Received: by mail-lj1-f193.google.com with SMTP id t28so77424519lje.9;
        Sun, 04 Aug 2019 13:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3JqNJR/tbllInqzUqAgcIBZy8c2/hdUEosVg+96WWSo=;
        b=OFo5m7UYW1t09ibVa24pGV8LSs92/jiLMbnmIRIrUAONwdrp/xVYrUT41t4kq7FAXt
         XWCk8JrCjhMvDYV4roa7yWoSu242TuRiw9Ov/1WsXSkKId0Yt+d1PIlxD5OImGaol8Z7
         zrglP6rxfB9ty7sP5J7PDoED29Z7fxR6dK+xKEnLZvKfQkRVYJ5lnlgucCLlkbag3ZJq
         tIl9ttBBlOUipT0Kt8rzjyQ7gvYGhWrir+mA820NfHzaPdOc2cSw2MG4ECkDp/MYAARi
         WksCS7ziA1MMweO/fYeDo7M870dhtafgJdCrLF5JbbsXWYnV9Z6Eydf5FTn//cJ6tYZ+
         AbMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=3JqNJR/tbllInqzUqAgcIBZy8c2/hdUEosVg+96WWSo=;
        b=Ropc5IcZXTIDRAjbfRiIeaq3JnXTN71gVjhQdXtPnlkvBKA0YrtXbGTxv8oAo3s1g7
         lYYojct2Sw0SgOVVfMWzuVMmM/evgEg7/tJh/vQ8p+hK0+kDva7Sxnsxa2Byqz3xCyvs
         L8+pV2axW8vKuXwP6+q+HHtHiSy2bXjvaGZrvH+21V+D41lqnl1HueC7vZnG/0QhJi0J
         6hQhTANx1YuAKg1kSkse79qcPBkKkQHFByXoR9AvmxF0EH5W5hrXX89qi6J3DTPsS6x8
         H8H55W7wkTZQsLcmZ+mZ2wj9vOYt29i7PKRjz/KynLxSlEbgpK2RrIkSGYAn376PYzIz
         vaAg==
X-Gm-Message-State: APjAAAVjrT6kJxfvZjAuMlp1o6DL/LEzmizXOIGoGlyLwpq24eLaBYOk
        +JU72vcsXjX3BnbDqWpi1Uk=
X-Google-Smtp-Source: APXvYqxubNgp0cYLhN8wuC7+2LA2WOAC50nfeiKvF5Oq3p74Zf9n27xnchcBuEjvjjCBlvoc6/29TQ==
X-Received: by 2002:a2e:8559:: with SMTP id u25mr13365606ljj.224.1564949816865;
        Sun, 04 Aug 2019 13:16:56 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id p87sm16540794ljp.50.2019.08.04.13.16.54
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 04 Aug 2019 13:16:56 -0700 (PDT)
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
Subject: [PATCH v1 0/16] drm: panel related updates
Date:   Sun,  4 Aug 2019 22:16:21 +0200
Message-Id: <20190804201637.1240-1-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The first 9 patches replaces direct use of the drm_panel
function pointers with their drm_panel_* counterparts.
The function pointers are only supposed to be used by
the drm_panel infrastructure and direct use are discouraged.

ili9322 is updated to handle bus_flags in get_modes like everyone else.
This is in preparation for a later patch series where controller
becomes an arugument to get_modes() and not like today where drm_panel
is attached to a controller.

The remaining patches move functionality to the drm_panel core that
today are repeated in many drivers.
As preparation for this the inline functions are moved to drm_panel.c
and kernel-doc is made inline.
panel-simple is updated to benefit from the additional infrastructure
and is an example for the simplifications that can be done.

The patchset has been tested on my embedded target,
and build tested.

Feedback welcome!

The "fix opencoded" patches are all independent and can be applied
out of order. They were kept here to keep panel related patches in one series.

	Sam

Cc: Alexios Zavras <alexios.zavras@intel.com>
Cc: Alison Wang <alison.wang@nxp.com>
Cc: Allison Randal <allison@lohutok.net>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@linux.ie>
Cc: Enrico Weigelt <info@metux.net>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Cc: Inki Dae <inki.dae@samsung.com>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kukjin Kim <kgene@kernel.org>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-tegra@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Marek Vasut <marex@denx.de>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Sean Paul <sean@poorly.run>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Stefan Agner <stefan@agner.ch>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Vincent Abriou <vincent.abriou@st.com>

Sam Ravnborg (16):
      drm/bridge: tc358767: fix opencoded use of drm_panel_*
      drm/exynos: fix opencoded use of drm_panel_*
      drm/exynos: fix opencoded use of drm_panel_*
      drm/imx: fix opencoded use of drm_panel_*
      drm/fsl-dcu: fix opencoded use of drm_panel_*
      drm/msm: fix opencoded use of drm_panel_*
      drm/mxsfb: fix opencoded use of drm_panel_*
      drm/sti: fix opencoded use of drm_panel_*
      drm/tegra: fix opencoded use of drm_panel_*
      drm/panel: ili9322: move bus_flags to get_modes()
      drm/panel: move drm_panel functions to .c file
      drm/panel: use inline comments in drm_panel.h
      drm/panel: drop return code from drm_panel_detach()
      drm/panel: call prepare/enable only once
      drm/panel: add backlight support
      drm/panel: simple: use drm_panel infrastructure

 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |   3 +-
 drivers/gpu/drm/bridge/tc358767.c                  |  10 +-
 drivers/gpu/drm/drm_panel.c                        | 185 ++++++++++++++++-
 drivers/gpu/drm/exynos/exynos_drm_dpi.c            |   4 +-
 drivers/gpu/drm/exynos/exynos_drm_dsi.c            |   2 +-
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c          |  10 +-
 drivers/gpu/drm/imx/imx-ldb.c                      |  11 +-
 drivers/gpu/drm/imx/parallel-display.c             |  11 +-
 .../gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c    |   2 +-
 drivers/gpu/drm/mxsfb/mxsfb_out.c                  |   2 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9322.c       |  34 ++-
 drivers/gpu/drm/panel/panel-simple.c               |  73 +------
 drivers/gpu/drm/sti/sti_dvo.c                      |   8 +-
 drivers/gpu/drm/tegra/output.c                     |   2 +-
 include/drm/drm_panel.h                            | 227 +++++++++++----------
 15 files changed, 349 insertions(+), 235 deletions(-)



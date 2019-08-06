Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 990A2831EC
	for <lists+linux-tegra@lfdr.de>; Tue,  6 Aug 2019 14:56:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729506AbfHFM4b (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 6 Aug 2019 08:56:31 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:41571 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729522AbfHFM4b (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 6 Aug 2019 08:56:31 -0400
Received: by mail-lj1-f194.google.com with SMTP id d24so82143604ljg.8
        for <linux-tegra@vger.kernel.org>; Tue, 06 Aug 2019 05:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hWkwxSekOFjOJkkiUvNS6vk1XTlC8GglcO/MoVG5QiU=;
        b=sHDErg1nel+qWZ6ii4Ow3da3HFj48RR7397s2QyeksX1iOni6fqeQTB3BqjhvnXymg
         iDZ9/asuSdIwLEQ5+ASOgIwa3KaYHYgffPLUz0DjarhoqXArAdSLVuCeimHCPEmQL82E
         estLVQyp/jfbd0YCA4DksvLMUL4+LXAC4feuCS6kGtz1OOY2ZNT0FLZ+LPKAkssy0/pu
         Lfv3LV7ZLljskBd/xxsMOK9/JcDO0QbOgrA9r4p7x1osSVLm64d75lQd7dEkiUbPCFWU
         Dm6ChuZWYqbu4VavYKXXv5UWiFoLLFsK1wv1UblaGU+WQIYDezjt/pURraKW1BTA3+if
         87kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hWkwxSekOFjOJkkiUvNS6vk1XTlC8GglcO/MoVG5QiU=;
        b=hqdeG4SSghNQW5z/OfIo5WBFOcc5sNSliB+mI+XWYjD7d33E/6lrRNudYecthFuH8O
         A+Y5t0WRSvC6tIMUrzugQkgommN/Q6jOzCVFit/MmU3wUzRCy7p4Yt8gkdJqGxpHMyBX
         /2meeV4laUmtGwernMeBVp/cADRVCMLSA5FPKHZOi+eYNAT2shMLVhga4xBEl5UziNdY
         AjZDrf4MIXsZK/tZqUT5+2sFGKSuAWJ1lK+p9WL6O/TZUlmQ0TujACAMuiiyFkE4oekG
         e5Wmii5FwMT40REjmFZtmyT/dzuUNKfSkvG/uhzI+3ABw6LgWDHS+s/JeJg/p1RBZzvf
         weFg==
X-Gm-Message-State: APjAAAXXT8ZUXQORtKFgTsdAmyMfmKWI62kYKKyBT9nmek1gkr8srNZ4
        80XrmzkqW4zipXsiKrxHTAOCk7LVhejdrYbx/04NRg==
X-Google-Smtp-Source: APXvYqyubXEyA8qA2bp+bFUDFeaZYa6vFIsx3pnY8ux450GbZ0ztgW/G/BCVR2DhdbCt29loENRPoYWQh344coTndK4=
X-Received: by 2002:a2e:9048:: with SMTP id n8mr1742815ljg.37.1565096189174;
 Tue, 06 Aug 2019 05:56:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190804201637.1240-1-sam@ravnborg.org> <20190804201637.1240-11-sam@ravnborg.org>
In-Reply-To: <20190804201637.1240-11-sam@ravnborg.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 6 Aug 2019 14:56:16 +0200
Message-ID: <CACRpkdYTaaxqhSSPx8KToVaiRJtzNmNynGCoGTMeJVgDUCsTnQ@mail.gmail.com>
Subject: Re: [PATCH v1 10/16] drm/panel: ili9322: move bus_flags to get_modes()
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Alexios Zavras <alexios.zavras@intel.com>,
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
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        linux-tegra@vger.kernel.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Marek Vasut <marex@denx.de>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sean Paul <sean@poorly.run>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vincent Abriou <vincent.abriou@st.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sun, Aug 4, 2019 at 10:17 PM Sam Ravnborg <sam@ravnborg.org> wrote:

> To prepare the driver to receive drm_connector only in the get_modes()
> callback, move bus_flags handling to ili9322_get_modes().
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>

OK I don't see where this is going but I trust you so:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

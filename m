Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7A2F10FEC8
	for <lists+linux-tegra@lfdr.de>; Tue,  3 Dec 2019 14:27:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726254AbfLCN1s (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 3 Dec 2019 08:27:48 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:34480 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726086AbfLCN1r (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 3 Dec 2019 08:27:47 -0500
Received: by mail-lf1-f66.google.com with SMTP id l18so2973583lfc.1
        for <linux-tegra@vger.kernel.org>; Tue, 03 Dec 2019 05:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=w5kvvsNqTWUYowCw16IbU3x1YCmaOiYf5tGr6DU/4Oo=;
        b=Kf2TrLzoeW7GPO93jICax9H7npFli7nKkPrAa/7pensbMPErLdSyO5cAPXKjgJ5SwW
         dQrNoMOKIZ0oZKLp96BDVuif4EmGi5MgCrhh0N20691gPfYKiIWpucl1bpxPv8HyWwEO
         sV/o0T5vo3zUWjf4mn/5JFm4iQ9eVy7Qwu71lDN9Y0jhqghCBoOVDyB/uDoKZVeoM5qE
         lirCwRmMcZeJCvVkm4a8hz6Ijs6Aw/lR6XRBXo/Au/eoIX7M/1cljIRGuyDeppCzGaRX
         SiP6V0C53L9KztUCT76fN77bWsENOXX1T2+wgpTdxmhUZRMwMYpW+0PGCrTHVh2H+JbJ
         2ZrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=w5kvvsNqTWUYowCw16IbU3x1YCmaOiYf5tGr6DU/4Oo=;
        b=QkoZM8f98Iwwma3cg5jXv94tmjxGcUxOIo8wnzW4g9DnSc6wLWmgPVyPzWjnfYYAwx
         q6EKXULyRIbYKKXzhOcugFoyd2c6B4y64+XhQx8hSANQe+XMG722rnibnDAiFcyqCbGs
         KUS7iUAcpLfZg0iwgQCPe7nOy45+nOWYoXRsLKF0ANjOTW5JTvRVKQUKhxOVbXiPNHgs
         t4shohYqR/UZJQWL/au9gpasIQUxAfkjm45s3c7qlgsqf4HW0349cd1E3ysa4bcFByt3
         PFnMQ9amPSrgGjGyzPq4zmz6eXcV+xiwCCatCiGSHT4hww5EAkY4LUP5Jd9V9+AObUqM
         NV1g==
X-Gm-Message-State: APjAAAVT5yuP95u+MaLfSTJdjDvHKK87LpW5JnZYOZMiQmFRJD+9Xt+t
        1+qEOpBe1P9c//OQTMZn+TCDzxrLp+4osJAvsyMAzQ==
X-Google-Smtp-Source: APXvYqyofMBPFWLLzB1STopamPLWqp8a6SLsme2LKB0JzU+G9blqUgnpYL5l6F2TBybbdU6uzjI0Yo9WQ+oH5mP/T40=
X-Received: by 2002:a19:f701:: with SMTP id z1mr2657953lfe.133.1575379666036;
 Tue, 03 Dec 2019 05:27:46 -0800 (PST)
MIME-Version: 1.0
References: <20191202193230.21310-1-sam@ravnborg.org> <20191202193230.21310-9-sam@ravnborg.org>
In-Reply-To: <20191202193230.21310-9-sam@ravnborg.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 3 Dec 2019 14:27:34 +0100
Message-ID: <CACRpkdbiyVcUDrxuCK_wgsB6Vn+XZptsc9H3zB0cXxjeOtw+Ug@mail.gmail.com>
Subject: Re: [PATCH v1 08/26] drm/panel: drop drm_device from drm_panel
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Jitao Shi <jitao.shi@mediatek.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        linux-tegra@vger.kernel.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Purism Kernel Team <kernel@puri.sm>,
        Sean Paul <sean@poorly.run>, Stefan Agner <stefan@agner.ch>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Stefan Mavrodiev <stefan@olimex.com>,
        Robert Chiras <robert.chiras@nxp.com>,
        =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Dec 2, 2019 at 8:33 PM Sam Ravnborg <sam@ravnborg.org> wrote:

> The panel drivers used drm_panel.drm for two purposes:
> 1) Argument to drm_mode_duplicate()
> 2) drm->dev was used in error messages
>
> The first usage is replaced with drm_connector.dev
> - drm_connector is already connected to a drm_device
>   and we have a valid connector
>
> The second usage is replaced with drm_panel.dev
> - this makes drivers more consistent in their dev argument
>   used for dev_err() and friends
>
> With these replacements there are no more uses of drm_panel.drm,
> so it is removed from struct drm_panel.
> With this change drm_panel_attach() and drm_panel_detach()
> no logner has any use as they are empty functions.
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Stefan Mavrodiev <stefan@olimex.com>
> Cc: Robert Chiras <robert.chiras@nxp.com>
> Cc: "Guido G=C3=BCnther" <agx@sigxcpu.org>
> Cc: Purism Kernel Team <kernel@puri.sm>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

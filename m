Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BA8F1E3F69
	for <lists+linux-tegra@lfdr.de>; Wed, 27 May 2020 12:52:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387584AbgE0Kww (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 27 May 2020 06:52:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387580AbgE0Kww (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 27 May 2020 06:52:52 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D78A9C061A0F
        for <linux-tegra@vger.kernel.org>; Wed, 27 May 2020 03:52:50 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id o15so6174869ejm.12
        for <linux-tegra@vger.kernel.org>; Wed, 27 May 2020 03:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=B5FVmstLgw2eUi3bS4qafmObIMxvl6UU1XR3pwG0edQ=;
        b=jkx7L4xQjp+r4cX6W/f4+5YbxVChaUjXrMUq5D7V1oJlmEGe6erlKojx34fdRVvRzv
         JGQAMaryVwBKD0b/GXGqavlMv3mRDbk6bRCH4T2fjVweDbaCqKjEnI3bl2OCf0auPu3E
         aEF/oIV80PTa7UxWRx1G+Uk2B8QE7aB2ajD9VrO+X20eHI80WaYDP4xxqoIHab+FPXp9
         khuHE3S3M2193WT4WMfq9dJuBdeZqhNzAB/omxQDV4XvMC3tMdV3HnRODDaCgg8LfYD8
         4oVIBjR5D0HzYPeVAb8vXuo8rvvsFRlF4XKpjjmymn/qJI1SfBd6ga+Y0gIvfCUeXiSp
         J6JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=B5FVmstLgw2eUi3bS4qafmObIMxvl6UU1XR3pwG0edQ=;
        b=f0HnE7gYCKUXBClc9Zw3chrmUyzDML2SCslXWIVOFc14DTp1iizFKxF5vH/zJxOjga
         JKOHCa2a0QOruAn+9a38/CBPa7LLKQDt/HreU8wk4v2F9YIeswZ75g8rESAoUZ86Bab0
         3C0Hta96VqCHfWYQnzeh86eFBZaHgtkKxfe7WAbaC+KxmitEf9vkhT/69kFh8DjIvoaE
         nlZnc4lCpAER4paGg3Lpm+2JzImLwUs9/HcBh3tZROR0PVguthamXjpckJxVQFSqepO1
         jJRyk8diEg9qVGWmuwyYbAwH2FE8qFJBJ3+AST7Z0fNRgxo3vVyuOtVFOT7s9qaSgmhJ
         CiNQ==
X-Gm-Message-State: AOAM532rRJuKFQ58CLYpTe8cEHSlwdXtqAK2LngNnC3xvhSAcGL0zv69
        5/BkUiMjEfGk4UpcT4CmNPE=
X-Google-Smtp-Source: ABdhPJzLXqrzyjlyMauepvCYCrg6ptssXBWRBkeJUcTDOO2X3OcCyVyvsn0h8Dhk0kFd5fsOge9tHg==
X-Received: by 2002:a17:906:9157:: with SMTP id y23mr5712025ejw.0.1590576769562;
        Wed, 27 May 2020 03:52:49 -0700 (PDT)
Received: from localhost (pd9e51079.dip0.t-ipconnect.de. [217.229.16.121])
        by smtp.gmail.com with ESMTPSA id t23sm1881663edr.71.2020.05.27.03.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2020 03:52:48 -0700 (PDT)
Date:   Wed, 27 May 2020 12:52:47 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        syzbot+0871b14ca2e2fb64f6e3@syzkaller.appspotmail.com,
        "James (Qian) Wang" <james.qian.wang@arm.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Mihail Atanassov <mihail.atanassov@arm.com>,
        Brian Starkey <brian.starkey@arm.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Boris Brezillon <bbrezillon@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jyri Sarha <jsarha@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Rob Clark <robdclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>,
        Brian Masney <masneyb@onstation.org>,
        Emil Velikov <emil.velikov@collabora.com>,
        zhengbin <zhengbin13@huawei.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-tegra@vger.kernel.org,
        Daniel Vetter <daniel.vetter@intel.com>
Subject: Re: [PATCH] drm/atomic-helper: reset vblank on crtc reset
Message-ID: <20200527105247.GA2979001@ulmo>
References: <20200527094757.1414174-2-daniel.vetter@ffwll.ch>
 <20200527095332.1439425-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="BOKacYhQ+x31HxR3"
Content-Disposition: inline
In-Reply-To: <20200527095332.1439425-1-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--BOKacYhQ+x31HxR3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2020 at 11:53:32AM +0200, Daniel Vetter wrote:
> Only when vblanks are supported ofc.
>=20
> Some drivers do this already, but most unfortunately missed it. This
> opens up bugs after driver load, before the crtc is enabled for the
> first time. syzbot spotted this when loading vkms as a secondary
> output. Given how many drivers are buggy it's best to solve this once
> and for all in shared helper code.
>=20
> Aside from moving the few existing calls to drm_crtc_vblank_reset into
> helpers (i915 doesn't use helpers, so keeps its own) I think the
> regression risk is minimal: atomic helpers already rely on drivers
> calling drm_crtc_vblank_on/off correctly in their hooks when they
> support vblanks. And driver that's failing to handle vblanks after
> this is missing those calls already, and vblanks could only work by
> accident when enabling a CRTC for the first time right after boot.
>=20
> Big thanks to Tetsuo for helping track down what's going wrong here.
>=20
> There's only a few drivers which already had the necessary call and
> needed some updating:
> - komeda, atmel and tidss also needed to be changed to call
>   __drm_atomic_helper_crtc_reset() intead of open coding it
> - tegra and msm even had it in the same place already, just code
>   motion, and malidp already uses __drm_atomic_helper_crtc_reset().
>=20
> Only call left is in i915, which doesn't use drm_mode_config_reset,
> but has its own fastboot infrastructure. So that's the only case where
> we actually want this in the driver still.
>=20
> I've also reviewed all other drivers which set up vblank support with
> drm_vblank_init. After the previous patch fixing mxsfb all atomic
> drivers do call drm_crtc_vblank_on/off as they should, the remaining
> drivers are either legacy kms or legacy dri1 drivers, so not affected
> by this change to atomic helpers.
>=20
> v2: Use the drm_dev_has_vblank() helper.
>=20
> Link: https://syzkaller.appspot.com/bug?id=3D0ba17d70d062b2595e1f06123147=
4800f076c7cb
> Reported-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> Reported-by: syzbot+0871b14ca2e2fb64f6e3@syzkaller.appspotmail.com
> Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> Cc: "James (Qian) Wang" <james.qian.wang@arm.com>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Mihail Atanassov <mihail.atanassov@arm.com>
> Cc: Brian Starkey <brian.starkey@arm.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Boris Brezillon <bbrezillon@kernel.org>
> Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: Jyri Sarha <jsarha@ti.com>
> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <seanpaul@chromium.org>
> Cc: Brian Masney <masneyb@onstation.org>
> Cc: Emil Velikov <emil.velikov@collabora.com>
> Cc: zhengbin <zhengbin13@huawei.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: linux-tegra@vger.kernel.org
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  drivers/gpu/drm/arm/display/komeda/komeda_crtc.c | 7 ++-----
>  drivers/gpu/drm/arm/malidp_drv.c                 | 1 -
>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c   | 7 ++-----
>  drivers/gpu/drm/drm_atomic_state_helper.c        | 4 ++++
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c        | 2 --
>  drivers/gpu/drm/tegra/dc.c                       | 1 -
>  drivers/gpu/drm/tidss/tidss_crtc.c               | 3 +--
>  drivers/gpu/drm/tidss/tidss_kms.c                | 4 ----
>  8 files changed, 9 insertions(+), 20 deletions(-)

Looks good, and nice cleanup:

Acked-by: Thierry Reding <treding@nvidia.com>

--BOKacYhQ+x31HxR3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7ORn0ACgkQ3SOs138+
s6H2lA/8DvMIozjVlrshtTC7Qr9YxJxR6RFOy17iNH5ARYLPLbhBq1yRfsiX4FT3
l8PvDxGsrxfsxh+AhRRtQC1bNIHhzrZTMyqR3ynrphuGm73Q5A2sOzkNp6XjvfGj
AoWxb+y+kxg62luapDOUKCnJdILpJ5EagC7enrCKKZo8ZCGjFvjWUivFejUaDmy/
lUX8X0a1PgRkCBubwk/Fr0P0oGg+VM6+DoMguR/9yTC5TrQ1F4JmNOGKpsVivm+K
3NUalHyzQlzYkXhhQhU858C+COIRErJCweeBYTIGPZQglpjXASEONWw+giiizKpm
FwB4yKDQqLuW1hGfp8FToRO6YWZZXfrZU2YC8F+xSFmF+Ppox0NrTnnivjwpwzul
EakIXUbxe0gYRobtcIJFLsQfYvEFYtDm675moCPijf8VG2XzQWEXTVJRWCHg2u3V
zu/l1yRIsLbK+3mPBLf+3kxP4pvFjYwzniod4BI2RpHF/b7vY61CZROradHPAkSG
h934cP2DCjJDPOTDRXhBuhFE6Sq8/mfoYnqToky5+RfRw4tiQUgUPMUCm/h/SvLr
OAiZclZ4eawslPWXpYfeYv16WupR9Pk+2DZPg//7R1g1c15+CdGEejiuoZCsUl5K
wVu8p5fh0Hei9TbND3EDMqyt+4lcMxIsYC8Qb5fmBB9amz4PZVs=
=fudx
-----END PGP SIGNATURE-----

--BOKacYhQ+x31HxR3--

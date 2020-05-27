Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E0B01E3F8E
	for <lists+linux-tegra@lfdr.de>; Wed, 27 May 2020 13:07:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387574AbgE0LHT (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 27 May 2020 07:07:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387534AbgE0LHT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 27 May 2020 07:07:19 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC289C061A0F
        for <linux-tegra@vger.kernel.org>; Wed, 27 May 2020 04:07:17 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id x23so21383554oic.3
        for <linux-tegra@vger.kernel.org>; Wed, 27 May 2020 04:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Livn6Doxrqub4fUpq0t0KWnf/NiQCi86KogVmT0lLXA=;
        b=FrcG6te7Os2Bwm/dUjcsvHdp9bGzeiAXUSFwQnZlNGRAHh5es0xi+rwnPivOay+Tep
         3jgkW3cr7u67p2vOqtMPNLb/RxiKjwPtMVSM/5VElvsAfQfBhX+6goBIdnoPif4rHI39
         jqLwcaJyYM03jfWqzvgHv+AY42xwIUxolw5GQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Livn6Doxrqub4fUpq0t0KWnf/NiQCi86KogVmT0lLXA=;
        b=kYeix98qG/d9Pt+CzoHvtW/N6WZJ0BHWKxMxxFDFo+R3Cawq9LQ9PK84M70aiN5vV5
         Rqzl9NLmCu6rkjKtW9apVBYpSGiAJmCDOz9QcwLUs5aY++DPCDwNBhTycxZlrfl+ae44
         HTv63sHmDi16be55ASCqXtDMhhI1cv20uZjEv+gGrOOzxzee8DKXBbUYO/BE+aqbArkc
         2Y5DhoeCd2dZYfrhwitltDo6qFAlvItYZKBeHePxq9xEPRkx6wA5vsshCfbSJdlyftLw
         GfgIuWnT2tVfsndeiVBE+FqU9IOe4sXGUT+HGINNl7975CQZoXl6CNxFaKRvcWfdLiEC
         /GHw==
X-Gm-Message-State: AOAM531oZTDuAmCDLrfEtwpDjpgiXGA3hR+ybEgp6tHI7tmetarUvOL4
        s6PGTdLHi+RJIY9l9YmSuYuYxH4nIQcG4mj1D+t1Bw==
X-Google-Smtp-Source: ABdhPJyIKMHFWG5Rys6pnvXEOHYRtZ7UFeyloJtEYl2XFHKsIP1odqj883ILl9BK/V4LnosMj5gqveHwZV2ipDB3dIk=
X-Received: by 2002:a05:6808:282:: with SMTP id z2mr2089207oic.101.1590577636894;
 Wed, 27 May 2020 04:07:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200527094757.1414174-2-daniel.vetter@ffwll.ch>
 <20200527095332.1439425-1-daniel.vetter@ffwll.ch> <20200527105702.GI159988@e110455-lin.cambridge.arm.com>
In-Reply-To: <20200527105702.GI159988@e110455-lin.cambridge.arm.com>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Wed, 27 May 2020 13:07:05 +0200
Message-ID: <CAKMK7uFiCXa_NtEAVzHsXOb8QHmU0yXkqRWXvW3ayvRixDWnbA@mail.gmail.com>
Subject: Re: [PATCH] drm/atomic-helper: reset vblank on crtc reset
To:     Liviu Dudau <liviu.dudau@arm.com>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        syzbot+0871b14ca2e2fb64f6e3@syzkaller.appspotmail.com,
        "James (Qian) Wang" <james.qian.wang@arm.com>,
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
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jyri Sarha <jsarha@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Rob Clark <robdclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>,
        Brian Masney <masneyb@onstation.org>,
        Emil Velikov <emil.velikov@collabora.com>,
        zhengbin <zhengbin13@huawei.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, May 27, 2020 at 12:57 PM Liviu Dudau <liviu.dudau@arm.com> wrote:
>
> Hi Daniel,
>
> On Wed, May 27, 2020 at 11:53:32AM +0200, Daniel Vetter wrote:
> > Only when vblanks are supported ofc.
> >
> > Some drivers do this already, but most unfortunately missed it. This
> > opens up bugs after driver load, before the crtc is enabled for the
> > first time. syzbot spotted this when loading vkms as a secondary
> > output. Given how many drivers are buggy it's best to solve this once
> > and for all in shared helper code.
> >
> > Aside from moving the few existing calls to drm_crtc_vblank_reset into
> > helpers (i915 doesn't use helpers, so keeps its own) I think the
> > regression risk is minimal: atomic helpers already rely on drivers
> > calling drm_crtc_vblank_on/off correctly in their hooks when they
> > support vblanks. And driver that's failing to handle vblanks after
> > this is missing those calls already, and vblanks could only work by
> > accident when enabling a CRTC for the first time right after boot.
> >
> > Big thanks to Tetsuo for helping track down what's going wrong here.
> >
> > There's only a few drivers which already had the necessary call and
> > needed some updating:
> > - komeda, atmel and tidss also needed to be changed to call
> >   __drm_atomic_helper_crtc_reset() intead of open coding it
> > - tegra and msm even had it in the same place already, just code
> >   motion, and malidp already uses __drm_atomic_helper_crtc_reset().
> >
> > Only call left is in i915, which doesn't use drm_mode_config_reset,
> > but has its own fastboot infrastructure. So that's the only case where
> > we actually want this in the driver still.
> >
> > I've also reviewed all other drivers which set up vblank support with
> > drm_vblank_init. After the previous patch fixing mxsfb all atomic
> > drivers do call drm_crtc_vblank_on/off as they should, the remaining
> > drivers are either legacy kms or legacy dri1 drivers, so not affected
> > by this change to atomic helpers.
> >
> > v2: Use the drm_dev_has_vblank() helper.
> >
> > Link: https://syzkaller.appspot.com/bug?id=3D0ba17d70d062b2595e1f061231=
474800f076c7cb
> > Reported-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> > Reported-by: syzbot+0871b14ca2e2fb64f6e3@syzkaller.appspotmail.com
> > Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> > Cc: "James (Qian) Wang" <james.qian.wang@arm.com>
> > Cc: Liviu Dudau <liviu.dudau@arm.com>
> > Cc: Mihail Atanassov <mihail.atanassov@arm.com>
> > Cc: Brian Starkey <brian.starkey@arm.com>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Boris Brezillon <bbrezillon@kernel.org>
> > Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> > Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Thierry Reding <thierry.reding@gmail.com>
> > Cc: Jonathan Hunter <jonathanh@nvidia.com>
> > Cc: Jyri Sarha <jsarha@ti.com>
> > Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> > Cc: Rob Clark <robdclark@gmail.com>
> > Cc: Sean Paul <seanpaul@chromium.org>
> > Cc: Brian Masney <masneyb@onstation.org>
> > Cc: Emil Velikov <emil.velikov@collabora.com>
> > Cc: zhengbin <zhengbin13@huawei.com>
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Cc: linux-tegra@vger.kernel.org
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > ---
> >  drivers/gpu/drm/arm/display/komeda/komeda_crtc.c | 7 ++-----
> >  drivers/gpu/drm/arm/malidp_drv.c                 | 1 -
> >  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c   | 7 ++-----
> >  drivers/gpu/drm/drm_atomic_state_helper.c        | 4 ++++
> >  drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c        | 2 --
> >  drivers/gpu/drm/tegra/dc.c                       | 1 -
> >  drivers/gpu/drm/tidss/tidss_crtc.c               | 3 +--
> >  drivers/gpu/drm/tidss/tidss_kms.c                | 4 ----
> >  8 files changed, 9 insertions(+), 20 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c b/drivers=
/gpu/drm/arm/display/komeda/komeda_crtc.c
> > index 56bd938961ee..f33418d6e1a0 100644
> > --- a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
> > +++ b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
> > @@ -492,10 +492,8 @@ static void komeda_crtc_reset(struct drm_crtc *crt=
c)
> >       crtc->state =3D NULL;
> >
> >       state =3D kzalloc(sizeof(*state), GFP_KERNEL);
> > -     if (state) {
> > -             crtc->state =3D &state->base;
> > -             crtc->state->crtc =3D crtc;
> > -     }
> > +     if (state)
> > +             __drm_atomic_helper_crtc_reset(crtc, &state->base);
> >  }
> >
> >  static struct drm_crtc_state *
> > @@ -616,7 +614,6 @@ static int komeda_crtc_add(struct komeda_kms_dev *k=
ms,
> >               return err;
> >
> >       drm_crtc_helper_add(crtc, &komeda_crtc_helper_funcs);
> > -     drm_crtc_vblank_reset(crtc);
> >
> >       crtc->port =3D kcrtc->master->of_output_port;
> >
> > diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/mal=
idp_drv.c
> > index c2507b7d8512..02904392e370 100644
> > --- a/drivers/gpu/drm/arm/malidp_drv.c
> > +++ b/drivers/gpu/drm/arm/malidp_drv.c
> > @@ -870,7 +870,6 @@ static int malidp_bind(struct device *dev)
> >       drm->irq_enabled =3D true;
> >
> >       ret =3D drm_vblank_init(drm, drm->mode_config.num_crtc);
> > -     drm_crtc_vblank_reset(&malidp->crtc);
>
> It was a couple of years ago but I remember Alexandru-Cosmin tracking an =
issue around
> this. The reason for reseting the vblank so early after calling drm_vblan=
k_init was that
> you could have userspace calling drm_wait_vblank() before crtc activation=
 and in our
> case it will trigger some warnings in the driver (details are fuzzy right=
 now). The
> relevant commit was cabce6343fd ("drm: mali-dp: Call drm_crtc_vblank_rese=
t on device
> init").
>
> Have you done any testing with that scenario on any of the drivers?

This is exactly the scenario that syzbot found and which goes boom
(well infinite busy loop in the hrtimer) with vkms. So I looked at
drivers and noticed that an overwhelming majority of them get this
wrong, hence decided to do this once and for all in helpers.

If you read the patch carefully, I'm only moving it, not removing it.
-Daniel

>
> Best regards,
> Liviu
>
> >       if (ret < 0) {
> >               DRM_ERROR("failed to initialise vblank\n");
> >               goto vblank_fail;
> > diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c b/drivers/g=
pu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
> > index 10985134ce0b..ce246b96330b 100644
> > --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
> > +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
> > @@ -411,10 +411,8 @@ static void atmel_hlcdc_crtc_reset(struct drm_crtc=
 *crtc)
> >       }
> >
> >       state =3D kzalloc(sizeof(*state), GFP_KERNEL);
> > -     if (state) {
> > -             crtc->state =3D &state->base;
> > -             crtc->state->crtc =3D crtc;
> > -     }
> > +     if (state)
> > +             __drm_atomic_helper_crtc_reset(crtc, &state->base);
> >  }
> >
> >  static struct drm_crtc_state *
> > @@ -528,7 +526,6 @@ int atmel_hlcdc_crtc_create(struct drm_device *dev)
> >       }
> >
> >       drm_crtc_helper_add(&crtc->base, &lcdc_crtc_helper_funcs);
> > -     drm_crtc_vblank_reset(&crtc->base);
> >
> >       drm_mode_crtc_set_gamma_size(&crtc->base, ATMEL_HLCDC_CLUT_SIZE);
> >       drm_crtc_enable_color_mgmt(&crtc->base, 0, false,
> > diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/dr=
m/drm_atomic_state_helper.c
> > index 8fce6a115dfe..9ad74045158e 100644
> > --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> > +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> > @@ -32,6 +32,7 @@
> >  #include <drm/drm_device.h>
> >  #include <drm/drm_plane.h>
> >  #include <drm/drm_print.h>
> > +#include <drm/drm_vblank.h>
> >  #include <drm/drm_writeback.h>
> >
> >  #include <linux/slab.h>
> > @@ -93,6 +94,9 @@ __drm_atomic_helper_crtc_reset(struct drm_crtc *crtc,
> >       if (crtc_state)
> >               __drm_atomic_helper_crtc_state_reset(crtc_state, crtc);
> >
> > +     if (drm_dev_has_vblank(crtc->dev))
> > +             drm_crtc_vblank_reset(crtc);
> > +
> >       crtc->state =3D crtc_state;
> >  }
> >  EXPORT_SYMBOL(__drm_atomic_helper_crtc_reset);
> > diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c b/drivers/gpu/dr=
m/msm/disp/mdp5/mdp5_crtc.c
> > index ca3368c828d0..9606185c284b 100644
> > --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> > +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> > @@ -1117,8 +1117,6 @@ static void mdp5_crtc_reset(struct drm_crtc *crtc=
)
> >               mdp5_crtc_destroy_state(crtc, crtc->state);
> >
> >       __drm_atomic_helper_crtc_reset(crtc, &mdp5_cstate->base);
> > -
> > -     drm_crtc_vblank_reset(crtc);
> >  }
> >
> >  static const struct drm_crtc_funcs mdp5_crtc_funcs =3D {
> > diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> > index 83f31c6e891c..9b308b572eac 100644
> > --- a/drivers/gpu/drm/tegra/dc.c
> > +++ b/drivers/gpu/drm/tegra/dc.c
> > @@ -1168,7 +1168,6 @@ static void tegra_crtc_reset(struct drm_crtc *crt=
c)
> >               tegra_crtc_atomic_destroy_state(crtc, crtc->state);
> >
> >       __drm_atomic_helper_crtc_reset(crtc, &state->base);
> > -     drm_crtc_vblank_reset(crtc);
> >  }
> >
> >  static struct drm_crtc_state *
> > diff --git a/drivers/gpu/drm/tidss/tidss_crtc.c b/drivers/gpu/drm/tidss=
/tidss_crtc.c
> > index 89a226912de8..4d01c4af61cd 100644
> > --- a/drivers/gpu/drm/tidss/tidss_crtc.c
> > +++ b/drivers/gpu/drm/tidss/tidss_crtc.c
> > @@ -352,8 +352,7 @@ static void tidss_crtc_reset(struct drm_crtc *crtc)
> >               return;
> >       }
> >
> > -     crtc->state =3D &tcrtc->base;
> > -     crtc->state->crtc =3D crtc;
> > +     __drm_atomic_helper_crtc_reset(crtc, &tcrtc->base);
> >  }
> >
> >  static struct drm_crtc_state *tidss_crtc_duplicate_state(struct drm_cr=
tc *crtc)
> > diff --git a/drivers/gpu/drm/tidss/tidss_kms.c b/drivers/gpu/drm/tidss/=
tidss_kms.c
> > index 4b99e9fa84a5..e6ab59eed259 100644
> > --- a/drivers/gpu/drm/tidss/tidss_kms.c
> > +++ b/drivers/gpu/drm/tidss/tidss_kms.c
> > @@ -278,10 +278,6 @@ int tidss_modeset_init(struct tidss_device *tidss)
> >       if (ret)
> >               return ret;
> >
> > -     /* Start with vertical blanking interrupt reporting disabled. */
> > -     for (i =3D 0; i < tidss->num_crtcs; ++i)
> > -             drm_crtc_vblank_reset(tidss->crtcs[i]);
> > -
> >       drm_mode_config_reset(ddev);
> >
> >       dev_dbg(tidss->dev, "%s done\n", __func__);
> > --
> > 2.26.2
> >
>
> --
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> | I would like to |
> | fix the world,  |
> | but they're not |
> | giving me the   |
>  \ source code!  /
>   ---------------
>     =C2=AF\_(=E3=83=84)_/=C2=AF



--=20
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch

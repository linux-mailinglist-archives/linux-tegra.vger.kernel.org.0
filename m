Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D59CA1E45B1
	for <lists+linux-tegra@lfdr.de>; Wed, 27 May 2020 16:21:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389134AbgE0OVs (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 27 May 2020 10:21:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389103AbgE0OVr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 27 May 2020 10:21:47 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BE5DC08C5C1
        for <linux-tegra@vger.kernel.org>; Wed, 27 May 2020 07:21:47 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id g25so19224875otp.13
        for <linux-tegra@vger.kernel.org>; Wed, 27 May 2020 07:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=IwlzB0V7blT/5w82RdP0jblAY6zN0/L9ncQTh0kThj8=;
        b=PEQVCXmC70kkfgy1xaUK3+fAbZnlhWsWA5XwUp/za+eeKonvvbuq9qFTYfbEirPa4R
         JVkswVA2qP4HpwJ4dtBxS4WTun8NWEHj7HSE17gObQuZu/FRtTBQbY8FxiABdj2PUhTN
         Cx51FjxziY/zXGYdrk+IQT3uvIdnhxvnZDYuw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=IwlzB0V7blT/5w82RdP0jblAY6zN0/L9ncQTh0kThj8=;
        b=SA+NS+emwyvZG1FRwfVxjvJnW7ODcd2YFxJexNrDBD7Pr6gdN3FYY8J3+mbqur1maC
         BAjO7UBz2iMj8zxUtqgTXY6jZvLDbKJXTVMNs3GueZCU/pNL3tg9X33sgJam3RU5Qoi5
         19APF9chLem7COxmHvGwMIFiWDUkoVamVi9ee/JdlXJ5ubeUFYvZWq+OvhUcyQL0+JqE
         pswb6fiXcMZGzsAewMrxS8KsjggPAnnS4RqZoXJUb4fBAvXB4CBWoaZRGUQXXQeQfS4i
         ldqrXQN/uxwIbM+0gnBJgc6Fj4mvWNUZkplDxztTmQ6pBXIHJKXwFYAjAIKS5eZLmeZf
         v5Ig==
X-Gm-Message-State: AOAM5331uUQ7fa39cUHWHem/m2Jflcr/rBA5rmoI8p9Tp7NN4ePXVP9O
        wBYkHSV536SqLz+8lW+WYRJ6MEuF+2jlMYmQ3xydZA==
X-Google-Smtp-Source: ABdhPJwWgO4mX6E2JPK7DSAajnXjTJ6ioXSASjS1nMyqGDmHqtr9VR4DITqHkreDehAYuDD23EaHXQPV3TPwA/H97Oc=
X-Received: by 2002:a9d:600e:: with SMTP id h14mr5083073otj.281.1590589306521;
 Wed, 27 May 2020 07:21:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200527094757.1414174-2-daniel.vetter@ffwll.ch>
 <20200527095332.1439425-1-daniel.vetter@ffwll.ch> <20200527105702.GI159988@e110455-lin.cambridge.arm.com>
 <CAKMK7uFiCXa_NtEAVzHsXOb8QHmU0yXkqRWXvW3ayvRixDWnbA@mail.gmail.com> <20200527120809.GJ159988@e110455-lin.cambridge.arm.com>
In-Reply-To: <20200527120809.GJ159988@e110455-lin.cambridge.arm.com>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Wed, 27 May 2020 16:21:34 +0200
Message-ID: <CAKMK7uHVm5LfgGiomGVXSSrebbXXHtWh70vdxi1meXtUSSYN6w@mail.gmail.com>
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

On Wed, May 27, 2020 at 2:08 PM Liviu Dudau <liviu.dudau@arm.com> wrote:
>
> On Wed, May 27, 2020 at 01:07:05PM +0200, Daniel Vetter wrote:
> > On Wed, May 27, 2020 at 12:57 PM Liviu Dudau <liviu.dudau@arm.com> wrot=
e:
> > >
> > > Hi Daniel,
> > >
> > > On Wed, May 27, 2020 at 11:53:32AM +0200, Daniel Vetter wrote:
> > > > Only when vblanks are supported ofc.
> > > >
> > > > Some drivers do this already, but most unfortunately missed it. Thi=
s
> > > > opens up bugs after driver load, before the crtc is enabled for the
> > > > first time. syzbot spotted this when loading vkms as a secondary
> > > > output. Given how many drivers are buggy it's best to solve this on=
ce
> > > > and for all in shared helper code.
> > > >
> > > > Aside from moving the few existing calls to drm_crtc_vblank_reset i=
nto
> > > > helpers (i915 doesn't use helpers, so keeps its own) I think the
> > > > regression risk is minimal: atomic helpers already rely on drivers
> > > > calling drm_crtc_vblank_on/off correctly in their hooks when they
> > > > support vblanks. And driver that's failing to handle vblanks after
> > > > this is missing those calls already, and vblanks could only work by
> > > > accident when enabling a CRTC for the first time right after boot.
> > > >
> > > > Big thanks to Tetsuo for helping track down what's going wrong here=
.
> > > >
> > > > There's only a few drivers which already had the necessary call and
> > > > needed some updating:
> > > > - komeda, atmel and tidss also needed to be changed to call
> > > >   __drm_atomic_helper_crtc_reset() intead of open coding it
> > > > - tegra and msm even had it in the same place already, just code
> > > >   motion, and malidp already uses __drm_atomic_helper_crtc_reset().
> > > >
> > > > Only call left is in i915, which doesn't use drm_mode_config_reset,
> > > > but has its own fastboot infrastructure. So that's the only case wh=
ere
> > > > we actually want this in the driver still.
> > > >
> > > > I've also reviewed all other drivers which set up vblank support wi=
th
> > > > drm_vblank_init. After the previous patch fixing mxsfb all atomic
> > > > drivers do call drm_crtc_vblank_on/off as they should, the remainin=
g
> > > > drivers are either legacy kms or legacy dri1 drivers, so not affect=
ed
> > > > by this change to atomic helpers.
> > > >
> > > > v2: Use the drm_dev_has_vblank() helper.
> > > >
> > > > Link: https://syzkaller.appspot.com/bug?id=3D0ba17d70d062b2595e1f06=
1231474800f076c7cb
> > > > Reported-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> > > > Reported-by: syzbot+0871b14ca2e2fb64f6e3@syzkaller.appspotmail.com
> > > > Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> > > > Cc: "James (Qian) Wang" <james.qian.wang@arm.com>
> > > > Cc: Liviu Dudau <liviu.dudau@arm.com>
> > > > Cc: Mihail Atanassov <mihail.atanassov@arm.com>
> > > > Cc: Brian Starkey <brian.starkey@arm.com>
> > > > Cc: Sam Ravnborg <sam@ravnborg.org>
> > > > Cc: Boris Brezillon <bbrezillon@kernel.org>
> > > > Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> > > > Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > > > Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
> > > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > > Cc: Maxime Ripard <mripard@kernel.org>
> > > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > > Cc: David Airlie <airlied@linux.ie>
> > > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > > Cc: Thierry Reding <thierry.reding@gmail.com>
> > > > Cc: Jonathan Hunter <jonathanh@nvidia.com>
> > > > Cc: Jyri Sarha <jsarha@ti.com>
> > > > Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> > > > Cc: Rob Clark <robdclark@gmail.com>
> > > > Cc: Sean Paul <seanpaul@chromium.org>
> > > > Cc: Brian Masney <masneyb@onstation.org>
> > > > Cc: Emil Velikov <emil.velikov@collabora.com>
> > > > Cc: zhengbin <zhengbin13@huawei.com>
> > > > Cc: Thomas Gleixner <tglx@linutronix.de>
> > > > Cc: linux-tegra@vger.kernel.org
> > > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/arm/display/komeda/komeda_crtc.c | 7 ++-----
> > > >  drivers/gpu/drm/arm/malidp_drv.c                 | 1 -
> > > >  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c   | 7 ++-----
> > > >  drivers/gpu/drm/drm_atomic_state_helper.c        | 4 ++++
> > > >  drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c        | 2 --
> > > >  drivers/gpu/drm/tegra/dc.c                       | 1 -
> > > >  drivers/gpu/drm/tidss/tidss_crtc.c               | 3 +--
> > > >  drivers/gpu/drm/tidss/tidss_kms.c                | 4 ----
> > > >  8 files changed, 9 insertions(+), 20 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c b/dri=
vers/gpu/drm/arm/display/komeda/komeda_crtc.c
> > > > index 56bd938961ee..f33418d6e1a0 100644
> > > > --- a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
> > > > +++ b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
> > > > @@ -492,10 +492,8 @@ static void komeda_crtc_reset(struct drm_crtc =
*crtc)
> > > >       crtc->state =3D NULL;
> > > >
> > > >       state =3D kzalloc(sizeof(*state), GFP_KERNEL);
> > > > -     if (state) {
> > > > -             crtc->state =3D &state->base;
> > > > -             crtc->state->crtc =3D crtc;
> > > > -     }
> > > > +     if (state)
> > > > +             __drm_atomic_helper_crtc_reset(crtc, &state->base);
> > > >  }
> > > >
> > > >  static struct drm_crtc_state *
> > > > @@ -616,7 +614,6 @@ static int komeda_crtc_add(struct komeda_kms_de=
v *kms,
> > > >               return err;
> > > >
> > > >       drm_crtc_helper_add(crtc, &komeda_crtc_helper_funcs);
> > > > -     drm_crtc_vblank_reset(crtc);
> > > >
> > > >       crtc->port =3D kcrtc->master->of_output_port;
> > > >
> > > > diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm=
/malidp_drv.c
> > > > index c2507b7d8512..02904392e370 100644
> > > > --- a/drivers/gpu/drm/arm/malidp_drv.c
> > > > +++ b/drivers/gpu/drm/arm/malidp_drv.c
> > > > @@ -870,7 +870,6 @@ static int malidp_bind(struct device *dev)
> > > >       drm->irq_enabled =3D true;
> > > >
> > > >       ret =3D drm_vblank_init(drm, drm->mode_config.num_crtc);
> > > > -     drm_crtc_vblank_reset(&malidp->crtc);
> > >
> > > It was a couple of years ago but I remember Alexandru-Cosmin tracking=
 an issue around
> > > this. The reason for reseting the vblank so early after calling drm_v=
blank_init was that
> > > you could have userspace calling drm_wait_vblank() before crtc activa=
tion and in our
> > > case it will trigger some warnings in the driver (details are fuzzy r=
ight now). The
> > > relevant commit was cabce6343fd ("drm: mali-dp: Call drm_crtc_vblank_=
reset on device
> > > init").
> > >
> > > Have you done any testing with that scenario on any of the drivers?
> >
> > This is exactly the scenario that syzbot found and which goes boom
> > (well infinite busy loop in the hrtimer) with vkms. So I looked at
> > drivers and noticed that an overwhelming majority of them get this
> > wrong, hence decided to do this once and for all in helpers.
> >
> > If you read the patch carefully, I'm only moving it, not removing it.
>
> That is what I'm questioning. The drm_crtc_vblank_reset() was placed righ=
t after
> drm_vblank_init() for a good reason, by moving it the warning might come =
back.
> I guess your answer will be that I need to do the testing on my own platf=
orm to find
> out, I was just asking about status on other platforms.

Userspace can't sneak in before we call drm_dev_register. Both before
and after this patch the call to drm_crtc_vblank_reset() happens
before that point, so if your only concern is userspace sneaking in a
vblank ioctl, then it's all still safe.

If there's other concerns, then that's different ofc. But before
calling drm_mode_config_reset() any atomic commit will Oops, so
there's really not a hole lot of code that might expect vblanks to
work before that. I didn't find any in the driver (grep for vblank
wait functions does that job).
-Daniel

>
> Best regards,
> Liviu
>
> > -Daniel
> >
> > >
> > > Best regards,
> > > Liviu
> > >
> > > >       if (ret < 0) {
> > > >               DRM_ERROR("failed to initialise vblank\n");
> > > >               goto vblank_fail;
> > > > diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c b/drive=
rs/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
> > > > index 10985134ce0b..ce246b96330b 100644
> > > > --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
> > > > +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
> > > > @@ -411,10 +411,8 @@ static void atmel_hlcdc_crtc_reset(struct drm_=
crtc *crtc)
> > > >       }
> > > >
> > > >       state =3D kzalloc(sizeof(*state), GFP_KERNEL);
> > > > -     if (state) {
> > > > -             crtc->state =3D &state->base;
> > > > -             crtc->state->crtc =3D crtc;
> > > > -     }
> > > > +     if (state)
> > > > +             __drm_atomic_helper_crtc_reset(crtc, &state->base);
> > > >  }
> > > >
> > > >  static struct drm_crtc_state *
> > > > @@ -528,7 +526,6 @@ int atmel_hlcdc_crtc_create(struct drm_device *=
dev)
> > > >       }
> > > >
> > > >       drm_crtc_helper_add(&crtc->base, &lcdc_crtc_helper_funcs);
> > > > -     drm_crtc_vblank_reset(&crtc->base);
> > > >
> > > >       drm_mode_crtc_set_gamma_size(&crtc->base, ATMEL_HLCDC_CLUT_SI=
ZE);
> > > >       drm_crtc_enable_color_mgmt(&crtc->base, 0, false,
> > > > diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gp=
u/drm/drm_atomic_state_helper.c
> > > > index 8fce6a115dfe..9ad74045158e 100644
> > > > --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> > > > +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> > > > @@ -32,6 +32,7 @@
> > > >  #include <drm/drm_device.h>
> > > >  #include <drm/drm_plane.h>
> > > >  #include <drm/drm_print.h>
> > > > +#include <drm/drm_vblank.h>
> > > >  #include <drm/drm_writeback.h>
> > > >
> > > >  #include <linux/slab.h>
> > > > @@ -93,6 +94,9 @@ __drm_atomic_helper_crtc_reset(struct drm_crtc *c=
rtc,
> > > >       if (crtc_state)
> > > >               __drm_atomic_helper_crtc_state_reset(crtc_state, crtc=
);
> > > >
> > > > +     if (drm_dev_has_vblank(crtc->dev))
> > > > +             drm_crtc_vblank_reset(crtc);
> > > > +
> > > >       crtc->state =3D crtc_state;
> > > >  }
> > > >  EXPORT_SYMBOL(__drm_atomic_helper_crtc_reset);
> > > > diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c b/drivers/gp=
u/drm/msm/disp/mdp5/mdp5_crtc.c
> > > > index ca3368c828d0..9606185c284b 100644
> > > > --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> > > > +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> > > > @@ -1117,8 +1117,6 @@ static void mdp5_crtc_reset(struct drm_crtc *=
crtc)
> > > >               mdp5_crtc_destroy_state(crtc, crtc->state);
> > > >
> > > >       __drm_atomic_helper_crtc_reset(crtc, &mdp5_cstate->base);
> > > > -
> > > > -     drm_crtc_vblank_reset(crtc);
> > > >  }
> > > >
> > > >  static const struct drm_crtc_funcs mdp5_crtc_funcs =3D {
> > > > diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.=
c
> > > > index 83f31c6e891c..9b308b572eac 100644
> > > > --- a/drivers/gpu/drm/tegra/dc.c
> > > > +++ b/drivers/gpu/drm/tegra/dc.c
> > > > @@ -1168,7 +1168,6 @@ static void tegra_crtc_reset(struct drm_crtc =
*crtc)
> > > >               tegra_crtc_atomic_destroy_state(crtc, crtc->state);
> > > >
> > > >       __drm_atomic_helper_crtc_reset(crtc, &state->base);
> > > > -     drm_crtc_vblank_reset(crtc);
> > > >  }
> > > >
> > > >  static struct drm_crtc_state *
> > > > diff --git a/drivers/gpu/drm/tidss/tidss_crtc.c b/drivers/gpu/drm/t=
idss/tidss_crtc.c
> > > > index 89a226912de8..4d01c4af61cd 100644
> > > > --- a/drivers/gpu/drm/tidss/tidss_crtc.c
> > > > +++ b/drivers/gpu/drm/tidss/tidss_crtc.c
> > > > @@ -352,8 +352,7 @@ static void tidss_crtc_reset(struct drm_crtc *c=
rtc)
> > > >               return;
> > > >       }
> > > >
> > > > -     crtc->state =3D &tcrtc->base;
> > > > -     crtc->state->crtc =3D crtc;
> > > > +     __drm_atomic_helper_crtc_reset(crtc, &tcrtc->base);
> > > >  }
> > > >
> > > >  static struct drm_crtc_state *tidss_crtc_duplicate_state(struct dr=
m_crtc *crtc)
> > > > diff --git a/drivers/gpu/drm/tidss/tidss_kms.c b/drivers/gpu/drm/ti=
dss/tidss_kms.c
> > > > index 4b99e9fa84a5..e6ab59eed259 100644
> > > > --- a/drivers/gpu/drm/tidss/tidss_kms.c
> > > > +++ b/drivers/gpu/drm/tidss/tidss_kms.c
> > > > @@ -278,10 +278,6 @@ int tidss_modeset_init(struct tidss_device *ti=
dss)
> > > >       if (ret)
> > > >               return ret;
> > > >
> > > > -     /* Start with vertical blanking interrupt reporting disabled.=
 */
> > > > -     for (i =3D 0; i < tidss->num_crtcs; ++i)
> > > > -             drm_crtc_vblank_reset(tidss->crtcs[i]);
> > > > -
> > > >       drm_mode_config_reset(ddev);
> > > >
> > > >       dev_dbg(tidss->dev, "%s done\n", __func__);
> > > > --
> > > > 2.26.2
> > > >
> > >
> > > --
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > | I would like to |
> > > | fix the world,  |
> > > | but they're not |
> > > | giving me the   |
> > >  \ source code!  /
> > >   ---------------
> > >     =C2=AF\_(=E3=83=84)_/=C2=AF
> >
> >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > +41 (0) 79 365 57 48 - http://blog.ffwll.ch
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

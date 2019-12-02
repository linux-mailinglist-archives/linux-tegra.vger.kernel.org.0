Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 382DC10EBF8
	for <lists+linux-tegra@lfdr.de>; Mon,  2 Dec 2019 15:58:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727418AbfLBO6j (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 2 Dec 2019 09:58:39 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:38594 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727401AbfLBO6j (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 2 Dec 2019 09:58:39 -0500
Received: by mail-wm1-f66.google.com with SMTP id p17so41637wmi.3
        for <linux-tegra@vger.kernel.org>; Mon, 02 Dec 2019 06:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=HhNNKWKgWNuEAPtT1Vjv1T/7nnaGw0UDxj3LXLsuAWY=;
        b=CMn+mVhEjg/f1NOC/MjsZAyciqk0aZx3KbimHAuiGfIY1oaKAI/QcHDyLGJ+mlT/6G
         HAh64N2SdaVT5u5BIypEBzcg6Ki/X1uEstJn1m6mr8CJi2gGtTGdUpYvELpWusGIR3+k
         tvfX/5/bjf2GRO1z/7e1QDn8KiMd5j+NvsCap5ydoT7v9pwPb4OoTZ2RocqTSRNFgAm3
         gIXB6a4fHFmvOEX0VPktdFeir4XVO3bicsVvZMYpm1DWvtLMw/5fJ3RFvftAysRYvvQm
         +02yaqluaSpZTGzwTvEz9qtU7NQKYnHIaMKQyFXn9LH9eGybbChy4L/zvxWYEd1nvAaa
         0f4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HhNNKWKgWNuEAPtT1Vjv1T/7nnaGw0UDxj3LXLsuAWY=;
        b=bEkjJOsDsJPymHOnDGeuX1kg2QiSgIaZZxOHmD3QF+2TB9lwefcP5LaNnguLBlwNed
         QOaXAZxNa3p9SoiDADZn02pU18oX8GnsWtDPMllTBarvCC3BTwupUiVTnzdI8miLm1xJ
         hhiWdo9kUQYEb3q4/B30q4tdFdo/dBrffmrjyjUce/F8qkOvxGpwRs2a5j+0E/mI67oo
         BjXLQJA66ARfZVaW/N2zjF7XPzPofmzW7Ikh5oCZPEGg3Ypj5JTHNkBueikuUEGgbFvc
         DSUGxvC6D5DpXMp0dq7dLNPe02ABUEm9toX3EmBtZRemlyxZyMpF84fMir6HPuFaWG3d
         2o3w==
X-Gm-Message-State: APjAAAU94vIBZnc225Dn3F3uWm6DWuZpZy+mpDj8FAimpvrgp3yTP2Ab
        rz58iJeP0+E7FIXPNtHCQAM=
X-Google-Smtp-Source: APXvYqxi2B7UUxhv7tmnKO6mHfOp15xi0HwF07Gab0tJjHv99hPLesGd7OPgHT8FM/FeXKfp0NYT4Q==
X-Received: by 2002:a7b:cc6a:: with SMTP id n10mr16620360wmj.170.1575298716332;
        Mon, 02 Dec 2019 06:58:36 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id k8sm17603503wrl.3.2019.12.02.06.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2019 06:58:34 -0800 (PST)
Date:   Mon, 2 Dec 2019 15:58:33 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 8/9] drm/tegra: dpaux: Add missing runtime PM references
Message-ID: <20191202145833.GB56608@ulmo>
References: <20191128153741.2380419-1-thierry.reding@gmail.com>
 <20191128153741.2380419-9-thierry.reding@gmail.com>
 <20191129092319.GD624164@phenom.ffwll.local>
 <20191129104412.GD2771912@ulmo>
 <20191129202025.GT624164@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="PmA2V3Z32TCmWXqI"
Content-Disposition: inline
In-Reply-To: <20191129202025.GT624164@phenom.ffwll.local>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--PmA2V3Z32TCmWXqI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 29, 2019 at 09:20:25PM +0100, Daniel Vetter wrote:
> On Fri, Nov 29, 2019 at 11:44:12AM +0100, Thierry Reding wrote:
> > On Fri, Nov 29, 2019 at 10:23:19AM +0100, Daniel Vetter wrote:
> > > On Thu, Nov 28, 2019 at 04:37:40PM +0100, Thierry Reding wrote:
> > > > From: Thierry Reding <treding@nvidia.com>
> > > >=20
> > > > Ensure that a runtime PM reference is acquired each time the DPAUX
> > > > registers are accessed. Otherwise the code may end up running witho=
ut
> > > > the controller being powered, out-of-reset or clocked in some corner
> > > > cases, resulting in a crash.
> > > >=20
> > > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > >=20
> > > On patches 4,5,7 in this series Acked-by: Daniel Vetter <daniel.vette=
r@ffwll.ch>
> > >=20
> > > On this one here I'm very confused.
> > >=20
> > > - Why do you drop the runtime pm between enable and disable? Is that =
just
> > >   how the hw works, i.e. the pad config stays, just the registers go =
away?
> >=20
> > Now you've made me doubt this. I don't think the pad configuration stays
> > across runtime suspend/resume, so you're right, this shouldn't work.
> > I'll need to go retest this one specifically.
> >=20
> > I had added these runtime PM references to ensure the device was
> > properly configured at resume from suspend, but there ended up being an
> > additional issue with the I2C driver that relies on this, so perhaps
> > this may not be necessary in the end.
> >=20
> > > - I'm not seeing any locking between the different users (dp aux and
> > >   pinctrl). We might want to change drm_dp_aux->hw_mutex to a pointer=
 to
> > >   make this easier (but I'm not super fond of that pattern from i2c).
> >=20
> > There should be no need to lock here. DP AUX transfers will only be used
> > between drm_dp_aux_enable() and drm_dp_aux_disable().
>=20
> So dp aux vs. dp aux aside (that's the next point below), there's
> guaranteed no one else can get at that pinctrl mux? Since the other
> setting is labelled I2C I assumed there's an i2c controller hanging of it,
> exposed to userspace, and userspace might probe that whenever it feels
> like (similar to the issue below). But I don't know your hw, nor do I
> really know pinctrl. Just looked a bit strange.

Well technically anyone could get at the mux, but since it controls the
pins of a single I2C controller, only that I2C controller should ever
get its hands on the pinmux. Anything else would be an error in the DT.

Now, the pins can also be used in AUX mode when the SOR is used in DP
mode. However, since DP and HDMI are mutually exclusive, this is a board
level decision, so in practice you're only ever going to see them used
in either I2C or AUX mode. The "off" mode is used only for power saving
when I2C or DPAUX don't use the pins.

Regarding the runtime PM references, it turns out that those are
completely bogus because we already take a runtime PM reference at
probe time. I'm going to drop this patch and look into fixing the other,
real issues that you pointed out.

Thierry

>=20
> Cheers, Daniel
>=20
>=20
> > > - Your drm_dp_aux_enable/disable needs to be moved into the ->transfer
> > >   callback, otherwise the various userspace interface (dp aux, but al=
so
> > >   i2c on top of that) won't work. Some pre/post_transfer functions li=
ke
> > >   i2c has might be useful for stuff like this.
> >=20
> > I suppose it would be possible for someone to attempt to use those
> > userspace interfaces outside of drm_dp_aux_enable()/drm_dp_aux_disable()
> > and then the locking would be required.
> >=20
> > I'll look into that.
> >=20
> > Thierry
> >=20
> > >=20
> > > Cheers, Daniel
> > >=20
> > > > ---
> > > >  drivers/gpu/drm/tegra/dpaux.c | 16 ++++++++++++++--
> > > >  1 file changed, 14 insertions(+), 2 deletions(-)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/=
dpaux.c
> > > > index 622cdf1ad246..4b2b86aed1a5 100644
> > > > --- a/drivers/gpu/drm/tegra/dpaux.c
> > > > +++ b/drivers/gpu/drm/tegra/dpaux.c
> > > > @@ -434,8 +434,13 @@ static int tegra_dpaux_set_mux(struct pinctrl_=
dev *pinctrl,
> > > >  			       unsigned int function, unsigned int group)
> > > >  {
> > > >  	struct tegra_dpaux *dpaux =3D pinctrl_dev_get_drvdata(pinctrl);
> > > > +	int err;
> > > > +
> > > > +	pm_runtime_get_sync(dpaux->dev);
> > > > +	err =3D tegra_dpaux_pad_config(dpaux, function);
> > > > +	pm_runtime_put(dpaux->dev);
> > > > =20
> > > > -	return tegra_dpaux_pad_config(dpaux, function);
> > > > +	return err;
> > > >  }
> > > > =20
> > > >  static const struct pinmux_ops tegra_dpaux_pinmux_ops =3D {
> > > > @@ -809,15 +814,22 @@ enum drm_connector_status drm_dp_aux_detect(s=
truct drm_dp_aux *aux)
> > > >  int drm_dp_aux_enable(struct drm_dp_aux *aux)
> > > >  {
> > > >  	struct tegra_dpaux *dpaux =3D to_dpaux(aux);
> > > > +	int err;
> > > > +
> > > > +	pm_runtime_get_sync(dpaux->dev);
> > > > +	err =3D tegra_dpaux_pad_config(dpaux, DPAUX_PADCTL_FUNC_AUX);
> > > > +	pm_runtime_put(dpaux->dev);
> > > > =20
> > > > -	return tegra_dpaux_pad_config(dpaux, DPAUX_PADCTL_FUNC_AUX);
> > > > +	return err;
> > > >  }
> > > > =20
> > > >  int drm_dp_aux_disable(struct drm_dp_aux *aux)
> > > >  {
> > > >  	struct tegra_dpaux *dpaux =3D to_dpaux(aux);
> > > > =20
> > > > +	pm_runtime_get_sync(dpaux->dev);
> > > >  	tegra_dpaux_pad_power_down(dpaux);
> > > > +	pm_runtime_put(dpaux->dev);
> > > > =20
> > > >  	return 0;
> > > >  }
> > > > --=20
> > > > 2.23.0
> > > >=20
> > > > _______________________________________________
> > > > dri-devel mailing list
> > > > dri-devel@lists.freedesktop.org
> > > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > >=20
> > > --=20
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
>=20
>=20
>=20
> --=20
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

--PmA2V3Z32TCmWXqI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3lJpkACgkQ3SOs138+
s6HmXA/9HGBVEOn5lL+hQ+yWdZWLM/xtzaBOcY6GYXZqq5lmiG9NmC8XI3QGF8ZO
SLKO6TwbcVOp+WIPImVLhtfzyfN+GBZc4FkOstQCqmw5vGXbigx0GVWv9KhGygm1
x3GMH6TWzOpsWzQ9K7bltqVLzwR71MKM1KNhp2IFsN12hKx7qJJ6ZzX4W8snhc77
gJv0CqF9pCuZreRY/GInAqsGOi6k4ChhsFjEhozsSSJnr0jps7aIPLlZx092azeN
yQ5mnkl47pUZZKQCLFlbZgvUK3wR+PQJB9eeCnWzVLO51D6Gia/SnFA/Y9JVMMmZ
E7IGvcKoITHphCm4Q/qoqT92A2JqutLu0mn1EiaJp/bG9Q+rzqK28unFSOwdR1N1
ZYnpu62RvNv/1XL517NwuJTSAx3xG5/L6Larb9+oivXidWeGExhr5bUV9moy02Gh
TAH+dVkXYdV6Sk5CZ2VuKGERP8lk0bOM7lZJVsW1d+Q0rMWg6Du00qgD5H2/cngZ
6JmbEsTSFX95d+bkbqSTV2b5ubFvjVURY3oaKcUpjtURV1785UflNoebz4JnlMX+
pjrwXdio7zw0b4fo2LwagmG/7iDpnit7ynrNEBEepIedMCf0HsrcDiMQG5WzluSU
M2vKUpIiQGd4Fwf5ARn0kiIJ18IJuRMuBYXQu6hn3/5u+DI2D5M=
=hhEW
-----END PGP SIGNATURE-----

--PmA2V3Z32TCmWXqI--

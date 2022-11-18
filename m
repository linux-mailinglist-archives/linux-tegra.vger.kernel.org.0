Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA43C62F9A0
	for <lists+linux-tegra@lfdr.de>; Fri, 18 Nov 2022 16:45:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242071AbiKRPpC (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 18 Nov 2022 10:45:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241407AbiKRPpB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 18 Nov 2022 10:45:01 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B6347D508;
        Fri, 18 Nov 2022 07:45:00 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id gv23so14018014ejb.3;
        Fri, 18 Nov 2022 07:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o6L5mgU+JKnbKwI6y15nMhU3sJXrsWXfh8EhGsXVHEM=;
        b=FtAxkKH1luQM/BxQ7Z67dVxHUCYHZG5WMV5xWEsTi6BHG/mLSSrnCm1V1TFXLPn+V3
         vuMo7fu6Sa/VGTf73YwH/GDKR0IG0qSxhXTd8sO8rVdh1aBQNzBR7JR0D0XdjIrj3eKy
         eCTck4ERuXvkffONQsY6Ppb1N/UKi72SQaXjB3vF1hziagGGpiG0t59hc6uJq3stxTCm
         GXMPkdesN7YEEliMWa1bDDHoHxmxFPygYB6yToMa2Ya0wTPur3IUwWfjvX82ng1I8oCf
         ZtuU+30muLMICSic2Bx6/1z/GiBcDVfswhkGTz4O4Poy/0bNY95FewuExwf7AgDjz7S5
         Ol1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o6L5mgU+JKnbKwI6y15nMhU3sJXrsWXfh8EhGsXVHEM=;
        b=h5YMP92F7zr6utrJxQhRqOxtFdwIQKiFy/4+K8g2+b9E0E8MCUfE88xB7U0cLFs9Fs
         9yGtPBBrq/LCXtOCSiCqp75/HFm/fG4WEN53GAQeZQadTeRXZIMnvJ+U07Y4Jw7yGxzh
         tZZEyG0LoHywFfCeSVNa15WAUYXGw32TaNxAMDyOB4yEkOVF9DO1al7OP/RJSHZTyEOh
         eAwj+gEWR7LxQZfp7XcB0sXZMwQqqZuAoZZAvGpVSR1/Nn1yd8gzUVWoYvcIfOuikO8l
         dvunIKNxdKhabM4zEv5Fary30XB1yeN0WOrbsCdZOqd/MLTozJ7yv292454PIpUjc+tT
         dA5A==
X-Gm-Message-State: ANoB5pm9Qy2JR//ZWomFBVdAQAemVQUECZEDJ6ufJCXWw7KMbQTTk6lc
        2qJT78siucFh6aNP+WNeC5g=
X-Google-Smtp-Source: AA0mqf6a7mxrvxb7UFmpnOkrs2KK4TZdU/yC+2D6DmftlrmiOzdJ4WYvQpr1TnQ2XJ8nibIu/iSLcg==
X-Received: by 2002:a17:906:9457:b0:7ac:db40:7e1 with SMTP id z23-20020a170906945700b007acdb4007e1mr6593275ejx.204.1668786299018;
        Fri, 18 Nov 2022 07:44:59 -0800 (PST)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id d23-20020a056402001700b00461aca1c7b6sm1957753edu.6.2022.11.18.07.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 07:44:58 -0800 (PST)
Date:   Fri, 18 Nov 2022 16:44:56 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     David Airlie <airlied@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        Robin Murphy <robin.murphy@arm.com>,
        dri-devel@lists.freedesktop.org, Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v3 7/8] drm/simpledrm: Support the XB24/AB24 format
Message-ID: <Y3eoeLLOxHaruPOV@orome>
References: <20221117184039.2291937-1-thierry.reding@gmail.com>
 <20221117184039.2291937-8-thierry.reding@gmail.com>
 <7018f094-e1f8-d82d-f4b2-b1ae833d1c47@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vNq/aMDFmk2Q3leG"
Content-Disposition: inline
In-Reply-To: <7018f094-e1f8-d82d-f4b2-b1ae833d1c47@suse.de>
User-Agent: Mutt/2.2.8 (2022-11-05)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--vNq/aMDFmk2Q3leG
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 18, 2022 at 04:08:23PM +0100, Thomas Zimmermann wrote:
> Hi
>=20
> Am 17.11.22 um 19:40 schrieb Thierry Reding:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Add XB24 and AB24 to the list of supported formats. The format helpers
> > support conversion to these formats and they are documented in the
> > simple-framebuffer device tree bindings.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> > Changes in v2:
> > - treat AB24 as XB24 and support both at the same time
> >=20
> >   drivers/gpu/drm/tiny/simpledrm.c       | 2 ++
> >   include/linux/platform_data/simplefb.h | 1 +
> >   2 files changed, 3 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/si=
mpledrm.c
> > index 7f39bc58da52..ba1c2057fc65 100644
> > --- a/drivers/gpu/drm/tiny/simpledrm.c
> > +++ b/drivers/gpu/drm/tiny/simpledrm.c
> > @@ -483,6 +483,8 @@ static int simpledrm_device_init_regulators(struct =
simpledrm_device *sdev)
> >   static const uint32_t simpledrm_primary_plane_formats[] =3D {
> >   	DRM_FORMAT_XRGB8888,
> >   	DRM_FORMAT_ARGB8888,
> > +	DRM_FORMAT_XBGR8888,
> > +	DRM_FORMAT_ABGR8888,
>=20
> Does the hardware *really* support AB42 on its primary plane?

Yes, Tegra display hardware supports this format on the primary plane.

> We recently had a discussion about the exported formats and the consensus=
 is
> that we only want the hardware's native formats plus XRGB888. That's not
> implemented yet in simpledrm, but this format list will soon see a larger
> cleanup.
>=20
> So I think ARGB8888 likely shouldn't be on the list here.

This is for consistency with the list below. If a device tree claims
that the framebuffer is ABGR8888 using the "a8b8g8r8" string, then
shouldn't we support it?

Thierry

>=20
> Best regards
> Thomas
>=20
> >   	DRM_FORMAT_RGB565,
> >   	//DRM_FORMAT_XRGB1555,
> >   	//DRM_FORMAT_ARGB1555,
> > diff --git a/include/linux/platform_data/simplefb.h b/include/linux/pla=
tform_data/simplefb.h
> > index 27ea99af6e1d..4f94d52ac99f 100644
> > --- a/include/linux/platform_data/simplefb.h
> > +++ b/include/linux/platform_data/simplefb.h
> > @@ -22,6 +22,7 @@
> >   	{ "r8g8b8", 24, {16, 8}, {8, 8}, {0, 8}, {0, 0}, DRM_FORMAT_RGB888 }=
, \
> >   	{ "x8r8g8b8", 32, {16, 8}, {8, 8}, {0, 8}, {0, 0}, DRM_FORMAT_XRGB88=
88 }, \
> >   	{ "a8r8g8b8", 32, {16, 8}, {8, 8}, {0, 8}, {24, 8}, DRM_FORMAT_ARGB8=
888 }, \
> > +	{ "x8b8g8r8", 32, {0, 8}, {8, 8}, {16, 8}, {0, 0}, DRM_FORMAT_XBGR888=
8 }, \
> >   	{ "a8b8g8r8", 32, {0, 8}, {8, 8}, {16, 8}, {24, 8}, DRM_FORMAT_ABGR8=
888 }, \
> >   	{ "x2r10g10b10", 32, {20, 10}, {10, 10}, {0, 10}, {0, 0}, DRM_FORMAT=
_XRGB2101010 }, \
> >   	{ "a2r10g10b10", 32, {20, 10}, {10, 10}, {0, 10}, {30, 2}, DRM_FORMA=
T_ARGB2101010 }, \
>=20
> --=20
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev




--vNq/aMDFmk2Q3leG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmN3qHgACgkQ3SOs138+
s6Exkw/+Jt5RZlDy44ERgWiTBxt37qAeKtj5ZY8t5BLUo2Y4Z315h5xpUv3roXJa
Jz2KB75PxNwp+KdWZQT5HkR3qxDL+Jh2YcX7RDsO/pTfDgfGgz0akwdnpXdpyarM
MooVEAggH+xP+ASFA38CdwWt3PLqkVM0MWjtcv1bk9d4NXe3MYdgK54To/4FztNF
162CfjUvVfX/bFpBwsJsS9fY2GQwaGtwd10mP6tS6q5GJapnRffZK0aW5m8d04Ek
aaaRC2Qf6YrR8CSqjsBRRrVpQ4l0tVRuhAzMPCdr7Py7Hz5tzv/OKxd9Si5HEhhu
pU8KVa7KGq+6DA07j7y+SJPF9xGK7WpSDlAz3q4Js0Jsr6fYXzk4CVuqEycjai1W
wbColg/L7GnywWxxEmV7/owzUtPn7fcMJAC8w6hRaTgTEyUa+ZF8rjnObfRYWAhe
EZo14G+bFhBr28sb26h3Ey8TFddfPSg1t0kPiTn+qk6nDkxse14alwnsO+elOqMH
3LuByjGsUXeHvN7+o5Qoprm7rxt/0UltuizOjb2BymvqFyTtympwq86tzyYudEU5
pGm6yMTX/95AkSpPs6nZ7E+JyxM+5e3MLC6UCYdHmRNnvY5qVF2QAy4ia+2p7FLn
QdYh9Rh53QcdjHJJCeU1zqW7idMWO9NT40Xx0xjPbVw3qwqoY+c=
=zV7L
-----END PGP SIGNATURE-----

--vNq/aMDFmk2Q3leG--

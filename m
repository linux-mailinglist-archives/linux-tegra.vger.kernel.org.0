Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D0B16D780D
	for <lists+linux-tegra@lfdr.de>; Wed,  5 Apr 2023 11:25:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237170AbjDEJZ4 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 5 Apr 2023 05:25:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237070AbjDEJZ4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 5 Apr 2023 05:25:56 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7BAC59CD;
        Wed,  5 Apr 2023 02:25:22 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-9476e2fa157so27280066b.3;
        Wed, 05 Apr 2023 02:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680686719;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZsO7CMD7bPDm2CVtgvMagzS63lAN+cW4r8Q3lLthBC0=;
        b=Sc2oJnaTOotkej0gDnxIYnabEz74FMbjG5HrtrXbs3m9BfeLLFJqZAYGHsrUQcXN01
         tZrBnNqTnPUSnNFIf2yKUC+WrX4r/HvnkekUrBkjc2tlnnYWiPAGgI/lLB5F6Ydv9zgL
         IgugDbj0OmDFRVgJ2xCacq/gAxKwAkkQHBTx320d4rQCgpwlrACFH+faDh700e//1iHw
         bEkPIxlNlbHC5b7PiecSoE5K6nM9ikl9Y7JbF3H1B3upck/SmDH4wFBnoJBUquU6OCo7
         +1GcBqPDP+rLttcypWS7SlUqeA/R15G0ly0uiQi2ttpBrlrPmvgBddD3zkm2lq9FEXfZ
         btaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680686719;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZsO7CMD7bPDm2CVtgvMagzS63lAN+cW4r8Q3lLthBC0=;
        b=1XSiMOva/SBfeO2f+Vgj6Qqtv03ghDceF0/k3vl0f9X5awNkRvxP6Y5Lbjp2NNkGpl
         iq4FSaQ/ne1Y/7LHSCGidButxl3q70ulSR3yrimgUHsnWzE3V0pDHF8KNHl5SOMA1LoV
         knKSrUapOEU3ztQWFNUkN90PSaZ0/PMhr++4XQerYi0mk0bz7yYr8psejmgxzpplsPhO
         d8jNCBEq4FhONMYNt0qkRkXW/x1ZzVbWtqSwMp09cJ8R6ekppjAIn5KcayyZnU/bCCJf
         2aNTG13QT3tAXPiHdRu9rbUxcBE7vgjD8qnt2D1zNjBuIo161GVFsGzxlEFNRSamCKA6
         nGlg==
X-Gm-Message-State: AAQBX9doZUiyuYajTBj5KOwl5W2n1Kq/5uorPuyYKDb/dbiCUIjwrLM/
        74zYJQS+SP2XkEic30PLrA4=
X-Google-Smtp-Source: AKy350a93DlwDPvJe/VkbbWDoc1J7coQHTAONyuHxrQTG/UgRqlMTyvzxgpzNb/Y0TVoNA/Zlz1AZA==
X-Received: by 2002:aa7:c959:0:b0:502:70ee:61e9 with SMTP id h25-20020aa7c959000000b0050270ee61e9mr1269100edt.21.1680686719407;
        Wed, 05 Apr 2023 02:25:19 -0700 (PDT)
Received: from orome (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id a26-20020a50c31a000000b005027686918bsm6842614edb.11.2023.04.05.02.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 02:25:19 -0700 (PDT)
Date:   Wed, 5 Apr 2023 11:25:17 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Deepak Rawat <drawat.floss@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Emma Anholt <emma@anholt.net>, Helge Deller <deller@gmx.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-hyperv@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-fbdev@vger.kernel.org
Subject: Re: [PATCH 3/8] drm/aperture: Remove primary argument
Message-ID: <ZC0-fXAW-lzaAU2E@orome>
References: <20230404201842.567344-1-daniel.vetter@ffwll.ch>
 <20230404201842.567344-3-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="pe4OG5itKNCOCk9H"
Content-Disposition: inline
In-Reply-To: <20230404201842.567344-3-daniel.vetter@ffwll.ch>
User-Agent: Mutt/2.2.10 (2023-03-25)
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--pe4OG5itKNCOCk9H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 04, 2023 at 10:18:37PM +0200, Daniel Vetter wrote:
> Only really pci devices have a business setting this - it's for
> figuring out whether the legacy vga stuff should be nuked too. And
> with the preceeding two patches those are all using the pci version of
> this.
>=20
> Which means for all other callers primary =3D=3D false and we can remove
> it now.
>=20
> v2:
> - Reorder to avoid compile fail (Thomas)
> - Include gma500, which retained it's called to the non-pci version.
>=20
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Deepak Rawat <drawat.floss@gmail.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: Emma Anholt <emma@anholt.net>
> Cc: Helge Deller <deller@gmx.de>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: linux-hyperv@vger.kernel.org
> Cc: linux-amlogic@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-tegra@vger.kernel.org
> Cc: linux-fbdev@vger.kernel.org
> ---
>  drivers/gpu/drm/arm/hdlcd_drv.c             |  2 +-
>  drivers/gpu/drm/armada/armada_drv.c         |  2 +-
>  drivers/gpu/drm/drm_aperture.c              | 11 +++--------
>  drivers/gpu/drm/gma500/psb_drv.c            |  2 +-
>  drivers/gpu/drm/hyperv/hyperv_drm_drv.c     |  1 -
>  drivers/gpu/drm/meson/meson_drv.c           |  2 +-
>  drivers/gpu/drm/msm/msm_fbdev.c             |  2 +-
>  drivers/gpu/drm/rockchip/rockchip_drm_drv.c |  2 +-
>  drivers/gpu/drm/stm/drv.c                   |  2 +-
>  drivers/gpu/drm/sun4i/sun4i_drv.c           |  2 +-
>  drivers/gpu/drm/tegra/drm.c                 |  2 +-
>  drivers/gpu/drm/vc4/vc4_drv.c               |  2 +-
>  include/drm/drm_aperture.h                  |  7 +++----
>  13 files changed, 16 insertions(+), 23 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--pe4OG5itKNCOCk9H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmQtPn0ACgkQ3SOs138+
s6Fo0w//fwbm/KtdC2iJvrSjyZDTSl19JmfKyGGpOHU/Qz2otALAXQuZlJnnVHiw
8gF1p2fUKFt3i5vAuHQDQrrVlWqpUzV090odcP0kz/ajjOeg0XKoicGbXQDuzjeS
QpNuw3XYw3ndS4x/IFYDXYeeFcnhwV8dT6gJhSmoUYfhnLBsfC/mJFe0i6mgnVZr
hIxm7xPo5pWTkzxg8UodgBuTq6TKINQTYRUOx8ET598/yHOlC0Wn6I5ONG+JR9Q1
N7Ot0dDfGW7jpsoTlxJK5NFCb2kaFbQRXTzZ3qHhKaRCvt97GoteoTh2cNvOGwD0
wzTI0J3ePLgmP8FuiFNuqJCibjP40BN2oIwuAZq5XR6obLbtlZyAERqGjcJ/MFFr
n/DS6y/5g8g1Zp2yGX1Og0+QlD/ujivtGCvkJVKETOVl2s4VUVQ1LvwuVOiyOG68
3q6ExUGcP+UawXW+hqMf4qZDWB3v0FZAow7yKLAGM4S6Erf2C00EqKI+x6Q+XxqZ
LDUUAuiHwoL9QNHPpazX+epf9lNqmNHomuruPvLnSlaknU98q/hVm7paOuRy50W8
izyXfudIZH2Cf/Qj94moh6biq3PJEcgSrQIQQvCwiHJgTN8t/UirgC3xUH49/jrH
ibylIbpBdaQPeZDCLa+J1W6Nk58Jlgj4nPqF1LH20LbKay1/0TM=
=gv9d
-----END PGP SIGNATURE-----

--pe4OG5itKNCOCk9H--

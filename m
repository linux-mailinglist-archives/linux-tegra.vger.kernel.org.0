Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9935A8B420
	for <lists+linux-tegra@lfdr.de>; Tue, 13 Aug 2019 11:31:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726685AbfHMJbb (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 13 Aug 2019 05:31:31 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:37689 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726282AbfHMJbb (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 13 Aug 2019 05:31:31 -0400
Received: by mail-wm1-f67.google.com with SMTP id z23so840436wmf.2
        for <linux-tegra@vger.kernel.org>; Tue, 13 Aug 2019 02:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=y0wqGVjlRClEZvpkYMuXOIusXH1Ev18/JEAAad0p7BA=;
        b=ZhonYoO5rACZHhGatth7GxfempAqu3fhxvQBB0p/Lmap00d7dYioBePAGYXFWIxKNh
         9vLTpiGZtZEcZi4s1x7O2Ax8p63WJaA5CqbAXFOHjav+v8jKcn+0O387B1cfQmaHH+gB
         X2WpCSXRggr/qAYRNZpRHh22DcoouEo1SpMroHGwmovINUZvx7onyYfTDF5SE4LHI6aa
         3Ml0MgDN/CtH2cHJ3J1LAqyBBNoaGigLEdIsPScYdRPFFToqKVisWJiEJHCFGPTZ7xtW
         s9krFdyx8ek4/J5tJYLOeB2Gga74QuUcozsFixugz2fTVPsHHDSghVVSC4cRFpmOeRay
         Icog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=y0wqGVjlRClEZvpkYMuXOIusXH1Ev18/JEAAad0p7BA=;
        b=uU2fOlhT3QPp6LXFKfyb1StJGiaselbRpSg/joxHWs8eMlTlh449SiJuWuGpdt2siV
         jGSA203qOrzmx2MMbclw2fEmPaqQ/5gQ+kxoYVIAMXhATtfSb9Tf8tGT/EVucggz4kpX
         8LlnjOyEn/QHhHq1rWvAX7BaLrIoaw+eG1utIM50zu+NEH+wr2yU/CNPMdHv+HLEjSku
         TcYg2URQ4w1+3NB77M4zGDXBUMCo6PTDzdaL8qOIdyM2fikB+Zb/rh6Aa7sSBZN1vYi+
         6a7nR55y36NdnPBSCLC+hjR30LIUGCALMFjFxQydDtngOnaWGhz5fvt8XAG6nSMaRs13
         qIWg==
X-Gm-Message-State: APjAAAV5JcimH21wXDcexREVB+OrjzVCCq2DAvOkhcH7kZs6xQtrdunJ
        7nrcinJWnvonNqjRIzusuAg=
X-Google-Smtp-Source: APXvYqwydMMGvSDCgat4DctRgQxgV+2KcgUKo0WXmxB8YaCIrGqrIK5DxHbPvNaV4SukRNRU0NuatA==
X-Received: by 2002:a1c:24c3:: with SMTP id k186mr2072710wmk.126.1565688689223;
        Tue, 13 Aug 2019 02:31:29 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
        by smtp.gmail.com with ESMTPSA id e4sm33358582wrh.39.2019.08.13.02.31.27
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 13 Aug 2019 02:31:28 -0700 (PDT)
Date:   Tue, 13 Aug 2019 11:31:27 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel@lists.freedesktop.org,
        Brian Starkey <brian.starkey@arm.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, Liviu Dudau <liviu.dudau@arm.com>,
        malidp@foss.arm.com, Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH v2 3/4] drm/armada: drop use of drmP.h
Message-ID: <20190813093127.GC1137@ulmo>
References: <20190804094132.29463-1-sam@ravnborg.org>
 <20190804094132.29463-4-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="eRtJSFbw+EEWtPj3"
Content-Disposition: inline
In-Reply-To: <20190804094132.29463-4-sam@ravnborg.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--eRtJSFbw+EEWtPj3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 04, 2019 at 11:41:31AM +0200, Sam Ravnborg wrote:
> Drop use of the deprecated drmP.h header file.
> While touching the list of include files group them and sort them.
> Fix fallout from the header file removal.
>=20
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  drivers/gpu/drm/armada/armada_crtc.c    | 10 +++++++---
>  drivers/gpu/drm/armada/armada_debugfs.c |  8 ++++++--
>  drivers/gpu/drm/armada/armada_drm.h     |  5 ++++-
>  drivers/gpu/drm/armada/armada_drv.c     |  8 ++++++++
>  drivers/gpu/drm/armada/armada_fb.c      |  3 +++
>  drivers/gpu/drm/armada/armada_fbdev.c   |  3 +++
>  drivers/gpu/drm/armada/armada_gem.c     |  7 ++++++-
>  drivers/gpu/drm/armada/armada_overlay.c |  8 +++++---
>  drivers/gpu/drm/armada/armada_plane.c   |  4 +++-
>  drivers/gpu/drm/armada/armada_trace.h   |  5 ++++-
>  10 files changed, 49 insertions(+), 12 deletions(-)

Reviewed-by: Thierry Reding <treding@nvidia.com>

--eRtJSFbw+EEWtPj3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1Sg28ACgkQ3SOs138+
s6Gaew//aMgEuIZ8gAOqGUtEtMwQcDcVOGjAi7k51vVYIqGYqsvyr7Fp7c+BzeWg
pLS8ZB0kVqV7pCxVpbdsf3G51KzbUj9TxJBDthXY7z11qrhBspWt6NYyKXoKmx15
me11n4Wrq7midcfJsmEcMQtebRukMlGkKmSrHNixVDz7cxCy6FmBYCBX9R08A067
U/wHKKR1jcVbdt6DeuhJqMN0KOdLuPZrTwGDK0Of5WbjfUlv9aK6paM95yZhvST/
QEJ4w85HTI/eCiU1iDRYYDg4GJNhgsyY5ZU1Se0HAyH6obr2pD/8A2KRVAYszRTM
HG3sDtU7GU1ZIisqVUGGiVsmmyhin/JmhNgO7vkpnFXxgBk7JQ2q5aiCsH2HTqTG
3Kf+QE73INx9JGP4O3MvkEJ8xI3yG22wB+eJEJQ/2Jsmy5/nKglOIdMJa4p291lY
dIzp4sMWBHNJ+mC+EKI+Uae1aE8c0jZ5vqYwg/yjVhZaIZzKbpWYCAnz2vn/jpRQ
wOsr9xuJJsQmssEAB/9RsFGq1g0YNdT0IAE/Gw80lYJJDJPVI7vxgtJKZ2M1egXW
iy+2KtznDhIsGROhvEQFyvaVpMCeq5ADKi1gFtSwbJ1f2lYC6CHUJ623qBQgNwaA
qZlaFFP+Tr3pN5k6Qvnl+w3Hxj98wEHzM4MH7jgMnoTBQhssxLM=
=yxMK
-----END PGP SIGNATURE-----

--eRtJSFbw+EEWtPj3--

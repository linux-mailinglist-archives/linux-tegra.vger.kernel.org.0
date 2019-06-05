Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E42BC35883
	for <lists+linux-tegra@lfdr.de>; Wed,  5 Jun 2019 10:28:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726561AbfFEI2w (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 5 Jun 2019 04:28:52 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:36563 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726554AbfFEI2w (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 5 Jun 2019 04:28:52 -0400
Received: by mail-wm1-f66.google.com with SMTP id v22so1314940wml.1
        for <linux-tegra@vger.kernel.org>; Wed, 05 Jun 2019 01:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=RxTo+xT0mapS+bbBymC1tljBXjtbPJSeHaYDXgTsvA8=;
        b=abFkYJ5joEq+vJI9z69b/IyseGJGlkI9C8raNVT5GyMtIKrJPUwrdKXoZFmBWZ+tuZ
         xw9oa7kiQGLchlv0ZFm/hD5V8twpoatgCxkFxOMQuXi/3tOFpgXsF0zm9rz2iKzJ/MKU
         shnuKGW2Ut4dh7mM/21gHowSidzCUYCgUxahzGUw4ZX3V8axdkF2ok1L58TOVX1XvGgw
         bpvDsPue6FyMIgGLNvMyVkKYYOapyZiUywgVc03G3AkiNkpgWhEh3cSBoFxHA4ulLauq
         3zEIHJQSk944TTOBKzt1iKqi23uZwbepH7k0Gq41cTrGGBriTYkjt7eK4FxubMJMRTnM
         fAig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=RxTo+xT0mapS+bbBymC1tljBXjtbPJSeHaYDXgTsvA8=;
        b=F5MooPVER4JrBhPqIxf97Hd1B09Z9NQGbXotFmva8IjwJ13TLhGer/tX7RoEalVG9W
         m9ebF7kQWxy3iCNr6u5h8IAKGVbYynGS19Bq2VBYeCSZKLGZ3BB4h1RRUdHh71iUrOQB
         xC3XOcMr9xqxHxfONcmaCBBpHGfBCnVFvjpRftmC6BIglbGGbHSuQ67ImlCodGriw39K
         xTgG0UBrSkwDol12vdPpviQbCsft+JfMD3ugU8oYwE618pjaRYy/sR8/sAPv8lIbUkEj
         haxkLSE4xoWqX1GRKq6m/qMywLEwSF2uydMpFfna82W7kICbsr8dZcb1qOxRVrElBg8X
         Abgw==
X-Gm-Message-State: APjAAAWDHAHSCcEot00bdkP1sNN9lUsj7fSeorxwaeiw0OxpLKT9gF3c
        GwKNNgEpJ2FUPnL+7lk/lAU=
X-Google-Smtp-Source: APXvYqwpFepRVG95tVCDtlWIg1sxfAfupLpBr/8LVSSEiFjS3l/SV2IL2DakBdxn3GGvB/83Dj3YNg==
X-Received: by 2002:a1c:2d83:: with SMTP id t125mr20859693wmt.83.1559723329930;
        Wed, 05 Jun 2019 01:28:49 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id y184sm14297112wmg.14.2019.06.05.01.28.49
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 05 Jun 2019 01:28:49 -0700 (PDT)
Date:   Wed, 5 Jun 2019 10:28:48 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] gpu: host1x: Do not output error message for deferred
 probe
Message-ID: <20190605082848.GB10944@ulmo>
References: <20190604153150.22265-1-thierry.reding@gmail.com>
 <21c2443c-9166-edc0-5d7b-46b9e3c48e70@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="qcHopEYAB45HaUaB"
Content-Disposition: inline
In-Reply-To: <21c2443c-9166-edc0-5d7b-46b9e3c48e70@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--qcHopEYAB45HaUaB
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 04, 2019 at 07:07:42PM +0300, Dmitry Osipenko wrote:
> 04.06.2019 18:31, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > When deferring probe, avoid logging a confusing error message. While at
> > it, make the error message more informational.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  drivers/gpu/host1x/dev.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
> > index c55e2d634887..5a3f797240d4 100644
> > --- a/drivers/gpu/host1x/dev.c
> > +++ b/drivers/gpu/host1x/dev.c
> > @@ -247,8 +247,11 @@ static int host1x_probe(struct platform_device *pd=
ev)
> > =20
> >  	host->clk =3D devm_clk_get(&pdev->dev, NULL);
> >  	if (IS_ERR(host->clk)) {
> > -		dev_err(&pdev->dev, "failed to get clock\n");
> >  		err =3D PTR_ERR(host->clk);
> > +
> > +		if (err !=3D -EPROBE_DEFER)
> > +			dev_err(&pdev->dev, "failed to get clock: %d\n", err);
> > +
> >  		return err;
> >  	}
>=20
> The clock driver should be available at the time of host1x's probing on
> all Tegra's because it is one of essential core drivers that become
> available early during boot.

That's the currently baked-in assumption. However, there can be any
number of reasons for why the clocks may not show up as early as
expected, as evidenced in the case of Tegra186.

> I guess you're making this change for T186, is it because the BPMP
> driver's probe getting deferred? If yes, won't it be possible to fix the
> defer of the clock driver instead of making such changes in the affected
> drivers?

The reason why this is now happening on Tegra186 is because the BPMP is
bound to an IOMMU to avoid getting faults from the new no-bypass policy
that the ARM SMMU driver is implementing as of v5.2-rc1.

As a result of binding to an IOMMU, the first probe of the BPMP driver
will get deferred, so any driver trying to request a clock after that
and before BPMP gets probed successfully the next time, any clk_get()
calls will fail with -EPROBE_DEFER.

This is a bit unfortunate, but like I said, these kinds of things can
happen, and probe deferral was designed specifically to deal with that
kind of situation so that we wouldn't have to rely on all of these
built-in assumptions that occasionally break.

The driver also already handles deferred probe properly. The only thing
that this patch really changes is to no longer consider -EPROBE_DEFER an
error. It's in fact a pretty common situation in many drivers and should
not warrant a kernel log message.

Thierry

--qcHopEYAB45HaUaB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlz3fT0ACgkQ3SOs138+
s6H6CxAAjksm0GKQVJfgP9oa8/awYO5STAzYVXRAv1tkftH7X+7FMqYpjUs9KcZi
UD7m+IThegn9yncbIVfzOY3n6Y6eKizhzJPUv4rksDsoUTVcpecP7SHPk7EMPryn
GkmtCSTMYYXp7euVP1/lLWaD1lyEYj+DqtcE+6lTJdLHLNjG/H8ywAq4nL5m3UaP
1IyzMCzVuvyoaEzqGrYszpkGSXbhdXq2+pv52qMfXYiNnHCeF27Jn7ERCl6VKg0s
kNwabue1nrw2xdcccOMvKsUSuuQ9gfkyiZohVWXZD1wKIt/iKsGto2kcnCMQ+ImK
GKepAc8xogAPqHCbPXasQDPWqhui1JXye9n/MNGA3izHijY/a46Chn4FYt/uXhX8
eRPxDDJT95g0bNYEao+n8bvx4Q5CceYZJ95EmfApo6PAhT3ig/THoXvymPgIY13P
RLIEgM1vqcgxXud7FDeOorwrdOKWZAyAyIkeElhOxeQISs4HMVVw04XOtLKO4MgK
142vVxZKkky3N5CaUuFDrBMcLVutM7C0+fReMJIawlZ+LICKfC6VEhtOJb9zUOkd
j8O0FOVMSpsM/Zo0ySeEfi1z3mD6OxUZfda7LJkO77YCWJTd1ZSWQbMAcARn3iIA
JwR9brfOE271R4XVQgTHjjucOhm1T9q3sBKK7pl+xs70aRGAJZ4=
=C+uG
-----END PGP SIGNATURE-----

--qcHopEYAB45HaUaB--

Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5E1B47EB5
	for <lists+linux-tegra@lfdr.de>; Mon, 17 Jun 2019 11:46:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726405AbfFQJqH (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 17 Jun 2019 05:46:07 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:45724 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725837AbfFQJqG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 17 Jun 2019 05:46:06 -0400
Received: by mail-wr1-f68.google.com with SMTP id f9so9137257wre.12;
        Mon, 17 Jun 2019 02:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=sECLBFgy6ebP9IMrr+DaMdUVkpSLO9FEwP1h0yqWUpw=;
        b=pQuvchGpyVSaUkNY4FT1v/vM0qW+q5QuF/xGquiGhYs1egtCCG8+SE32f6szEhN5x/
         4ZmWK1wBPA13lVFDC1/w8ht669+h4VfL24jJdhr5ENBa/BSzuL+dgE+AtKCXrc0NEcwQ
         S5/ZHiXpcbUEtJUgzw2DYzd+nzuqMHkc1kkRggMGErtGr6T802X0p0Q1XvPfEbnZ8CeG
         SvuF1MRPrrAEXJUliC1Z/avSTH0JrTkK/Y1cuLky65Y7/IITgLbKjJWhwcpmbDv3QMm/
         mMjxXPgEhnag9fmR+7DwqriYDM5PGKe1xUp0A4NgJNVm/PxWJJxQMEsr12+Cez3ed7TD
         Ebcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=sECLBFgy6ebP9IMrr+DaMdUVkpSLO9FEwP1h0yqWUpw=;
        b=EZFip403nuM6XhXvuZP/kNIEv1PtKrNtzx2Y4hyWRjV3G6P/CL4kdnsEg/ZBgW52z5
         DQxMx2uEfpqHvaqLUqiYKxseUq8XuSGtS3ZUBSTXCy0tI1n3SsDvQngmNoOGRz81CsfO
         vMuFvw7sk1dBGNK61WqqgSPniSTvzSlFIP/TKQK9LscUm1SUFIbcFavXA+rQw+bAUhna
         8butfd3p09oBvJw228zRR1UPLb6psvXF4FI0ktMZuCk97pyQbYM+bpf0hwIe23gkyxGj
         c+mCSTq8U8rl1H533+WV1Y7tnGiaT/hVyDKQJxAX/rTLBDeuTJ4J/THScJG4OWC1Vc/a
         vCtQ==
X-Gm-Message-State: APjAAAU1bR+N6BdFWygWML0e9BK3MrEzigv/WrHkvVB+YUYV0sCEni1F
        Ix6LWzFhovTGW2fFBqu0/pQ=
X-Google-Smtp-Source: APXvYqzrbuR1iBNpSzE8rcy+92pMxLEOPZwInsNw0Gs14ziY/xL510qv9tuT5kABzRjFT9D/lp6Dzg==
X-Received: by 2002:adf:ce03:: with SMTP id p3mr50304328wrn.94.1560764763954;
        Mon, 17 Jun 2019 02:46:03 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id s188sm11670472wmf.40.2019.06.17.02.46.03
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 17 Jun 2019 02:46:03 -0700 (PDT)
Date:   Mon, 17 Jun 2019 11:46:02 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Joseph Lo <josephl@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 05/10] memory: tegra20-emc: Replace clk_get_sys with
 devm_clk_get
Message-ID: <20190617094602.GC508@ulmo>
References: <20190616233551.6838-1-digetx@gmail.com>
 <20190616233551.6838-6-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vOmOzSkFvhd7u8Ms"
Content-Disposition: inline
In-Reply-To: <20190616233551.6838-6-digetx@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--vOmOzSkFvhd7u8Ms
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2019 at 02:35:46AM +0300, Dmitry Osipenko wrote:
> There is no problem for drivers to request pll_m and pll_p clocks for
> the device, hence there is no need to use clk_get_sys() and it could be
> replaced with devm_clk_get() for consistency.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/memory/tegra/tegra20-emc.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/te=
gra20-emc.c
> index 43aef3614b65..527aa4b90e95 100644
> --- a/drivers/memory/tegra/tegra20-emc.c
> +++ b/drivers/memory/tegra/tegra20-emc.c
> @@ -527,33 +527,29 @@ static int tegra_emc_probe(struct platform_device *=
pdev)
>  		goto unset_cb;
>  	}
> =20
> -	emc->pll_m =3D clk_get_sys(NULL, "pll_m");
> +	emc->pll_m =3D devm_clk_get(&pdev->dev, "pll_m");

Interesting... I didn't know that clk_get() had a fallback path to
return clk_get_sys() if the named clock wasn't found in DT. That's
nice.

Looks good to me.

Thierry

>  	if (IS_ERR(emc->pll_m)) {
>  		err =3D PTR_ERR(emc->pll_m);
>  		dev_err(&pdev->dev, "failed to get pll_m clock: %d\n", err);
>  		goto unset_cb;
>  	}
> =20
> -	emc->backup_clk =3D clk_get_sys(NULL, "pll_p");
> +	emc->backup_clk =3D devm_clk_get(&pdev->dev, "pll_p");
>  	if (IS_ERR(emc->backup_clk)) {
>  		err =3D PTR_ERR(emc->backup_clk);
>  		dev_err(&pdev->dev, "failed to get pll_p clock: %d\n", err);
> -		goto put_pll_m;
> +		goto unset_cb;
>  	}
> =20
>  	err =3D clk_notifier_register(emc->clk, &emc->clk_nb);
>  	if (err) {
>  		dev_err(&pdev->dev, "failed to register clk notifier: %d\n",
>  			err);
> -		goto put_backup;
> +		goto unset_cb;
>  	}
> =20
>  	return 0;
> =20
> -put_backup:
> -	clk_put(emc->backup_clk);
> -put_pll_m:
> -	clk_put(emc->pll_m);
>  unset_cb:
>  	tegra20_clk_set_emc_round_callback(NULL, NULL);
> =20
> --=20
> 2.22.0
>=20

--vOmOzSkFvhd7u8Ms
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0HYVgACgkQ3SOs138+
s6EtgQ/9Gx+n4aKJJHIbFckpC+vU7VBdPMTAwd48nRN3rFmLbeWN2LaUW9M9WrKc
U0fezbnCkrzJXxkwUHilcxlnpOppZM+vTZlEu0tzt4DeXRgbZOOFUJWjHSH5pg3P
4pi43yWW84rT4+ybtx0QdzvfxVjvxeUdpsWjYgwU884ba96HtaDchSylbtki0Hfw
wdcN83GB9cjpnr/Xi6L/IkKMBFtF2UDPhTyQ+jGX5+GoajEiU1lp2Lxi5QwLiwjh
t2Yy70tjfwHZq9HW6FKIz7rzDIVrcfvB/uZ1vuCoecJPzF3w0udHemB7c0aMjAWk
mj8Fzt/+fIcqort2U1x1kMgYo/EQe57ILXUE8J/95QU3qq3gu2tPdRS4BtxAJ1HJ
z9vRRDJ7vPYrD6ECyDShO6/nU+Oh+I34fXSIjwqpjOcEMimGc2DzZ8Xx2BUw+Icm
i/20okN1spP69011y8UerIiHScdJU1RXpmYg9JzTRaRgmu04YoXUwqnLnp90PAkk
n9lVPLaZVnFsWPZa+lDxRyLDRkSweAQ8n9/1DV2drCqlI3k1IKtY5lrXGEc21AUR
kGIFqydYBxg76z8lZHozlzFhdMlHaNFpmJwH6AGDuhpIlZPF0D/hyYtF1FFQImiP
YYTWvugRpZOqIGP+XEhyaW6zrK+pYYMXjNpOZzg0Lj8vbpWrfxc=
=Ppyh
-----END PGP SIGNATURE-----

--vOmOzSkFvhd7u8Ms--

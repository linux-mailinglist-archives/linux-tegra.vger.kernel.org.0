Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7138210065F
	for <lists+linux-tegra@lfdr.de>; Mon, 18 Nov 2019 14:22:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726614AbfKRNWm (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 18 Nov 2019 08:22:42 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:44970 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726575AbfKRNWl (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 18 Nov 2019 08:22:41 -0500
Received: by mail-wr1-f66.google.com with SMTP id f2so19452463wrs.11
        for <linux-tegra@vger.kernel.org>; Mon, 18 Nov 2019 05:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=hfIqiEyTSIyA8CkyyVvaKrdyeuMj6zNXYcMab40uO3Y=;
        b=barw6n29ruJaQpilWdyBwTT19/tSf2OK/Pwo7PQ/E5zkBEnhpr4ItX53EXIPAit2U/
         7OVQtKB7CmpbAhq5aWiQvjakVuf3OWvrjxUmXVtCxq7o9tJfQmd5LJ3pWeU0fCevjbxH
         rtlM6PaKtetAsjU1LVz7SJTenjwpc4ZGzYXNpvumyd43+jjcENDmAd0YLl+ne67WihRG
         R9tdxutUBLoBGP82BN03PGWtK9Ro7l9oPcywaFdHC5qJ2lpydFo4GvOlh6KRCxuefEVT
         0Ygc8I4TneYo0DzExcczP+4Y8ZL0PhIh+7toMwOJxmlnmFAxcNp5NwPXCYP6QwEJPaJP
         oveA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hfIqiEyTSIyA8CkyyVvaKrdyeuMj6zNXYcMab40uO3Y=;
        b=f19e9Zk5N5GIQTgQl8j0gWNSh0f1MfXbx9n0xU7xnapgsAPR4XzqXwBTLgJ89c8Mcm
         1DAKZrY/k5RLO9itbC7fKMBSBhk6fanFtSAj9B4AaU3zgjbEIGC62cNQO80z9y5symO3
         z12hjfzCqaCoZ6+heESGqaA160IewAgvyNbLt51UAWcXrQlU1Nt+ENxHaAKZ7l6j+kWH
         aQXWQJZ14ftS3wTptuue8kAp7PDC1EnvSE7ym4cmmFB4Af5g9AN53PKpzVrj/fQgIxre
         /lahGwdll4kV1jfDUgEaejAHUnjoLohBcNmE//3bK6lkMt7CAEo9oxiruGMKNyFjrCDU
         xFNA==
X-Gm-Message-State: APjAAAXSvjfptQyyy5ujtJvOQ4E8dcBExzKFc9/YH732buRcwFWI+4G/
        6fiznaI1vBG814kLITgq7ps=
X-Google-Smtp-Source: APXvYqxN2ohqnQ1uNmgA5iIxzBvh8YMScRipzlrYxNrCErR9tFwgr5io86ssiDorF1XkVIpj7+MBzw==
X-Received: by 2002:a5d:4b82:: with SMTP id b2mr30488485wrt.335.1574083359689;
        Mon, 18 Nov 2019 05:22:39 -0800 (PST)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id x7sm26770963wrg.63.2019.11.18.05.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2019 05:22:38 -0800 (PST)
Date:   Mon, 18 Nov 2019 14:22:37 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     zhengbin <zhengbin13@huawei.com>
Cc:     treding@nvidia.com, kishon@ti.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH] phy: tegra: Use PTR_ERR_OR_ZERO() to simplify code
Message-ID: <20191118132237.GB2246533@ulmo>
References: <1574075093-37340-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bCsyhTFzCvuiizWE"
Content-Disposition: inline
In-Reply-To: <1574075093-37340-1-git-send-email-zhengbin13@huawei.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--bCsyhTFzCvuiizWE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 18, 2019 at 07:04:53PM +0800, zhengbin wrote:
> Fixes coccicheck warning:
>=20
> drivers/phy/tegra/phy-tegra194-p2u.c:95:1-3: WARNING: PTR_ERR_OR_ZERO can=
 be used
>=20
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: zhengbin <zhengbin13@huawei.com>
> ---
>  drivers/phy/tegra/phy-tegra194-p2u.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>=20
> diff --git a/drivers/phy/tegra/phy-tegra194-p2u.c b/drivers/phy/tegra/phy=
-tegra194-p2u.c
> index 7042bed..42394d2 100644
> --- a/drivers/phy/tegra/phy-tegra194-p2u.c
> +++ b/drivers/phy/tegra/phy-tegra194-p2u.c
> @@ -92,10 +92,7 @@ static int tegra_p2u_probe(struct platform_device *pde=
v)
>  	phy_set_drvdata(generic_phy, phy);
>=20
>  	phy_provider =3D devm_of_phy_provider_register(dev, of_phy_simple_xlate=
);
> -	if (IS_ERR(phy_provider))
> -		return PTR_ERR(phy_provider);
> -
> -	return 0;
> +	return PTR_ERR_OR_ZERO(phy_provider);
>  }
>=20
>  static const struct of_device_id tegra_p2u_id_table[] =3D {

Sorry, but I don't see the advantage in this. Yes, this can save a
couple of lines, but if we ever need to add additional code here it's
going to lead to a much larger diff because we need to untangle this
again.

Also, and this is very subjective, the original is much easier to read
and understand because it has a well-established structure.

Thierry

--bCsyhTFzCvuiizWE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3SmxwACgkQ3SOs138+
s6GtgA//U+XVe/AFfej/EVkx4QPD8XS+zIrx3Bn+CaO6ONPQqzz2JVWoVLz4Bn2z
KBolMmpihn20O43uedXIaxHGJZdHBtzqO7t5LsFDIB2/yTqc8Odl8+t6r2lVU2AN
xKlLCSay6si48pkq/nYYkZ2c2WZxcp/g/LchhGYLoMl4pSV9wUJOg2PxGVj+/caX
u9Yylj+NCafr4vVs6BhoJ5h7ZMZ9Bcf1qbfD1Docfmknsg+AYnW1ZMG5gn/iZ7+9
A+611qtVcOiY8etLa+alyt852ijXW0ZRLnStnou1/nUhFeyrS+xB1pJpT3T0wJiN
HnZ4Vno6ieltHcAU0jwOsSQe+NX2/Fe6Vi5xf3UG3nVkQSkiKH2wcxsNX0stkoOF
fO657gKJReBFAdveGJq3qzYKJiSuXojnIyKPx+OfH5/Dzra0sVIz4v9vtjwjP0Ch
9xYZFKqoMZv4y6AAOBfmz+TcBkfUdfhmPKOyhm4upTMXBzMN2VQ1RSE91zLpTKmk
w5o2JWhxY798GesjOfEcc8uaqcblFlo2YKClMlXU99Fu2ISLv+a98srbtbRN8/6v
xC8krnXXRAUFq4FtqOzHC1FJQELSLJi9mr3VktTPaRr6x3n21ZqqHFziXY1CUelS
+s9GSqGc7HbwDoKx7eBZsQWoN9RgfwG7b3FNyuft1fc3emdVl0o=
=Agx3
-----END PGP SIGNATURE-----

--bCsyhTFzCvuiizWE--

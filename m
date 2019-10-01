Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3450C3876
	for <lists+linux-tegra@lfdr.de>; Tue,  1 Oct 2019 17:03:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727051AbfJAPDo (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 1 Oct 2019 11:03:44 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:45742 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726987AbfJAPDo (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 1 Oct 2019 11:03:44 -0400
Received: by mail-wr1-f65.google.com with SMTP id r5so15920455wrm.12;
        Tue, 01 Oct 2019 08:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=LnJv9Xz1aZ5svAzDP+oAGykyZQCTMARwKiPEle4TB7s=;
        b=vPPr5twopF6joIdFYeISfuwUR+5Jd0p26E1QhkSNqMOTzPJUiqZJmxF4he711wedrE
         Pg6/6uGvs8dQ3rwMZXcW6FXWfK786aI+FSXgItDMOLcQBwxSDm852w2CvbD4UCLa61jQ
         v0Fk5U6afbLBxRzq68mpLu0pXESFA/Wk6rh+BKwp4+xn0oBxg+dfhf/oxqA0xh0pyuhv
         S7RKBmXvamEXopfHai9zTZwyAehNKgjhvj/B9ba5ttqCUufnfQKFVEZLHX/MrGFhnhfr
         vh3ryA5fKO8y6oRM+hmDB9z5N5JnDaDXQTOrHQJyx/VpNBfrCFfwN50Set+DeuzFsnq/
         xr1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=LnJv9Xz1aZ5svAzDP+oAGykyZQCTMARwKiPEle4TB7s=;
        b=JWrT8cNCJjpq/zF3riuO+IIIGFiF8IIpQNpKKlKB44DdGGnLd4s2DjgqKd2cqVyCUi
         9sx0cfWpyzfozpP1zev+lkTdB0fo78uWxT8ruu6J6BxNB4OCPcfRIvnimoDyW2Zmv+Bf
         Ha3VeTSnsZsoWeEkxtQwlAfshvMZttFFdle7cZ9qhS86ccc6kHzl2C3WzfwPbPsfT/aH
         Zz/26IkNxL9dFNG+Q5KnpunX0+XVkEh87MnZlr+GMahK13rsdCZjeYYn6Xd+q+fBt+K1
         aYbKMpzj1QWr6RWOZ/xj+PdrkPkqZ0oEzOHnZcsij9x/j8hKdm7cr3C71ytzgOqoSQpm
         qnuQ==
X-Gm-Message-State: APjAAAUGObMYQKs1L+p57WdGVZfFzWMIzFVuMh7EyKAC98qbAVyzvGWs
        /OPxqnnU8xbzCXdi4b1F6p0=
X-Google-Smtp-Source: APXvYqw1oEe0vdPQOUkUH2yuFKxBT9oU9t31e/NLuRkthDifaWW8fXJX8Ei8WwLhXq/IQ78ZiJzpmw==
X-Received: by 2002:adf:eccd:: with SMTP id s13mr619488wro.288.1569942222380;
        Tue, 01 Oct 2019 08:03:42 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id r6sm3475545wmh.38.2019.10.01.08.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2019 08:03:40 -0700 (PDT)
Date:   Tue, 1 Oct 2019 17:03:39 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Nagarjuna Kristam <nkristam@nvidia.com>
Cc:     jonathanh@nvidia.com, mark.rutland@arm.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 0/3] Jetson-TX2 USB host support
Message-ID: <20191001150339.GF3566931@ulmo>
References: <1568703406-20183-1-git-send-email-nkristam@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="uTRFFR9qmiCqR05s"
Content-Disposition: inline
In-Reply-To: <1568703406-20183-1-git-send-email-nkristam@nvidia.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--uTRFFR9qmiCqR05s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 17, 2019 at 12:26:42PM +0530, Nagarjuna Kristam wrote:
> This patch series enable USB host driver on Jetson-TX2 platform.
>=20
> Patch 1 is to enable dependent padctl driver.
> Patch 2&3 to enable USB host driver on jetson-TX2.
>=20
> Nagarjuna Kristam (3):
>   arm64: tegra: Enable padctl driver for Jetson-TX2
>   arm64: tegra: Add SMMU for USB host on Tegra186
>   arm64: tegra: Enable USB host on Jetson-TX2
>=20
>  arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 4 ++--
>  arch/arm64/boot/dts/nvidia/tegra186.dtsi           | 1 +
>  2 files changed, 3 insertions(+), 2 deletions(-)

Applied to for-5.5/arm64/dt, thanks.

Thierry

--uTRFFR9qmiCqR05s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2TaskACgkQ3SOs138+
s6H69g/+ITrO/1M5CH171OIE+SKbLTtgAZT9rDoqRX9cY6apjydMAYvNp5XUmEyI
h1NBmeGpqSy+cWGU8fvXC/MjaJJIUTUMOP8ugFlN4OJnKkabKZk+iswtJVI6wK7+
UK8sLU8fwPB1Gc7G+ablw87xycf4tYWQf+CC0vcz9vHXEujM2W/Y5yvsF3A9DWEA
TD1z/uA6RqJw0Y7qMjRWJzPnZuqCF9KqsGueVI1wv+0s4ljBKCXtvKNnSSeKbFko
Y8nOpTT3gQtAru4wD2pKWsIuJLELnPShS35mTvy/BjHeIPx1kuaUD74NzBkUhNB1
jX0ERXwxKRqjfRx83dXWClJI6GVvzOr/YLVToO/3kA5Rl7E8SAG7dR+4OZIsyGON
nWL86gdsTCgC0q2waRXz3ofrGxGPf+dM59tA5GGwkfRF1keySP1Bz1sreoi5sai/
xqAgbIuCYXA7+HAtkOLrXwKIJMAsHmajTIOILbMExWSKY5fvGVxs0CqbWA62iY5S
chryhIxfU1yw5pouUZ8lvNSiaWVJbYZYIoj/DMV/Le64XmdgeihlC8wszoTdTnrz
PLd2kPhwrjRzbfC7/5TgEpkZmqvhFrAX9PzZXiLziCqgyIuy36ovQFvjx12nMV3q
9Rn0wv134Lc6CW/d8ueZwXltLqC7r4vMtCSbwzOvB+YZ3OyXvYI=
=znvp
-----END PGP SIGNATURE-----

--uTRFFR9qmiCqR05s--

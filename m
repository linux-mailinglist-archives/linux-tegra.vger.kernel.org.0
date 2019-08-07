Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5022F84BE3
	for <lists+linux-tegra@lfdr.de>; Wed,  7 Aug 2019 14:44:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387796AbfHGMny (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 7 Aug 2019 08:43:54 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:43019 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387777AbfHGMny (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 7 Aug 2019 08:43:54 -0400
Received: by mail-ed1-f66.google.com with SMTP id e3so86093892edr.10
        for <linux-tegra@vger.kernel.org>; Wed, 07 Aug 2019 05:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=OPbhMBVVj7ijIialon5pAIXCwNF0G/gUesGNYop/Wqw=;
        b=K7UU8WjKB3cZJd/7bX+NFTL/AdiTleUWAb2c4/brUbxOgIe9K4y8ciEJz8rDkR5/eq
         qJJ4TQOVJvguIzU/Szr8h6bilBU3sD2g+wjXknNFnd3wu+ixueRtNLjJ2QnmxA1EvLkf
         27YBzZcuSRfbMuePO5USbuZQHpKvq9jUG3Xe0sZaUEHL3zupEV6eruvefNu4FHrCPTnG
         iIljpk3Ipi5Zz+tt38UGOfsZCG8aO5Hy5o5KEr0NTV5GeJa+kOAVCQ8aLCWckv2wVEId
         mgM6cS8sJWD02e870SmXZqK/xDuInavixR3FWNoZ4Jvje5fsJgyDtNliAAZ9dDeb/fEH
         es5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=OPbhMBVVj7ijIialon5pAIXCwNF0G/gUesGNYop/Wqw=;
        b=TgSbH4SbtZjpDwk2+UrRvnW2OONKIuJ8GtnGY74IaC3n7PfaiN/iprviq0mcoZENdP
         pln+rhwoBnPAMi8dNHOBFlbTblx291BT5E6378kbLVDnBLF6y5fp1YmFhRlQKbMz1raB
         1EJp4gVZK3n4x1GQIMCcYDSxRJxFvdBFqa9/aWCXeCYVzcg67edDOp4psWFMiHijwz4u
         ntBOGt/dxW9gk8Yxwb6zw5fCo7rhw1au+hDfm5k+5TszQhdjxGj8Pff7Q1Rp0rufiHTS
         99L2XT6xB650vOURsqdoYCfpzvxoH84FV17DtPj5B7cbbKbPRk0LH1ScpaXa5tiXtsGA
         Y6DQ==
X-Gm-Message-State: APjAAAX3F8D951hBUOddMokLCbCavlM617gkBNODB4vL4FNA/eQ0S0xZ
        +70/OD3YDT2kQbhGGk61QOcaUN72
X-Google-Smtp-Source: APXvYqxVF5ZqCTFrSZopmmLlQ6O02I3i02G6E5aWC818maO/LTHZ14Jh8+s+CxvaNbqQHmxm7lEHOQ==
X-Received: by 2002:a17:906:2f0f:: with SMTP id v15mr7687481eji.33.1565181832425;
        Wed, 07 Aug 2019 05:43:52 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
        by smtp.gmail.com with ESMTPSA id o18sm20718870edq.18.2019.08.07.05.43.50
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 07 Aug 2019 05:43:51 -0700 (PDT)
Date:   Wed, 7 Aug 2019 14:43:49 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Vidya Sagar <vidyas@nvidia.com>
Cc:     talho@nvidia.com, sivaramn@nvidia.com, stefank@nvidia.com,
        treding@nvidia.com, jonathanh@nvidia.com,
        lorenzo.pieralisi@arm.com, linux-tegra@vger.kernel.org,
        kthota@nvidia.com, mmaddireddy@nvidia.com, sagar.tv@gmail.com
Subject: Re: [PATCH] firmware: tegra: Move BPMP resume to noirq phase
Message-ID: <20190807124349.GA24700@ulmo>
References: <20190802061727.18177-1-vidyas@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="a8Wt8u1KmwUX3Y2C"
Content-Disposition: inline
In-Reply-To: <20190802061727.18177-1-vidyas@nvidia.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 02, 2019 at 11:47:27AM +0530, Vidya Sagar wrote:
> Modules like PCIe in Tegra194 need BPMP firmware services in noirq phase
> and hence move BPMP resume to noirq phase.
> This patch is verified on Tegra210, Tegra186 and Tegra194.
>=20
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> ---
>  drivers/firmware/tegra/bpmp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thierry

--a8Wt8u1KmwUX3Y2C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1Kx3wACgkQ3SOs138+
s6FiLxAAnhVlSBoneBZaOw/qpVHxah+tVB2Uhi07msnnVxzlFNU9QSqukWRn9CBE
31c3K9aHyXo5dR7YNs32ydn63kePov/JwfNdXrYRU+hNZdYwrp1U9i02WfbtzTcW
Sm6WGR9e2DMGrNWtrCrJAdrcoajE4sUwUiaV7MuPbvX72eki1/HITzI2zqm5LP2q
41GLtJG0gZD9xr6vybzlEgyPlOdnNugM6oZMK3bFb6oKsYNkOz95SPCD8LGtjRC3
UVN1AFgiyNDQphdBevdcZxFw6NKA5HuIm7ybAQUvw6EKkvU5xPTgAUN6sQWGFMK/
WwiniMz/6xz2zEEEEKA1Rux9qXHNG9QDoua3DQesgaXIm9ynXjAmK4oDXVxRFeam
XjBKh1+P77OvN2gW4QWO5eDmGMZG6Kj1cUNygKBH84cg+OeJlgR4Q/dHyGwR8iy1
WoSwl195hd7eGyighcsXlrZDUvnasnib+SmtFW2usloysCydT1OAwHAZ/N2l3P3b
T2D732zqzYbMuVHHYpqxjUpQeCGSIWDPgNKzktCZ+B/9UFvPLcStHFxUUVaWMk4l
CZjqjIx9A20ktxyjcIq3Me1wh6ryjhLCtTB8fpTLv7WjT+i6Dudcr8/+EevG1Ptc
a7BVhC3KUw+vMBVCw3WIfMRy3T6eH+Qd/ZkwTjGh+mmLv3/k/t8=
=+gm7
-----END PGP SIGNATURE-----

--a8Wt8u1KmwUX3Y2C--

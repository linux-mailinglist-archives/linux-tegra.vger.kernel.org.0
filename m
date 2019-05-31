Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA94A30C8C
	for <lists+linux-tegra@lfdr.de>; Fri, 31 May 2019 12:29:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726307AbfEaK3D (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 31 May 2019 06:29:03 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:35049 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726233AbfEaK3C (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 31 May 2019 06:29:02 -0400
Received: by mail-wm1-f66.google.com with SMTP id c6so2681796wml.0
        for <linux-tegra@vger.kernel.org>; Fri, 31 May 2019 03:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wavfemkihOm+dzcypR1HDDUiAwAwsd2Iq1AEC8Art7s=;
        b=GcR9ldq4F42Q0WGtJdMojCE2oUMBg/NeUQPGFtC6G4MKQ8/dgpSzth2Omc3NeULxqC
         DU93Vq3S8DeRyAbHcvQkR/pODN0VXk0xNDAHLBoI/Wz17uuZSkWHOEI9vePKSot4Qghu
         nnzevzWrN2SyEk1xS0fWubcrSnELz8QX9vrtPi9V2ONQs3hG0pfxoK6DnCDPGR41iw2Z
         EjYnV+jkLoKbUab6RY55WbGr9/tkgk/ffSeZHcec/f8S49yCrXQDnldSFiTNB4q6w2u3
         qgtXbqWYrRZWaa3jVz/NiQq/hBqWGIXIG9bZ3fqT6K/L0LNzUZnZRTx1yrHGAVEJDbIp
         FRMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wavfemkihOm+dzcypR1HDDUiAwAwsd2Iq1AEC8Art7s=;
        b=od5NxC+DyhHE5DUfq3VoSsh/XJc2lAVH00pzgtCqDQFJa1oYelZEEmsIRZgIBQQXuP
         2I84JUbQc32PqPJj6avuUjD3MPPjyUui6ZN+ei5PlL7F0BVstVpH0Wcl92rcxGT0lFsC
         V5ysJ4F9aTXG5gSTo3o3tmgKmeoNqTjm76ItwQ9+Jogt3rmJERfK+hcN+UfLujik1ODM
         P3sSuCJzVNbyjps3CGSz1UWIJD3gev/64rWtiBfOXyPDx4gJWFUgQKjE5VtkA7GLTbCq
         AvsOiC8y3bW9YEmJUpNlDD1R3ZpjVRSv3L7SnroIlBuGBgWTfQ3XCgr/7KOoTf76XDa1
         l6TQ==
X-Gm-Message-State: APjAAAWMJOcjWfLmKGMCB12Nwi6anKOnBGTKXapU8LdCARcmGdlIyqyB
        ChrqA/0/c2oZkpCylrFUPEE=
X-Google-Smtp-Source: APXvYqxqnc3WA3ovtwTbPcjOxkkou6kiX5EIvG3n7soiuUXv8RWSnaAQREkCz8Bo4R3J8HfkR7R8WA==
X-Received: by 2002:a1c:4484:: with SMTP id r126mr5412119wma.27.1559298540194;
        Fri, 31 May 2019 03:29:00 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id d11sm6598454wrv.72.2019.05.31.03.28.59
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 31 May 2019 03:28:59 -0700 (PDT)
Date:   Fri, 31 May 2019 12:28:58 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Peter De Schrijver <pdeschrijver@nvidia.com>,
        Bitan Biswas <bbiswas@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] soc/tegra: pmc: Avoid crash for non-wake IRQs
Message-ID: <20190531102858.GA21355@ulmo>
References: <20190529102654.14665-1-thierry.reding@gmail.com>
 <20190529102654.14665-2-thierry.reding@gmail.com>
 <27ffbfe6-1c88-63a1-aee1-7fe6ce252e54@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="8t9RHnE3ZwKMSgU+"
Content-Disposition: inline
In-Reply-To: <27ffbfe6-1c88-63a1-aee1-7fe6ce252e54@nvidia.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--8t9RHnE3ZwKMSgU+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 31, 2019 at 10:32:40AM +0100, Jon Hunter wrote:
>=20
>=20
> On 29/05/2019 11:26, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > For interrupts that are not wakeup sources but that may end up getting
> > mapped through the PMC as interrupt parent (this can happen for GPIOs),
> > return early in order to avoid a subsequent crash from an out-of-bounds
> > access to the register region.
>=20
> Maybe worth clarifying here what you mean by 'not wakeup sources'
> because the Tegra GPIO driver does have a set_wake() API to enable
> wakeup at the LIC IIRC. So maybe GPIOs that are not wakeup sources for
> what level of suspend?

Wakeup sources in the context of PMC is always LP0 wakeup sources. At
that point I don't think LIC is enabled anymore. So LIC is to wake up
=66rom LP1 (and perhaps LP2), while PMC wakeup sources need to be
configured in order to wake up from LP0.

Adding Peter to confirm, I think he's more familiar with the power
states on earlier chips than I am.

Thierry

>=20
> > Reported-by: Bitan Biswas <bbiswas@nvidia.com>
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  drivers/soc/tegra/pmc.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >=20
> > diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> > index 653fe2c466f6..6e66b5e293be 100644
> > --- a/drivers/soc/tegra/pmc.c
> > +++ b/drivers/soc/tegra/pmc.c
> > @@ -1924,6 +1924,9 @@ static int tegra_pmc_irq_set_wake(struct irq_data=
 *data, unsigned int on)
> >  	unsigned int offset, bit;
> >  	u32 value;
> > =20
> > +	if (WARN_ON(data->hwirq =3D=3D ULONG_MAX))
> > +		return 0;
> > +
> >  	offset =3D data->hwirq / 32;
> >  	bit =3D data->hwirq % 32;
>=20
> Otherwise ...
>=20
> Acked-by: Jon Hunter <jonathanh@nvidia.com>
>=20
> Cheers
> Jon
>=20
>=20
> --=20
> nvpublic

--8t9RHnE3ZwKMSgU+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzxAecACgkQ3SOs138+
s6FFaxAAr4aaLWFmkpEiABQ0zu4tN5TmLuUUgZ9pYuwjTMW0yzcIYx5gB+Y6XlOP
1WEmbHUwx81+e6C5hEmhRigPbBj1AZcA9QZzSUS6WrwAVl5a+10Qb85ESl4x2yIS
jLotoprmcHyachwpD+zfn2P7xyAIgvntTyrN1rYbBZzebGwGdXNv5kgqdAjFrEs+
GNVGVS1Pk6NOWX3Vh4SrvSp59q5QG41ZPdBabRZfZVrF9jG+9imIm1Thtz/RU3rk
4AC2p5LpQi3ErQ6JSNlAfNToDAw98q1CK+MerhmgAytjpbHRSK7F5fqJpNwWFhEt
0MGEemqz9dvEJe9iDnc1kE2j2zmyG/qB5XLU8tzLGyZWybqF2nsgOIDVrcRan/Ag
/lYvza2oquo8/VP5iVyMw9JzjYUp+tMbMBv0hc5fzwU5PFYKIlJYUwC35oQgdyLd
RVDcm8TZYZiu42fIb1Pl1b8E5Vki/vyF9B7NN6TAfV6Odp56WHo7OJb8oL1kxt4u
BC447KHwr/Uk3/9kcHCjIIf10dVZp9nDp8Zp/5k4P32nMxhCPkNmKhb9I5Lm6z07
DivFYgbK56pFlcB8pMfE0fjHRmSgaxafCenrhioANV2sHQiR1pb6H7oYV81Xeybt
cTq95XTe+SrThiOwdK0B9b4VXqPW+UHawqnJ0dhvbaKuDqKKumA=
=kCdx
-----END PGP SIGNATURE-----

--8t9RHnE3ZwKMSgU+--

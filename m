Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD2E4136C01
	for <lists+linux-tegra@lfdr.de>; Fri, 10 Jan 2020 12:32:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727833AbgAJLcf (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 10 Jan 2020 06:32:35 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:45732 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727457AbgAJLcf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 10 Jan 2020 06:32:35 -0500
Received: by mail-wr1-f67.google.com with SMTP id j42so1437951wrj.12;
        Fri, 10 Jan 2020 03:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=VDOBLVP2uMDtgkYlbh0RLGDtRm5JjQhTdu/op9Z/UyE=;
        b=hGb+W4vrP0jVqnI67ncaXIT9yBMwOb6pBL9iv7EXT2Yl/YKg5jlQ62ts30BGCqvX2M
         jZ05BxJ/DPjpdoA3z0ig4R81x5U/SOrNR9ATkD2Pds5sz19+6mVjiurDzABgZQ9bHnvN
         lMr0zW8HVV5MXvr+DaVvKvKpQivWt+nNzmO+8kuySoCkw4hSKbvsKoaXzfMVi7tAmcHb
         19B8WgHNdJKUJyh4N2wSIWYrE8+60v8ZLCbDnAfijcZ4Rk8AwgGDI6+wEH3/DXG/DtJu
         tEUrtC2zABKfgcVBNX98l/hHDXlh2rv4Tg/8F6lNyhqH7N9Bjk+1SkTolM/DUAHbNCkb
         oTPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=VDOBLVP2uMDtgkYlbh0RLGDtRm5JjQhTdu/op9Z/UyE=;
        b=sPAvuZcSUBC+Oml0OT0q5ehNDvbxWTnWB60H5CIwBLsyN0IQ8hIkoS7bBvere4pgVh
         pD9HFM0PeNk4yL4rRFUgfwz8lBLI+Bip7pMif/Fdi89KkNhUCEiqe1lmAHqB2ofEGTqS
         HUWXZ9/R0LoEtQLRlK1iRp5RTc2UPlzzCHSXpjAqlePEg8odV/sxw4CcLbN3JZNfBGTo
         Nio8Ji5GhOa/84VgBBV8/8B+2K0deGhug0M4/CTUKBcwdBCLZaJ4QjOkdJ0mhtaO3trV
         zheLKriuAn+sC+hS+SMrLCF/SGdm+X9azbsA5/VjLPv7U/BQA7dCMgHgXqTLqlJA5JPz
         eL3Q==
X-Gm-Message-State: APjAAAVSLCyvyHaG4TQ9umj8r1pDA0Ek29TcgbebE9Hkho+qFu5b0aGK
        Ix8rDbW/0RZXD7dqBD/ixLGUqrFK
X-Google-Smtp-Source: APXvYqy3EsbIHhc/6UkiyMIyjf8+05iRwdEvmECEarb7slM6cwJWNt/iLyr5c94/CwtD84eGnRsgSA==
X-Received: by 2002:adf:db41:: with SMTP id f1mr3088414wrj.392.1578655953274;
        Fri, 10 Jan 2020 03:32:33 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
        by smtp.gmail.com with ESMTPSA id k7sm1812384wmi.19.2020.01.10.03.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2020 03:32:32 -0800 (PST)
Date:   Fri, 10 Jan 2020 12:32:31 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Sameer Pujar <spujar@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: tegra-aconnect: remove PM_CLK dependency
Message-ID: <20200110113231.GC2233456@ulmo>
References: <1561045919-15449-1-git-send-email-spujar@nvidia.com>
 <55217434-2a50-7abe-25c3-6f4f90d8ba34@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7gGkHNMELEOhSGF6"
Content-Disposition: inline
In-Reply-To: <55217434-2a50-7abe-25c3-6f4f90d8ba34@nvidia.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--7gGkHNMELEOhSGF6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2019 at 05:02:27PM +0100, Jon Hunter wrote:
>=20
> On 20/06/2019 16:51, Sameer Pujar wrote:
> > aconnect bus driver does not use pm-clk interface now and hence the
> > dependency is removed from Kconfig.
> >=20
> > Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> > ---
> >  drivers/bus/Kconfig | 1 -
> >  1 file changed, 1 deletion(-)
> >=20
> > diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
> > index 1851112..4587ef2 100644
> > --- a/drivers/bus/Kconfig
> > +++ b/drivers/bus/Kconfig
> > @@ -128,7 +128,6 @@ config TEGRA_ACONNECT
> >  	tristate "Tegra ACONNECT Bus Driver"
> >  	depends on ARCH_TEGRA_210_SOC
> >  	depends on OF && PM
> > -	select PM_CLK
> >  	help
> >  	  Driver for the Tegra ACONNECT bus which is used to interface with
> >  	  the devices inside the Audio Processing Engine (APE) for Tegra210.
>=20
> Thanks. We should probably populate the 'Fixes:' tag for this to show
> which commit this fixes. Otherwise ...
>=20
> Acked-by: Jon Hunter <jonathanh@nvidia.com>

Looks like this was never applied. I don't recollect that there was a
specific reason why we shouldn't, so I went ahead and applied this after
adding:

Fixes: 0d7dab926130 ("bus: tegra-aconnect: use devm_clk_*() helpers")

Thanks,
Thierry

--7gGkHNMELEOhSGF6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl4YYM8ACgkQ3SOs138+
s6FVRw//T20mgoBuGWTrMprzcNfp4FCfm3vVNQ++PT0MLgHryl4scurRrsBATSKa
9ksRZaXbwGkxrfypVAliBl6VQ012T5daNqnVCc5InnC5fBBwB+D90Bpqe2/dSglX
YhaRrl3bujE/OuHYnoHY/TxOqJjYoIxgJ9WIQExDOxRdPT6y1U/6NQIjARXrDLob
0qo08Pln5nHDoJ2rrYnRaNwC51YGOnNMnv6YQgxJpoPJ5Z82Ikck7WRJv8oFPuCV
tn2UeQM+McZhd3tE/7MhQv6MA95n59+VgcNCNVaFgkN856fzIVMOK0ArDUk1pNgO
a8EACZgWZaXpUOz3V0TPpTJVwNq6p/+xjHb3vQGwLFtIo6NMcq10TYmFpqjv7z7z
HGQeeOk+ZlR1dwaMI6bPMEnccdbQmKesqGn59GtAiejwbcJIoO2/IvERmYX77kNh
opAIwVDUEOE8LWx0WrxmiLOOF8Xgn84IDevhuRR/mNa+GmwPsb4znDMUSfuOi5c8
jV9vDWDd8/oNmQjaPvaEp4f6nI/gO2ghxtjS8HpU+ZaiR0rmwqjq6LRy7lvuqbDS
SpTnqO86uuxLVBFB0Qe2tN572dTdItvvTkAI5WO/bnSFlJGcnPqlIIpbhgr2I6lu
YhTQDFav40BzgLiD44ZHOhixifJMgJKRBCNBP9I3aXJHxESBkgQ=
=zEDp
-----END PGP SIGNATURE-----

--7gGkHNMELEOhSGF6--

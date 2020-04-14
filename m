Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 363E31A7FB3
	for <lists+linux-tegra@lfdr.de>; Tue, 14 Apr 2020 16:27:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390720AbgDNO1E (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 14 Apr 2020 10:27:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390697AbgDNO1B (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 14 Apr 2020 10:27:01 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CA95C061A0F
        for <linux-tegra@vger.kernel.org>; Tue, 14 Apr 2020 07:27:00 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id y24so14170784wma.4
        for <linux-tegra@vger.kernel.org>; Tue, 14 Apr 2020 07:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=zEhwiR+vyHHEAXkMwbsVNm/lmU61lK9swOpVtUCs63A=;
        b=hD2cwrFrHSDinmjs202lPgG/kqeVPUD1XhAccX9hGHGrk+0YBfrgcbvoaf2aS7t2VW
         jufP0ADcPK8Ss5GeOEpdp5hrmWWLWzbCg9ttqLgTdbcDzrm7fwH+4YgGWKWHfyof/Q/T
         7QD0SPQv3cNYbOr95YefyZ7ZRraJeqgKa/PHqPIu1JZdJawkIgGYyqTfdc0U4gWZvCJa
         a4NIkOlrydcVbu5jFSIiwvdGymjCu50RhvaQx/GVGI3JLZHRZtRxn+GvTpMhEEX3dN9M
         b1BEQG4DePP2ttV+Ylrt61N5GApKqhIlzKhbGgkl9WktV+0K//kFV9pdMtVWIbVMZGdd
         E14A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zEhwiR+vyHHEAXkMwbsVNm/lmU61lK9swOpVtUCs63A=;
        b=B61mBg3oynLDsHlzk3irTqnnPFp2Zbapyk2KAhTEbe7wRmvmu9vELteHQa4Nt0Ety1
         gSmtBdtlJywXYzfBq2KcCzj+TzOH9dl2d2d9V6Bf4TUT4kEU8rCE2rr+VwhvdVx24yTE
         PzqmqJv97NvgMxam3QdgI0LDmCDKk9voF/rAQzzdj+1vnLLGFAh0YD5a3TOkOgtOd6H1
         pjBL1AuuyCSLBx8xynm75GRKW6K4/sa1hlBnvEX4C6Qbra5JLORJDO0Zzm7xwmpIVFUb
         gU3Gea/OOspLzEkX7/2nrjkKTAVtV7SZ7/HL6iwBK5fMt/tqKpEHYUtPiyUALuOH3cBf
         1OnA==
X-Gm-Message-State: AGi0PuYlMgTj3sVMyYWtKOknNsr3dC7MCkro8jjBAgq3YU0ber7kUVmb
        aZ4p74RJY0RTz0bI7gwSTGa/rSbN
X-Google-Smtp-Source: APiQypIRTWEUu6tlvFDBTOgLwhZvew1YX0WsnFc5ex7ur5Tqq+z9rollOx+SWPnyFscoJTsvglGL7g==
X-Received: by 2002:a7b:c931:: with SMTP id h17mr130289wml.105.1586874418826;
        Tue, 14 Apr 2020 07:26:58 -0700 (PDT)
Received: from localhost (pD9E51D62.dip0.t-ipconnect.de. [217.229.29.98])
        by smtp.gmail.com with ESMTPSA id y18sm20183332wmc.45.2020.04.14.07.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 07:26:56 -0700 (PDT)
Date:   Tue, 14 Apr 2020 16:26:55 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Vidya Sagar <vidyas@nvidia.com>,
        linux-arm-kernel@lists.infradead.org,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH] arm64: defconfig: Re-enable Tegra PCIe Host driver
Message-ID: <20200414142655.GF3593749@ulmo>
References: <20200409095530.12004-1-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="JcvBIhDvR6w3jUPA"
Content-Disposition: inline
In-Reply-To: <20200409095530.12004-1-jonathanh@nvidia.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--JcvBIhDvR6w3jUPA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 09, 2020 at 10:55:30AM +0100, Jon Hunter wrote:
> Commit c57247f940e8 ("PCI: tegra: Add support for PCIe endpoint mode in
> Tegra194") updated the Tegra PCIe Kconfig symbol for building the Tegra
> PCIe host controller driver. Following this change the Tegra PCIe host
> controller driver is no longer built by default and so no works without
> updating the arm64 defconfig. Fix this by updating the Kconfig symbol
> in the arm64 for the Tegra PCIe host controller so that again it is
> built by default.
>=20
> Fixes: c57247f940e8 ("PCI: tegra: Add support for PCIe endpoint mode in T=
egra194")
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
> Please note that this is needed as a fix for v5.7.
>=20
>  arch/arm64/configs/defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thierry

--JcvBIhDvR6w3jUPA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6VyCsACgkQ3SOs138+
s6HnjhAAorO/eH1wOSgRsSF23BCq+30hhKgnRnkyOsrtCHgf/MeYFIAzvcr06pDp
RDijJcmBvSzoNFsdsVDxhzOdYrzh2Nyw2NLSO7kDejN3UHxfsc5qqnQE5MfLsBkf
u1JRxL8KiQY3fOk1ImSfFrhZC8svbWMKgZGtb/xP1Ejx+PKWHpAOnkpt7blT4HqW
oUapgRS+sKD1QlrPLiShBLayktAljR2kI3ZOujqRZtOQ0AGIr3RTpNERveN+alSi
nyEjFfny7HJPgw0SoyDlprrC/XZXVEVLvqOzGVjGird0qMihyuBpI3Y0nKz0ODbY
c1xtFGqfeYXz77nETFl0rjDlBYPrepKZNfyPG34mq9Z5Ihze9eDWo74jU0WjXfT9
P+yr1Y5fom2kcC7T9EvvW26WKIebto2fjW42ogTvoixHKh1A9fcxvqBMTTqlPP8M
aJ5xB4SqaMVtEvXBtlyycexWP+zVaEg4kFZY++hAUhKmhKS1CLLBxlP0v+OIFSfU
2iWRC6zulaN/yppee9aUwOrKEgMw/LuBZ9G9LKlTokOuDMsIphqNQFNmXhMC8jEp
r09W8PTt6xhXlhNmPmyfm+rUAGtVWVgT4g6V+SlU04YPqgaoTNz0kx0Gqz+FlRej
kchihYhNuHEXNdTfVOscJlMHoxY2ESCNzQQ3U4MYDeYZSWehUCc=
=2UgN
-----END PGP SIGNATURE-----

--JcvBIhDvR6w3jUPA--

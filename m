Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17D27222373
	for <lists+linux-tegra@lfdr.de>; Thu, 16 Jul 2020 15:04:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728760AbgGPNEw (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 16 Jul 2020 09:04:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728260AbgGPNEv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 16 Jul 2020 09:04:51 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99A22C061755
        for <linux-tegra@vger.kernel.org>; Thu, 16 Jul 2020 06:04:51 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id w6so6469313ejq.6
        for <linux-tegra@vger.kernel.org>; Thu, 16 Jul 2020 06:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=BeiRQ1CGfCtay1QmPkWXwfEoUek7PcKZeAFAj5RVe6s=;
        b=rMDHqYTrnpazqchvbnF4OLz6g1dK5wx86zTcfH+9Hkcn7m/gCW9gniugk0PQ45tjhz
         RzCNsuhPz++cVlbPo5RC2HzYSmx1NWkFpb4TfYZzlf8TgesWWfiEMtyQc9jz3urXdyOF
         84JXzhR7ztVqOGLOEQFELOMb+Nz2LYu87YlZtUcjRQNEYQCaqUGfSLjDFZ8hFra9pGMp
         OyQ5cdKxQDr/7xasJRSsZOFmBpPxD3XOMHOJvw44pXkxjHTpP15+sqlJVHatUia9yLA7
         nm/nwxSaqzdwuP/0GV816bGZXEJGuw1IC8XhVtcD4/ZC4EhAjx5l4Z4fTFOTBBO3cCTC
         vGsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=BeiRQ1CGfCtay1QmPkWXwfEoUek7PcKZeAFAj5RVe6s=;
        b=ND7nxkUrh4hntuKhGNhH+vAgQJwqfqyXDUhdoAFHzk0/JE3tFJ3BRmUeh5gdVsqO0+
         n8bmKpbbHkYMNiaZdtwRMG2FQDwgqwlKSSBVeiQ3ltT4ssfETH3Nz93omQq77L+cRY2c
         vBFOJ85DLR8o7pa5G8xyjiDV7Cobj9QabqBOJYfLD2N8mriTrZBNxM6+ktLdY5ml/H62
         IS5Q2BC3R5rZHkqZI27AkECG9S8gsuVCCZZVgMnjWI1Xr9Lo0R4nJi3Cdp+TdoDX89D2
         0akn4Bs369hQgd8BtqjlJcr/MULtUOeyLgeRtnJRV8K4WE2gVePQOf1Jcv1Pwuw8y/lP
         VOtw==
X-Gm-Message-State: AOAM533yQ8LhsACHb23vlo9+5j8Y1Gk3BsZt7JEoIfJWEv9ztUvo/5WJ
        Z45r33sTkXQQXmjyl8HKBuVxfnGB
X-Google-Smtp-Source: ABdhPJz+j+N10lwFnAscT5fVkcvu2Qvya2FSOnT74fBMapybLBinImJupeAf9nZOE22LyhLrb8BJ7A==
X-Received: by 2002:a17:906:60d0:: with SMTP id f16mr3510970ejk.17.1594904690335;
        Thu, 16 Jul 2020 06:04:50 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id y22sm5232129edl.84.2020.07.16.06.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 06:04:47 -0700 (PDT)
Date:   Thu, 16 Jul 2020 15:04:46 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Nicolas Chauvet <kwizart@gmail.com>
Cc:     linux-tegra@vger.kernel.org
Subject: Re: VDE for tegra124 ?
Message-ID: <20200716130446.GF535268@ulmo>
References: <CABr+WTm79nGMahuudkZtB6nizP8mxwwi6o4r2LUuN8ykoTrONA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="9ADF8FXzFeE7X4jE"
Content-Disposition: inline
In-Reply-To: <CABr+WTm79nGMahuudkZtB6nizP8mxwwi6o4r2LUuN8ykoTrONA@mail.gmail.com>
User-Agent: Mutt/1.14.4 (2020-06-18)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--9ADF8FXzFeE7X4jE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2020 at 04:20:08PM +0200, Nicolas Chauvet wrote:
> Hi,
>=20
> I'm interested in having at least initial VDE support merged upstream
> for tegra124 (not yet tested).
> I was wondering if merging the dts part and the needed compatible
> along with few fixes (2) would be enough to work with the current
> userspace ? (libvdpau-tegra)
>=20
> I plan to have it tried after 5.18-rc3 land and report.
>=20
> Thanks for your advice.
>=20
> (1) https://github.com/thierryreding/linux/commits/for-4.22/vde
> (2) currently testing patches:
> ae8cd25401f9 ARM: tegra: Enable SMMU for VDE on Tegra124
> 53e4822d773a staging: media: tegra-vde: Keep VDE in reset when unused
> eb5b12a86651 staging: media: tegra-vde: Print out invalid FD
> c28810efcb90 staging: media: tegra-vde: Support BSEV clock and reset
> 55266929b386 staging: media: tegra-vde: Properly mark invalid entries
> 3aae01ea407f ARM: tegra: Add BSEV clock and reset for VDE on Tegra30
> f5e6a834c766 ARM: tegra: Add BSEV clock and reset for VDE on Tegra20
> 615bf7bab259 ARM: tegra: Enable VDE on Tegra124

I don't think those patches are enough to make this work on Tegra124. I
think you basically need all of the patches from that branch, at least
up to the point where the V4L2 conversion starts.

Given that the V4L2 conversion has stalled, it might be worth reviving
this relatively short series once more. I can look into rebasing only
the VDE patches and see if they still work.

Thierry

--9ADF8FXzFeE7X4jE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl8QUG4ACgkQ3SOs138+
s6HuZg//RS0OQdrycFOvXOVqLpr1RIVzf6SuFl4Q2L+vGOG7SHRih/fePo1aahjL
oyJKyFWYsP8C+RRN2Lz53zBbdOpk5ibkJeCnHX4xr95qaxEyQD7rNOJEVY02n4vG
AN/TrR1wItgTo0XIVXFKDdyVSaBd+PNZrxKQRzdblbQJd8MYkWIpqk1O05173TT+
mRBR4JnhoQpJuYeVBuY1uJCqkluJISh3JsoFDrT7UcyamFecnE3u0spVZ46cdhlO
i8leAlGhOBY/cjWZHkZimmFzOVeCvMD4K8OoBIIcej+uTLzaJctLc4Gc8vX/qTAo
8tZ5qKAGq+dcWqBQACAMsPPjR7AgtxjszJ5cd06ouv0HH3IjTfwXUTDGUlMgHrnX
413k/tKjQmYYKSzVD1ZUwu3G/6WZyGDECIOZvElHZqdf1RmBT7F+nPcSDQahX6s6
1xdZ2CQlNXv3u44r/gKn7tYmijJb20N3dtY9JnkGN29/6/IuFM3+6zG88w7Fh1oO
GNFH7SvyE4n7WQmEJIuDqNyhNuL0Tpfd2f50S9hxDVPw8sSGyOwQMS0L6tXGeWKt
O1K1qWotjJ7+S8jIj7/gMERvIbQVjZSNBclZsPdSuc7IcHw1sA1rlXsSg5qthg8m
YejRir7fHinM2Ovu2NaZ80ehcIQE6WwbmglJNAGDuamUnTtDCvM=
=Vvaf
-----END PGP SIGNATURE-----

--9ADF8FXzFeE7X4jE--

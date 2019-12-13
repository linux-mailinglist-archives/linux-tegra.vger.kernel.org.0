Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9A3F11E639
	for <lists+linux-tegra@lfdr.de>; Fri, 13 Dec 2019 16:10:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727580AbfLMPKu (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 13 Dec 2019 10:10:50 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:40744 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726528AbfLMPKt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 13 Dec 2019 10:10:49 -0500
Received: by mail-wm1-f68.google.com with SMTP id t14so6910866wmi.5
        for <linux-tegra@vger.kernel.org>; Fri, 13 Dec 2019 07:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=VP/wSiPBuTtlRr61lNpmQyeGvWFefwygI0znv/Cr5Yc=;
        b=koFpBk8wGPFH8Z32wTixBAx8PYxJCfQ9LLNwdTrOq+eUtt3fIm6BhQQAZJJPiwjgEg
         5PTl1v6O+P3B+1n6s6AMLcNE6DHpuLgcZULws/z2/3obQf6+Tnt31PbifVdF5+9y9jJa
         NFZjHOnjYmtm+PQxMY7M3JuMEM21/YTY9umeyvt4/P0JqIkDYA5GBZyDdAtok5zF+AiW
         yk1kVJZeG/ZLjH0GJng8EgT5oMdZgwFETEzABqzMcFYQoTB6Tm6xI6fFmKnwHUPS4lFy
         UIQcJhNXy8yH3SIgq44mRpSxjpF9bji8qLyjODDr6gNvlIjEXIr7Xg6K2TgOMduY9h+F
         FX4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=VP/wSiPBuTtlRr61lNpmQyeGvWFefwygI0znv/Cr5Yc=;
        b=J03xzmVFYIEMA3if7xPEXmTmJwUd0LTvZDHSgsja2E6AMrg6/gi+MZAjtxsBxP1zBo
         FQsxM9eM4N2VAYWhRISSR1yx5QtK3JjmduIiRByKXbVDJx8DhRFMl14QGYNbEN3y/KlL
         yVQCcVb6PPtjGJk4rP5Hi0yxB02y1k5dbSl+V4V+SUhsn5MLaqISfkTAorCwnmRJN7ZG
         XQuPVOzoUcVZ7cdT1ANdPcJH18u8g2jMy+HgjtlGCBNWSLJPi7tPRGnUetLKiTkQ3Gqk
         1tJANE7544/zVd62AcfV7O3ELs0yejKUBvFhREACI6rfouEDAZJSBxdlfJnZkKMUDtOh
         dBuA==
X-Gm-Message-State: APjAAAUD2isJNOT7rgv7SHBxd3fYcmpWS+0ZpArgOszCZMM9Ru+wEvKi
        vV2i5EIEckEmHgTeIWBN1rc=
X-Google-Smtp-Source: APXvYqyIPiZvmXoD6AnH+MygBqHUHoCexCDzNOX99QWzaQH7IDpaJnq18JN4kStSan3+hMi12cRVGw==
X-Received: by 2002:a1c:a406:: with SMTP id n6mr8622960wme.40.1576249847349;
        Fri, 13 Dec 2019 07:10:47 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id z11sm10460923wrt.82.2019.12.13.07.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2019 07:10:46 -0800 (PST)
Date:   Fri, 13 Dec 2019 16:10:45 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: [Regression 5.5-rc1] Extremely low GPU performance on NVIDIA
 Tegra20/30
Message-ID: <20191213151045.GB222809@ulmo>
References: <a2c9eb65-c600-bf49-2c32-bddf7b44f784@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="uZ3hkaAS1mZxFaxD"
Content-Disposition: inline
In-Reply-To: <a2c9eb65-c600-bf49-2c32-bddf7b44f784@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--uZ3hkaAS1mZxFaxD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 13, 2019 at 12:25:33AM +0300, Dmitry Osipenko wrote:
> Hello Thierry,
>=20
> Commit [1] introduced a severe GPU performance regression on Tegra20 and
> Tegra30 using.
>=20
> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?h=3Dv5.5-rc1&id=3Dfa6661b7aa0b52073681b0d26742650c8cbd30f3
>=20
> Interestingly the performance is okay on Tegra30 if
> CONFIG_TEGRA_HOST1X_FIREWALL=3Dn, but that doesn't make difference for
> Tegra20.
>=20
> I was telling you about this problem on the #tegra IRC sometime ago and
> you asked to report it in a trackable form, so finally here it is.
>=20
> You could reproduce the problem by running [2] like this
> `grate/texture-filter -f -s` which should produce over 100 FPS for 720p
> display resolution and currently it's ~11 FPS.
>=20
> [2]
> https://github.com/grate-driver/grate/blob/master/tests/grate/texture-fil=
ter.c
>=20
> Previously I was seeing some memory errors coming from Host1x DMA, but
> don't see any errors at all right now.
>=20
> I don't see anything done horribly wrong in the offending commit.
>=20
> Unfortunately I couldn't dedicate enough time to sit down and debug the
> problem thoroughly yet. Please let me know if you'll find a solution,
> I'll be happy to test it. Thanks in advance!

I suspect that the problem here is that we're now using the DMA API,
which causes the 32-bit ARM DMA/IOMMU glue to be used. I vaguely recall
that that code doesn't coalesce entries in the SG table, so we may end
up calling iommu_map() a lot of times, and miss out on much of the
advantages that the ->iotlb_sync_map() gives us on Tegra20.

At the same time dma_map_sg() will flush caches, which we didn't do
before. This we should be able to improve by passing the attribute
DMA_ATTR_SKIP_CPU_SYNC to dma_map_sg() when we know that the cache
maintenance isn't needed.

And while thinking about it, one other difference is that with the DMA
API we actually map/unmap the buffers for every submission. This is
because the DMA API semantics require that buffers be mapped/unmapped
every time you use them. Previously we would basically only map each
buffer once (at allocation time) and only have to deal with cache
maintenance, so the overhead per submission was drastically lower.

If DMA_ATTR_SKIP_CPU_SYNC doesn't give us enough of an improvement, we
may want to restore explicit IOMMU usage, at least on anything prior to
Tegra124 where we're unlikely to ever use different IOMMU domains anyway
(because they are such a scarce resource).

Thierry

--uZ3hkaAS1mZxFaxD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3zqfIACgkQ3SOs138+
s6EkaQ//bR2YjZwwKfYS0AbF9WisJVbGc2duOW0p2r2B2yUFBfc9z3iP2fSHrwLn
Xlgpjx7sfdkmMdGEKv0y1ApCeBvJPTIRSu8Oe/4mRxt6yy7iTf/eKGXCEuq7XPcp
0BpqQXNDSCIQ2dVEyJdO/QKEkjLivkjkBdHgc45sVCdZGIkn1l0roiSvu7RjVNRd
EP5dPJkz7kf7BB9C459+PHMnFAkGZH69HwTOyTN0onsny1VKS/qKneOqOcPXnMlj
WQMymiOeRJ0BsUw/bH4QwFMg4GT+LXjpaNmMUaycYJDUdSTHmIM6IL/tTvpW9Rgq
gNbrVhw1b2Txo24hk0ago8WN5HbzBsRIMbKOdIGSp8OQ0MAcIdoWszyQu7CjMUPb
TP1bHRf6qZSHvUoH52QjFxFeSD6yJrCjcUoUH69oImz9nUREJylh6+DcgVCPaq3X
1MPCNrDOb4rZn+2hs+i1H7CAaNwDmAePPad2UDtPew8ca2FS2/RBi/UJIIQPgbJV
XVOABeKINphN96S1i/UGsT9Axw5fHafo6iHycJ9NCxVmqWhaXfGqpX82chFt6zWv
zRIQyr27Imvh2hsL69tKN36YKs9biC6KWe4G7rpRb0GtosAgYS8LFBW/0SuU0plB
R0elDnXd2EW0J2ln4jVZmx6pKfk9YbHxHmVeLiRVZTHq/l9c/8A=
=MPqg
-----END PGP SIGNATURE-----

--uZ3hkaAS1mZxFaxD--

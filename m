Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E562AC3814
	for <lists+linux-tegra@lfdr.de>; Tue,  1 Oct 2019 16:51:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388925AbfJAOvS (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 1 Oct 2019 10:51:18 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:47058 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727194AbfJAOvS (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 1 Oct 2019 10:51:18 -0400
Received: by mail-wr1-f65.google.com with SMTP id o18so15867750wrv.13
        for <linux-tegra@vger.kernel.org>; Tue, 01 Oct 2019 07:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=AgKw3mZh1KheWXtHsifk3ei4VZBMqeuEo9bov01kIDg=;
        b=UOCdfQ8Hhwxwx33QrldZ9snajJS1qLRgonAfvw5DTk0oJ9dsSpXxeK1ggWcKKAzWbL
         oss5V5v+j2y1oz1H8UYyTk7ntknNpWg53sutjcGfI1xKGO3WTw4SveGnzrHGPsteRyeN
         0Cne0eJoL57D+hGrg27SqNbJ0LrmAdwc8AB/fUW09WS781kqGY8O14SxLgCYHeh4WP6Z
         N8lF6SBHXyPMkbDmuhs2d0LWkqyCF1Y77g11JsVBM0OPcvV7pfkQJUjvnU2gOnqOquVH
         Mcq2Lgl7OhXveH1wHSsoDTtiNrPly5upHi8yn7R1z+OGnhg7xOjUY/ndqGTe+uOubbXA
         HqQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=AgKw3mZh1KheWXtHsifk3ei4VZBMqeuEo9bov01kIDg=;
        b=fGYNdRb+BaQFCI7B3MCjUV0ax1HjzkOFI64JjqqzsKJ28I+Yfhem5Er0JJSYND5B+K
         N9b7w8Yaf7bwzZT01Xo5RtZM/aUI7Wju0fRQSItbS9HzMZoo14X3KZPieaJ3uWyaZdpR
         J4wR0pQksHk4fJ0fLWcDCd0ujfJyP4itisTrXIQjIddqMe3b0mZgRJvt0HBZhxgKYeee
         09geXC4WoCojOD6VMWcX9Uu51ZE2e4/Msce+oYqeZXED6iErvCKuhGlV3w145ETsZ9K0
         IwpstxkPRqvu4ro6N5J5YC59JAHfxLRT6GiURyLr0ui/YsOTGze5BCTP/YMN365WRtZ1
         R7aw==
X-Gm-Message-State: APjAAAX1eR+dw3MXpdEw9eB7BSkooc4Qa37xqBwbEYayDa9iefbl9pAh
        PTW89XUhVSOkD3ej5F17zgXVzjkh
X-Google-Smtp-Source: APXvYqxhhVg0RhjvukJFMpXI+YtZEH75O+5C1iaL9+d4puCbUPJmekg3rbKn8gopBPUngIdahHRF1Q==
X-Received: by 2002:a5d:49c3:: with SMTP id t3mr17497480wrs.151.1569941475873;
        Tue, 01 Oct 2019 07:51:15 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id 79sm4181642wmb.7.2019.10.01.07.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2019 07:51:14 -0700 (PDT)
Date:   Tue, 1 Oct 2019 16:51:13 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] arm64: tegra: Fix compatible string for EQOS on Tegra194
Message-ID: <20191001145113.GE3566931@ulmo>
References: <20190925113851.2691-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="r7U+bLA8boMOj+mD"
Content-Disposition: inline
In-Reply-To: <20190925113851.2691-1-thierry.reding@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--r7U+bLA8boMOj+mD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 25, 2019 at 01:38:51PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> The EQOS hardware block found on Tegra194 is in fact not compatible with
> the instantiation on Tegra186. While the register programming is exactly
> the same, one notable difference is that on Tegra194 only 39 bits out of
> the advertised 40 bits can be used. Bit 39 enables some on-the-fly
> swizzling of data that is counter-productive to ethernet connectivity.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra194.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

It turns out that the EQOS controller is perfectly capable of addressing
40 bits of system memory. The fact that bit 39 is special is a system-
level detail that is better described by restricting the DMA mask using
a dma-ranges property. Patches to do that will follow.

Instead I've replaced this patch with one that adds nvidia,tegra194-eqos
in addition to the nvidia,tegra186-eqos compatible string. This follows
the established practice of always listing the SoC-specific compatible
string, even if the hardware is compatible with prior generations. This
is to make sure workarounds for unforeseen bugs and incompatibilities
can be implemented in an OS when matching on the specific compatible
string.

Thierry

>=20
> diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/d=
ts/nvidia/tegra194.dtsi
> index e590a3cebed0..49e2121f0cbf 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> @@ -40,7 +40,7 @@
>  		};
> =20
>  		ethernet@2490000 {
> -			compatible =3D "nvidia,tegra186-eqos",
> +			compatible =3D "nvidia,tegra194-eqos",
>  				     "snps,dwc-qos-ethernet-4.10";
>  			reg =3D <0x02490000 0x10000>;
>  			interrupts =3D <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>;
> --=20
> 2.23.0
>=20

--r7U+bLA8boMOj+mD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2TZ+EACgkQ3SOs138+
s6HNww/+KYtK1JnIdGOYIuBf+Hc4N8qVilZxGHuxDX15gIhjbAi3itYYa3D8zofm
ZO8V5XPsS9gYs/zxdQyWxGmJWBuF+pFFJ0+h3zQ0lZ17Fr433k5wicliYsr05aJd
lEvjMKGjVUuPqJdrXro2YOHJJgR+6TehFQeg8ln2Xb6N11ag+vRrGCcqpPilIFaq
LgKpJ2ZzweZYaGhiOvFsJiXDMwVWhtBMK4aqiMKN/3uQ+75gkHas45UU9cjStBAI
utNv2By6eiRINm2SNJ9hlldwZZ14Fff4T2hXEyNv7qfyKbzPZxYVSQXan9NfSNgd
NLfcc1X6KoA8XfMY7ScLKjOkQ2n6kP8b5tWPFgIS/mpVd62AvF0fvmU4MBuUaRvZ
bOGO5KfzOJWdWLTr6NKQhKdFtMLDwssz20GKwwX0t88HIPRyeYOXdOkD17v6Nfkl
a96RvW9fEVo6/da1j3mrK+7BmcB9ACUWYRD60MUs8FuAfyxCke0UIKNCuXYKiIpA
OTctWfN8HIkW9amdxDwzqY642ui69PdLQK0NmpxG3q7OBhqm4lA2ddwNlzTJcyJa
aPJriGxBN+ugxhJSJYwu166g7fPPMLqvpjzo8hGO7xaQuQd9Wzjk+YDZoPO9N1vg
bn8Z/AXg+sDk08h7mv3qG95cCqIPKBKK/aEfZ4u5cHSqXpDe+2c=
=YYfk
-----END PGP SIGNATURE-----

--r7U+bLA8boMOj+mD--

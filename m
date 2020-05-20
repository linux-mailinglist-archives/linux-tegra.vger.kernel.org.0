Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE3A91DB562
	for <lists+linux-tegra@lfdr.de>; Wed, 20 May 2020 15:43:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726917AbgETNnk (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 20 May 2020 09:43:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726875AbgETNnj (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 20 May 2020 09:43:39 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C385C061A0E
        for <linux-tegra@vger.kernel.org>; Wed, 20 May 2020 06:43:39 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id i16so3120831edv.1
        for <linux-tegra@vger.kernel.org>; Wed, 20 May 2020 06:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=h59qBA70ccgJYgPSbgtDIOfg5Wc3La436ik9+lkAxFw=;
        b=agrseHPYKmVDUxXLset3XicNJHpIkMFU5OHTpx1lED4Hf4QOMSMea3aSV82pbnvG7Q
         CqVhuRF6wLnSgrRzV5FOIT9Cs1IPxkW9SK4cY2GGO5X2kHbFUg3zcuxI6JQDo5yGEUvS
         D3GYa+YnrmFAVkP0MnnSbB+EETv8axSnqaxcpQaqVfkOQ5kXm4rOWnP/OP1k1Iyz7p9S
         g1dEpajED2IvCQbf2ag0Ar944ycE35c5MQ+c7EvP0He6bkqFPYPgUTsi6XpX+fujJpIr
         1odOyFpQARRnMOS3K6umhjlo2t3YijnUM+3NrFE1rJo+5IVsDERXQxl4c5Su+MYMMM6p
         Sx0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=h59qBA70ccgJYgPSbgtDIOfg5Wc3La436ik9+lkAxFw=;
        b=sGJ2QuyS1AY4N3gK+IXXKs6uZZsfrFksenLQycgkuNtSd+B0COjPjJNXk4OveWNMux
         lfvHsosH1SJjSkXYbwuFlJTiBCqigSOEaET+dRfn4UDueC8+be3V9Ak6BIRjOgzaOeob
         6VkKAEj4nMnmLieAV2seuvr53oQ8bCssFA+Ts2KTzEpeZUiHNgIK453dD9K3B6w02x5q
         MgdPz/pGEZvHGna5UCgluHtWnXS9h+M87gWJVF0qepbIXL2Ya8Dp46W6PlQwSpA8Fg/H
         8cfSTi5n5+H+bYT8jTM58HzSP2b6fR11xR6nndE6ZxxzqafXAxjIi0JsAmN2L/gEKsjw
         UXEA==
X-Gm-Message-State: AOAM530OxzUfB1G3NyK9Ipx3k5VdAk9ne9XWnpDbT/t0HdaY5kTe2Gz6
        78wLIvU3nKCYIlypnMlaDY1E9AO0
X-Google-Smtp-Source: ABdhPJwSlZJ1cQRFJMbMaVagTuIpwp5Vu7wc2K8JIQda40UPgtYN7OkqLV2TEoE5kMSsB+srCeYTZQ==
X-Received: by 2002:aa7:c3cb:: with SMTP id l11mr3279208edr.364.1589982217868;
        Wed, 20 May 2020 06:43:37 -0700 (PDT)
Received: from localhost (pd9e51079.dip0.t-ipconnect.de. [217.229.16.121])
        by smtp.gmail.com with ESMTPSA id y18sm1910144ejb.87.2020.05.20.06.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2020 06:43:36 -0700 (PDT)
Date:   Wed, 20 May 2020 15:43:35 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 11/11] arm64: tegra: Device tree changes for v5.8-rc1
Message-ID: <20200520134335.GA2147362@ulmo>
References: <20200515145311.1580134-1-thierry.reding@gmail.com>
 <20200515145311.1580134-12-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="45Z9DzgjV8m4Oswq"
Content-Disposition: inline
In-Reply-To: <20200515145311.1580134-12-thierry.reding@gmail.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--45Z9DzgjV8m4Oswq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2020 at 04:53:11PM +0200, Thierry Reding wrote:
> Hi ARM SoC maintainers,
>=20
> The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f31=
36:
>=20
>   Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegr=
a-for-5.8-arm64-dt
>=20
> for you to fetch changes up to 74265112c60be0209817c682ba68661c05da1d38:
>=20
>   arm64: tegra: Enable VI I2C on Jetson Nano (2020-05-15 16:28:58 +0200)

Hi Arnd, Olof,

Actually, can you hold off on merging this for a little bit? I'd like to
send out a v2 of this because I noticed that...

> Thanks,
> Thierry
>=20
> ----------------------------------------------------------------
> arm64: tegra: Device tree changes for v5.8-rc1
>=20
> This contains a couple of fixes for minor issues, enables XUDC support
> on Tegra194, and enables EMC frequency scaling and video capture on
> Tegra210.
>=20
> ----------------------------------------------------------------
> Jon Hunter (2):
>       arm64: tegra: Fix ethernet phy-mode for Jetson Xavier
>       arm64: tegra: Allow the PMIC RTC to wakeup Jetson Xavier
>=20
> Joseph Lo (1):
>       arm64: tegra: Add external memory controller node for Tegra210

=2E.. this patch contains some leftover changelog notes that I forgot to
remove.

There's also one fix missing from this that I was meaning to apply for
v5.8 which will enable suspend/resume on Tegra186.

Thanks,
Thierry

--45Z9DzgjV8m4Oswq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7FNAMACgkQ3SOs138+
s6HMZA/+MDhiKjzKLTBXaFCViGhljWnkYbbcdtQ9879RRMEWQr2nvsaDt0gA5cgK
iPfID6QX2ozJdm3frwXd+fetK9Q7bre/WBR6/mc8YvZ5wywG/AFGbp9u0Wfy5+KG
6yLJHH56oyxZfl+eiKOkjo95ighOEpN5F2u5UCwDJDxMRSnzk5XjVRIJ+rzQUpMh
Og5v7iW8HkIf+QGXOFKfj2gXOA4WQODFj+HEQ0NU84vQ0DQMEtcfuR+/zcd0NN17
qSGwwXqSpOxEcrxo6xL3qmAZR8AQCW/ol1X3tSsFhIkIo/8HMiBcs6Ye+bLdjj6i
G+HBcW8cOPYep8tpWDZEcYYQot1i9GQ+MSu5Bcf/2Lp3YIXlvUEUG/IGUpnrcUr+
LDN9bPl2QbUCcBOomlH+JbwoFWzHbqY3vmn0SxokzSiOISzcEPAA1w3BdrNo/9Q8
p/oPMb5sp/8WaS8VKOrDOSjFAOhT7GIee22DavViP5rOz51GhLdU+QR8JREkYEbU
AJvNeTtq7bHxp1N4np6T19ecteoYi7GQd0PEp8r/v3lq5IifAV78aqrTN5zVSyfM
J01Fbe9QylyVAltrfcjG4inIJKMaI6SvVObP9k98oeAG0/eR47yP1ClkA2tCgzBG
pia81SqLe8vTmEqVjyH042JwIYjZSSpWFO1eWYtH7PaODZnCD1A=
=AGae
-----END PGP SIGNATURE-----

--45Z9DzgjV8m4Oswq--

Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19C65137AD2
	for <lists+linux-tegra@lfdr.de>; Sat, 11 Jan 2020 01:57:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727796AbgAKA53 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 10 Jan 2020 19:57:29 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:36562 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727789AbgAKA53 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 10 Jan 2020 19:57:29 -0500
Received: by mail-wm1-f67.google.com with SMTP id p17so3842064wma.1
        for <linux-tegra@vger.kernel.org>; Fri, 10 Jan 2020 16:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=46ibCrb21ZuBeioA2f4GKI33QnIcmomDF/lpRa1Rv4E=;
        b=olC/Kmu/IkrdUqkKB2OqZW1A3kPzoRDxkHQ85EQExY2cJ/gMsBgF5CxHbz8AR4IOf+
         FcgRQhMqhIokOrXx9hdOgwC9m2IQPWR/4cLuKtYqEmU/Uxm7RBr4oloxmjBSn6E34w2E
         iH8SFwHmIjZwK9M+FRoQpdq44xu5suMDkUqMSvRZVjD7YF8JDhJX79QKO97ay+YWBocZ
         33nywS9hYBsOQeSTE3R0iMEq5GFwl35k3+2TkY0EXj2lovL9u35buIVFcnZJUkcyhA46
         7hqfCefAhDgp0z1JXDBfSI03kFp+NvS/Yw5wcmBIaS3+pSrHuMHmSwrl3w0fchZHoMYa
         jQ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=46ibCrb21ZuBeioA2f4GKI33QnIcmomDF/lpRa1Rv4E=;
        b=fbiqmXWcSuBeUeAmT776sgNup6Y4vuEgRtMJ/FFlZHTN9R8vM1L/274e8Oww6zuV6/
         q7G0kkFmG/9At9JbimutApJan/N5BruhkUewNKgeSMekKm9X6C/Iq85tLbiAwjbNb/Jc
         VX7+By16bpa2ryIA8jpSype69ukMQGo/nY1WDXc78/7NnWrSL+14L88yuI/tGd+xuyTj
         nBwI+2NbQOy5H7/qcNWDzvknq7YM6JHisHlel5Ftj1hngMq7ZoKNLRMrBVAgtVBoSMos
         SQFcI4hxS/4RkDENKCBUtw+hfJF8O4LnW1gcvG+VPapyCrFBAiom08yCBSqjH7GzFzmg
         SCOw==
X-Gm-Message-State: APjAAAWLoUwiQbqP1b8Jf2Gj8jOftlFasgchtpQYDGz2qn08evILr0g8
        osRkEKa4XkWLkHlR4mbBdiQ=
X-Google-Smtp-Source: APXvYqzILsJ2W1LWqm1d5va62ZcsWOKo5aAPbpuVEnXyEsapjX70PwXEZ9wnpjyyIWz4TO9MaNLEEQ==
X-Received: by 2002:a1c:49c2:: with SMTP id w185mr6788028wma.138.1578704247929;
        Fri, 10 Jan 2020 16:57:27 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
        by smtp.gmail.com with ESMTPSA id t25sm4274672wmj.19.2020.01.10.16.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2020 16:57:26 -0800 (PST)
Date:   Sat, 11 Jan 2020 01:57:25 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 8/8] dt-bindings: Changes for v5.6-rc1
Message-ID: <20200111005725.GA2414054@ulmo>
References: <20200111003553.2411874-1-thierry.reding@gmail.com>
 <20200111003553.2411874-8-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="+HP7ph2BbKc20aGI"
Content-Disposition: inline
In-Reply-To: <20200111003553.2411874-8-thierry.reding@gmail.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--+HP7ph2BbKc20aGI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 11, 2020 at 01:35:53AM +0100, Thierry Reding wrote:
> Hi ARM SoC maintainers,
>=20
> The following changes since commit e42617b825f8073569da76dc4510bfa019b1c3=
5a:
>=20
>   Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegr=
a-for-5.6-arm64-defconfig
>=20
> for you to fetch changes up to ddb8840d2777bfca7c9ebc8c24ea20f9a37145ba:
>=20
>   arm64: defconfig: Enable tegra XUDC support (2020-01-10 18:34:14 +0100)
>=20
> Thanks,
> Thierry
>=20
> ----------------------------------------------------------------
> dt-bindings: Changes for v5.6-rc1
>=20
> This contains a conversion of the Tegra124 EMC bindings to json-schema
> as well as the addition of the bindings for the memory subsystem found
> on Tegra186 and Tegra194.
>=20
> ----------------------------------------------------------------

Looks like I messed up the tag description for this one. Please ignore
this, I've sent a corrected version of pull 8/8 now.

Thierry

--+HP7ph2BbKc20aGI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl4ZHXUACgkQ3SOs138+
s6H0nhAAkL8m7+IYeOhWSL5T3B60NqF7jmJfsXikf5q09AZgWwoKvPyudv3/EBll
Hwkp4NxZKD3J9ExgJhKmX0/1Pl5nzZFUtTz5sgMBpmEGHNHDqDnAIHn0Oqi3ew9H
J9sXNB4cMRFfMPaZth8e62AaWgnqHBLygefOf8MnbqS11smugiQRd1/eAKpaUY1w
MZUEEcTIFETxmIdBWbs/GXZGgLq9FfmH6LDVPj1cvKHA/tWXhgoyeknmiOTjI28c
xsk/BFA1LLD4ZrLV+6dtuN28nwjR+NipjdJ0t17r1J63KvNgkUgvHe04+Lk9x+AF
J44yYfpnRXOfpC+Z20BBkAsmckK14/TDWt6KiW5aI120HdXffRxca7cYjCUYfl54
DutIdwRznp9pOd/taqsQ7BYZdMTyegvPqn3vbuccdhREjAPHiazFDkE68I/qyFAD
OAl3nFtqkwZCslmiLYp0CAOgkHxsqLvTdfMnHpE2QAjZu6LoVmpPmwH4tEwkch/M
l7EGOe2N5GPnVkuoZn0f0iciJhv+TNQJ1ze+sn8lMGjBCqn+DIWY0KP1gldR70QI
M6CB8O8xLAKsP1taImTLVfW0OEX8c9x3xzcKkfKvl/PoiL8CmlvT/m3B2LfvVk5y
g8zHL6yBJHu2LHs3eKng+Wu2Y59zPXfVuwrMggoR8FbbM2E0dFI=
=AApv
-----END PGP SIGNATURE-----

--+HP7ph2BbKc20aGI--

Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A9A28B41B
	for <lists+linux-tegra@lfdr.de>; Tue, 13 Aug 2019 11:30:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726811AbfHMJai (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 13 Aug 2019 05:30:38 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:39828 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727107AbfHMJai (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 13 Aug 2019 05:30:38 -0400
Received: by mail-wm1-f68.google.com with SMTP id i63so835939wmg.4
        for <linux-tegra@vger.kernel.org>; Tue, 13 Aug 2019 02:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5Y25q7PgM9CKHuEAFVYY56MJI3Hns4muOB+FOFTdHU4=;
        b=j+DhxxJkGhg3Pw4t1w+WqyXf6OfzKwYODMJ0FG2UL4qRZY6Y99tSpdML3EqfQWLvWS
         ulFXigfevSnc5Bsn4SNyY/wbq5XTqyWful+axjUzqG0VAXqTFMwSneqMpiW1vz/YePfa
         70PQDks7Y/Fgeyl1ey6rhDx70nUY6yVohvLToq8pBmrsIGcKAdMMkaMktOR1ilcVkt7v
         n1RjQgyW647bBcroLLFiscJf1Euv1I8PnLQcVNpEkQ1KcEBk/FOJuEajuvKJKxdyNvgE
         Q1VSp7QA1YC+Bng7DCIU+t9yUaSq0BWEMq8cIcZZUnAsVGa5Nil225ZyFhsN2IO+CvD/
         esTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5Y25q7PgM9CKHuEAFVYY56MJI3Hns4muOB+FOFTdHU4=;
        b=Cz+4FbpC2hDxYmJFNrE+UffODTtAxfaekfERrBYoalpclr+siA9HRCIfp12MuAXlaX
         +Ayqym060OkNrkXT5aEwmst2w+7M/rzzY5fL0ieF+nbUbGo4dceOmvyynQ5iKBYgwuia
         kLRvh7ccFWhtpZ9QeUB1XE8/bRk2mxvAM0etzI83cO+wPhKxDx2wKO8LTgsJfq9zA0sl
         dBFY5Jvq+jwmfhTOyxBHNjedZQU/1Xlk41hfhzmRLX4SWBYP6HmBG5jR5JVM3ZgvhwY7
         VGRvHKZ4OfZSlquHMRy2pxIfvfUs01ibJOH8NZHgEmA+JPzqO3DbqoxlmG5v9BYZKcmT
         B2fQ==
X-Gm-Message-State: APjAAAWefEPG8grIVIrNWPYl7ATos+3vxj0qTO7JHASRldaHrKgc3cFN
        54An6dJiJXdhAPTB1vu0yIw=
X-Google-Smtp-Source: APXvYqy6Ja1w8IB3tE9s0COb5ILfn+T79wR6juP5bNnd58pt76m8nV4dOze2X1+s2betghj3DPz42Q==
X-Received: by 2002:a1c:7f93:: with SMTP id a141mr2035911wmd.131.1565688636431;
        Tue, 13 Aug 2019 02:30:36 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
        by smtp.gmail.com with ESMTPSA id f12sm122444143wrg.5.2019.08.13.02.30.35
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 13 Aug 2019 02:30:35 -0700 (PDT)
Date:   Tue, 13 Aug 2019 11:30:34 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel@lists.freedesktop.org,
        Brian Starkey <brian.starkey@arm.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, Liviu Dudau <liviu.dudau@arm.com>,
        malidp@foss.arm.com, Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH v2 1/4] drm/i2c/tda998x: drop use of drmP.h
Message-ID: <20190813093034.GB1137@ulmo>
References: <20190804094132.29463-1-sam@ravnborg.org>
 <20190804094132.29463-2-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="GRPZ8SYKNexpdSJ7"
Content-Disposition: inline
In-Reply-To: <20190804094132.29463-2-sam@ravnborg.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--GRPZ8SYKNexpdSJ7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 04, 2019 at 11:41:29AM +0200, Sam Ravnborg wrote:
> Drop use of the deprecated drmP.h header file.
> Fix fallout.
>=20
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  drivers/gpu/drm/i2c/tda998x_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Thierry Reding <treding@nvidia.com>

--GRPZ8SYKNexpdSJ7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1SgzoACgkQ3SOs138+
s6Ednw/9EQDt0WWcZ4KD4LRH6jtkdKpX+5+8t1NaUnVHmwYUF4zhN+n9xLFaQhZ8
GnAlYAkIrouWJONNOpH3NjK388eOLn1udMs5sOZ3QkYz0IKZdg3xsUBlUXyMfNl5
9K37zwG+Jpg1eoMQIMxHImLp7tTTM2YSXFMVAVR0LOfeq44mLVVAq4yhRngLtA2c
gHTgLpHT6XXl4j2eEbTp1bwQ6mgG85j7P/avdR/sU7CYQf8QCOE3uT2NuItUcFGd
r9RDoAVLy9uP3uBzppkcYH80xHuplge6fMzB4RLCCwHwEcUYaoVoT+goxLH5xxXE
HFCv0BcSO1nPUDdXXXu4ldjdVgxmX+HnOKhdVX3EwJ3IGdyCHq1K3ArKFupUXDdW
vBWecZnlgg5DooLEOQMkydvodQrr0r++UQEGUYiAnd1O9o7QWFU7E5Yaa3hrRtAu
vGQSmjuNNRTDwd8nFI3DpAwTT70oROFN3QFOiV8xwGA0kQi5K8ySCwwnage7kF3c
qtbUMZwnwuVW93oND63nTOGdPm9OImqWVz5aoa+AsfBzDnHt4E1idZOynC6+MS/u
gFgZ99c6+qKHmOqfwqC0aYDHw2XyNiFumX70sHCxGBhdR5659TmxReChjRTGFG6X
6fK3vkbAAaSf+GKseEqYXi+j4o6e1MOs1g0y/OhcqQvd2s9v4+M=
=dhsw
-----END PGP SIGNATURE-----

--GRPZ8SYKNexpdSJ7--

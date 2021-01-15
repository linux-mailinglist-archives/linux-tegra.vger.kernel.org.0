Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20A0F2F80A2
	for <lists+linux-tegra@lfdr.de>; Fri, 15 Jan 2021 17:24:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726402AbhAOQXu (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 15 Jan 2021 11:23:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725923AbhAOQXu (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 15 Jan 2021 11:23:50 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED9EAC061757
        for <linux-tegra@vger.kernel.org>; Fri, 15 Jan 2021 08:23:09 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id g10so8093059wmh.2
        for <linux-tegra@vger.kernel.org>; Fri, 15 Jan 2021 08:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=b1o12dNG44Js/P1pUm9lZNb9c/tZm0IvKlzwFKSJOe4=;
        b=u6Rz3/y6TejtY7ekD7TKOvD32frkhlVQ3X+PCLdMmVT6F9BRLCVc+bA+Vk1Vh3zgLP
         xkvPFk+w60b+dFoGP+B4I/bU0xq4ZYtP2Ply4FsO4k29OD5JyQlXSF2YMrfnjwE2WZ1b
         3THTd2EiQU4B3Rb2IQV7glQMGZOIXVDbGwY9bPF2TxBqm917Q+EnmqNP+V0MrVsFcGpZ
         gu9e96TKFx0rMXez9ReUmI08ABBoXJiaymFC1fg8PmwV3kKhbzdCm/ibolcurWQTJd/V
         1nrH0u70hiyqHnxINP+duj8ThcabSh3drJrIA0VaifNftd3ZwUI1nxD2OpqOc9+B3xaV
         gUgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=b1o12dNG44Js/P1pUm9lZNb9c/tZm0IvKlzwFKSJOe4=;
        b=M29i+4cmIYFwfCwS/y4n77ld+ebRtFR5qt72MF05a5vYbcWkMzZ7oEAwHZUKT4GodY
         +crJBh5fnSiejRgOzU9FAkaK3ZyjuJR8+6EDKph2sl0kXjI/gSir7df+Nig1CeLLIc6c
         D/6S4KLxclkfWJwjObfraZ7z4od83S5nPzb405O1PYIryS4KAzduteavV0pS1t8Si2SQ
         YfX6mIrhAYBLaZ/6f1SCD2GuD9BzVOMqU6kWmN37o0Z+dMab/1QH5M3Rnwb8CNXBAFTL
         UZ4UIrHa7iye2favfTifowrFtAnFBnLFBXQQjWVVzrgyS8joyagh04LLPNkURuDNyiTM
         z1bQ==
X-Gm-Message-State: AOAM531zWmNUhCqMauE6jifuNGukAw800H2BcDQ7DIQPKMrSkCtYmRl5
        M5IAowC2ICMLxjDJfzXwYyM=
X-Google-Smtp-Source: ABdhPJzuFsNid31NEDYUxiNY45bsQsrtZWzgTx7aYMNWv8incgqJqU9ca7xAWrPlDAPAJ5n8tyfiOg==
X-Received: by 2002:a05:600c:4e87:: with SMTP id f7mr9459591wmq.163.1610727788758;
        Fri, 15 Jan 2021 08:23:08 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id u13sm15516794wrw.11.2021.01.15.08.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 08:23:07 -0800 (PST)
Date:   Fri, 15 Jan 2021 17:23:06 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Tian Tao <tiantao6@hisilicon.com>
Cc:     airlied@linux.ie, daniel@ffwll.ch, jonathanh@nvidia.com,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] drm/tegra: Use PTR_ERR_OR_ZERO() to simplify code
Message-ID: <YAHBatsdlhhqir67@ulmo>
References: <1608015653-37527-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="YaX/wmy9Np5Jy0xx"
Content-Disposition: inline
In-Reply-To: <1608015653-37527-1-git-send-email-tiantao6@hisilicon.com>
User-Agent: Mutt/2.0.4 (26f41dd1) (2020-12-30)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--YaX/wmy9Np5Jy0xx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 15, 2020 at 03:00:53PM +0800, Tian Tao wrote:
> Fixes coccicheck warning:
> drivers/gpu/drm/tegra/drm.c:350:1-3: WARNING: PTR_ERR_OR_ZERO can be used
>=20
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> ---
>  drivers/gpu/drm/tegra/drm.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)

This coccinelle patch was recently removed, so I won't pick this up.

Thierry

--YaX/wmy9Np5Jy0xx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmABwWoACgkQ3SOs138+
s6Hb2RAAh8kG7ZuKmcYpO1qU01x7b/rh7eLpfTuzlcGyjC69Ixt+mBl20L1bahkH
bdywhLzSmyfGS8dFuvaLJotWjMsjbK7G6Va6lIq6g3cvcyqS390Sh6KFoxFQb46w
rcySTs50KCLtF+8769UwnShMRweM9De6NA7oGJGUwJMROZLM0duECrQlVReNutI1
FtPsi4MuI5gCG8ERyuSwTSeVheDTRhmsBjWXRG0TKDv2RBwLYg77x/+G6yL0imVm
Nkaojq0bJ+D6ozeLCyN9G7GqYt+3USx/73wh0/1h4XRuNQjXR2AcIvDVLT0QtWwP
83zMY7Ge7HakgKr3U3bnReoexzg+DFk73C8BD0aCTPA6bWWcZJW8f/p0Cl1oBwBq
2J2CtItExkB7973OP+qdIiNRPV3V3XhVifFpBOWyeAdroQuutnfUstwlljmLJ9xy
xcW9GfKc0IoJdmFIXN+xRO3MYizi8yKu1+eLQ0Jsz5UERHO74grLmPwUCQG6wMjN
Dd+vpvbH9fRTZjBxeZnd/pLoMZ8Eqelil7i70Bqcy2KwCfe/jtRqUHWudadVfN5V
pC74zcf6p8onyzXS84Fd6lZ2A5t5gteEpkfERTqSDPgEfuEgFh0RrAXptnNuer/5
ExdIWhBeQy3nbdBwrXP0nGskdBz6UKYaRpVrErRP2Ow6cnXk0Jg=
=EKtM
-----END PGP SIGNATURE-----

--YaX/wmy9Np5Jy0xx--

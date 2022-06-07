Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2593353A624
	for <lists+linux-tegra@lfdr.de>; Wed,  1 Jun 2022 15:49:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353299AbiFANtu (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 1 Jun 2022 09:49:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244725AbiFANtu (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 1 Jun 2022 09:49:50 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 014C26EC5C
        for <linux-tegra@vger.kernel.org>; Wed,  1 Jun 2022 06:49:48 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id f21so3869862ejh.11
        for <linux-tegra@vger.kernel.org>; Wed, 01 Jun 2022 06:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=QvjPKiOfGImvDjhqugo/v+WDsPZmegSZEn/73m+BNHo=;
        b=VsofI4krUYAalrek0vVuj2G9lgL2zB+ayRPc7dvQb0yrZjALbFncxV8nYffevYTxWD
         TsA2xUICUHHYTmxZvIY1ybVpQt7DbsU4O3CQmn8je1Mviid+N9Zp1KoxurVwFck1eQ8Z
         WRgkPY2drl74uhFbroh2Cm8DTaBqnvOyXudavdV/npNJtq+ramamNFRkcZASucsm9Yt/
         m4OB3EzPDMyYS0jLKXHekVkK0NW6aSUyVh47+3Mxk46w858Dv1QSKPrSPdUeqwnJNYIP
         qW9vpc7tVgEw+XLtUalL7v/Ezb1f0svDUE8KsqS4TcbP124qgGlqjyskpKP/2+JrPZu/
         jSew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QvjPKiOfGImvDjhqugo/v+WDsPZmegSZEn/73m+BNHo=;
        b=5bfos5HH+XpwT+LTuWL4YUIhf0Fj81hx9J/wYC6+0cS+5u1xpdh9loM/Deq4JkGUaU
         suFTc1EZ+jD8qV/X9Owz+c2INW/je+uqp+x9HBEmkSnm7CdSmUEKlwGKLua/zUByLQY8
         5jOM50S8TELFpMaVc6eo1uFTGOas6CQUpJA37LITZi4ndw5SjMbYpxLOU31yYNp/CZNK
         FrH9jukGA6j3GYfAit4LctzVnFGszIuZoX0Yww6y0pIHlE2K1NXov9aJBxNwW4C2cc/n
         RQCdrxGAF6Bmqms+/h4KQ/X68WmUcHb9zfs3JubX/zAf8Y6c/X9D3tKpDsefnaJwVyyk
         MAaQ==
X-Gm-Message-State: AOAM53110V0V3YwgVkeM9UbjSiieqK4gWce0MDlNLA0J5zg1qgwTpcCy
        nSkpbnP4Auf0Ttgp873SIgoNdiNdnLw=
X-Google-Smtp-Source: ABdhPJz72ws/249EpRhr/3T5VKr7XNwzK/fi5VqwXYdvozLbMKmkovHMYPXoxGWRi3rpw5aHQ1Zg3A==
X-Received: by 2002:a17:907:97c7:b0:6fe:f7eb:be67 with SMTP id js7-20020a17090797c700b006fef7ebbe67mr41353162ejc.559.1654091387355;
        Wed, 01 Jun 2022 06:49:47 -0700 (PDT)
Received: from orome ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id fi26-20020a170906da1a00b00707d11fd421sm579899ejb.107.2022.06.01.06.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 06:49:46 -0700 (PDT)
Date:   Wed, 1 Jun 2022 15:49:44 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [GIT PULL] drm/tegra: Preparatory work for v5.19
Message-ID: <YpdueBx4Dd5jRqxU@orome>
References: <20220601100335.3841301-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="FgGGDq7yl7JL732T"
Content-Disposition: inline
In-Reply-To: <20220601100335.3841301-1-thierry.reding@gmail.com>
User-Agent: Mutt/2.2.4 (c3baa83e) (2022-04-30)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--FgGGDq7yl7JL732T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 01, 2022 at 12:03:35PM +0200, Thierry Reding wrote:
> Hi Dave, Daniel,
>=20
> The following changes since commit cb7e1abc2c73633e1eefa168ab2dad6e838899=
c9:
>=20
>   drm/tegra: gem: Do not try to dereference ERR_PTR() (2022-05-06 15:52:4=
9 +0200)
>=20
> are available in the Git repository at:
>=20
>   https://gitlab.freedesktop.org/drm/tegra.git tags/drm/tegra/for-5.19-pr=
ep-work
>=20
> for you to fetch changes up to 597b89d30b42dcc8e6b262e6876b42dde66f97f0:
>=20
>   gpu: host1x: Add context bus (2022-06-01 11:50:42 +0200)
>=20
> I realize that this is quite late, but as mentioned in the tag
> description, this doesn't actually add anything new and is only
> to simplify dependency handling for a new feature that we have
> planned for v5.20, so it'd be great if we can still get this
> in.

I meant to send along this link for reference:

	https://patchwork.ozlabs.org/project/linux-tegra/patch/20220516085258.1227=
691-6-cyndis@kapsi.fi/

Thierry

--FgGGDq7yl7JL732T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmKXbnUACgkQ3SOs138+
s6FVQQ//VSSv2vgMgEmNhaI1F+gkKSB9H6aXVDbdWOR0wXU88y8uuc2LyzOGjyb1
rQoc/aaVqDOxFPx7inPKIPleITI/0ubeoaMqkBuNoC/rumE4BN2hmyk1J6lj79ZL
pUA+YAByEBlcH0axu7lmVtkl2HCpJGkzJIgyr0Lt207TA13uPe6SXsrkzeSE2M0p
k2lbSUu7dHKN8cTO+1cHQaR9KE2PceDLfsv95P/iNNvDFjfZyuXtfCj1O3mQS9RT
oQUh4uUwmFBe30hnJzxCCL2t+GDiNztZn5LQzk7nvt+iWn1xAyWNRtr85SUxLCqp
9TQMSgxWxXawoOrbJg2ODaxc6ZKJHPfBws6joPb4Q+SuxLGq4r7FkiFx1YZB5osn
uqCl+env+w8B+JFbQkSrufMHfQT4IpkZOEYgPUFkAFsUglpPYmmzCdnM6AD+wsqE
KMx8dBCmnwPg0VZehY+yQ60FHxFrLtTeqlVn7cS+JMLThGczT6mCGk6cLAb57Vp2
PGC0aDWA6OhfLofojM2vE0b74BjrGKzApHzSFSWJbmND4cf/3OQnPwcCj9vI5hOU
V19W1XCk4TLpYmhX7jEyHFXiaqnYo0ufnIPRhpgwZ4EOBUFs47xD1rNR66Vk+7nj
3t+pvMtUHLvaWpqUzX4CBfHCHnsSRAGbcMq+6k6SOTk+bpTH5ls=
=xNsD
-----END PGP SIGNATURE-----

--FgGGDq7yl7JL732T--

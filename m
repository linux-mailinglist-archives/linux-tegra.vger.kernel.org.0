Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A964FA5029
	for <lists+linux-tegra@lfdr.de>; Mon,  2 Sep 2019 09:47:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729854AbfIBHrW (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 2 Sep 2019 03:47:22 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:45757 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726540AbfIBHrV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 2 Sep 2019 03:47:21 -0400
Received: by mail-ed1-f68.google.com with SMTP id f19so791690eds.12
        for <linux-tegra@vger.kernel.org>; Mon, 02 Sep 2019 00:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=bZjamSLMOaqXH1lglB6TrYnf/YNtUPwTjcrKc2ibBuQ=;
        b=tNIqunB6xii0WU2sMDlz/aqIOjbrq/TTR0no1rv0KtteMGh/nzb3PI6H8gbTDnRuqO
         nqZwAUHCzj2rxFWPiL8b0Y+zzL7vMQNOo15171ADGMqasfRSIunoDyxBKp42e5oP+oZh
         /f/nkaBGkOT2jEjIZKmdZBEzSkQ6BlH/FM2wYj+dB7y9ogLoreYYL/pojvO1k/LVB2CK
         sHx6FCQqVQ8waRRfG4jzQiYyONyiAveV1OusGNoCJ6cQPKGeq0jG7ROfca5A7CFbSo46
         AQ/iIr2E1wDBgD/Ra1Wxw8DfdZXq6KSFbeVyHlekxX8HuO7uMHNrPUC4RGgN28QXWKSz
         l24Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bZjamSLMOaqXH1lglB6TrYnf/YNtUPwTjcrKc2ibBuQ=;
        b=sRKXyqo1TMawHF5gQXvzn1plTx+/6kFFytViYSmx9uwAC1xMGLtPAonMZlZRwJG7Sb
         sAc3gZEIc/XDeQyLzHHnOsOOKbGndLWrDBkrtR0P+b7ZM0srPGSTu9BNVhi6mbB67dvO
         DnrTbfDcZZm83SDVn8g+LUIrynV8aDS2+LR0GWlB24TwRgQNx/KbsCFl3VEE4ksdxJFt
         Q8XENzmIoLlKHj/jdSzODDuvXJWHR0qojQMBLDo4Rn434UJosd+wWCo/RI/wuk+W63rv
         sjgmutdrWSxuNtvCuOIJ43DVA1js33iihcwyhSt6UY/V372LzRQEtc81P/mZ1rtUHcZ7
         9v/A==
X-Gm-Message-State: APjAAAUM8KIrs1t3F7Wb3K61aq5/yJgShmyU9OR/pwKNbcebDwxihoBa
        xH9if47lhMjT33ZMBW/K36M=
X-Google-Smtp-Source: APXvYqy7XZE5FDuVyflO+x+FGMpib8uDi07yGcgUsNMx1Zxi737iP6umxUdzuVYS2X1QT7zD96BVWg==
X-Received: by 2002:aa7:d397:: with SMTP id x23mr28471128edq.11.1567410440115;
        Mon, 02 Sep 2019 00:47:20 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
        by smtp.gmail.com with ESMTPSA id i5sm2756235edf.32.2019.09.02.00.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2019 00:47:19 -0700 (PDT)
Date:   Mon, 2 Sep 2019 09:47:18 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Takashi Iwai <tiwai@suse.de>
Cc:     linux-firmware@kernel.org, Mikko Perttunen <mperttunen@nvidia.com>,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH] Add symlinks for Tegra VIC firmware binaries
Message-ID: <20190902074718.GB930@ulmo>
References: <20190830103350.8273-1-thierry.reding@gmail.com>
 <s5h1rx2270k.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="MfFXiAuoTsnnDAfZ"
Content-Disposition: inline
In-Reply-To: <s5h1rx2270k.wl-tiwai@suse.de>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--MfFXiAuoTsnnDAfZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 30, 2019 at 02:05:15PM +0200, Takashi Iwai wrote:
> On Fri, 30 Aug 2019 12:33:50 +0200,
> Thierry Reding wrote:
> >=20
> > I've noticed that the current Link: mechanism completely ignores the
> > target part of the link. Was this intended to allow creating symlinks
> > dynamically when copying the firmware, rather than just copying any
> > existing symlinks themselves?
>=20
> That's a kind of intentional; the script doesn't validate by itself
> but just installs to the target directory.  And the cp -d option
> preserves the symlink as-is, so it should work as long as the original
> symlink is correctly set up.

Perhaps some code could be added to create the symlinks if the "-> foo"
part was specified and no symlink exists.

Not a big deal, I just think it's a bit redundant to basically have all
the symlink information in the WHENCE file and in the filesystem. That's
especially annoying if both get out of sync.

I'll volunteer to write that patch if you think it'd be a worthwhile
addition.

Thierry

--MfFXiAuoTsnnDAfZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1syQUACgkQ3SOs138+
s6E6wg/8CAZLuAu130oO6MYPbXtfCqWRnJwJogdZ4d2HbRtHVgpOxxs8Aq/cmGy5
AouALrtDRwdw8paws1RG1olxZ9IOy6QIiI+ynBFy6o8xk8xhQx62nCdKLOPt0oTi
oZ6j4BdYpdyKsEAl+tevTG+ecW0aY2JqCudOF3SyrfNvP5ayWtZQSNcdx3cbS8L+
IZLAprvKf/oFIDUIFMvtUtShjpXXiNLYPC9ejdOs6bQH6eiqsglR1uRPmPRlAH/+
yRZdGn93yD+Ta4dNNQ11j4wQd2l/k8sp9dpo79VKWxrQpagzOkLRIXeUKjjRjpDH
BYyq430Dg8CYS1BD4D+6dv9plstJPtMuKEGR8CL/p4Q6v9zFtcX9sjhoSyD1N7SY
+f0vEy/wWiTe7rq4AoOLF94na842WQpOfxkYK0UkTzukXJBGhzrZV1KgcxhmoXIZ
Y8fhBpUgIIJlrw+Oqfrgva+FZaLu5CBRka4t0RFzzAiV5Td3oe4PDgc6rF+RNIsZ
s2OdRaoBLMXKYh5fTB+yNcMMWGsntZgJfSCbdEtx65j9xPhySu2JN7s47awVifpD
r7kjAncq/eJmRSRWhHu6qZ1AGdI84s5Jfwyqksq8W181s+HY7eTHytGxgd6HHQfA
j8krPhCFjxE77s0o3wS1hnY8rv9I2EOsDmwt0uJEVY4wKJezLss=
=fMsB
-----END PGP SIGNATURE-----

--MfFXiAuoTsnnDAfZ--

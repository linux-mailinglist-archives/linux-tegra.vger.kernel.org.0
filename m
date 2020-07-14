Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BA5E21F688
	for <lists+linux-tegra@lfdr.de>; Tue, 14 Jul 2020 17:55:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726364AbgGNPzI (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 14 Jul 2020 11:55:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725890AbgGNPzI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 14 Jul 2020 11:55:08 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BBA1C061755
        for <linux-tegra@vger.kernel.org>; Tue, 14 Jul 2020 08:55:08 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id f12so22570548eja.9
        for <linux-tegra@vger.kernel.org>; Tue, 14 Jul 2020 08:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=bcK7qgciMoLyc7H+4yRLKWivz7qUSuQVb7ySQs0IPAg=;
        b=qEENbdMjCswC738Np3CNs2AddDBVIyqq0cZh0ehuNJLVeF65bdbUJL74sT5kEw6WqL
         ZA0As9nCK7hHBcMxBIHdNKIqYvvEETFQryqtwWFGGPYU4bD4OjlMsNkjgfCrlQgx5sqM
         r+cFkp33KXH8saeBqIQ6sCjHVsVE1duMcC5XZI1WABC9voUBtdWhVLvY0oUZDKrzs2pI
         NTWZaFyz0GXr9FsMpETA8a/rc7h5ZQ8WpRxOJcf90rnae1UZPojiMscP5FL1k9vYfttq
         VsCvrRu5cHMQ7l7cwoX2Bcw5O8xq8XGEMo+gwuuJg3UtMOG6vBvfCFYaVBpVl/Al9pVU
         X2DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bcK7qgciMoLyc7H+4yRLKWivz7qUSuQVb7ySQs0IPAg=;
        b=nkfZSRm7FVa4eOv0UBT6Q/8bA4uD74iOalwgT2sJPMAUuh6/PLnVQsJtGJsJEjj3T1
         LIUxwGSb0+HqEdnPVsN2RYnkiR1WymSX8aMtE/drzHhSlmCnZNgWxVOlXiBptjk+XbPG
         ILz9SiyQ6KGZOpc9a8OEzIoCmGjPhZjfSajNX3R6wkpB+cHLePw7vZuypHwG5k9pzNR/
         2XGh55+6iz1Q+NBjs8NY83ZkTq2qkwMSufi2pxTdm/bAX1vDFMbS/UVjyiRRiJA+TEni
         adjn1YTQ9+CH9+0t5hhcjkJbE22TrS1Fk1gdmOY77PE4dGEQpewq4Snw98W+42qxmXkO
         hpjA==
X-Gm-Message-State: AOAM533hqrqZ6ng54sm8rGkLEI8qZHCT6GggsbrlwY38MlSd35gwQJOY
        IyWGxx57U/RB8CfoPJD/kbs=
X-Google-Smtp-Source: ABdhPJz04jpwZHp12BBiaDpXng8slbp06Hy187g7BZ+Q/ne5ZtcaDXhl0DfW7LwgbjHjdvO6PPS0Iw==
X-Received: by 2002:a17:906:ca56:: with SMTP id jx22mr5030937ejb.494.1594742106883;
        Tue, 14 Jul 2020 08:55:06 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id c10sm15270665edt.22.2020.07.14.08.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2020 08:55:05 -0700 (PDT)
Date:   Tue, 14 Jul 2020 17:55:04 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     linux-tegra@vger.kernel.org
Subject: Re: [PATCH] memory: tegra: Fix KCONFIG variables for Tegra186 and
 Tegra194
Message-ID: <20200714155504.GD251696@ulmo>
References: <20200712103347.25070-1-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="UoPmpPX/dBe4BELn"
Content-Disposition: inline
In-Reply-To: <20200712103347.25070-1-jonathanh@nvidia.com>
User-Agent: Mutt/1.14.4 (2020-06-18)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--UoPmpPX/dBe4BELn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 12, 2020 at 11:33:47AM +0100, Jon Hunter wrote:
> Commit a127e690b051 ("memory: tegra: Add support for the Tegra194 memory
> controller") and commit 4e04b88633ae ("memory: tegra: Only include
> support for enabled SoCs") incorrectly added the KCONFIG variables
> CONFIG_ARCH_TEGRA186_SOC and CONFIG_ARCH_TEGRA194_SOC to the Tegra EMC
> driver. These KCONFIG variables do not exist and prevent the EMC driver
> from being probed on Tegra186 and Tegra194. These KCONFIG variable
> names are simply missing one underscore and so fix this by adding the
> necessary underscore to the variable names.
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  drivers/memory/tegra/tegra186-emc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

I wonder why we didn't catch that earlier. I assume the EMC frequency
scaling tests just don't run on these SoC generations with existing
kernels, then?

Oddly enough, I also vaguely recall testing EMC frequency scaling on
both SoC generations, so I wonder where things went wrong. Anyway, this
is obviously correct, so I've applied it.

Thanks,
Thierry

--UoPmpPX/dBe4BELn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl8N1VgACgkQ3SOs138+
s6GlNA//cJqrRg8Z7Nf0bX2HQ4lHFQVIg2gstpGGVwOX6SaCxKJEwhfYQdcVOwLf
hs1ivuVVebF8328vVisijcbVhIokpCQZMrk3EMO+fZ6k2RltAc5UbgcAid4lg5gR
D/YtTdSM0RPWAo7CCg3QlcGAsh3W3VfjD44e0N3TsFBk53rhdyxhIvw86ju7wJ//
+6YfWmwlrxj/03MwWGqnUvhDo3r2v4kn5VB/gosBKs0o22K/Tp121T27fsAq0vzu
b6a7sFppMStCMKgRwZM4sU00VMVW0Y4AI5+dXoTeDcYCCEHzG6n5Lq+/J3M7kR1u
I40Zd8KoNGGM4TsokS5dOX6zOmR1gDCc9FyJOf+18MmbAMks4MD/rF1sDxbi7oB0
8N0v3WuPJ2ZUqM3QCPW4cp/wnTZ88EIAaAXSPRhpaTB/sbbyBJlA1yKxbKa45NFb
ubRr4mEJiCi9acjeprk81Kvn8lg7xDsI30X9kOWzmRzpgLTzY4HGc2nDM2q5zUmZ
6SxNgWEeMuT7coJeTMwAa7Fm5MjVa84Gl7S3e+a5W3/kRfH2f8nO26UGo6SYOErx
9ZBtVmcz0WUds5kn7uFEBeFR3CKfE3Y7yTzjM2WHV6RBQNuB4GwqFnjzCDN5GFjH
FxWzdcusbdpNBSduost384bmk3i63Zcp/tcZRFgWcG4CCIUf110=
=HX7y
-----END PGP SIGNATURE-----

--UoPmpPX/dBe4BELn--

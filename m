Return-Path: <linux-tegra+bounces-2977-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C04992D21F
	for <lists+linux-tegra@lfdr.de>; Wed, 10 Jul 2024 15:00:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9EADE1C22B75
	for <lists+linux-tegra@lfdr.de>; Wed, 10 Jul 2024 13:00:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79C12192499;
	Wed, 10 Jul 2024 13:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="H/pXqN6N"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CA9192463
	for <linux-tegra@vger.kernel.org>; Wed, 10 Jul 2024 13:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720616402; cv=none; b=C5XkKcDXLjFfs9xaTTzdq7TZhAXMmVdmx93hUtFYDzHp3Iydqs6DqwWQ/fi3heN5TkD0dML0hdeFXwzk81t62j6mmYyZnKi6NkyoNbfYmP0tMv4MKy7pIfTnTsWGDQp65TVB3yri8oEem8YXAHb3GbcLqFiiHtvQQknDG4nVfnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720616402; c=relaxed/simple;
	bh=+q8K+JhEmrQnBJLkJsy7lFA+cisrhXhsBdLSScjyYmY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MjjPwgkWtx7qJix11JBlV4SqWwF30koZVl0bimoLrpcagHDN6Uj7cpHSImwPjCyfP9aDniPXrtk+ubacN2i1UESBs4kfhbRE8QC36d+v00wNHNhu6MR9yHND1v0BV6FenqmN7x7URTjGT+jLDVtp4c/WqSoJJHq2V428eY7k8Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=H/pXqN6N; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2eaafda3b5cso61556931fa.3
        for <linux-tegra@vger.kernel.org>; Wed, 10 Jul 2024 06:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1720616398; x=1721221198; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VGdJpvqIEQU8RX9NGwZGOHnsVHJRF022GnfIot2nots=;
        b=H/pXqN6Ni5GIa/0lwuWvURtitRPQTpC6tgkWVPIUVd7seDFf1KkPsy6AsiTKhrlffQ
         sqqne0JaKEDdQLicFH4fhbh5ZhQ54TzWG3xyIZ5oOc2SpTo5r582kO7aF8Ntq6VvHBsC
         WR5HY8SGW04btEjfM276HTqngrI3yWBkSBe8EHN8ccKUUfHp9q9wycHzfOrVS3Bq8h9e
         Hnk6jjtwnSDZt6xN7B3i4lkEz6b8/lRyKf83yRSSBW+xE6BQInJB+pTFgiZDlltFNJrR
         ltOO8+FvBSooMQNIQDnz81QRj9tkvmsWaiJccrnVmiF6eCo0/nhyiYFOGvoFbk7JTyzd
         zmwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720616398; x=1721221198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VGdJpvqIEQU8RX9NGwZGOHnsVHJRF022GnfIot2nots=;
        b=k8+k778jWRpjVTyvG4XiXwLXpEgbNKWTOCMVGDJB2K4jQS6YvzJpGx+YxWm2K72gcq
         0dyzarD4P0WaLUjj7KlRWY+wd/+Iz2ckAKKRi/xSCtnfOK6QwEUleN6BxLKYASIZILuJ
         7cDR5G4ghV4elQO5TAVxLMG8lH3/5/Muvt/V/ozTAL0zDfVQdVExHVNUNqSUzwb/vjLa
         QaaQXgaVq9imZndG+aVT+xXjFQ3OrymFjB2GlCcJIOITp+SusCNtFrwtH/Rm/0gY3odB
         3j+deVQg/4xu83TJrdIBwGf0WdxRzOOue5L062HUM5rbUEqO4lgPKllYO5mnC+eFzTkG
         qlxg==
X-Forwarded-Encrypted: i=1; AJvYcCXKEzQQyOC9/Xbmm3Ylru7UHckmzMJNHYUFYc7EosvjRookz/LkxCDL2X+iJCKCeIDj5aBp9fEMDugRun8vUS4ks5Wi+RyBHfOTGVs=
X-Gm-Message-State: AOJu0Yw8jg4VPIrbqFNFG7HW4dcHXBENeKoPAHj+XaegCxpOBMdJ3B0i
	1+0UD3hypX5dLSGBR8mnH8u47NDPwDU76oRvnfTm9gbdMr04n+Q/5FuXmklAbXa8AaViMaYBNZF
	xxG2+1RGDGxnsvKFzzmp7ewFr5yzWKWfOY72imQ==
X-Google-Smtp-Source: AGHT+IH/j0tB3q6Oob0h+dYBea8dzUqqOODjZONtdFvf3j/P6dPoyQJkhUenc2mYLdwUqlwO12I2J5bpi1srvsWqmLs=
X-Received: by 2002:a2e:b046:0:b0:2ee:83f7:8b32 with SMTP id
 38308e7fff4ca-2eeb30dc45amr34980521fa.21.1720616398404; Wed, 10 Jul 2024
 05:59:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240701-b4-v6-10-topic-usbc-tcpci-v1-0-3fd5f4a193cc@pengutronix.de>
 <20240701-b4-v6-10-topic-usbc-tcpci-v1-5-3fd5f4a193cc@pengutronix.de> <27cf3056-5c7b-4759-b03a-1fa9b785611e@app.fastmail.com>
In-Reply-To: <27cf3056-5c7b-4759-b03a-1fa9b785611e@app.fastmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Jul 2024 14:59:47 +0200
Message-ID: <CAMRc=McvRLeCTTXgC_OD5z5OAxQ0pZ46dTKP8XO+T-LkXKgRfQ@mail.gmail.com>
Subject: Re: [PATCH 5/9] ARM: defconfig: convert to MTD_EEPROM_AT24
To: Arnd Bergmann <arnd@arndb.de>
Cc: Marco Felsch <m.felsch@pengutronix.de>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Russell King <linux@armlinux.org.uk>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Vladimir Zapolskiy <vz@mleia.com>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Tony Lindgren <tony@atomide.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Dinh Nguyen <dinguyen@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jon Hunter <jonathanh@nvidia.com>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	imx@lists.linux.dev, Linux-OMAP <linux-omap@vger.kernel.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, linux-tegra@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linuxppc-dev@lists.ozlabs.org, 
	linux-mips@vger.kernel.org, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 10, 2024 at 2:49=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> On Mon, Jul 1, 2024, at 15:53, Marco Felsch wrote:
> > The EEPROM_AT24 Kconfig symbol is marked as deprecated. Make use of the
> > new Kconfig symbol to select the I2C EEPROM driver support.
> >
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > ---
> >  arch/arm/configs/aspeed_g4_defconfig   | 2 +-
> >  arch/arm/configs/aspeed_g5_defconfig   | 2 +-
> >  arch/arm/configs/at91_dt_defconfig     | 2 +-
> >  arch/arm/configs/axm55xx_defconfig     | 2 +-
> >  arch/arm/configs/davinci_all_defconfig | 2 +-
> >  arch/arm/configs/imx_v4_v5_defconfig   | 2 +-
> >  arch/arm/configs/imx_v6_v7_defconfig   | 2 +-
> >  arch/arm/configs/ixp4xx_defconfig      | 2 +-
> >  arch/arm/configs/keystone_defconfig    | 2 +-
> >  arch/arm/configs/lpc18xx_defconfig     | 2 +-
>
> Applied to soc/defconfig, thanks
>
>    Arnd

No! Why? This is still being discussed and it's not clear it will even
make it upstream.

Bart


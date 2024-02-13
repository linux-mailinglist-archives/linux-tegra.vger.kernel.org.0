Return-Path: <linux-tegra+bounces-769-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA8A853D8F
	for <lists+linux-tegra@lfdr.de>; Tue, 13 Feb 2024 22:48:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F4C01F28137
	for <lists+linux-tegra@lfdr.de>; Tue, 13 Feb 2024 21:48:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93FE162141;
	Tue, 13 Feb 2024 21:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s3eyQZx5"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA65B61685
	for <linux-tegra@vger.kernel.org>; Tue, 13 Feb 2024 21:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707860873; cv=none; b=VGsxZXMwzL2ITxweu/vhlJ6BxtBcfsbjrHHDWQELTs1dnF/wZ2hM25kfNYyuZXcvL+y2Zu0Wai+y0rqmehHAwATpdM8JoyALO2YvQdlxSvFUeMA5QFUM01baInTfjitXn/KaNSeqmRr0XWvIfGbgJWHF2NiKwcDrwbuFwb2dD0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707860873; c=relaxed/simple;
	bh=4Xj7EazHfkvqhAcFDgWE71D7H9yEicOk1M857cHV2u0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=InZ3RsHTRVC5zyjDFEOqw4JFA67w0HySAL66yEZIHI+J2/P2aQcDmmRMK4h4el1yNtYB5QycThQpE57jkaoKg3PV3ROQhNu44hMofeqWATX43/3KJgZjQN36qXW0gpNDua9H2oujfdMNg0B3Pa08HeQl+L/hADfXHBthTvLEMt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s3eyQZx5; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dccb1421bdeso1102709276.1
        for <linux-tegra@vger.kernel.org>; Tue, 13 Feb 2024 13:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707860870; x=1708465670; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Xj7EazHfkvqhAcFDgWE71D7H9yEicOk1M857cHV2u0=;
        b=s3eyQZx5jV7ThhYFnv4fc4t0MH2AG7GTPJ12W3fm4/0jqq75Acl8m3eyz94117VKwR
         u8Mn+eQjRgF+8m2pz6vkDhTs/waZxPZXRdnfYZalO/6e4ZVWqVekPqDJX8FDg7TWYrln
         6Gudg4YUHAwilqcfFdnkVOQA5oYITMJf1FzN0tN1Kb1yoHBgoKFpl+dfSjUsB4pf2AnC
         r4BtMo7TDw9Aj7Oqz6HPj4ZuWhecAhb6lrUsI4XwlYRt1N5cwLQCaLkCh/IRfFDoaFOE
         u8kPcUZcArTUVM3ooDwtoVDfTVqDVfX1dEvYr5UUcM85CZiXBjf14xt/ZRIli+hrhG2W
         +LZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707860870; x=1708465670;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Xj7EazHfkvqhAcFDgWE71D7H9yEicOk1M857cHV2u0=;
        b=AycpILFO4Eh24kSL+eyK8mZX8xIPPzL0QxPEm5Db0KpNPogagUzo9ZzaNXE8tA0TsD
         0Z16Wev+DBWUCSRq8vB3uDofRr0jliwLtl4mfTFpZTIWDefSjcbvWe0n/+kyTQpmPJyB
         8LVpiuyqluyVUTRvg3YsluEV78Q+dLlC9mV5LEAe5KFPDHW4LrJfiAjTFdx0wrMD6oms
         vVFBruMCpgs0Ro4nQfkqQPhpCVvOfJOBNRLSAf9eG1wPBz+974lRPP2oxl6toS7yyJub
         5YqeK0+4JF3b0CuKBbCnu9Vdbp9K/yXU4GvnSiw94SCIg+ELEhdGeaLLFmT21DyHcls0
         gOfw==
X-Forwarded-Encrypted: i=1; AJvYcCXT/k0iz1aruNAKqu0dCtPAPZz6UbAAkjT0cNTqvdAbrLSoz9oWkn64qF5/EZU23Qh3W7BWoaiGdDeGPX7S6AAM27GVzczgjjLoqUA=
X-Gm-Message-State: AOJu0YydeF7DNLj5BgW59Z/ELb91UkU0KNmkAG9iE/vRdDMMqjDr5ktu
	uhh5G/yOcaSJEE60z/vycUhRIC+JKG67cJtn7tZNL1/7GxzPuH73ONcx6OhZLN0rhaqPQPCBp4L
	pv2uzq6Jnf10Mo9/WF+7bDxInWx+OONF6VtsyTQ==
X-Google-Smtp-Source: AGHT+IFa7Zt8v9y973vv6MpdAwv7+Tn3+by0Zhu9bHJxIuhmjm9zf8ed0hjSWCanmVOGM7vq2XjFxfCkSYAs+ofuT1Q=
X-Received: by 2002:a25:ae47:0:b0:dcd:49d0:eece with SMTP id
 g7-20020a25ae47000000b00dcd49d0eecemr434149ybe.60.1707860869809; Tue, 13 Feb
 2024 13:47:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240213-arm-dt-cleanups-v1-0-f2dee1292525@kernel.org> <20240213-arm-dt-cleanups-v1-4-f2dee1292525@kernel.org>
In-Reply-To: <20240213-arm-dt-cleanups-v1-4-f2dee1292525@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 Feb 2024 22:47:39 +0100
Message-ID: <CACRpkdbPANM0-h_g+6Zazgw9U5W8ZDc=EG4ZiTv64JVmZAPivg@mail.gmail.com>
Subject: Re: [PATCH 4/6] arm: dts: Fix dtc interrupt_map warnings
To: Rob Herring <robh@kernel.org>
Cc: soc@kernel.org, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tsahee Zidenberg <tsahee@annapurnalabs.com>, Antoine Tenart <atenart@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	=?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Stefan Agner <stefan@agner.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>, 
	Tony Lindgren <tony@atomide.com>, Chanho Min <chanho.min@lge.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Linus Walleij <linusw@kernel.org>, Imre Kaloz <kaloz@openwrt.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-tegra@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-omap@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 13, 2024 at 8:35=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:

> The dtc interrupt_map warning is off because its dependency,
> interrupt_provider, is off by default. Fix all the warnings so it can be
> enabled.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Thanks for doing this Rob! The schemas finds so many mistakes...
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij


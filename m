Return-Path: <linux-tegra+bounces-2700-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6348C908A1B
	for <lists+linux-tegra@lfdr.de>; Fri, 14 Jun 2024 12:35:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8864E1C22B30
	for <lists+linux-tegra@lfdr.de>; Fri, 14 Jun 2024 10:35:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DC4D194A71;
	Fri, 14 Jun 2024 10:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ShSZl2xM"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4984F194A4E
	for <linux-tegra@vger.kernel.org>; Fri, 14 Jun 2024 10:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718361340; cv=none; b=W0S0zrZEq0ecA9AsPOEbY8pgsT2EefhH76Xea62g/hP4tTSxB3T4BBeyFc3Thwv2Lfg0+HSRsexhpXmgysYZeWVFHLyNBACGBLm58svWsWMkWM74avhauhRP+HMz+LebgqjEl8wd9uLqR00tY25w4SA5VdLv/ep98CEwDRmiyA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718361340; c=relaxed/simple;
	bh=EiAyf1ePwV9uZg8YD0veGEI6NqoYhzoV0Z0ltj6RhI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=np9x1dDyGtsoXmX/lI1gyqBSZ0qXE+zlLPc/6DK+O+wEKne2iaASWZl09fUbwS+PJXwmXO1kxNimXTont1mZmHy74TpvsrYFKNxrri4HlZ8y9eObTJE11gwFVThEHzj2aYud8s67iWM6SssU6ZRIY7PludAmqQMPXZgmh0WtMac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ShSZl2xM; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52bbdb15dd5so2389728e87.3
        for <linux-tegra@vger.kernel.org>; Fri, 14 Jun 2024 03:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718361335; x=1718966135; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aGAN2NxY+2dqaICcDThn1Gl9L9GbHbJmWxV3worL+eg=;
        b=ShSZl2xMhkF4gfjoG5s6xSpe6i560Im5WRzuo9dUtm9moyWDGolG1E3UQj8jds1+br
         ROKm4jJKiT2JWUgTsmx5LwQ9v/QjyhdwWOeITk7sN9xLS00YrsqR7ihihwpY/I401Avn
         XffbB3itGAdXLf4ONPh9jTX2OHHn75p011xMxEG3pmRoIb/TGRjyth/LpPyW6ntLT9os
         czw49ZrLMj8ebfoqRVfts6dGvX0wh+Yq3iieRVCp8jME4ins9l3uY/z/Q02WHTMhBp+o
         sHF/PJM9LFXlFytsZYealZjfUsdXdv32dHCV/4jVC+EABhbvTdYOe63PIgNgc/N3TNHB
         KuMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718361335; x=1718966135;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aGAN2NxY+2dqaICcDThn1Gl9L9GbHbJmWxV3worL+eg=;
        b=FbaeSV5U0JRLFQclD5lddJ4Gag4+dR6Qnmj36baeW4xty+bP2NRRTQrBKflLFGCRnq
         15HxsggBpYt6NS7pzUJxbQqeY8bnQ9w7XNL2beTkvKrR+I3kew1REo9RWL3pOE0KuOPQ
         EC1yqwnpDw9jIEnZ9A7EZiNADi5urZRIsnmV6oWp81wCq2YJuGneFtw+rWHrf7tImaEa
         rSDCIAuV0KO/X9UJ5V7NFiSkeYBHSPuLWZmTRlr26ioGJYZq/GA2FpgU/Fc4W/oYYWsa
         Dn1MA/5z2re9tG2YSYr7UVgOcqXso0uGRsvL3J9XUL7+yoDkIRN+pP93ojpiwd/pz97K
         t9mA==
X-Forwarded-Encrypted: i=1; AJvYcCVwz8v+SZ9KLrRVzUy8w0finTLzJnsyFF22THl8XeVPAsmyiS30lKaAcQvSH+9Q3SRPPctolPnYUYs/BGvsorKs5sMUq85VWNZ5u/I=
X-Gm-Message-State: AOJu0Yx2/nMqqf58mHJIT7auD5Cj5akrEp2qEvCkEjWVlmc1pGY6SnEV
	6NNSCwtvpzcHDiEx/86jOQkSCPm7qAsgmhShwQj6Ji1Lwbb0je9ANIarVlpr2Uo=
X-Google-Smtp-Source: AGHT+IG9296cngTsNvss2HWOM7KAlI/jj4Qy+Im6Q+mlyoACYXVlropKfCXjXHH3MK5suUqtTVw77g==
X-Received: by 2002:a19:f809:0:b0:52c:89ff:10bf with SMTP id 2adb3069b0e04-52ca6e999e7mr1289070e87.67.1718361335571;
        Fri, 14 Jun 2024 03:35:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca2888363sm467688e87.278.2024.06.14.03.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 03:35:35 -0700 (PDT)
Date: Fri, 14 Jun 2024 13:35:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Guillaume La Roque <glaroque@baylibre.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Vasily Khoruzhick <anarsoul@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Anson Huang <Anson.Huang@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Amit Kucheria <amitk@kernel.org>, 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, Heiko Stuebner <heiko@sntech.de>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Pascal Paillet <p.paillet@foss.st.com>, 
	Keerthy <j-keerthy@ti.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, zhanghongchen <zhanghongchen@loongson.cn>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Bjorn Andersson <andersson@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	imx@lists.linux.dev, linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, Florian Fainelli <f.fainelli@gmail.com>, 
	linux-rpi-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 10/22] dt-bindings: thermal: qcom-spmi-adc-tm5: reference
 thermal-sensor schema
Message-ID: <os5vrqh7usscb2lmvwpzcea3uu2k2gbhhbfolwgoc7mc2tdjah@pt5ckx2gbfo7>
References: <20240614-dt-bindings-thermal-allof-v1-0-30b25a6ae24e@linaro.org>
 <20240614-dt-bindings-thermal-allof-v1-10-30b25a6ae24e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240614-dt-bindings-thermal-allof-v1-10-30b25a6ae24e@linaro.org>

On Fri, Jun 14, 2024 at 11:46:09AM GMT, Krzysztof Kozlowski wrote:
> Device is a thermal sensor and it requires '#thermal-sensor-cells', so
> reference the thermal-sensor.yaml to simplify it and bring the
> common definition of '#thermal-sensor-cells' property.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/thermal/qcom-spmi-adc-tm5.yaml | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry


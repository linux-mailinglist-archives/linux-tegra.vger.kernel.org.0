Return-Path: <linux-tegra+bounces-885-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB83859BFA
	for <lists+linux-tegra@lfdr.de>; Mon, 19 Feb 2024 07:25:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8BC931F21B33
	for <lists+linux-tegra@lfdr.de>; Mon, 19 Feb 2024 06:25:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FB91200D6;
	Mon, 19 Feb 2024 06:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="nIB01xNe"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE117200BA
	for <linux-tegra@vger.kernel.org>; Mon, 19 Feb 2024 06:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708323916; cv=none; b=QGuSAH39gzzZT2STm321Yx0qF7PQaie7PF1QgdNrcTaICfZ98y+DrIfEE1KzHa5Rx6AGqxRBaMqsC9+F3U41z4eii5i+MvGcE064sq+w0pqiv5KmEDBw2MdALdNZuvNryREXYFjBIZdqBjj14130LiS+noMuMPQ01jhfh9HhduQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708323916; c=relaxed/simple;
	bh=TQodChaPOHWcum/RNtaWMKL6Ir23w3h16d8jHIJEYQ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=amrgGZZ7XEx8Xl/SLOwL2B7Z4vbKG6mo0UoGP5cP7Mn/YI/RU+T2ojJtYWGQ1xQkUKAhCpDBE49aVIC59kNpwUmx/cNLVhdiX+EFe1lPMZepamtKeakXjNu3v3t6X6Bz94s+H25NouBqtFyg2ATFxUka2V2hVCheIADN4iNc1KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=nIB01xNe; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2d22d0f8ad1so14302061fa.2
        for <linux-tegra@vger.kernel.org>; Sun, 18 Feb 2024 22:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1708323912; x=1708928712; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zy/lENoBOBZbXj8shKgVOAS0kIgCPAbaRSp31XzJm0E=;
        b=nIB01xNeanzNhVV+SdVCi588Eo0eXBukT40V3RQgpuH9ia14PLKb3/0YI34OtzMfxn
         85N9sNV68n+JVB+68RoAmgo5CPE0LDLwYN0i+Nr5ZMzlVTM//jgqKAw09Tcoy/GGmNbd
         I6f94Edv3EJ5otvwW7LVYZydyai5aHd7Y1yDj2k6un+G/5n+ECyBk/6+yj6R52jyw4FB
         uj+2Z6b2r37g1AzLz804CfdI9WT/ENAnnURbTQ1wqeOKMOXPrvXLj0U+i30B4NVfl6Ux
         NCHAABx5avCo4bDky8MjuizLsIuJW2es3tI5yJGSx0ypfVF05LdjNbknfTT/C4jDQn1T
         6LBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708323912; x=1708928712;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zy/lENoBOBZbXj8shKgVOAS0kIgCPAbaRSp31XzJm0E=;
        b=kDalg7q/HKbZnxJ1PP98V8jTWTTfHMXRcRuH686kYmf6GElkYDnUvEuysZpa/4sq3o
         VBVhNQGQ51eAFtEbTSvh9EaX9OXUwU2QdAcIe/cpotfuuF/TyNnEQlDdieEdMj4e/w8p
         zZOPx2LIy8eG1qrMVGDtg8pKyDiMQQpUMoDXuS5QHXMXh0ZI3liX19SplRHqXx1ZONna
         rsyaTmj2OFuBHIJecW6e0Csovs7Xp3hLtTT+N7ORbhVueqKIHgsUA/tuhGi2mgWAyNl4
         WnkZ+C+3A6Jva7bdxWbpqW2BgSVv4QwF0JlCn1OPBulsCcmCB8OyCNQxXL7fFZFIpS1s
         1Pyg==
X-Forwarded-Encrypted: i=1; AJvYcCWWCxTQNMxBWATv8vGNbJGlhfuWTogzlHtNGk5DuXDxUrSziBwNDgW8INmbMvmEBxOd2DjdJPEFKMNI/4qXWK+w0A9adFZaWBiskmg=
X-Gm-Message-State: AOJu0YyzAuV4GWKLtNja5b3ui/vhuh0uTeiG2i1h5WuTxsGh5GrchzaE
	kObo4sQIKz7Hy2fOQ7W3YdLOZRh1l4UoEmCPRhqtLLhVBao8PazMfHRh3dG0qDE=
X-Google-Smtp-Source: AGHT+IGP6skyrpQ+LHssyeFVL9x4R2C5PmtB+z/bDgXXtY+zd/lWWTMfb39ns1BsA6xd3vrJYLpPRQ==
X-Received: by 2002:a2e:99c3:0:b0:2d2:3b20:72ba with SMTP id l3-20020a2e99c3000000b002d23b2072bamr755168ljj.50.1708323911958;
        Sun, 18 Feb 2024 22:25:11 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.20])
        by smtp.gmail.com with ESMTPSA id s10-20020a05600c044a00b004122fbf9253sm10177702wmb.39.2024.02.18.22.25.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Feb 2024 22:25:11 -0800 (PST)
Message-ID: <e43727bd-d83d-4271-9871-ff995c8e7d03@tuxon.dev>
Date: Mon, 19 Feb 2024 08:25:08 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: constify the of_phandle_args argument of
 of_clk_provider
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
 Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Nishanth Menon <nm@ti.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, linux-stm32@st-md-mailman.stormreply.com,
 NXP Linux Team <linux-imx@nxp.com>, linux-amlogic@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
References: <20240208163710.512733-1-krzysztof.kozlowski@linaro.org>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20240208163710.512733-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 08.02.2024 18:37, Krzysztof Kozlowski wrote:
> None of the implementations of the get() and get_hw() callbacks of
> "struct of_clk_provider" modify the contents of received of_phandle_args
> pointer.  They treat it as read-only variable used to find the clock to
> return.  Make obvious that implementations are not supposed to modify
> the of_phandle_args, by making it a pointer to const.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/clk/at91/pmc.c                        |  3 +-
>  drivers/clk/at91/pmc.h                        |  3 +-

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>


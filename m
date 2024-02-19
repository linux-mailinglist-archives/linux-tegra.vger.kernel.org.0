Return-Path: <linux-tegra+bounces-887-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D04F9859CF6
	for <lists+linux-tegra@lfdr.de>; Mon, 19 Feb 2024 08:34:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0EFDA1C20BB3
	for <lists+linux-tegra@lfdr.de>; Mon, 19 Feb 2024 07:34:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D52E420DC1;
	Mon, 19 Feb 2024 07:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="agmGWt0G"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB6322314
	for <linux-tegra@vger.kernel.org>; Mon, 19 Feb 2024 07:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708328041; cv=none; b=mJXIlpvplLYIOiwrWIRiCTlLhWi5AfI9zCQxTdkeeThqGRhhEtKdlW3j6lrdxcdyYH4JPGwd/msMYBujw+A8/zOA77L5iG59aUBiKlxRyhmbu4OGpa8rB3fncAC5BGGKdZ2UvZuZ/lLYR3dsHK2V6ziryPDg0hsi+JQiZG3Zg5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708328041; c=relaxed/simple;
	bh=pSGqYWEkgA5r9fvAZaRNq9VpI+rNE64hzozwKd0Iv60=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=IDI5XYrSvuNXcG1oDF2ORSfqx4kvnXWwCdDTY/lLQN/tySDTrLjDEu/Et8osOvrIV3K+OT9HHXhG7hv/6XyryxmAQMBOIuCrmQo3nBzmBXU5BVxAP9oL8KOB53/Lw1VjYco0NFy2TB9FQInN3+CHgvsxZzHJFdaNIuPa6ejo1mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=agmGWt0G; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-512b25893c9so664012e87.3
        for <linux-tegra@vger.kernel.org>; Sun, 18 Feb 2024 23:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1708328037; x=1708932837; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+ng3gW4V3o0lgSkXW6LbE2EKjcIRK6fb4LZxE38g6CE=;
        b=agmGWt0GYXvSMZ5nFELoKzr7zFdgt7JzmtUYPeiiRxQlJxcBoGgOylwgHzarSE/PTY
         tMd1EuXOdLZH4pZ8dLddHn4tpz7r87EivJpJpv7W8qXRIGa+l+1YC4QUnpmh/0NFxJ93
         Z509cUXTYLax9/aNTu/CbDLPUv3IJWLNWt4qGTK0MrcK4Vhge74X77GVWFKZtZ8IiB7R
         N3lR7s/ZNj27Ps77ra8wHKaAswIaatdghJZ3rdc7diLlfN+MT16abFK4lnB4flsJ+bbe
         JZuGw2fYSioAVUQtJihYeokp3zbnUK3y5CHrMKBVALcXAWqrNyuQIKui8Jn1Vr1jOkKR
         hCqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708328037; x=1708932837;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+ng3gW4V3o0lgSkXW6LbE2EKjcIRK6fb4LZxE38g6CE=;
        b=J+OXH2Mb93K23isFch90mPlvkhfmYV4m2FYNy6ZX+mDo1lhufQ8eJy/IPKM3rx2/v7
         +2nGIINuEeBfjMA2V2lNt5V1/T5+oDeE829sJoN3mNf/0L45ZDZ1NkjBiL6Lvx7pBaVZ
         f1sqg9CB4XvQovj7ol/VP+VRa66zrXbxwMIcI8oHY6hAzcdew1+55rKN++Xz+QN+O04L
         p9RG+68PL7ej/FG81la9jlkakRPvghh1s6XuKs4ERQq8FtwvdYe09GawYTuf7USari44
         05Radrk0+u4KAc/hdYgV0bYY9b+tAcBAEElJ42i5W0OiZci+INtwRSwCo4mxWMmnnGZF
         L59A==
X-Forwarded-Encrypted: i=1; AJvYcCXbVXtg8Ka0GvT9Cws7c6rj605NmK7fBGqy7Aj8QdEvkCPDfnXEKGcM8WxFT07u7Rno1UhrnWc59o+xkTZoJ+eNC+yD53zRDBhNVdM=
X-Gm-Message-State: AOJu0YzciYBF4eUHEH4XaG+eBM620i41RBT9t4ytSNpolTKMhL6Hfu9H
	SF1pBFLLJmUs1IBF2Dk55S6qmNLdTiwJojcR/ov6ILVL9k8itBWVPRt7YMhkvzs=
X-Google-Smtp-Source: AGHT+IH7t2S3UJLlE+g5RosWguA6ACJo1jYaUo0HRFcgzCtXQeK6rSIGLys7KhAWV1PTPsrhu0txhw==
X-Received: by 2002:a05:6512:3144:b0:511:84fe:8dcd with SMTP id s4-20020a056512314400b0051184fe8dcdmr7786108lfi.1.1708328036943;
        Sun, 18 Feb 2024 23:33:56 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.20])
        by smtp.gmail.com with ESMTPSA id l20-20020a05600c1d1400b0041256ab5becsm7611582wms.26.2024.02.18.23.33.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Feb 2024 23:33:56 -0800 (PST)
Message-ID: <e6c6e825-42dd-4f2d-8329-f7b3e09bb8a9@tuxon.dev>
Date: Mon, 19 Feb 2024 09:33:53 +0200
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
 <e43727bd-d83d-4271-9871-ff995c8e7d03@tuxon.dev>
 <88de75cd-4069-4be6-9c4e-f32befa46d58@linaro.org>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <88de75cd-4069-4be6-9c4e-f32befa46d58@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 19.02.2024 08:59, Krzysztof Kozlowski wrote:
> On 19/02/2024 07:25, claudiu beznea wrote:
>>
>>
>> On 08.02.2024 18:37, Krzysztof Kozlowski wrote:
>>> None of the implementations of the get() and get_hw() callbacks of
>>> "struct of_clk_provider" modify the contents of received of_phandle_args
>>> pointer.  They treat it as read-only variable used to find the clock to
>>> return.  Make obvious that implementations are not supposed to modify
>>> the of_phandle_args, by making it a pointer to const.
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> ---
>>>  drivers/clk/at91/pmc.c                        |  3 +-
>>>  drivers/clk/at91/pmc.h                        |  3 +-
>>
>> Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> 
> You understand there is no review for "part of patch"? You probably
> meant Acked-by.

Sure... Here it is:
Acked-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

> 
> https://elixir.bootlin.com/linux/v6.8-rc5/source/Documentation/process/submitting-patches.rst#L544
> 
> Best regards,
> Krzysztof
> 


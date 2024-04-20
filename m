Return-Path: <linux-tegra+bounces-1815-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E2F8ABDB4
	for <lists+linux-tegra@lfdr.de>; Sun, 21 Apr 2024 01:08:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 264A31C209FF
	for <lists+linux-tegra@lfdr.de>; Sat, 20 Apr 2024 23:08:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 727254CE05;
	Sat, 20 Apr 2024 23:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oPjt3rKi"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CF6495F0
	for <linux-tegra@vger.kernel.org>; Sat, 20 Apr 2024 23:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713654481; cv=none; b=I0GpsMrbM7fJWxQ0pRmK3q416Su45bB8y1qQB+BqVmnWmN0miUqW6eTDGv0o9/VckA8o343wS7yE9W8zOz0N/8beRw5TjPHKLPek25F2/31bCZhafeSyxWE0gdMV/JzzO8+sH+HqLusX0zLOMoJvRbZI/Bpef8adBAn7Ah0jGSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713654481; c=relaxed/simple;
	bh=z6difwhnZxEoVhqGOtYJurOynqmxvUFH5a72r0Wf1ZE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LOqd6cunKwo5kUMbasx4h2D2Uk1czUAi2fpl4b82tuf29w+DzodZVYroFGV/QheC1UrSucqaM3tsAQ4V2owTA/DtzJk6vdYeA3sFS0nAb+faM3MfgLYMEoxNi0WPkYGHZ3mVsoF3CTI9oBo7buk5tZTpYz2h+QpLNqddwCEqrX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oPjt3rKi; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-349545c3eb8so2347944f8f.2
        for <linux-tegra@vger.kernel.org>; Sat, 20 Apr 2024 16:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713654477; x=1714259277; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x9hTDE+OmzSnorVJyzQcFNYmLnBIvZgvXWNavzd4DaM=;
        b=oPjt3rKiNAhso7Wd+M0Hl6d6UB7y7ALR9tmfmQCj+b2aKTQCoEjG4/3fwH3pQI9LWb
         A0UdjtG8hB/kfXy5JccETkfTaHPJ/WwVHCs918XQdNQfysXeDHvTHLGGyDrCBlXFLMIM
         z+HGEBQGeTcupf6fYmqoXSfZlDVOMkoJSUiKTLDD+PGeH68lYfIgJPfAIaDe1ZZLbWrD
         wrFadREqvkke2CDWj9rgU45oVfxX6qpNsblmw1CnAr3706AuZ9UYoa0Q/QWm82C7I2aN
         iGo2Vg7fY6auzycLFLeeLQl5hOG0KTDdntEigaf+cem4FaxiWDbZfh3+KKDxfMEaS+vp
         H/xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713654477; x=1714259277;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x9hTDE+OmzSnorVJyzQcFNYmLnBIvZgvXWNavzd4DaM=;
        b=uBBTddG1jXvq731ur0S/zYcRK1NROk92Uf7qe2ZbT5XuvwZxPusawBBI/OR7gvWrpR
         q4ldmcEnZYwXiOQCIdl7LQQpHdpRj6f+JEY34pakvvblN3NBrNPAsn5O9FCq1oGfYPr3
         0gkq2e5cika84L1zil0DsqTIFvCd7jnYQSYAXzzzWOi9vSJyELaVpxGWFBVArQYorUH5
         cVsqFXeg+BONlgvufwoPVkzBhw0RYOPyxLrx1gxBXp7019g+Sabo5zl3RlY5cSwjSd7s
         7U5AqIHuXMl3Z/4HdYomXU2kV7oQQCZlfNO4KgkDEheH1T0UAw818mL3/92pNW8dfh+E
         xC0A==
X-Forwarded-Encrypted: i=1; AJvYcCX9eVyr2QhxmDVmYRUDcFNlVwUMB4cPajf3hM9hHBfuWe4Ehsnaoa6AQu9XFBAIzdibrb/1VDxU8hMEQbuQEeJSu5Ljm4HyHX/C3NQ=
X-Gm-Message-State: AOJu0YzMpWTLNLSVYm1bUHNTAZr6T7K68JvO7H9xmPjCfNp/CowLMS4r
	hQUx3M0n2m+RPwsX8ZVKbnXWUOOVmM3HLmBnPPrTJb4LexSY86GvlIPk/KS16Hk=
X-Google-Smtp-Source: AGHT+IFGdOa11zFVqyC3KCcGi9RrrofVzZm8cOluppaZLRYUDrIPrVm3Gfdre6MIxYSUZ9KallR7Bw==
X-Received: by 2002:adf:cd84:0:b0:33e:7f51:c2f8 with SMTP id q4-20020adfcd84000000b0033e7f51c2f8mr3599510wrj.36.1713654477259;
        Sat, 20 Apr 2024 16:07:57 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id p3-20020a5d6383000000b00341b451a31asm7862874wru.36.2024.04.20.16.07.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Apr 2024 16:07:56 -0700 (PDT)
Message-ID: <ae9b190c-3961-4704-bc93-cb1c4182672b@linaro.org>
Date: Sun, 21 Apr 2024 00:07:55 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/26] media: stb0899: Simplify check
To: Ricardo Ribalda <ribalda@chromium.org>,
 Martin Tuma <martin.tuma@digiteqautomotive.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>,
 Abylay Ospan <aospan@netup.ru>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Dmitry Osipenko <digetx@gmail.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
 <20240419-fix-cocci-v2-2-2119e692309c@chromium.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240419-fix-cocci-v2-2-2119e692309c@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/04/2024 10:47, Ricardo Ribalda wrote:
> chip_id is an unsigned number, it can never be < 0
> 
> Fixes cocci check:
> drivers/media/dvb-frontends/stb0899_drv.c:1280:8-15: WARNING: Unsigned expression compared with zero: chip_id > 0
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>   drivers/media/dvb-frontends/stb0899_drv.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/dvb-frontends/stb0899_drv.c b/drivers/media/dvb-frontends/stb0899_drv.c
> index 2f4d8fb400cd..35634f9a8ab5 100644
> --- a/drivers/media/dvb-frontends/stb0899_drv.c
> +++ b/drivers/media/dvb-frontends/stb0899_drv.c
> @@ -1277,7 +1277,7 @@ static int stb0899_get_dev_id(struct stb0899_state *state)
>   	dprintk(state->verbose, FE_ERROR, 1, "Demodulator Core ID=[%s], Version=[%d]", (char *) &demod_str, demod_ver);
>   	CONVERT32(STB0899_READ_S2REG(STB0899_S2FEC, FEC_CORE_ID_REG), (char *)&fec_str);
>   	fec_ver = STB0899_READ_S2REG(STB0899_S2FEC, FEC_VER_ID_REG);
> -	if (! (chip_id > 0)) {
> +	if (!chip_id) {
>   		dprintk(state->verbose, FE_ERROR, 1, "couldn't find a STB 0899");
>   
>   		return -ENODEV;
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


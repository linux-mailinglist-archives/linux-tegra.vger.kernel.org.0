Return-Path: <linux-tegra+bounces-295-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DFA812F77
	for <lists+linux-tegra@lfdr.de>; Thu, 14 Dec 2023 12:53:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2127F2830DB
	for <lists+linux-tegra@lfdr.de>; Thu, 14 Dec 2023 11:53:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ED69405FD;
	Thu, 14 Dec 2023 11:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dUcRY+xc"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4280710A
	for <linux-tegra@vger.kernel.org>; Thu, 14 Dec 2023 03:53:36 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-50bffb64178so9438983e87.2
        for <linux-tegra@vger.kernel.org>; Thu, 14 Dec 2023 03:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702554814; x=1703159614; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KttnO4PIiCaAGSytE92u74iuSMSOKJ5regNQ/EC5WuQ=;
        b=dUcRY+xcez7rKlURdw2AFGWcNBBuRihJ9ggWBlAMEw9RizFwTpyX8PyDEezOXkPFub
         Xkg/t2pA8rxDeWbxrP8RnPS5Y/2yre721nd1j/1cFbhQC+P3jrTx8ZuBn8+oeyT3NSkE
         lxsBqMDvhPASxFGvS1IusI72EXuYJdFrSHeGhTv+cLyiPXLKZz+082IjfqZWVgxQczWa
         Z1kx6ONvpsCF49wx1usk/VJmAMiDltXf1pn4Hh+idWI1V8CcGnQtO2s4uWwJVTnKu1XA
         P6n8gakR5YKuPSTLNCNPqz+DUNA2XTktgPFzrhZqeTa8at/pER4a0RV4TWwBazoywj2x
         MD8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702554814; x=1703159614;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KttnO4PIiCaAGSytE92u74iuSMSOKJ5regNQ/EC5WuQ=;
        b=cdl4KmL225HAonK9Z8Fv/t8/v/Tn1/2hL/Fo5l9qDdRR/n9GwLROs0nSL7zNOVznuJ
         qEvlHLNESUocynLv6/zHYaNRbqyJT7VwdXNPsL3DSy1TrzGrfPwWA/7XwELOobAzqpY0
         Ss10EmpIu03ZIA7WtMADfhmUapWViYDFea4MGX7LgLJckPlimSOCYTO4+fZ7cxV8s3MD
         hYAVoUy1yYAwruYDeqNb8TPMcu9AT50piWNQ2QVGyka+80NwwG0YogGCn/G3DOXRM6Ig
         mdJ6jyw2h0TOIiDDK7vEoWgkcyIUUZELiZAKTxoHgHWpCvV+Q5knJ3nL5jxBD0Gx/Toq
         3trA==
X-Gm-Message-State: AOJu0Yx1ItEJHBmY6GY9t47RHAEeu7pHqZkOQyJv2ZLwE/HAh9rMZ+tm
	3o6RgqfxqUO1tiYDAGWVN+NmVA==
X-Google-Smtp-Source: AGHT+IFKAUpNpfuAuwpUiHGvkKtTTxlNLOoY8GwwQiOzDKup6y8DvTMvl5/GS7Uobt3Q4SD5/EbY3A==
X-Received: by 2002:ac2:4219:0:b0:50b:f305:7802 with SMTP id y25-20020ac24219000000b0050bf3057802mr3932763lfh.129.1702554814419;
        Thu, 14 Dec 2023 03:53:34 -0800 (PST)
Received: from [172.30.204.158] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id y14-20020ac2446e000000b0050e1633748dsm183444lfl.206.2023.12.14.03.53.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Dec 2023 03:53:34 -0800 (PST)
Message-ID: <2890ae71-aed0-451d-a7fb-7db30c30b72b@linaro.org>
Date: Thu, 14 Dec 2023 12:53:30 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/6] arm: arm64: dts: Enable cros-ec-spi as wake source
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Mark Hasemeyer <markhas@chromium.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Raul Rangel <rrangel@chromium.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Andre Przywara <andre.przywara@arm.com>,
 Andy Gross <agross@kernel.org>, Baruch Siach <baruch@tkos.co.il>,
 Bjorn Andersson <andersson@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Jesper Nilsson <jesper.nilsson@axis.com>, Jisheng Zhang
 <jszhang@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Michal Simek <michal.simek@amd.com>, Paul Barker <paul.barker@sancloud.com>,
 Rob Herring <robh+dt@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 cros-qcom-dts-watchers@chromium.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20231213110009.v1.1.Ifd0903f1c351e84376d71dbdadbd43931197f5ea@changeid>
 <20231213110009.v1.2.I274b2d2255eb539cc9d251c9d65a385cc4014c79@changeid>
 <e5625051-e9e2-4a75-a11a-cf5b40606fa4@collabora.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <e5625051-e9e2-4a75-a11a-cf5b40606fa4@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: *



On 12/14/23 11:55, AngeloGioacchino Del Regno wrote:
> Il 13/12/23 19:00, Mark Hasemeyer ha scritto:
>> The cros_ec driver currently assumes that cros-ec-spi compatible device
>> nodes are a wakeup-source even though the wakeup-source property is not
>> defined.
>>
>> Add the wakeup-source property to all cros-ec-spi compatible device
>> nodes to match expected behavior.
>>
>> Signed-off-by: Mark Hasemeyer <markhas@chromium.org>
> 
> I received only patch [2/6] - please send the entire series to the relevant
> maintainers, as otherwise it's difficult to understand what's going on.
> 
> As for this patch alone:
>   1. arch/arm stuff goes to a different commit
>   2. I would prefer if you split per-arch and per-SoC.
+1, otherwise *somebody* will get merge conflicts that - even
if trivial - take additional time to resolve :(

Konrad


Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 668A6203AE2
	for <lists+linux-tegra@lfdr.de>; Mon, 22 Jun 2020 17:29:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729482AbgFVP3I (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 22 Jun 2020 11:29:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729456AbgFVP3I (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 22 Jun 2020 11:29:08 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0EADC061573
        for <linux-tegra@vger.kernel.org>; Mon, 22 Jun 2020 08:29:07 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id y11so19814553ljm.9
        for <linux-tegra@vger.kernel.org>; Mon, 22 Jun 2020 08:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=AwrmH9XR6nAdFs/nrfBu2GfmFmEuD9edL5HnHmNJTjo=;
        b=gum6rgHa9w6h1Yyw9PS/tkZQsiN9UYxOWKSVzEis3L4sHh05WD69idYdoL6It1REdg
         32MgAuO1mJ32g+JpGt01SYxhW28SLDTd+Xhg/B1RDnBgZH0iM+gb+nbVTaANkIBkw9NE
         51AKh9CxFDgurog+39QfLCj6wFP3Pag+WcBdfXhBJOvnfbsRJ9DlCUPmo2x3kieEzm8p
         Q4BatYy3zBuRljWM4uBEenV+AVu0LzHWsev2BEBuHppCCTuVwwvDola8RyXXv2UVI4Gz
         Yab1UyqncOTJVemHfVM+ikel+T71mSo+vj6gJg6qfhyhzDsF2BPdydmUNY8C0embM9tb
         aiKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AwrmH9XR6nAdFs/nrfBu2GfmFmEuD9edL5HnHmNJTjo=;
        b=HYGfOCiulnQWK2CACj9uFUJAxPAF21Kk4T8hM1fPzpoCsALPEKAfu1Id4gitGayMu7
         USr6tvdd7e9smsF1g62ZLv33AJRrxmBx3mSJ5dzpJizgBUq19RwxVr8AIWaHENls/Pqz
         Vgyi/QT+jBpW8LOslew3iEnIew/aN/+jDrOEdg3j9/euTb27VmEVzBV1WqnuFeL8wfti
         NyvwDd+eRviY6xkLp50RgKM5D74J97HvNY4Uv2SKi1qY5rE06Tbv6DyPcVYGRM6bSvCr
         lfu78rslXGoTtdE0TemKgzHy7mpNQH1+NYuG19f1/khV5xVbwA1Q9xII8WZsK9LM9Ef+
         AQag==
X-Gm-Message-State: AOAM531qWOJxGcBWq3i3Kc+CmpoEk2py38V4OUwqB90e8+J2rcISeaM5
        kP1+0YXbIZlnkR7lqh9mB+P3Fqix
X-Google-Smtp-Source: ABdhPJw3AGXFR09AtcDmnltLNpwzO3GRg8X/KqsSwtThVnYii+O2zGTO0lvaDOpqNXDPcj4ijcqEVA==
X-Received: by 2002:a05:651c:299:: with SMTP id b25mr9595592ljo.13.1592839746280;
        Mon, 22 Jun 2020 08:29:06 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru. [79.139.237.54])
        by smtp.googlemail.com with ESMTPSA id m15sm2765728ljc.129.2020.06.22.08.29.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2020 08:29:05 -0700 (PDT)
Subject: Re: [PATCH 09/73] ARM: tegra: gr2d is not backwards-compatible
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Jon Hunter <jonathanh@nvidia.com>
References: <20200616135238.3001888-1-thierry.reding@gmail.com>
 <20200616135238.3001888-10-thierry.reding@gmail.com>
 <9f56be9a-1a79-07cc-371f-f3abcd20701e@gmail.com>
 <20200622152209.GA4008275@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <d11a1b87-6f00-3477-9402-310a402dc8d5@gmail.com>
Date:   Mon, 22 Jun 2020 18:29:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200622152209.GA4008275@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

22.06.2020 18:22, Thierry Reding пишет:
> On Wed, Jun 17, 2020 at 07:21:30PM +0300, Dmitry Osipenko wrote:
>> 16.06.2020 16:51, Thierry Reding пишет:
>>> From: Thierry Reding <treding@nvidia.com>
>>>
>>> The instantiation of gr2d in Tegra114 is not backwards-compatible with
>>> the version found on earlier chips. Remove the misleading compatible
>>> string.
>>>
>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>>> ---
>>>  arch/arm/boot/dts/tegra114.dtsi | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi
>>> index a0ac9ea9ec9d..d583dfba688f 100644
>>> --- a/arch/arm/boot/dts/tegra114.dtsi
>>> +++ b/arch/arm/boot/dts/tegra114.dtsi
>>> @@ -35,7 +35,7 @@ host1x@50000000 {
>>>  		ranges = <0x54000000 0x54000000 0x01000000>;
>>>  
>>>  		gr2d@54140000 {
>>> -			compatible = "nvidia,tegra114-gr2d", "nvidia,tegra20-gr2d";
>>> +			compatible = "nvidia,tegra114-gr2d";
>>>  			reg = <0x54140000 0x00040000>;
>>>  			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
>>>  			clocks = <&tegra_car TEGRA114_CLK_GR2D>;
>>>
>>
>> Could you please explain what's the difference? AFAIK, the 2D HW is
>> identical on T20/30/114.
> 
> My understanding is that the IP core itself is identical. However, the
> compatible string really describes the integration of the IP, which in
> case of Tegra114 is slightly different in that it's part of the HEG
> power partition, whereas it wasn't previously.
> 
> That means that without knowledge of the power partition we won't be
> able to access the gr2d IP on Tegra114 at all and hence it isn't
> backwards compatible with Tegra20.

Thank you very much for the clarification! Will nice if this could be
added into the commit's description.

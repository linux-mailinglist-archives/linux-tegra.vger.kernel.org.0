Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C91520A0BE
	for <lists+linux-tegra@lfdr.de>; Thu, 25 Jun 2020 16:19:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405310AbgFYOTD (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 25 Jun 2020 10:19:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404890AbgFYOTC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 25 Jun 2020 10:19:02 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 043D4C08C5C1
        for <linux-tegra@vger.kernel.org>; Thu, 25 Jun 2020 07:19:02 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id t9so3306658lfl.5
        for <linux-tegra@vger.kernel.org>; Thu, 25 Jun 2020 07:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Z1V6/8nJZNThJxXIiumjreurJzk/FJlLnmys9gvriz0=;
        b=iKYYJoo0MsjPFIOC50JhZlhrI7/sYDxYd20YcY6HTTDAJL6QFYbW/IFhwrE4E6N4/w
         eKs+3xqwcQxDVS5XixY2o2LoBKIkUuB/Q/4DLEwgB9yl9YxMWZVtVingqknW4o95yrnm
         33MDdx3+cJwoGBwRnOk7D/tsHz7YHZqeFE6PJTW562jUBQCC85SXLPXd9ZRxq9FMXyzI
         /GkFb/tvCoz+AD3iETnSxkLHOOYxL8cWHKfmGFsTSQcGYYnG4ehkmNvHvG3zf1udUaV2
         6Cx4d9YJamB1nnPBbeoFbeGYJXI1GC+WyMTo5w1xIoYk9KDWmp4hOuJGoIxOnLvnwM9D
         3Efw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Z1V6/8nJZNThJxXIiumjreurJzk/FJlLnmys9gvriz0=;
        b=DH+zPcjR/r9JNPxbuU+5vjKPIRjTXJbu3/6QIsThZwh73tEjyRJMTWpDmXdPHJzj3/
         yYb3v4wNQLLG7758eFlsUVDErbv5Xkf98WtjStzBPh79787b2woxm8a/9y+AOSYEgoGX
         m0HneBO8rLl01ozOMve6qExkPiSqwV5SrJc2kpHnCUTSUZN+PVCySfno8gIbX70eJ7uY
         O9EpRjuUOEoWkcBKTRtxS8Ynp1FrgH5TmYs0ysQRQK7kw75WEoymlVurnfqLf7+U2kGB
         /eRjmWKZEZ8bzCKfF4MOM869nuoUNjrMZKO+P9L06ygpn4EogMzdJ/feF9pc2nR4AThm
         KaIw==
X-Gm-Message-State: AOAM532+BZg3GbW45k/0JvTqqk6O/ojShUa6DRF3QASpPG3Dz2u+1FtO
        YSAfg//S3hWfcGB1wCDEa40=
X-Google-Smtp-Source: ABdhPJwdKNPy9+vcHeqBGbBRnQH1v4mHvGhsI/aNOc+wmfPL7+qtAp6i/thaCsPs0Qe2J9zwGsPpbA==
X-Received: by 2002:a19:8307:: with SMTP id f7mr18382130lfd.174.1593094740479;
        Thu, 25 Jun 2020 07:19:00 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru. [79.139.237.54])
        by smtp.googlemail.com with ESMTPSA id d6sm1993509lja.77.2020.06.25.07.18.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2020 07:18:59 -0700 (PDT)
Subject: Re: [PATCH 12/73] ARM: tegra: Drop display controller parent clocks
 on Tegra114
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Jon Hunter <jonathanh@nvidia.com>
References: <20200616135238.3001888-1-thierry.reding@gmail.com>
 <20200616135238.3001888-13-thierry.reding@gmail.com>
 <0bc2ec0e-f863-207a-d61b-058503598139@gmail.com>
 <20200625073736.GA2800220@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <89c432a9-11ad-8f8c-46b5-9df9779467db@gmail.com>
Date:   Thu, 25 Jun 2020 17:18:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200625073736.GA2800220@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

25.06.2020 10:37, Thierry Reding пишет:
> On Wed, Jun 24, 2020 at 07:19:26PM +0300, Dmitry Osipenko wrote:
>> 16.06.2020 16:51, Thierry Reding пишет:
>>> From: Thierry Reding <treding@nvidia.com>
>>>
>>> The parent clocks are determined by the output that will be used, not by
>>> the display controller that drives the output. Drop the parent clocks
>>> from the display controller device tree nodes.
>>>
>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>>> ---
...
>> Hello Thierry,
>>
>> Tegra DRM fails to probe after this change using next-20200624 on T20/30
>> (T124 also should be broken):
>>
>>  tegra-dc 54200000.dc: failed to get parent clock
>>  tegra-dc 54200000.dc: failed to probe RGB output: -2
> 
> Indeed. I had completely missed that we used to have this RGB output on
> prior chips and therefore do need the parent clock. As of Tegra124 that
> RGB output is no longer present, so this isn't needed anymore.
> 
>> BTW, the commit's title is misleading since the patch touches all SoCs
>> and not only the T114.
> 
> Good catch. I've replaced this with the following:
> 
> --- >8 ---
> commit afd92390fcaa784a6d064f3b07c8d8124e43e5d1
> Author: Thierry Reding <treding@nvidia.com>
> Date:   Thu Jun 11 19:09:36 2020 +0200
> 
>     ARM: tegra: Drop display controller parent clocks on Tegra124
>     
>     The parent clocks are determined by the output that will be used, not by
>     the display controller that drives the output. On previous generations a
>     simple RGB output used to be part of the display controller and hence an
>     explicit parent clock needed to be assigned to the display controller to
>     drive the RGB output. Starting with Tegra124, that RGB output has been
>     dropped and the parent clock can therefore be removed from the display
>     controller device tree nodes.
>     
>     Signed-off-by: Thierry Reding <treding@nvidia.com>
> 
> diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
> index 1afed8496c95..2c992e8e3594 100644
> --- a/arch/arm/boot/dts/tegra124.dtsi
> +++ b/arch/arm/boot/dts/tegra124.dtsi
> @@ -105,9 +105,8 @@ dc@54200000 {
>  			compatible = "nvidia,tegra124-dc";
>  			reg = <0x0 0x54200000 0x0 0x00040000>;
>  			interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&tegra_car TEGRA124_CLK_DISP1>,
> -				 <&tegra_car TEGRA124_CLK_PLL_P>;
> -			clock-names = "dc", "parent";
> +			clocks = <&tegra_car TEGRA124_CLK_DISP1>;
> +			clock-names = "dc";
>  			resets = <&tegra_car 27>;
>  			reset-names = "dc";
>  
> @@ -120,9 +119,8 @@ dc@54240000 {
>  			compatible = "nvidia,tegra124-dc";
>  			reg = <0x0 0x54240000 0x0 0x00040000>;
>  			interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&tegra_car TEGRA124_CLK_DISP2>,
> -				 <&tegra_car TEGRA124_CLK_PLL_P>;
> -			clock-names = "dc", "parent";
> +			clocks = <&tegra_car TEGRA124_CLK_DISP2>;
> +			clock-names = "dc";
>  			resets = <&tegra_car 26>;
>  			reset-names = "dc";
> --- >8 ---

Looks good, thank you!

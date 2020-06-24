Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C9602078EC
	for <lists+linux-tegra@lfdr.de>; Wed, 24 Jun 2020 18:19:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404629AbgFXQTa (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 24 Jun 2020 12:19:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404431AbgFXQTa (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 24 Jun 2020 12:19:30 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A8CCC061573
        for <linux-tegra@vger.kernel.org>; Wed, 24 Jun 2020 09:19:30 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id y13so1584443lfe.9
        for <linux-tegra@vger.kernel.org>; Wed, 24 Jun 2020 09:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=pX0FE2pruxCmGbc7po0OO3uVNfrMtxmulURMCyZqXps=;
        b=ObM3u3i9K4I3BBVhuiNHolAVNzOJB0vufvA54esnWVbE4nFGfYPQENdsEREJu1SCd4
         Yy/NQC5qsEwyvPPzhX9fgogAKdYQawV3m7S+SKyL+drBdSWlBhlh9k+nxZDgsamTfscR
         OMXkvv/gaZEE8ZmWW+/PyG1o6jmfKqtZN0CMA94zy67QwN/PrWl/IdtBTxqfCvPoqTdl
         C2/2u5c+TkCGG4HcP31GebfZ3e00x+/3Em2ux0lnld6aoGmwxEKKYaq7D0vPMbS3905j
         6Qkm8/0X5GWUVVQwXvgpqEdxkezndIXwKq7zQqNfFoXR7rfFL+bb+2PTyUfowXqvWPgH
         Km+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pX0FE2pruxCmGbc7po0OO3uVNfrMtxmulURMCyZqXps=;
        b=iroLHNb8gzSz3rufr2svcxkoovH2wFxxX9ZK2pQu2zzxbV/PP29pNlEHxTYFZROso3
         2D9e/J+4lmBPkeEVXPBC/6hXu5N9fDTUBv2v2pxbefog2Xthgpzs1i/os0pcA/aBE9yF
         WUDHVk0HPKWYaPgHQYGCyd9o0KWcya/IzMINOWw5BgXrAyObrD7/vKF0LIWoDELx/Zt1
         +i5Qf3P20Gqs71n8PmA1y/IcJtsbW8SJQb5am0QmkNNSZezQJx7DEQ725ZbdszbkPNd5
         vdX7XmZCkIGAt0wilY8eV0LuBbUG/loxLY1OwmHeElQ4j76g9Mr+FnHPj4MZg8+jYtFq
         wZYg==
X-Gm-Message-State: AOAM532Bao0us1ezh9+RRqDhMnRhX6K+I4hhW7hBYXBh1xk1Rd/sliFQ
        xbkDZmmiVpgBZQuIwdV7rxU=
X-Google-Smtp-Source: ABdhPJxWK5KUXfLN3kFUMfFXiXwIpoNSsVDETtU25RLpKpjIeU6KhHap8bTf+vJRpxe/42RRsfl2mQ==
X-Received: by 2002:ac2:4c2a:: with SMTP id u10mr15613278lfq.168.1593015568679;
        Wed, 24 Jun 2020 09:19:28 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru. [79.139.237.54])
        by smtp.googlemail.com with ESMTPSA id p14sm5285276lfh.32.2020.06.24.09.19.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2020 09:19:28 -0700 (PDT)
Subject: Re: [PATCH 12/73] ARM: tegra: Drop display controller parent clocks
 on Tegra114
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Jon Hunter <jonathanh@nvidia.com>
References: <20200616135238.3001888-1-thierry.reding@gmail.com>
 <20200616135238.3001888-13-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <0bc2ec0e-f863-207a-d61b-058503598139@gmail.com>
Date:   Wed, 24 Jun 2020 19:19:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200616135238.3001888-13-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

16.06.2020 16:51, Thierry Reding пишет:
> From: Thierry Reding <treding@nvidia.com>
> 
> The parent clocks are determined by the output that will be used, not by
> the display controller that drives the output. Drop the parent clocks
> from the display controller device tree nodes.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  arch/arm/boot/dts/tegra114.dtsi | 10 ++++------
>  arch/arm/boot/dts/tegra124.dtsi | 10 ++++------
>  arch/arm/boot/dts/tegra20.dtsi  | 10 ++++------
>  arch/arm/boot/dts/tegra30.dtsi  | 10 ++++------
>  4 files changed, 16 insertions(+), 24 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi
> index a06b88b01ef3..23df7a5f37d3 100644
> --- a/arch/arm/boot/dts/tegra114.dtsi
> +++ b/arch/arm/boot/dts/tegra114.dtsi
> @@ -59,9 +59,8 @@ dc@54200000 {
>  			compatible = "nvidia,tegra114-dc";
>  			reg = <0x54200000 0x00040000>;
>  			interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&tegra_car TEGRA114_CLK_DISP1>,
> -				 <&tegra_car TEGRA114_CLK_PLL_P>;
> -			clock-names = "dc", "parent";
> +			clocks = <&tegra_car TEGRA114_CLK_DISP1>;
> +			clock-names = "dc";
>  			resets = <&tegra_car 27>;
>  			reset-names = "dc";
>  
> @@ -78,9 +77,8 @@ dc@54240000 {
>  			compatible = "nvidia,tegra114-dc";
>  			reg = <0x54240000 0x00040000>;
>  			interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&tegra_car TEGRA114_CLK_DISP2>,
> -				 <&tegra_car TEGRA114_CLK_PLL_P>;
> -			clock-names = "dc", "parent";
> +			clocks = <&tegra_car TEGRA114_CLK_DISP2>;
> +			clock-names = "dc";
>  			resets = <&tegra_car 26>;
>  			reset-names = "dc";
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
>  
> diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
> index f0a172c61b26..8b6909839f59 100644
> --- a/arch/arm/boot/dts/tegra20.dtsi
> +++ b/arch/arm/boot/dts/tegra20.dtsi
> @@ -103,9 +103,8 @@ dc@54200000 {
>  			compatible = "nvidia,tegra20-dc";
>  			reg = <0x54200000 0x00040000>;
>  			interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&tegra_car TEGRA20_CLK_DISP1>,
> -				 <&tegra_car TEGRA20_CLK_PLL_P>;
> -			clock-names = "dc", "parent";
> +			clocks = <&tegra_car TEGRA20_CLK_DISP1>;
> +			clock-names = "dc";
>  			resets = <&tegra_car 27>;
>  			reset-names = "dc";
>  
> @@ -120,9 +119,8 @@ dc@54240000 {
>  			compatible = "nvidia,tegra20-dc";
>  			reg = <0x54240000 0x00040000>;
>  			interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&tegra_car TEGRA20_CLK_DISP2>,
> -				 <&tegra_car TEGRA20_CLK_PLL_P>;
> -			clock-names = "dc", "parent";
> +			clocks = <&tegra_car TEGRA20_CLK_DISP2>;
> +			clock-names = "dc";
>  			resets = <&tegra_car 26>;
>  			reset-names = "dc";
>  
> diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
> index 27000f0ba35b..23fedb76e5ae 100644
> --- a/arch/arm/boot/dts/tegra30.dtsi
> +++ b/arch/arm/boot/dts/tegra30.dtsi
> @@ -200,9 +200,8 @@ dc@54200000 {
>  			compatible = "nvidia,tegra30-dc", "nvidia,tegra20-dc";
>  			reg = <0x54200000 0x00040000>;
>  			interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&tegra_car TEGRA30_CLK_DISP1>,
> -				 <&tegra_car TEGRA30_CLK_PLL_P>;
> -			clock-names = "dc", "parent";
> +			clocks = <&tegra_car TEGRA30_CLK_DISP1>;
> +			clock-names = "dc";
>  			resets = <&tegra_car 27>;
>  			reset-names = "dc";
>  
> @@ -219,9 +218,8 @@ dc@54240000 {
>  			compatible = "nvidia,tegra30-dc";
>  			reg = <0x54240000 0x00040000>;
>  			interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&tegra_car TEGRA30_CLK_DISP2>,
> -				 <&tegra_car TEGRA30_CLK_PLL_P>;
> -			clock-names = "dc", "parent";
> +			clocks = <&tegra_car TEGRA30_CLK_DISP2>;
> +			clock-names = "dc";
>  			resets = <&tegra_car 26>;
>  			reset-names = "dc";
>  
> 

Hello Thierry,

Tegra DRM fails to probe after this change using next-20200624 on T20/30
(T124 also should be broken):

 tegra-dc 54200000.dc: failed to get parent clock
 tegra-dc 54200000.dc: failed to probe RGB output: -2

BTW, the commit's title is misleading since the patch touches all SoCs
and not only the T114.

Please correct or drop this patch, thanks in advance.

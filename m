Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1BCA1B0EC4
	for <lists+linux-tegra@lfdr.de>; Mon, 20 Apr 2020 16:43:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726386AbgDTOnz (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 20 Apr 2020 10:43:55 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:1143 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725971AbgDTOnz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 20 Apr 2020 10:43:55 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e9db4b80000>; Mon, 20 Apr 2020 07:42:00 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 20 Apr 2020 07:43:54 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 20 Apr 2020 07:43:54 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 20 Apr
 2020 14:43:54 +0000
Received: from [10.26.73.5] (172.20.13.39) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 20 Apr
 2020 14:43:53 +0000
Subject: Re: [PATCH 2/2] arm64: tegra: Make the RTC a wakeup source on Jetson
 TX2
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-tegra@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20200417171117.2556374-1-thierry.reding@gmail.com>
 <20200417171117.2556374-2-thierry.reding@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <07d3ac3a-cfa1-16f3-0401-df478c8e9831@nvidia.com>
Date:   Mon, 20 Apr 2020 15:43:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200417171117.2556374-2-thierry.reding@gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1587393720; bh=fJb/HqacmO/rgtSuw6cejOcM6XXVC4/j8qZ6OGkhHYA=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=YQjjVli+wkx4+/tN0Mc2CEavS4pgQ4+lfFBFdP2iTzdzl4P0Jpt7IuFk9NPs6q+r0
         pX6kFiQRoE6hx6s4FYucPC6CpyxM7CktOnuxoqOHKdkS5c9fcxrHzBNdhobEF1wwQD
         esmi0gWWor3VdhtF7OElBUzAszQK83MS2DgH1eRRd9ZqlJOkObut76nAw2Ye9uKY3W
         SZCRtomoOHglbagk2cyw6/F1mJu20qU3LCQWmWhopcT44uMx+yQYV0HJnC11EG9tNu
         qWeobI2gkrrYMVZ80oicMXGTzR0zirXvnjFaCSYo3df1U6QPwbG9S+H0vtF7T5rxY+
         y95BShjwsFWJw==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 17/04/2020 18:11, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The RTC found on the MAX77620 PMIC can be used as a wakeup source on
> Jetson TX2, which is useful to wake the system from suspend at a given
> time.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
> index da96de04d003..7a0fa157f48c 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
> @@ -221,7 +221,8 @@ pmic: pmic@3c {
>  				compatible = "maxim,max77620";
>  				reg = <0x3c>;
>  
> -				interrupts = <GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupt-parent = <&pmc>;
> +				interrupts = <24 IRQ_TYPE_LEVEL_LOW>;
>  				#interrupt-cells = <2>;
>  				interrupt-controller;
>  
> @@ -379,6 +380,10 @@ vdd_pex: ldo8 {
>  						regulator-max-microvolt = <1050000>;
>  					};
>  				};
> +
> +				rtc {
> +					wakeup-source;
> +				};
>  			};
>  		};
>  	};
> 


Acked-by: Jon Hunter <jonathanh@nvidia.com>
Tested-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic

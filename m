Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CB441FBEE6
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Jun 2020 21:24:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729941AbgFPTYP (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 Jun 2020 15:24:15 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:15424 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728861AbgFPTYP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Jun 2020 15:24:15 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ee91c2e0000>; Tue, 16 Jun 2020 12:23:26 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 16 Jun 2020 12:24:15 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 16 Jun 2020 12:24:15 -0700
Received: from [10.26.75.222] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 16 Jun
 2020 19:24:14 +0000
Subject: Re: [PATCH 03/73] ARM: tegra: Remove simple regulators bus
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-tegra@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20200616135238.3001888-1-thierry.reding@gmail.com>
 <20200616135238.3001888-4-thierry.reding@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <cf8eb9d4-70d5-400f-ecc8-2139c25563a9@nvidia.com>
Date:   Tue, 16 Jun 2020 20:24:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200616135238.3001888-4-thierry.reding@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1592335406; bh=IgcYSTEZup91mLMIxzY/KXwrtl0zNB5vnKc+awAbO0w=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=DayI5ToxF82lUpY6WwCokaxcDFhh7HDvmDjr2gWthHSMl9QaSgk834VcLOd4TqPb6
         0pyXrv0z381nreB89mUEA+gPP+uFoTDRaNyxBfgUVpzI2Oa7ZjjDvweEBdx283R8t0
         TCINkSWe8q5sUb32+SJFnjy3aUpVrQTFTPDIhh25SXoKU2jzbNmqX598WYlpJE47I0
         zTpgWcf6dM1GmGPjVqWS5gDEaMqtz8+WYJkyr3dw8pmn5eFG8OCVJBhhf/SCjkjyen
         EnnPTZFCNWkQBZq8ii8IE6VOrwcZ539uAdcDRc+pjP+I/UmRT/dD6hDeI/dBz0n+Z1
         0AzS6dH+3fA4g==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 16/06/2020 14:51, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The standard way to do this is to list out the regulators at the top
> level. Adopt the standard way to fix validation.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  arch/arm/boot/dts/tegra114-dalmore.dts    | 129 +++++------
>  arch/arm/boot/dts/tegra114-roth.dts       | 120 +++++-----
>  arch/arm/boot/dts/tegra114-tn7.dts        |  65 +++---
>  arch/arm/boot/dts/tegra124-jetson-tk1.dts | 238 +++++++++----------
>  arch/arm/boot/dts/tegra124-nyan.dtsi      | 259 ++++++++++-----------
>  arch/arm/boot/dts/tegra124-venice2.dts    | 265 ++++++++++------------
>  arch/arm/boot/dts/tegra20-harmony.dts     | 121 +++++-----
>  arch/arm/boot/dts/tegra20-medcom-wide.dts |  66 +++---
>  arch/arm/boot/dts/tegra20-paz00.dts       |  38 ++--
>  arch/arm/boot/dts/tegra20-plutux.dts      |  66 +++---
>  arch/arm/boot/dts/tegra20-seaboard.dts    | 125 +++++-----
>  arch/arm/boot/dts/tegra20-tamonten.dtsi   |  39 +---
>  arch/arm/boot/dts/tegra20-tec.dts         |  66 +++---
>  arch/arm/boot/dts/tegra20-trimslice.dts   |  85 +++----
>  arch/arm/boot/dts/tegra20-ventana.dts     |  85 +++----
>  arch/arm/boot/dts/tegra30-beaver.dts      | 193 ++++++++--------
>  arch/arm/boot/dts/tegra30-cardhu-a02.dts  | 128 +++++------
>  arch/arm/boot/dts/tegra30-cardhu-a04.dts  | 149 ++++++------
>  arch/arm/boot/dts/tegra30-cardhu.dtsi     | 261 ++++++++++-----------
>  19 files changed, 1130 insertions(+), 1368 deletions(-)

...

> diff --git a/arch/arm/boot/dts/tegra124-venice2.dts b/arch/arm/boot/dts/tegra124-venice2.dts
> index 6a7a31c831c5..effdb303c7f7 100644
> --- a/arch/arm/boot/dts/tegra124-venice2.dts
> +++ b/arch/arm/boot/dts/tegra124-venice2.dts
> @@ -1077,164 +1077,145 @@ power {
>  
>  	panel: panel {
>  		compatible = "lg,lp129qe";
> -
> +		power-supply = <&vdd_3v3_panel>;
>  		backlight = <&backlight>;
>  		ddc-i2c-bus = <&dpaux>;
>  	};

Is this meant to be in this patch?

> diff --git a/arch/arm/boot/dts/tegra20-tamonten.dtsi b/arch/arm/boot/dts/tegra20-tamonten.dtsi
> index 20137fc578b1..95e6bccdb4f6 100644
> --- a/arch/arm/boot/dts/tegra20-tamonten.dtsi
> +++ b/arch/arm/boot/dts/tegra20-tamonten.dtsi
> @@ -495,40 +495,25 @@ usb-phy@c5008000 {
>  		status = "okay";
>  	};
>  
> -	sdhci@c8000600 {
> +	mmc@c8000600 {
>  		cd-gpios = <&gpio TEGRA_GPIO(H, 2) GPIO_ACTIVE_LOW>;
>  		wp-gpios = <&gpio TEGRA_GPIO(H, 3) GPIO_ACTIVE_HIGH>;
>  		bus-width = <4>;
>  		status = "okay";
>  	};
>  
> -	clocks {
> -		compatible = "simple-bus";
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -
> -		clk32k_in: clock@0 {
> -			compatible = "fixed-clock";
> -			reg = <0>;
> -			#clock-cells = <0>;
> -			clock-frequency = <32768>;
> -		};
> +	clk32k_in: clock@0 {
> +		compatible = "fixed-clock";
> +		clock-frequency = <32768>;
> +		#clock-cells = <0>;
>  	};

The above appears in to be in the wrong patch.

> diff --git a/arch/arm/boot/dts/tegra30-cardhu-a02.dts b/arch/arm/boot/dts/tegra30-cardhu-a02.dts
> index a02ec5082287..4899e05a0d9c 100644
> --- a/arch/arm/boot/dts/tegra30-cardhu-a02.dts
> +++ b/arch/arm/boot/dts/tegra30-cardhu-a02.dts
> @@ -9,87 +9,75 @@ / {
>  	model = "NVIDIA Tegra30 Cardhu A02 evaluation board";
>  	compatible = "nvidia,cardhu-a02", "nvidia,cardhu", "nvidia,tegra30";
>  
> -	sdhci@78000400 {
> +	mmc@78000400 {
>  		status = "okay";
>  		power-gpios = <&gpio TEGRA_GPIO(D, 4) GPIO_ACTIVE_HIGH>;
>  		bus-width = <4>;
>  		keep-power-in-suspend;
>  	};

And here.

> diff --git a/arch/arm/boot/dts/tegra30-cardhu-a04.dts b/arch/arm/boot/dts/tegra30-cardhu-a04.dts
> index 9234988624ec..c1c0ca628af1 100644
> --- a/arch/arm/boot/dts/tegra30-cardhu-a04.dts
> +++ b/arch/arm/boot/dts/tegra30-cardhu-a04.dts
> @@ -11,99 +11,86 @@ / {
>  	model = "NVIDIA Tegra30 Cardhu A04 (A05, A06, A07) evaluation board";
>  	compatible = "nvidia,cardhu-a04", "nvidia,cardhu", "nvidia,tegra30";
>  
> -	sdhci@78000400 {
> +	mmc@78000400 {
>  		status = "okay";
>  		power-gpios = <&gpio TEGRA_GPIO(D, 3) GPIO_ACTIVE_HIGH>;
>  		bus-width = <4>;
>  		keep-power-in-suspend;
>  	};

And here.

Jon

-- 
nvpublic

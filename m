Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D920430A76
	for <lists+linux-tegra@lfdr.de>; Fri, 31 May 2019 10:38:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726275AbfEaIiw (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 31 May 2019 04:38:52 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:7861 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726002AbfEaIiv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 31 May 2019 04:38:51 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cf0e8110000>; Fri, 31 May 2019 01:38:41 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Fri, 31 May 2019 01:38:51 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Fri, 31 May 2019 01:38:51 -0700
Received: from [10.21.132.148] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 31 May
 2019 08:38:49 +0000
Subject: Re: [PATCH] arm64: tegra: Add pin control states for I2C on Tegra186
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-tegra@vger.kernel.org>
References: <20190527103505.8384-1-thierry.reding@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <87c513ba-1af2-3003-852d-02d7a9e1d262@nvidia.com>
Date:   Fri, 31 May 2019 09:38:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190527103505.8384-1-thierry.reding@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1559291921; bh=bO6zB6nzzIQ/APBFwA9ZKjdgOe2T0WsY0KRMl8Mcrzc=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=PsdxCm1kZDy9Icu3PNhl4yPMArmkGQhmO6cJUo0QLbz8etJnNJsw2xG/VjsbCksE4
         wspmnXkleneOadOYpA9Hy1Fjt3czPeLbb/7OSp6FRagqgojZ7D+2uRl35ezw2x3E7W
         QsvVLS9bYr3lP33vmg9EyULVctBBcVLQ8FaSlAtHmFuyA9SHViKvRfAgUfvG8L10TO
         sEw1bpD12DHq7ATrDPp1KiQwt4MCyZ7/VMbiXj1yF4UjGcUhct8JN52HwdffoyGw7D
         kU99J84bABdGVV+toPIke2t06ddXtZa+SDGWedlRSa3CDgv6shwthad8tkkxFqzwf0
         wLgfA5r1roFtQ==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 27/05/2019 11:35, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Two of the Tegra I2C controllers share pads with the DPAUX controllers.
> In order for the I2C controllers to use these pads, they have to be set
> into I2C mode. Use the I2C and off pin control states defined in the DT
> nodes for DPAUX as "default" and "idle" states, respectively. This
> ensures that the I2C controller driver can properly configure the pins
> when it needs to perform I2C transactions.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra186.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
> index 426ac0bdf6a6..00bd4ce80fa3 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
> @@ -173,6 +173,9 @@
>  		clock-names = "div-clk";
>  		resets = <&bpmp TEGRA186_RESET_I2C4>;
>  		reset-names = "i2c";
> +		pinctrl-names = "default", "idle";
> +		pinctrl-0 = <&state_dpaux1_i2c>;
> +		pinctrl-1 = <&state_dpaux1_off>;
>  		status = "disabled";
>  	};
>  
> @@ -201,6 +204,9 @@
>  		clock-names = "div-clk";
>  		resets = <&bpmp TEGRA186_RESET_I2C6>;
>  		reset-names = "i2c";
> +		pinctrl-names = "default", "idle";
> +		pinctrl-0 = <&state_dpaux_i2c>;
> +		pinctrl-1 = <&state_dpaux_off>;
>  		status = "disabled";
>  	};

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic

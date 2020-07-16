Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AB0B222335
	for <lists+linux-tegra@lfdr.de>; Thu, 16 Jul 2020 14:59:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728232AbgGPM7i (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 16 Jul 2020 08:59:38 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:10588 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727044AbgGPM7i (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 16 Jul 2020 08:59:38 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f104eff0000>; Thu, 16 Jul 2020 05:58:39 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 16 Jul 2020 05:59:38 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 16 Jul 2020 05:59:38 -0700
Received: from [10.26.72.186] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 16 Jul
 2020 12:59:36 +0000
Subject: Re: [PATCH] arm64: tegra: Add the GPU on Tegra194
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-tegra@vger.kernel.org>, Debarshi Dutta <ddutta@nvidia.com>,
        "Terje Bergstrom" <tbergstrom@nvidia.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20200716120138.532906-1-thierry.reding@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <3748e071-4d08-8e77-43f6-de37f5a7eb1e@nvidia.com>
Date:   Thu, 16 Jul 2020 13:59:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200716120138.532906-1-thierry.reding@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1594904319; bh=EzIBR7FWBnXxINhiPkU9PO6fGIJ+nc9k3m3BfWZ0CE8=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=eVmYoKM8j8GwFODz4TcUQMuRJPT+tCh+1wI6tyic3x0IEFGSbmqStG07WD8jXzcqW
         4EqJbVPtcOWexRUpvI8RpvXnGb+saASOdRL/WELcollGbA3RUeFf/B4m3iGWlu09Jx
         Ug3jW0VErw4Zw/NvLI4ItcALPmzPGYHCUddU3jzS/7SkeVJQ5HFxgtOF0+EuZC7QiH
         kJfZoN2fza3FFHvaryx5bD9ZyO6XdLcaSKBMWkY0c+ivqwAyb3ICu+YBquKMTZn6cr
         93GisTHAWwGiNsrRa+dJkRhDjRjzyqaOTCKqd1nwzjlU1oxEhHRVpNsLexSrPgGzAk
         Hs81f0lchjj1A==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 16/07/2020 13:01, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The GPU found on NVIDIA Tegra194 SoCs is a Volta generation GPU called
> GV11B.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra194.dtsi | 33 ++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> index 259e40469908..f559fe983ebe 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> @@ -1395,6 +1395,39 @@ sor3: sor@15bc0000 {
>  				nvidia,interface = <3>;
>  			};
>  		};
> +
> +		gpu@17000000 {
> +			compatible = "nvidia,gv11b";

I think we also need to add the to binding doc.

> +			reg = <0x17000000 0x10000000>,
> +			      <0x18000000 0x10000000>;
> +			interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "stall", "nonstall";
> +			clocks = <&bpmp TEGRA194_CLK_GPCCLK>,
> +				 <&bpmp TEGRA194_CLK_GPU_PWR>;
> +			clock-names = "gpu", "pwr";
> +			resets = <&bpmp TEGRA194_RESET_GPU>;
> +			reset-names = "gpu";
> +			status = "disabled";
> +
> +			power-domains = <&bpmp TEGRA194_POWER_DOMAIN_GPU>;
> +			interconnects = <&mc TEGRA194_MEMORY_CLIENT_NVL1R &emc>,
> +					<&mc TEGRA194_MEMORY_CLIENT_NVL1RHP &emc>,
> +					<&mc TEGRA194_MEMORY_CLIENT_NVL1W &emc>,
> +					<&mc TEGRA194_MEMORY_CLIENT_NVL2R &emc>,
> +					<&mc TEGRA194_MEMORY_CLIENT_NVL2RHP &emc>,
> +					<&mc TEGRA194_MEMORY_CLIENT_NVL2W &emc>,
> +					<&mc TEGRA194_MEMORY_CLIENT_NVL3R &emc>,
> +					<&mc TEGRA194_MEMORY_CLIENT_NVL3RHP &emc>,
> +					<&mc TEGRA194_MEMORY_CLIENT_NVL3W &emc>,
> +					<&mc TEGRA194_MEMORY_CLIENT_NVL4R &emc>,
> +					<&mc TEGRA194_MEMORY_CLIENT_NVL4RHP &emc>,
> +					<&mc TEGRA194_MEMORY_CLIENT_NVL4W &emc>;
> +			interconnect-names = "dma-mem", "read-0-hp", "write-0",
> +					     "read-1", "read-1-hp", "write-1",
> +					     "read-2", "read-2-hp", "write-2",
> +					     "read-3", "read-3-hp", "write-3";
> +		};
>  	};

I also see that for gv11b we populate 'dma-coherent' and so we should
probably add this as well.

Cheers
Jon

-- 
nvpublic

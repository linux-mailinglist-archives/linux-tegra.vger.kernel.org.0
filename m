Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7E0216600E
	for <lists+linux-tegra@lfdr.de>; Thu, 20 Feb 2020 15:53:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728295AbgBTOw7 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 20 Feb 2020 09:52:59 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:14321 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727979AbgBTOw6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 20 Feb 2020 09:52:58 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e4e9d3c0000>; Thu, 20 Feb 2020 06:52:44 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 20 Feb 2020 06:52:58 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 20 Feb 2020 06:52:58 -0800
Received: from [10.21.133.51] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 20 Feb
 2020 14:52:54 +0000
Subject: Re: [PATCH v3 10/10] arm64: defconfig: enable AHUB components for
 Tegra210 and later
To:     Sameer Pujar <spujar@nvidia.com>, <perex@perex.cz>,
        <tiwai@suse.com>, <robh+dt@kernel.org>
CC:     <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <thierry.reding@gmail.com>, <digetx@gmail.com>,
        <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sharadg@nvidia.com>, <mkumard@nvidia.com>,
        <viswanathl@nvidia.com>, <rlokhande@nvidia.com>,
        <dramesh@nvidia.com>, <atalambedu@nvidia.com>
References: <1582180492-25297-1-git-send-email-spujar@nvidia.com>
 <1582180492-25297-11-git-send-email-spujar@nvidia.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <78372fd0-63ed-ea92-874f-ae1d3b78b54e@nvidia.com>
Date:   Thu, 20 Feb 2020 14:52:52 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1582180492-25297-11-git-send-email-spujar@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1582210364; bh=zmkbVTyHDygsEOYlw9xj44yT1CKVWjor4rEVV0hpu/U=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=rW2hLniGp4lwV2eqjP1d4q93tJq+WYoVziVdy1ge4OR0YOsH1ta2Zi3iHAtleWDh7
         3/d9W+rCFi1Fhmp3yhwiEgS7h+8HtS9GyVMZOwPICkqqcliVo2vCLEePvZB/askyGB
         IWqD2WTU1c3lqqKLPjpUSLbhuxcahSODn5ksTydj633AvNpbjWDoQE5Hdik0QkAJr0
         seX9hQv4B5+ZT4cpQ7V1X8ZuFv1/VPqlpF9tecKsOOlSzY8YyvPJmuRCUmXjAV711X
         A2efpEYTqcnOT0O5IxBP4Pl0OUGwASpt4E/esSSQIL7jrcj6T7rQ1kdVXVw4YMDOQQ
         Hbdaxb1mBS2JA==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 20/02/2020 06:34, Sameer Pujar wrote:
> This patch enables following configs:
>  +CONFIG_TEGRA_ACONNECT=m
>  +CONFIG_SND_SOC_TEGRA=m
>  +CONFIG_SND_SOC_TEGRA210_AHUB=m
>  +CONFIG_SND_SOC_TEGRA210_DMIC=m
>  +CONFIG_SND_SOC_TEGRA210_I2S=m
>  +CONFIG_SND_SOC_TEGRA186_DSPK=m
>  +CONFIG_SND_SOC_TEGRA210_ADMAIF=m
> 
> This patch helps to register AHUB and its clients (I2S, DMIC, DSPK, ADMAIF)
> with ASoC core. Since AHUB is child of ACONNECT, config TEGRA_ACONNECT is
> enabled as well.
> 
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> ---
>  arch/arm64/configs/defconfig | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index c8801be..784ca4f 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -207,6 +207,7 @@ CONFIG_FW_LOADER_USER_HELPER=y
>  CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y
>  CONFIG_HISILICON_LPC=y
>  CONFIG_SIMPLE_PM_BUS=y
> +CONFIG_TEGRA_ACONNECT=m
>  CONFIG_MTD=y
>  CONFIG_MTD_BLOCK=y
>  CONFIG_MTD_RAW_NAND=y
> @@ -590,6 +591,12 @@ CONFIG_SND_SOC_RK3399_GRU_SOUND=m
>  CONFIG_SND_SOC_SAMSUNG=y
>  CONFIG_SND_SOC_RCAR=m
>  CONFIG_SND_SUN4I_SPDIF=m
> +CONFIG_SND_SOC_TEGRA=m
> +CONFIG_SND_SOC_TEGRA210_AHUB=m
> +CONFIG_SND_SOC_TEGRA210_DMIC=m
> +CONFIG_SND_SOC_TEGRA210_I2S=m
> +CONFIG_SND_SOC_TEGRA186_DSPK=m
> +CONFIG_SND_SOC_TEGRA210_ADMAIF=m
>  CONFIG_SND_SOC_AK4613=m
>  CONFIG_SND_SOC_ES7134=m
>  CONFIG_SND_SOC_ES7241=m

Thanks!

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic

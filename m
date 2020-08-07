Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C386823EB9B
	for <lists+linux-tegra@lfdr.de>; Fri,  7 Aug 2020 12:35:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728245AbgHGKff (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 7 Aug 2020 06:35:35 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:5077 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726511AbgHGKfe (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 7 Aug 2020 06:35:34 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f2d2e110001>; Fri, 07 Aug 2020 03:33:53 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Fri, 07 Aug 2020 03:35:34 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Fri, 07 Aug 2020 03:35:34 -0700
Received: from [10.26.73.183] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 7 Aug
 2020 10:35:29 +0000
Subject: Re: [PATCH v5 10/11] arm64: tegra: Enable ACONNECT, ADMA and AGIC on
 Jetson Nano
To:     Sameer Pujar <spujar@nvidia.com>, <broonie@kernel.org>,
        <perex@perex.cz>, <tiwai@suse.com>,
        <kuninori.morimoto.gx@renesas.com>, <robh+dt@kernel.org>,
        <lgirdwood@gmail.com>
CC:     <thierry.reding@gmail.com>, <digetx@gmail.com>,
        <alsa-devel@alsa-project.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <sharadg@nvidia.com>,
        <mkumard@nvidia.com>, <viswanathl@nvidia.com>,
        <rlokhande@nvidia.com>, <dramesh@nvidia.com>,
        <atalambedu@nvidia.com>, <nwartikar@nvidia.com>,
        <swarren@nvidia.com>, <nicoleotsuka@gmail.com>
References: <1595134890-16470-1-git-send-email-spujar@nvidia.com>
 <1595134890-16470-11-git-send-email-spujar@nvidia.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <09d7a726-6340-b2cc-ab0f-65be9e3cf625@nvidia.com>
Date:   Fri, 7 Aug 2020 11:35:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1595134890-16470-11-git-send-email-spujar@nvidia.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1596796433; bh=1t9Lg31PNb6XgN83QFj6fug+yIbeZ1/mCbboRHs0D18=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=d2ullFlRAfwSJMzTLBl0fmRpQzeBryodd0uxwMZQZxggiuX1Qd25tesr8vm+CYakN
         GrxJlNDqvSjTGXz4C8eu61Cn5irFxTWpmeUVhV3VfG7UyOvQcDrQ1IihrtclsxqeCU
         8Df17oWERLpRorPP/GMG6t0b8ottL3gos6p5bWUktrJN7zI6EqX0P6O4/l5J68Ar/c
         5PPFLKP5pU3lW33vPiNXARF/b9mMR4uaueqOY+x6PG4L340RqMB06J4izfS/D9qi1m
         xC0hk5hbOyvhEG7aZ+hHvQLsgYob9cFtI5Y4LAxx9puzswneEVm8DoTKBP4P57stwY
         RtRnmmA85U3zg==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 19/07/2020 06:01, Sameer Pujar wrote:
> These devices are required for audio sub system and current patch
> ensures probe path of these devices gets tested. Later sound card
> support would be added which can use these devices at runtime.
> 
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
> index 9b63469..0325fc0 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
> +++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
> @@ -806,4 +806,16 @@
>  
>  		vin-supply = <&avdd_1v05_pll>;
>  	};
> +
> +	aconnect@702c0000 {
> +		status = "okay";
> +
> +		dma@702e2000 {
> +			status = "okay";
> +		};
> +
> +		interrupt-controller@702f9000 {
> +			status = "okay";
> +		};
> +	};
>  };
> 

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Thanks!
Jon

-- 
nvpublic

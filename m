Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A903534D3F
	for <lists+linux-tegra@lfdr.de>; Tue,  4 Jun 2019 18:29:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727408AbfFDQ3N (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 4 Jun 2019 12:29:13 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:9740 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727385AbfFDQ3N (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 4 Jun 2019 12:29:13 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cf69c4b0000>; Tue, 04 Jun 2019 09:28:59 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 04 Jun 2019 09:29:12 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 04 Jun 2019 09:29:12 -0700
Received: from [10.26.11.65] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 4 Jun
 2019 16:29:11 +0000
Subject: Re: [PATCH] arm64: tegra: Add VCC supply for GPIO expanders on Jetson
 TX2
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-tegra@vger.kernel.org>
References: <20190604152912.21458-1-thierry.reding@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <fa731f0b-3691-ee14-42a6-7b6064c5c1ba@nvidia.com>
Date:   Tue, 4 Jun 2019 17:29:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190604152912.21458-1-thierry.reding@gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1559665739; bh=ZyR+9DRMRE/TNJNj+xvB/CgvalqyQPpU+WBM1mlblBk=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=DW0++xoLc00L+nMZ2alOuq0OsKb4cHXx8ja0qWz537gF7iOAJkn0GKhS7mPAmECTU
         QhLCWLxCXHgYTjQ7HxuLNeT06751XH8KA5SH4b2PE6Qwh0+n3HWDy8H+5eAg/TZKBT
         ibdRE4ojYT0pATVA73SVnLmQPrgY7sxHSqzE4we/vOA8Shmq9lXAsBDpI+W99bKk+b
         aKUjlgtdJSehT8m+g34XMo4kce4Tw+jj7fbz03yiH0wccNV2l/8hPO32ToPdz4l6ET
         ufYDOAuptp5Rrjms74aruTpVPDcWoEDzqauZL5+QNd4i42etAiSVYF2gtMJb7WsYII
         gevd5ifiVqabQ==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 04/06/2019 16:29, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The GPIO expanders on Jetson TX2 are powered by the VDD_1V8 and
> VDD_3V3_SYS supplies, respectively. Model this in device tree so that
> the correct supplies are referenced.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
> index 5102de1dac9c..837218e83e69 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
> +++ b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
> @@ -31,6 +31,8 @@
>  
>  			#gpio-cells = <2>;
>  			gpio-controller;
> +
> +			vcc-supply = <&vdd_3v3_sys>;
>  		};
>  
>  		exp2: gpio@77 {
> @@ -43,6 +45,8 @@
>  
>  			#gpio-cells = <2>;
>  			gpio-controller;
> +
> +			vcc-supply = <&vdd_1v8>;
>  		};
>  	};

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic

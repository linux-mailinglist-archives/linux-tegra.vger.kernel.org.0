Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 341061584D
	for <lists+linux-tegra@lfdr.de>; Tue,  7 May 2019 06:19:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726000AbfEGET4 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 7 May 2019 00:19:56 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:16175 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725843AbfEGET4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 7 May 2019 00:19:56 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cd107720000>; Mon, 06 May 2019 21:20:02 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 06 May 2019 21:19:55 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 06 May 2019 21:19:55 -0700
Received: from [10.19.65.14] (172.20.13.39) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 7 May
 2019 04:19:53 +0000
From:   Bitan Biswas <bbiswas@nvidia.com>
Subject: Re: [PATCH] arm64: tegra: Disable XUSB support on Jetson TX2
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-tegra@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Jonathan Hunter <jonathanh@nvidia.com>
References: <20190506164121.4507-1-thierry.reding@gmail.com>
Message-ID: <6a439eb8-dac4-9c86-e8bb-78723ea10be1@nvidia.com>
Date:   Mon, 6 May 2019 21:19:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190506164121.4507-1-thierry.reding@gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL103.nvidia.com (172.20.187.11) To
 HQMAIL101.nvidia.com (172.20.187.10)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1557202802; bh=txRl23lnq7fLgGQ9walbl/sRaTTiTYFb+d0fYodx4Qs=;
        h=X-PGP-Universal:From:Subject:To:CC:References:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=BMFY/YJFQ0/SF55nz1P/NJyCVOKCzkFgbEMawN/khajxA0gBErF9utnvWK1uIeyF/
         L5MFxNQYt/sOwtzEqCqHEaBC5H0ludRrFJ5FPQV/XTbbObxtpR1O1cirPrCkT6JZhQ
         L5T6czUNIxZ7o0I9Vm7Qyp83rnguNHNMe3a3RQO57w+i9OIY/tNdO5Z5KtPNZc27Pq
         oLM/1Nqf3GZQKV/xwnbWxFHt2EyKBV+5ZV9XH+gBJ0rR16tBORwoYY0StiXWVQRm2j
         Rb5UY34qB19xaCyyQCTlcXz4QUN29jIk+Q0CUDjDNV3V5xN88XtAIIdPsSAKMOXSEx
         W4aeCmZ0LznHA==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 5/6/19 9:41 AM, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The recently introduced XUSB support for Jetson TX2 is causing boot, CPU
> hotplug and suspend/resume failures according to several reports.
> 
> Temporarily work around this by disabling the XUSB controller and XUSB
> pad controller nodes in device tree, while we figure out what's causing
> this.
> 
> Reported-by: Bitan Biswas <bbiswas@nvidia.com>
> Reported-by: Jonathan Hunter <jonathanh@nvidia.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>   arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
> index 75ee6cf1e1b4..14d7fea82daf 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
> +++ b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
> @@ -59,7 +59,7 @@
>   	};
>   
>   	padctl@3520000 {
> -		status = "okay";
> +		status = "disabled";
>   
>   		avdd-pll-erefeut-supply = <&vdd_1v8_pll>;
>   		avdd-usb-supply = <&vdd_3v3_sys>;
> @@ -137,7 +137,7 @@
>   	};
>   
>   	usb@3530000 {
> -		status = "okay";
> +		status = "disabled";
>   
>   		phys = <&{/padctl@3520000/pads/usb2/lanes/usb2-0}>,
>   		       <&{/padctl@3520000/pads/usb2/lanes/usb2-1}>,
> 
Verified with this patch that Jetson TX2 core power is again turning off 
and suspend mode is entered with additional Tegra186 suspend patches 
from below patch list under review :
http://patchwork.ozlabs.org/project/linux-tegra/list/?series=78866



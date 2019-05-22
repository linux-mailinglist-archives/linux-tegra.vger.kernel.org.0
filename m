Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37484263C0
	for <lists+linux-tegra@lfdr.de>; Wed, 22 May 2019 14:25:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728438AbfEVMZy (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 22 May 2019 08:25:54 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:19745 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727975AbfEVMZy (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 22 May 2019 08:25:54 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ce53fd20000>; Wed, 22 May 2019 05:25:54 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Wed, 22 May 2019 05:25:53 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Wed, 22 May 2019 05:25:53 -0700
Received: from [10.21.132.148] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 22 May
 2019 12:25:51 +0000
Subject: Re: [PATCH 1/4] arm64: tegra: Clarify that P2771 is the Jetson TX2
 Developer Kit
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     Anuj Gangwar <anujg@nvidia.com>, Bibek Basu <bbasu@nvidia.com>,
        <linux-tegra@vger.kernel.org>
References: <20190522075412.30839-1-thierry.reding@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <f1035b07-9dff-569c-3417-35f080053f20@nvidia.com>
Date:   Wed, 22 May 2019 13:25:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190522075412.30839-1-thierry.reding@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1558527954; bh=3MNIdTGPX3FrVqJ6UIGQZouDSpCPf181kRWBLI3McDk=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=Q8mY9SlPibwmJ/M7uSns2SzqJgQ4QQMuwDDkxeCRqWQYWirbfjhDyayePrEgcI3yp
         NkOsr/TM+nrgE6yHeBfdhBH8QckNASJoCRcjK8bQYxKH2PoBw3j+omqfmZ3I9znOE6
         RQOL455bD0cwqlLAh6aujLVwyoR2F/mpNY5+4MosMFhu7II1jWbXRHZvQL6X/OAK7j
         3lfmoPN3qWqDoWouiH8CLkH5iKu/nFF1p4gs0oZdj2FyVCo1HSlg+f85fQgww1z2hD
         sDgg+Z2xj8Qhr/VKL08GpdZ9rKGvpVGtgTQ903YHWUP9AGYIdT4NFB/b0cgjMKmHih
         W3sYzrNwMjq9Q==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 22/05/2019 08:54, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> P2771 is the internal part number for the Jetson TX2 Developer Kit.
> Clarify that using the DT model property.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
> index dfc206dd6fbb..5102de1dac9c 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
> +++ b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
> @@ -7,7 +7,7 @@
>  #include "tegra186-p3310.dtsi"
>  
>  / {
> -	model = "NVIDIA Tegra186 P2771-0000 Development Board";
> +	model = "NVIDIA Jetson TX2 Developer Kit";
>  	compatible = "nvidia,p2771-0000", "nvidia,tegra186";
>  
>  	i2c@3160000 {

For the series ...

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic

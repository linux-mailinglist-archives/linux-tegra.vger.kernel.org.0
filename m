Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B2CB4B654
	for <lists+linux-tegra@lfdr.de>; Wed, 19 Jun 2019 12:40:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727085AbfFSKkD (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 19 Jun 2019 06:40:03 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:2368 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726826AbfFSKkD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 19 Jun 2019 06:40:03 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d0a11020000>; Wed, 19 Jun 2019 03:40:02 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 19 Jun 2019 03:40:02 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 19 Jun 2019 03:40:02 -0700
Received: from [10.21.132.148] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 19 Jun
 2019 10:40:01 +0000
Subject: Re: [PATCH 2/4] arm64: tegra: Add ID EEPROM for Jetson TX2 Developer
 Kit
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-tegra@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20190613165331.8689-1-thierry.reding@gmail.com>
 <20190613165331.8689-2-thierry.reding@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <9c343fc9-1a36-eaab-a7ed-8a2854c2cba4@nvidia.com>
Date:   Wed, 19 Jun 2019 11:39:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190613165331.8689-2-thierry.reding@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1560940802; bh=x4Ai6oCbO0UlvVCFVFIAqKetNkQjUL4uk1mPJ7hZ2kc=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=WAj7+llYtRNBnC4wpWfNgGgkZyvTB3IrsKizkeEnmYFAqkZcfvzUWBsCvOEGpJbRo
         FsDodnkqty7q5eIcHe6W/3mXAd6ameNqHc0j4GANDaWWoVas1J06t9Glwut5iepXTW
         JIhBZY4uT3pXnH5ZLfCkjgvyGRnqurTHMZf/QVZBLrb1oL3HYskkar/3u6HCMO6DCW
         xT7dTebee6dTwGTI2nnXYFQUV9WNRwgRDMK3G3S9vtO1dBBjCFnZKmMgg7AMtYURGB
         9tABFyOhBrbII+kXnkjJxflF5c3tf0H537FoqW3erbLcIyASP7vFEAplQAr4rADvKX
         kXpDVqpizviZg==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 13/06/2019 17:53, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> There is an ID EEPROM on the Jetson TX2 carrier board, part of the
> Jetson TX2 Developer Kit, that exposes information that can be used to
> identify the carrier board. Add the device tree node so that operating
> systems can access this EEPROM.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
> index 837218e83e69..ab6648c72ad5 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
> +++ b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
> @@ -149,6 +149,19 @@
>  		phy-names = "usb2-0", "usb2-1", "usb3-0";
>  	};
>  
> +	i2c@c250000 {
> +		/* carrier board ID EEPROM */
> +		eeprom@57 {
> +			compatible = "atmel,24c02";
> +			reg = <0x57>;
> +
> +			address-bits = <8>;
> +			page-size = <8>;
> +			size = <256>;
> +			read-only;
> +		};
> +	};
> +
>  	pcie@10003000 {
>  		status = "okay";


Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon


-- 
nvpublic

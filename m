Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3F084B657
	for <lists+linux-tegra@lfdr.de>; Wed, 19 Jun 2019 12:40:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727085AbfFSKkn (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 19 Jun 2019 06:40:43 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:6114 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726826AbfFSKkn (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 19 Jun 2019 06:40:43 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d0a112b0000>; Wed, 19 Jun 2019 03:40:43 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 19 Jun 2019 03:40:42 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 19 Jun 2019 03:40:42 -0700
Received: from [10.21.132.148] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 19 Jun
 2019 10:40:41 +0000
Subject: Re: [PATCH 1/4] arm64: tegra: Add ID EEPROM for Jetson TX2 module
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-tegra@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20190613165331.8689-1-thierry.reding@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <bec2ec6d-a88e-4ebd-cef9-f0317097e618@nvidia.com>
Date:   Wed, 19 Jun 2019 11:40:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190613165331.8689-1-thierry.reding@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1560940843; bh=s96Udi+SmJdT0B/9Wp5y3qWh94REGP90zH1AEOlb8wo=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=JH6vu8dIyJs572TZa9bwXZ6G5AB+53eJoHIPUfAa3N6HsU5m85DdSE6JTB/YFsVaI
         +xrjtB892zoOsPLyjXpeOBFX4AsGnPJYFHdMiu2peAyK67UHPJk9Ly60XEgBJG7Vuy
         uzR4LRrQAmqftqhxPIMHdqXtm+HGY2SsXRgNoLS47/QBkCPIK/Hj9qU3bIIWX5dwIy
         OxP+qpqXVf70ij1mq3cLkRM5UAs3QRrIhY89OMEOI32OZ6sbLC8Yx/GtrbtwsoYwh0
         t3EwrIx0oTQDd6tLGiXUWXmZlToKZKlBc4zMttmra6rRYgt2KlO9Esp6CgzGTnY0sM
         PZgLuuiiIQ7/w==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 13/06/2019 17:53, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> There is an ID EEPROM in the Jetson TX2 module that stores various bits
> of information to indentify the module. Add the device tree node so that
> operating systems can access this EEPROM.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
> index 38ad1053f21a..4bbee83d9943 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
> @@ -124,6 +124,17 @@
>  
>  	i2c@c250000 {
>  		status = "okay";
> +
> +		/* module ID EEPROM */
> +		eeprom@50 {
> +			compatible = "atmel,24c02";
> +			reg = <0x50>;
> +
> +			address-bits = <8>;
> +			page-size = <8>;
> +			size = <256>;
> +			read-only;
> +		};
>  	};
>  
>  	rtc@c2a0000 {
> 


Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic

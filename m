Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA4BA4B648
	for <lists+linux-tegra@lfdr.de>; Wed, 19 Jun 2019 12:37:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731556AbfFSKgu (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 19 Jun 2019 06:36:50 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:2233 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726826AbfFSKgt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 19 Jun 2019 06:36:49 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d0a10400000>; Wed, 19 Jun 2019 03:36:48 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 19 Jun 2019 03:36:48 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 19 Jun 2019 03:36:48 -0700
Received: from [10.21.132.148] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 19 Jun
 2019 10:36:47 +0000
Subject: Re: [PATCH 3/4] arm64: tegra: Add ID EEPROM for Jetson TX1 module
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-tegra@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20190613165331.8689-1-thierry.reding@gmail.com>
 <20190613165331.8689-3-thierry.reding@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <ad6680d4-e9d7-f8f9-e7db-bb9e2845d9cd@nvidia.com>
Date:   Wed, 19 Jun 2019 11:36:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190613165331.8689-3-thierry.reding@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1560940608; bh=U5Go1H9xs/J4HG5pxO+H7332Ag1nZmiXz2y7AYvIgMw=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=CcUsHi0ot9dY3cUAzUu/xbR3Drx0AA2n8u90HHY+UOHwa3jT4uPEeIPjqWWXvEAoj
         Gxo6+GNlMJDzgfnHOrpliw3Zw9OO8HrMOPrjh5TBNbh3ns2ePJsgCKHi8160EQGqeU
         RysjEo70d2xS4BJhaCuhqw90mtxjv0ckZ0y5Sk7e5BpxBIZSLX0HHk6J7YhmbC5v51
         Ahi6jUV+3ZTitHliKumsh7zL5tScKjSe5Q/SXmcB+BCwo54dArWRcn17iVjsPG83m6
         Hh22b3VZV1CRc8MEB2z/anyMjA7XREsucowrIvTSiy2VCkC+GPk5Zq9eUcHs3rYIfG
         M0oMpUzCF8Ygg==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 13/06/2019 17:53, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> There is an ID EEPROM in the Jetson TX1 module that stores various bits
> of information to indentify the module. Add the device tree node so that
> operating systems can access this EEPROM.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
> index 4dcd0d36189a..e8654061ce03 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
> @@ -264,6 +264,19 @@
>  		};
>  	};
>  
> +	i2c@7000c500 {
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
> +	};
> +
>  	pmc@7000e400 {
>  		nvidia,invert-interrupt;
>  	};
> 

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic

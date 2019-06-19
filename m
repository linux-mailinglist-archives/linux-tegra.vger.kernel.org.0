Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 167934B64B
	for <lists+linux-tegra@lfdr.de>; Wed, 19 Jun 2019 12:38:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726958AbfFSKiB (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 19 Jun 2019 06:38:01 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:2296 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726826AbfFSKiA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 19 Jun 2019 06:38:00 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d0a10870001>; Wed, 19 Jun 2019 03:37:59 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 19 Jun 2019 03:37:59 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 19 Jun 2019 03:37:59 -0700
Received: from [10.21.132.148] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 19 Jun
 2019 10:37:58 +0000
Subject: Re: [PATCH 4/4] arm64: tegra: Add ID EEPROM for Jetson TX1 Developer
 Kit
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-tegra@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20190613165331.8689-1-thierry.reding@gmail.com>
 <20190613165331.8689-4-thierry.reding@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <b0c4e9c1-34d9-6293-c347-faf10f415107@nvidia.com>
Date:   Wed, 19 Jun 2019 11:37:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190613165331.8689-4-thierry.reding@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1560940679; bh=IWJMyCq1lRJDFNtyRZPM7sDG7rj6FknHUM8MFx0UpY4=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=otZ03rCbBxCaJg41lKmT7f45nQ0IeaLxHypbkAmucXPo4gMo3gIeHmyUo/Pn5Zzkn
         ljEoIguFEnJjPBngkO9t4xmvindSsWMAYfDqL4UwiaBooDOpWjvK2Kawg49b9faqCJ
         S7XF+l6MJhMke5FaA/D/74Mfz0lXV9SNy2fA0VYZ+nQZ66m8fmd9HzKFr9vLqgz9P5
         hOyDm8NWp4cKbEqS1k9hg8rQ5lY3D6zcjNhsp+r0mdojhfjgvxmDtxfUoem+23aeiL
         na1EROLF6eQHAtM+fbbWYV92XLrVKb+14Wvl5ym6pVxM4kKBtF0gBqDs5Pkz+QC/Au
         K7bIWXMppwLug==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 13/06/2019 17:53, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> There is an ID EEPROM on the Jetson TX1 carrier board, part of the
> Jetson TX1 Developer Kit, that exposes information that can be used to
> identify the carrier board. Add the device tree node so that operating
> systems can access this EEPROM.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts b/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
> index 5a57396b5948..a3cafe39ba4c 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
> +++ b/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
> @@ -79,6 +79,19 @@
>  		};
>  	};
>  
> +	i2c@7000c500 {
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
>  	clock@70110000 {
>  		status = "okay";
>  
> 


Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic

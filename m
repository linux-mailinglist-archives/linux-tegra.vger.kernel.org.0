Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A39917652
	for <lists+linux-tegra@lfdr.de>; Wed,  8 May 2019 12:53:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727207AbfEHKxw (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 8 May 2019 06:53:52 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:14436 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727205AbfEHKxw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 8 May 2019 06:53:52 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cd2b53b0000>; Wed, 08 May 2019 03:53:47 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 08 May 2019 03:53:51 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 08 May 2019 03:53:51 -0700
Received: from [10.21.132.148] (172.20.13.39) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 8 May
 2019 10:53:50 +0000
Subject: Re: [PATCH] arm64: tegra: Disable XUSB support on Jetson TX2
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-tegra@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Bitan Biswas <bbiswas@nvidia.com>
References: <20190506164121.4507-1-thierry.reding@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <cb8cb5e8-a4f3-4009-fd89-853040d6b2cd@nvidia.com>
Date:   Wed, 8 May 2019 11:53:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190506164121.4507-1-thierry.reding@gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL101.nvidia.com (172.20.187.10)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1557312827; bh=ZGRMksLXeWmojmTciiWjUXPQY3tLsE0md2MlnwBeQLM=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=QF6roRFT8n7e6xMGdARlc3FWx8nxmta1SXId9nARtAQVL69BSrWjPKIztlxa+XdQR
         DOkjGASjmkb8DZmv9aZo84byD5Dsh6Dx2G5/2K5ff0/7U8bGjBKFC26305PtUlWG0N
         I1K98c/oUIZPufdYEWmTGT6ueuk/GhO1aHFZOZrj/0ecsUeEx9Oo8GbVcSfFfdLCSW
         0ejfwL7MjjmdWG1lgTkENClLsku63yKnSzQGW4+dJPWvjxiQMBFhKFurOnXJdmrZ0Q
         3zcGPFwDWuhWTA0PYUMjeuSo4ddLPLUXrGQRsUTDxhCrf9q+q1JRMHIv15YJdNN4HM
         fJBFVS5VoZq/Q==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 06/05/2019 17:41, Thierry Reding wrote:
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
>  arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
> index 75ee6cf1e1b4..14d7fea82daf 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
> +++ b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
> @@ -59,7 +59,7 @@
>  	};
>  
>  	padctl@3520000 {
> -		status = "okay";
> +		status = "disabled";
>  
>  		avdd-pll-erefeut-supply = <&vdd_1v8_pll>;
>  		avdd-usb-supply = <&vdd_3v3_sys>;
> @@ -137,7 +137,7 @@
>  	};
>  
>  	usb@3530000 {
> -		status = "okay";
> +		status = "disabled";
>  
>  		phys = <&{/padctl@3520000/pads/usb2/lanes/usb2-0}>,
>  		       <&{/padctl@3520000/pads/usb2/lanes/usb2-1}>,
> 

Thanks.

Tested-by: Jon Hunter <jonathanh@nvidia.com>
Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic

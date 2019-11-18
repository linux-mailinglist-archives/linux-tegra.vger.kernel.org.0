Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1589E1004B9
	for <lists+linux-tegra@lfdr.de>; Mon, 18 Nov 2019 12:50:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727056AbfKRLuj (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 18 Nov 2019 06:50:39 -0500
Received: from hqemgate15.nvidia.com ([216.228.121.64]:7570 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726552AbfKRLui (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 18 Nov 2019 06:50:38 -0500
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5dd2858b0000>; Mon, 18 Nov 2019 03:50:35 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Mon, 18 Nov 2019 03:50:38 -0800
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Mon, 18 Nov 2019 03:50:38 -0800
Received: from [10.26.11.241] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 18 Nov
 2019 11:50:36 +0000
Subject: Re: [PATCH 1/3] soc/tegra: pmc: Use lower-case for hexadecimal
 literals
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>, <linux-tegra@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20191118063348.1816857-1-thierry.reding@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <823d83ea-43fe-ff95-dac4-13d0175cfc18@nvidia.com>
Date:   Mon, 18 Nov 2019 11:50:34 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191118063348.1816857-1-thierry.reding@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1574077835; bh=fW4OBLsb3fhl18/LrFjJiXznAlL7+PUeaFu8tV8alv0=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=NsNgGvVO4fkgb1rkQ7Yz6Jo1PMf1y0dW//+EdBV3Mva5GcrcU2UeT6h1K4jeDhCBV
         r3uA3Gk4+xxSSMnfwlgPYbnnAUGBaKULCNAlvp9OGUyHXpGbW9vx3fs7nXkAI2ZKDf
         j05s4kXWTeoV+jT2WD4N81nLdMoIAZnjuQadf+YW6cwjsi9+H3waXJEiyCC5RaX9or
         DRTHXwM7gY8AZhSe+0lKg7ewFbaTdACLugHISekDnEWZ4W0n3gzuCe5Y9xhePHPcN2
         DojBAV5mpI3s9KW+0cI4dG06o/0ItrfDe171vXmaVCwEPR5elJOXFwipZjmlVHB5oj
         sayPCJlyDS4NQ==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 18/11/2019 06:33, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The remainder of the file uses lower-case for hexadecimal literals, so
> change the only odd-one-out occurrence for consistency.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/soc/tegra/pmc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index 4e51248634f8..927eeecd34e5 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
> @@ -2805,7 +2805,7 @@ static const struct tegra_pmc_regs tegra186_pmc_regs = {
>  	.dpd2_status = 0x80,
>  	.rst_status = 0x70,
>  	.rst_source_shift = 0x2,
> -	.rst_source_mask = 0x3C,
> +	.rst_source_mask = 0x3c,
>  	.rst_level_shift = 0x0,
>  	.rst_level_mask = 0x3,
>  };

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers!
Jon

-- 
nvpublic

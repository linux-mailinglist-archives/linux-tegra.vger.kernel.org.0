Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C960E81D20
	for <lists+linux-tegra@lfdr.de>; Mon,  5 Aug 2019 15:30:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730535AbfHENVc (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 5 Aug 2019 09:21:32 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:14890 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728851AbfHENV3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 5 Aug 2019 09:21:29 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d482d590001>; Mon, 05 Aug 2019 06:21:29 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 05 Aug 2019 06:21:28 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 05 Aug 2019 06:21:28 -0700
Received: from HQMAIL110.nvidia.com (172.18.146.15) by HQMAIL104.nvidia.com
 (172.18.146.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 5 Aug
 2019 13:21:28 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by hqmail110.nvidia.com
 (172.18.146.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 5 Aug
 2019 13:21:28 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 5 Aug 2019 13:21:28 +0000
Received: from [10.21.24.139] (Not Verified[10.21.24.139]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5d482d560000>; Mon, 05 Aug 2019 06:21:28 -0700
Subject: Re: [PATCH] firmware: tegra: Move BPMP resume to noirq phase
To:     Vidya Sagar <vidyas@nvidia.com>, <sivaramn@nvidia.com>,
        <stefank@nvidia.com>, <treding@nvidia.com>, <jonathanh@nvidia.com>
CC:     <lorenzo.pieralisi@arm.com>, <linux-tegra@vger.kernel.org>,
        <kthota@nvidia.com>, <mmaddireddy@nvidia.com>, <sagar.tv@gmail.com>
References: <20190802061727.18177-1-vidyas@nvidia.com>
From:   Timo Alho <talho@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <3e8c3da8-c5d5-2b3b-474a-340aab9f09cb@nvidia.com>
Date:   Mon, 5 Aug 2019 16:21:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190802061727.18177-1-vidyas@nvidia.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1565011289; bh=DP1KzVIKwSZ+H9ZCG3cOo4mZCZsycyqN3lR/rJTXlrE=;
        h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
         Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:Content-Type:
         Content-Language:Content-Transfer-Encoding;
        b=Vq8woeeTvQ41Yll96eW+nNx3MLvPXI5BIhaGlwmdrHDUlyVKbdKRKRXwSGevU03kJ
         Km8CzyRK8cV6qI2tU36o9hx1gANrAc/j9maWit4sFGGyAzSb1JNup/0x/RmdsJ0nDT
         c8VSiyWHctlm5uDzAGQ/NZ/ntYlgAAxuCxC/jAjYw8CwzmwV7GQUWHItADv42CmIzj
         8kjrkr7hd1lyKtoFIyzy6va/5QMSSNjhaYO4MuOHosnKx6rtL9Eld6TFWLjV4Hs9cI
         4de0kyAtsHkqxzD6K3G6rlJ6cS3PrPx1XLcFyU5iNPOhrnx455wHdE6fLIL3oPvw6k
         MyJYs5RDHDlTA==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 2.8.2019 9.17, Vidya Sagar wrote:
> Modules like PCIe in Tegra194 need BPMP firmware services in noirq phase
> and hence move BPMP resume to noirq phase.
> This patch is verified on Tegra210, Tegra186 and Tegra194.
> 
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> ---
>   drivers/firmware/tegra/bpmp.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/tegra/bpmp.c b/drivers/firmware/tegra/bpmp.c
> index 19c56133234b..6741fcda0c37 100644
> --- a/drivers/firmware/tegra/bpmp.c
> +++ b/drivers/firmware/tegra/bpmp.c
> @@ -804,7 +804,7 @@ static int __maybe_unused tegra_bpmp_resume(struct device *dev)
>   }
>   
>   static const struct dev_pm_ops tegra_bpmp_pm_ops = {
> -	.resume_early = tegra_bpmp_resume,
> +	.resume_noirq = tegra_bpmp_resume,
>   };
>   
>   #if IS_ENABLED(CONFIG_ARCH_TEGRA_186_SOC) || \
> 

Looks good.

Reviewed-by: Timo Alho <talho@nvidia.com>

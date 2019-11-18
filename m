Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0EA2A1004BC
	for <lists+linux-tegra@lfdr.de>; Mon, 18 Nov 2019 12:51:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726563AbfKRLvB (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 18 Nov 2019 06:51:01 -0500
Received: from hqemgate16.nvidia.com ([216.228.121.65]:8613 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726464AbfKRLvB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 18 Nov 2019 06:51:01 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5dd285a50000>; Mon, 18 Nov 2019 03:51:01 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 18 Nov 2019 03:51:00 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 18 Nov 2019 03:51:00 -0800
Received: from [10.26.11.241] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 18 Nov
 2019 11:50:59 +0000
Subject: Re: [PATCH 2/3] soc/tegra: pmc: Add missing IRQ callbacks on Tegra194
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>, <linux-tegra@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20191118063348.1816857-1-thierry.reding@gmail.com>
 <20191118063348.1816857-2-thierry.reding@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <679f95e6-ea9f-2e6a-3010-fc716901b91b@nvidia.com>
Date:   Mon, 18 Nov 2019 11:50:57 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191118063348.1816857-2-thierry.reding@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1574077861; bh=/LSxaY1qzFQwQjQyDQlZdc5Z5HNcGaHiFwMG5poz0Gg=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=d8asg0HNW2OukpjeBpKjlyHwkoR3o2GnlZtJpAciC4U+oCt/JUhLUY5PLJkV3UjuP
         DYWWwuFcrAVW/TZMMxcLVBxmxwSivaw4zg6siX5mzioPmdUcPdm1W7pSaEi3vYA82B
         tXgMjbUc5h0Ef2RRKcmplMRfuT4hEXz0QID98L5M+2F7KufTSo9lCCG8bbNkhRqWv0
         K34SxTwpeEkxJUO2xkDeBt68EuRzBCeI5SxGzzSfjrz963A1ftJtJCIBkM427Zngm9
         ctqcRm773SsPFGYbDMeeZPrdOhO4a6oxcic137jxlT2nEhNeExERFhrpppdh9orO5a
         iyaDOC6YSsT9A==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 18/11/2019 06:33, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Reuse the IRQ callbacks from Tegra186 on Tegra194. This fixes failures
> to request interrupts on Tegra194 due to the missing callbacks.
> 
> Cc: Sowjanya Komatineni <skomatineni@nvidia.com>
> Fixes: aba19827fced ("soc/tegra: pmc: Support wake events on more Tegra SoCs")
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/soc/tegra/pmc.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index 927eeecd34e5..32b3e8d9155f 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
> @@ -2947,6 +2947,8 @@ static const struct tegra_pmc_soc tegra194_pmc_soc = {
>  	.regs = &tegra186_pmc_regs,
>  	.init = NULL,
>  	.setup_irq_polarity = tegra186_pmc_setup_irq_polarity,
> +	.irq_set_wake = tegra186_pmc_irq_set_wake,
> +	.irq_set_type = tegra186_pmc_irq_set_type,
>  	.num_wake_events = ARRAY_SIZE(tegra194_wake_events),
>  	.wake_events = tegra194_wake_events,
>  };
> 

Acked-by: Jon Hunter <jonathanh@nvidia.com>
Tested-by: Jon Hunter <jonathanh@nvidia.com>

Cheers!
Jon

-- 
nvpublic

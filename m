Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1430430BAA
	for <lists+linux-tegra@lfdr.de>; Fri, 31 May 2019 11:32:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726626AbfEaJcp (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 31 May 2019 05:32:45 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:1652 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726330AbfEaJcp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 31 May 2019 05:32:45 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cf0f4bb0000>; Fri, 31 May 2019 02:32:44 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Fri, 31 May 2019 02:32:44 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Fri, 31 May 2019 02:32:44 -0700
Received: from [10.21.132.148] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 31 May
 2019 09:32:42 +0000
Subject: Re: [PATCH 2/2] soc/tegra: pmc: Avoid crash for non-wake IRQs
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     Bitan Biswas <bbiswas@nvidia.com>, <linux-tegra@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20190529102654.14665-1-thierry.reding@gmail.com>
 <20190529102654.14665-2-thierry.reding@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <27ffbfe6-1c88-63a1-aee1-7fe6ce252e54@nvidia.com>
Date:   Fri, 31 May 2019 10:32:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190529102654.14665-2-thierry.reding@gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL103.nvidia.com (172.20.187.11) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1559295164; bh=wWtsD+i0WLwwLRA1MMQS7zm8F48MjkEzR7WY6EbugbM=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=ObIsDwvPJzAQmeno2iC5akkUperI34LLYpSUCob9uAzLg/jinynbVgiRu65svLJD5
         30iJVi55iW2vRfqPrNvS2Y6toG84z5TKeTDQchHzyY+yberULi433oX5GhxcUUvI6V
         g5R3b46U5/T3hg1HyelrvkVCMjal17KrDQJnkY0E1CbpIv5oLCNQxthOWNbh2z0ulg
         cnMmvfszxW7qy20tw2lAQm0buTAW6sFdVfii2pzHgev+hAqNf9kUYx5l7NKUYYKVgo
         0G9BZoTD+9exD3jqfgZOXDsvJJ9v1HO6paresWXm6UXChm1lUWNlUxhEvOD+uwZFk5
         8yp5oOM09fU8Q==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 29/05/2019 11:26, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> For interrupts that are not wakeup sources but that may end up getting
> mapped through the PMC as interrupt parent (this can happen for GPIOs),
> return early in order to avoid a subsequent crash from an out-of-bounds
> access to the register region.

Maybe worth clarifying here what you mean by 'not wakeup sources'
because the Tegra GPIO driver does have a set_wake() API to enable
wakeup at the LIC IIRC. So maybe GPIOs that are not wakeup sources for
what level of suspend?

> Reported-by: Bitan Biswas <bbiswas@nvidia.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/soc/tegra/pmc.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index 653fe2c466f6..6e66b5e293be 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
> @@ -1924,6 +1924,9 @@ static int tegra_pmc_irq_set_wake(struct irq_data *data, unsigned int on)
>  	unsigned int offset, bit;
>  	u32 value;
>  
> +	if (WARN_ON(data->hwirq == ULONG_MAX))
> +		return 0;
> +
>  	offset = data->hwirq / 32;
>  	bit = data->hwirq % 32;

Otherwise ...

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon


-- 
nvpublic

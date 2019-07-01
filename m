Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB53147FDC
	for <lists+linux-tegra@lfdr.de>; Mon, 17 Jun 2019 12:39:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726320AbfFQKjx (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 17 Jun 2019 06:39:53 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:6607 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726091AbfFQKjx (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 17 Jun 2019 06:39:53 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d076df80000>; Mon, 17 Jun 2019 03:39:52 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 17 Jun 2019 03:39:52 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 17 Jun 2019 03:39:52 -0700
Received: from [10.21.132.148] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 17 Jun
 2019 10:39:50 +0000
Subject: Re: [PATCH 2/3] clk: tegra: Warn if an enabled PLL is in IDDQ
To:     Thierry Reding <thierry.reding@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
CC:     Peter De Schrijver <pdeschrijver@nvidia.com>,
        Alex Frid <afrid@nvidia.com>, <linux-clk@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>
References: <20190613161225.2531-1-thierry.reding@gmail.com>
 <20190613161225.2531-2-thierry.reding@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <b4c8a1fe-4d68-9999-8fc9-e7db3c64525f@nvidia.com>
Date:   Mon, 17 Jun 2019 11:39:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190613161225.2531-2-thierry.reding@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL108.nvidia.com (172.18.146.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1560767992; bh=kQFk3zDZhpQES8JzjRgG2LOS80h8G3LxcbooJmrhzZo=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=Xrz7XlUiiVOX3NiIqAEhCqvDI1SjIFoSknoa9JR7oyCcO0agLLQNyBe50O5kA4yEZ
         u2NVx6K5arnufAn3JGbAN6WnBc2lKnEDUrqI3TbJJu+kBWyFSmu0i3MQ+VCV3ZrVOO
         e9S3ViBguppCLUn9b2LkOcjhijEap9jAAlQPe7rMdv6t+TBmRSXFejkboWziLyIwvD
         lT19dK/bkgdUiMheTEdcXWvSeCIk7lxgYchJAzyawoLDHQBmsrqUYmJX2JFtO6YbNn
         Ixfby82wWJ84D7M8irwoo77d5mjeySVo+cqjcF3Vp+ttOjVoSeOj9U9WcfVoqskHJG
         MrmOM195D/mWg==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 13/06/2019 17:12, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> A PLL in IDDQ doesn't work, whether it's enabled or not. This is not a
> configuration that makes sense, so warn about it.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/clk/tegra/clk-tegra210.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
> index 4904ac4a75db..793c7acaf4e2 100644
> --- a/drivers/clk/tegra/clk-tegra210.c
> +++ b/drivers/clk/tegra/clk-tegra210.c
> @@ -1003,8 +1003,12 @@ static void tegra210_pllre_set_defaults(struct tegra_clk_pll *pllre)
>  		_pll_misc_chk_default(clk_base, pllre->params, 0, val,
>  				~mask & PLLRE_MISC0_WRITE_MASK);
>  
> -		/* Enable lock detect */
> +		/* The PLL doesn't work if it's in IDDQ. */
>  		val = readl_relaxed(clk_base + pllre->params->ext_misc_reg[0]);
> +		if (val & PLLRE_MISC0_IDDQ)
> +			pr_warn("unexpected IDDQ bit set for enabled clock\n");
> +
> +		/* Enable lock detect */
>  		val &= ~mask;
>  		val |= PLLRE_MISC0_DEFAULT_VALUE & mask;
>  		writel_relaxed(val, clk_base + pllre->params->ext_misc_reg[0]);

Looks like there are a few other instances of this that could be fixed
as well.

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic

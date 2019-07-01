Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BBE747FEE
	for <lists+linux-tegra@lfdr.de>; Mon, 17 Jun 2019 12:43:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726427AbfFQKnf (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 17 Jun 2019 06:43:35 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:6722 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726174AbfFQKnf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 17 Jun 2019 06:43:35 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d076ed60001>; Mon, 17 Jun 2019 03:43:34 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 17 Jun 2019 03:43:34 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 17 Jun 2019 03:43:34 -0700
Received: from [10.21.132.148] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 17 Jun
 2019 10:43:30 +0000
Subject: Re: [PATCH 3/3] clk: tegra: Do not enable PLL_RE_VCO on Tegra210
To:     Thierry Reding <thierry.reding@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
CC:     Peter De Schrijver <pdeschrijver@nvidia.com>,
        Alex Frid <afrid@nvidia.com>, <linux-clk@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>
References: <20190613161225.2531-1-thierry.reding@gmail.com>
 <20190613161225.2531-3-thierry.reding@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <da08f3e8-65d5-7051-8ee5-b76d206cd9c5@nvidia.com>
Date:   Mon, 17 Jun 2019 11:43:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190613161225.2531-3-thierry.reding@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL108.nvidia.com (172.18.146.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1560768214; bh=oMjmLsaCco78LbUTwLXoRRUJz8wezGvJ9pb4I2FfSJ8=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=X+44mihJDEro78eEVjVIk/4lt5uLCnr2ZaYZgLahlrB3ZGeHZ1X8CmKoBEyVYUBEs
         t6gxCFTW8MeFtp6gmTNu2pLetNWFEBE/15Wtebt1+UIp4meWTyzWqx/zxgBIg5T+4+
         9zM8GwCNQpfwJmxNtE66EQ7wLFu9OMmmucUbWiUdJh5A/bcD9NwS6kIGvC3hsglh6v
         B4WoiXrlimdMZJPQCN92GaykPX4Q2R9jF9WtELEAxHnjUr8Xr0d495hl+q4Fk4xXI1
         uzcrFCYWU1ioAoHkug8mqwsrQx8hk9B8XZBm/XEd56LaH1N80ZnEhDDJsqFtcdnIG9
         g1fvCcrkEV9WA==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 13/06/2019 17:12, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> It turns out that this PLL is not used on Tegra210, so there's no need
> to enable it via the init table. Remove the init table entry for this
> PLL to avoid it getting enabled at boot time. If the bootloader enabled
> it and forgot to turn it off, the common clock framework will now know
> to disable it because it is unused.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/clk/tegra/clk-tegra210.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
> index 793c7acaf4e2..13537e4458b5 100644
> --- a/drivers/clk/tegra/clk-tegra210.c
> +++ b/drivers/clk/tegra/clk-tegra210.c
> @@ -3337,7 +3337,6 @@ static struct tegra_clk_init_table init_table[] __initdata = {
>  	{ TEGRA210_CLK_DFLL_SOC, TEGRA210_CLK_PLL_P, 51000000, 1 },
>  	{ TEGRA210_CLK_DFLL_REF, TEGRA210_CLK_PLL_P, 51000000, 1 },
>  	{ TEGRA210_CLK_SBC4, TEGRA210_CLK_PLL_P, 12000000, 1 },
> -	{ TEGRA210_CLK_PLL_RE_VCO, TEGRA210_CLK_CLK_MAX, 672000000, 1 },
>  	{ TEGRA210_CLK_XUSB_GATE, TEGRA210_CLK_CLK_MAX, 0, 1 },
>  	{ TEGRA210_CLK_XUSB_SS_SRC, TEGRA210_CLK_PLL_U_480M, 120000000, 0 },
>  	{ TEGRA210_CLK_XUSB_FS_SRC, TEGRA210_CLK_PLL_U_48M, 48000000, 0 },

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic

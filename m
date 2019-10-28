Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25833E73F2
	for <lists+linux-tegra@lfdr.de>; Mon, 28 Oct 2019 15:47:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390304AbfJ1OrM (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 28 Oct 2019 10:47:12 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:15686 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727982AbfJ1OrM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 28 Oct 2019 10:47:12 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5db6ff770000>; Mon, 28 Oct 2019 07:47:19 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 28 Oct 2019 07:47:11 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 28 Oct 2019 07:47:11 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 28 Oct
 2019 14:47:11 +0000
Received: from tbergstrom-lnx.Nvidia.com (10.124.1.5) by
 DRHQMAIL107.nvidia.com (10.27.9.16) with Microsoft SMTP Server (TLS) id
 15.0.1473.3; Mon, 28 Oct 2019 14:47:10 +0000
Received: by tbergstrom-lnx.Nvidia.com (Postfix, from userid 1000)
        id 9E003428E8; Mon, 28 Oct 2019 16:47:08 +0200 (EET)
Date:   Mon, 28 Oct 2019 16:47:08 +0200
From:   Peter De Schrijver <pdeschrijver@nvidia.com>
To:     Dmitry Osipenko <digetx@gmail.com>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "Prashant Gaikwad" <pgaikwad@nvidia.com>,
        Stephen Boyd <sboyd@kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] clk: tegra20/30: Optimize PLLX configuration restoring
Message-ID: <20191028144708.GE27141@pdeschrijver-desktop.Nvidia.com>
References: <20190922215203.32103-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20190922215203.32103-1-digetx@gmail.com>
X-NVConfidentiality: public
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1572274039; bh=KJppp2bcFVjIcgy/DqH/h7KP2DZcup8u3y5IqiTmba8=;
        h=X-PGP-Universal:Date:From:To:CC:Subject:Message-ID:References:
         MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
         X-NVConfidentiality:User-Agent:X-Originating-IP:X-ClientProxiedBy;
        b=R9SU+tX3zP5Z5XdBTr3Di+YajQBxx0ao31hHbkv0SRHQW8G//Sylr2bhCiez/iKzb
         Dd6eoRgyupYVCT5iafOfquylVZQ77GDoJPicCnqLdCO5PnToJ9qMei5/INweoZWJAN
         /AAdzmA82ivm6llBHUevXPCKuHQujSHiph1nttVlfqSieHBt6L5EJRLkw9jQVZFRca
         Mxm4OLoFqqOQ7N7jJH2yYwzXndV9R0fqdmSSHsyU1ALdgcuhBsrA9wif46yUGtAN09
         OfVgKyLTGnZt0MGdD+t+aIlzZpWWOIBOjE7lsK8HbBGbMqRwNszZhTHCSEKhdl/lx5
         rIxwCqycZ+0Aw==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Sep 23, 2019 at 12:52:03AM +0300, Dmitry Osipenko wrote:
> There is no need to re-configure PLLX if its configuration in unchanged
> on return from suspend / cpuidle, this saves 300us if PLLX is already
> enabled (common case for cpuidle).
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Acked-by: Peter De Schrijver <pdeschrijver@nvidia.com>

> ---
>  drivers/clk/tegra/clk-tegra20.c | 25 ++++++++++++++++---------
>  drivers/clk/tegra/clk-tegra30.c | 25 ++++++++++++++++---------
>  2 files changed, 32 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegra20.c
> index cceefbd67a3b..4d8222f5c638 100644
> --- a/drivers/clk/tegra/clk-tegra20.c
> +++ b/drivers/clk/tegra/clk-tegra20.c
> @@ -955,6 +955,7 @@ static void tegra20_cpu_clock_suspend(void)
>  static void tegra20_cpu_clock_resume(void)
>  {
>  	unsigned int reg, policy;
> +	u32 misc, base;
>  
>  	/* Is CPU complex already running on PLLX? */
>  	reg = readl(clk_base + CCLK_BURST_POLICY);
> @@ -968,15 +969,21 @@ static void tegra20_cpu_clock_resume(void)
>  		BUG();
>  
>  	if (reg != CCLK_BURST_POLICY_PLLX) {
> -		/* restore PLLX settings if CPU is on different PLL */
> -		writel(tegra20_cpu_clk_sctx.pllx_misc,
> -					clk_base + PLLX_MISC);
> -		writel(tegra20_cpu_clk_sctx.pllx_base,
> -					clk_base + PLLX_BASE);
> -
> -		/* wait for PLL stabilization if PLLX was enabled */
> -		if (tegra20_cpu_clk_sctx.pllx_base & (1 << 30))
> -			udelay(300);
> +		misc = readl_relaxed(clk_base + PLLX_MISC);
> +		base = readl_relaxed(clk_base + PLLX_BASE);
> +
> +		if (misc != tegra20_cpu_clk_sctx.pllx_misc ||
> +		    base != tegra20_cpu_clk_sctx.pllx_base) {
> +			/* restore PLLX settings if CPU is on different PLL */
> +			writel(tegra20_cpu_clk_sctx.pllx_misc,
> +						clk_base + PLLX_MISC);
> +			writel(tegra20_cpu_clk_sctx.pllx_base,
> +						clk_base + PLLX_BASE);
> +
> +			/* wait for PLL stabilization if PLLX was enabled */
> +			if (tegra20_cpu_clk_sctx.pllx_base & (1 << 30))
> +				udelay(300);
> +		}
>  	}
>  
>  	/*
> diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
> index a19840fac716..3b5bca44b7aa 100644
> --- a/drivers/clk/tegra/clk-tegra30.c
> +++ b/drivers/clk/tegra/clk-tegra30.c
> @@ -1135,6 +1135,7 @@ static void tegra30_cpu_clock_suspend(void)
>  static void tegra30_cpu_clock_resume(void)
>  {
>  	unsigned int reg, policy;
> +	u32 misc, base;
>  
>  	/* Is CPU complex already running on PLLX? */
>  	reg = readl(clk_base + CLK_RESET_CCLK_BURST);
> @@ -1148,15 +1149,21 @@ static void tegra30_cpu_clock_resume(void)
>  		BUG();
>  
>  	if (reg != CLK_RESET_CCLK_BURST_POLICY_PLLX) {
> -		/* restore PLLX settings if CPU is on different PLL */
> -		writel(tegra30_cpu_clk_sctx.pllx_misc,
> -					clk_base + CLK_RESET_PLLX_MISC);
> -		writel(tegra30_cpu_clk_sctx.pllx_base,
> -					clk_base + CLK_RESET_PLLX_BASE);
> -
> -		/* wait for PLL stabilization if PLLX was enabled */
> -		if (tegra30_cpu_clk_sctx.pllx_base & (1 << 30))
> -			udelay(300);
> +		misc = readl_relaxed(clk_base + CLK_RESET_PLLX_MISC);
> +		base = readl_relaxed(clk_base + CLK_RESET_PLLX_BASE);
> +
> +		if (misc != tegra30_cpu_clk_sctx.pllx_misc ||
> +		    base != tegra30_cpu_clk_sctx.pllx_base) {
> +			/* restore PLLX settings if CPU is on different PLL */
> +			writel(tegra30_cpu_clk_sctx.pllx_misc,
> +						clk_base + CLK_RESET_PLLX_MISC);
> +			writel(tegra30_cpu_clk_sctx.pllx_base,
> +						clk_base + CLK_RESET_PLLX_BASE);
> +
> +			/* wait for PLL stabilization if PLLX was enabled */
> +			if (tegra30_cpu_clk_sctx.pllx_base & (1 << 30))
> +				udelay(300);
> +		}
>  	}
>  
>  	/*
> -- 
> 2.23.0
> 

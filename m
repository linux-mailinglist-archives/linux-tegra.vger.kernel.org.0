Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64D056F637
	for <lists+linux-tegra@lfdr.de>; Sun, 21 Jul 2019 23:44:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726215AbfGUVoh (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 21 Jul 2019 17:44:37 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:34190 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725796AbfGUVog (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 21 Jul 2019 17:44:36 -0400
Received: by mail-lj1-f193.google.com with SMTP id p17so35574715ljg.1;
        Sun, 21 Jul 2019 14:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=XTluw9qvhIoxZpmScsUXvnTg94h72yyHjedHmvEmuEI=;
        b=HPgWaaibUcWLuVE1e4F69BtuL/MCcC5cQtgCoXeWuqtNuZxC+e6/1QFIGK17tX4zNC
         lasqRPrJUq9VK2QMQ26EdbsL8ZsS7y3O0HlGxCP57+Z/RStNDi/HnarBVdCxl8YRE8wS
         WbTAWjzXR+uq0uyXHYbb00ZTCNSWUyZzKhl0JaQLJFQzCjp+r2yb9/i6INylYer96ydd
         +fK2aU5Bl19oyl+6C2eVS4MR7SL26g/ttrtgNT/xRzvVaj3GdSn/m/6G+nVRXCqB4st3
         kR40dk5KqIdM+DdyWgGSOCzzGcvHHAeXfGCVjsYcedWMwXXOV3Yl7DIUjp6uxj56OkVW
         vxqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XTluw9qvhIoxZpmScsUXvnTg94h72yyHjedHmvEmuEI=;
        b=bzO2mL0xABMfgU9d6R4nXoxqtSYJhwOdMKeKiOfFvm54H2/EUI84lqYIXf49zslkHY
         0iwh2sM5VuRlHVKnWPnAJM2EKUBxuhxLrwfW8ojWcKjt90sPajiebfUtmjKpJ2FPghZK
         NpF5nDTYEYXitI+4qBKkG7cRezhRTOkqjljwzleKGtKNTAtDV2PcsnCs7IidX+emCafh
         4waBNNGr5n4r9gW+TpMDYP87R6usM93iFLBGW8bVVf+jZwiqPuFiDkJrfQcqceHNqXPn
         fptlwLscyc+HijDoX58GvxapENILR0+fON70/9P+d9/0ajLx46KInlPX/MHB00BdiaHs
         owuw==
X-Gm-Message-State: APjAAAW81Cqohf6RzGqdIYs5AbwDAjMXbkUNFieLYE0fzGmq9Ax4jLzn
        13LGpZNvReB7YnDjHxSVlAwQFc1V
X-Google-Smtp-Source: APXvYqyzt6wiclmUq5rxOXxZd21oIa/MP55cpyVFzgS+kPsRR3RWy+VeLZTE+ibyc2a2wHNP0o88yg==
X-Received: by 2002:a2e:85d7:: with SMTP id h23mr34994222ljj.53.1563745472723;
        Sun, 21 Jul 2019 14:44:32 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-220-99.pppoe.mtu-net.ru. [91.78.220.99])
        by smtp.googlemail.com with ESMTPSA id h3sm7246902lja.93.2019.07.21.14.44.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 21 Jul 2019 14:44:32 -0700 (PDT)
Subject: Re: [PATCH V6 06/21] clk: tegra: pll: Save and restore pll context
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de,
        jason@lakedaemon.net, marc.zyngier@arm.com,
        linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com
Cc:     pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org
References: <1563738060-30213-1-git-send-email-skomatineni@nvidia.com>
 <1563738060-30213-7-git-send-email-skomatineni@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ba402ed3-0e6f-26ce-ac0a-8048babb50ca@gmail.com>
Date:   Mon, 22 Jul 2019 00:44:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <1563738060-30213-7-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

21.07.2019 22:40, Sowjanya Komatineni пишет:
> This patch implements save and restore of PLL context.
> 
> During system suspend, core power goes off and looses the settings
> of the Tegra CAR controller registers.
> 
> So during suspend entry pll rate is stored and on resume it is
> restored back along with its state.
> 
> Acked-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/clk/tegra/clk-pll.c      | 121 ++++++++++++++++++++++++++++-----------
>  drivers/clk/tegra/clk-tegra210.c |   2 +-
>  drivers/clk/tegra/clk.h          |  10 +++-
>  3 files changed, 99 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
> index 1583f5fc992f..f136964e6c44 100644
> --- a/drivers/clk/tegra/clk-pll.c
> +++ b/drivers/clk/tegra/clk-pll.c
> @@ -1008,6 +1008,59 @@ static unsigned long clk_plle_recalc_rate(struct clk_hw *hw,
>  	return rate;
>  }
>  
> +void tegra_clk_sync_state_pll(struct clk_hw *hw)
> +{
> +	if (!__clk_get_enable_count(hw->clk))
> +		clk_pll_disable(hw);
> +	else
> +		clk_pll_enable(hw);
> +}
> +
> +static int tegra_clk_pll_save_context(struct clk_hw *hw)
> +{
> +	struct tegra_clk_pll *pll = to_clk_pll(hw);
> +	u32 val = 0;
> +
> +	pll->rate = clk_hw_get_rate(hw);
> +
> +	if (pll->params->flags & TEGRA_PLLMB)
> +		val = pll_readl_base(pll);
> +	else if (pll->params->flags & TEGRA_PLLRE)
> +		val = pll_readl_base(pll) & divp_mask_shifted(pll);
> +
> +	pll->pllbase_ctx = val;
> +
> +	return 0;
> +}
> +
> +static void tegra_clk_pll_restore_context(struct clk_hw *hw)
> +{
> +	struct tegra_clk_pll *pll = to_clk_pll(hw);
> +	struct clk_hw *parent = clk_hw_get_parent(hw);
> +	unsigned long parent_rate = clk_hw_get_rate(parent);
> +	u32 val;
> +
> +	if (clk_pll_is_enabled(hw))
> +		return;
> +
> +	if (pll->params->flags & TEGRA_PLLMB) {
> +		pll_writel_base(pll->pllbase_ctx, pll);
> +	} else if (pll->params->flags & TEGRA_PLLRE) {
> +		val = pll_readl_base(pll);
> +		val &= ~(divp_mask_shifted(pll));
> +		pll_writel_base(pll->pllbase_ctx | val, pll);
> +	}
> +
> +	if (pll->params->set_defaults)
> +		pll->params->set_defaults(pll);
> +
> +	clk_pll_set_rate(hw, pll->rate, parent_rate);
> +
> +	/* do not sync pllx state here. pllx is sync'd after dfll resume */
> +	if (!(pll->params->flags & TEGRA_PLLX))
> +		tegra_clk_sync_state_pll(hw);
> +}
> +
>  const struct clk_ops tegra_clk_pll_ops = {
>  	.is_enabled = clk_pll_is_enabled,
>  	.enable = clk_pll_enable,
> @@ -1015,6 +1068,8 @@ const struct clk_ops tegra_clk_pll_ops = {
>  	.recalc_rate = clk_pll_recalc_rate,
>  	.round_rate = clk_pll_round_rate,
>  	.set_rate = clk_pll_set_rate,
> +	.save_context = tegra_clk_pll_save_context,
> +	.restore_context = tegra_clk_pll_restore_context,
>  };
>  
>  const struct clk_ops tegra_clk_plle_ops = {
> @@ -1802,6 +1857,27 @@ static int clk_pllu_tegra114_enable(struct clk_hw *hw)
>  
>  	return ret;
>  }
> +
> +static void _clk_plle_tegra_init_parent(struct tegra_clk_pll *pll)
> +{
> +	u32 val, val_aux;
> +
> +	/* ensure parent is set to pll_ref */
> +	val = pll_readl_base(pll);
> +	val_aux = pll_readl(pll->params->aux_reg, pll);
> +
> +	if (val & PLL_BASE_ENABLE) {
> +		if ((val_aux & PLLE_AUX_PLLRE_SEL) ||
> +		    (val_aux & PLLE_AUX_PLLP_SEL))
> +			WARN(1, "pll_e enabled with unsupported parent %s\n",
> +			     (val_aux & PLLE_AUX_PLLP_SEL) ? "pllp_out0" :
> +			     "pll_re_vco");
> +	} else {
> +		val_aux &= ~(PLLE_AUX_PLLRE_SEL | PLLE_AUX_PLLP_SEL);
> +		pll_writel(val_aux, pll->params->aux_reg, pll);
> +		fence_udelay(1, pll->clk_base);
> +	}
> +}
>  #endif
>  
>  static struct tegra_clk_pll *_tegra_init_pll(void __iomem *clk_base,
> @@ -2214,27 +2290,12 @@ struct clk *tegra_clk_register_plle_tegra114(const char *name,
>  {
>  	struct tegra_clk_pll *pll;
>  	struct clk *clk;
> -	u32 val, val_aux;
>  
>  	pll = _tegra_init_pll(clk_base, NULL, pll_params, lock);
>  	if (IS_ERR(pll))
>  		return ERR_CAST(pll);
>  
> -	/* ensure parent is set to pll_re_vco */
> -
> -	val = pll_readl_base(pll);
> -	val_aux = pll_readl(pll_params->aux_reg, pll);
> -
> -	if (val & PLL_BASE_ENABLE) {
> -		if ((val_aux & PLLE_AUX_PLLRE_SEL) ||
> -			(val_aux & PLLE_AUX_PLLP_SEL))
> -			WARN(1, "pll_e enabled with unsupported parent %s\n",
> -			  (val_aux & PLLE_AUX_PLLP_SEL) ? "pllp_out0" :
> -					"pll_re_vco");
> -	} else {
> -		val_aux &= ~(PLLE_AUX_PLLRE_SEL | PLLE_AUX_PLLP_SEL);
> -		pll_writel(val_aux, pll_params->aux_reg, pll);
> -	}
> +	_clk_plle_tegra_init_parent(pll);
>  
>  	clk = _tegra_clk_register_pll(pll, name, parent_name, flags,
>  				      &tegra_clk_plle_tegra114_ops);
> @@ -2276,6 +2337,8 @@ static const struct clk_ops tegra_clk_pllss_ops = {
>  	.recalc_rate = clk_pll_recalc_rate,
>  	.round_rate = clk_pll_ramp_round_rate,
>  	.set_rate = clk_pllxc_set_rate,
> +	.save_context = tegra_clk_pll_save_context,
> +	.restore_context = tegra_clk_pll_restore_context,
>  };
>  
>  struct clk *tegra_clk_register_pllss(const char *name, const char *parent_name,
> @@ -2375,6 +2438,7 @@ struct clk *tegra_clk_register_pllre_tegra210(const char *name,
>  		pll_params->vco_min = pll_params->adjust_vco(pll_params,
>  							     parent_rate);
>  
> +	pll_params->flags |= TEGRA_PLLRE;
>  	pll = _tegra_init_pll(clk_base, pmc, pll_params, lock);
>  	if (IS_ERR(pll))
>  		return ERR_CAST(pll);
> @@ -2520,11 +2584,19 @@ static void clk_plle_tegra210_disable(struct clk_hw *hw)
>  		spin_unlock_irqrestore(pll->lock, flags);
>  }
>  
> +static void tegra_clk_plle_t210_restore_context(struct clk_hw *hw)
> +{
> +	struct tegra_clk_pll *pll = to_clk_pll(hw);
> +
> +	_clk_plle_tegra_init_parent(pll);
> +}
> +
>  static const struct clk_ops tegra_clk_plle_tegra210_ops = {
>  	.is_enabled =  clk_plle_tegra210_is_enabled,
>  	.enable = clk_plle_tegra210_enable,
>  	.disable = clk_plle_tegra210_disable,
>  	.recalc_rate = clk_pll_recalc_rate,
> +	.restore_context = tegra_clk_plle_t210_restore_context,
>  };
>  
>  struct clk *tegra_clk_register_plle_tegra210(const char *name,
> @@ -2535,27 +2607,12 @@ struct clk *tegra_clk_register_plle_tegra210(const char *name,
>  {
>  	struct tegra_clk_pll *pll;
>  	struct clk *clk;
> -	u32 val, val_aux;
>  
>  	pll = _tegra_init_pll(clk_base, NULL, pll_params, lock);
>  	if (IS_ERR(pll))
>  		return ERR_CAST(pll);
>  
> -	/* ensure parent is set to pll_re_vco */
> -
> -	val = pll_readl_base(pll);
> -	val_aux = pll_readl(pll_params->aux_reg, pll);
> -
> -	if (val & PLLE_BASE_ENABLE) {
> -		if ((val_aux & PLLE_AUX_PLLRE_SEL) ||
> -			(val_aux & PLLE_AUX_PLLP_SEL))
> -			WARN(1, "pll_e enabled with unsupported parent %s\n",
> -			  (val_aux & PLLE_AUX_PLLP_SEL) ? "pllp_out0" :
> -					"pll_re_vco");
> -	} else {
> -		val_aux &= ~(PLLE_AUX_PLLRE_SEL | PLLE_AUX_PLLP_SEL);
> -		pll_writel(val_aux, pll_params->aux_reg, pll);
> -	}
> +	_clk_plle_tegra_init_parent(pll);
>  
>  	clk = _tegra_clk_register_pll(pll, name, parent_name, flags,
>  				      &tegra_clk_plle_tegra210_ops);
> diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
> index 4721ee030d1c..58397f93166c 100644
> --- a/drivers/clk/tegra/clk-tegra210.c
> +++ b/drivers/clk/tegra/clk-tegra210.c
> @@ -1602,7 +1602,7 @@ static struct tegra_clk_pll_params pll_x_params = {
>  	.pdiv_tohw = pll_qlin_pdiv_to_hw,
>  	.div_nmp = &pllx_nmp,
>  	.freq_table = pll_x_freq_table,
> -	.flags = TEGRA_PLL_USE_LOCK | TEGRA_PLL_HAS_LOCK_ENABLE,
> +	.flags = TEGRA_PLL_USE_LOCK | TEGRA_PLL_HAS_LOCK_ENABLE | TEGRA_PLLX,
>  	.dyn_ramp = tegra210_pllx_dyn_ramp,
>  	.set_defaults = tegra210_pllx_set_defaults,
>  	.calc_rate = tegra210_pll_fixed_mdiv_cfg,
> diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
> index fb29a8c27873..8532f5150091 100644
> --- a/drivers/clk/tegra/clk.h
> +++ b/drivers/clk/tegra/clk.h
> @@ -235,6 +235,8 @@ struct tegra_clk_pll;
>   * TEGRA_PLLMB - PLLMB has should be treated similar to PLLM. This
>   *     flag indicated that it is PLLMB.
>   * TEGRA_PLL_VCO_OUT - Used to indicate that the PLL has a VCO output
> + * TEGRA_PLLRE - Used to indicate that it is PLLRE.
> + * TEGRA_PLLX - Used to indicate that it is PLLX.
>   */
>  struct tegra_clk_pll_params {
>  	unsigned long	input_min;
> @@ -301,6 +303,8 @@ struct tegra_clk_pll_params {
>  #define TEGRA_MDIV_NEW BIT(11)
>  #define TEGRA_PLLMB BIT(12)
>  #define TEGRA_PLL_VCO_OUT BIT(13)
> +#define TEGRA_PLLRE BIT(14)
> +#define TEGRA_PLLX BIT(15)
>  
>  /**
>   * struct tegra_clk_pll - Tegra PLL clock
> @@ -310,6 +314,8 @@ struct tegra_clk_pll_params {
>   * @pmc:	address of PMC, required to read override bits
>   * @lock:	register lock
>   * @params:	PLL parameters
> + * @rate:	rate during system suspend and resume
> + * @pllbase_ctx: pll base register value during suspend and resume
>   */
>  struct tegra_clk_pll {
>  	struct clk_hw	hw;
> @@ -317,6 +323,8 @@ struct tegra_clk_pll {
>  	void __iomem	*pmc;
>  	spinlock_t	*lock;
>  	struct tegra_clk_pll_params	*params;
> +	unsigned long	rate;
> +	u32	pllbase_ctx;
>  };
>  
>  #define to_clk_pll(_hw) container_of(_hw, struct tegra_clk_pll, hw)
> @@ -840,7 +848,7 @@ u16 tegra_pll_get_fixed_mdiv(struct clk_hw *hw, unsigned long input_rate);
>  int tegra_pll_p_div_to_hw(struct tegra_clk_pll *pll, u8 p_div);
>  int div_frac_get(unsigned long rate, unsigned parent_rate, u8 width,
>  		 u8 frac_width, u8 flags);
> -
> +void tegra_clk_sync_state_pll(struct clk_hw *hw);

Looks like this function isn't used anywhere other than this patch. Bug?

>  /* Combined read fence with delay */
>  #define fence_udelay(delay, reg)	\
> 


Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 499B1126F2D
	for <lists+linux-tegra@lfdr.de>; Thu, 19 Dec 2019 21:51:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726945AbfLSUv6 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 19 Dec 2019 15:51:58 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:35518 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726897AbfLSUv6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 19 Dec 2019 15:51:58 -0500
Received: by mail-lj1-f195.google.com with SMTP id j1so339810lja.2
        for <linux-tegra@vger.kernel.org>; Thu, 19 Dec 2019 12:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KEXg+QXcGVR2wfU7QL6Xi+7dyZhmU5Ou765XZ4scBQo=;
        b=bbJcumVds1fxGTZJNobN8as6g0iEXUOCC0wGhsE91g/76I8sqmtEo8+1/5aBx+iKPj
         0VigdlNc8Fp4CWmw58wc2l6TzK3aJWUMJRXC7Gbabq+TraRVcm0WrZOqkG+3QzvjnC96
         LU3adP4S85G40DQJ/tUfBLyhf5qUGvEuiV0Y6hLRysSFmZDJ+/x/mC6eN+c2/dBoI5Is
         H2dZZ5hZYSSPmKgJLvSClRgbC9cBNL8rCeEKntpMQmKzbGEr9IoWej9pfg1sj+1m/dh8
         iylepOfsYmlYP7QRHXC4/oeoLoTeb4XIf7a99P9KkQR9Ksd+/+0/pW2qt+8bM9vAaYKj
         ic/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KEXg+QXcGVR2wfU7QL6Xi+7dyZhmU5Ou765XZ4scBQo=;
        b=ukFmMdSo3kHZCMW2U7g3Wr6ZEuJj0Uz/+EzLv9iHRS73aQg1u372Tq2QZzhZByuWiX
         1H+xUnBqPUqQfF9AQ/KuhxuR1TIMTv3LI5trtrIWK9EPVVOlnnk+Lq3Ki8ACoOnARW+6
         cczMoB0eN7G9t1U1cauTCJ7ipM5kQbjF8wAaUfmbyOB6Ick9zEWCToD82nQXS+p3DCyd
         tg9A/4V8f/wIKKiwdJOGTSK4d7vv4Do7u0ZUxcEDE4PjOXcDy5/mddJxaFf4cPX3nFU8
         WdKgOSgJeCR1huiT7KZ65MbRyOL4lXz/HxTvaRsAW7n45J0Gt6Ok8Pbi9MH35UtWpIvH
         8naA==
X-Gm-Message-State: APjAAAXtVuYpkiBSo333xbsT6q+JK48eKqEpHStSmuF+CAVxi/EDcFQH
        kPnXker5hDTUV/icluP2IcsN/0Tj
X-Google-Smtp-Source: APXvYqziZ1dZyH+5st7pBYpsgslPepCOZs4TVvrBSPdHFBVUC3ELQz/4FFPwEeb+ot4d1QW7Q8v1LA==
X-Received: by 2002:a2e:9a98:: with SMTP id p24mr7593566lji.37.1576788715836;
        Thu, 19 Dec 2019 12:51:55 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id r26sm3043651lfm.82.2019.12.19.12.51.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2019 12:51:55 -0800 (PST)
Subject: Re: [PATCH v1 2/3] memory: tegra30-emc: Firm up hardware programming
 sequence
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-tegra@vger.kernel.org
References: <20191218185002.26970-1-digetx@gmail.com>
 <20191218185002.26970-3-digetx@gmail.com>
Message-ID: <6ecb7cd1-6cde-6b3b-b4c5-d4a05a61a2e3@gmail.com>
Date:   Thu, 19 Dec 2019 23:51:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191218185002.26970-3-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

18.12.2019 21:50, Dmitry Osipenko пишет:
> Previously there was a problem where a late handshake handling caused
> a memory corruption, this problem was resolved by issuing calibration
> command right after changing the timing, but looks like the solution
> wasn't entirely correct since calibration interval could be disabled as
> well. Now programming sequence is completed immediately after receiving
> handshake from CaR, without potentially long delays and in accordance to
> the TRM's programming guide.
> 
> Secondly, the TRM's programming guide suggests to flush EMC writes by
> reading any *MC* register before doing CaR changes. This is also addressed
> now.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/memory/tegra/tegra30-emc.c | 148 +++++++++++++++++------------
>  1 file changed, 88 insertions(+), 60 deletions(-)
> 
> diff --git a/drivers/memory/tegra/tegra30-emc.c b/drivers/memory/tegra/tegra30-emc.c
> index 8e156726b2de..cbc113ddd07c 100644
> --- a/drivers/memory/tegra/tegra30-emc.c
> +++ b/drivers/memory/tegra/tegra30-emc.c
> @@ -332,6 +332,7 @@ struct tegra_emc {
>  	void __iomem *regs;
>  	unsigned int irq;
>  
> +	struct emc_timing *new_timing;
>  	struct emc_timing *timings;
>  	unsigned int num_timings;
>  
> @@ -348,6 +349,66 @@ struct tegra_emc {
>  	bool bad_state : 1;
>  };
>  
> +static int emc_seq_update_timing(struct tegra_emc *emc)
> +{
> +	u32 val;
> +	int err;
> +
> +	writel_relaxed(EMC_TIMING_UPDATE, emc->regs + EMC_TIMING_CONTROL);
> +
> +	err = readl_relaxed_poll_timeout_atomic(emc->regs + EMC_STATUS, val,
> +				!(val & EMC_STATUS_TIMING_UPDATE_STALLED),
> +				1, 200);
> +	if (err) {
> +		dev_err(emc->dev, "failed to update timing: %d\n", err);
> +		return err;
> +	}
> +
> +	return 0;
> +}
> +
> +static void emc_complete_clk_change(struct tegra_emc *emc)
> +{
> +	struct emc_timing *timing = emc->new_timing;
> +	unsigned int dram_num;
> +	bool failed = false;
> +	int err;
> +
> +	/* re-enable auto-refresh */
> +	dram_num = tegra_mc_get_emem_device_count(emc->mc);
> +	writel_relaxed(EMC_REFCTRL_ENABLE_ALL(dram_num),
> +		       emc->regs + EMC_REFCTRL);
> +
> +	/* restore auto-calibration */
> +	if (emc->vref_cal_toggle)
> +		writel_relaxed(timing->emc_auto_cal_interval,
> +			       emc->regs + EMC_AUTO_CAL_INTERVAL);
> +
> +	/* restore dynamic self-refresh */
> +	if (timing->emc_cfg_dyn_self_ref) {
> +		emc->emc_cfg |= EMC_CFG_DYN_SREF_ENABLE;
> +		writel_relaxed(emc->emc_cfg, emc->regs + EMC_CFG);
> +	}
> +
> +	/* set number of clocks to wait after each ZQ command */
> +	if (emc->zcal_long)
> +		writel_relaxed(timing->emc_zcal_cnt_long,
> +			       emc->regs + EMC_ZCAL_WAIT_CNT);
> +
> +	/* wait for writes to settle */
> +	udelay(2);
> +
> +	/* update restored timing */
> +	err = emc_seq_update_timing(emc);
> +	if (err)
> +		failed = true;
> +
> +	/* restore early ACK */
> +	mc_writel(emc->mc, emc->mc_override, MC_EMEM_ARB_OVERRIDE);
> +
> +	emc->bad_state = failed;
> +}
> +
>  static irqreturn_t tegra_emc_isr(int irq, void *data)
>  {
>  	struct tegra_emc *emc = data;
> @@ -358,10 +419,6 @@ static irqreturn_t tegra_emc_isr(int irq, void *data)
>  	if (!status)
>  		return IRQ_NONE;
>  
> -	/* notify about EMC-CAR handshake completion */
> -	if (status & EMC_CLKCHANGE_COMPLETE_INT)
> -		complete(&emc->clk_handshake_complete);
> -
>  	/* notify about HW problem */
>  	if (status & EMC_REFRESH_OVERFLOW_INT)
>  		dev_err_ratelimited(emc->dev,
> @@ -370,6 +427,18 @@ static irqreturn_t tegra_emc_isr(int irq, void *data)
>  	/* clear interrupts */
>  	writel_relaxed(status, emc->regs + EMC_INTSTATUS);
>  
> +	/* notify about EMC-CAR handshake completion */
> +	if (status & EMC_CLKCHANGE_COMPLETE_INT) {
> +		if (completion_done(&emc->clk_handshake_complete)) {
> +			dev_err_ratelimited(emc->dev,
> +					    "bogus handshake interrupt\n");
> +			return IRQ_NONE;
> +		}
> +
> +		emc_complete_clk_change(emc);
> +		complete(&emc->clk_handshake_complete);
> +	}
> +
>  	return IRQ_HANDLED;
>  }
>  
> @@ -437,24 +506,6 @@ static bool emc_dqs_preset(struct tegra_emc *emc, struct emc_timing *timing,
>  	return preset;
>  }
>  
> -static int emc_seq_update_timing(struct tegra_emc *emc)
> -{
> -	u32 val;
> -	int err;
> -
> -	writel_relaxed(EMC_TIMING_UPDATE, emc->regs + EMC_TIMING_CONTROL);
> -
> -	err = readl_relaxed_poll_timeout_atomic(emc->regs + EMC_STATUS, val,
> -				!(val & EMC_STATUS_TIMING_UPDATE_STALLED),
> -				1, 200);
> -	if (err) {
> -		dev_err(emc->dev, "failed to update timing: %d\n", err);
> -		return err;
> -	}
> -
> -	return 0;
> -}
> -
>  static int emc_prepare_mc_clk_cfg(struct tegra_emc *emc, unsigned long rate)
>  {
>  	struct tegra_mc *mc = emc->mc;
> @@ -620,9 +671,6 @@ static int emc_prepare_timing_change(struct tegra_emc *emc, unsigned long rate)
>  		writel_relaxed(val, emc->regs + EMC_MRS_WAIT_CNT);
>  	}
>  
> -	/* disable interrupt since read access is prohibited after stalling */
> -	disable_irq(emc->irq);
> -
>  	/* this read also completes the writes */
>  	val = readl_relaxed(emc->regs + EMC_SEL_DPD_CTRL);
>  
> @@ -738,17 +786,18 @@ static int emc_prepare_timing_change(struct tegra_emc *emc, unsigned long rate)
>  				       emc->regs + EMC_ZQ_CAL);
>  	}
>  
> -	/* re-enable auto-refresh */
> -	writel_relaxed(EMC_REFCTRL_ENABLE_ALL(dram_num),
> -		       emc->regs + EMC_REFCTRL);
> -
>  	/* flow control marker 3 */
>  	writel_relaxed(0x1, emc->regs + EMC_UNSTALL_RW_AFTER_CLKCHANGE);
>  
> +	/*
> +	 * Read and discard an arbitrary MC register (Note: EMC registers
> +	 * can't be used) to ensure the register writes are completed.
> +	 */
> +	mc_readl(emc->mc, MC_EMEM_ARB_OVERRIDE);
> +
>  	reinit_completion(&emc->clk_handshake_complete);
>  
> -	/* interrupt can be re-enabled now */
> -	enable_irq(emc->irq);
> +	emc->new_timing = timing;
>  
>  	return 0;
>  }
> @@ -756,9 +805,7 @@ static int emc_prepare_timing_change(struct tegra_emc *emc, unsigned long rate)
>  static int emc_complete_timing_change(struct tegra_emc *emc,
>  				      unsigned long rate)
>  {
> -	struct emc_timing *timing = emc_find_timing(emc, rate);
>  	unsigned long timeout;
> -	int err;
>  
>  	timeout = wait_for_completion_timeout(&emc->clk_handshake_complete,
>  					      msecs_to_jiffies(100));
> @@ -767,33 +814,8 @@ static int emc_complete_timing_change(struct tegra_emc *emc,
>  		return -EIO;
>  	}
>  
> -	/* restore auto-calibration */
> -	if (emc->vref_cal_toggle)
> -		writel_relaxed(timing->emc_auto_cal_interval,
> -			       emc->regs + EMC_AUTO_CAL_INTERVAL);
> -
> -	/* restore dynamic self-refresh */
> -	if (timing->emc_cfg_dyn_self_ref) {
> -		emc->emc_cfg |= EMC_CFG_DYN_SREF_ENABLE;
> -		writel_relaxed(emc->emc_cfg, emc->regs + EMC_CFG);
> -	}
> -
> -	/* set number of clocks to wait after each ZQ command */
> -	if (emc->zcal_long)
> -		writel_relaxed(timing->emc_zcal_cnt_long,
> -			       emc->regs + EMC_ZCAL_WAIT_CNT);
> -
> -	udelay(2);
> -	/* update restored timing */
> -	err = emc_seq_update_timing(emc);
> -
> -	/* restore early ACK */
> -	mc_writel(emc->mc, emc->mc_override, MC_EMEM_ARB_OVERRIDE);
> -
> -	if (err)
> -		return err;
> -
> -	emc->bad_state = false;
> +	if (emc->bad_state)
> +		return -EIO;

I'm now having a second thought: there shouldn't be any problem here
because compiler should assume that wait_for_completion_timeout() may
alter emc->bad_state and thus always emit a memory fetch here. But I'll
feel more comfortable if WRITE/READ_ONCE will be used here for
interacting with the interrupt handler, which will be changed in v2.

>  
>  	return 0;
>  }
> @@ -819,7 +841,13 @@ static int emc_clk_change_notify(struct notifier_block *nb,
>  
>  	switch (msg) {
>  	case PRE_RATE_CHANGE:
> +		/*
> +		 * Disable interrupt since read accesses are prohibited after
> +		 * stalling.
> +		 */
> +		disable_irq(emc->irq);
>  		err = emc_prepare_timing_change(emc, cnd->new_rate);
> +		enable_irq(emc->irq);
>  		break;
>  
>  	case ABORT_RATE_CHANGE:
> 


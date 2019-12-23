Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3C0B1297FF
	for <lists+linux-tegra@lfdr.de>; Mon, 23 Dec 2019 16:20:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726802AbfLWPU6 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 23 Dec 2019 10:20:58 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:36453 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726718AbfLWPU6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 23 Dec 2019 10:20:58 -0500
Received: by mail-lj1-f193.google.com with SMTP id r19so18073729ljg.3
        for <linux-tegra@vger.kernel.org>; Mon, 23 Dec 2019 07:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=NR2kWbEHEb85Abe9Ri8SIClLIUYXjhvBo8gMyWXQhFg=;
        b=N9D3viPAPk+l8SL0LZL69wlKOdrmNl9WuEjbzvJZGnivBTfJAP66sCjDiXJv8aHdQz
         mb7GHBkZO7UGXWgyoWv6nGyXv0dTYN7pcCiLROHZJdTmvPS4Snl22Yt3rurq7r0cIHh8
         eHTe1jQUq4gJMxykxzgGlaflOWH8eFgSpeyF50j7mmLKnJIRa3yiobhDXE/jeJXvbP46
         uMDbhNVWACeaERCdTlEIfbWaC6wpGd+1aZqTgtbVW2nVL6E9m+zAr7Sx0MfzCFHjrt1N
         QrG8Wnlzfm1XtfrGaaIR7Hwg1Hs5BA/IvYaK0KzkqQX/tp7g2LKPTBvtPqKqcx1exg+7
         QGAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NR2kWbEHEb85Abe9Ri8SIClLIUYXjhvBo8gMyWXQhFg=;
        b=cv7JFWHtMnI6Onv6APbZMhwqrCQlX379izuPvFBmV6qaqy3Jnoj2n1cADxzozXSVGk
         YZstFFH0HJ8NOZATWPV/BD7x9lydzSqvuzynDLJyeb8YxsiLph1ALMq3XmZmJj1p2n3V
         1G7Q23Mzbox2sUq0wzaAIdGdnF7e5Do2cMs4uVpD0lHoIzj7u573qZylLFsFGGpKhjYP
         SzkrxiEjdsXhdljKolc88+eGdpxsl+PiBCvam4F+2mJTaYEN55ZIljXrheyNCaHDOztr
         Zk/GTJSm9jvlVrw1kiuUgf/thBCR/aSujPucLc6SJPHCUmaTitpAaa/ko/297Zetl2Yd
         5cEw==
X-Gm-Message-State: APjAAAXIR5eygiseCGfywPG9TOTjaIyGYSChOsPXjTIJ/enBs9oxJC8h
        230zHJSh+dfN0ZF7fL2D+s/KHH1V
X-Google-Smtp-Source: APXvYqxiidW/GZr2RrRDEaVZF8kU8mMCPp0SPB9mhJCDgwJtOGR5Ej6O7tpe2MAePFnppSlE/hJmAg==
X-Received: by 2002:a2e:2201:: with SMTP id i1mr17737791lji.110.1577114455147;
        Mon, 23 Dec 2019 07:20:55 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id d25sm8692533ljj.51.2019.12.23.07.20.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Dec 2019 07:20:54 -0800 (PST)
Subject: Re: [PATCH 1/2] memory: tegra: Implement EMC debugfs interface on
 Tegra20
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
References: <20191222114033.1469622-1-thierry.reding@gmail.com>
 <c97f352f-3299-0a8b-8262-16ee80413c48@gmail.com>
Message-ID: <5c281eb9-be76-c2a6-d183-2d92ba4bde96@gmail.com>
Date:   Mon, 23 Dec 2019 18:20:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <c97f352f-3299-0a8b-8262-16ee80413c48@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

23.12.2019 18:06, Dmitry Osipenko пишет:
> 
> Hello Thierry,
> 
> 22.12.2019 14:40, Thierry Reding пишет:
>> From: Thierry Reding <treding@nvidia.com>
>>
>> A common debugfs interface is already available on Tegra124, Tegra186
>> and Tegra194. Implement the same interface on Tegra20 to enable testing
>> of the EMC frequency scaling code using a unified interface.
>>
>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>> ---
>>  drivers/memory/tegra/tegra20-emc.c | 175 +++++++++++++++++++++++++++++
>>  1 file changed, 175 insertions(+)
>>
>> diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
>> index 1b23b1c34476..8ae474d9bfb9 100644
>> --- a/drivers/memory/tegra/tegra20-emc.c
>> +++ b/drivers/memory/tegra/tegra20-emc.c
>> @@ -8,6 +8,7 @@
>>  #include <linux/clk.h>
>>  #include <linux/clk/tegra.h>
>>  #include <linux/completion.h>
>> +#include <linux/debugfs.h>
>>  #include <linux/err.h>
>>  #include <linux/interrupt.h>
>>  #include <linux/io.h>
>> @@ -150,6 +151,12 @@ struct tegra_emc {
>>  
>>  	struct emc_timing *timings;
>>  	unsigned int num_timings;
>> +
>> +	struct {
>> +		struct dentry *root;
>> +		unsigned long min_rate;
>> +		unsigned long max_rate;
>> +	} debugfs;
>>  };
>>  
>>  static irqreturn_t tegra_emc_isr(int irq, void *data)
>> @@ -478,6 +485,171 @@ static long emc_round_rate(unsigned long rate,
>>  	return timing->rate;
>>  }
>>  
>> +/*
>> + * debugfs interface
>> + *
>> + * The memory controller driver exposes some files in debugfs that can be used
>> + * to control the EMC frequency. The top-level directory can be found here:
>> + *
>> + *   /sys/kernel/debug/emc
>> + *
>> + * It contains the following files:
>> + *
>> + *   - available_rates: This file contains a list of valid, space-separated
>> + *     EMC frequencies.
>> + *
>> + *   - min_rate: Writing a value to this file sets the given frequency as the
>> + *       floor of the permitted range. If this is higher than the currently
>> + *       configured EMC frequency, this will cause the frequency to be
>> + *       increased so that it stays within the valid range.
>> + *
>> + *   - max_rate: Similarily to the min_rate file, writing a value to this file
>> + *       sets the given frequency as the ceiling of the permitted range. If
>> + *       the value is lower than the currently configured EMC frequency, this
>> + *       will cause the frequency to be decreased so that it stays within the
>> + *       valid range.
>> + */
>> +
>> +static bool tegra_emc_validate_rate(struct tegra_emc *emc, unsigned long rate)
>> +{
>> +	unsigned int i;
>> +
>> +	for (i = 0; i < emc->num_timings; i++)
>> +		if (rate == emc->timings[i].rate)
>> +			return true;
>> +
>> +	return false;
>> +}
>> +
>> +static int tegra_emc_debug_available_rates_show(struct seq_file *s, void *data)
>> +{
>> +	struct tegra_emc *emc = s->private;
>> +	const char *prefix = "";
>> +	unsigned int i;
>> +
>> +	for (i = 0; i < emc->num_timings; i++) {
>> +		seq_printf(s, "%s%lu", prefix, emc->timings[i].rate);
>> +		prefix = " ";
>> +	}
>> +
>> +	seq_puts(s, "\n");
>> +
>> +	return 0;
>> +}
>> +
>> +static int tegra_emc_debug_available_rates_open(struct inode *inode,
>> +						struct file *file)
>> +{
>> +	return single_open(file, tegra_emc_debug_available_rates_show,
>> +			   inode->i_private);
>> +}
>> +
>> +static const struct file_operations tegra_emc_debug_available_rates_fops = {
>> +	.open = tegra_emc_debug_available_rates_open,
>> +	.read = seq_read,
>> +	.llseek = seq_lseek,
>> +	.release = single_release,
>> +};
>> +
>> +static int tegra_emc_debug_min_rate_get(void *data, u64 *rate)
>> +{
>> +	struct tegra_emc *emc = data;
>> +
>> +	*rate = emc->debugfs.min_rate;
>> +
>> +	return 0;
>> +}
>> +
>> +static int tegra_emc_debug_min_rate_set(void *data, u64 rate)
>> +{
>> +	struct tegra_emc *emc = data;
>> +	int err;
>> +
>> +	if (!tegra_emc_validate_rate(emc, rate))
>> +		return -EINVAL;
>> +
>> +	err = clk_set_min_rate(emc->clk, rate);
>> +	if (err < 0)
>> +		return err;

Changing of min-rate may not result in the actual change of the rate,
this is needed if you're expecting the change-rate to happen:

	clk_set_rate(emc->clk, 0);

Perhaps you'd also want to provide some kind of integration with the
devfreq in order to stop it for the time of testing, otherwise it may
intervene here.

>> +	emc->debugfs.min_rate = rate;
>> +
>> +	return 0;
>> +}
>> +
>> +DEFINE_SIMPLE_ATTRIBUTE(tegra_emc_debug_min_rate_fops,
>> +			tegra_emc_debug_min_rate_get,
>> +			tegra_emc_debug_min_rate_set, "%llu\n");
>> +
>> +static int tegra_emc_debug_max_rate_get(void *data, u64 *rate)
>> +{
>> +	struct tegra_emc *emc = data;
>> +
>> +	*rate = emc->debugfs.max_rate;
>> +
>> +	return 0;
>> +}
>> +
>> +static int tegra_emc_debug_max_rate_set(void *data, u64 rate)
>> +{
>> +	struct tegra_emc *emc = data;
>> +	int err;
>> +
>> +	if (!tegra_emc_validate_rate(emc, rate))
>> +		return -EINVAL;
>> +
>> +	err = clk_set_max_rate(emc->clk, rate);
>> +	if (err < 0)
>> +		return err;

Similar to min-rate.

>> +	emc->debugfs.max_rate = rate;
>> +
>> +	return 0;
>> +}
>> +
>> +DEFINE_SIMPLE_ATTRIBUTE(tegra_emc_debug_max_rate_fops,
>> +			tegra_emc_debug_max_rate_get,
>> +			tegra_emc_debug_max_rate_set, "%llu\n");
>> +
>> +static void tegra_emc_debugfs_init(struct tegra_emc *emc)
>> +{
>> +	struct device *dev = emc->dev;
>> +	unsigned int i;
>> +	int err;
>> +
>> +	emc->debugfs.min_rate = ULONG_MAX;
>> +	emc->debugfs.max_rate = 0;
>> +
>> +	for (i = 0; i < emc->num_timings; i++) {
>> +		if (emc->timings[i].rate < emc->debugfs.min_rate)
>> +			emc->debugfs.min_rate = emc->timings[i].rate;
>> +
>> +		if (emc->timings[i].rate > emc->debugfs.max_rate)
>> +			emc->debugfs.max_rate = emc->timings[i].rate;
>> +	}
>> +
>> +	err = clk_set_rate_range(emc->clk, emc->debugfs.min_rate,
>> +				 emc->debugfs.max_rate);
>> +	if (err < 0) {
>> +		dev_err(dev, "failed to set rate range [%lu-%lu] for %pC\n",
>> +			emc->debugfs.min_rate, emc->debugfs.max_rate,
>> +			emc->clk);
>> +	}
>> +
>> +	emc->debugfs.root = debugfs_create_dir("emc", NULL);
> 
> What about "tegra-emc"?
> 
>> +	if (!emc->debugfs.root) {
>> +		dev_err(emc->dev, "failed to create debugfs directory\n");
>> +		return;
>> +	}
>> +
>> +	debugfs_create_file("available_rates", S_IRUGO, emc->debugfs.root,
>> +			    emc, &tegra_emc_debug_available_rates_fops);
>> +	debugfs_create_file("min_rate", S_IRUGO | S_IWUSR, emc->debugfs.root,
>> +			    emc, &tegra_emc_debug_min_rate_fops);
>> +	debugfs_create_file("max_rate", S_IRUGO | S_IWUSR, emc->debugfs.root,
>> +			    emc, &tegra_emc_debug_max_rate_fops);
>> +}
>> +
>>  static int tegra_emc_probe(struct platform_device *pdev)
>>  {
>>  	struct device_node *np;
>> @@ -550,6 +722,9 @@ static int tegra_emc_probe(struct platform_device *pdev)
>>  		goto unset_cb;
>>  	}
>>  
>> +	platform_set_drvdata(pdev, emc);
>> +	tegra_emc_debugfs_init(emc);
>> +
>>  	return 0;
>>  
>>  unset_cb:
>>
> 
> In general this looks good to me, but maybe there is a bit too much of
> the code duplication here for 3 drivers?
> 
> Perhaps it all could be factored out into a common debug.c, something like:
> 
> debug.c:
> --------
> 
> static struct tegra_emc_debug {
> 		struct clk *clk;
> 		struct dentry *root;
> 		unsigned int num_rates;
> 		unsigned long rates[];
> } *emc_dbg;
> 
> int tegra_emc_register_debugfs(struct device *dev,
> 			       struct clk *clk,
> 			       unsigned int num_rates,
> 			       unsigned long *rates,
> 			       size_t emc_timing_size)
> {
> 	...
> 	emc_dbg_size = struct_size(emc_dbg, rates, num_rates);
> 	emc_dbg = devm_kcalloc(dev, emc_dbg_size);
> 	...
> 
> 	for (i = 0; i < num_rates; i++) {
> 		emc_dbg->rates[i] = rates[i];
> 		rates = (void*)rates + emc_timing_size;
> 	}
> 
> 	emc_dbg->num_rates = i;
> 
> 	...
> }
> 
> emc-driver.c:
> -------------
> 
> tegra_emc_register_debugfs(emc->dev, emc->clk, emc->num_timings,
> 			   &emc->timings[0].rate, sizeof(*emc->timings));
> 


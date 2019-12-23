Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D831E129842
	for <lists+linux-tegra@lfdr.de>; Mon, 23 Dec 2019 16:29:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726840AbfLWP3y (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 23 Dec 2019 10:29:54 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:47096 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726834AbfLWP3y (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 23 Dec 2019 10:29:54 -0500
Received: by mail-lf1-f67.google.com with SMTP id f15so12881378lfl.13
        for <linux-tegra@vger.kernel.org>; Mon, 23 Dec 2019 07:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=tc7Tt3EfrP5G0LfgiqEetPXVI5ZYUoUsTeRJ564DIrs=;
        b=LSyYLDJ/rIVrZO8zFBm6y0i0DaiC7/LoFgGJMwIbCOB7iNEvMF+YEaKoSldtupJ5+y
         hND+E4kg9RVTzTcDUJD8DwEscdAO/eVlW1UfedU/bmQrhDSL1e7CiYZbd79oFzOwX4Un
         v0YASEE3iMce2I0Ay5pdXgIrZn2zFQ+6oXX8mm2QEU3L2etkKkEe97q3ulQAN7eEtb3I
         CFznxyPHCnzXEm13IMCrcK0eIleoOnRJrx4JxdmuKBT7c/0rlWuRRl8QmC2FhwxtzjK+
         YR9jmV/bShdxjCQVyYOSqq/xoIDq29S4JNSYKTysvPdm4Zroxeo2PZ0CJbSrS1O8NhMx
         Gung==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tc7Tt3EfrP5G0LfgiqEetPXVI5ZYUoUsTeRJ564DIrs=;
        b=p+gUzsOaOEl8cMg9286SHOOMRQDAUQ4Hb3sobObsSEdCSzvox8ls3XDijhHM2NyLLG
         irQnN4+haGCo5ug22Gv9xYUiexZNrRikGgRGNootvLeTtofj2IyuHFgGv39XJAeBFCgU
         ZIrAxOSutz2G9m+C8CSVW/CwPvDiGJ4+09ZvflVjqsmTzVYRJBWScvGzAZMV8f1CAf3d
         WHgENQQmX4aLWPz+jD39KJsiQQJ8wr9xwfxIEsAgSvkNjmX1n1oOj/rqSbykFMcE54/V
         /ywuggBDfrkFfPiYh0IHFHj0z/41xD3mOdpuSmIPp9iQgkggVvUNctcSK/cJ6wYHNF56
         0vDQ==
X-Gm-Message-State: APjAAAVZi9ghkLdFYzQV3Ig6w1T385Wi3cxS3mRRZ1ADOn5QY9Ltaz3Z
        0cIAAtOYYkVF4KmKU9O98gqlMvDv
X-Google-Smtp-Source: APXvYqww4QD2paN0qsHJI7eGqoIoOvSamFa8p5CghUSOlz6aGMkyS4Bhd+JyT6uqlkIAPU7eBdf0nw==
X-Received: by 2002:a19:ca59:: with SMTP id h25mr16837266lfj.27.1577114991102;
        Mon, 23 Dec 2019 07:29:51 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id y11sm10198520lfc.27.2019.12.23.07.29.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Dec 2019 07:29:50 -0800 (PST)
Subject: Re: [PATCH 1/2] memory: tegra: Implement EMC debugfs interface on
 Tegra20
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
References: <20191222114033.1469622-1-thierry.reding@gmail.com>
 <c97f352f-3299-0a8b-8262-16ee80413c48@gmail.com>
 <5c281eb9-be76-c2a6-d183-2d92ba4bde96@gmail.com>
Message-ID: <d3e61d38-4042-fec2-a0df-8d0041bad1e7@gmail.com>
Date:   Mon, 23 Dec 2019 18:29:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <5c281eb9-be76-c2a6-d183-2d92ba4bde96@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

23.12.2019 18:20, Dmitry Osipenko пишет:
> 23.12.2019 18:06, Dmitry Osipenko пишет:
>>
>> Hello Thierry,
>>
>> 22.12.2019 14:40, Thierry Reding пишет:
>>> From: Thierry Reding <treding@nvidia.com>
>>>
>>> A common debugfs interface is already available on Tegra124, Tegra186
>>> and Tegra194. Implement the same interface on Tegra20 to enable testing
>>> of the EMC frequency scaling code using a unified interface.
>>>
>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>>> ---
>>>  drivers/memory/tegra/tegra20-emc.c | 175 +++++++++++++++++++++++++++++
>>>  1 file changed, 175 insertions(+)
>>>
>>> diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
>>> index 1b23b1c34476..8ae474d9bfb9 100644
>>> --- a/drivers/memory/tegra/tegra20-emc.c
>>> +++ b/drivers/memory/tegra/tegra20-emc.c
>>> @@ -8,6 +8,7 @@
>>>  #include <linux/clk.h>
>>>  #include <linux/clk/tegra.h>
>>>  #include <linux/completion.h>
>>> +#include <linux/debugfs.h>
>>>  #include <linux/err.h>
>>>  #include <linux/interrupt.h>
>>>  #include <linux/io.h>
>>> @@ -150,6 +151,12 @@ struct tegra_emc {
>>>  
>>>  	struct emc_timing *timings;
>>>  	unsigned int num_timings;
>>> +
>>> +	struct {
>>> +		struct dentry *root;
>>> +		unsigned long min_rate;
>>> +		unsigned long max_rate;
>>> +	} debugfs;
>>>  };
>>>  
>>>  static irqreturn_t tegra_emc_isr(int irq, void *data)
>>> @@ -478,6 +485,171 @@ static long emc_round_rate(unsigned long rate,
>>>  	return timing->rate;
>>>  }
>>>  
>>> +/*
>>> + * debugfs interface
>>> + *
>>> + * The memory controller driver exposes some files in debugfs that can be used
>>> + * to control the EMC frequency. The top-level directory can be found here:
>>> + *
>>> + *   /sys/kernel/debug/emc
>>> + *
>>> + * It contains the following files:
>>> + *
>>> + *   - available_rates: This file contains a list of valid, space-separated
>>> + *     EMC frequencies.
>>> + *
>>> + *   - min_rate: Writing a value to this file sets the given frequency as the
>>> + *       floor of the permitted range. If this is higher than the currently
>>> + *       configured EMC frequency, this will cause the frequency to be
>>> + *       increased so that it stays within the valid range.
>>> + *
>>> + *   - max_rate: Similarily to the min_rate file, writing a value to this file
>>> + *       sets the given frequency as the ceiling of the permitted range. If
>>> + *       the value is lower than the currently configured EMC frequency, this
>>> + *       will cause the frequency to be decreased so that it stays within the
>>> + *       valid range.
>>> + */
>>> +
>>> +static bool tegra_emc_validate_rate(struct tegra_emc *emc, unsigned long rate)
>>> +{
>>> +	unsigned int i;
>>> +
>>> +	for (i = 0; i < emc->num_timings; i++)
>>> +		if (rate == emc->timings[i].rate)
>>> +			return true;
>>> +
>>> +	return false;
>>> +}
>>> +
>>> +static int tegra_emc_debug_available_rates_show(struct seq_file *s, void *data)
>>> +{
>>> +	struct tegra_emc *emc = s->private;
>>> +	const char *prefix = "";
>>> +	unsigned int i;
>>> +
>>> +	for (i = 0; i < emc->num_timings; i++) {
>>> +		seq_printf(s, "%s%lu", prefix, emc->timings[i].rate);
>>> +		prefix = " ";
>>> +	}
>>> +
>>> +	seq_puts(s, "\n");
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int tegra_emc_debug_available_rates_open(struct inode *inode,
>>> +						struct file *file)
>>> +{
>>> +	return single_open(file, tegra_emc_debug_available_rates_show,
>>> +			   inode->i_private);
>>> +}
>>> +
>>> +static const struct file_operations tegra_emc_debug_available_rates_fops = {
>>> +	.open = tegra_emc_debug_available_rates_open,
>>> +	.read = seq_read,
>>> +	.llseek = seq_lseek,
>>> +	.release = single_release,
>>> +};
>>> +
>>> +static int tegra_emc_debug_min_rate_get(void *data, u64 *rate)
>>> +{
>>> +	struct tegra_emc *emc = data;
>>> +
>>> +	*rate = emc->debugfs.min_rate;
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int tegra_emc_debug_min_rate_set(void *data, u64 rate)
>>> +{
>>> +	struct tegra_emc *emc = data;
>>> +	int err;
>>> +
>>> +	if (!tegra_emc_validate_rate(emc, rate))
>>> +		return -EINVAL;
>>> +
>>> +	err = clk_set_min_rate(emc->clk, rate);
>>> +	if (err < 0)
>>> +		return err;
> 
> Changing of min-rate may not result in the actual change of the rate,
> this is needed if you're expecting the change-rate to happen:
> 
> 	clk_set_rate(emc->clk, 0);
> 
> Perhaps you'd also want to provide some kind of integration with the
> devfreq in order to stop it for the time of testing, otherwise it may
> intervene here.

Please note that simply pausing devfreq won't work because that won't
remove its min-rate request.

Although, I guess you could solve that by simply unloading devfreq
module for the time of testing.

For now I'm not sure what could be done about interconnect once we'll
support it.

>>> +	emc->debugfs.min_rate = rate;
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +DEFINE_SIMPLE_ATTRIBUTE(tegra_emc_debug_min_rate_fops,
>>> +			tegra_emc_debug_min_rate_get,
>>> +			tegra_emc_debug_min_rate_set, "%llu\n");
>>> +
>>> +static int tegra_emc_debug_max_rate_get(void *data, u64 *rate)
>>> +{
>>> +	struct tegra_emc *emc = data;
>>> +
>>> +	*rate = emc->debugfs.max_rate;
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int tegra_emc_debug_max_rate_set(void *data, u64 rate)
>>> +{
>>> +	struct tegra_emc *emc = data;
>>> +	int err;
>>> +
>>> +	if (!tegra_emc_validate_rate(emc, rate))
>>> +		return -EINVAL;
>>> +
>>> +	err = clk_set_max_rate(emc->clk, rate);
>>> +	if (err < 0)
>>> +		return err;
> 
> Similar to min-rate.
> 
>>> +	emc->debugfs.max_rate = rate;
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +DEFINE_SIMPLE_ATTRIBUTE(tegra_emc_debug_max_rate_fops,
>>> +			tegra_emc_debug_max_rate_get,
>>> +			tegra_emc_debug_max_rate_set, "%llu\n");
>>> +
>>> +static void tegra_emc_debugfs_init(struct tegra_emc *emc)
>>> +{
>>> +	struct device *dev = emc->dev;
>>> +	unsigned int i;
>>> +	int err;
>>> +
>>> +	emc->debugfs.min_rate = ULONG_MAX;
>>> +	emc->debugfs.max_rate = 0;
>>> +
>>> +	for (i = 0; i < emc->num_timings; i++) {
>>> +		if (emc->timings[i].rate < emc->debugfs.min_rate)
>>> +			emc->debugfs.min_rate = emc->timings[i].rate;
>>> +
>>> +		if (emc->timings[i].rate > emc->debugfs.max_rate)
>>> +			emc->debugfs.max_rate = emc->timings[i].rate;
>>> +	}
>>> +
>>> +	err = clk_set_rate_range(emc->clk, emc->debugfs.min_rate,
>>> +				 emc->debugfs.max_rate);
>>> +	if (err < 0) {
>>> +		dev_err(dev, "failed to set rate range [%lu-%lu] for %pC\n",
>>> +			emc->debugfs.min_rate, emc->debugfs.max_rate,
>>> +			emc->clk);
>>> +	}
>>> +
>>> +	emc->debugfs.root = debugfs_create_dir("emc", NULL);
>>
>> What about "tegra-emc"?
>>
>>> +	if (!emc->debugfs.root) {
>>> +		dev_err(emc->dev, "failed to create debugfs directory\n");
>>> +		return;
>>> +	}
>>> +
>>> +	debugfs_create_file("available_rates", S_IRUGO, emc->debugfs.root,
>>> +			    emc, &tegra_emc_debug_available_rates_fops);
>>> +	debugfs_create_file("min_rate", S_IRUGO | S_IWUSR, emc->debugfs.root,
>>> +			    emc, &tegra_emc_debug_min_rate_fops);
>>> +	debugfs_create_file("max_rate", S_IRUGO | S_IWUSR, emc->debugfs.root,
>>> +			    emc, &tegra_emc_debug_max_rate_fops);
>>> +}
>>> +
>>>  static int tegra_emc_probe(struct platform_device *pdev)
>>>  {
>>>  	struct device_node *np;
>>> @@ -550,6 +722,9 @@ static int tegra_emc_probe(struct platform_device *pdev)
>>>  		goto unset_cb;
>>>  	}
>>>  
>>> +	platform_set_drvdata(pdev, emc);
>>> +	tegra_emc_debugfs_init(emc);
>>> +
>>>  	return 0;
>>>  
>>>  unset_cb:
>>>
>>
>> In general this looks good to me, but maybe there is a bit too much of
>> the code duplication here for 3 drivers?
>>
>> Perhaps it all could be factored out into a common debug.c, something like:
>>
>> debug.c:
>> --------
>>
>> static struct tegra_emc_debug {
>> 		struct clk *clk;
>> 		struct dentry *root;
>> 		unsigned int num_rates;
>> 		unsigned long rates[];
>> } *emc_dbg;
>>
>> int tegra_emc_register_debugfs(struct device *dev,
>> 			       struct clk *clk,
>> 			       unsigned int num_rates,
>> 			       unsigned long *rates,
>> 			       size_t emc_timing_size)
>> {
>> 	...
>> 	emc_dbg_size = struct_size(emc_dbg, rates, num_rates);
>> 	emc_dbg = devm_kcalloc(dev, emc_dbg_size);
>> 	...
>>
>> 	for (i = 0; i < num_rates; i++) {
>> 		emc_dbg->rates[i] = rates[i];
>> 		rates = (void*)rates + emc_timing_size;
>> 	}
>>
>> 	emc_dbg->num_rates = i;
>>
>> 	...
>> }
>>
>> emc-driver.c:
>> -------------
>>
>> tegra_emc_register_debugfs(emc->dev, emc->clk, emc->num_timings,
>> 			   &emc->timings[0].rate, sizeof(*emc->timings));
>>
> 


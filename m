Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07DB01A3A66
	for <lists+linux-tegra@lfdr.de>; Thu,  9 Apr 2020 21:18:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726757AbgDITQw (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 9 Apr 2020 15:16:52 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:35807 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726703AbgDITQw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Apr 2020 15:16:52 -0400
Received: by mail-lf1-f67.google.com with SMTP id r17so527804lff.2;
        Thu, 09 Apr 2020 12:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=lEm/9oCTiyDhNq4taChegHKoTyf1h7PJecGCNIAzWok=;
        b=WM6j7c81RCuBiipkNzSjsMnAgYPxhx5NPQiZF46zo/micN1zvbrQ8opfwEiDLW3si7
         Y7zj9dIwNEBL1sDjUNdttGl4v3tJnNeGiH29NUywTn3WugNqcNUfx3kvi2+NF0iy5pJA
         g2I4J6CTqLDT8mcQaxz346d0XRrrDcFnKbAUYgi05f90zPx9FqlAIahx3XIxYwAcCm3K
         1i61RRcjeeDCVxgACAMwmf7Y5A77cGIbOPTRZR3eJPKmLFzQPiy26FQEtNuCdG4Z90a6
         dOEwV6ZXPCENo1zwipQijkLTPa7QBOh+3Op2pO4NjPTPCp3uQ7jMXlLEVif7qAhqtC47
         yhLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lEm/9oCTiyDhNq4taChegHKoTyf1h7PJecGCNIAzWok=;
        b=JTMVcczjFv8xI64pPNslO9Eehq2pPYE1dT+wKwR1guwkxtHMtzPhlet1vGMi5hgvFc
         PxsLGfAuBYKqCu0Lgm2jP7+GL0LFbUaML/bVCxOYSju1Dyts23hcAAoFF2iX6/FLv+Am
         lOXoipeYEI8U+P5EBl9e2jcpBq8NajOFOTVMm4TVhPbSZj1g1oZYE+WGveoAbLg13Xmd
         fHCBf+Psu9LVZ0mIoUgHreyubdtUqusFcJeaulqSqnZ2rLs+DHJW1qVXcbX7tPerAI0/
         FTu+lyi0W6mi7TjcZqb1tmyK78XSAjnH0IQQWI0MMmv5N2zmxXivRa9CzuPUniJUMluX
         AayQ==
X-Gm-Message-State: AGi0PuY/uZjZDwtMwa+HHZy9kO4R1iO4nOAGfhFNcg2x5vhRCwRcGt6T
        +miosJWk0t4bg9qbJuf3Nqg=
X-Google-Smtp-Source: APiQypICbrcX4mbJw1o/8w6UuN+MCXb038Do2Nh3mNuQotUU1M0GaPBw5Nsl0sn5CBAu7KFRA3CVAA==
X-Received: by 2002:a05:6512:10c9:: with SMTP id k9mr442339lfg.183.1586459808297;
        Thu, 09 Apr 2020 12:16:48 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id w5sm3843660ljj.47.2020.04.09.12.16.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2020 12:16:47 -0700 (PDT)
Subject: Re: [PATCH v6 09/14] memory: tegra: Add EMC scaling support code for
 Tegra210
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Joseph Lo <josephl@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20200409175238.3586487-1-thierry.reding@gmail.com>
 <20200409175238.3586487-10-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a9afb1b5-3141-4923-c7fa-194228081e1b@gmail.com>
Date:   Thu, 9 Apr 2020 22:16:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200409175238.3586487-10-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

09.04.2020 20:52, Thierry Reding пишет:
...
> +static int tegra210_emc_set_rate(struct device *dev,
> +				 const struct tegra210_clk_emc_config *config)
> +{
> +	struct tegra210_emc *emc = dev_get_drvdata(dev);
> +	struct tegra210_emc_timing *timing = NULL;
> +	unsigned long rate = config->rate;
> +	s64 last_change_delay;
> +	unsigned long flags;
> +	unsigned int i;
> +
> +	if (rate == emc->last->rate * 1000UL)
> +		return 0;

Couldn't all the rates be expressed in Hz? Then you won't need all these
multiplications by 1000.

> +	for (i = 0; i < emc->num_timings; i++) {
> +		if (emc->timings[i].rate * 1000UL == rate) {
> +			timing = &emc->timings[i];
> +			break;
> +		}
> +	}
> +
> +	if (!timing)
> +		return -EINVAL;
> +
> +	if (rate > 204000000 && !timing->trained)
> +		return -EINVAL;
> +
> +	emc->next = timing;
> +	last_change_delay = ktime_us_delta(ktime_get(), emc->clkchange_time);
> +
> +	/* XXX use non-busy-looping sleep? */
> +	if ((last_change_delay >= 0) &&
> +	    (last_change_delay < emc->clkchange_delay))
> +		udelay(emc->clkchange_delay - (int)last_change_delay);
> +
> +	spin_lock_irqsave(&emc->lock, flags);
> +	tegra210_emc_set_clock(emc, config->value);
> +	emc->clkchange_time = ktime_get();
> +	emc->last = timing;
> +	spin_unlock_irqrestore(&emc->lock, flags);
> +
> +	return 0;
> +}

I'd suggest to check how much time invocation of ktime_get() takes, at
least it came to a surprise to me in a case of the tegra-cpuidle driver.

It may be well over the emc->clkchange_delay.

...
> +static int tegra210_emc_probe(struct platform_device *pdev)
> +{
...
> +	emc->clkchange_delay = 100;
> +	emc->training_interval = 100;

Not sure why these aren't a constant with the code.. ?

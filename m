Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B94B45E2D
	for <lists+linux-tegra@lfdr.de>; Fri, 14 Jun 2019 15:29:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727949AbfFNN3X (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 14 Jun 2019 09:29:23 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:32942 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727916AbfFNN3W (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 14 Jun 2019 09:29:22 -0400
Received: by mail-lf1-f67.google.com with SMTP id y17so1773044lfe.0;
        Fri, 14 Jun 2019 06:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Yb2rk4m18t9kDveritMkKbXhIs8G2QRg5Je/FAjvrOs=;
        b=Oltx8mxAr5seRIF3UG+ilvyHqb6I9aM2y7inkEae4g/YIVojiSG/n3CBhHRqEqGxR8
         iIQnkfZJypm/QFkcxnSE7qGc23QsZsYC74EcxXA9GyOHrolr9GbEXCWv7zMi+xeRLPmt
         +dbRWhAVJm+5hV2W6YneW7UoMiqUBEiMyOJb7a9YrjieSUwEe2u1iwayXIyhy0YI0OiC
         K+XeLiRbxU9IeR950isqE8V1ylM7uHh6XnVxv6FQSC+w5lXCL1kw+id6+hZ0YKY9olti
         pHyLEiBpwsqx8Wcnpfp+G+Q2KWmG/7W4ygRAFPfxbKYRPoKc6WcBJDpr6NqgCZliailj
         YAQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Yb2rk4m18t9kDveritMkKbXhIs8G2QRg5Je/FAjvrOs=;
        b=iEjJYN43wQFro81KX1/OAzhiorykle26rwr8n2ckliiO03b3d52/C/c4yASKu7JYgU
         8OTlY4/9Of+4inWts9RZyLG52nRHgua1PcIWIlN7I+KhzOo7aii6mctz+PYrKcvzxOeO
         /XiG5xTsOGK/1k6AThpJKX8A5cJzDbRx8vU3CraiacGE6ZpEZw52xwK4f93PFwnTEO/I
         vc+QCZ3lDyuksYBRJEcJofXB6qYzCOWOThcxtqHQd5tjth/fyOiotWgzbyIF08SBhYnm
         bpzYiTHMktWeQPF3gX7ZRUWzF1QBrv2jQup7yOYKPlLkKf6APFqPHc8x0jWkNQvxpiSZ
         2S6w==
X-Gm-Message-State: APjAAAUPsEcDCWduZhTeq0aYY8h497p1HEi6BQBzu8IYAitorb1yHY8Z
        KcjfSkEkjjuL9hhoXO0XcKrjoEsW
X-Google-Smtp-Source: APXvYqyaSPvtMJFokOQ1+CoDRMOmEsVR6NVWqYadY6jo4yoYFlXEd5hokGr/WfeDzvltjf9A2zPnkA==
X-Received: by 2002:ac2:494f:: with SMTP id o15mr19472105lfi.84.1560518959432;
        Fri, 14 Jun 2019 06:29:19 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-79-162-197.pppoe.mtu-net.ru. [91.79.162.197])
        by smtp.googlemail.com with ESMTPSA id e8sm544915lfc.27.2019.06.14.06.29.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Jun 2019 06:29:18 -0700 (PDT)
Subject: Re: [PATCH 1/2] clocksource: tegra: Use rating when registering clock
 source
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20190614104747.19712-1-thierry.reding@gmail.com>
 <8ff5d2da-907e-611c-ec82-bbe50197c2f4@gmail.com>
 <20190614132253.GE15526@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <3c339341-e77a-38aa-702a-1aef6c229eed@gmail.com>
Date:   Fri, 14 Jun 2019 16:29:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190614132253.GE15526@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

14.06.2019 16:22, Thierry Reding пишет:
> On Fri, Jun 14, 2019 at 03:24:07PM +0300, Dmitry Osipenko wrote:
>> 14.06.2019 13:47, Thierry Reding пишет:
>>> From: Thierry Reding <treding@nvidia.com>
>>>
>>> The rating is parameterized depending on SoC generation to make sure it
>>> takes precedence on implementations where the architected timer can't be
>>> used. This rating is already used for the clock event device. Use the
>>> same rating for the clock source to be consistent.
>>>
>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>>> ---
>>>  drivers/clocksource/timer-tegra.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/clocksource/timer-tegra.c b/drivers/clocksource/timer-tegra.c
>>> index f6a8eb0d7322..e6608141cccb 100644
>>> --- a/drivers/clocksource/timer-tegra.c
>>> +++ b/drivers/clocksource/timer-tegra.c
>>> @@ -318,7 +318,7 @@ static int __init tegra_init_timer(struct device_node *np, bool tegra20,
>>>  	sched_clock_register(tegra_read_sched_clock, 32, TIMER_1MHz);
>>>  
>>>  	ret = clocksource_mmio_init(timer_reg_base + TIMERUS_CNTR_1US,
>>> -				    "timer_us", TIMER_1MHz, 300, 32,
>>> +				    "timer_us", TIMER_1MHz, rating, 32,
>>>  				    clocksource_mmio_readl_up);
>>>  	if (ret)
>>>  		pr_err("failed to register clocksource: %d\n", ret);
>>>
>>
>> Looks good. Although, could you please clarify whether arch-timer stops on T210 when CPU
>> enters deepest (powerdown) idle state? I'm starting to lose track a bit already. Because
>> if arch-timer stops in the deepest idle state, then it's a bit odd that Joseph didn't add
>> the clocksource for T210 in the first place and v5.1 probably shouldn't work well because
>> of that already.
> 
> Yes, the architected timer doesn't work across an SC7 (which is what the
> deepest idle state is called on Tegra210) transition, hence why we can't
> use it as a suspend clocksource. I actually sent out a patch to do that,
> earlier.
> 
> And yes, it's entirely possible that v5.1 doesn't work in this regard,
> but we're not noticing that because we don't have suspend/resume support
> for Tegra210 anyway. There are a couple of missing pieces that we need
> in order to make it work.
> 
> This change in particular is only going to affect the CPU idle state
> (CC7). Since the architected timer doesn't survive that either, we need
> the Tegra timer to be preferred over the architected timer for normal
> operation.
> 
> All of these issues go away on Tegra186 and later, where the architected
> timer is in an always-on partition and has a PLL that remains on during
> SC7 (and CC7).

Thank you very much for the clarification. But then what about the
sched_clock? I suppose sched_clock will suffer on T210 as well and it's
a bit trickier case because apparently arch-timer always wins since it
has a higher precision. I guess the best solution will be to just bail
out from arch-timer's driver probe in a case of T210.

if (of_machine_is_compatible("nvidia,tegra210"))
	return 0.

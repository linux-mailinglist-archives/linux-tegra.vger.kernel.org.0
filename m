Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47CD66CC56
	for <lists+linux-tegra@lfdr.de>; Thu, 18 Jul 2019 11:53:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726482AbfGRJxG (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 18 Jul 2019 05:53:06 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:15865 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726383AbfGRJxG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 18 Jul 2019 05:53:06 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d3041870000>; Thu, 18 Jul 2019 02:53:11 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 18 Jul 2019 02:53:04 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 18 Jul 2019 02:53:04 -0700
Received: from [10.21.132.148] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 18 Jul
 2019 09:53:03 +0000
Subject: Re: [PATCH v1] soc/tegra: pmc: Query PCLK clock rate at probe time
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>
CC:     <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20190707230843.11224-1-digetx@gmail.com>
 <c9bd6dd3-7a03-6e2c-db9f-fefa059a428f@nvidia.com>
Message-ID: <aa12115c-bf1c-f50b-f38a-97fb398d1af0@nvidia.com>
Date:   Thu, 18 Jul 2019 10:53:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <c9bd6dd3-7a03-6e2c-db9f-fefa059a428f@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1563443591; bh=OYwt3mPj9v55+IxKhE/T3ZeCB4Gi6UOlq8aCbBuKd3w=;
        h=X-PGP-Universal:Subject:From:To:CC:References:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=QudFx5KhnAXpLvXRQy20R9QtIBNuMo2qAAgSj7MQcevp75JMrw+JBPrn889mCzSkc
         37P3fzC7tfGuPJAXGvRSvXtjrH/hwqZ9idrrHCX7oAMVLIYoykWuGU80zNw8W/rP7q
         okN5IbIVBl26oqeNgK/cV+ho4KQl2cCwxUgy6N1+Ra6mL+ABu/NkQCJ/ii0yMjG14J
         K/UGKekIQmj0qrGCiIoHzTSL+WL/pzsiPQLnMzTFSVpxEdEoOoH31SFF0coOTQ8prk
         6lWGztS8XsNO/BxYfP3QY2zTs89ivEovXlOgw5fn5V/jn+9JF43EiBiE8w9oqL7EWe
         9X/hFXOQVAJqg==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 18/07/2019 10:45, Jon Hunter wrote:
> 
> On 08/07/2019 00:08, Dmitry Osipenko wrote:
>> The PCLK clock is running off SCLK, which is a critical clock that is
>> very unlikely to randomly change its rate. It's also a bit clumsy (and
>> apparently incorrect) to query the clock's rate with interrupts being
>> disabled because clk_get_rate() takes a mutex and that's the case during
>> suspend/cpuidle entering. Lastly, it's better to always fully reprogram
>> PMC state because it's not obvious whether it could be changed after SC7.
> 
> I agree with the first part, but I would drop the last sentence because
> I see no evidence of this. Maybe Peter can confirm.
> 
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/soc/tegra/pmc.c | 26 +++++++++++---------------
>>  1 file changed, 11 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
>> index 9f9c1c677cf4..532e0ada012b 100644
>> --- a/drivers/soc/tegra/pmc.c
>> +++ b/drivers/soc/tegra/pmc.c
>> @@ -1433,6 +1433,7 @@ void tegra_pmc_set_suspend_mode(enum tegra_suspend_mode mode)
>>  void tegra_pmc_enter_suspend_mode(enum tegra_suspend_mode mode)
>>  {
>>  	unsigned long long rate = 0;
>> +	u64 ticks;
>>  	u32 value;
>>  
>>  	switch (mode) {
>> @@ -1441,7 +1442,7 @@ void tegra_pmc_enter_suspend_mode(enum tegra_suspend_mode mode)
>>  		break;
>>  
>>  	case TEGRA_SUSPEND_LP2:
>> -		rate = clk_get_rate(pmc->clk);
>> +		rate = pmc->rate;
> 
> There is another call to clk_get_rate() that could be removed as well.
> 
>>  		break;
>>  
>>  	default:
>> @@ -1451,26 +1452,20 @@ void tegra_pmc_enter_suspend_mode(enum tegra_suspend_mode mode)
>>  	if (WARN_ON_ONCE(rate == 0))
>>  		rate = 100000000;
>>  
>> -	if (rate != pmc->rate) {
>> -		u64 ticks;
>> -
>> -		ticks = pmc->cpu_good_time * rate + USEC_PER_SEC - 1;
>> -		do_div(ticks, USEC_PER_SEC);
>> -		tegra_pmc_writel(pmc, ticks, PMC_CPUPWRGOOD_TIMER);
>> -
>> -		ticks = pmc->cpu_off_time * rate + USEC_PER_SEC - 1;
>> -		do_div(ticks, USEC_PER_SEC);
>> -		tegra_pmc_writel(pmc, ticks, PMC_CPUPWROFF_TIMER);
>> +	ticks = pmc->cpu_good_time * rate + USEC_PER_SEC - 1;
>> +	do_div(ticks, USEC_PER_SEC);
>> +	tegra_pmc_writel(pmc, ticks, PMC_CPUPWRGOOD_TIMER);
> 
> You could go a step further and update the cpu_good_time/cpu_off_time to
> be ticks and calculated once during probe and recalculated if
> tegra_pmc_set_suspend_mode is called. I am not sure why we really need
> to pass mode to tegra_pmc_enter_suspend_mode() seeing as the mode is
> stored in the pmc struct.
> 
>>  
>> -		wmb();
>> -
>> -		pmc->rate = rate;
>> -	}
>> +	ticks = pmc->cpu_off_time * rate + USEC_PER_SEC - 1;
>> +	do_div(ticks, USEC_PER_SEC);
>> +	tegra_pmc_writel(pmc, ticks, PMC_CPUPWROFF_TIMER);
>>  
>>  	value = tegra_pmc_readl(pmc, PMC_CNTRL);
>>  	value &= ~PMC_CNTRL_SIDE_EFFECT_LP0;
>>  	value |= PMC_CNTRL_CPU_PWRREQ_OE;
>>  	tegra_pmc_writel(pmc, value, PMC_CNTRL);
>> +
>> +	wmb();

I would not move the barrier unless there is a good reason. Maybe it is
intentional that this happens before the other writes.

Jon

-- 
nvpublic

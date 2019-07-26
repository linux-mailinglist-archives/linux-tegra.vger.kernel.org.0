Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B63B76B79
	for <lists+linux-tegra@lfdr.de>; Fri, 26 Jul 2019 16:23:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387477AbfGZOXP (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 26 Jul 2019 10:23:15 -0400
Received: from mail.kmu-office.ch ([178.209.48.109]:55318 "EHLO
        mail.kmu-office.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725869AbfGZOXP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 26 Jul 2019 10:23:15 -0400
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
        by mail.kmu-office.ch (Postfix) with ESMTPSA id EDCF55C0CE3;
        Fri, 26 Jul 2019 16:23:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
        t=1564150992;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=E5FMo6ELzebhiWgFCcrTDqmf5tKgwdevClIfhESEF3U=;
        b=dBEi8+80uL2lmGFpZLhKcS/qTHioGXH64pG245YbHH/YbMEnmAV73uL3DEIAadPCBHMWuO
        /ZwAOsLPL8o5h0X9GBieEvdd1/37Fcs2DRufDOTpkszqw+v/GpzzOkpJvYvMcl7BRiZuQP
        AhTCzMn0TNTO2I8rN5auX6bflp6YhFc=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Date:   Fri, 26 Jul 2019 16:23:12 +0200
From:   Stefan Agner <stefan@agner.ch>
To:     thierry.reding@gmail.com, airlied@linux.ie
Cc:     jonathanh@nvidia.com, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/tegra: return with probe defer if GPIO subsystem is
 not ready
In-Reply-To: <de84d04c902d1f7f22b6f024b853a1c7@agner.ch>
References: <20180726133606.14587-1-stefan@agner.ch>
 <de84d04c902d1f7f22b6f024b853a1c7@agner.ch>
Message-ID: <cd14bca0a1f1e097265602a1d5f0c0f5@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Thierry, Hi Dave,

On 2018-09-07 01:31, Stefan Agner wrote:
> On 26.07.2018 06:36, Stefan Agner wrote:
>> If the GPIO subsystem is not ready make sure to return -EPROBE_DEFER
>> instead of silently continuing without HPD.
>>
>> Reported-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
>> Signed-off-by: Stefan Agner <stefan@agner.ch>
> 
> I think this did not get merged yet, any chance to get it in?

Any chance to get this in in the next merge window?

--
Stefan

> 
> --
> Stefan
> 
>> ---
>>  drivers/gpu/drm/tegra/output.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
>> index ffe34bd0bb9d..4bcefe455afd 100644
>> --- a/drivers/gpu/drm/tegra/output.c
>> +++ b/drivers/gpu/drm/tegra/output.c
>> @@ -133,7 +133,9 @@ int tegra_output_probe(struct tegra_output *output)
>>  	output->hpd_gpio = of_get_named_gpio_flags(output->of_node,
>>  						   "nvidia,hpd-gpio", 0,
>>  						   &output->hpd_gpio_flags);
>> -	if (gpio_is_valid(output->hpd_gpio)) {
>> +	if (output->hpd_gpio == -EPROBE_DEFER) {
>> +		return -EPROBE_DEFER;
>> +	} else if (gpio_is_valid(output->hpd_gpio)) {
>>  		unsigned long flags;
>>
>>  		err = gpio_request_one(output->hpd_gpio, GPIOF_DIR_IN,

Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DEFC161516
	for <lists+linux-tegra@lfdr.de>; Mon, 17 Feb 2020 15:51:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729226AbgBQOvv (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 17 Feb 2020 09:51:51 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:40502 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728375AbgBQOvv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 17 Feb 2020 09:51:51 -0500
Received: by mail-lj1-f195.google.com with SMTP id n18so19171286ljo.7;
        Mon, 17 Feb 2020 06:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=UzdcYM1FH1U80h/QefOyZ2VNdrfjLgVyGyfCOH6iHYc=;
        b=RM/KkU8l9yevhB+6g9xchiXuY75DbXFZ2r8l2ZHEt1x7XSmWHYYfTVn5UbMxm39oM2
         UE+C9oHKYZ0Si8oJxZUZ8ON0LMB13aUX1fxKpucut+6AagIMRQUF5Bpv44zYI06Blnks
         bGtuE0Nfyq1jOr6eqDceXbOYsdd4TOwhuu1YQdR2uB9WNTTRsvJ0S08eyfCkE2u/YpjL
         SBjXTfUoxGugQbrL01BsNlQ5GRn0O2eG3Cjjed4aZz6rL0MY1WPZtZMKAwO3iisdBQP+
         x3yf0GnV4zxvLokWE5KfrpXaHYpNDsEL6syORMoFv2y3co2iBkTjMv6ieqwOT5TZf9Pt
         wjSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UzdcYM1FH1U80h/QefOyZ2VNdrfjLgVyGyfCOH6iHYc=;
        b=Ynmj9rNbrLMhqEtpDO4iGQ3V1BnqImBJTDjrJqJwsLYpgvd4Ozn52pf/3zxNY0d1Tz
         0q+t5a9kRicplOloy+dvDI2uB1I8Lgk+urwAxFlDfb/5hPg9WEPmehWnjoGGIeGs6Jlr
         h4TtV/NlY+4QhZJwGM7rC7v5bn5qo7SMmEQjNsig2qG+RDnfVRzz3DKlD4TcWuoWrS8a
         hntFJwE9IPvUfEy99ECp/TjzmAwQI0EIrtE27hunj/gxJzmm2AGo6c5aDkS8CpqZXuuA
         cW3TKA6stncZ6wlJEYCeggRYYzr01hDNIO7s+bs4kZVwmQaExcXMKRwfIaolNBQJlqRr
         +9CQ==
X-Gm-Message-State: APjAAAVc5iHq7h8n7MLtsv33snx6SBTH7iNbMQl83+uGns1DRDRa6KV1
        7L0LrgLHXrN4v4bMgfSybbMVplZ3
X-Google-Smtp-Source: APXvYqwCI3HPBjE7bzB7TxAfVjglLjP+BEr9pUeKJEdvUcghKDvYOtxJaaJ5Vhx4VtyKXPTQXGwlDA==
X-Received: by 2002:a2e:300e:: with SMTP id w14mr10139193ljw.222.1581951106760;
        Mon, 17 Feb 2020 06:51:46 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id m11sm500750lfj.42.2020.02.17.06.51.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2020 06:51:46 -0800 (PST)
Subject: Re: [PATCH v8 11/22] ASoC: tegra: Add fallback implementation for
 audio mclk
To:     Thierry Reding <thierry.reding@gmail.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     jonathanh@nvidia.com, broonie@kernel.org, lgirdwood@gmail.com,
        perex@perex.cz, tiwai@suse.com, mperttunen@nvidia.com,
        gregkh@linuxfoundation.org, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com,
        spujar@nvidia.com, josephl@nvidia.com, daniel.lezcano@linaro.org,
        mmaddireddy@nvidia.com, markz@nvidia.com,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1578986667-16041-1-git-send-email-skomatineni@nvidia.com>
 <1578986667-16041-12-git-send-email-skomatineni@nvidia.com>
 <20200217094020.GM1339021@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <072c8e53-58fa-4e14-2106-00a5226a230f@gmail.com>
Date:   Mon, 17 Feb 2020 17:51:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200217094020.GM1339021@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

17.02.2020 12:40, Thierry Reding пишет:
> On Mon, Jan 13, 2020 at 11:24:16PM -0800, Sowjanya Komatineni wrote:
>> mclk is from clk_out_1 which is part of Tegra PMC block and pmc clocks
>> are moved to Tegra PMC driver with pmc as clock provider and using pmc
>> clock ids.
>>
>> New device tree uses clk_out_1 from pmc clock provider as audio mclk.
>>
>> So, this patch adds implementation for mclk fallback to extern1 when
>> retrieving mclk returns -ENOENT to be backward compatible of new device
>> tree with older kernels.
>>
>> Fixes: 110147c8c513 ("ASoC: tegra: always use clk_get() in utility code")
>>
>> Tested-by: Dmitry Osipenko <digetx@gmail.com>
>> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>>  sound/soc/tegra/tegra_asoc_utils.c | 18 +++++++++++++++---
>>  1 file changed, 15 insertions(+), 3 deletions(-)
> 
> There's some inconsistent spelling of PMC in the above, but other than
> that:
> 
> Acked-by: Thierry Reding <treding@nvidia.com>
> 

Seems you missed my point.. this patch doesn't work at all, and thus, it
should be dropped.

Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2904F90C0
	for <lists+linux-tegra@lfdr.de>; Tue, 12 Nov 2019 14:34:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725944AbfKLNe7 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 12 Nov 2019 08:34:59 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:45571 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725865AbfKLNe6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 12 Nov 2019 08:34:58 -0500
Received: by mail-lj1-f194.google.com with SMTP id n21so17813101ljg.12
        for <linux-tegra@vger.kernel.org>; Tue, 12 Nov 2019 05:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QxnjP4us8U6oF8GbMLs1G2K15TcqWwmlcw0M+0Hvt/Q=;
        b=ec9sPtPbJmvkRZYzSvKr13Ivu14cDopLWAX4gwrh7OMfkfFAKDN8Rd6ks4gfUk3xHM
         OaejkdCoXY/6M4IuIqQ9J7ZyeZC9wOLt6PiDkJUOd6t+NfuZSdhIov/xh9jh/QGPI7z3
         Ct+b4y82/mIfol2p8ivYvYBNBQpfxaSCEHw9rVkCcQmiTi0QVd2YGqCyZceAn5bJxzVH
         VnS1zwt8U1rb0Al7iZrASb9NyTUNxENy8lle3d5NFNWLQ96Hwtok6xclI9X//dr6hvdM
         V6VqTStx8YBMvKgyNfU38iN5rjigJYZNYn2u9uD9R+meTrpFnRLneiYPGajSAERZCqKW
         jdLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QxnjP4us8U6oF8GbMLs1G2K15TcqWwmlcw0M+0Hvt/Q=;
        b=aDIjUliTX2UftQyIKGTfwC+m2R+pOgWeyPxGRPWFGfuWuHU9p4S8tmLMqC7DqUI+Wk
         5ZBCar8ATGHRM5ZvVC2HFvKmzF2rO0U4haoTfNAOdIYgkemNBNXexhazmKA6X3h3oaPg
         qMAEJHBDitIIOHWX73EmJNQ9VONIW5Kb9FjOa9H604e6j1oKRx49H1cTRWP2RpkTtC1r
         dA/3dXg4tabuqmYarzy/w+SNOlPB6XrrlINOfhwhJUm29f15LZT5WInvgfABawKQVGBb
         hTqY782onEKiqHfJVGbJI54zAQnP0MZ1sI2BnhI9p6Cg22cXu+jetXAKAyrGPdGOPe0Z
         zQEg==
X-Gm-Message-State: APjAAAULD9c198q4/xbAVbhofkMpeKOFu17oJuyhigRgaY6xcLLl1IuM
        AV6gWRWKpEVWhXV+xa42VGQ98H+H
X-Google-Smtp-Source: APXvYqyVbe0xD5x3X4Zl3vZKIOb3AY0VpWsBBRL3V1zXHG64k8XNU1pXPysmrMm9Kj6dV37NDKa9zQ==
X-Received: by 2002:a2e:2e03:: with SMTP id u3mr21081032lju.115.1573565694379;
        Tue, 12 Nov 2019 05:34:54 -0800 (PST)
Received: from [192.168.2.145] (94-29-10-250.dynamic.spd-mgts.ru. [94.29.10.250])
        by smtp.googlemail.com with ESMTPSA id x18sm8016039ljc.39.2019.11.12.05.34.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Nov 2019 05:34:53 -0800 (PST)
Subject: Re: [PATCH v2 1/3] soc/tegra: fuse: Cache values of straps and Chip
 ID registers
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org
References: <20191111212637.22648-1-digetx@gmail.com>
 <20191111212637.22648-2-digetx@gmail.com>
 <20191112044401.GA13124@qmqm.qmqm.pl>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <f43c7c50-72a7-0563-dff9-eab526ffd8c7@gmail.com>
Date:   Tue, 12 Nov 2019 16:34:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191112044401.GA13124@qmqm.qmqm.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

12.11.2019 07:44, Michał Mirosław пишет:
> On Tue, Nov 12, 2019 at 12:26:35AM +0300, Dmitry Osipenko wrote:
>> There is no need to re-read Chip ID and HW straps out from hardware each
>> time, it is a bit nicer to cache the values in memory.
> [...]
>> @@ -103,6 +97,7 @@ void __init tegra_init_revision(void)
>>  
>>  void __init tegra_init_apbmisc(void)
>>  {
>> +	void __iomem *apbmisc_base, *strapping_base;
>>  	struct resource apbmisc, straps;
>>  	struct device_node *np;
>>  
>> @@ -162,10 +157,14 @@ void __init tegra_init_apbmisc(void)
>>  	apbmisc_base = ioremap_nocache(apbmisc.start, resource_size(&apbmisc));
>>  	if (!apbmisc_base)
>>  		pr_err("failed to map APBMISC registers\n");
>> +	else
>> +		chipid = readl_relaxed(apbmisc_base + 4);
>>  
>>  	strapping_base = ioremap_nocache(straps.start, resource_size(&straps));
>>  	if (!strapping_base)
>>  		pr_err("failed to map strapping options registers\n");
>> +	else
>> +		strapping = readl_relaxed(strapping_base);
>>  
>>  	long_ram_code = of_property_read_bool(np, "nvidia,long-ram-code");
>>  }
> 
> Since this no longer uses the mappings after init, you could iounmap()
> them here.

Yes, it could be done. Although, that won't do much on ARM32 because APB
registers are statically mapped in arch/arm/mach-tegra/io.c.

Anyways, it should be good to have regs unmapped just for consistency.
Thank you for the suggestion, I'll add a patch for the unmapping.

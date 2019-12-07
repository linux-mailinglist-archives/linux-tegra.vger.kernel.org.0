Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 776E8115D4B
	for <lists+linux-tegra@lfdr.de>; Sat,  7 Dec 2019 16:04:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726442AbfLGPET (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sat, 7 Dec 2019 10:04:19 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:39919 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726400AbfLGPET (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 7 Dec 2019 10:04:19 -0500
Received: by mail-lj1-f193.google.com with SMTP id e10so10798446ljj.6;
        Sat, 07 Dec 2019 07:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=n8a+Wo0Uh6h7aFSS48D/6SstLsiUjh8g7OoKXGq8H00=;
        b=F6+K7JPqGvnQPCj28mwmw64tWflHmRmyDRI8MKlZXjoZzQqgZFfel3SZ4iaYF1AlRg
         se5iYaUtMXNNsTEwCwgnyVAZHCG6BoMefsmABDu8mCKuq44oE48Doj9GUhZ3RZNXZZsn
         Os2c9bNKrc4rUcmbifRJYrZags2606oCFJDSI8PgmOVo3lDwHUmPwvkw2emjqpxUmiQi
         asRj4d90tqVR976m0ftDXNrJPP/8dmeIe6JHHVdHru6kwcFXBSm0/NQtsIWpWnzlDNYI
         gUln+JQDYnkTtJjvWPat3QEQan9Ma7wsD7UKvsevW1SMhLQWs3/5cOXDVnEa+8azxRuS
         k5RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=n8a+Wo0Uh6h7aFSS48D/6SstLsiUjh8g7OoKXGq8H00=;
        b=XMChmrqd+gfL/ckhGqKj5bR7mlXWQnoJq+hLWXoSyMN1jwkVDIfSr7yOurCrNjWYW7
         LxbU2vEUEjJ4cgVfT0KKwulTY02DuhOcruh03gwZYm56dAYZYYcaF0IuUCmVW3AGb+3K
         bJl/XvsmRHYAHrAfx858naD4RhjjgGt5IJiRC6iuSqiv3D7zxEnzght86G6w9B8uujF3
         kNpm1Ri9XDGdaT45Bv6eNNQTv/A6673Z+s7ZzILwh127R36tVu08YiTaPJiWAdmtDb23
         YloLgrDjfG5nSI+BnNrQAYkcgJ2lTu16yVcrhIbi7ojGpS8mHvA22r7ZeBCPm8LSVNLD
         nVIg==
X-Gm-Message-State: APjAAAUGzP9/QpbKXefUydOldTYUOGMyxO9T1EXjg36EQzdv4+uE+GrV
        asYGoxJ3JIDGjSDS3Yd5jjE=
X-Google-Smtp-Source: APXvYqx8nqzLijIPm81DFDtG10vReYQUtoGSR6Xe9cy7lZcn9qwS9Z9YNCeclJLvekppT55wIsUI8Q==
X-Received: by 2002:a2e:90c6:: with SMTP id o6mr11710121ljg.93.1575731056973;
        Sat, 07 Dec 2019 07:04:16 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id z13sm8188887ljh.21.2019.12.07.07.04.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Dec 2019 07:04:16 -0800 (PST)
Subject: Re: [PATCH v3 06/15] clk: tegra: Remove tegra_pmc_clk_init along with
 clk ids
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        mperttunen@nvidia.com, gregkh@linuxfoundation.org,
        sboyd@kernel.org, tglx@linutronix.de, robh+dt@kernel.org,
        mark.rutland@arm.com
Cc:     allison@lohutok.net, pdeschrijver@nvidia.com, pgaikwad@nvidia.com,
        mturquette@baylibre.com, horms+renesas@verge.net.au,
        Jisheng.Zhang@synaptics.com, krzk@kernel.org, arnd@arndb.de,
        spujar@nvidia.com, josephl@nvidia.com, vidyas@nvidia.com,
        daniel.lezcano@linaro.org, mmaddireddy@nvidia.com,
        markz@nvidia.com, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
        broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
        alexios.zavras@intel.com, alsa-devel@alsa-project.org
References: <1575600535-26877-1-git-send-email-skomatineni@nvidia.com>
 <1575600535-26877-7-git-send-email-skomatineni@nvidia.com>
 <3880aa15-c47a-5ab2-dd39-e8a47f6a3d6a@gmail.com>
 <e342a6e7-f213-53b4-1388-23cf61cf6fbb@gmail.com>
Message-ID: <5938df22-2474-3950-fc33-3e19cbf3da9c@gmail.com>
Date:   Sat, 7 Dec 2019 18:04:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <e342a6e7-f213-53b4-1388-23cf61cf6fbb@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

07.12.2019 17:43, Dmitry Osipenko пишет:
> 07.12.2019 17:33, Dmitry Osipenko пишет:
>> 06.12.2019 05:48, Sowjanya Komatineni пишет:
>>> Current Tegra clock driver registers PMC clocks clk_out_1, clk_out_2,
>>> clk_out_3 and blink output in tegra_pmc_init() which does direct Tegra
>>> PMC access during clk_ops and these PMC register read and write access
>>> will not happen when PMC is in secure mode.
>>>
>>> Any direct PMC register access from non-secure world will not go
>>> through and all the PMC clocks and blink control are done in Tegra PMC
>>> driver with PMC as clock provider.
>>>
>>> This patch removes tegra_pmc_clk_init along with corresponding clk ids
>>> from Tegra clock driver.
>>>
>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>> ---
>>
>> [snip]
>>
>>> @@ -1230,9 +1222,6 @@ static struct tegra_clk_init_table init_table[] __initdata = {
>>
>>>  	{ TEGRA30_CLK_PLL_A, TEGRA30_CLK_CLK_MAX, 564480000, 1 },
>>>  	{ TEGRA30_CLK_PLL_A_OUT0, TEGRA30_CLK_CLK_MAX, 11289600, 1 },
>>>  	{ TEGRA30_CLK_EXTERN1, TEGRA30_CLK_PLL_A_OUT0, 0, 1 },
>>
>> Perhaps these clocks do not need to be always-enabled?
>>
>> [snip]
>>
> 
> Also, EXTERN1 parent configuration should be moved to the audio
> driver/device-tree as well.

Ah, I missed that it's done in the patch #10.

> Maybe it even makes sense to move the whole configuration, including
> PLLA. I don't see why clk driver need to do something for the audio driver.

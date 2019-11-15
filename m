Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3120FDEBA
	for <lists+linux-tegra@lfdr.de>; Fri, 15 Nov 2019 14:17:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727415AbfKONRt (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 15 Nov 2019 08:17:49 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:46297 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727249AbfKONRt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 15 Nov 2019 08:17:49 -0500
Received: by mail-lj1-f193.google.com with SMTP id e9so10634819ljp.13;
        Fri, 15 Nov 2019 05:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LaT4x0/Kn3VzE52WjGHu+FObrFAqvFc8L85812xoatc=;
        b=mz+RtK2yqtwyU+TnBxer5tMlnxuXQMLXeb2JAtEkvIZToF426WhJxXIhL5plwglouD
         +h+Uj26zJTzqT69+2sXRr1+ej6YfRP8945+QfaacL88Gh2MYRAxJjoH8dk1fHmBKPQQt
         AIH3/7Z5ljaFSSQZ1J4wtiuwu0eOLrhfe4EtUgdBXkqOn0XPdzelyr9RK8GCRLlGQhRs
         5D13X4GVcQzdrP69wrz6ULxcQfsjb7ImUrMR0tSynqatzfxh1WPjD5TxXUrpQXrjyomb
         RGTwiPneOwNVLT99Ti2NhREzZeLmuJDVDgwmG8UaRAPl1QnnaM7g1SVvw+ORtVWssB47
         0Tyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LaT4x0/Kn3VzE52WjGHu+FObrFAqvFc8L85812xoatc=;
        b=HTGOZWmSv1BHDLHQua4U7hY7HaceW40/ePH4oRy+MYV5ig7dTJqWHivI2WD8uvYxUW
         MZXwywwTplPCNYg2T3PazFEWtFuk2VBLQaODh92A8wo6mGm3bpVntMrI7QoSSb4AGEKx
         rasTg8/G6oYhlfFq7c+9BBC8QMCVbEYmVwACZRXuGD/BYSrXn7NwR3tS+f545dKkPiu7
         /djOvZmY01U54K3vxYuT0+wWam7AcjH7/d+sdvOHPjjpuUK7Q7Dj48qkZBM+mySlgKoN
         VwgY7Xdqh9iBAxtoMkKzlNP7LPLBAchUemogVeuLcPSGqgi/R1CL3vmU5QLRP7dP9RVU
         gkpA==
X-Gm-Message-State: APjAAAWBIoN4XbWzDdo4klMXtFLWAWLXyBeJu49dkAw4XpJZyt5tkoHs
        PBRWj6lwbe+thuRqDPu350/c6no7
X-Google-Smtp-Source: APXvYqyoHPvDBFzYpzzcjiOYRsoChjplgewAT3NGoJCo7TO+Z9xmod+iayB/xKe5/6hwje3Gwb0qjA==
X-Received: by 2002:a2e:97d8:: with SMTP id m24mr11567246ljj.62.1573823865644;
        Fri, 15 Nov 2019 05:17:45 -0800 (PST)
Received: from [192.168.2.145] (94-29-10-250.dynamic.spd-mgts.ru. [94.29.10.250])
        by smtp.googlemail.com with ESMTPSA id u11sm3874338ljo.17.2019.11.15.05.17.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Nov 2019 05:17:44 -0800 (PST)
Subject: Re: [PATCH v10 12/15] memory: tegra: Introduce Tegra30 EMC driver
To:     Jon Hunter <jonathanh@nvidia.com>, Joseph Lo <josephl@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20190811210043.20122-1-digetx@gmail.com>
 <20190811210043.20122-13-digetx@gmail.com>
 <41ab3704-46e4-696d-2577-9d0a35ed2861@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <01141234-b0c2-63a9-1c81-b7ec3b44fb6d@gmail.com>
Date:   Fri, 15 Nov 2019 16:17:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <41ab3704-46e4-696d-2577-9d0a35ed2861@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

15.11.2019 15:54, Jon Hunter пишет:
> 
> On 11/08/2019 22:00, Dmitry Osipenko wrote:
>> Introduce driver for the External Memory Controller (EMC) found on Tegra30
>> chips, it controls the external DRAM on the board. The purpose of this
>> driver is to program memory timing for external memory on the EMC clock
>> rate change.
>>
>> Acked-by: Peter De Schrijver <pdeschrijver@nvidia.com>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/memory/tegra/Kconfig       |   10 +
>>  drivers/memory/tegra/Makefile      |    1 +
>>  drivers/memory/tegra/mc.c          |    9 +-
>>  drivers/memory/tegra/mc.h          |   30 +-
>>  drivers/memory/tegra/tegra30-emc.c | 1232 ++++++++++++++++++++++++++++
>>  drivers/memory/tegra/tegra30.c     |   42 +
>>  include/soc/tegra/mc.h             |    2 +-
>>  7 files changed, 1311 insertions(+), 15 deletions(-)
>>  create mode 100644 drivers/memory/tegra/tegra30-emc.c
> 
> This patch is causing the following crash on Tegra30-cardhu-a04 on
> entering suspend ...
> 
> [   58.320034] 8<--- cut here ---
> [   58.323166] Unable to handle kernel NULL pointer dereference at virtual address 0000004c
> [   58.331262] pgd = 62bca252
> [   58.334028] [0000004c] *pgd=00000000
> [   58.337615] Internal error: Oops: 5 [#1] PREEMPT SMP ARM
> [   58.342927] Modules linked in: brcmfmac brcmutil
> [   58.347559] CPU: 1 PID: 689 Comm: rtcwake Tainted: G        W         5.4.0-rc6-next-20191108 #1
> [   58.356343] Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
> [   58.362620] PC is at tegra_emc_suspend+0x4/0x50
> [   58.367161] LR is at dpm_run_callback+0x38/0x1d4
> [   58.371778] pc : [<c07a9ce0>]    lr : [<c05c2a2c>]    psr: a0000113
> [   58.378042] sp : ee3afd98  ip : 00000000  fp : 00000000
> [   58.383265] r10: c1077e1c  r9 : ef254c54  r8 : c1077de4
> [   58.388488] r7 : c0d1d3e4  r6 : ef254c10  r5 : 00000002  r4 : c05b5e28
> [   58.395013] r3 : c07a9cdc  r2 : 00000000  r1 : c0bbadc4  r0 : ef254c10
> [   58.401542] Flags: NzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
> [   58.408677] Control: 10c5387d  Table: adcf804a  DAC: 00000051
> [   58.414423] Process rtcwake (pid: 689, stack limit = 0x8afb9f6f)
> [   58.420429] Stack: (0xee3afd98 to 0xee3b0000)
> [   58.424787] fd80:                                                       ef254c10 c110c438
> [   58.432969] fda0: 00000000 00000002 c1077de4 ef254c54 c1077e1c c05c30fc 00000000 ef254ca8
> [   58.441150] fdc0: ef254c10 c1077de4 c110c438 c1077de4 c05c3560 c1077e1c 00000000 c05c5730
> [   58.449330] fde0: 00000002 c10c3648 c10d3df0 00000000 00000002 00000003 c1004e48 00000004
> [   58.457511] fe00: ede68100 edf50210 00475228 c05c6030 c10d3dbc 00000000 00000003 c017d16c
> [   58.465693] fe20: c10c889c 00000004 ede68100 edf50210 00475228 c0181404 c0cbbba4 ee3afe5c
> [   58.473873] fe40: c10c889c e8e19516 ee3afe5c c1004e48 00000000 00000003 c10c889c 00000004
> [   58.482054] fe60: ede68100 edf50210 00475228 c017dd18 00000008 e8e19516 00000cc0 00000003
> [   58.490234] fe80: c0cbeff4 00000003 c10d3dd0 c017c088 00000004 edf50200 00000000 00000000
> [   58.498415] fea0: ede68100 ee3aff78 edf50210 c02fcfe4 00000000 00000000 c1004e48 c02fceec
> [   58.506602] fec0: 00476438 ee3aff78 00000000 00476438 00000004 c027a3f0 00000055 00000cc0
> [   58.514791] fee0: 00000477 00477000 edcf8010 edcf8010 00000000 00000000 00000000 00000000
> [   58.522981] ff00: ffefe1dc eff2b394 00000000 e8e19516 00000001 ee3affb0 ef2bb700 edf2a200
> [   58.531166] ff20: 0047743c 00000817 eddd5ad0 e8e19516 edf2a240 00000004 edc53e40 00476438
> [   58.539352] ff40: ee3aff78 00000000 00476438 00000004 00475228 c027b99c 00000000 00000000
> [   58.547542] ff60: c1004e48 edc53e40 00000000 00000000 edc53e40 c027bc3c 00000000 00000000
> [   58.555732] ff80: 00001008 e8e19516 0000006c 00476438 00475228 00000004 c0101204 ee3ae000
> [   58.563922] ffa0: 00000004 c0101000 0000006c 00476438 00000004 00476438 00000004 00000000
> [   58.572107] ffc0: 0000006c 00476438 00475228 00000004 00000004 00000004 0046278c 00475228
> [   58.580294] ffe0: 00000004 be9db9b8 b6eb3c0b b6e3e206 600f0030 00000004 00000000 00000000
> [   58.588491] [<c07a9ce0>] (tegra_emc_suspend) from [<c110c438>] (0xc110c438)
> [   58.595466] Code: e7c4321f e5c4304c e8bd8010 e5902040 (e5d2304c) 
> [   58.601656] ---[ end trace 8d7d1a7fb898a1d0 ]---
> [   88.142888] ------------[ cut here ]------------

Oh, right. I never tried to suspend without memory timings being defined
in DT.

Jon, thank you very much for the report. I'll make a patch to fix that
problem.

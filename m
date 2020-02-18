Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27A44162F8C
	for <lists+linux-tegra@lfdr.de>; Tue, 18 Feb 2020 20:14:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbgBRTO1 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 18 Feb 2020 14:14:27 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:36046 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726296AbgBRTO1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 18 Feb 2020 14:14:27 -0500
Received: by mail-lj1-f196.google.com with SMTP id r19so24282991ljg.3
        for <linux-tegra@vger.kernel.org>; Tue, 18 Feb 2020 11:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=eqiE3ON3yUFSWQHKc7DsePJvNE/YOV216x163adef4w=;
        b=nkyzVVvCjXm5Dc+wEe5FRHcJmm2DILVTS3MOfXabzi8uCeyHBbnCdLzUtz4Leu/IX2
         zZf7AvhQ6ikGYTAAoWftJ6SHRT5KHZu6M9snNXAHHc36JjoWKWrbR7zGfgBTdk3L+ygB
         7jjBQq9IQoO5xm9MwiaAbzO2pmumMHtLedqURR7VpQ999zigyD+vJVVHDEuOgYUdvLPe
         btuTNUdl2BsY6f1cvOcdLklA/fOaeySMlBQeIhDZ8zJ2upuzTgJPMpXf8cLISdDnEDwk
         kwCCfyfeFmcZs7NovzFTmQk2s3FCLpwE1cUv+HLZ2WBu2OU+eck9c3Km2CSDbsrXgO5N
         EzTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=eqiE3ON3yUFSWQHKc7DsePJvNE/YOV216x163adef4w=;
        b=YOjngyPKlDXh522rRTdjKwIAG9wVAad36Lf/Ifmh5j80z01/pCGNEfdRQnAbKaFXJu
         KGPN8BNXcRxMVH8J1KC9feTW9Eo03JMsjpHQZN60yKfr127sRXWR+ji2koMGG0E83JBC
         kmSfCwlIKPR6v3VL+edY4pWvL0y9RJEGaxRsMpIHV5GSZlUVukM8ll2Wr1fVWQ0t4yhq
         H9wMJbmJV4SmjD8xS2u6jhCrEl/zmWI1PCNuFFKRDF/G1/4niln9XR2DndHfSOGpt+Kh
         zJGqppkGkbz0oOYBo+GW/Ghrr9B+xkcfohN3R40Q7K4twm1nF2n36AkaFQSobq2APHUz
         wRGQ==
X-Gm-Message-State: APjAAAXytNAfdkS/lhjljx32iWJPcwydsn1rpjbcXaliTDtCnIFCFOcn
        oE7RouWgh0uIZY1Pa3g6pJo=
X-Google-Smtp-Source: APXvYqyGnasuo5bWLCYC6VtvaeSL5aFUT3UwMeqw5vPdKz/BYt6TG+kaIm8AeIV/kAjtHaYfcFiMqg==
X-Received: by 2002:a2e:9942:: with SMTP id r2mr13187756ljj.182.1582053264782;
        Tue, 18 Feb 2020 11:14:24 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id z8sm3024582ljk.13.2020.02.18.11.14.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Feb 2020 11:14:23 -0800 (PST)
Subject: Re: [alsa-devel] [PATCH v3 0/7] ASoC: soc-pcm cleanup step2
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Mark Brown <broonie@kernel.org>
Cc:     Linux-ALSA <alsa-devel@alsa-project.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>
References: <87d0anceze.wl-kuninori.morimoto.gx@renesas.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <5d19876d-86a4-a461-f47a-68c7ba1f46ac@gmail.com>
Date:   Tue, 18 Feb 2020 22:14:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <87d0anceze.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

10.02.2020 06:13, Kuninori Morimoto пишет:
> 
> Hi Mark
> 
> These are v3 of soc-pcm cleanup.
> Original [5/7] [6/7] patch call open / start function for all DAI / component.
> And, it calls close / stop function for all if some of them got error.
> But in such case, error occured DAI / component don't need to call close / stop.
> 
> This issue can be solved if it had flag, and my local tree has such patch.
> But it was planed to post to ML a little later.
> This time, I merged original patch and this new flag patch on [5/7] [6/7].
> 
> These mention that "it is prepare for soc-pcm-open() cleanup".
> But it will be happen later.
> 
> These are based on v5.6-rc1
> 
> Kuninori Morimoto (8):
>   1) ASoC: soc-pcm: add snd_soc_runtime_action()
>   2) ASoC: soc-pcm: adjustment for DAI member 0 reset
>   3) ASoC: soc-pcm: add for_each_dapm_widgets() macro
>   4) ASoC: soc-pcm: don't use bit-OR'ed error
>   5) ASoC: soc-pcm: call snd_soc_dai_startup()/shutdown() once
>   6) ASoC: soc-pcm: call snd_soc_component_open/close() once
>   7) ASoC: soc-pcm: move soc_pcm_close() next to soc_pcm_open()
>   8) ASoC: soc-pcm: tidyup soc_pcm_open() order
> 
>  include/sound/soc-component.h |   7 +-
>  include/sound/soc-dai.h       |   5 +-
>  include/sound/soc-dapm.h      |   5 +
>  sound/soc/soc-component.c     |  35 ++++--
>  sound/soc/soc-dai.c           |  11 +-
>  sound/soc/soc-dapm.c          |   8 +-
>  sound/soc/soc-pcm.c           | 246 +++++++++++++++++++-----------------------
>  7 files changed, 161 insertions(+), 156 deletions(-)
> 

Hello,

I'm observing a NULL dereference on NVIDIA Tegra20/30 once PulseAudio is
loaded.

The offending patch is:

  ASoC: soc-pcm: call snd_soc_component_open/close() once

Please fix, thanks in advance.

[   61.860826] 8<--- cut here ---
[   61.860965] Unable to handle kernel NULL pointer dereference at
virtual address 00000000
[   61.861037] pgd = ef2eab54
[   61.861155] [00000000] *pgd=00000000
[   61.861228] Internal error: Oops: 5 [#1] SMP THUMB2
[   61.861298] Modules linked in:
[   61.861427] CPU: 2 PID: 599 Comm: pulseaudio Not tainted
5.6.0-rc2-next-20200218-00168-g1e584fed87b9 #1275
[   61.861546] Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
[   61.861626] PC is at snd_dmaengine_pcm_close+0x1c/0x3c
[   61.861756] LR is at snd_soc_component_close+0x1d/0x3c
[   61.861823] pc : [<c072a36c>]    lr : [<c0751b51>]    psr: 60000033
[   61.861944] sp : dc01bc88  ip : 00000000  fp : ffffffea
[   61.862013] r10: 00000010  r9 : dd81a840  r8 : de318e00
[   61.862080] r7 : dd81adfc  r6 : 00000000  r5 : 00000003  r4 : 00000000
[   61.862199] r3 : dc19f800  r2 : 00000000  r1 : 00000447  r0 : c0e2f438
[   61.862322] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA Thumb
Segment none
[   61.862390] Control: 50c5387d  Table: 9db0c04a  DAC: 00000051
[   61.862510] Process pulseaudio (pid: 599, stack limit = 0xcfc4cd60)
[   61.862576] Stack: (0xdc01bc88 to 0xdc01c000)
[   61.862700] bc80:                   c0756611 de31b60c 00000003
c0751b51 de31b60c c07525ff
...
[   61.865643] bfe0: 00000142 beb9b7e8 b6c35f0d b6bbcd56 00000030
ffffff9c 00000000 00000000
[   61.865773] [<c072a36c>] (snd_dmaengine_pcm_close) from [<c0751b51>]
(snd_soc_component_close+0x1d/0x3c)
[   61.865920] [<c0751b51>] (snd_soc_component_close) from [<c07525ff>]
(soc_pcm_components_close+0x27/0x54)
[   61.865993] [<c07525ff>] (soc_pcm_components_close) from [<c0752c27>]
(soc_pcm_close+0x73/0xf0)
[   61.866130] [<c0752c27>] (soc_pcm_close) from [<c072370d>]
(snd_pcm_release_substream.part.0+0x29/0x6c)
[   61.866258] [<c072370d>] (snd_pcm_release_substream.part.0) from
[<c0723d5f>] (snd_pcm_open_substream+0x5f7/0x638)
[   61.866383] [<c0723d5f>] (snd_pcm_open_substream) from [<c0723e45>]
(snd_pcm_open+0xa5/0x184)
[   61.866510] [<c0723e45>] (snd_pcm_open) from [<c0723f51>]
(snd_pcm_capture_open+0x2d/0x40)
[   61.866589] [<c0723f51>] (snd_pcm_capture_open) from [<c025fb69>]
(chrdev_open+0xa9/0x148)
[   61.866724] [<c025fb69>] (chrdev_open) from [<c02588a5>]
(do_dentry_open+0xd5/0x2e8)
[   61.866855] [<c02588a5>] (do_dentry_open) from [<c0267a8b>]
(path_openat+0x203/0xd44)
[   61.866981] [<c0267a8b>] (path_openat) from [<c02690d5>]
(do_filp_open+0x49/0x90)
[   61.867055] [<c02690d5>] (do_filp_open) from [<c0258e4b>]
(do_sys_openat2+0x1a7/0x210)
[   61.867180] [<c0258e4b>] (do_sys_openat2) from [<c0259ca9>]
(do_sys_open+0x6d/0x98)
[   61.867310] [<c0259ca9>] (do_sys_open) from [<c01011cb>]
(__sys_trace_return+0x1/0x16)
[   61.867377] Exception stack(0xdc01bfa8 to 0xdc01bff0)
[   61.867498] bfa0:                   00000000 b6fac2e0 ffffff9c
beb9b964 00080802 00000000
[   61.867624] bfc0: 00000000 b6fac2e0 ffffffff 00000142 b22f57a8
beb9b840 beb9b964 81204101
[   61.867692] bfe0: 00000142 beb9b7e8 b6c35f0d b6bbcd56
[   61.867819] Code: f2cc 00e2 f8d3 40e0 (6825) f615
[   61.867959] ---[ end trace 335017ef9fedfd8c ]---

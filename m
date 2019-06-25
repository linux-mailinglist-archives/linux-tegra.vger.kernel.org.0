Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A04D05595A
	for <lists+linux-tegra@lfdr.de>; Tue, 25 Jun 2019 22:47:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726722AbfFYUro (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 25 Jun 2019 16:47:44 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:38266 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726053AbfFYUro (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 25 Jun 2019 16:47:44 -0400
Received: by mail-qk1-f195.google.com with SMTP id a27so13789892qkk.5
        for <linux-tegra@vger.kernel.org>; Tue, 25 Jun 2019 13:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=74NB5e0BktWwqROEL4z+u+DizinOx965eL+OUXpvhXA=;
        b=bF3P1xYbQdj+T6PZ+Pee4HjUvY4yPutalZ/eFo++WYh0ak9PxgO8R7nc8miVNTT8Q4
         ggBv2CATU+JxgHiH8enn17S8LeXfgH7912UO16DdrdbsVSoGo/+Wj9OqsR267oEYBn2t
         ZvZFAkdhty6RDWDRFPUb0f3Sdi4u/ytcP/GgH5lsjFCWwLm0ffmgcbHDJEoVFlwHdwwL
         WyVGmq54WmvdjIbbvojRwgdjDlh1DZP/YVlIu7MmKRrAw7bReAsFVDt98SHAffdbBrNH
         jhl4s7/KLzgJCPs75JbLfU1sJygMPXTZEE6jGuJfaoX1tL9c1Jl8UFsN2veVwB8dU4Yl
         +XIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=74NB5e0BktWwqROEL4z+u+DizinOx965eL+OUXpvhXA=;
        b=aiIKQd/Tuvtq0ioFt14phpal9iGEE/FdW2Gs7Gy7wxRIhEI6wDm+27ErzW6/UbjRvE
         iXR2QSf+HMdXJ3caxmshfaS1mq4sj9sku9/e8yScDKs9Kg/E2za4DXnMFDNeb6dGbfbL
         YHMIOUHKm8gaKwfoPJ+KzTOu/o6kehPs2+gE/HqpLBREKB1amgIq+MFdUspM0T1mgfU0
         +0xSHzJzY0DE5UEPU+ZgDnfKAPDeGQ1Rz0tF+CJd7Gih1lXbfoRP18KSuHbRNyepF6Ea
         038zBNRyfEFYamOzSxTgDN8j5pNgICJ4YqAxKbdTG8gMuh8F/E+sQTamhSEW8nuAvm3o
         tVYg==
X-Gm-Message-State: APjAAAUR5aS4j3fDigZFguY/sMblKjMRyh6XP9mUothyAYrDpr/fF2IG
        3FRM4SQOEadEvVGR+HSDULG6Jf5V
X-Google-Smtp-Source: APXvYqyTQteDUcGWVT/lMLQ8IvzjkTTzILjoDpYrc/84DS4ZGqmnsXNCq5bqnTtlNJkw/xsPYTI/iQ==
X-Received: by 2002:a37:6813:: with SMTP id d19mr649112qkc.454.1561495662659;
        Tue, 25 Jun 2019 13:47:42 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-79-162-197.pppoe.mtu-net.ru. [91.79.162.197])
        by smtp.googlemail.com with ESMTPSA id a21sm8075158qkg.47.2019.06.25.13.47.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Jun 2019 13:47:42 -0700 (PDT)
Subject: Re: [PATCH 5/9] ASoC: soc-core: use soc_find_component() at
 snd_soc_get_dai_id()
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Mark Brown <broonie@kernel.org>
Cc:     Linux-ALSA <alsa-devel@alsa-project.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <87y33aaluu.wl-kuninori.morimoto.gx@renesas.com>
 <87r292alro.wl-kuninori.morimoto.gx@renesas.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <cb3a6d0a-ca7b-d6b6-72db-5dff520acfc9@gmail.com>
Date:   Tue, 25 Jun 2019 23:47:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <87r292alro.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

13.05.2019 10:07, Kuninori Morimoto пишет:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> soc-core core already has soc_find_component() which find
> component from device node.
> Let's use existing function to find component.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/soc/soc-core.c | 17 +++++------------
>  1 file changed, 5 insertions(+), 12 deletions(-)
> 
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index e55170c..e83edbe 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -3751,7 +3751,7 @@ EXPORT_SYMBOL_GPL(snd_soc_of_parse_daifmt);
>  
>  int snd_soc_get_dai_id(struct device_node *ep)
>  {
> -	struct snd_soc_component *pos;
> +	struct snd_soc_component *component;
>  	struct device_node *node;
>  	int ret;
>  
> @@ -3765,17 +3765,10 @@ int snd_soc_get_dai_id(struct device_node *ep)
>  	 */
>  	ret = -ENOTSUPP;
>  	mutex_lock(&client_mutex);
> -	for_each_component(pos) {
> -		struct device_node *component_of_node = soc_component_to_node(pos);
> -
> -		if (component_of_node != node)
> -			continue;
> -
> -		if (pos->driver->of_xlate_dai_id)
> -			ret = pos->driver->of_xlate_dai_id(pos, ep);
> -
> -		break;
> -	}
> +	component = soc_find_component(node, NULL);
> +	if (component &&
> +	    component->driver->of_xlate_dai_id)
> +		ret = component->driver->of_xlate_dai_id(component, ep);
>  	mutex_unlock(&client_mutex);
>  
>  	of_node_put(node);
> 

Hi,

This patch causes crash on today's linux-next apparently because "CPU DAI" is not
registered now, any ideas?

    8.176319] tegra-snd-wm8903 sound: ASoC: CPU DAI (null) not registered
[    8.176549] 8<--- cut here ---
[    8.176763] Unable to handle kernel NULL pointer dereference at virtual address
00000570
[    8.176939] pgd = ef4b4af8
[    8.177004] [00000570] *pgd=00000000
[    8.177091] Internal error: Oops: 5 [#1] PREEMPT SMP THUMB2
[    8.177212] Modules linked in: snd_soc_tegra_wm8903(+) snd_soc_tegra_utils
snd_soc_tegra20_i2s snd_soc_tegra20_das snd_soc_tegra_pcm
[    8.177467] CPU: 0 PID: 177 Comm: systemd-udevd Tainted: G        W
5.2.0-rc6-next-20190625-00149-g10005a9c4812 #1068
[    8.177708] Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
[    8.177869] PC is at tegra_wm8903_remove+0x18/0x28 [snd_soc_tegra_wm8903]
[    8.178019] LR is at tegra_wm8903_remove+0x13/0x28 [snd_soc_tegra_wm8903]
[    8.178160] pc : [<bf8171d8>]    lr : [<bf8171d3>]    psr: 60010133
[    8.178294] sp : d5979c18  ip : 60010113  fp : c11acef8
[    8.178406] r10: 00000100  r9 : 00000122  r8 : bf8191a4
[    8.178520] r7 : 00000003  r6 : bf819180  r5 : bf819180  r4 : bf819090
[    8.178662] r3 : 00000000  r2 : 00000000  r1 : 00000000  r0 : 00000000
[    8.178804] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA Thumb  Segment none
[    8.178956] Control: 50c5387d  Table: 159f404a  DAC: 00000051
[    8.179205] Process systemd-udevd (pid: 177, stack limit = 0x1322d18f)
[    8.179451] Stack: (0xd5979c18 to 0xd597a000)
[    8.179654] 9c00:                                                       bf8171c1
c06df1dd
[    8.179833] 9c20: bf819090 00000000 00000078 c0bce380 c11acf1c fffffdfb 00000001
c06df597
[    8.180006] 9c40: c0445029 d6e2c9c0 00000000 bf819118 d5978000 c0e33d08 c0e6d2b0
c0e6d2d0
[    8.180177] 9c60: 00000001 00000000 60010113 f7ca2504 00000000 bf819090 00000000
d7334624
[    8.180348] 9c80: d64e1e10 bf819000 bf819664 0000000d d5978000 c06dfc13 d7324834
00000000
[    8.180520] 9ca0: d5916bd4 bf8173ed bf8171e9 00000000 d64e1e10 bf819304 c121ff64
00000000
[    8.180691] 9cc0: bf819304 c04ea02b c04e9ff9 d64e1e10 c121ff60 00000000 c121ff64
c04e8929
[    8.180862] 9ce0: d64e1e10 bf819304 bf819304 d5978000 00000002 00000000 bf819380
c04e8b8f
[    8.181033] 9d00: d7334624 00000000 bf819380 c090a7b7 bf81803c d64e1e10 00000000
bf819304
[    8.181204] 9d20: d5978000 00000002 00000000 bf819380 d5978000 c04e8d7d 00000000
bf819304
[    8.181375] 9d40: d64e1e10 c04e8db7 00000000 bf819304 c04e8d81 c04e75bb d5979d80
d6e50558
[    8.181546] 9d60: d64ce134 f7ca2504 00000000 bf819304 d5916180 00000000 c11841c8
c04e80fb
[    8.181717] 9d80: bf818670 bf819304 c11d6c00 bf819304 c11d6c00 bf81c001 ffffe000
c04e9559
[    8.181889] 9da0: 00000000 d5978000 c11d6c00 bf81c017 00000000 c0102c81 d5aba5c0
fffffff4
[    8.182060] 9dc0: d5f58cc0 c08fc129 bf8193c8 c0216dc7 d59a1600 f0957fff 8040003f
d6c01e40
[    8.182231] 9de0: 00000cc0 c018ef7d 00000008 c0216cf1 d75ea740 d5aba5c0 d6c01e40
c019087d
[    8.182402] 9e00: d5978000 f7ca2504 d5fbf940 bf819380 d5ecbb40 00000002 d5fbf980
00000002
[    8.182572] 9e20: d5fbf980 c018efa9 00000002 d5fbf980 d5979f38 d5fbf940 00000002
c0190891
[    8.182744] 9e40: bf81938c 00007fff bf819380 c018e401 d5fd9300 bf819494 bf8193c8
c0db4fdc
[    8.182914] 9e60: bf819580 c0a074e4 bf81938c bf81e0ae c0db491c d5978000 c0db4f34
00000000
[    8.183085] 9e80: 00000cc0 ffffe000 d5978000 bf000000 00000000 d5978000 00000000
00000000
[    8.183255] 9ea0: 00000000 00000000 00000000 00000000 6e72656b 00006c65 00000000
00000000
[    8.183425] 9ec0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000
00000000
[    8.183596] 9ee0: 00000000 00000000 00000000 f7ca2504 7fffffff d5978000 00000000
b6d25188
[    8.188471] 9f00: f091f000 c01011e4 d5978000 0000017b 0048db58 c0190d2f 7fffffff
00000000
[    8.193359] 9f20: 00000003 00037b74 00000001 f091f000 00037b74 00000000 f091fcbe
f09200c0
[    8.198255] 9f40: f091f000 00037b74 f095637c f0956190 f0949d90 00003000 000034a0
00002038
[    8.203221] 9f60: 000037b8 00000000 00000000 00000000 00002028 00000031 00000032
00000018
[    8.208131] 9f80: 00000000 00000012 00000000 f7ca2504 00000000 00000000 00000000
69ea3300
[    8.212949] 9fa0: 0000017b c0101001 00000000 00000000 0000000e b6d25188 00000000
00000000
[    8.217719] 9fc0: 00000000 00000000 69ea3300 0000017b 0048f290 00000000 00486698
0048db58
[    8.222444] 9fe0: bef98c70 bef98c60 b6d1c5c8 b6bff320 600d0010 0000000e 00000000
00000000
[    8.227183] [<bf8171d8>] (tegra_wm8903_remove [snd_soc_tegra_wm8903]) from
[<c06df1dd>] (soc_cleanup_card_resources+0x1e1/0x1f8)
[    8.232037] [<c06df1dd>] (soc_cleanup_card_resources) from [<c06df597>]
(snd_soc_instantiate_card+0x3a3/0x958)
[    8.236980] [<c06df597>] (snd_soc_instantiate_card) from [<c06dfc13>]
(snd_soc_register_card+0xc7/0xe0)
[    8.241975] [<c06dfc13>] (snd_soc_register_card) from [<bf8173ed>]
(tegra_wm8903_driver_probe+0x205/0x26c [snd_soc_tegra_wm8903])
[    8.246991] [<bf8173ed>] (tegra_wm8903_driver_probe [snd_soc_tegra_wm8903]) from
[<c04ea02b>] (platform_drv_probe+0x33/0x68)
[    8.251974] [<c04ea02b>] (platform_drv_probe) from [<c04e8929>]
(really_probe+0xa9/0x1ec)
[    8.256900] [<c04e8929>] (really_probe) from [<c04e8b8f>]
(driver_probe_device+0x43/0x124)
[    8.261836] [<c04e8b8f>] (driver_probe_device) from [<c04e8d7d>]
(device_driver_attach+0x3d/0x40)
[    8.266885] [<c04e8d7d>] (device_driver_attach) from [<c04e8db7>]
(__driver_attach+0x37/0x78)
[    8.271950] [<c04e8db7>] (__driver_attach) from [<c04e75bb>]
(bus_for_each_dev+0x43/0x6c)
[    8.277037] [<c04e75bb>] (bus_for_each_dev) from [<c04e80fb>]
(bus_add_driver+0xe3/0x148)
[    8.282175] [<c04e80fb>] (bus_add_driver) from [<c04e9559>]
(driver_register+0x39/0xa0)
[    8.287373] [<c04e9559>] (driver_register) from [<bf81c017>]
(tegra_wm8903_driver_init+0x17/0x1000 [snd_soc_tegra_wm8903])
[    8.292731] [<bf81c017>] (tegra_wm8903_driver_init [snd_soc_tegra_wm8903]) from
[<c0102c81>] (do_one_initcall+0x45/0x1e4)
[    8.298144] [<c0102c81>] (do_one_initcall) from [<c018efa9>]
(do_init_module+0x4d/0x1a0)
[    8.303555] [<c018efa9>] (do_init_module) from [<c0190891>]
(load_module+0x1739/0x1a28)
[    8.308974] [<c0190891>] (load_module) from [<c0190d2f>] (sys_finit_module+0x7b/0x8c)
[    8.314404] [<c0190d2f>] (sys_finit_module) from [<c0101001>]
(ret_fast_syscall+0x1/0x28)
[    8.319854] Exception stack(0xd5979fa8 to 0xd5979ff0)
[    8.325265] 9fa0:                   00000000 00000000 0000000e b6d25188 00000000
00000000
[    8.330758] 9fc0: 00000000 00000000 69ea3300 0000017b 0048f290 00000000 00486698
0048db58
[    8.336643] 9fe0: bef98c70 bef98c60 b6d1c5c8 b6bff320
[    8.342097] Code: d6cf 2300 461a 4619 (f8d0) 0570
[    8.351857] ---[ end trace e373bedb5e9591a6 ]---

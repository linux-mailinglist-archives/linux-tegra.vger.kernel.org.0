Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79894124945
	for <lists+linux-tegra@lfdr.de>; Wed, 18 Dec 2019 15:17:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727049AbfLRORb (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 18 Dec 2019 09:17:31 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:13762 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726932AbfLRORb (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 18 Dec 2019 09:17:31 -0500
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5dfa34de0000>; Wed, 18 Dec 2019 06:17:02 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Wed, 18 Dec 2019 06:17:30 -0800
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Wed, 18 Dec 2019 06:17:30 -0800
Received: from [10.21.133.51] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 18 Dec
 2019 14:17:29 +0000
Subject: Re: [alsa-devel] [PATCH] ALSA: hda: Use standard waitqueue for RIRB
 wakeup
To:     Takashi Iwai <tiwai@suse.de>, <alsa-devel@alsa-project.org>,
        linux-tegra <linux-tegra@vger.kernel.org>
References: <20191210145727.22054-1-tiwai@suse.de>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <53562c71-4d81-1580-f311-971ceb029431@nvidia.com>
Date:   Wed, 18 Dec 2019 14:17:27 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191210145727.22054-1-tiwai@suse.de>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1576678622; bh=ttBXWiRp+M4718kAAsDcfDS1d4d3FxcEEPyLMsuz4iM=;
        h=X-PGP-Universal:Subject:To:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=Or5kzB4BMfnC50madLTDz/10s8nfe/EVmMyucCaKFsWXLNRpvZjIerdCn8hjiz5Cg
         OULD3kTM9LaKv/Hc3+TlGiTFe9qk3LHDm2puQUliu7SnU2UnDghNEDkRZ9Znf9wWvu
         9vSFFf5fc5p+NjpvJ4yz/zUY1RdJUs6bZJmZzyCrB7n0GzQUIQAOxB7eUormEMcXdt
         N7X94PGuRNyeobyKpwhhpQBt5aK6s/My4MklZCoCoPEFKkpr9pLddb8FvIWIKY8sSz
         VkmNOLHI3bx7++Tie0MlVI2OGxW5E7VPVsDAG2JXQ/2MsEnd5TTfR099iuZQ5KghaI
         xUu42aXYn42Rg==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 10/12/2019 14:57, Takashi Iwai wrote:
> The HD-audio CORB/RIRB communication was programmed in a way that was
> documented in the reference in decades ago, which is essentially a
> polling in the waiter side.  It's working fine but costs CPU cycles on
> some platforms that support only slow communications.  Also, for some
> platforms that had unreliable communications, we put longer wait time
> (2 ms), which accumulate quite long time if you execute many verbs in
> a shot (e.g. at the initialization or resume phase).
> 
> This patch attempts to improve the situation by introducing the
> standard waitqueue in the RIRB waiter side instead of polling.  The
> test results on my machine show significant improvements.  The time
> spent for "cat /proc/asound/card*/codec#*" were changed like:
> 
> * Intel SKL + Realtek codec
>   before the patch:
>    0.00user 0.04system 0:00.10elapsed 40.0%CPU
>   after the patch:
>    0.00user 0.01system 0:00.10elapsed 10.0%CPU
> 
> * Nvidia GP107GL + Nvidia HDMI codec
>   before the patch:
>    0.00user 0.00system 0:02.76elapsed 0.0%CPU
>   after the patch:
>    0.00user 0.00system 0:00.01elapsed 17.0%CPU
> 
> So, for Intel chips, the total time is same, while the total time is
> greatly reduced (from 2.76 to 0.01s) for Nvidia chips.
> The only negative data here is the increase of CPU time for Nvidia,
> but this is the unavoidable cost for faster wakeups, supposedly.
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
Starting with next-20191217 I am seeing the following error on one of
our Tegra platforms ...

tegra-hda 3510000.hda: azx_get_response timeout, switching to polling
mode: last cmd=0x404f2d00

Bisect is point to this commit and although it does not cleanly revert,
if I revert this and a couple dependencies on top of -next the issue
goes away. Any thoughts on what could be going on here?

Cheers
Jon

-- 
nvpublic

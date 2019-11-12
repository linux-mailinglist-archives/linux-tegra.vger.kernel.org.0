Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE078F8D4D
	for <lists+linux-tegra@lfdr.de>; Tue, 12 Nov 2019 11:51:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727113AbfKLKvw (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 12 Nov 2019 05:51:52 -0500
Received: from hqemgate16.nvidia.com ([216.228.121.65]:14152 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725834AbfKLKvw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 12 Nov 2019 05:51:52 -0500
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5dca8e900000>; Tue, 12 Nov 2019 02:50:56 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 12 Nov 2019 02:51:52 -0800
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 12 Nov 2019 02:51:52 -0800
Received: from [10.21.133.51] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 12 Nov
 2019 10:51:50 +0000
Subject: Re: [alsa-devel] [PATCH v3 02/19] ASoC: soc-core: tidyup
 soc_init_dai_link()
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC:     Mark Brown <broonie@kernel.org>,
        Linux-ALSA <alsa-devel@alsa-project.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
        linux-tegra <linux-tegra@vger.kernel.org>
References: <87ftj23jph.wl-kuninori.morimoto.gx@renesas.com>
 <87d0e63joh.wl-kuninori.morimoto.gx@renesas.com>
 <c976b330-f635-e818-1feb-f25db42a6ae4@nvidia.com>
 <87sgmu7xhz.wl-kuninori.morimoto.gx@renesas.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <fe4baf43-a06c-f2ac-9b1c-6f0ec5a25cb2@nvidia.com>
Date:   Tue, 12 Nov 2019 10:51:48 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <87sgmu7xhz.wl-kuninori.morimoto.gx@renesas.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1573555856; bh=9U0iekHPqCKCtONtPFuEXlIHBgl069HGxR9z4sqUB0Y=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=CragUSkcOp2rOui25I7KothxQEPbeBZIwYXe91TsOf9rEEWagZbwahyZBZvnRRS2t
         mFmr6uDg5UAQabd2kOu3xxe1tFHZplSFIB+cURRqx8UkugVUUXgB+XelV2X6MPcXi2
         HLsQb/iYVWflJEZ641SVLt0xXptzirWcWpb7aUpURrd8UifH1s02v4oRIA8xEL2jBf
         B84STsRC5JMN88tHhNws5B6MYTEHpAjVM3NcwWYirxlbGHXd5T2P6BdsI3LQxCAtJW
         y5AJtHeOsZVx9JRu3cfih2aDCR63JpmF0plY/PMgY02h7Psnnt1Usr4Z14nVewWsA3
         kPYLKlXgVIwXA==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 12/11/2019 00:24, Kuninori Morimoto wrote:
> 
> Hi Jon
> 
> Thank you for reporting.
> 
>> I am seeing an audio regression on -next and bisect is pointing to
>> this commit. I am seeing the following crash on boot during probe
>> deferral of the soundcard ...
> 
> It seems timing bug.
> I have a plan to post below patch if my current posting patch are accepted,
> but it seems it is necessary immediately.
> I believe your issue will be solved by this patch,
> but can you please test it ?
> I will formally post it with your tested-by if it was OK.
> 
> # It will be more cleanuped in the future,
> # but it needs more other cleanup patches...
> 
> --------------------
> Subject: [PATCH] ASoC: soc-core: care card_probed at soc_cleanup_card_resources()
> 
> soc_cleanup_card_resources() will call card->remove(), but it should be
> called if card->probe() or card->late_probe() are called.
> snd_soc_bind_card() might be error before calling
> card->probe() / card->late_probe().
> In that time, card->remove() will be called.
> This patch adds card_probed parameter to judge it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/soc/soc-core.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)

Thanks! I can confirm that this works, so ...

Tested-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic

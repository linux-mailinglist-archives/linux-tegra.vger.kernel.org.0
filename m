Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7266251163
	for <lists+linux-tegra@lfdr.de>; Tue, 25 Aug 2020 07:16:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726940AbgHYFQE (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 25 Aug 2020 01:16:04 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:16655 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726149AbgHYFQD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 25 Aug 2020 01:16:03 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f449e840001>; Mon, 24 Aug 2020 22:15:48 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 24 Aug 2020 22:16:02 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 24 Aug 2020 22:16:02 -0700
Received: from [10.25.97.151] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 25 Aug
 2020 05:15:56 +0000
Subject: Re: [PATCH v2 3/9] ASoC: audio-graph: Identify 'no_pcm' DAI links for
 DPCM
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC:     <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
        <robh+dt@kernel.org>, <lgirdwood@gmail.com>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <alsa-devel@alsa-project.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <sharadg@nvidia.com>,
        <mkumard@nvidia.com>, <viswanathl@nvidia.com>,
        <rlokhande@nvidia.com>, <dramesh@nvidia.com>,
        <atalambedu@nvidia.com>, <nwartikar@nvidia.com>,
        <swarren@nvidia.com>, <nicoleotsuka@gmail.com>
References: <1596605064-27748-1-git-send-email-spujar@nvidia.com>
 <1596605064-27748-4-git-send-email-spujar@nvidia.com>
 <87pn7ofs19.wl-kuninori.morimoto.gx@renesas.com>
 <97f325a6-96cc-11c5-8027-8c0a159e3da0@nvidia.com>
 <2d3aa11e-3c56-1f7a-3d41-2457f973d55b@nvidia.com>
 <87sgcbwcnf.wl-kuninori.morimoto.gx@renesas.com>
From:   Sameer Pujar <spujar@nvidia.com>
Message-ID: <14691a05-cb29-a030-0e72-eca900d8eb7e@nvidia.com>
Date:   Tue, 25 Aug 2020 10:45:53 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87sgcbwcnf.wl-kuninori.morimoto.gx@renesas.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1598332548; bh=MUVzG/YgQfmq+QuRb+X4fsdhVCfaBa++YFanvLETpZI=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=jI0jHRUV3D9ybv7EXxTV/i81TKRnoXjcx1Pd7PmWDFsOaq/mYXfr5OpADeh1XOfKt
         BCsb/f5SVDm8wVBsNprIXJAgMdpdr+kvkRZos3EJxSej3KdbDB4eJXHzDSX45Dr/BK
         kS442KO7lWoR6L+A4vIu5IDt8pLWkLR5W8gz4b/iOcbkc/b8MlnSU5HG18Srk/Mcrg
         6RXR5RJz4Kr6ggXYYRBMyfslWI7X8SJPWGMDEvKYdywSVHey+oFICmqF5X3gLwRw5d
         001ZTgUBQMAOQgYhXP60Vr8unUtr+bgVYwxLHRD9MsraPokqJFJptFtz2JA7aMdCjh
         HWQUfW57zokBw==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Morimoto-san,


> (snip)
>> I tried testing this with LOCKDEP config enabled at my end.
>> It seems I don't see warning originated from above function.
>> Are you suggesting that, in general, snd_soc_find_dai()
>> should be called with client_mutex held?
> Hmm ? strange...

Yes indeed. For saftely I will follow the same as other callers are doing.

...

> Yes, I'm posting fixup patch.
>
>          https://patchwork.kernel.org/patch/11719919/

Just curious that why snd_soc_find_dai() itself cannot be protected, 
instead of leaving this to callers.


Thanks,
Sameer.

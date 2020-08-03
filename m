Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BF8123A3C4
	for <lists+linux-tegra@lfdr.de>; Mon,  3 Aug 2020 14:04:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726169AbgHCMEB (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 3 Aug 2020 08:04:01 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:4078 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725965AbgHCMDs (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 3 Aug 2020 08:03:48 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f27fcfd0002>; Mon, 03 Aug 2020 05:03:09 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 03 Aug 2020 05:03:22 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 03 Aug 2020 05:03:22 -0700
Received: from [10.25.96.161] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 3 Aug
 2020 12:02:04 +0000
Subject: Re: [PATCH 03/10] ASoC: audio-graph: Support Codec with multiple
 endpoints
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
References: <1595135417-16589-1-git-send-email-spujar@nvidia.com>
 <1595135417-16589-4-git-send-email-spujar@nvidia.com>
 <87365n2i2z.wl-kuninori.morimoto.gx@renesas.com>
 <870feaf2-3aa2-dbb8-f883-9b6cfcb36d82@nvidia.com>
 <87o8oazs5a.wl-kuninori.morimoto.gx@renesas.com>
From:   Sameer Pujar <spujar@nvidia.com>
Message-ID: <c3df2601-7b01-1880-790c-658a50fbca31@nvidia.com>
Date:   Mon, 3 Aug 2020 17:32:00 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87o8oazs5a.wl-kuninori.morimoto.gx@renesas.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1596456189; bh=O2ZsugzO8H52yaoEOi95oGcqyHBPMBe8xC47X2C3qKw=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=JzDHWYN5PjPUbG1Aw90Z7OXdXilf7uR2/t0Va7reEfIuYW6g/i8iGV0NRWbsvui3C
         CzATlG9CpyBuCM99pLu8cbWd6YWuDv5cRGt9dnndvu954qBnJoMbbdffvvn8t37PhZ
         RnD5PdHEgYWk3eVXztq2w5eeCfdg6gCXA1A3RBBR9vHhwsxpOQP9YNVKr5mJ3+snur
         h7vjJCwomgy5E7x7HxbpYC3ZD5SvAuHhnnWS/F6LFwssc48VUQ0HIVgqrmHxp0LPP5
         UKZLvhJMa75f6+Z+AatO7+ZtSzHBJ6BYzbGrM4gznpcpgZNivFi6MwV4fSjaeOSYgA
         FV4fC8ti9no2A==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 7/20/2020 10:43 AM, Kuninori Morimoto wrote:
> External email: Use caution opening links or attachments
>
>
> Hi Sameer
>
>>>> diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
>>>> index 1e20562..b1903f9 100644
>>>> --- a/sound/soc/generic/audio-graph-card.c
>>>> +++ b/sound/soc/generic/audio-graph-card.c
>>>> @@ -201,8 +201,7 @@ static void graph_parse_mclk_fs(struct device_node *top,
>>>>    static int graph_dai_link_of_dpcm(struct asoc_simple_priv *priv,
>>>>                                   struct device_node *cpu_ep,
>>>>                                   struct device_node *codec_ep,
>>>> -                               struct link_info *li,
>>>> -                               int dup_codec)
>>>> +                               struct link_info *li)
>>> This patch breaks DPCM connection which is used for MIXer
>> Could you please elaborate a bit more as to what is broken with this?
>> The problem I am trying to solve here is to have multiple endpoints
>> for Codec port.
> For example MIXer, it is like below.
> If you removes "dup_codec", it breaks MIXer and/or TDM split mode.
>
>          CPU0  ---+---- DAI
>                   |
>          CPU1  ---+
>
>          cpu {
>                  ports {
>                          port@0 {
>                                  cpu_0: endpoint {
>                                          remote-endpoint = <&codec_0>;
>                                  };
>                          };
>                          port@1 {
>                                  cpu_1: endpoint {
>                                          remote-endpoint = <&codec_1>;
>                                  };
>                          };
>                  };
>          };
>
>          codec {
>                  port {
>                          codec_0: endpoint {
>                                  remote-endpoint = <&cpu_0>;
>                          };
>                          codec_1: endpoint {
>                                  remote-endpoint = <&cpu_1>;
>                          };
>                  }
>          };

Thanks Kuninori for explaining above and for giving a background in an 
'off-list' thread. I will re-work on the patch by limiting the changes 
to specific flag so that it does not affect any other user.

> Thank you for your help !!
>
> Best regards
> ---
> Kuninori Morimoto

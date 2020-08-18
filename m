Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC5C6248024
	for <lists+linux-tegra@lfdr.de>; Tue, 18 Aug 2020 10:06:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726424AbgHRIGt (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 18 Aug 2020 04:06:49 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:15862 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726203AbgHRIGs (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 18 Aug 2020 04:06:48 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f3b8c090001>; Tue, 18 Aug 2020 01:06:33 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 18 Aug 2020 01:06:47 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 18 Aug 2020 01:06:47 -0700
Received: from [10.25.96.247] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 18 Aug
 2020 08:06:41 +0000
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
 <87y2mcfzir.wl-kuninori.morimoto.gx@renesas.com>
From:   Sameer Pujar <spujar@nvidia.com>
Message-ID: <94e2c4ad-91a8-76c8-c956-8dbfdf68d1a8@nvidia.com>
Date:   Tue, 18 Aug 2020 13:36:37 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87y2mcfzir.wl-kuninori.morimoto.gx@renesas.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1597737994; bh=ZXSuf8dJcEyEX5k466eJpjxKeuZb+qrwyJvu3I6LwjU=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=BNtp98LZzdUvqLCn9Us3RAOIqzAZ0wLoqExbNqAv86BlHIhfXic3cfKAN7i7HXrt1
         FmjmmAystMbcyaREzFj1OxN2ENXvZJpkbWcRf/2bNONAcIDmez9mz/KeZYe9C74k86
         nKI33jYsJGye/dIRVSTJWzZ7C3iCbdZb3QL3z7uE3Di874nnKsv13Pf7hIDHYuJhNv
         6633KjbHupZDd/aKDJ7J6/AiRKHzrO/MTn+urn4UgIW4vWrHadSh+Bq17kQCZgGS9N
         gUMhdeNGGKf4FZzZd6lLb7Ir3tjgZsaWx+kbcTBslUxLk37CLDdRcP6WEcyUyTnIWo
         mTT5zLyJu6dnw==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Kuninori,

On 8/18/2020 8:11 AM, Kuninori Morimoto wrote:
> External email: Use caution opening links or attachments
>
>
> Hi Sameer
>
>> PCM devices are created for FE dai links with 'no-pcm' flag as '0'.
>> Such DAI links have CPU component which implement either pcm_construct()
>> or pcm_new() at component or dai level respectively. Based on this,
>> current patch exposes a helper function to identify such components
>> and populate 'no_pcm' flag for DPCM DAI link.
>>
>> This helps to have BE<->BE component links where PCM devices need
>> not be created for CPU component involved in such links.
>>
>> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
>> ---
> (snip)
>> @@ -259,6 +270,16 @@ static int graph_dai_link_of_dpcm(struct asoc_simple_priv *priv,
>>                if (ret < 0)
>>                        goto out_put_node;
>>
>> +             /*
>> +              * In BE<->BE connections it is not required to create
>> +              * PCM devices at CPU end of the dai link and thus 'no_pcm'
>> +              * flag needs to be set. It is useful when there are many
>> +              * BE components and some of these have to be connected to
>> +              * form a valid audio path.
>> +              */
>> +             if (!soc_component_is_pcm(cpus))
>> +                     dai_link->no_pcm = 1;
>> +
> For safety, I want to judge with data->component_chaining.
>
>          if (data->component_chaining &&
>              !soc_component_is_pcm(cpus))
>                          dai_link->no_pcm = 1;

OK. I will keep the additional check. Thanks.

>
> Thank you for your help !!
>
> Best regards
> ---
> Kuninori Morimoto

Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FAE420D2B4
	for <lists+linux-tegra@lfdr.de>; Mon, 29 Jun 2020 20:52:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729378AbgF2SwA (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 29 Jun 2020 14:52:00 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:18047 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729700AbgF2Svx (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 29 Jun 2020 14:51:53 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5efa0cd20000>; Mon, 29 Jun 2020 08:46:27 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 29 Jun 2020 08:46:39 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 29 Jun 2020 08:46:39 -0700
Received: from [10.25.103.164] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 29 Jun
 2020 15:46:32 +0000
CC:     <spujar@nvidia.com>, <broonie@kernel.org>, <perex@perex.cz>,
        <tiwai@suse.com>, <robh+dt@kernel.org>, <lgirdwood@gmail.com>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <digetx@gmail.com>, <alsa-devel@alsa-project.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sharadg@nvidia.com>, <mkumard@nvidia.com>,
        <viswanathl@nvidia.com>, <rlokhande@nvidia.com>,
        <dramesh@nvidia.com>, <atalambedu@nvidia.com>,
        <nwartikar@nvidia.com>, <swarren@nvidia.com>,
        <nicoleotsuka@gmail.com>
Subject: Re: [PATCH v4 08/23] ASoC: soc-core: Fix component name_prefix
 parsing
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
 <1593233625-14961-9-git-send-email-spujar@nvidia.com>
 <878sg61zcf.wl-kuninori.morimoto.gx@renesas.com>
From:   Sameer Pujar <spujar@nvidia.com>
Message-ID: <5ad958bb-a736-2391-31fa-c32e13750322@nvidia.com>
Date:   Mon, 29 Jun 2020 21:16:26 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <878sg61zcf.wl-kuninori.morimoto.gx@renesas.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1593445587; bh=AivjTXZmlEwPaPeki/OKMhcWRIlg67pix78mVS/IG5g=;
        h=X-PGP-Universal:CC:Subject:To:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=crlH/71/oPsaD1V4+PwTZqGicdSi20WdXty8nf7RLaTpAyp6gkuO+Pa0+2UZAzrST
         M03XnZnhMY/EQUOIJHuUx8axa7TTlwsq/wr0I0DwlvAxPbiomyLkD3Lt+Q3ZTf+MED
         saUFpl/tGXzBT8KgWaQZ2pnsYOa/pcy1uyyeJ7/GQZ3xrQbbyHLxOBcG01AiG2hJEg
         ifZvRP/d7uwMOwPZ2Ny1d/IWZHl8S1ZeUiIoFqjdL2rR+bZE8v6V56Ksh4iKbn9Uu3
         4If5OLDYVnz90Z0NXsA1/ib6mXGckJEpW3czH6pOHE1LRbvTTQpOv1JZ7Ain2t82Pd
         6OoO+gowAKlnA==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 6/29/2020 6:08 AM, Kuninori Morimoto wrote:
> External email: Use caution opening links or attachments
>
>
> Hi Sameer
>
> Thank you for your patch
>
> # I guess there was ML registering magic until v3 ?
> # This is 1st time for me to get this patch series...

Until v3 the series was mostly about registering ASoC components. Based 
on the discussions in the previous series and threads, I have updated 
drivers to work with DPCM and added patches for simple-card driver to 
test complete audio path. Yes, simple-card driver patches are new and 
were not part of earlier series. Sorry if I was not clear in the cover 
letter.

Thank you for the review.
>
>> The "prefix" can be defined in DAI link node or it can be specified as
>> part of the component node itself. Currently "sound-name-prefix" defined
>> in a component is not taking effect. Actually the property is not getting
>> parsed. It can be fixed by parsing "sound-name-prefix" property whenever
>> "prefix" is missing in DAI link Codec node.
>>
>> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> (snip)
>> @@ -1111,8 +1111,10 @@ static void soc_set_name_prefix(struct snd_soc_card *card,
>>                struct snd_soc_codec_conf *map = &card->codec_conf[i];
>>
>>                if (snd_soc_is_matching_component(&map->dlc, component)) {
>> -                     component->name_prefix = map->name_prefix;
>> -                     return;
>> +                     if (map->name_prefix) {
>> +                             component->name_prefix = map->name_prefix;
>> +                             return;
>> +                     }
>>                }
>>        }
> This is nit-pick but it can be like this ?
>
>                  if (snd_soc_is_matching_component(&map->dlc, component) &&
>                      map->name_prefix) {
>                          ...
>                  }

Sounds fine. Will update.
>
> Thank you for your help !!
>
> Best regards
> ---
> Kuninori Morimoto


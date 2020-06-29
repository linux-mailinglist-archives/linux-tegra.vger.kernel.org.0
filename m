Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02D9B20DBAC
	for <lists+linux-tegra@lfdr.de>; Mon, 29 Jun 2020 22:16:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730238AbgF2UIo (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 29 Jun 2020 16:08:44 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:16981 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388843AbgF2UIY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 29 Jun 2020 16:08:24 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5efa17410007>; Mon, 29 Jun 2020 09:30:57 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 29 Jun 2020 09:32:35 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 29 Jun 2020 09:32:35 -0700
Received: from [10.25.103.164] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 29 Jun
 2020 16:32:27 +0000
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
Subject: Re: [PATCH v4 11/23] ASoC: simple-card: Loop over all children for
 'mclk-fs'
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
 <1593233625-14961-12-git-send-email-spujar@nvidia.com>
 <875zba1y28.wl-kuninori.morimoto.gx@renesas.com>
From:   Sameer Pujar <spujar@nvidia.com>
Message-ID: <58000bd3-861c-bbc2-75e1-128cf0199a76@nvidia.com>
Date:   Mon, 29 Jun 2020 22:02:24 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <875zba1y28.wl-kuninori.morimoto.gx@renesas.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1593448257; bh=eCgPnGs+t6mTlUrWspHqn3L6WbSBOIjW+yMMr1FqO98=;
        h=X-PGP-Universal:CC:Subject:To:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=E0bgnTS+65jRjYEbGCuLpuR8gnCRlXvUMWJ2XzgjkKSHqUAwlVCdS3CdarJxGka2x
         rZypFMDFhq/5cquU2SjBDGBdPh2TqT7kW8VSprjIMw8ygVZwG25ubKqG/zx28oIpGp
         348TCN+unvZvTVBjQOq5FQVNc64tKcaZ6NEWgYtPNLRs9KI+9QASfgOwbEjPNkLVSJ
         oGIonuFPpJ707Pn1RIsg3J0E6d6y46o1olkiB3HI4dA1r3VED4YwLcUFVsjhcYkGl6
         rut7emaQHbqsyf7lbuhlsTX1riPozhD/6r8hqdRq8cSZjZEcbt8Svte7nsuTbV8OFl
         mPk5sQEZYA+hA==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 6/29/2020 6:35 AM, Kuninori Morimoto wrote:
> External email: Use caution opening links or attachments
>
>
> Hi Sameer
>
>> CPU/Codec in DPCM DAI links are connected as CPU<->Dummy and Dummy<->Codec.
>> Though mostly CPU won't use/require 'mclk-fs' property, looping over
>> 'np' (current child node in a DAI link) can help in cases where multiple
>> Codecs are defined. This further helps to get rid of 'codec' argument
>> from simple_dai_link_of_dpcm() function, which gets called for DPCM links.
>>
>> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
>> ---
> (snip)
>> diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
>> index 39cdc71..02d6295 100644
>> --- a/sound/soc/generic/simple-card.c
>> +++ b/sound/soc/generic/simple-card.c
>> @@ -107,7 +107,9 @@ static void simple_parse_mclk_fs(struct device_node *top,
>>        snprintf(prop, sizeof(prop), "%smclk-fs", prefix);
>>        of_property_read_u32(node,      prop, &props->mclk_fs);
>>        of_property_read_u32(cpu,       prop, &props->mclk_fs);
>> -     of_property_read_u32(codec,     prop, &props->mclk_fs);
>> +
>> +     if (cpu != codec)
>> +             of_property_read_u32(codec, prop, &props->mclk_fs);
> Maybe we want to have "cpu" in simple_dai_link_of_dpcm() side
> without using magical code in simple_parse_mclk_fs() side ?

Are you suggesting if we should simplify simple_parse_mclk_fs() by 
either passing 'cpu' or 'codec'?
>
> Thank you for your help !!
>
> Best regards
> ---
> Kuninori Morimoto


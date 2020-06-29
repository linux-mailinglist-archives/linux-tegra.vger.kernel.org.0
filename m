Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C380720D71E
	for <lists+linux-tegra@lfdr.de>; Mon, 29 Jun 2020 22:06:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732147AbgF2T1K (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 29 Jun 2020 15:27:10 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:10622 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732315AbgF2T1H (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 29 Jun 2020 15:27:07 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5efa226f0000>; Mon, 29 Jun 2020 10:18:39 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 29 Jun 2020 10:19:28 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 29 Jun 2020 10:19:28 -0700
Received: from [10.25.103.164] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 29 Jun
 2020 17:19:20 +0000
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
Subject: Re: [PATCH v4 15/23] ASoC: soc-core: Identify 'no_pcm' DAI links for
 DPCM
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
 <1593233625-14961-16-git-send-email-spujar@nvidia.com>
 <87366e1wkb.wl-kuninori.morimoto.gx@renesas.com>
From:   Sameer Pujar <spujar@nvidia.com>
Message-ID: <83b6cee2-8254-477c-cb65-7e05a9fdbacf@nvidia.com>
Date:   Mon, 29 Jun 2020 22:49:16 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <87366e1wkb.wl-kuninori.morimoto.gx@renesas.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1593451119; bh=vfUlacqPqumAcLV/c3aep1ECOFfwdUJzoe5RzrENPw0=;
        h=X-PGP-Universal:CC:Subject:To:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=VnC8bHc+ovxigL9GkP1gqYfnwMTUuwzT7kfV2xUkvtLMZAFOCjDe59+nUsfk2zS2q
         fOANMD+Nf7NfUfBAD8FJlNyEh/2ZvHQ4R8UlGsxrWYsZrzVx2XCnqBsSVb7OOB/vqF
         6z/hGWZGIVqJCOJmx2ameHksjLhCaKPeJ4L4T6oAaLUbh1RarDm8UIuXB9BEI4YJKq
         NCPvT8V3c2m4rdYtX4/Z/jpq+z8XztvzNJGI45B3LAJl4KichbWOFWEfFo5tdUOmew
         wX4YoyUEBzqbFJPG0kVQxrQoZ40OJmtBkA7QICsXowl9CkuLQO3Ez7M969NB6KkPfR
         dR8unv5kxhjTw==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 6/29/2020 7:08 AM, Kuninori Morimoto wrote:
> External email: Use caution opening links or attachments
>
>
> Hi Sameer
>
>> PCM devices are created for dai links with 'no-pcm' flag as '0'.
>> Such DAI links have CPU component which implement pcm_construct()
>> and pcm_destruct() callbacks. Based on this, current patch exposes
>> a helper function to identify such components and populate 'no_pcm'
>> flag for DPCM DAI link.
> (snip)
>> +bool soc_component_is_pcm(struct snd_soc_dai_link_component *dlc)
>> +{
>> +     struct snd_soc_component *component;
>> +     struct snd_soc_dai *dai;
>> +
>> +     for_each_component(component) {
>> +             if (!component->driver)
>> +                     continue;
>> +
>> +             for_each_component_dais(component, dai) {
>> +                     if (!dai->name || !dlc->dai_name)
>> +                             continue;
>> +
>> +                     if (strcmp(dai->name, dlc->dai_name))
>> +                             continue;
>
> We can/should NULL poinster check for "dlc->dai_name" on top of
> this function instead of inside loop ?
> And then, we can remove "dai->name" check because next strcmp()
> automatically fail if dai->name was NULL.

Sounds good, will update.
>
> Thank you for your help !!
>
> Best regards
> ---
> Kuninori Morimoto


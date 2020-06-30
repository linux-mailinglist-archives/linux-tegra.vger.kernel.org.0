Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4642A20F3E9
	for <lists+linux-tegra@lfdr.de>; Tue, 30 Jun 2020 13:56:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732434AbgF3L4p (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 30 Jun 2020 07:56:45 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:17957 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729580AbgF3L4p (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 30 Jun 2020 07:56:45 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5efb286e0001>; Tue, 30 Jun 2020 04:56:32 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 30 Jun 2020 04:56:44 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 30 Jun 2020 04:56:44 -0700
Received: from [10.25.97.62] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 30 Jun
 2020 11:56:35 +0000
CC:     <spujar@nvidia.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        <perex@perex.cz>, <tiwai@suse.com>, <robh+dt@kernel.org>,
        <lgirdwood@gmail.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <digetx@gmail.com>,
        <alsa-devel@alsa-project.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <sharadg@nvidia.com>,
        <mkumard@nvidia.com>, <viswanathl@nvidia.com>,
        <rlokhande@nvidia.com>, <dramesh@nvidia.com>,
        <atalambedu@nvidia.com>, <nwartikar@nvidia.com>,
        <swarren@nvidia.com>, <nicoleotsuka@gmail.com>
Subject: Re: Re: [PATCH v4 11/23] ASoC: simple-card: Loop over all children
 for 'mclk-fs'
To:     Mark Brown <broonie@kernel.org>
References: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
 <1593233625-14961-12-git-send-email-spujar@nvidia.com>
 <875zba1y28.wl-kuninori.morimoto.gx@renesas.com>
 <58000bd3-861c-bbc2-75e1-128cf0199a76@nvidia.com>
 <87lfk5z4ov.wl-kuninori.morimoto.gx@renesas.com>
 <b33d5a1b-ecd5-3618-4894-c3ab0f4b077d@nvidia.com>
 <20200630105532.GG5272@sirena.org.uk>
From:   Sameer Pujar <spujar@nvidia.com>
Message-ID: <8b264575-08e7-64c5-fd7c-3109a0a36ce8@nvidia.com>
Date:   Tue, 30 Jun 2020 17:26:32 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200630105532.GG5272@sirena.org.uk>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1593518192; bh=kRg7pU3gJSgsCt5OO4SsNHbiLgeij8sbJesDlJdXIC8=;
        h=X-PGP-Universal:CC:Subject:To:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=QLp5BLjW8+idyvq+WuWlIPC61zDNT6Kje7XkXi8kNAoSVMwbMbbWavQJ6WlfZibDw
         CQ0Sw4x9eV/JAKfaSJkPtWlcoWgibJd7FnDyn16roIHIEhdb/lahy1dJSa9iApPDxN
         7wM2JeXbdjR+YTnTJ7G+ol6+c9mzd+lGqBHOx736znHl/t8p5Wmx60beRaUHXBUMLQ
         6huyFzHmpjRQ6I8UeUpoGcv7Mf9kKFqrz5Gk5IxkEtEz6u0I7IyJBcpXmZKqbAp3RF
         sIaAFK0ql04TSyxYZlSAYaN3OLETqq/Lpllw0DTtRQuIlPq6ejNhtzpO/Bz60Rlfqn
         SokJqLJ4GVZ4g==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 6/30/2020 4:25 PM, Mark Brown wrote:
> On Tue, Jun 30, 2020 at 09:53:13AM +0530, Sameer Pujar wrote:
>> On 6/30/2020 7:38 AM, Kuninori Morimoto wrote:
>>> External email: Use caution opening links or attachments
>>>>>> +     if (cpu != codec)
>>>>>> +             of_property_read_u32(codec, prop, &props->mclk_fs);
>> Sorry if I was not clear before.
> I agree with Moromito-san that the new code (especially the above bit)
> is very confusing, I'm not sure how the reader is supposed to figure out
> what the purpose of the check is or how the CPU could ever be the CODEC.
>
>> simple_parse_mclk_fs() is used by both simple_dai_link_of_dpcm() and
>> simple_dai_link_of(). To make the same API work for both the cases, I had to
>> use (A) in DPCM function. Now (B) does not get used for
>> simple_dai_link_of_dpcm(), but will get used by simple_dai_link_of().
>> If it is simpler I will just avoid 'cpu != codec' check and keep the
>> function simple_parse_mclk_fs() as it is.
> That'd definitely be simpler, or supporting this with a CPU node as
> well.

OK. I will keep it simple.


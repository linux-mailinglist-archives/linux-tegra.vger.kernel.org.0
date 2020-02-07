Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F51B155649
	for <lists+linux-tegra@lfdr.de>; Fri,  7 Feb 2020 12:03:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726982AbgBGLDO (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 7 Feb 2020 06:03:14 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:17227 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726954AbgBGLDO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 7 Feb 2020 06:03:14 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e3d43e20000>; Fri, 07 Feb 2020 03:02:59 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 07 Feb 2020 03:03:13 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 07 Feb 2020 03:03:13 -0800
Received: from [10.24.44.92] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 7 Feb
 2020 11:03:08 +0000
CC:     <spujar@nvidia.com>, <perex@perex.cz>, <tiwai@suse.com>,
        <robh+dt@kernel.org>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sharadg@nvidia.com>, <mkumard@nvidia.com>,
        <viswanathl@nvidia.com>, <rlokhande@nvidia.com>,
        <dramesh@nvidia.com>, <atalambedu@nvidia.com>
Subject: Re: [PATCH v2 2/9] ASoC: tegra: add support for CIF programming
To:     Dmitry Osipenko <digetx@gmail.com>
References: <1580380422-3431-1-git-send-email-spujar@nvidia.com>
 <1580380422-3431-3-git-send-email-spujar@nvidia.com>
 <7239e858-16b7-609f-c4e3-8135bee8450b@gmail.com>
 <1305a6db-a492-eec2-111e-ddc801d58d86@nvidia.com>
 <fb0a96bd-ac3c-0916-0337-0c86de196527@gmail.com>
From:   Sameer Pujar <spujar@nvidia.com>
Message-ID: <bb2ab8e1-a42c-6a03-1ffa-495565c8e914@nvidia.com>
Date:   Fri, 7 Feb 2020 16:33:04 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <fb0a96bd-ac3c-0916-0337-0c86de196527@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1581073379; bh=DroXT/1lQUGa+TG9wgFQbKxKmkZF3WHBeukmNqYO5pI=;
        h=X-PGP-Universal:CC:Subject:To:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=mnxEeVCjfYHbbS/VgYjYRqCVpptFPlXV9vjGSSEzPW75dvpSXTDLVO0HLTFXbKudJ
         GSOUAsM1S42wvnlakqKfn0vNJcb+fNU4KvCxV+h+hcWb4GWrYnd2yLlzS44qW2hHvj
         n00Ci9VULOf2ihAUFk9lk0pjdH6qa/i9bKHYqlnMOpGhI49tIWlzmK+uKKCovHJSKX
         jhP2/WrONzqdFCBG3CwSQYRPley3yH4JHVts8WRoVYaZ8h1+TrDSmnLMIKCmOAZonQ
         iw8MEEZzaQ7HfjvzQy01/ZEfbTrnWwB171z1y4aFlFPbG7dCWhT5ZIXZTp30NCcY32
         kFRvWv0zENgCg==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 2/6/2020 10:19 PM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 06.02.2020 14:56, Sameer Pujar =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>
>> On 2/5/2020 10:32 PM, Dmitry Osipenko wrote:
>>> External email: Use caution opening links or attachments
>>>
>>>
>>> 30.01.2020 13:33, Sameer Pujar =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> ...
>>>> +#include <linux/module.h>
>>>> +#include <linux/regmap.h>
>>>> +#include "tegra_cif.h"
>>>> +
>>>> +void tegra_set_cif(struct regmap *regmap, unsigned int reg,
>>>> +                struct tegra_cif_conf *conf)
>>>> +{
>>>> +     unsigned int value;
>>>> +
>>>> +     value =3D (conf->threshold << TEGRA_ACIF_CTRL_FIFO_TH_SHIFT) |
>>>> +             ((conf->audio_ch - 1) << TEGRA_ACIF_CTRL_AUDIO_CH_SHIFT)=
 |
>>>> +             ((conf->client_ch - 1) <<
>>>> TEGRA_ACIF_CTRL_CLIENT_CH_SHIFT) |
>>>> +             (conf->audio_bits << TEGRA_ACIF_CTRL_AUDIO_BITS_SHIFT) |
>>>> +             (conf->client_bits << TEGRA_ACIF_CTRL_CLIENT_BITS_SHIFT)=
 |
>>>> +             (conf->expand << TEGRA_ACIF_CTRL_EXPAND_SHIFT) |
>>>> +             (conf->stereo_conv << TEGRA_ACIF_CTRL_STEREO_CONV_SHIFT)=
 |
>>>> +             (conf->replicate << TEGRA_ACIF_CTRL_REPLICATE_SHIFT) |
>>>> +             (conf->truncate << TEGRA_ACIF_CTRL_TRUNCATE_SHIFT) |
>>>> +             (conf->mono_conv << TEGRA_ACIF_CTRL_MONO_CONV_SHIFT);
>>>> +
>>>> +     regmap_update_bits(regmap, reg, TEGRA_ACIF_UPDATE_MASK, value);
>>>> +}
>>>> +EXPORT_SYMBOL_GPL(tegra_set_cif);
>>> Are you going to add more stuff into this source file later on?
>> Yes I plan to add Tegra30 and Tegra124 CIF functions in this. Anything
>> related to CIF can be moved here.
>>> If not, then it's too much to have a separate driver module just for a
>>> single tiny function, you should move it into the header file (make it
>>> inline).
> You should consider whether it's worth to move anything else to this
> module first, because if the functions are not reusable by the drivers,
> then the movement won't bring any benefits and final result could be
> negative in regards to the code's organization.
>
> I suggest to start clean and easy, without the driver module. You will
> be able to factor code into module later on, once there will a real need
> to do that.

Tegra124 can reuse above CIF function. Tegra30 will continue to use the=20
same function. For consistency all CIF related helpers can be grouped at=20
one place. But this is for later. I will start with inline function.


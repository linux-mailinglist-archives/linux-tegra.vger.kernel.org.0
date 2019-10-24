Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 215CDE3783
	for <lists+linux-tegra@lfdr.de>; Thu, 24 Oct 2019 18:11:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436819AbfJXQLU (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 24 Oct 2019 12:11:20 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:1577 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436655AbfJXQLU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Oct 2019 12:11:20 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5db1cd2b0002>; Thu, 24 Oct 2019 09:11:23 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 24 Oct 2019 09:11:18 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 24 Oct 2019 09:11:18 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 24 Oct
 2019 16:11:14 +0000
Received: from [10.21.133.51] (172.20.13.39) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 24 Oct
 2019 16:11:10 +0000
Subject: Re: [PATCH v4 3/7] ASoC: tegra: i2s: Add support for more than 2
 channels
To:     Dmitry Osipenko <digetx@gmail.com>,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        <linux-tegra@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-kernel@lists.codethink.co.uk>,
        Edward Cragg <edward.cragg@codethink.co.uk>
References: <20191007153136.4920-1-ben.dooks@codethink.co.uk>
 <20191007153136.4920-4-ben.dooks@codethink.co.uk>
 <cfd308bd-290a-f72f-6876-d94151c09843@gmail.com>
 <16910e8d-4745-4e55-0436-9b3200876037@codethink.co.uk>
 <1e43701b-3627-ba6d-ee19-020e25af3ef1@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <d03a8fa0-3c62-1e32-9ca6-06d1996da11b@nvidia.com>
Date:   Thu, 24 Oct 2019 17:11:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1e43701b-3627-ba6d-ee19-020e25af3ef1@gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1571933483; bh=/3ud5vYk3HOknP3MLwj012qN/whu0x4rGJaocEdOa9k=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=FxYFqiPkM2yfv2tRc+t6lLlgweBK1LG5Y7zEGelmni5AYvcjlrd4YSbsFx45UNWs7
         iy+RAdPvuuMhfFvVqmY2UOhTysDxOIbvc04qAkH6WKWIVe726vsted2wwlRJKLmXye
         4UDANoshTibJiMz9esyVz6/pQza4xy6QDF18X5iB12XJlC5DuyUEjrdF/eEDsQUZza
         rBcMMULYhcC5wNit6H2BL5TkeJCZNBXFkIeOwQSM9WXipb8uKnXmUNPfy2Ib7d/FRf
         OI25wDmXn1x1qdAydnlfLdC93klvgI9YCe2PB7IHnqhYH2ll9uFu78TikCybfW38zM
         9sonWxszBENiQ==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 17/10/2019 18:38, Dmitry Osipenko wrote:
> 17.10.2019 19:23, Ben Dooks =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On 08/10/2019 16:29, Dmitry Osipenko wrote:
>>> Hello Ben,
>>>
>>> 07.10.2019 18:31, Ben Dooks =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> From: Edward Cragg <edward.cragg@codethink.co.uk>
>>>>
>>>> The CIF configuration and clock setting is currently hard coded for 2
>>>> channels. Since the hardware is capable of supporting 1-8 channels add
>>>> support for reading the channel count from the supplied parameters to
>>>> allow for better TDM support. It seems the original implementation of
>>>> this
>>>> driver was fixed at 2 channels for simplicity, and not implementing TD=
M.
>>>>
>>>> Signed-off-by: Edward Cragg <edward.cragg@codethink.co.uk>
>>>> [ben.dooks@codethink.co.uk: added is_tdm and channel nr check]
>>>> [ben.dooks@codethink.co.uk: merge edge control into set-format]
>>>> [ben.dooks@codethink.co.uk: removed is_tdm and moved edge to hw_params=
]
>>>> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
>>>> ---
>>>> =C2=A0 sound/soc/tegra/tegra30_i2s.c | 21 +++++++++++++--------
>>>> =C2=A0 1 file changed, 13 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/sound/soc/tegra/tegra30_i2s.c
>>>> b/sound/soc/tegra/tegra30_i2s.c
>>>> index 063f34c882af..7382f7949bf4 100644
>>>> --- a/sound/soc/tegra/tegra30_i2s.c
>>>> +++ b/sound/soc/tegra/tegra30_i2s.c
>>>> @@ -67,6 +67,7 @@ static int tegra30_i2s_set_fmt(struct snd_soc_dai
>>>> *dai,
>>>> =C2=A0 {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct tegra30_i2s *i2s =3D snd_soc_dai=
_get_drvdata(dai);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int mask =3D 0, val =3D 0;
>>>> +=C2=A0=C2=A0=C2=A0 unsigned int ch_mask, ch_val =3D 0;
>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 switch (fmt & SND_SOC_DAIFMT_INV=
_MASK) {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case SND_SOC_DAIFMT_NB_NF:
>>>> @@ -75,6 +76,7 @@ static int tegra30_i2s_set_fmt(struct snd_soc_dai
>>>> *dai,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>> =C2=A0 +=C2=A0=C2=A0=C2=A0 ch_mask =3D TEGRA30_I2S_CH_CTRL_EGDE_CTRL_M=
ASK;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mask |=3D TEGRA30_I2S_CTRL_MASTER_ENABL=
E;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 switch (fmt & SND_SOC_DAIFMT_MASTER_MAS=
K) {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case SND_SOC_DAIFMT_CBS_CFS:
>>>> @@ -90,10 +92,12 @@ static int tegra30_i2s_set_fmt(struct snd_soc_dai
>>>> *dai,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 TEGRA30_I2S_CTR=
L_LRCK_MASK;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 switch (fmt & SND_SOC_DAIFMT_FORMAT_MAS=
K) {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case SND_SOC_DAIFMT_DSP_A:
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ch_val =3D TEGRA30_I2S_CH_=
CTRL_EGDE_CTRL_NEG_EDGE;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val |=3D TEGRA3=
0_I2S_CTRL_FRAME_FORMAT_FSYNC;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val |=3D TEGRA3=
0_I2S_CTRL_LRCK_L_LOW;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case SND_SOC_DAIFMT_DSP_B:
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ch_val =3D TEGRA30_I2S_CH_=
CTRL_EGDE_CTRL_NEG_EDGE;
>>>
>>> Downstream code sets DSP_B to POS_EDGE, looks like you have a typo here=
.
>>> Or does DSP_B happen to work with the NEG_EDGE?
>>
>> ok, will change, we've only been using SND_SOC_DAIFMT_DSP_A
>>
>> For reference, is there a git repo with this version of tegra tdm suppor=
t?
>=20
> Looks like all downstream kernels that supported T30 are doing the same
> thing.
>=20
> Take a look here for example:
>=20
> https://nv-tegra.nvidia.com/gitweb/?p=3Dlinux-3.10.git;a=3Dcommit;h=3D498=
34eef9d51a6eff950e0f52ddc5343d960652e

That version of the driver is known to be buggy/incorrect. I don't think
we want to do that. We want to set the polarity based upon the format
passed and not the mode ...

https://nv-tegra.nvidia.com/gitweb/?p=3Dlinux-nvidia.git;a=3Dblob;f=3Dsound=
/soc/tegra-alt/tegra210_i2s_alt.c;h=3D24cf3b55326f687aded22b91182df41c5ae18=
8ac;hb=3D703aa948d2c92b87fd84f367f43a07778ed098b5#l333

Jon

--=20
nvpublic

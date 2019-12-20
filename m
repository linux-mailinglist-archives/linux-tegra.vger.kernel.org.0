Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 392F01279F6
	for <lists+linux-tegra@lfdr.de>; Fri, 20 Dec 2019 12:30:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727192AbfLTLaR (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 20 Dec 2019 06:30:17 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:15871 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727252AbfLTLaR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 20 Dec 2019 06:30:17 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5dfcb0a80000>; Fri, 20 Dec 2019 03:29:44 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 20 Dec 2019 03:30:15 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 20 Dec 2019 03:30:15 -0800
Received: from [10.21.133.51] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 20 Dec
 2019 11:30:10 +0000
Subject: Re: [PATCH v5 2/7] ASoC: tegra: Allow 24bit and 32bit samples
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
References: <20191018154833.7560-1-ben.dooks@codethink.co.uk>
 <20191018154833.7560-3-ben.dooks@codethink.co.uk>
 <d2110a1f-c1de-e2c5-a1ff-5eb4c5d3e1da@gmail.com>
 <b4e2ec44-bc89-b5ca-cfa7-a6d5c45a9c94@codethink.co.uk>
 <a11ba33e-5ffb-c5c6-04f5-0e031877c55f@gmail.com>
 <621fa27d-9259-2949-9cf5-d2eda5cb0677@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <a0f027d9-e9e0-d76c-1e40-002fdc37eb5f@nvidia.com>
Date:   Fri, 20 Dec 2019 11:30:08 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <621fa27d-9259-2949-9cf5-d2eda5cb0677@gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1576841384; bh=XQv7Wecv1Az6SmSy/jfN57j28sMZixanijdPr0h5FaU=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=WSp2y5HId0Mq0shhE3DufndFB3bx3aW1FAdMWDRe5JvXBWtMvVA6hDoUdeTYOWlbQ
         9XjpHVkamv4+tCAJieBShchdlm2277bL+6fB5R/nC/55IImlFJDYRJz11qrkVehn1b
         ueAKiUV4VAfleXPimVk5mR5V9AakjnbyGRmJnZhz/lUTw4rIQ4Tv+Jql38cjpFQlmC
         +NaDkjFcPwvolMhz/6RD0gOMg4luREiQ6K7OE263U5YT1lUzAkFE08MURDoiDQI/Zt
         jO8vNkSjejFOISDYs4QRxjY86tD4FJaFaWUFyza98BrFbaWt4TElh4ekpnHvjYqb8z
         fY7+B2i2N1lug==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 25/11/2019 17:28, Dmitry Osipenko wrote:
> 25.11.2019 20:22, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> 25.11.2019 13:37, Ben Dooks =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> On 23/11/2019 21:09, Dmitry Osipenko wrote:
>>>> 18.10.2019 18:48, Ben Dooks =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>> From: Edward Cragg <edward.cragg@codethink.co.uk>
>>>>>
>>>>> The tegra3 audio can support 24 and 32 bit sample sizes so add the
>>>>> option to the tegra30_i2s_hw_params to configure the S24_LE or S32_LE
>>>>> formats when requested.
>>>>>
>>>>> Signed-off-by: Edward Cragg <edward.cragg@codethink.co.uk>
>>>>> [ben.dooks@codethink.co.uk: fixup merge of 24 and 32bit]
>>>>> [ben.dooks@codethink.co.uk: add pm calls around ytdm config]
>>>>> [ben.dooks@codethink.co.uk: drop debug printing to dev_dbg]
>>>>> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
>>>>> ---
>>>>> squash 5aeca5a055fd ASoC: tegra: i2s: pm_runtime_get_sync() is needed
>>>>> in tdm code
>>>>>
>>>>> ASoC: tegra: i2s: pm_runtime_get_sync() is needed in tdm code
>>>>> ---
>>>>> =C2=A0 sound/soc/tegra/tegra30_i2s.c | 25 ++++++++++++++++++++-----
>>>>> =C2=A0 1 file changed, 20 insertions(+), 5 deletions(-)
>>>>>
>>>>> diff --git a/sound/soc/tegra/tegra30_i2s.c
>>>>> b/sound/soc/tegra/tegra30_i2s.c
>>>>> index 73f0dddeaef3..063f34c882af 100644
>>>>> --- a/sound/soc/tegra/tegra30_i2s.c
>>>>> +++ b/sound/soc/tegra/tegra30_i2s.c
>>>>> @@ -127,7 +127,7 @@ static int tegra30_i2s_hw_params(struct
>>>>> snd_pcm_substream *substream,
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct device *dev =3D dai->dev;
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct tegra30_i2s *i2s =3D snd_soc_da=
i_get_drvdata(dai);
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int mask, val, reg;
>>>>> -=C2=A0=C2=A0=C2=A0 int ret, sample_size, srate, i2sclock, bitcnt;
>>>>> +=C2=A0=C2=A0=C2=A0 int ret, sample_size, srate, i2sclock, bitcnt, au=
dio_bits;
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct tegra30_ahub_cif_conf cif_conf;
>>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (params_channels(params) !=
=3D 2)
>>>>> @@ -137,8 +137,19 @@ static int tegra30_i2s_hw_params(struct
>>>>> snd_pcm_substream *substream,
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 switch (params_format(params)) {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case SNDRV_PCM_FORMAT_S16_LE:
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val =3D TEGRA3=
0_I2S_CTRL_BIT_SIZE_16;
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 audio_bits =3D TEGRA30_AU=
DIOCIF_BITS_16;
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sample_size =
=3D 16;
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>>> +=C2=A0=C2=A0=C2=A0 case SNDRV_PCM_FORMAT_S24_LE:
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val =3D TEGRA30_I2S_CTRL_=
BIT_SIZE_24;
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 audio_bits =3D TEGRA30_AU=
DIOCIF_BITS_24;
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sample_size =3D 24;
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>>> +=C2=A0=C2=A0=C2=A0 case SNDRV_PCM_FORMAT_S32_LE:
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val =3D TEGRA30_I2S_CTRL_=
BIT_SIZE_32;
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 audio_bits =3D TEGRA30_AU=
DIOCIF_BITS_32;
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sample_size =3D 32;
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 default:
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL=
;
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>> @@ -170,8 +181,8 @@ static int tegra30_i2s_hw_params(struct
>>>>> snd_pcm_substream *substream,
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cif_conf.threshold =3D 0;
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cif_conf.audio_channels =3D 2;
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cif_conf.client_channels =3D 2;
>>>>> -=C2=A0=C2=A0=C2=A0 cif_conf.audio_bits =3D TEGRA30_AUDIOCIF_BITS_16;
>>>>> -=C2=A0=C2=A0=C2=A0 cif_conf.client_bits =3D TEGRA30_AUDIOCIF_BITS_16=
;
>>>>> +=C2=A0=C2=A0=C2=A0 cif_conf.audio_bits =3D audio_bits;
>>>>> +=C2=A0=C2=A0=C2=A0 cif_conf.client_bits =3D audio_bits;
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cif_conf.expand =3D 0;
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cif_conf.stereo_conv =3D 0;
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cif_conf.replicate =3D 0;
>>>>> @@ -306,14 +317,18 @@ static const struct snd_soc_dai_driver
>>>>> tegra30_i2s_dai_template =3D {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .channels_min =
=3D 2,
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .channels_max =
=3D 2,
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .rates =3D SND=
RV_PCM_RATE_8000_96000,
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .formats =3D SNDRV_PCM_FM=
TBIT_S16_LE,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .formats =3D SNDRV_PCM_FM=
TBIT_S32_LE |
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 SNDRV_PCM_FMTBIT_S24_LE |
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 SNDRV_PCM_FMTBIT_S16_LE,
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .capture =3D {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .stream_name =
=3D "Capture",
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .channels_min =
=3D 2,
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .channels_max =
=3D 2,
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .rates =3D SND=
RV_PCM_RATE_8000_96000,
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .formats =3D SNDRV_PCM_FM=
TBIT_S16_LE,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .formats =3D SNDRV_PCM_FM=
TBIT_S32_LE |
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 SNDRV_PCM_FMTBIT_S24_LE |
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 SNDRV_PCM_FMTBIT_S16_LE,
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .ops =3D &tegra30_i2s_dai_ops,
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .symmetric_rates =3D 1,
>>>>>
>>>>
>>>> Hello,
>>>>
>>>> This patch breaks audio on Tegra30. I don't see errors anywhere, but
>>>> there is no audio and reverting this patch helps. Please fix it.
>>>
>>> What is the failure mode? I can try and take a look at this some time
>>> this week, but I am not sure if I have any boards with an actual useful
>>> audio output?
>>
>> The failure mode is that there no sound. I also noticed that video
>> playback stutters a lot if movie file has audio track, seems something
>> times out during of the audio playback. For now I don't have any more in=
fo.
>>
>=20
> Oh, I didn't say how to reproduce it.. for example simply playing
> big_buck_bunny_720p_h264.mov in MPV has the audio problem.
>=20
> https://download.blender.org/peach/bigbuckbunny_movies/big_buck_bunny_720=
p_h264.mov

Given that the audio drivers uses regmap, it could be good to dump the
I2S/AHUB registers while the clip if playing with and without this patch
to see the differences. I am curious if the audio is now being played as
24 or 32-bit instead of 16-bit now these are available.

You could also dump the hw_params to see the format while playing as
well ...

$ /proc/asound/<scard-name>/pcm0p/sub0/hw_params

Jon

--=20
nvpublic

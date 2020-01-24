Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F83C148C83
	for <lists+linux-tegra@lfdr.de>; Fri, 24 Jan 2020 17:50:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389409AbgAXQuw (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 24 Jan 2020 11:50:52 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:7462 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387875AbgAXQuw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 24 Jan 2020 11:50:52 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e2b205c0000>; Fri, 24 Jan 2020 08:50:36 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 24 Jan 2020 08:50:50 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 24 Jan 2020 08:50:50 -0800
Received: from [10.21.133.51] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 24 Jan
 2020 16:50:48 +0000
Subject: Re: [alsa-devel] [Linux-kernel] [PATCH v5 2/7] ASoC: tegra: Allow
 24bit and 32bit samples
To:     Ben Dooks <ben.dooks@codethink.co.uk>,
        Dmitry Osipenko <digetx@gmail.com>
CC:     <linux-kernel@lists.codethink.co.uk>,
        <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Edward Cragg <edward.cragg@codethink.co.uk>,
        <linux-tegra@vger.kernel.org>
References: <20191018154833.7560-1-ben.dooks@codethink.co.uk>
 <a11ba33e-5ffb-c5c6-04f5-0e031877c55f@gmail.com>
 <621fa27d-9259-2949-9cf5-d2eda5cb0677@gmail.com>
 <a0f027d9-e9e0-d76c-1e40-002fdc37eb5f@nvidia.com>
 <d43d518d-9336-a011-2a69-3f9331f6d0b4@codethink.co.uk>
 <aba4edd6-0ea5-5e95-c5a0-9e749587c763@nvidia.com>
 <449bdc3c-bf82-7cc4-6704-440dd100ca3a@gmail.com>
 <5d3ae629-5d30-0930-5dd1-15161e64926e@codethink.co.uk>
 <9daeeb94-2b90-18b8-2e1e-daae5acf079d@gmail.com>
 <fd73f68c-80f5-ac80-f6e4-42256d3df76d@codethink.co.uk>
 <37beb96a-a525-c72f-a7e1-e9ef5d61f3b2@gmail.com>
 <29db3df4-6f51-7c0f-1eef-90171f1d233a@codethink.co.uk>
 <9a5447e2-155c-7e6e-b8f1-95523c6f42c6@gmail.com>
 <b4a416fb-f2b1-660d-27e3-aebf602178f9@codethink.co.uk>
 <680e2dfd-6f4f-5c96-63b7-97520961dc82@gmail.com>
 <0e0cd260e39ad293edb881da1c565510@codethink.co.uk>
 <507dcd5a-672b-61ac-aa7f-af5ff01accff@codethink.co.uk>
 <a2744ea0-cf6d-d083-75e6-853746195001@gmail.com>
 <28cafc56-095b-68c6-638d-270608a2983f@codethink.co.uk>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <3d8544be-af20-f382-85fd-32183365267b@nvidia.com>
Date:   Fri, 24 Jan 2020 16:50:46 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <28cafc56-095b-68c6-638d-270608a2983f@codethink.co.uk>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1579884636; bh=UBuebTzX36A7jML+Z3K4Q7iEWRJLoXDLDzs2+StBasE=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=mER7qWmfPv+Ab8am01xjv80RvqZdabdlWGRe0/ftniBnRfScDmpbwnkQR9Jw6i18s
         fhgNzTsrq1xvZUXGhkRJGCQbgBFN1iHXzK9M3vSxjFqHM4MQs1y6srw4WRdzfoi5Db
         Ysh83BX7lyBRapI5XU+2SFNVMU3mSXhtzku0MO6E4aAnPHH4u+j9axfUXL768XVFVP
         2uEvOsGtM+eOApwW4+onxo2KY1XFoS7KvjFPTYWuF7hR6tK1K75ec7JyjIwpQ3/wwF
         1+d3hz/s2EYcSwWmKRc4iPGJVBU3ZbpFG28/sjYrPtjegoGIQasLBiDib8Zw+UlFIL
         pVmICdyNueODg==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 23/01/2020 19:38, Ben Dooks wrote:
> On 07/01/2020 01:39, Dmitry Osipenko wrote:
>> 06.01.2020 22:00, Ben Dooks =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> On 05/01/2020 10:53, Ben Dooks wrote:
>>>>
>>>>
>>>> On 2020-01-05 01:48, Dmitry Osipenko wrote:
>>>>> 05.01.2020 03:04, Ben Dooks =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>>> [snip]
>>>>>>
>>>>>> I've just gone through testing.
>>>>>>
>>>>>> Some simple data tests show 16 and 32-bits work.
>>>>>>
>>>>>> The 24 bit case seems to be weird, it looks like the 24-bit expects
>>>>>> 24 bit samples in 32 bit words. I can't see any packing options to
>>>>>> do 24 bit in 24 bit, so we may have to remove 24 bit sample support
>>>>>> (which is a shame)
>>>>>>
>>>>>> My preference is to remove the 24-bit support and keep the 32 bit in=
.
>>>>>>
>>>>>
>>>>> Interesting.. Jon, could you please confirm that 24bit format isn't
>>>>> usable on T30?
>>>>
>>>> If there is an option of 24 packed into 32, then I think that would
>>>> work.
>>>>
>>>> I can try testing that with raw data on Monday.
>>>
>>> I need to check some things, I assumed 24 was 24 packed bits, it looks
>>> like the default is 24 in 32 bits so we may be ok. However I need to
>>> re-write my test case which assumed it was 24bits in 3 bytes (S24_3LE).
>>>
>>> I'll follow up later,
>>
>> Okay, the S24_3LE isn't supported by RT5640 codec in my case. I briefly
>> looked through the TRM doc and got impression that AHUB could re-pack
>> data stream into something that codec supports, but maybe it's a wrong
>> impression.
>> _________________________________
>=20
> I did a quick test with the following:
>=20
> =C2=A0sox -n -b 16 -c 2 -r 44100 /tmp/tmp.wav=C2=A0 synth sine 500 vol 0.=
5
> =C2=A0sox -n -b 24 -c 2 -r 44100 /tmp/tmp.wav=C2=A0 synth sine 500 vol 0.=
5
> =C2=A0sox -n -b 32 -c 2 -r 44100 /tmp/tmp.wav=C2=A0 synth sine 500 vol 0.=
5
>=20
> The 16 and 32 work fine, the 24 is showing a playback output freq
> of 440Hz instead of 500Hz... this suggests the clock is off, or there
> is something else weird going on...

I was looking at using sox to create such as file, but the above command
generates a S24_3LE file and not S24_LE file. The codec on Jetson-TK1
supports S24_LE but does not support S24_3LE and so I cannot test this.
Anyway, we really need to test S24_LE and not S24_3LE because this is
the problem that Dmitry is having.

Ben is S24_3LE what you really need to support?

Dmitry, does the following fix your problem?

diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
index dbed3c5408e7..92845c4b63f4 100644
--- a/sound/soc/tegra/tegra30_i2s.c
+++ b/sound/soc/tegra/tegra30_i2s.c
@@ -140,7 +140,7 @@ static int tegra30_i2s_hw_params(struct
snd_pcm_substream *substream,
                audio_bits =3D TEGRA30_AUDIOCIF_BITS_16;
                sample_size =3D 16;
                break;
-       case SNDRV_PCM_FORMAT_S24_LE:
+       case SNDRV_PCM_FORMAT_S24_3LE:
                val =3D TEGRA30_I2S_CTRL_BIT_SIZE_24;
                audio_bits =3D TEGRA30_AUDIOCIF_BITS_24;
                sample_size =3D 24;
@@ -318,7 +318,7 @@ static const struct snd_soc_dai_driver
tegra30_i2s_dai_template =3D {
                .channels_max =3D 2,
                .rates =3D SNDRV_PCM_RATE_8000_96000,
                .formats =3D SNDRV_PCM_FMTBIT_S32_LE |
-                          SNDRV_PCM_FMTBIT_S24_LE |
+                          SNDRV_PCM_FMTBIT_S24_3LE |
                           SNDRV_PCM_FMTBIT_S16_LE,
        },
        .capture =3D {
@@ -327,7 +327,7 @@ static const struct snd_soc_dai_driver
tegra30_i2s_dai_template =3D {
                .channels_max =3D 2,
                .rates =3D SNDRV_PCM_RATE_8000_96000,
                .formats =3D SNDRV_PCM_FMTBIT_S32_LE |
-                          SNDRV_PCM_FMTBIT_S24_LE |
+                          SNDRV_PCM_FMTBIT_S24_3LE |
                           SNDRV_PCM_FMTBIT_S16_LE,
        },
        .ops =3D &tegra30_i2s_dai_ops,

Jon

--=20
nvpublic

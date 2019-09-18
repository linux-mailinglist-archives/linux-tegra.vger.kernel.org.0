Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BEFCB6164
	for <lists+linux-tegra@lfdr.de>; Wed, 18 Sep 2019 12:25:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728649AbfIRKZp (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 18 Sep 2019 06:25:45 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:4311 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725298AbfIRKZp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 18 Sep 2019 06:25:45 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d82062a0000>; Wed, 18 Sep 2019 03:25:46 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 18 Sep 2019 03:25:44 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 18 Sep 2019 03:25:44 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 18 Sep
 2019 10:25:43 +0000
Received: from [10.21.132.148] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 18 Sep
 2019 10:25:41 +0000
Subject: Re: [PATCH 1/8] ASoC: tegra: Add a TDM configuration callback
To:     Ben Dooks <ben.dooks@codethink.co.uk>
CC:     <linux-tegra@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        "Jaroslav Kysela" <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        <linux-kernel@lists.codethink.co.uk>,
        "Edward Cragg" <edward.cragg@codethink.co.uk>,
        <linux-tegra-owner@vger.kernel.org>
References: <20190917181233.534-1-ben.dooks@codethink.co.uk>
 <20190917181233.534-2-ben.dooks@codethink.co.uk>
 <7b21823a-86e8-d3de-10b5-e047a5e025ef@nvidia.com>
 <72705cbf3b70934bdf8e7a6116f420b5@codethink.co.uk>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <5b0044e1-b781-9fd8-b250-3d87fe3af855@nvidia.com>
Date:   Wed, 18 Sep 2019 11:25:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <72705cbf3b70934bdf8e7a6116f420b5@codethink.co.uk>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1568802346; bh=wGGduJnQGaJZGgnKcA8Yba16L447Dx8oCOkglNgP42A=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=V+oEUoT4UnH8+BujFSVjpEZcR17UYBe0lcVaHc6zXuW3HS521HYi50y1mnm5inRxF
         PAxJuvRNSqqvd0Ip0JHj1u6mqV1vpjxtYoISteAysd6hITBkhaooB9uSKvvjZQBev/
         QO0pNPKlxQk0B6HI+C9tve1vtbdj4zcZD8AOOXqvicItwHsl81LjT2WuhHU32z2aP8
         SxgleU+z7SnoRJyp3QSu4/91hX+nlPm6LHW52NaTZSijYaAI4kGvkX070ZX2Ax5X6C
         J4gBLzIqhXFJKEHPSiEnyWNFy9BbpiTCulWkiTc9Yj29TocLpxmvw00AiO0twqPy7H
         Z+0uFRuJFEI1A==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 18/09/2019 11:11, Ben Dooks wrote:
>=20
>=20
> On 2019-09-18 09:42, Jon Hunter wrote:
>> On 17/09/2019 19:12, Ben Dooks wrote:
>>> From: Edward Cragg <edward.cragg@codethink.co.uk>
>>>
>>> Add a callback to configure TDM settings for the Tegra30 I2S ASoC
>>> 'platform'
>>> driver.
>>>
>>> Signed-off-by: Edward Cragg <edward.cragg@codethink.co.uk>
>>> ---
>>> =C2=A0sound/soc/tegra/tegra30_i2s.c | 34 ++++++++++++++++++++++++++++++=
++++
>>> =C2=A01 file changed, 34 insertions(+)
>>>
>>> diff --git a/sound/soc/tegra/tegra30_i2s.c
>>> b/sound/soc/tegra/tegra30_i2s.c
>>> index ac6983c6bd72..d36b4662b420 100644
>>> --- a/sound/soc/tegra/tegra30_i2s.c
>>> +++ b/sound/soc/tegra/tegra30_i2s.c
>>> @@ -254,6 +254,39 @@ static int tegra30_i2s_trigger(struct
>>> snd_pcm_substream *substream, int cmd,
>>> =C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>> =C2=A0}
>>>
>>> +/*
>>> + * Set up TDM
>>> + */
>>> +static int tegra30_i2s_set_tdm(struct snd_soc_dai *dai,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int tx_mask, unsigned int =
rx_mask,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int slots, int slot_width)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 struct tegra30_i2s *i2s =3D snd_soc_dai_get_drvdata=
(dai);
>>> +=C2=A0=C2=A0=C2=A0 unsigned int mask =3D 0, val =3D 0;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 dev_info(dai->dev, "%s: setting TDM: tx_mask: 0x%08=
x rx_mask:
>>> 0x%08x "
>>
>> dev_dbg() please. Also I don't think it is necessary to print both the
>> function name and 'setting TDM', the function name should be sufficient.
>=20
> Yes, already sorted from previous review.
>=20
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "slots: 0x%08x " "wid=
th: %d\n",
>>
>> Why are there extra quotes here?
>=20
> No idea, I'll remove these later.
>=20
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __func__, tx_mask, rx=
_mask, slots, slot_width)> +
>>> +=C2=A0=C2=A0=C2=A0 /* Set up slots and tx/rx masks */
>>> +=C2=A0=C2=A0=C2=A0 mask =3D TEGRA30_I2S_SLOT_CTRL_TOTAL_SLOTS_MASK |
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 TEGRA30_I=
2S_SLOT_CTRL_RX_SLOT_ENABLES_MASK |
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 TEGRA30_I=
2S_SLOT_CTRL_TX_SLOT_ENABLES_MASK;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 val =3D (tx_mask << TEGRA30_I2S_SLOT_CTRL_TX_SLOT_E=
NABLES_SHIFT) |
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (rx_mask << TEG=
RA30_I2S_SLOT_CTRL_RX_SLOT_ENABLES_SHIFT) |
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ((slots - 1) <<=
 TEGRA30_I2S_SLOT_CTRL_TOTAL_SLOTS_SHIFT);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 regmap_update_bits(i2s->regmap, TEGRA30_I2S_SLOT_CT=
RL, mask, val);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 /* Set FSYNC width */
>>> +=C2=A0=C2=A0=C2=A0 regmap_update_bits(i2s->regmap, TEGRA30_I2S_CH_CTRL=
,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 TEGRA30_I2S_CH_CTRL_FSYNC_W=
IDTH_MASK,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (slot_width - 1) << TEGRA30=
_I2S_CH_CTRL_FSYNC_WIDTH_SHIFT);
>>
>> What happens if there is only one slot? The fsync will be the width of
>> the slot. Typically, TDM is used with DSP-A/B formats and although the
>> driver does not appear to program the fsync width, it probably should
>> during the tegra30_i2s_set_fmt() depending on the format used rather
>> than here.
>=20
> Hmm, should we check.
>=20
> The work was done to keep as close to the original client's 2.6 kernel
> as possible which set the fsync field to a whole data word. We could try
> and just set this to say 2 here and have a much shorter frame-sync pulse.
>=20
> I'll add a check for slots < 2 and set the fsync width to 2.

Why 2? From looking at various codecs that support dsp-a/b modes, it is
more common for the f-sync to be 1 regardless of the number of slots.

Jon
--=20
nvpublic

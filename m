Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3AE41CDCDB
	for <lists+linux-tegra@lfdr.de>; Mon,  7 Oct 2019 10:08:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727224AbfJGIIh (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 7 Oct 2019 04:08:37 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:16734 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726889AbfJGIIh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 7 Oct 2019 04:08:37 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d9af2870000>; Mon, 07 Oct 2019 01:08:39 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 07 Oct 2019 01:08:35 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 07 Oct 2019 01:08:35 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 7 Oct
 2019 08:08:35 +0000
Received: from [10.21.133.51] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 7 Oct 2019
 08:08:33 +0000
Subject: Re: [PATCH v3 6/7] ASoC: tegra: config fifos on hw_param changes
To:     Ben Dooks <ben.dooks@codethink.co.uk>,
        <linux-tegra@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-kernel@lists.codethink.co.uk>
References: <20190930165130.10642-1-ben.dooks@codethink.co.uk>
 <20190930165130.10642-7-ben.dooks@codethink.co.uk>
 <3a65d828-8430-9739-7973-10e0df360767@nvidia.com>
 <faed4e1f-0e67-88b1-e276-80a8a5cd4b3e@codethink.co.uk>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <f98024eb-2a85-9d80-d88a-486078807740@nvidia.com>
Date:   Mon, 7 Oct 2019 09:08:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <faed4e1f-0e67-88b1-e276-80a8a5cd4b3e@codethink.co.uk>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1570435719; bh=MN0U0cLhLQSdagBcaQ9XHhJhZnF+eNMQsmHaFn0JKZw=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=W3iSPRQC/AQI2L0lsLaj8GBNcWmxzjh6t1M2oEzahOzwO50QC3yYEi0m0rWTpOaFj
         tSqzadoUuz/voYFUXQU0Olt/a5Ep4RiOmIrh+nSEcnX24ejgN/5C/uX/iiaBIqQs1b
         3t6/M9N1oZXYyp+MZKeuZsy++1vwIUgRuMEQRCaK3ezJFmLvpEMUrXW8EtYcseyYH7
         xo08ZR8N/IkLYYUtlSJrrIdR734Bv2mpfi2TgCJXYCgqiZMlzwLxlKj5QZBq1IvFGi
         jxp7YYPVkim0oGn72Qrpv/9E0oJjfCBDjzt8msZGqaM9lK0+vclGFz0138bn3Mjagl
         JZ2X3pveunMNg==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 04/10/2019 18:03, Ben Dooks wrote:
> On 30/09/2019 22:08, Jon Hunter wrote:
>>
>> On 30/09/2019 17:51, Ben Dooks wrote:
>>> If the hw_params uses a different bit or channel count, then we
>>> need to change both the I2S unit's CIF configuration as well as
>>> the APBIF one.
>>>
>>> To allow changing the APBIF, add a call to reconfigure the RX or
>>> TX FIFO without changing the DMA or allocation, and get the I2S
>>> driver to call it once the hw params have been calculate.
>>>
>>> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
>>> ---
>>> =C2=A0 sound/soc/tegra/tegra30_ahub.c | 114 ++++++++++++++++++---------=
------
>>> =C2=A0 sound/soc/tegra/tegra30_ahub.h |=C2=A0=C2=A0 5 ++
>>> =C2=A0 sound/soc/tegra/tegra30_i2s.c=C2=A0 |=C2=A0=C2=A0 2 +
>>> =C2=A0 3 files changed, 69 insertions(+), 52 deletions(-)
>>>
>>> diff --git a/sound/soc/tegra/tegra30_ahub.c
>>> b/sound/soc/tegra/tegra30_ahub.c
>>> index 952381260dc3..58e05ceb86da 100644
>>> --- a/sound/soc/tegra/tegra30_ahub.c
>>> +++ b/sound/soc/tegra/tegra30_ahub.c
>>> @@ -84,12 +84,40 @@ static int tegra30_ahub_runtime_resume(struct
>>> device *dev)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>> =C2=A0 }
>>> =C2=A0 +int tegra30_ahub_setup_rx_fifo(enum tegra30_ahub_rxcif rxcif,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct tegra30_ahub_cif_conf *cif_c=
onf)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 int channel =3D rxcif - TEGRA30_AHUB_RXCIF_APBIF_RX=
0;
>>> +=C2=A0=C2=A0=C2=A0 u32 reg, val;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 pm_runtime_get_sync(ahub->dev);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 reg =3D TEGRA30_AHUB_CHANNEL_CTRL +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (channel * TEGR=
A30_AHUB_CHANNEL_CTRL_STRIDE);
>>> +=C2=A0=C2=A0=C2=A0 val =3D tegra30_apbif_read(reg);
>>> +=C2=A0=C2=A0=C2=A0 val &=3D ~(TEGRA30_AHUB_CHANNEL_CTRL_RX_THRESHOLD_M=
ASK |
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 TEGRA30_AHUB_CHANNEL_=
CTRL_RX_PACK_MASK);
>>> +=C2=A0=C2=A0=C2=A0 val |=3D (7 << TEGRA30_AHUB_CHANNEL_CTRL_RX_THRESHO=
LD_SHIFT) |
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 TEGRA30_A=
HUB_CHANNEL_CTRL_RX_PACK_EN |
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 TEGRA30_A=
HUB_CHANNEL_CTRL_RX_PACK_16;
>>> +=C2=A0=C2=A0=C2=A0 tegra30_apbif_write(reg, val);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 cif_conf->direction =3D TEGRA30_AUDIOCIF_DIRECTION_=
RX;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 reg =3D TEGRA30_AHUB_CIF_RX_CTRL +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (channel * TEGR=
A30_AHUB_CIF_RX_CTRL_STRIDE);
>>> +=C2=A0=C2=A0=C2=A0 ahub->soc_data->set_audio_cif(ahub->regmap_apbif, r=
eg, cif_conf);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 pm_runtime_put(ahub->dev);
>>> +=C2=A0=C2=A0=C2=A0 return 0;
>>> +}
>>> +EXPORT_SYMBOL_GPL(tegra30_ahub_setup_rx_fifo);
>>> +
>>> =C2=A0 int tegra30_ahub_allocate_rx_fifo(enum tegra30_ahub_rxcif *rxcif=
,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 char *dmachan, int dmachan_le=
n,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_addr_t *fiforeg)
>>> =C2=A0 {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int channel;
>>> -=C2=A0=C2=A0=C2=A0 u32 reg, val;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct tegra30_ahub_cif_conf cif_conf;
>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 channel =3D find_first_zero_bit(a=
hub->rx_usage,
>>> @@ -104,37 +132,14 @@ int tegra30_ahub_allocate_rx_fifo(enum
>>> tegra30_ahub_rxcif *rxcif,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *fiforeg =3D ahub->apbif_addr + TEGRA30_=
AHUB_CHANNEL_RXFIFO +
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 (channel * TEGRA30_AHUB_CHANNEL_RXFIFO_STRIDE);
>>> =C2=A0 -=C2=A0=C2=A0=C2=A0 pm_runtime_get_sync(ahub->dev);
>>> +=C2=A0=C2=A0=C2=A0 memset(&cif_conf, 0, sizeof(cif_conf));
>>> =C2=A0 -=C2=A0=C2=A0=C2=A0 reg =3D TEGRA30_AHUB_CHANNEL_CTRL +
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (channel * TEGR=
A30_AHUB_CHANNEL_CTRL_STRIDE);
>>> -=C2=A0=C2=A0=C2=A0 val =3D tegra30_apbif_read(reg);
>>> -=C2=A0=C2=A0=C2=A0 val &=3D ~(TEGRA30_AHUB_CHANNEL_CTRL_RX_THRESHOLD_M=
ASK |
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 TEGRA30_AHUB_CHANNEL_=
CTRL_RX_PACK_MASK);
>>> -=C2=A0=C2=A0=C2=A0 val |=3D (7 << TEGRA30_AHUB_CHANNEL_CTRL_RX_THRESHO=
LD_SHIFT) |
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 TEGRA30_A=
HUB_CHANNEL_CTRL_RX_PACK_EN |
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 TEGRA30_A=
HUB_CHANNEL_CTRL_RX_PACK_16;
>>> -=C2=A0=C2=A0=C2=A0 tegra30_apbif_write(reg, val);
>>> -
>>> -=C2=A0=C2=A0=C2=A0 cif_conf.threshold =3D 0;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cif_conf.audio_channels =3D 2;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cif_conf.client_channels =3D 2;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cif_conf.audio_bits =3D TEGRA30_AUDIOCIF=
_BITS_16;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cif_conf.client_bits =3D TEGRA30_AUDIOCI=
F_BITS_16;
>>> -=C2=A0=C2=A0=C2=A0 cif_conf.expand =3D 0;
>>> -=C2=A0=C2=A0=C2=A0 cif_conf.stereo_conv =3D 0;
>>> -=C2=A0=C2=A0=C2=A0 cif_conf.replicate =3D 0;
>>> -=C2=A0=C2=A0=C2=A0 cif_conf.direction =3D TEGRA30_AUDIOCIF_DIRECTION_R=
X;
>>> -=C2=A0=C2=A0=C2=A0 cif_conf.truncate =3D 0;
>>> -=C2=A0=C2=A0=C2=A0 cif_conf.mono_conv =3D 0;
>>> -
>>> -=C2=A0=C2=A0=C2=A0 reg =3D TEGRA30_AHUB_CIF_RX_CTRL +
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (channel * TEGR=
A30_AHUB_CIF_RX_CTRL_STRIDE);
>>> -=C2=A0=C2=A0=C2=A0 ahub->soc_data->set_audio_cif(ahub->regmap_apbif, r=
eg, &cif_conf);
>>> -
>>> -=C2=A0=C2=A0=C2=A0 pm_runtime_put(ahub->dev);
>>> =C2=A0 -=C2=A0=C2=A0=C2=A0 return 0;
>>> +=C2=A0=C2=A0=C2=A0 return tegra30_ahub_setup_rx_fifo(*rxcif, &cif_conf=
);
>>
>> It seems a bit odd, that you still configure some of the cif_conf
>> members and then call tegra30_ahub_setup_rx_fifo() here. Why not just
>> allocate it and then move all the programming to
>> tegra30_ahub_setup_rx_fifo()?
>=20
> I was trying to keep the behaviour the same, IIRC the original is first
> called before the format information is known.

Looks like the I2S driver is the only current user of this, so splitting
the function into two could make sense.

Cheers
Jon

--=20
nvpublic

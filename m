Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F568C35E4
	for <lists+linux-tegra@lfdr.de>; Tue,  1 Oct 2019 15:38:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726086AbfJANiB (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 1 Oct 2019 09:38:01 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:11602 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388067AbfJANiB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 1 Oct 2019 09:38:01 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d9356ba0002>; Tue, 01 Oct 2019 06:38:02 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 01 Oct 2019 06:37:59 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 01 Oct 2019 06:37:59 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 1 Oct
 2019 13:37:59 +0000
Received: from [10.21.133.51] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 1 Oct 2019
 13:37:57 +0000
Subject: Re: [PATCH v3 1/7] ASoC: tegra: add a TDM configuration callback
To:     Ben Dooks <ben.dooks@codethink.co.uk>,
        <linux-tegra@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-kernel@lists.codethink.co.uk>,
        Edward Cragg <edward.cragg@codethink.co.uk>
References: <20190930165130.10642-1-ben.dooks@codethink.co.uk>
 <20190930165130.10642-2-ben.dooks@codethink.co.uk>
 <c2a7c046-011e-437b-0f09-0853d5cf7f34@nvidia.com>
 <85bb5ec6-8928-e4ea-8ca5-3ce1afcc4324@codethink.co.uk>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <f4e68563-e059-9f86-7340-de71c59d9a90@nvidia.com>
Date:   Tue, 1 Oct 2019 14:37:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <85bb5ec6-8928-e4ea-8ca5-3ce1afcc4324@codethink.co.uk>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1569937082; bh=w8sCPaGezj4QD3vGOKaOTJS3/bxHZ3Lth19aUUopw8c=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=QkY2MhyIrYZXvt1QDdwN83GKd06AFc0Z67NzC4AHAH1MGOKoFxFuYPfdKxHVYMvId
         L2bnO138mlwg7uqwniuwmtgsDorPVsUQA7jV+Lfchu2e2AR1QZoeM2lN3CX2WFzdql
         jIurKN4jHQPkibfe1wlw2SqoYlNn37XWapacYfSH3qxWHGZrqHwAVxLFdgnEwhuD0O
         9+c8tHDQnoTzrH63DkWnodizESf0VCHmkO2gruSWi7UgAm1dZmju2PGfap6FmfRskQ
         gHksUpC/sFopjXGG0Sw3tR3spWd0v3v30H+o/xn0nWQsO+3Oc1/eAUMaYrnPeEIJ18
         RQI46H4QADi+A==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 01/10/2019 12:00, Ben Dooks wrote:
> On 30/09/2019 21:46, Jon Hunter wrote:
>>
>> On 30/09/2019 17:51, Ben Dooks wrote:
>>> From: Edward Cragg <edward.cragg@codethink.co.uk>
>>>
>>> Add a callback to configure TDM settings for the Tegra30 I2S ASoC
>>> 'platform'
>>> driver.
>>>
>>> Signed-off-by: Edward Cragg <edward.cragg@codethink.co.uk>
>>> [ben.dooks@codethink.co.uk: merge fix for power management]
>>> [ben.dooks@codethink.co.uk: add review change for fsync of 1 clock]
>>> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
>>> ---
>>> =C2=A0 sound/soc/tegra/tegra30_i2s.c | 33 +++++++++++++++++++++++++++++=
++++
>>> =C2=A0 1 file changed, 33 insertions(+)
>>>
>>> diff --git a/sound/soc/tegra/tegra30_i2s.c
>>> b/sound/soc/tegra/tegra30_i2s.c
>>> index ac6983c6bd72..7f9ef6abeae2 100644
>>> --- a/sound/soc/tegra/tegra30_i2s.c
>>> +++ b/sound/soc/tegra/tegra30_i2s.c
>>> @@ -254,6 +254,38 @@ static int tegra30_i2s_trigger(struct
>>> snd_pcm_substream *substream, int cmd,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>> =C2=A0 }
>>> =C2=A0 +/*
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
>>> +=C2=A0=C2=A0=C2=A0 unsigned int mask, val;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 dev_dbg(dai->dev, "%s: txmask=3D0x%08x rxmask=3D0x%=
08x slots=3D%d
>>> width=3D%d\n",
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __func__, tx_mask, rx=
_mask, slots, slot_width);
>>> +
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
>>
>> I am not sure why this keeps changing. Why not set to 1 always?
>=20
> This is the total number of slots, not the width of the fsync
> which has been changed to 1 below this.

Ah yes indeed. Sorry, should have waited until this morning to look at
this! Jon

--=20
nvpublic

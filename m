Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A366755B68
	for <lists+linux-tegra@lfdr.de>; Wed, 26 Jun 2019 00:38:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726179AbfFYWiT (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 25 Jun 2019 18:38:19 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:11971 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725782AbfFYWiT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 25 Jun 2019 18:38:19 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d12a25d0000>; Tue, 25 Jun 2019 15:38:21 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 25 Jun 2019 15:38:18 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 25 Jun 2019 15:38:18 -0700
Received: from [10.26.11.186] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 25 Jun
 2019 22:38:17 +0000
Subject: Re: [PATCH 5/9] ASoC: soc-core: use soc_find_component() at
 snd_soc_get_dai_id()
To:     Dmitry Osipenko <digetx@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Mark Brown <broonie@kernel.org>
CC:     Linux-ALSA <alsa-devel@alsa-project.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <87y33aaluu.wl-kuninori.morimoto.gx@renesas.com>
 <87r292alro.wl-kuninori.morimoto.gx@renesas.com>
 <cb3a6d0a-ca7b-d6b6-72db-5dff520acfc9@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <374e71f7-b49c-ec79-f3ca-ae630a383521@nvidia.com>
Date:   Tue, 25 Jun 2019 23:38:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <cb3a6d0a-ca7b-d6b6-72db-5dff520acfc9@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1561502301; bh=IbMAqbxmQOxup47m/oBr9tWB4Q6AVv96KeE9VVQ8/qQ=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=lCGuudjLKmUyNe6FOqomnuqJbu0X/uhag1pKzh1E80ZFkXTSBeZYXI6SgpFCAapCm
         5jFa/y5Ik00Oj0GB35kRTt4UYSdiTwob/zsX/BE/mHak01DtCMmlNrCr2CIrcCE0sd
         7GBvtAkKRXjHrA+zVcGRd++NtoGdIovyGsgHGftuDGZX6hOHxXumPGLOGBW/Orc1tt
         +rGt26mv8Nlux/ne347CI3cJ4HAmpbhypqSI4Jhg9XjnK/deKCIgVH2Oes0LSXokfS
         WwQbC8RaumY0NgeT66iQyVFIYQ6Y5qeb34bavdWrXME33kLcQrKhNTd/OVZiuiJTU2
         9i4cgeGIuXgSA==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 25/06/2019 21:47, Dmitry Osipenko wrote:
> 13.05.2019 10:07, Kuninori Morimoto =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>>
>> soc-core core already has soc_find_component() which find
>> component from device node.
>> Let's use existing function to find component.
>>
>> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>> ---
>>  sound/soc/soc-core.c | 17 +++++------------
>>  1 file changed, 5 insertions(+), 12 deletions(-)
>>
>> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
>> index e55170c..e83edbe 100644
>> --- a/sound/soc/soc-core.c
>> +++ b/sound/soc/soc-core.c
>> @@ -3751,7 +3751,7 @@ EXPORT_SYMBOL_GPL(snd_soc_of_parse_daifmt);
>> =20
>>  int snd_soc_get_dai_id(struct device_node *ep)
>>  {
>> -	struct snd_soc_component *pos;
>> +	struct snd_soc_component *component;
>>  	struct device_node *node;
>>  	int ret;
>> =20
>> @@ -3765,17 +3765,10 @@ int snd_soc_get_dai_id(struct device_node *ep)
>>  	 */
>>  	ret =3D -ENOTSUPP;
>>  	mutex_lock(&client_mutex);
>> -	for_each_component(pos) {
>> -		struct device_node *component_of_node =3D soc_component_to_node(pos);
>> -
>> -		if (component_of_node !=3D node)
>> -			continue;
>> -
>> -		if (pos->driver->of_xlate_dai_id)
>> -			ret =3D pos->driver->of_xlate_dai_id(pos, ep);
>> -
>> -		break;
>> -	}
>> +	component =3D soc_find_component(node, NULL);
>> +	if (component &&
>> +	    component->driver->of_xlate_dai_id)
>> +		ret =3D component->driver->of_xlate_dai_id(component, ep);
>>  	mutex_unlock(&client_mutex);
>> =20
>>  	of_node_put(node);
>>
>=20
> Hi,
>=20
> This patch causes crash on today's linux-next apparently because "CPU DAI=
" is not
> registered now, any ideas?

FWIW I am seeing the same crash/regression, however, the bisect is
pointing to commit b9f2e25c599bbbf0646957e07ebb72b942c286cc ("ASoC:
soc-core: use soc_find_component() at snd_soc_find_dai()") and reverting
this commit fixes the problem for me.

Dmitry, are you sure it is this commit? They do have a similar name.

Cheers
Jon

--=20
nvpublic

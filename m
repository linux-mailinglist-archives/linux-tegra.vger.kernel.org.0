Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 129F2565DB
	for <lists+linux-tegra@lfdr.de>; Wed, 26 Jun 2019 11:46:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725379AbfFZJqq (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 26 Jun 2019 05:46:46 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:4292 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726242AbfFZJqq (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 26 Jun 2019 05:46:46 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d133f070000>; Wed, 26 Jun 2019 02:46:47 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 26 Jun 2019 02:46:45 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 26 Jun 2019 02:46:45 -0700
Received: from [10.21.132.148] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 26 Jun
 2019 09:46:43 +0000
Subject: Re: [PATCH] ASoC: soc-core: don't use soc_find_component() at
 snd_soc_find_dai()
To:     Dmitry Osipenko <digetx@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Mark Brown <broonie@kernel.org>
CC:     Linux-ALSA <alsa-devel@alsa-project.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <878stpyvky.wl-kuninori.morimoto.gx@renesas.com>
 <8291b20f-8926-8089-0507-36b8b1025b35@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <c4587ef2-0cec-ddad-f3ae-2b271505569c@nvidia.com>
Date:   Wed, 26 Jun 2019 10:46:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <8291b20f-8926-8089-0507-36b8b1025b35@gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL103.nvidia.com (172.20.187.11) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1561542407; bh=kOuHvF4pFuFql+uak+NdzZIhDUvLPSYVA2iwgAPBa4A=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=nQeuJjRis+7fHfAF1qy2MQUg5yfCmmM4vi/ylcuFz7pFkuEeUOSgbG1s06ymueho7
         P1qsxtSlh61UDNrC5j9XxeVe+kef80Zyg/IdcMVQaXMa81KPOK565NM/WJKqYjej0i
         qlz5C4hheCceOwejJP4tz2s3nTxQNlf2BqY83ysAVw8OEkayKS9Mdo1Prn8EKxFXkQ
         tS8kFm703GyyL0PnLAZe11GcsNFvd2gyMP2YXMoRtWfvtLZsRSOoQDeTw2JcAYz/Gp
         6/xETyhb11+VT45b0H3FgpnNU2RgEdIP7WUUzhgmDoLeFCPa5SESSH6KdVa/UUxNL7
         +VgrzScgXR2YQ==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 26/06/2019 02:54, Dmitry Osipenko wrote:
> 26.06.2019 4:40, Kuninori Morimoto =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>>
>> commit b9f2e25c599bb ("ASoC: soc-core: use soc_find_component() at
>> snd_soc_find_dai()") used soc_find_component() at snd_soc_find_dai(),
>> but, some CPU driver has CPU component for DAI and Platform component,
>> for example generic DMAEngine component.
>> In such case, CPU component and Platform component have same
>> of_node / name.
>>
>> Here soc_find_component() returns *1st* found component.
>> Thus, we shouldn't use soc_find_component() at snd_soc_find_dai().
>> This patch fixup this it, and add comment to indicate this limitation.
>>
>> Fixes: commit b9f2e25c599bb ("ASoC: soc-core: use soc_find_component() a=
t snd_soc_find_dai()")
>> Reported-by: Dmitry Osipenko <digetx@gmail.com>
>> Reported-by: Jon Hunter <jonathanh@nvidia.com>
>> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>> ---
>>  sound/soc/soc-core.c | 13 +++++++++++--
>>  1 file changed, 11 insertions(+), 2 deletions(-)
>>
>> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
>> index 358f1fb..8ccaf63 100644
>> --- a/sound/soc/soc-core.c
>> +++ b/sound/soc/soc-core.c
>> @@ -786,6 +786,14 @@ static struct snd_soc_component *soc_find_component=
(
>> =20
>>  	lockdep_assert_held(&client_mutex);
>> =20
>> +	/*
>> +	 * NOTE
>> +	 *
>> +	 * It returns *1st* found component, but some driver
>> +	 * has few components by same of_node/name
>> +	 * ex)
>> +	 *	CPU component and generic DMAEngine component
>> +	 */
>>  	for_each_component(component)
>>  		if (snd_soc_is_matching_component(dlc, component))
>>  			return component;
>> @@ -813,8 +821,9 @@ struct snd_soc_dai *snd_soc_find_dai(
>>  	lockdep_assert_held(&client_mutex);
>> =20
>>  	/* Find CPU DAI from registered DAIs */
>> -	component =3D soc_find_component(dlc);
>> -	if (component) {
>> +	for_each_component(component) {
>> +		if (!snd_soc_is_matching_component(dlc, component))
>> +			continue;
>>  		for_each_component_dais(component, dai) {
>>  			if (dlc->dai_name && strcmp(dai->name, dlc->dai_name)
>>  			    && (!dai->driver->name
>>
>=20
> Thank you very much!
>=20
> Tested-by: Dmitry Osipenko <digetx@gmail.com>

Tested-by: Jon Hunter <jonathanh@nvidia.com>

Thanks!
Jon

--=20
nvpublic

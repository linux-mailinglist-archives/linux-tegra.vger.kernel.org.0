Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31C1855B77
	for <lists+linux-tegra@lfdr.de>; Wed, 26 Jun 2019 00:43:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726179AbfFYWnE (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 25 Jun 2019 18:43:04 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:36543 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725782AbfFYWnE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 25 Jun 2019 18:43:04 -0400
Received: by mail-lf1-f65.google.com with SMTP id q26so167768lfc.3
        for <linux-tegra@vger.kernel.org>; Tue, 25 Jun 2019 15:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Ogc1aznWWJW4qc/ayPmND9XlH+FKEUMjKTQB0hejDRk=;
        b=NvS/nY4iQy3U0gk55FJiIsuN/Xr1Ll6O63deLQePbfSZTc0ltnFqGRm6bxTskY06Pt
         9mALWYLEfiiWdi5xqW2mqReztLaDPUmkpC+t+EHFM1xUNIBU5ZjQfeeB43KikuQwUCqm
         GNNTpEM/bycydlfsfWXKKwB1uuRhmZklntmWEQjs3NWzRsfhaMeXlsl2d14ZIKhn8mWF
         vy0Bmo6Z68KM1AoIqXTs/bQH04uYmIEO4vQT3z/ZAgds/nUr4FEwPzEHn7xOUxPMFusw
         Nmz4m2D5pSQkTx+p+xAecRKJKjvkw1wc9p27j9ThfwZtfqZzv5xP6whGYFeXjL6T0Z+5
         +e5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ogc1aznWWJW4qc/ayPmND9XlH+FKEUMjKTQB0hejDRk=;
        b=bB2wVr39rWmDKRKTG8N6O2Tc5yWYYrgFSHyKz54BL4oObppFrsNe8jIya1zgcA7oYO
         Jhsm/a6Jj1KCh8WJgomJcU5+8ZT/p3UUTuPS/a9hdE7coXGZd9oKwGsVlLcJzWVO9ktT
         xgE1OSCMZaXvOFUcTXD2tSoIQYxTM+w2na7tTN5pf/xm33i1TqkI/9enG98P54Nm2VoE
         FRQsngPZAz9oq+rUspJ7rdU+AHLjcNYW05OK/i9j+qQWQtoeNFF54ahmF3d8JwPFjpsI
         5TmSfk91tMZI200pk9yocdAwf7p5DPVMLvYqh88VLJ35S/uGYFZ2rqQIfxjMBFt4OOWn
         slww==
X-Gm-Message-State: APjAAAVXvkf7zIKmzC+0hMSh5Fre9C7czJMvnoyqj0tJWbw422BRAPlc
        pVeBmG0wClnsc2BRYWCbRdid/JR6
X-Google-Smtp-Source: APXvYqytbOwn5GHpnmtD+S8cGjXXmmluhSybeleHIcpVYS4Vr/wemWSbJmHebmUybVjqhrey/0B1SQ==
X-Received: by 2002:ac2:5981:: with SMTP id w1mr660485lfn.48.1561502582379;
        Tue, 25 Jun 2019 15:43:02 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-79-162-197.pppoe.mtu-net.ru. [91.79.162.197])
        by smtp.googlemail.com with ESMTPSA id b25sm2119717lff.42.2019.06.25.15.43.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Jun 2019 15:43:01 -0700 (PDT)
Subject: Re: [PATCH 5/9] ASoC: soc-core: use soc_find_component() at
 snd_soc_get_dai_id()
To:     Jon Hunter <jonathanh@nvidia.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Mark Brown <broonie@kernel.org>
Cc:     Linux-ALSA <alsa-devel@alsa-project.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <87y33aaluu.wl-kuninori.morimoto.gx@renesas.com>
 <87r292alro.wl-kuninori.morimoto.gx@renesas.com>
 <cb3a6d0a-ca7b-d6b6-72db-5dff520acfc9@gmail.com>
 <374e71f7-b49c-ec79-f3ca-ae630a383521@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <cf87d0d0-8e73-adec-4097-83652dfedb7a@gmail.com>
Date:   Wed, 26 Jun 2019 01:43:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <374e71f7-b49c-ec79-f3ca-ae630a383521@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

26.06.2019 1:38, Jon Hunter пишет:
> 
> On 25/06/2019 21:47, Dmitry Osipenko wrote:
>> 13.05.2019 10:07, Kuninori Morimoto пишет:
>>> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>>>
>>> soc-core core already has soc_find_component() which find
>>> component from device node.
>>> Let's use existing function to find component.
>>>
>>> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>>> ---
>>>  sound/soc/soc-core.c | 17 +++++------------
>>>  1 file changed, 5 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
>>> index e55170c..e83edbe 100644
>>> --- a/sound/soc/soc-core.c
>>> +++ b/sound/soc/soc-core.c
>>> @@ -3751,7 +3751,7 @@ EXPORT_SYMBOL_GPL(snd_soc_of_parse_daifmt);
>>>  
>>>  int snd_soc_get_dai_id(struct device_node *ep)
>>>  {
>>> -	struct snd_soc_component *pos;
>>> +	struct snd_soc_component *component;
>>>  	struct device_node *node;
>>>  	int ret;
>>>  
>>> @@ -3765,17 +3765,10 @@ int snd_soc_get_dai_id(struct device_node *ep)
>>>  	 */
>>>  	ret = -ENOTSUPP;
>>>  	mutex_lock(&client_mutex);
>>> -	for_each_component(pos) {
>>> -		struct device_node *component_of_node = soc_component_to_node(pos);
>>> -
>>> -		if (component_of_node != node)
>>> -			continue;
>>> -
>>> -		if (pos->driver->of_xlate_dai_id)
>>> -			ret = pos->driver->of_xlate_dai_id(pos, ep);
>>> -
>>> -		break;
>>> -	}
>>> +	component = soc_find_component(node, NULL);
>>> +	if (component &&
>>> +	    component->driver->of_xlate_dai_id)
>>> +		ret = component->driver->of_xlate_dai_id(component, ep);
>>>  	mutex_unlock(&client_mutex);
>>>  
>>>  	of_node_put(node);
>>>
>>
>> Hi,
>>
>> This patch causes crash on today's linux-next apparently because "CPU DAI" is not
>> registered now, any ideas?
> 
> FWIW I am seeing the same crash/regression, however, the bisect is
> pointing to commit b9f2e25c599bbbf0646957e07ebb72b942c286cc ("ASoC:
> soc-core: use soc_find_component() at snd_soc_find_dai()") and reverting
> this commit fixes the problem for me.
> 
> Dmitry, are you sure it is this commit? They do have a similar name.

Indeed! I accidentally replied to a wrong email, thank you very much for the
clarification. And good to know that it's a global problem and not my local setup issue.

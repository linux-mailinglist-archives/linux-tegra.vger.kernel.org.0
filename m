Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91BA038E832
	for <lists+linux-tegra@lfdr.de>; Mon, 24 May 2021 16:00:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232462AbhEXOCE (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 24 May 2021 10:02:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232512AbhEXOCB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 24 May 2021 10:02:01 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02FEAC061574;
        Mon, 24 May 2021 07:00:30 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id v8so35829120lft.8;
        Mon, 24 May 2021 07:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wVc2l62cdFstgwVjKRszvWIRoE1c3Blnck06ieikPIg=;
        b=aD5eb/2JmDlsbuccsKLMFcqJcBu6hl+gIhyecjMjf9Wp4ohwSl3/zIHt/BqoebtTW1
         ZCP7l0erbz5YNCT+Lelmzp0gHLwIgy/F9ZVtH3IXRiE7y6fLKOlqTRFcE3Yy7RKN7VUH
         7ZNHRiA1qk3I1NT1XZt1/TEaGc7XEmzwmdfaJ7iCfmNdM6ntAycaat2InsoQkS8Aow94
         AI8WUqv97yy5x6me8Dl/Ir216EGhZ4Lz1BS5wb0czXoIA34hpl7kXcu5Sa5M+YaLRanA
         oUThSsZB/Sgjxm6bALDZT8RAXpA4q8caIAv9rY15Q1ziIcKGDBFudtYIeRIRFRMBkNzl
         TfrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wVc2l62cdFstgwVjKRszvWIRoE1c3Blnck06ieikPIg=;
        b=Xvr4oVUZhTUFHwlyJnR4/qRMdE+yS8/ZQ03ap40YnrwIppr1Y4Pn/aqFLgXdOBdlFv
         MoI4nR76FGP+N8FKerEUwMSbemTaeAq965NnF6oWPqlPjKuTBlRCTEokAQIK6kZGqulM
         beje8yS3kcIaMIeEMU/9h06l67NpLtTYpPZYrSUJygxajP+/NEKE3vtmgPdatIXSRck1
         +k6UyaV/wksCZAFzO65WhSyVwTAAKpFIiLry8wixf1WcZn3s4gtFaAdey+Z6RVwbXpon
         ADnmtUfBxfGh3ML9p6CUu4fR6VViOhuCV4sSDlUOmBxbtgAp1AGfVAAuVrMBnrSaWafs
         49RA==
X-Gm-Message-State: AOAM531fYhFu1Sj0woTiqJjp78lT72Fi0NIhuaPKsQN8zvbWXRyob59j
        TZoC6bOrUCcj1swlaxkOgp8jtinacRw=
X-Google-Smtp-Source: ABdhPJwe8HZoOudrB7of9u9ftFqXovADXZUIFQen5Of5GgAtTT+0iiU6KEC6tG/60fpMZlSmNNrLGg==
X-Received: by 2002:a05:6512:3684:: with SMTP id d4mr10581528lfs.90.1621864828233;
        Mon, 24 May 2021 07:00:28 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-110.dynamic.spd-mgts.ru. [109.252.193.110])
        by smtp.googlemail.com with ESMTPSA id s8sm1763804ljg.89.2021.05.24.07.00.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 May 2021 07:00:27 -0700 (PDT)
Subject: Re: [PATCH v3 4/4] ASoC: tegra: Specify components string for Nexus 7
To:     Jaroslav Kysela <perex@perex.cz>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Ion Agorria <ion@agorria.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210523234437.25077-1-digetx@gmail.com>
 <20210523234437.25077-5-digetx@gmail.com>
 <ec2098e0-7918-8488-cf7c-a07e5aa6908c@perex.cz>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <99ef3d77-c626-c632-bbd2-92eb15acad20@gmail.com>
Date:   Mon, 24 May 2021 17:00:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <ec2098e0-7918-8488-cf7c-a07e5aa6908c@perex.cz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

24.05.2021 13:54, Jaroslav Kysela пишет:
> Dne 24. 05. 21 v 1:44 Dmitry Osipenko napsal(a):
>> Specify components string for Nexus 7 using the Intel BayTrail components
>> format. This may allow us to create a more generic UCM for RT5640 codec.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  sound/soc/tegra/tegra_asoc_machine.c | 19 +++++++++++++++++++
>>  1 file changed, 19 insertions(+)
>>
>> diff --git a/sound/soc/tegra/tegra_asoc_machine.c b/sound/soc/tegra/tegra_asoc_machine.c
>> index a81f2ebfc00c..87e0a47040a5 100644
>> --- a/sound/soc/tegra/tegra_asoc_machine.c
>> +++ b/sound/soc/tegra/tegra_asoc_machine.c
>> @@ -671,6 +671,24 @@ static const struct tegra_asoc_data tegra_rt5640_data = {
>>  	.add_hp_jack = true,
>>  };
>>  
>> +/*
>> + * Speaker: Connected to SPO L/R P/N pins, stereo.
>> + * Internal Microphone: Digital, connected to DMIC1_DAT IN2P/N pins.
>> + * Headphones: Connected to HPOL/R pins.
>> + * Headset Microphone: Unconnected.
>> + *
>> + * IF2_DAC/ADC are unpopulated.
>> + */
>> +static const struct tegra_asoc_data tegra_rt5640_grouper_data = {
>> +	.components = "codec:rt5640 cfg-spk:2 cfg-mic:dmic1 aif:1",
> 
> Perhaps, it may be better to handle this string via the DT config (create new
> function like snd_soc_of_parse_card_name()).
> 
> The "codec:rt5640" should be set in the driver (it's fixed), but the
> "cfg-spk:2 cfg-mic:dmic1 aif:1" part is suitable for the DT config.

Not sure that this is possible. The DT is an ABI, while components
string has no specification. Any changes to the components string will
require DT update.

I think it's much more feasible to have a database of components within
kernel driver, like Intel sound driver does it for ACPI devices.

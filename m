Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CEC8144BB1
	for <lists+linux-tegra@lfdr.de>; Wed, 22 Jan 2020 07:23:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725877AbgAVGXf (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 22 Jan 2020 01:23:35 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:45749 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725836AbgAVGXf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 22 Jan 2020 01:23:35 -0500
Received: by mail-wr1-f66.google.com with SMTP id j42so5897291wrj.12;
        Tue, 21 Jan 2020 22:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Yjvd1axR1PqdZTIc08mAWLXgtWgaoB8nmRFDHlqUans=;
        b=K2/S4unhlBehk1R8CImxKUVzTj990lKFx5dXDMkTvyEXr4UKrzrzaJWtzTJK4oAVny
         /XjEoKXgkRFpLdunILsdbOB7Et62ma1dPT+77evlk85kGROQyYzEjeqITh0kcJjEOV84
         TG4vliwoXpPeJ/aCpyUQnyynCOmZqeBut0z67FnDACKkXPqwiOSFokDTHybWPToOwf1u
         1ldo2LER1/QRDhDA9m/r5mBKuXfQxg42gG8T73pVTPCsi/jyvbDgHjM6TqubwBJrtjOx
         YBUorN29LqnOwdjYjBoT9/WDOcZXAgwS0JAVzypCHaHt1osWC0F/yqUh4kC5Q8olNcJR
         oykQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Yjvd1axR1PqdZTIc08mAWLXgtWgaoB8nmRFDHlqUans=;
        b=QZaRALdW71FxIm009wZG5ElWG0hYDSFfdy7BXWZvbuFKVg9ulpYNsGvzMhr21P/ZeJ
         hrEQDnHWuaABwGlBhWvS0Al2UOa40OBQqPoKTY5Rd33fTyrloQrHoI2Ky27ifty7kXoI
         DHgAjfoWQT0Y5twSpuBx2Q9EzAwl23ohHKzCZa7Qt9eJGxc02peNzS9OsRSlLp9ekGXK
         gPtLNxTLrKZzGRyNEJucsH610Mt6OlcBXF+s5V1W3BOXCn8ZkgNLWmTowP/1QoD+U61F
         o98X5zgs9mRiTEmsmpBjX+D4P6f/ljbXClBCsJltuUodI94e1mb6qX45n4nt0f4S8ybm
         0mHg==
X-Gm-Message-State: APjAAAWSqmPiSVpcyECMRD9xflcH1CwMHfbDLKd/alvFg5gGAXvESgc4
        OJKDviRt1tt+yQO+4/rlS1A=
X-Google-Smtp-Source: APXvYqwCc0NSmc1uA3xXZfLgQ5hogHHHXFIsuV5k40DFrrvLSeqTJgiNuYig6ngVcci+7DDK6HQwzQ==
X-Received: by 2002:adf:e74f:: with SMTP id c15mr9019793wrn.274.1579674213025;
        Tue, 21 Jan 2020 22:23:33 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id f1sm56691885wrp.93.2020.01.21.22.23.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2020 22:23:31 -0800 (PST)
Subject: Re: [alsa-devel] [PATCH 4/9] ASoC: tegra: add Tegra210 based I2S
 driver
To:     Sameer Pujar <spujar@nvidia.com>, perex@perex.cz, tiwai@suse.com,
        robh+dt@kernel.org
Cc:     devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
        atalambedu@nvidia.com, linux-kernel@vger.kernel.org,
        lgirdwood@gmail.com, jonathanh@nvidia.com, viswanathl@nvidia.com,
        sharadg@nvidia.com, broonie@kernel.org, thierry.reding@gmail.com,
        linux-tegra@vger.kernel.org, rlokhande@nvidia.com,
        mkumard@nvidia.com, dramesh@nvidia.com
References: <1579530198-13431-1-git-send-email-spujar@nvidia.com>
 <1579530198-13431-5-git-send-email-spujar@nvidia.com>
 <a440d105-8db9-ecf1-3718-e58804ce14b8@gmail.com>
 <0c571858-d72c-97c2-2d6a-ead6fdde06eb@nvidia.com>
 <444731da-c4cd-8578-a732-c803eef31ef0@gmail.com>
 <bdc749bc-b62c-a041-c17c-33fd49fe8e2e@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <598fe377-5b95-d30a-eb64-89a645166d42@gmail.com>
Date:   Wed, 22 Jan 2020 09:23:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <bdc749bc-b62c-a041-c17c-33fd49fe8e2e@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

22.01.2020 07:32, Sameer Pujar пишет:
[snip]
>>>>> +static int tegra210_i2s_remove(struct platform_device *pdev)
>>>>> +{
>>>>> +     pm_runtime_disable(&pdev->dev);
>>>>> +     if (!pm_runtime_status_suspended(&pdev->dev))
>>>>> +             tegra210_i2s_runtime_suspend(&pdev->dev);
>>>> This breaks device's RPM refcounting if it was disabled in the active
>>>> state. This code should be removed. At most you could warn about the
>>>> unxpected RPM state here, but it shouldn't be necessary.
>>> I guess this was added for safety and explicit suspend keeps clock
>>> disabled.
>>> Not sure if ref-counting of the device matters when runtime PM is
>>> disabled and device is removed.
>>> I see few drivers using this way.
>> It should matter (if I'm not missing something) because RPM should be in
>> a wrecked state once you'll try to re-load the driver's module. Likely
>> that those few other drivers are wrong.
>>
>> [snip]
> 
> Once the driver is re-loaded and RPM is enabled, I don't think it would use
> the same 'dev' and the corresponding ref count. Doesn't it use the new
> counters?
> If RPM is not working for some reason, most likely it would be the case
> for other
> devices. What best driver can do is probably do a force suspend during
> removal if
> already not done. I would prefer to keep, since multiple drivers still
> have it,
> unless there is a real harm in doing so.

I took a closer look and looks like the counter actually should be
reset. Still I don't think that it's a good practice to make changes
underneath of RPM, it may strike back.

>>>>> +     int rx_fifo_th;
>>>> Could rx_fifo_th be negative?
>>> rx_fifo_th itself does not take negative values, explicit
>>> typecasting> is avoided in "if" condition by declaring this as "int"
>> Explicit typecasting isn't needed for integers.
> 
> What I meant was, rx_fifo_th is checked against a 'int' variable in an
> "if" condition.

What's the problem with comparing of unsigned with signed?

Besides, cif_conf.audio_ch > I2S_RX_FIFO_DEPTH can't be ever true, isn't
it? I2S_RX_FIFO_DEPTH=64, channels_max=16

Lastly, nothing stops you to make max_th unsigned.

Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5DA535DA0
	for <lists+linux-tegra@lfdr.de>; Wed,  5 Jun 2019 15:16:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727749AbfFENQt (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 5 Jun 2019 09:16:49 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:46715 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727601AbfFENQt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 5 Jun 2019 09:16:49 -0400
Received: by mail-lf1-f66.google.com with SMTP id l26so19028956lfh.13
        for <linux-tegra@vger.kernel.org>; Wed, 05 Jun 2019 06:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Brb5W/TO143InRjgNmGGc68EpuVd+tywV2Jd4zObouA=;
        b=V/6aC0GbTVA56jrDFrvzdu5+rLZtM1VPf9YLe/3x5rtOhGLfPASIoHeCSVcqtToA7a
         +BZpGidEpy6vp1Abj3ERLgNBwrRNC5VLXjck961tXxiojpRM0tosRDxaLMb9EsLjG7F3
         UNOonWqvThCb0Vo3FWz8FVYLOB6EIeo7wJCmRDt7cq9GF3KVOm5QVGbXWnF/vqC1a5Sf
         WyVFRVyZZZACWRzQ+hE7Rd1wM4+eCMISb8EqJSzZS4MZcLQ2PkUiPGCTxZk+z9PY4QBT
         au/TlgD3QcxAEiwvaEicLh7PI3icnY8W+qKFQyrnk7ACbalDycZKATrGULCfKpcVfyIz
         c9zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Brb5W/TO143InRjgNmGGc68EpuVd+tywV2Jd4zObouA=;
        b=jLs/i2lVfoMO8CEcRZitwtyV263RgEyEzY8T2uExp4K0EXZlVpTr8vcbV01xyhlTrh
         gXLu9lo1dbadVqH4mVtbqeexlQQqkQHAuHZ5lrtKE13tq1chzGE03R8pwD+yQgnAChtN
         aj42jVZagGTHzdVaPA4QD49p/yXM5IGoJiwVinRO/IibdyWzDMF4JF/VCt2S0vQtU6ip
         JLVpOxcnh8Oh6EbeuJ4346LZLueQ5Kp1CqhJkgFBYX69Rf/aAebOnhjbM+lu2pw9f7AH
         NV0fjONLrG2at6PF3ZLQOmcn/IH+Ysh0xPpD4LZo7WISHv7TZyxaC+EQ8IKOxt1Ku53X
         03eA==
X-Gm-Message-State: APjAAAWZ2J7WqmZP6ZOjzJvkVRqf0DLDbGf4rej/V+9QUm9z4QWTjMpr
        avmV8HPFM8piB+Rhgjct6gdYFU7S
X-Google-Smtp-Source: APXvYqyV8zM+0+ybvjktJlg52g4QnpTpupA3sXUVDUxFnNqvR7S/ynq0H9ygPSvcgLhFj+FlzL/rEQ==
X-Received: by 2002:a05:6512:24a:: with SMTP id b10mr17960650lfo.37.1559740605913;
        Wed, 05 Jun 2019 06:16:45 -0700 (PDT)
Received: from [192.168.2.145] ([94.29.35.141])
        by smtp.googlemail.com with ESMTPSA id a7sm4259199lji.13.2019.06.05.06.16.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Jun 2019 06:16:45 -0700 (PDT)
Subject: Re: [PATCH] gpu: host1x: Do not output error message for deferred
 probe
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20190604153150.22265-1-thierry.reding@gmail.com>
 <21c2443c-9166-edc0-5d7b-46b9e3c48e70@gmail.com>
 <20190605082848.GB10944@ulmo>
 <1654b4cb-930c-dbc7-b40d-1f854ff2ac69@gmail.com> <20190605123226.GA724@ulmo>
 <60f6e811-e4de-7bc6-fc9d-53a8bb8aff53@gmail.com> <20190605130441.GB1012@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <3bb637a1-50f7-2234-0dfe-f8d8bff8751c@gmail.com>
Date:   Wed, 5 Jun 2019 16:16:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190605130441.GB1012@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

05.06.2019 16:04, Thierry Reding пишет:
> On Wed, Jun 05, 2019 at 03:40:28PM +0300, Dmitry Osipenko wrote:
>> 05.06.2019 15:32, Thierry Reding пишет:
>>> On Wed, Jun 05, 2019 at 02:25:43PM +0300, Dmitry Osipenko wrote:
>>>> 05.06.2019 11:28, Thierry Reding пишет:
>>>>> On Tue, Jun 04, 2019 at 07:07:42PM +0300, Dmitry Osipenko wrote:
>>>>>> 04.06.2019 18:31, Thierry Reding пишет:
>>>>>>> From: Thierry Reding <treding@nvidia.com>
>>>>>>>
>>>>>>> When deferring probe, avoid logging a confusing error message. While at
>>>>>>> it, make the error message more informational.
>>>>>>>
>>>>>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>>>>>>> ---
>>>>>>>  drivers/gpu/host1x/dev.c | 5 ++++-
>>>>>>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
>>>>>>> index c55e2d634887..5a3f797240d4 100644
>>>>>>> --- a/drivers/gpu/host1x/dev.c
>>>>>>> +++ b/drivers/gpu/host1x/dev.c
>>>>>>> @@ -247,8 +247,11 @@ static int host1x_probe(struct platform_device *pdev)
>>>>>>>  
>>>>>>>  	host->clk = devm_clk_get(&pdev->dev, NULL);
>>>>>>>  	if (IS_ERR(host->clk)) {
>>>>>>> -		dev_err(&pdev->dev, "failed to get clock\n");
>>>>>>>  		err = PTR_ERR(host->clk);
>>>>>>> +
>>>>>>> +		if (err != -EPROBE_DEFER)
>>>>>>> +			dev_err(&pdev->dev, "failed to get clock: %d\n", err);
>>>>>>> +
>>>>>>>  		return err;
>>>>>>>  	}
>>>>>>
>>>>>> The clock driver should be available at the time of host1x's probing on
>>>>>> all Tegra's because it is one of essential core drivers that become
>>>>>> available early during boot.
>>>>>
>>>>> That's the currently baked-in assumption. However, there can be any
>>>>> number of reasons for why the clocks may not show up as early as
>>>>> expected, as evidenced in the case of Tegra186.
>>>>>
>>>>>> I guess you're making this change for T186, is it because the BPMP
>>>>>> driver's probe getting deferred? If yes, won't it be possible to fix the
>>>>>> defer of the clock driver instead of making such changes in the affected
>>>>>> drivers?
>>>>>
>>>>> The reason why this is now happening on Tegra186 is because the BPMP is
>>>>> bound to an IOMMU to avoid getting faults from the new no-bypass policy
>>>>> that the ARM SMMU driver is implementing as of v5.2-rc1.
>>>>>
>>>>> As a result of binding to an IOMMU, the first probe of the BPMP driver
>>>>> will get deferred, so any driver trying to request a clock after that
>>>>> and before BPMP gets probed successfully the next time, any clk_get()
>>>>> calls will fail with -EPROBE_DEFER.
>>>>>
>>>>> This is a bit unfortunate, but like I said, these kinds of things can
>>>>> happen, and probe deferral was designed specifically to deal with that
>>>>> kind of situation so that we wouldn't have to rely on all of these
>>>>> built-in assumptions that occasionally break.
>>>>>
>>>>> The driver also already handles deferred probe properly. The only thing
>>>>> that this patch really changes is to no longer consider -EPROBE_DEFER an
>>>>> error. It's in fact a pretty common situation in many drivers and should
>>>>> not warrant a kernel log message.
>>>>
>>>> You're trying to mask symptoms instead of curing the decease and it looks
>>>> like the decease could be cured.
>>>
>>> There's nothing here to cure. -EPROBE_DEFER was designed specifically to
>>> avoid having to play these kinds of games with initcall levels.
>>>
>>> What this patch tries to do is just to avoid printing an error message
>>> for something that is not an error. -EPROBE_DEFER is totally expected to
>>> happen, it's normal, it's not something that we should bother users with
>>> because things end up sorting themselves out in the end.
>>>
>>>> Won't something like this work for you?
>>>
>>> I'm sure we could find a number of ways to fix this. But there's no need
>>> to fix this because it's not broken. What is broken is that we output an
>>> error message when this happens and make an elephant out of a fly.
>>
>> Sure, this is absolutely not critical and deferred probe is doing its job.
>> But don't you agree that it's better to fix the root of the annoyance once
>> and for all?
> 
> From my point of view deferred probe is the once and for all fix. Back
> before we had deferred probe, doing these kinds of initcall reordering
> tricks was fairly common and while such a change may fix one setup, it
> often ended up breaking others.
> 
> Sorry, this is a lesson that we already learned a couple of years ago,
> no need to rehash it.

We had a success story in similar case of pinctrl vs GPIO driver probe
order, reordering the probe order fixed a lot of deferred probings and
improved boot up time a tad. Oh, that reminded me that the Stefan's
patch was never merged [0] :(

I'm trying to help, but seems not much I could do since you're in oppose ;)

[0] https://patchwork.ozlabs.org/patch/949776/

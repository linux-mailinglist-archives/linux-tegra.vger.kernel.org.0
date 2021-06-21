Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C858F3AF4F2
	for <lists+linux-tegra@lfdr.de>; Mon, 21 Jun 2021 20:22:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231370AbhFUSYa (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 21 Jun 2021 14:24:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232662AbhFUSYR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 21 Jun 2021 14:24:17 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4431C08ED7C
        for <linux-tegra@vger.kernel.org>; Mon, 21 Jun 2021 11:16:19 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id n35-20020a05600c3ba3b02901cdecb6bda8so41788wms.5
        for <linux-tegra@vger.kernel.org>; Mon, 21 Jun 2021 11:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Dd7yghOb0KNJkV2ROTjPZJ2i5uavd4KwAo4JP7s9Uh4=;
        b=w61EAA0A3s4UHdfZm6Cdy9t0YpMXsR6CAczSZck9nS7ZwFdyqzrWbMH21/DW3jImTr
         hoi6+c7c/NmoJfWGhND4aW3DMdswUPlIc7a47ztiTFcLye0OGJPz2oRjk4hlBlFJ3gB+
         CyaKGe6jOr9QpaiEbeG5LHSj0Qzyhm6rw7UX4VKrrj/C/hUkhwYJfyOXJDJNeySTAX2x
         aiNRLRID/oOSgqSm3An+3A10KsWQoKaP9YJYE6BoUD8lA5TuxNH7P84xPjoJDo4baeSG
         UrU33E4EIDPWSGpkg+tkei9Hto7DLO8lllcbmvRccFzi6DFfZ4q6quxVwFLEnsz3F964
         92SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Dd7yghOb0KNJkV2ROTjPZJ2i5uavd4KwAo4JP7s9Uh4=;
        b=TlQ3FeuxBoG3uRbLJPwGKyn9Mw5vRvMByailys5ZFNhTvFu7S3RPBDiOz1vw8/huGa
         sV4CT0rZ+JEZyTFMQ40PoaIxmKy8XJTSAH6jN3HMt+dub1LiK8uHW84pBreVF0vEpLTh
         yHZPpv9Uk4lgMiWZgLmuxMmbn6+Hl1kdulXGyDS/dOeDq3YXjo7h9kW7aVcQdFM1dAHm
         6SPd2uMJcPRoHztX2f+AXoUNz/csrctkyaED90Hq3EyGiCsvMeCbMQI0woLPQY6Z2nGD
         F4Fzy6yWu5X/NrMBg/9W2WhU3jOgsPooxmsSEZspa+WN/HITUnd/2rO1t/Lxp2wz2XcF
         u7hw==
X-Gm-Message-State: AOAM532b3rRuDyTk+YE0zMhsa2d3HJsDJHyGuQpsE6dqHoU4x1I2lJxw
        yPCa8rmbW7EWVmbYuwbqUdHtLzvkbnmqzrbw
X-Google-Smtp-Source: ABdhPJymWO6g7B4/Tw6wptEln54bwiSLpf+aSuu7iq6H5LmqimOmS9x6mO6ce2Y+yPGS6N1HWh4WDw==
X-Received: by 2002:a7b:cc84:: with SMTP id p4mr6083148wma.2.1624299378412;
        Mon, 21 Jun 2021 11:16:18 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:5ebd:8bd9:d549:4211? ([2a01:e34:ed2f:f020:5ebd:8bd9:d549:4211])
        by smtp.googlemail.com with ESMTPSA id k2sm18206405wrw.93.2021.06.21.11.16.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jun 2021 11:16:17 -0700 (PDT)
Subject: Re: [PATCH v4 0/6] Add driver for NVIDIA Tegra30 SoC Thermal sensor
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Amit Kucheria <amitk@kernel.org>,
        Andreas Westman Dorcsak <hedmoo@yahoo.com>,
        Maxim Schwalm <maxim.schwalm@gmail.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Ihor Didenko <tailormoon@rambler.ru>,
        Ion Agorria <ion@agorria.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20210616190417.32214-1-digetx@gmail.com>
 <e1e3816a-ddf4-be13-0410-0b929f3be60b@linaro.org>
 <cdc3d6fe-f2a8-d50c-af11-98ab4f72b713@gmail.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <1f938d62-aeac-325f-4735-80cccfd529c2@linaro.org>
Date:   Mon, 21 Jun 2021 20:16:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <cdc3d6fe-f2a8-d50c-af11-98ab4f72b713@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 21/06/2021 19:26, Dmitry Osipenko wrote:
> 21.06.2021 20:13, Daniel Lezcano пишет:
>>
>> Hi Dmitry,
>>
>> I compiled the your series and got these unresolved.
>>
>> arm-linux-gnueabi-ld: drivers/thermal/tegra/soctherm-fuse.o: in function
>> `tegra_calc_shared_calib':
>> soctherm-fuse.c:(.text+0x60): undefined reference to `tegra_fuse_readl'
>> arm-linux-gnueabi-ld: soctherm-fuse.c:(.text+0xf0): undefined reference
>> to `tegra_fuse_readl'
>> arm-linux-gnueabi-ld: drivers/thermal/tegra/soctherm-fuse.o: in function
>> `tegra_calc_tsensor_calib':
>> soctherm-fuse.c:(.text+0x144): undefined reference to `tegra_fuse_readl'
>> arm-linux-gnueabi-ld: drivers/thermal/tegra/tegra30-tsensor.o: in
>> function `tegra_tsensor_fuse_read_spare':
>> tegra30-tsensor.c:(.text+0x364): undefined reference to `tegra_fuse_readl'
>> arm-linux-gnueabi-ld: drivers/thermal/tegra/tegra30-tsensor.o: in
>> function `tegra_tsensor_probe':
>> tegra30-tsensor.c:(.text+0x874): undefined reference to `tegra_fuse_readl'
>> arm-linux-gnueabi-ld:
>> drivers/thermal/tegra/tegra30-tsensor.o:tegra30-tsensor.c:(.text+0x904):
>> more undefined references to `tegra_fuse_readl' follow
>> make[1]: *** [/home/dlezcano/Work/src/linux/Makefile:1196: vmlinux] Error 1
>> make: *** [/home/dlezcano/Work/src/linux/Makefile:215: __sub-make] Error 2
> 
> The missing stub was added by [1]. I guess you could take [2] for the
> base since Thierry already sent out PR for 5.14, or we could defer the
> "thermal/drivers/tegra: Correct compile-testing of drivers" patch till
> the next kernel version. Please choose whatever is easier for you.

I would like to prevent to have more patches floating around. As we are
close the to the merge window, I think we can live with the missing
stubs ATM. But in the future, provide an immutable branch with the
fixes, so we can share it and prevent these issues.

  -- Daniel



-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

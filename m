Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B782320A8C3
	for <lists+linux-tegra@lfdr.de>; Fri, 26 Jun 2020 01:24:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407788AbgFYXYc (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 25 Jun 2020 19:24:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406893AbgFYXYb (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 25 Jun 2020 19:24:31 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27999C08C5C1
        for <linux-tegra@vger.kernel.org>; Thu, 25 Jun 2020 16:24:31 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id x18so8411246lji.1
        for <linux-tegra@vger.kernel.org>; Thu, 25 Jun 2020 16:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KQBOQUALiqSKtvCGn8S3YcArtBy6E6PZbrpA69D4Zus=;
        b=WhnOBvJtKQNdrl8QfTTB/JHMXH0z6kTj+m1gGyVxG8e7VCGz59bMyJFbBFHnGBKtfE
         Uw5r3PyAp2xvfxdsekiiQO6dbS1qIhAhaNAFQePGN6FP/7VYcg+0g2AoUKnrKYJHTW/R
         LXbktqOKfVCiRDBer6Aj4xSh1AA9kElZTktwgcYZCSsjf4/eCUOXH4SnnMmsVhi/UrNJ
         qsNYBKJt/F/IxRzg6qIdhmxNO/kCTU20CxHxJUQZj2ZJojzKqe72csGAZ5OzkA+1yRQ6
         V+Ule+yt1dUk7RuCQhKeggS4dd/pV1M7xzn6ECUc0rjlmAaueVGcU7EUZUtiGVYd4cef
         sQjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KQBOQUALiqSKtvCGn8S3YcArtBy6E6PZbrpA69D4Zus=;
        b=p6rcyasCH0sEWFOVmsWBY4Kb/1Xu6CXmVIC5z7JP4Yho4T4qc6NykAudarZksgy1Dp
         spQP12HzsHjT2KvofA75dj10+tQufvmtgh4QXHjMfX993u9kTzr6qVt2bICEjPq0T8+X
         PKep/rQdmxWRsKYRt/c6vLX1Sh5DYR3X8Ac98Op4Zov86qPUybyQVBMHHcPMMQ9MQwId
         +8uSlUOwtj9idpFmUER1zFiqd/Eg6vkbHp2nCNqUX+pGlXRbqtgmpHlgaalCmFOpgmp7
         6fASZf31fxOKHOQlIhZNJ3Ee+UayjvWw9SiyNpdSTSxHAc6pFI3PkO+7W4gJBgDgOu+S
         BexA==
X-Gm-Message-State: AOAM533qY1B4diQZvvaTFN3byu3XUSQYmDW7r1tcW59r+CEqImpljPn3
        sQG1LmdjsmA9gojuJ547yyszALaqsJ0=
X-Google-Smtp-Source: ABdhPJy+3i2VMOH3bgCwGjRqvIDH1d2f1cMECaR79jG/6ShHgd8UIYoJvPhRhGMMviokg5nx3W+tJA==
X-Received: by 2002:a05:651c:54e:: with SMTP id q14mr23077ljp.279.1593127469638;
        Thu, 25 Jun 2020 16:24:29 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru. [79.139.237.54])
        by smtp.googlemail.com with ESMTPSA id t4sm6295754lfp.21.2020.06.25.16.24.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2020 16:24:27 -0700 (PDT)
Subject: Re: [RFC] Host1x/TegraDRM UAPI
To:     Mikko Perttunen <cyndis@kapsi.fi>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, sumit.semwal@linaro.org,
        gustavo@padovan.org
Cc:     "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>, talho@nvidia.com,
        bhuntsman@nvidia.com
References: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
 <c6642ebd-c9f1-eab0-ff6d-109698af73e0@gmail.com>
 <5c0aa939-d722-5034-6328-4df5be8ee3c6@kapsi.fi>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c96af3cb-a15c-dd3f-ac5b-b0a56d2ed6d9@gmail.com>
Date:   Fri, 26 Jun 2020 02:24:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <5c0aa939-d722-5034-6328-4df5be8ee3c6@kapsi.fi>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

25.06.2020 12:16, Mikko Perttunen пишет:
> On 6/25/20 2:11 AM, Dmitry Osipenko wrote:
>> 23.06.2020 15:09, Mikko Perttunen пишет:
>>> /* Command is an opcode gather from a GEM handle */
>>> #define DRM_TEGRA_SUBMIT_COMMAND_GATHER             0
>>> /* Command is an opcode gather from a user pointer */
>>> #define DRM_TEGRA_SUBMIT_COMMAND_GATHER_UPTR        1
>>
>> I'm a bit dubious about whether we really need to retain the non-UPTR
>> variant. The memory-copying overhead is negligible because cmdstream's
>> data usually is hot in CPU's cache
>>
>> IIRC, the most (if not all) of the modern DRM drivers drivers use the
>> usrptr-only for the cmdstream.
>>
>> At least there is no any real-world userspace example today that could
>> benefit from a non-UPTR variant.
>>
>> I'm suggesting to leave out the non-UPTR gather variant for now, keeping
>> it in mind as a potential future extension of the submission UAPI. Any
>> objections?
>>
> 
> Sure, we should be able to drop it. Downstream userspace is using it,
> but we should be able to fix that. I was thinking that we can directly
> map the user pages and point the gather to them without copying - that
> way we wouldn't need to make DMA allocations inside the driver for every
> submit.

We will need to create a Host1x DMA pool and then the dynamic
allocations will be cheap. This is an implementation detail that we can
discuss separately.

We will need the UPTR anyways for the older Tergas because we need to
validate the cmdstreams and it's much more efficient to copy from UPTR
than from the uncacheable memory.

The non-UPTR variant will be fine to add if you'll have a realworld
example that demonstrates a noticeable performance difference.

Previously, I thought that there will be some perf difference if GR3D
shaders are moved into the "insert-opcode" gather, but it was negligible
once I implemented it and it should be even more negligible on a modern
hardware.

> (On early Tegras we could just copy into the pushbuffer but that
> won't work for newer ones).

Yes, we should copy data into a gather and then push it into channel's
pushbuffer. Just like it works with the current upstream driver.

Once all the UAPI will be settled, we'll also need to discuss the
pushbuffer's implementation because the current driver has some problems
with it.

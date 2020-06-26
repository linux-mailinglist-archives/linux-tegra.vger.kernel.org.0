Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA31220AEB4
	for <lists+linux-tegra@lfdr.de>; Fri, 26 Jun 2020 11:05:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726062AbgFZJFP (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 26 Jun 2020 05:05:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725820AbgFZJFO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 26 Jun 2020 05:05:14 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44C3FC08C5C1
        for <linux-tegra@vger.kernel.org>; Fri, 26 Jun 2020 02:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=guEsgAmalX3M26sJZo+6FTNsUcEaVOB4IttcNk1SeyA=; b=Kc1zWBsOIhSS72lHVd92N/G7CA
        jOhpFEePZYyG0nI8Cqn8Fusa/SkrGj/VXkqLkb7HaFlE61BCV+Cdj7HSypl26uzMGycjxLMQBWAUb
        wsEUic0L0uq3N2aNr4V1+HEYJcm5G7I+0iZ5wHMgvStNL3etKibovLG/0tzRoptUe2eY4plq7oQAh
        FnUh+vCQACjHpcCq4eMe4tN0HZ/pKb+Dx5SLnOw1FhyzNc4k62eyCHJw+MRzmfkFgPnOm7yB1K7pX
        1/eUlDIfCaD4cwfsxh1ZhNmWX+xQbJl2rhGexLiZINlCg0ccxFM9T/5/UgLNzCt8F1Mqmj2HfNNAd
        s5Yeq3JA==;
Received: from dsl-hkibng22-54faab-65.dhcp.inet.fi ([84.250.171.65] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1jokIG-0006ni-W1; Fri, 26 Jun 2020 12:05:09 +0300
Subject: Re: [RFC] Host1x/TegraDRM UAPI
To:     Dmitry Osipenko <digetx@gmail.com>,
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
 <c96af3cb-a15c-dd3f-ac5b-b0a56d2ed6d9@gmail.com>
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <5e5fcd38-cc41-a3e8-6688-2b38d6476326@kapsi.fi>
Date:   Fri, 26 Jun 2020 12:05:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <c96af3cb-a15c-dd3f-ac5b-b0a56d2ed6d9@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.250.171.65
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 6/26/20 2:24 AM, Dmitry Osipenko wrote:
> 25.06.2020 12:16, Mikko Perttunen пишет:
>> On 6/25/20 2:11 AM, Dmitry Osipenko wrote:
>>> 23.06.2020 15:09, Mikko Perttunen пишет:
>>>> /* Command is an opcode gather from a GEM handle */
>>>> #define DRM_TEGRA_SUBMIT_COMMAND_GATHER             0
>>>> /* Command is an opcode gather from a user pointer */
>>>> #define DRM_TEGRA_SUBMIT_COMMAND_GATHER_UPTR        1
>>>
>>> I'm a bit dubious about whether we really need to retain the non-UPTR
>>> variant. The memory-copying overhead is negligible because cmdstream's
>>> data usually is hot in CPU's cache
>>>
>>> IIRC, the most (if not all) of the modern DRM drivers drivers use the
>>> usrptr-only for the cmdstream.
>>>
>>> At least there is no any real-world userspace example today that could
>>> benefit from a non-UPTR variant.
>>>
>>> I'm suggesting to leave out the non-UPTR gather variant for now, keeping
>>> it in mind as a potential future extension of the submission UAPI. Any
>>> objections?
>>>
>>
>> Sure, we should be able to drop it. Downstream userspace is using it,
>> but we should be able to fix that. I was thinking that we can directly
>> map the user pages and point the gather to them without copying - that
>> way we wouldn't need to make DMA allocations inside the driver for every
>> submit.
> 
> We will need to create a Host1x DMA pool and then the dynamic
> allocations will be cheap. This is an implementation detail that we can
> discuss separately.
> 
> We will need the UPTR anyways for the older Tergas because we need to
> validate the cmdstreams and it's much more efficient to copy from UPTR
> than from the uncacheable memory.
> 
> The non-UPTR variant will be fine to add if you'll have a realworld
> example that demonstrates a noticeable performance difference.
> 
> Previously, I thought that there will be some perf difference if GR3D
> shaders are moved into the "insert-opcode" gather, but it was negligible
> once I implemented it and it should be even more negligible on a modern
> hardware.
> 
>> (On early Tegras we could just copy into the pushbuffer but that
>> won't work for newer ones).
> 
> Yes, we should copy data into a gather and then push it into channel's
> pushbuffer. Just like it works with the current upstream driver.
> 
> Once all the UAPI will be settled, we'll also need to discuss the
> pushbuffer's implementation because the current driver has some problems
> with it.
> 

True, for earlier Tegras we'll need to copy anyway. So let's just 
implement copying for now, while making sure that extending to directly 
mapping pages will be possible later (don't know why it wouldn't be), 
and implement direct mapping or GEM gathers later if needed.

Mikko

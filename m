Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3735020B5F4
	for <lists+linux-tegra@lfdr.de>; Fri, 26 Jun 2020 18:35:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726984AbgFZQfP (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 26 Jun 2020 12:35:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726725AbgFZQfO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 26 Jun 2020 12:35:14 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30831C03E979
        for <linux-tegra@vger.kernel.org>; Fri, 26 Jun 2020 09:35:13 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id t25so6426044lji.12
        for <linux-tegra@vger.kernel.org>; Fri, 26 Jun 2020 09:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OIecv9YlyKV61n8hk7i7ZPRxzKbVL2qdV5qLEcx5Ibs=;
        b=sEQIS+UATeSUymSPBjRcyB/ZglHPNkPbbE1DUztVSbSRViCxFUV/QTINRmMq82ANhK
         QN2C7+TmIAUI0mlYVoPFyO9GuPG6WHmWXIuybL/CMqStTeA7A5lZA8cJTCkutbjfeN7z
         iXd6u4lUNrhnbw88SHgZ7Q4MkIY8ZX7/v2z9LwlPCGDD5BFf6jmT2v7e9lVuslPjj9ph
         CwEmg4oSSkO6bl+lPs8XxJpucbtX/Gn4NuUbtNtZtayodF8bNqhG6RfqhsNE2xjoKLLg
         Y8u+WfijgNuj6y0hjF8IFhAgA+ouP03rX4juB9J9eVO5bJO+rPQ7cYc/VEsXp6w2gyyP
         bRJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OIecv9YlyKV61n8hk7i7ZPRxzKbVL2qdV5qLEcx5Ibs=;
        b=QQFO7ZgJamr0U2SdnCy9r9v+TkI+7Z2rjy8ozfZNRoc7sS50l7b8ceQ7XEw3rUv150
         2CEmhJIApEW4luQX992NdxGHPBW19OvWJRMPrr45d901ZVSsCSpk5n2p2iKfn/D4eZEI
         j6XZOYiXktaHsx2574nNYqHBbqJcbMd5WQHRny90TVjIFY6+tYS/Rylq7DkOLHQ3GFwB
         SaVsGslUrCIXzmFR6m6xQsuslOmnS1B+dHnTWD7b0+pWbpTt81dCZGKl5xsMmNxi9qGD
         8Yl4/dVAwqNitQ9Lm4ixyXwe7YXSHJT7wUJhkYc2kbFWNjqn4xZHFtJDEa1eNxZFd/Oo
         0UcQ==
X-Gm-Message-State: AOAM530yONHEC3uq5O+ipnIISWiZYT71dIc6/sg4xnJQz7VRvCvqDCLc
        SXxEZQ6sFjO2EfiE7SS3XXQ=
X-Google-Smtp-Source: ABdhPJyYtQMjkQ4XkujoBtJWlC7dnZLM1F89L00QsoyIyilEGnEhqjxg2o2D/qHrMKn6Hgpz2YrFmw==
X-Received: by 2002:a2e:701a:: with SMTP id l26mr1980479ljc.88.1593189311420;
        Fri, 26 Jun 2020 09:35:11 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru. [79.139.237.54])
        by smtp.googlemail.com with ESMTPSA id z16sm2649375ljn.50.2020.06.26.09.35.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2020 09:35:10 -0700 (PDT)
Subject: Re: [RFC] Host1x/TegraDRM UAPI (drm_tegra_channel_map)
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Mikko Perttunen <cyndis@kapsi.fi>,
        Jon Hunter <jonathanh@nvidia.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, sumit.semwal@linaro.org,
        gustavo@padovan.org,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>, talho@nvidia.com,
        bhuntsman@nvidia.com
References: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
 <4f9ddf30-ad8d-3750-20d7-867be17a1006@gmail.com>
 <20200626073430.GA3109062@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <4c243f7a-4c53-d995-88a1-0fe03d41fc3a@gmail.com>
Date:   Fri, 26 Jun 2020 19:35:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200626073430.GA3109062@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

26.06.2020 10:34, Thierry Reding пишет:
> On Fri, Jun 26, 2020 at 01:47:46AM +0300, Dmitry Osipenko wrote:
>> 23.06.2020 15:09, Mikko Perttunen пишет:
>>> ### DRM_TEGRA_CHANNEL_MAP
>>>
>>> Make memory accessible by the engine while executing work on the channel.
>>>
>>> ```
>>> #define DRM_TEGRA_CHANNEL_MAP_READWRITE        (1<<0)
>>>
>>> struct drm_tegra_channel_map {
>>>         /*
>>>          * [in] ID of the channel for which to map memory to.
>>>          */
>>>         __u32 channel_id;
>>>         /*
>>>          * [in] GEM handle of the memory to map.
>>>          */
>>>         __u32 handle;
>>>
>>>         /*
>>>          * [in] Offset in GEM handle of the memory area to map.
>>>          *
>>>          * Must be aligned by 4K.
>>>          */
>>>         __u64 offset;
>>
>> Could you please give a use-case example for this partial mapping?
>>
>> I vaguely recalling that maybe it was me who suggested this in the past..
>>
>> I kinda see that this could be useful for a case where userspace
>> allocates a large chunk of memory and then performs sub-allocations in
>> the userspace driver. But do we have a real-world example for this right
>> now?
> 
> I think the main point about this IOCTL was to make mapping/unmapping
> more efficient and avoid relocations for situations where we know it is
> safe to do so.
> 
> The fact that this can be used to create partial mappings is mostly just
> an added bonus, in my opinion. Doing this doesn't create much complexity
> but in turn gives us a lot more flexibility.
> 
> A couple of places where I think this could be useful are OpenGL and
> Vulkan, both of which support buffer suballocation. This has a couple of
> advantages on modern GPUs where sometimes you want to use very large
> allocation granularity, etc.
> 
> Now, I don't think that we'll see much of that in Tegra DRM directly,
> although grate could certainly make use of this, I suspect. However, I
> think for interoperation of dGPU and Tegra DRM (with VIC for post-
> processing, or hopefully some of the other hardware acceleration
> engines at some point), this might come in handy.
> 
> There are other possible use-cases within just Tegra DRM as well. We may
> want to only partially map planar buffers for video post-processing, for
> example. Or map each plane separately.
> 
>> Please see more below.
>>
>>>         /*
>>>          * [in] Length of memory area to map in bytes.
>>>          *
>>>          * Must be aligned by 4K.
>>>          */
>>>         __u64 length;
>>>
>>>         /*
>>>          * [out] IOVA of mapped memory. Userspace can use this IOVA
>>>          *   directly to refer to the memory to skip using relocations.
>>>          *   Only available if hardware memory isolation is enabled.
>>>          *
>>>          *   Will be set to 0xffff_ffff_ffff_ffff if unavailable.
>>>          */
>>>         __u64 iova;
>>>
>>>         /*
>>>          * [out] ID corresponding to the mapped memory to be used for
>>>          *   relocations or unmapping.
>>>          */
>>>         __u32 mapping_id;
>>>         /*
>>>          * [in] Flags.
>>>          */
>>>         __u32 flags;
>>>
>>>         __u32 reserved[6];
>>> };
>>
>> It looks to me that we actually need a bit different thing here.
>>
>> This MAP IOCTL maps a portion of a GEM and then returns the mapping_id.
>> And I think we need something more flexible that will allow us to use
>> GEM handles for the relocation IDs, which should fit nicely with the
>> DMA-reservations.
>>
>> What about an IOCTL that wraps GEM into another GEM? We could wrap a
>> portion of GEM_A into a GEM_B, and then map the GEM_B using the MAP IOCTL.
>>
>> It could be something like this:
>>
>> ### DRM_TEGRA_BO_WRAP
>>
>> struct drm_tegra_wrap_bo {
>> 	__u32 bo_handle_wrapped; // out
>> 	__u32 bo_handle;         // in
>> 	__u64 offset;
>> 	__u64 length;
>> };
>>
>> ### DRM_TEGRA_CHANNEL_MAP
>>
>> struct drm_tegra_channel_map {
>>         __u32 channels_mask;
>> 	__u32 mapping_id;
>>         __u32 bo_handle;
>>         __u32 flags;
>>         __u64 iova;
>> };
>>
>> ===
>>
>> This allows multiple mapping_ids to have the same backing GEM, so the
>> mapping_id could be resolved into a BO during of job's submission for
>> the DMA-reservations handling.
> 
> That's pretty much what we have already above, isn't it? Just because we
> call the field "mapping_id" doesn't mean that in the background we can't
> create a GEM object and return it's handle as "mapping_id".
> 
> One advantage of Mikko's proposal is that we have a single IOCTL rather
> than two to create the mapping, making it a bit more lightweight.

Thinking a bit more about it, I now changed my mind.

There is no need to perform implicit fencing on each suballocation,
instead explicit fencing should be used for the suballocations.

So, we will need to add the relocation flags for the direction and
explicit (or implicit) fencing per-relocation. The direction will tell
how fence should be attached to the BO's DMA-reservation, while the
fence-flag will tell whether job's scheduler should wait for the BO's
reservation before executing job on hardware. This all will be needed
for a proper DRI implementation on older Tegras.

Actually, during of my experiments with the UAPI, I added both these
flags for the relocations [1], but really used only the direction flag
so far, relying on the implicit fencing.

[1]
https://github.com/grate-driver/linux/blob/master/include/uapi/drm/tegra_drm.h#L894

So, let's keep the current variant of this MAP IOCTL as-is.

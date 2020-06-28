Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0109E20CB01
	for <lists+linux-tegra@lfdr.de>; Mon, 29 Jun 2020 01:00:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726205AbgF1XAH (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 28 Jun 2020 19:00:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726138AbgF1XAG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 28 Jun 2020 19:00:06 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B23EC03E979
        for <linux-tegra@vger.kernel.org>; Sun, 28 Jun 2020 16:00:06 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id s1so16027858ljo.0
        for <linux-tegra@vger.kernel.org>; Sun, 28 Jun 2020 16:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6HDzXo+9/I82LcTCZv6SnPgIvt9Vfzi/nFxp6fx1uoc=;
        b=ivs8sdALpILIOOKZ4QJ3ou1Wey4gN/rm1DNWCi/ZwNAI1/Tlvff36MnB7yTwTcQS35
         Ki+iXyFY32CD1ViRV2GqoFavvzn85+M/lGYIBNIqWnxmDojUs1PxmOWM34T3Kzd7P2y9
         EKyJEqM6DP6LWZoXiM4O45svuvtLYtjPa/cGpWOmucRPlzm6bpXhwiYqDAhfvawvHVXa
         bACPJIvrVoFgeqKQ3ek2k8EP7RUOWEZp29U2zp6hQn9+ThfgTWPU/4Rgy4Rgt1d34Eqq
         UP5i2qFZmXsGhhbNwyxLwGvVlU2CKWaOx89RgHgpe3v9L6RzxrcfIN2aq0DHNRohjSL0
         UKNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6HDzXo+9/I82LcTCZv6SnPgIvt9Vfzi/nFxp6fx1uoc=;
        b=EALymM29K1Jg9hSvG5z60/syzcmFP+BlWTIq1v6cb14MQjOctdFWoRcN4Wn3uLiYLQ
         mcd+bG3EJfTa7gnHmt0Hrp68OgdMD/7+eTY62uoz8Va10Nigr1wJZzpU7ti6ZWXUTykQ
         FnEN97xDMSxRhmxm/G//XLM52ldqi5IbUUOsMyuoEmOi/IyD8LiDEfdvuxnmDTEtgug1
         vtx705OoxGQysByTYFkC3vt6J7LZqUeCjw6PjrDym7IcX40asKih+tclEmOicatq3qcP
         hIP2QWBDE+KISc70VZpmtlX5Ujq1aZDTb5Y4aew2yX81L3XbIKhToMROrXRI6RBgHd82
         cgAA==
X-Gm-Message-State: AOAM533jjmSTzr0iafrIoi1i9XGh+p5IUhSLHu7uZHC7vuy1/58xe6ka
        yTtsrra4T4LpQs33y9ac13c=
X-Google-Smtp-Source: ABdhPJzhQL16E6+c9IBs8yCBSeWDMiSUe51S9ol580wkiI2j40Rmiwof7v9/06R6JxiIBmiWJ9/a0g==
X-Received: by 2002:a05:651c:2da:: with SMTP id f26mr6269559ljo.377.1593385202444;
        Sun, 28 Jun 2020 16:00:02 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru. [79.139.237.54])
        by smtp.googlemail.com with ESMTPSA id o201sm8705615lff.8.2020.06.28.16.00.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2020 16:00:01 -0700 (PDT)
Subject: Re: [RFC] Host1x/TegraDRM UAPI (drm_tegra_channel_map)
To:     Mikko Perttunen <cyndis@kapsi.fi>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, sumit.semwal@linaro.org,
        gustavo@padovan.org,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>, talho@nvidia.com,
        bhuntsman@nvidia.com, Erik Faye-Lund <kusmabite@gmail.com>
References: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
 <4f9ddf30-ad8d-3750-20d7-867be17a1006@gmail.com>
 <20200626073430.GA3109062@ulmo>
 <4c243f7a-4c53-d995-88a1-0fe03d41fc3a@gmail.com>
 <f622c8ed-efe4-0889-bd26-dc22e96b8e4d@kapsi.fi>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <b8a8b05e-de1c-400f-3f35-bb1ea49789e9@gmail.com>
Date:   Mon, 29 Jun 2020 01:59:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <f622c8ed-efe4-0889-bd26-dc22e96b8e4d@kapsi.fi>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

28.06.2020 14:16, Mikko Perttunen пишет:
> On 6/26/20 7:35 PM, Dmitry Osipenko wrote:
>> 26.06.2020 10:34, Thierry Reding пишет:
>>> On Fri, Jun 26, 2020 at 01:47:46AM +0300, Dmitry Osipenko wrote:
>>>> 23.06.2020 15:09, Mikko Perttunen пишет:
>>>>> ### DRM_TEGRA_CHANNEL_MAP
>>>>>
>>>>> Make memory accessible by the engine while executing work on the
>>>>> channel.
>>>>>
>>>>> ```
>>>>> #define DRM_TEGRA_CHANNEL_MAP_READWRITE        (1<<0)
>>>>>
>>>>> struct drm_tegra_channel_map {
>>>>>          /*
>>>>>           * [in] ID of the channel for which to map memory to.
>>>>>           */
>>>>>          __u32 channel_id;
>>>>>          /*
>>>>>           * [in] GEM handle of the memory to map.
>>>>>           */
>>>>>          __u32 handle;
>>>>>
>>>>>          /*
>>>>>           * [in] Offset in GEM handle of the memory area to map.
>>>>>           *
>>>>>           * Must be aligned by 4K.
>>>>>           */
>>>>>          __u64 offset;
>>>>
>>>> Could you please give a use-case example for this partial mapping?
>>>>
>>>> I vaguely recalling that maybe it was me who suggested this in the
>>>> past..
>>>>
>>>> I kinda see that this could be useful for a case where userspace
>>>> allocates a large chunk of memory and then performs sub-allocations in
>>>> the userspace driver. But do we have a real-world example for this
>>>> right
>>>> now?
>>>
>>> I think the main point about this IOCTL was to make mapping/unmapping
>>> more efficient and avoid relocations for situations where we know it is
>>> safe to do so.
>>>
>>> The fact that this can be used to create partial mappings is mostly just
>>> an added bonus, in my opinion. Doing this doesn't create much complexity
>>> but in turn gives us a lot more flexibility.
>>>
>>> A couple of places where I think this could be useful are OpenGL and
>>> Vulkan, both of which support buffer suballocation. This has a couple of
>>> advantages on modern GPUs where sometimes you want to use very large
>>> allocation granularity, etc.
>>>
>>> Now, I don't think that we'll see much of that in Tegra DRM directly,
>>> although grate could certainly make use of this, I suspect. However, I
>>> think for interoperation of dGPU and Tegra DRM (with VIC for post-
>>> processing, or hopefully some of the other hardware acceleration
>>> engines at some point), this might come in handy.
>>>
>>> There are other possible use-cases within just Tegra DRM as well. We may
>>> want to only partially map planar buffers for video post-processing, for
>>> example. Or map each plane separately.
>>>
>>>> Please see more below.
>>>>
>>>>>          /*
>>>>>           * [in] Length of memory area to map in bytes.
>>>>>           *
>>>>>           * Must be aligned by 4K.
>>>>>           */
>>>>>          __u64 length;
>>>>>
>>>>>          /*
>>>>>           * [out] IOVA of mapped memory. Userspace can use this IOVA
>>>>>           *   directly to refer to the memory to skip using
>>>>> relocations.
>>>>>           *   Only available if hardware memory isolation is enabled.
>>>>>           *
>>>>>           *   Will be set to 0xffff_ffff_ffff_ffff if unavailable.
>>>>>           */
>>>>>          __u64 iova;
>>>>>
>>>>>          /*
>>>>>           * [out] ID corresponding to the mapped memory to be used for
>>>>>           *   relocations or unmapping.
>>>>>           */
>>>>>          __u32 mapping_id;
>>>>>          /*
>>>>>           * [in] Flags.
>>>>>           */
>>>>>          __u32 flags;
>>>>>
>>>>>          __u32 reserved[6];
>>>>> };
>>>>
>>>> It looks to me that we actually need a bit different thing here.
>>>>
>>>> This MAP IOCTL maps a portion of a GEM and then returns the mapping_id.
>>>> And I think we need something more flexible that will allow us to use
>>>> GEM handles for the relocation IDs, which should fit nicely with the
>>>> DMA-reservations.
>>>>
>>>> What about an IOCTL that wraps GEM into another GEM? We could wrap a
>>>> portion of GEM_A into a GEM_B, and then map the GEM_B using the MAP
>>>> IOCTL.
>>>>
>>>> It could be something like this:
>>>>
>>>> ### DRM_TEGRA_BO_WRAP
>>>>
>>>> struct drm_tegra_wrap_bo {
>>>>     __u32 bo_handle_wrapped; // out
>>>>     __u32 bo_handle;         // in
>>>>     __u64 offset;
>>>>     __u64 length;
>>>> };
>>>>
>>>> ### DRM_TEGRA_CHANNEL_MAP
>>>>
>>>> struct drm_tegra_channel_map {
>>>>          __u32 channels_mask;
>>>>     __u32 mapping_id;
>>>>          __u32 bo_handle;
>>>>          __u32 flags;
>>>>          __u64 iova;
>>>> };
>>>>
>>>> ===
>>>>
>>>> This allows multiple mapping_ids to have the same backing GEM, so the
>>>> mapping_id could be resolved into a BO during of job's submission for
>>>> the DMA-reservations handling.
>>>
>>> That's pretty much what we have already above, isn't it? Just because we
>>> call the field "mapping_id" doesn't mean that in the background we can't
>>> create a GEM object and return it's handle as "mapping_id".
>>>
>>> One advantage of Mikko's proposal is that we have a single IOCTL rather
>>> than two to create the mapping, making it a bit more lightweight.
>>
>> Thinking a bit more about it, I now changed my mind.
>>
>> There is no need to perform implicit fencing on each suballocation,
>> instead explicit fencing should be used for the suballocations.
>>
>> So, we will need to add the relocation flags for the direction and
>> explicit (or implicit) fencing per-relocation. The direction will tell
>> how fence should be attached to the BO's DMA-reservation, while the
>> fence-flag will tell whether job's scheduler should wait for the BO's
>> reservation before executing job on hardware. This all will be needed
>> for a proper DRI implementation on older Tegras.
>>
>> Actually, during of my experiments with the UAPI, I added both these
>> flags for the relocations [1], but really used only the direction flag
>> so far, relying on the implicit fencing.
>>
>> [1]
>> https://github.com/grate-driver/linux/blob/master/include/uapi/drm/tegra_drm.h#L894
>>
>>
>> So, let's keep the current variant of this MAP IOCTL as-is.
>>
> 
> Let me rephrase to make sure I understand:
> 
> For relocations, we should add flags for direction and fencing. This way
> at submit time we can do the proper fencing operations on the relocated
> BO's DMA reservation.

Correct

> This sounds good to me, and I think it makes the "relocation" concept a
> bit more general than it is currently. I think we could rename it to
> something like "buffer_usage" (open to bikeshedding), and it can have
> fence-related flags and relocation-related flags. For newer Tegra chips
> we don't necessarily need to relocate, but we still may need to handle
> DMA reservations, so in these cases only the fencing flags would be set.

Kernel driver already knows whether relocation needs to be patched since
it returns 0xffffffff by the MAP if patching is needed, and thus,
patching could be auto-skipped by the driver.

I don't think that a special flag is required for telling about whether
relocation needs to be done. The direction and fence flags should be
enough for now.

===

I'm curios what do you think about another variant:

In the grate-kernel I'm using a BO table which contains unique BO
entries for each job's relocation [1] and then IDs of this table and
target offsets are embedded into the cmdstream in-place of the memory
addresses [2]. This way, when cmdstream is fully firewalled, we're
reading the stream's data anyways, and thus, it's quite nice to embed
the BO table IDs and offsets into cmdstream itself [3].

In a result:

 - Each job's BO is resolved only once during submission.

 - BO table is kept small if cmdstream contains duplicated relocations.

[1]
https://github.com/grate-driver/linux/blob/master/include/uapi/drm/tegra_drm.h#L892

[2]
https://github.com/grate-driver/linux/blob/master/include/uapi/drm/tegra_drm.h#L783

[3]
https://github.com/grate-driver/linux/blob/master/drivers/gpu/drm/tegra/uapi/patching.c#L43

Of course this limits the number of BOs per-job. In a case of
grate-kernel it's max 64 BOs per-job + max 64MB for target offset. I
guess the BOs number could be lowered to 32 per-job, which should be a
bit more realistic, and then max target offset will be 128MB.

So, we could replace the BO table with a mapping table and have the
MAPPING_TABLE! :) And it doesn't matter whether cmdstream patched or
not, either way the MAPPING_TABLE will contain mapping ID + flags.

There are 3 possible variants of how job could be processed, depending
on hardware generation and driver security configuration:

  1. Job is fully-parsed and patched.
  2. Job is patched-only (with relocations).
  3. Job isn't parsed, nor patched.

My variant covers 1 and 3. I guess we could just ignore the case 2 for
now and fall back to 1, for simplicity. It shouldn't be a problem to add
support for the RELOCS_TABLE in addition to MAPPING_TABLE later on, if
will be really needed.

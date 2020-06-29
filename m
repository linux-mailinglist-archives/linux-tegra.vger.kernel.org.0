Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9AFF20CBD1
	for <lists+linux-tegra@lfdr.de>; Mon, 29 Jun 2020 04:37:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725998AbgF2ChE (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 28 Jun 2020 22:37:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725983AbgF2ChE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 28 Jun 2020 22:37:04 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AA84C03E979
        for <linux-tegra@vger.kernel.org>; Sun, 28 Jun 2020 19:37:04 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id s16so2757977lfp.12
        for <linux-tegra@vger.kernel.org>; Sun, 28 Jun 2020 19:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3aaNWUY+ic1MhEW2thjjs+7K3aLg4Qeu7hsc8YXMuHY=;
        b=EYhTXqxhSGpSxd6RsvJ0XBzYbUqniYRkDlPnUra6tJaAMs9vicknh6hx4Dt3ekuZNU
         W3J2kEMpj5s+T+SYnJ1swdZWuACib/Bi4Mmcp9/XZ6nKQ/crSZ7vTVVi62tZJ1a4i1vR
         96F0nwV9DhiqgGhLpfTNV11FOroHpVdlD38lM2Fc7Dk+tvO80hT/fl/PjRsALqaYQScF
         Mvx3l6D8N8AmJ3knKDxUI4sTQuRst3BzdHZo6g8yM7zrtrj6Cru7HBDGh4B6NTiywJO1
         pDVHRjJsCcKXcGGsUzkZDx5dZJj4hTIY5CAdJVNibraZVMuE9RWHJq+aB1I8p2S/1br+
         AdrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3aaNWUY+ic1MhEW2thjjs+7K3aLg4Qeu7hsc8YXMuHY=;
        b=Z8ACUrXCrRAO9qCCQSb5X2u0Wl976RB9TX15lrIjc3aPMatVGLsbvvRyPq5wHidhJr
         fH4Qo4xUpgDqrU15ms3e0OOXQzxhOxlFXPh5uu9lfQz61h4nWuZPK5i6YMXFG92lEsLZ
         9ACMxcJlSp+z27a+fe9qXa6vH0KIT3IXUXwz0LP0mQ3PpUbXgAc8+0E+ZbdXPhgYqJC/
         VPSUROFJJ/7Xmdn0zmWagzHURtbUyw5oBZfXyq4LXty0elefEF5l/SeJh+gnFpXceL61
         aS8yIHTdj4QCDIF6P5X7jN2PnU3NjlK49ZGKA8EY0ueoZpSNoFT23GB+XawFGR5WcF5W
         eiWA==
X-Gm-Message-State: AOAM533/G0nfOQQouvn91vpXZygbvziZjh9nYLWNJtHSxO/XtNGZn8G4
        K/vXV2SloGHnTZtf69xfPQA=
X-Google-Smtp-Source: ABdhPJx7RgPdiojDAT7wK85anJetC3VhwGm+QifqURfbXc5dwtyt2+HBsew6eBfwn8fVGlcOLGbdAw==
X-Received: by 2002:a05:6512:52a:: with SMTP id o10mr7957247lfc.137.1593398222191;
        Sun, 28 Jun 2020 19:37:02 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru. [79.139.237.54])
        by smtp.googlemail.com with ESMTPSA id m9sm6967483lfb.5.2020.06.28.19.37.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2020 19:37:01 -0700 (PDT)
Subject: Re: [RFC] Host1x/TegraDRM UAPI (sync points)
To:     Mikko Perttunen <cyndis@kapsi.fi>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, sumit.semwal@linaro.org,
        gustavo@padovan.org
Cc:     "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>, talho@nvidia.com,
        bhuntsman@nvidia.com, Erik Faye-Lund <kusmabite@gmail.com>
References: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
 <5b1edaad-ba36-7b0f-5b02-457ae5b6d91e@gmail.com>
 <62859775-514c-2941-75ed-6905e9282a6f@kapsi.fi>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <623c1eaa-31fb-8dff-f6c0-d8cd0be60070@gmail.com>
Date:   Mon, 29 Jun 2020 05:36:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <62859775-514c-2941-75ed-6905e9282a6f@kapsi.fi>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

28.06.2020 12:44, Mikko Perttunen пишет:
> On 6/28/20 2:27 AM, Dmitry Osipenko wrote:
>> 23.06.2020 15:09, Mikko Perttunen пишет:
>>>
>>> ### IOCTL HOST1X_ALLOCATE_SYNCPOINT (on /dev/host1x)
>>>
>>> Allocates a free syncpoint, returning a file descriptor representing it.
>>> Only the owner of the file descriptor is allowed to mutate the value of
>>> the syncpoint.
>>>
>>> ```
>>> struct host1x_ctrl_allocate_syncpoint {
>>>         /**
>>>          * @fd:
>>>          *
>>>          * [out] New file descriptor representing the allocated
>>> syncpoint.
>>>          */
>>>         __s32 fd;
>>>
>>>         __u32 reserved[3];
>>> };
>>
>> We should need at least these basic things from the sync points API >
>> - Execution context shouldn't be able to tamper sync points of the other
>> contexts.
> 
> This is covered by this UAPI - when submitting, as part of the
> syncpt_incr struct you pass the syncpoint FD. This way the driver can
> check the syncpoints used are correct, or program HW protection.
> 
>>
>> - Sync point could be shared with other contexts for explicit fencing.
> 
> Not sure what you specifically mean; you can get the ID out of the
> syncpoint fd and share the ID for read-only access. (Or the FD for
> read-write access)

I enumerated the overall points that UAPI should provide to us, just for
clarity. Not like you haven't covered any of them, sorry for the
confusion! :)

Please see more comments below!

>>
>> - Sync points should work reliably.
>>
>> Some problems of the current Host1x driver, like where it falls over if
>> sync point value is out-of-sync + all the hang-job recovery labor could
>> be easily reduced if sync point health is protected by extra UAPI
>> constraints. >
>> So I think we may want the following:
>>
>> 1. We still should need to assign sync point ID to a DRM-channel's
>> context. This sync point ID will be used for a commands stream forming,
>> like it is done by the current staging UAPI.
>>
>> So we should need to retain the DRM_TEGRA_GET_SYNCPT IOCTL, but
>> improve it.

My point here is that the UAPI shouldn't be able to increment the job's
sync point using SYNCPOINT_INCREMENT IOCTL, which is another UAPI
constraint.

I'm suggesting that we should have two methods of sync point allocations:

1) Sync point that could be used only by a submitted job.

2) Sync point that could be incremented by CPU.

The first method will allocate a raw sync point ID that is assigned to
the channel's context. This ID will be used for the job's completion
tracking. Perhaps this method also could optionally return a sync point
FD if you'd want to wait on this sync point by another job.

We don't need a dedicated sync point FD for all kinds of jobs, don't we?
For example, I don't see why a sync point FD may be needed in a case of
Opentegra jobs.

>> 2. Allocated sync point must have a clean hardware state.
> 
> What do you mean by clean hardware state?

I mean that sync point should have a predictable state [1], it shouldn't
accidentally fire during of hardware programming for example.

[1]
https://github.com/grate-driver/linux/blob/master/drivers/gpu/host1x/soc/syncpoints.c#L132

For a submitted job, the job's sync point state could be reset at a
submission time, for example like I did it in the grate-kernel's
experimental driver [2].

[2]
https://github.com/grate-driver/linux/blob/master/drivers/gpu/host1x/soc/channel.c#L145

>>
>> 3. Sync points should be properly refcounted. Job's sync points
>> shouldn't be re-used while job is alive.
>>
>> 4. The job's sync point can't be re-used after job's submission (UAPI
>> constraint!). Userspace must free sync point and allocate a new one for
>> the next job submission. And now we:
>>
>>    - Know that job's sync point is always in a healthy state!
>>
>>    - We're not limited by a number of physically available hardware sync
>> points! Allocation should block until free sync point is available.
>>
>>    - The logical number of job's sync point increments matches the SP
>> hardware state! Which is handy for a job's debugging.
>>
>> Optionally, the job's sync point could be auto-removed from the DRM's
>> context after job's submission, avoiding a need for an extra SYNCPT_PUT
>> IOCTL invocation to be done by userspace after the job's submission.
>> Could be a job's flag.
> 
> I think this would cause problems where after a job completes but before
> the fence has been waited, the syncpoint is already recycled (especially
> if the syncpoint is reset into some clean state).

Exactly, good point! The dma-fence shouldn't be hardwired to the sync
point in order to avoid this situation :)

Please take a look at the fence implementation that I made for the
grate-driver [3]. The host1x-fence is a dma-fence [4] that is attached
to a sync point by host1x_fence_create(). Once job is completed, the
host1x-fence is detached from the sync point [5][6] and sync point could
be recycled safely!

[3]
https://github.com/grate-driver/linux/blob/master/drivers/gpu/host1x/fence.c

[4]
https://github.com/grate-driver/linux/blob/master/include/linux/host1x.h#L450

[5]
https://github.com/grate-driver/linux/blob/master/drivers/gpu/host1x/soc/syncpoints_hw.c#L50

[6]
https://github.com/grate-driver/linux/blob/master/drivers/gpu/drm/tegra/uapi/scheduler.c#L133

Please try to take a closer look at the grate-driver's implementation if
you haven't yet. I think we should be able to reuse or improve some of
the ideas. That implementation isn't 100% complete, it doesn't cover
things like CPU-incremented or exported sync points for example, but
basics are there.

> I would prefer having a syncpoint for each userspace channel context
> (several of which could share a hardware channel if MLOCKing is not used).
> 
> In my experience it's then not difficult to pinpoint which job has
> failed, and if each userspace channel context uses a separate syncpoint,
> a hanging job wouldn't mess with other application's jobs, either.

I agree that there shouldn't be any problems with finding what job is
hanged. The timed out job is always the hanged job, no? :)

Also, please take a look at the DRM scheduler. Once I started to wire up
the DRM scheduler support in the grate-driver, I realized that there is
no real need to try to recover sync point's counter and etc, like the
current upstream host1x driver does for a hanged job. When job is
hanged, the whole channel should be turned down and reset, the job's
sync point state reset, client's HW engine reset, all the pre-queued
jobs re-submitted. And the generic DRM job scheduler helps us with that!
It also has other neat features which I haven't tried yet, like job
priorities for example.

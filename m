Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A469320E1CF
	for <lists+linux-tegra@lfdr.de>; Mon, 29 Jun 2020 23:59:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388345AbgF2U7s (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 29 Jun 2020 16:59:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731238AbgF2TNA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 29 Jun 2020 15:13:00 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2066BC008614
        for <linux-tegra@vger.kernel.org>; Mon, 29 Jun 2020 03:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=GeTt71jPkyvE8n3UDcsM5uwwI7c65TZU/3u6ogadEZk=; b=JaHu7ySB2PKfzB2ahPj6hSFoCf
        6awpzmI+uDRxEHaguWVNIZe7/nixBg7mTRyRO/yRLUnk570WTedUxRwBvkajjkklHHrZj4thUl9Br
        JJubgvikETQ3+UEZniZAivjtV1bvOuPw2aKG3ZwPVPEheZN3CwlPkpOb0bIsCd9Svaj9Q+ApLNZ13
        t7x4fquGIdZnawAw2GOy0JTqTJRMOhUBDO6jmuu6wukCE3J2CZ27/vxNenetLr3S9Ug/6fBodJwVf
        g1y/pvQuaHCaUm/MI5stGYDufkUf2xUYZpgU7Fa6flcT+AzQ0zMT3fv94n2LFfYrhUMagTKeaFO00
        2kNmxq2Q==;
Received: from dsl-hkibng22-54faab-65.dhcp.inet.fi ([84.250.171.65] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1jpr0m-0001BY-TD; Mon, 29 Jun 2020 13:27:41 +0300
Subject: Re: [RFC] Host1x/TegraDRM UAPI (sync points)
To:     Dmitry Osipenko <digetx@gmail.com>,
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
 <623c1eaa-31fb-8dff-f6c0-d8cd0be60070@gmail.com>
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <827c92a6-7fed-a81c-ba8e-6c69416c4ab9@kapsi.fi>
Date:   Mon, 29 Jun 2020 13:27:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <623c1eaa-31fb-8dff-f6c0-d8cd0be60070@gmail.com>
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

On 6/29/20 5:36 AM, Dmitry Osipenko wrote:
> 28.06.2020 12:44, Mikko Perttunen пишет:
>> On 6/28/20 2:27 AM, Dmitry Osipenko wrote:
>>> 23.06.2020 15:09, Mikko Perttunen пишет:
>>>>
>>>> ### IOCTL HOST1X_ALLOCATE_SYNCPOINT (on /dev/host1x)
>>>>
>>>> Allocates a free syncpoint, returning a file descriptor representing it.
>>>> Only the owner of the file descriptor is allowed to mutate the value of
>>>> the syncpoint.
>>>>
>>>> ```
>>>> struct host1x_ctrl_allocate_syncpoint {
>>>>          /**
>>>>           * @fd:
>>>>           *
>>>>           * [out] New file descriptor representing the allocated
>>>> syncpoint.
>>>>           */
>>>>          __s32 fd;
>>>>
>>>>          __u32 reserved[3];
>>>> };
>>>
>>> We should need at least these basic things from the sync points API >
>>> - Execution context shouldn't be able to tamper sync points of the other
>>> contexts.
>>
>> This is covered by this UAPI - when submitting, as part of the
>> syncpt_incr struct you pass the syncpoint FD. This way the driver can
>> check the syncpoints used are correct, or program HW protection.
>>
>>>
>>> - Sync point could be shared with other contexts for explicit fencing.
>>
>> Not sure what you specifically mean; you can get the ID out of the
>> syncpoint fd and share the ID for read-only access. (Or the FD for
>> read-write access)
> 
> I enumerated the overall points that UAPI should provide to us, just for
> clarity. Not like you haven't covered any of them, sorry for the
> confusion! :)
> 
> Please see more comments below!

Ok, good :)

> 
>>>
>>> - Sync points should work reliably.
>>>
>>> Some problems of the current Host1x driver, like where it falls over if
>>> sync point value is out-of-sync + all the hang-job recovery labor could
>>> be easily reduced if sync point health is protected by extra UAPI
>>> constraints. >
>>> So I think we may want the following:
>>>
>>> 1. We still should need to assign sync point ID to a DRM-channel's
>>> context. This sync point ID will be used for a commands stream forming,
>>> like it is done by the current staging UAPI.
>>>
>>> So we should need to retain the DRM_TEGRA_GET_SYNCPT IOCTL, but
>>> improve it.
> 
> My point here is that the UAPI shouldn't be able to increment the job's
> sync point using SYNCPOINT_INCREMENT IOCTL, which is another UAPI
> constraint.
> 
> I'm suggesting that we should have two methods of sync point allocations:
> 
> 1) Sync point that could be used only by a submitted job.
> 
> 2) Sync point that could be incremented by CPU.
> 
> The first method will allocate a raw sync point ID that is assigned to
> the channel's context. This ID will be used for the job's completion
> tracking. Perhaps this method also could optionally return a sync point
> FD if you'd want to wait on this sync point by another job.
> 
> We don't need a dedicated sync point FD for all kinds of jobs, don't we?
> For example, I don't see why a sync point FD may be needed in a case of
> Opentegra jobs.

I think it's cleaner if we have just one way to allocate syncpoints, and 
then those syncpoints can be passed to different things depending on the 
situation.

If we want to protect direct incrementing while a job is submitted, we 
could have a locking API where an ongoing job can take a lock refcount 
in the syncpoint, and incrementing would return -EBUSY.

> 
>>> 2. Allocated sync point must have a clean hardware state.
>>
>> What do you mean by clean hardware state?
> 
> I mean that sync point should have a predictable state [1], it shouldn't
> accidentally fire during of hardware programming for example.
> 
> [1]
> https://github.com/grate-driver/linux/blob/master/drivers/gpu/host1x/soc/syncpoints.c#L132
> 
> For a submitted job, the job's sync point state could be reset at a
> submission time, for example like I did it in the grate-kernel's
> experimental driver [2].
> 
> [2]
> https://github.com/grate-driver/linux/blob/master/drivers/gpu/host1x/soc/channel.c#L145
> 
>>>
>>> 3. Sync points should be properly refcounted. Job's sync points
>>> shouldn't be re-used while job is alive.
>>>
>>> 4. The job's sync point can't be re-used after job's submission (UAPI
>>> constraint!). Userspace must free sync point and allocate a new one for
>>> the next job submission. And now we:
>>>
>>>     - Know that job's sync point is always in a healthy state!
>>>
>>>     - We're not limited by a number of physically available hardware sync
>>> points! Allocation should block until free sync point is available.
>>>
>>>     - The logical number of job's sync point increments matches the SP
>>> hardware state! Which is handy for a job's debugging.
>>>
>>> Optionally, the job's sync point could be auto-removed from the DRM's
>>> context after job's submission, avoiding a need for an extra SYNCPT_PUT
>>> IOCTL invocation to be done by userspace after the job's submission.
>>> Could be a job's flag.
>>
>> I think this would cause problems where after a job completes but before
>> the fence has been waited, the syncpoint is already recycled (especially
>> if the syncpoint is reset into some clean state).
> 
> Exactly, good point! The dma-fence shouldn't be hardwired to the sync
> point in order to avoid this situation :)
> 
> Please take a look at the fence implementation that I made for the
> grate-driver [3]. The host1x-fence is a dma-fence [4] that is attached
> to a sync point by host1x_fence_create(). Once job is completed, the
> host1x-fence is detached from the sync point [5][6] and sync point could
> be recycled safely!

What if the fence has been programmed as a prefence to another channel 
(that is getting delayed), or to the GPU, or some other accelerator like 
DLA, or maybe some other VM? Those don't know the dma_fence has been 
signaled, they can only rely on the syncpoint ID/threshold pair.

> 
> [3]
> https://github.com/grate-driver/linux/blob/master/drivers/gpu/host1x/fence.c
> 
> [4]
> https://github.com/grate-driver/linux/blob/master/include/linux/host1x.h#L450
> 
> [5]
> https://github.com/grate-driver/linux/blob/master/drivers/gpu/host1x/soc/syncpoints_hw.c#L50
> 
> [6]
> https://github.com/grate-driver/linux/blob/master/drivers/gpu/drm/tegra/uapi/scheduler.c#L133
> 
> Please try to take a closer look at the grate-driver's implementation if
> you haven't yet. I think we should be able to reuse or improve some of
> the ideas. That implementation isn't 100% complete, it doesn't cover
> things like CPU-incremented or exported sync points for example, but
> basics are there.

Sure, I'll take a look.

> 
>> I would prefer having a syncpoint for each userspace channel context
>> (several of which could share a hardware channel if MLOCKing is not used).
>>
>> In my experience it's then not difficult to pinpoint which job has
>> failed, and if each userspace channel context uses a separate syncpoint,
>> a hanging job wouldn't mess with other application's jobs, either.
> 
> I agree that there shouldn't be any problems with finding what job is
> hanged. The timed out job is always the hanged job, no? :)
> 
> Also, please take a look at the DRM scheduler. Once I started to wire up
> the DRM scheduler support in the grate-driver, I realized that there is
> no real need to try to recover sync point's counter and etc, like the
> current upstream host1x driver does for a hanged job. When job is
> hanged, the whole channel should be turned down and reset, the job's
> sync point state reset, client's HW engine reset, all the pre-queued
> jobs re-submitted. And the generic DRM job scheduler helps us with that!
> It also has other neat features which I haven't tried yet, like job
> priorities for example.
> 

Thanks, I'll take a look at this as well.

Mikko

Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 690BF20D8EE
	for <lists+linux-tegra@lfdr.de>; Mon, 29 Jun 2020 22:10:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387450AbgF2Tmx (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 29 Jun 2020 15:42:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388014AbgF2Tmt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 29 Jun 2020 15:42:49 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78AC6C061755
        for <linux-tegra@vger.kernel.org>; Mon, 29 Jun 2020 12:42:49 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id h19so19562103ljg.13
        for <linux-tegra@vger.kernel.org>; Mon, 29 Jun 2020 12:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=JwU5FAidBhh7oWU6Uy7kMSsgdAXDeeK9feLjdd/Qaf0=;
        b=fwmO3R82y/VwNHM6Xf4kIhyv5VlwZzLnZvKbyEEk7Xbfj8+uyEKgYJVIrLmrF/O51o
         Ve82L9fKHd9HMW2Yd0Ppc2NkY9U8EGtULeWT9mzC/r/kluxUNzOT4h0wxHn7F2xkJrlH
         uz1nl/NaQN8mb5lGGEmmv9bKksBSwGlm6h8Gu9cpJ0wls5eC8peHXhnK0znj+iQk23jK
         zfGxOl0EyRWSPLdd5cuD/ybnk5qcPTA4pUYi1/tsMZCq1/phfNvkvmfpFnFgpQH47DJE
         dcxmX3PkLMjZ1xDIYgfDdvCmiJAB/v6vti9Ic0r0BxF+f0rVdBrrkk1O88PAwtIfpfvP
         FnNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JwU5FAidBhh7oWU6Uy7kMSsgdAXDeeK9feLjdd/Qaf0=;
        b=dJ50xdPkroJukZ/ZjsN25/ltuUwtLoqwh0GZ2jUVj+or9tskyyiMuwQD5ecHsq9N7H
         0s5vJlU2SWnFKjXFdrxLHjqDihrlCOp9nbhATcthaMlgmDssssVjJVeSPtziJNQooe2N
         QYjntrioOKi+9pDi6iICJ9k3yidrraVf68mlrqtga6MMJINgJc1o7GFoxmZRLCshdAiB
         AkJIZFDPxTcTdvDmmE18/RHHDP3XaEhBopctGZaMPPAn2RKcVCfvrptsSMfk/SzJJUZy
         Hq+DKoiZRV4BOTMCOMek7wfCfGZVodyoaMvGsQF14+TllvrPY5marp13oTYBw1B/pjV3
         UFEQ==
X-Gm-Message-State: AOAM5317IOrxS+FV4Ka5t71g4PzLbWU2osaqRyKSZOvWU2fzrOl63RD3
        KDxWSAgbMqYaqnbl5cc31V8=
X-Google-Smtp-Source: ABdhPJzuj8qxkBynZYUQiQa5xWwpxasOwB9Z1EakkpTWInuTuxOwvcLLbbHwYwieH0IJs1dBvDjlpA==
X-Received: by 2002:a2e:580f:: with SMTP id m15mr8345152ljb.357.1593459767830;
        Mon, 29 Jun 2020 12:42:47 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru. [79.139.237.54])
        by smtp.googlemail.com with ESMTPSA id q1sm156339lji.71.2020.06.29.12.42.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2020 12:42:47 -0700 (PDT)
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
 <623c1eaa-31fb-8dff-f6c0-d8cd0be60070@gmail.com>
 <827c92a6-7fed-a81c-ba8e-6c69416c4ab9@kapsi.fi>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <f1a88006-ab3e-9068-e220-15eee17aeba0@gmail.com>
Date:   Mon, 29 Jun 2020 22:42:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <827c92a6-7fed-a81c-ba8e-6c69416c4ab9@kapsi.fi>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

29.06.2020 13:27, Mikko Perttunen пишет:
...
>>>> 4. The job's sync point can't be re-used after job's submission (UAPI
>>>> constraint!). Userspace must free sync point and allocate a new one for
>>>> the next job submission. And now we:
>>>>
>>>>     - Know that job's sync point is always in a healthy state!
>>>>
>>>>     - We're not limited by a number of physically available hardware
>>>> sync
>>>> points! Allocation should block until free sync point is available.
>>>>
>>>>     - The logical number of job's sync point increments matches the SP
>>>> hardware state! Which is handy for a job's debugging.
>>>>
>>>> Optionally, the job's sync point could be auto-removed from the DRM's
>>>> context after job's submission, avoiding a need for an extra SYNCPT_PUT
>>>> IOCTL invocation to be done by userspace after the job's submission.
>>>> Could be a job's flag.
>>>
>>> I think this would cause problems where after a job completes but before
>>> the fence has been waited, the syncpoint is already recycled (especially
>>> if the syncpoint is reset into some clean state).
>>
>> Exactly, good point! The dma-fence shouldn't be hardwired to the sync
>> point in order to avoid this situation :)
>>
>> Please take a look at the fence implementation that I made for the
>> grate-driver [3]. The host1x-fence is a dma-fence [4] that is attached
>> to a sync point by host1x_fence_create(). Once job is completed, the
>> host1x-fence is detached from the sync point [5][6] and sync point could
>> be recycled safely!
> 
> What if the fence has been programmed as a prefence to another channel
> (that is getting delayed), or to the GPU, or some other accelerator like
> DLA, or maybe some other VM? Those don't know the dma_fence has been
> signaled, they can only rely on the syncpoint ID/threshold pair.

The explicit job's fence is always just a dma-fence, it's not tied to a
host1x-fence and it should be waited for a signal on CPU.

If you want to make job to wait for a sync point on hardware, then you
should use the drm_tegra_submit_command wait-command.

Again, please notice that DRM scheduler supports the job-submitted
fence! This dma-fence will signal once job is pushed to hardware for
execution, so it shouldn't be a problem to maintain jobs order for a
complex jobs without much hassle. We'll need to write some userspace to
check how it works in practice :) For now I really had experience with a
simple jobs only.

Secondly, I suppose neither GPU, nor DLA could wait on a host1x sync
point, correct? Or are they integrated with Host1x HW?

Anyways, it shouldn't be difficult to resolve dma-fence into
host1x-fence, get SP ID and maintain the SP's liveness. Please see more
below.

In the grate-driver I made all sync points refcounted, so sync point
won't be recycled while it has active users [1][2][3] in kernel (or
userspace).

[1]
https://github.com/grate-driver/linux/blob/master/include/linux/host1x.h#L428
[2]
https://github.com/grate-driver/linux/blob/master/include/linux/host1x.h#L1206
[3]
https://github.com/grate-driver/linux/blob/master/drivers/gpu/host1x/soc/syncpoints.c#L163

Now, grate-kernel isn't a 100% complete implementation, as I already
mentioned before. The host1x-fence doesn't have a reference to a sync
point as you may see in the code, this is because the userspace sync
points are not implemented in the grate-driver.

But nothing stops us to add that SP reference and then we could simply
do the following in the code:

struct dma_fence *host1x_fence_create(syncpt,...)
{
	...
	fence->sp = syncpt;
	...
	return &fence->base;
}

void host1x_syncpt_signal_fence(struct host1x_fence *fence)
{
	...
	fence->sp = NULL;
}

irqreturn_t host1x_hw_syncpt_isr()
{
	spin_lock(&host1x_syncpts_lock);
	...
	host1x_syncpt_signal_fence(sp->fence);
	...
	spin_unlock(&host1x_syncpts_lock);
}

void host1x_submit_job(job)
{
	...
	spin_lock_irqsave(&host1x_syncpts_lock);
	sp = host1x_syncpt_get(host1x_fence->sp);
	spin_unlock_irqrestore(&host1x_syncpts_lock);
	...
	if (sp) {
		push(WAIT(sp->id, host1x_fence->threshold));
		job->sync_points = sp;
	}
}

void host1x_free_job(job)
{
	host1x_syncpt_put(job->sync_points);
	...
}

For example: if you'll share host1-fence (dma-fence) with a GPU context,
then the fence's SP won't be released until GPU's context will be done
with the SP. The GPU's job will be timed out if shared SP won't get
incremented, and this is totally okay situation.

Does this answer yours question?

===

I'm not familiar with the Host1x VMs, so please let me use my
imagination here:

In a case of VM we could have a special VM-shared sync point type. The
userspace will allocate this special VM SP using ALLOCATE_SYNCPOINT and
this SP won't be used for a job(!). This is the case where job will need
to increment multiple sync points, its own SP + VM's SP. If job hangs,
then there should be a way to tell VM to release the SP and try again
next time with a freshly-allocated SP. The shared SP should stay alive
as long as VM uses it, so there should be a way for VM to tell that it's
done with SP.

Alternatively, we could add a SP recovery (or whatever is needed) for
the VM, but this should be left specific to T194+. Older Tegras
shouldn't ever need this complexity if I'm not missing anything.

Please provide a detailed information about the VM's workflow if the
above doesn't sound good.

Perhaps we shouldn't focus on the VM support for now, but may left some
room for a potential future expansion if necessary.

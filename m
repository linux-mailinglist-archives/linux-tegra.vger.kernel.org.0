Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 117932184A8
	for <lists+linux-tegra@lfdr.de>; Wed,  8 Jul 2020 12:06:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726196AbgGHKGP (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 8 Jul 2020 06:06:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725810AbgGHKGO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 8 Jul 2020 06:06:14 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE227C08C5DC
        for <linux-tegra@vger.kernel.org>; Wed,  8 Jul 2020 03:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=3Fr5HNymIk6+iZwXqVaaeBUzeKbMB56/urmCSy8zZrI=; b=CCqjbJWLNS6atY08u/CgFCy36W
        3/MVQoEHmeLTZUnXJT81zaAxV27+sxC4G5Eps/Zj2+etA+I8fgPXIT7gnTIwDsEeL5QSzDRiDGNLj
        t6FOrnmr57nYXddIdrnXRirou7RT/iYhBAlJBDGptRKVsCBlyYuLMHg/zqf+T3IwQEPMXsFonPR+q
        3yRMneNnrXAgH87ZrhMOBq2LbEg4UOBzl+QcsZHYhYF2f+tBFxCi1vunWQVR9euxs32SwmhovSuLR
        ccx8mVK0Q8RmdPrIB2gxNs+eslQ1kcNC8tx7KuRiGrcfXaHnzckRjuFpyFrE10pN5hlQkVTIYZKez
        zmOPL8nA==;
Received: from dsl-hkibng22-54faab-65.dhcp.inet.fi ([84.250.171.65] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1jt6xs-0004Dv-Iy; Wed, 08 Jul 2020 13:06:08 +0300
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
 <827c92a6-7fed-a81c-ba8e-6c69416c4ab9@kapsi.fi>
 <f1a88006-ab3e-9068-e220-15eee17aeba0@gmail.com>
 <3b058989-a93a-6796-8d94-f60ce39e3fba@kapsi.fi>
 <2190fe9d-6381-0b5e-39d8-a04daca9a1bf@gmail.com>
 <a1d6c789-4935-110f-f4fd-db86ae0e4fef@kapsi.fi>
 <a2b1f9cf-cc0b-1a0f-d0ac-addcb1f28502@gmail.com>
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <d3a6c005-0d85-e7b9-41a2-3d86595efbc1@kapsi.fi>
Date:   Wed, 8 Jul 2020 13:06:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <a2b1f9cf-cc0b-1a0f-d0ac-addcb1f28502@gmail.com>
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

On 7/7/20 2:06 PM, Dmitry Osipenko wrote:
> 02.07.2020 15:10, Mikko Perttunen пишет:
>> Ok, so we would have two kinds of syncpoints for the job; one
>> for kernel job tracking; and one that userspace can
>> manipulate as it wants to.
>>
>> Could we handle the job tracking syncpoint completely inside the kernel,
>> i.e. allocate it in kernel during job submission, and add an increment
>> for it at the end of the job (with condition OP_DONE)? For MLOCKing, the
>> kernel already needs to insert a SYNCPT_INCR(OP_DONE) + WAIT +
>> MLOCK_RELEASE sequence at the end of each job.
> 
> If sync point is allocated within kernel, then we'll need to always
> patch all job's sync point increments with the ID of the allocated sync
> point, regardless of whether firewall enabled or not.

The idea was that the job tracking increment would also be added to the 
pushbuffer in the kernel, so gathers would only have increments for the 
"user syncpoints", if any. I think this should work for THI-based 
engines (e.g. VIC), you probably have better information about 
GR2D/GR3D. On newer Tegras we could use CHANNEL/APPID protection to 
prevent the gathers from incrementing these job tracking syncpoints.

> 
> Secondly, I'm now recalling that only one sync point could be assigned
> to a channel at a time on newer Tegras which support sync point
> protection. So it sounds like we don't really have variants other than
> to allocate one sync point per channel for the jobs usage if we want to
> be able to push multiple jobs into channel's pushbuffer, correct?
> 

The other way around; each syncpoint can be assigned to one channel. One 
channel may have multiple syncpoints.

> ...
>>> Hmm, we actually should be able to have a one sync point per-channel for
>>> the job submission, similarly to what the current driver does!
>>>
>>> I'm keep forgetting about the waitbase existence!
>>
>> Tegra194 doesn't have waitbases, but if we are resubmitting all the jobs
>> anyway, can't we just recalculate wait thresholds at that time?
> 
> Yes, thresholds could be recalculated + job should be re-formed at the
> push-time then.
> 
> It also means that jobs always should be formed only at the push-time if
> wait-command is utilized by cmdstream since the waits always need to be
> patched because we won't know the thresholds until scheduler actually
> runs the job.

Could we keep the job tracking syncpoints entirely within the kernel, 
and have all wait commands and other stuff that userspace does use the 
user syncpoints? Then kernel job tracking and userspace activity would 
be separate from each other.

Alternatively, if we know that jobs can only be removed from the middle 
of pushbuffers, and not added, we could replace any removed jobs with 
syncpoint increments in the pushbuffer and any thresholds would stay intact.

> 
>> Maybe a more detailed sequence list or diagram of what happens during
>> submission and recovery would be useful.
> 
> The textual form + code is already good enough to me. A diagram could be
> nice to have, although it may take a bit too much effort to create +
> maintain it. But I don't mind at all if you'd want to make one :)
> 
> ...
>>>> * We should be able to keep the syncpoint refcounting based on fences.
>>>
>>> The fence doesn't need the sync point itself, it only needs to get a
>>> signal when the threshold is reached or when sync point is ceased.
>>>
>>> Imagine:
>>>
>>>     - Process A creates sync point
>>>     - Process A creates dma-fence from this sync point
>>>     - Process A exports dma-fence to process B
>>>     - Process A dies
>>>
>>> What should happen to process B?
>>>
>>>     - Should dma-fence of the process B get a error signal when process A
>>> dies?
>>>     - Should process B get stuck waiting endlessly for the dma-fence?
>>>
>>> This is one example of why I'm proposing that fence shouldn't be coupled
>>> tightly to a sync point.
>>
>> As a baseline, we should consider process B to get stuck endlessly
>> (until a timeout of its choosing) for the fence. In this case it is
>> avoidable, but if the ID/threshold pair is exported out of the fence and
>> is waited for otherwise, it is unavoidable. I.e. once the ID/threshold
>> are exported out of a fence, the waiter can only see the fence being
>> signaled by the threshold being reached, not by the syncpoint getting
>> freed.
> 
> This is correct. If sync point's FD is exported or once sync point is
> resolved from a dma-fence, then sync point will stay alive until the
> last reference to the sync point is dropped. I.e. if Process A dies
> *after* process B started to wait on the sync point, then it will get stuck.
> 

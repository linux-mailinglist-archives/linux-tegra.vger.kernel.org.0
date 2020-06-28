Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4BF420C746
	for <lists+linux-tegra@lfdr.de>; Sun, 28 Jun 2020 11:44:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725999AbgF1Jo4 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 28 Jun 2020 05:44:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725928AbgF1Jo4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 28 Jun 2020 05:44:56 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C5CDC061794
        for <linux-tegra@vger.kernel.org>; Sun, 28 Jun 2020 02:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=VXN78PjDaDZVNux9a7v7mx9coiRjhsMF6rM3m4hRSg0=; b=rlBbGFGqIHE21Dsg9Yj8jfBCgs
        ebrUse4WpAzDQ3NNCzMoeDXMo8HdgPsAm669kBIKjgx+szDgdy3BN+HXtKwO6sj5GLQ8BnsAJks/N
        saQGsktjgau3iqia/VzE/daKPiy541BT7Vr0aRlgQ3363Kd031uvm8zooN5CneKjwI+xfzklrbCM/
        oVVRoQCI639R4LNxL6lw7gT7NsyEliBZfRz4KHeOB1YeIQGr8CyMB2CTdwPVau6mvuVVTk/H6fvJZ
        lEjIkKBsuggRE2ih6NZZTiM/BaHXNc1YRm48Vv2b90B4KwhVdAoScfDtg1IYQtJg5CoUELz1QLQeD
        wdooMs4Q==;
Received: from dsl-hkibng22-54faab-65.dhcp.inet.fi ([84.250.171.65] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1jpTrk-0007J8-8t; Sun, 28 Jun 2020 12:44:48 +0300
Subject: Re: [RFC] Host1x/TegraDRM UAPI (sync points)
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
 <5b1edaad-ba36-7b0f-5b02-457ae5b6d91e@gmail.com>
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <62859775-514c-2941-75ed-6905e9282a6f@kapsi.fi>
Date:   Sun, 28 Jun 2020 12:44:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <5b1edaad-ba36-7b0f-5b02-457ae5b6d91e@gmail.com>
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

On 6/28/20 2:27 AM, Dmitry Osipenko wrote:
> 23.06.2020 15:09, Mikko Perttunen пишет:
>>
>> ### IOCTL HOST1X_ALLOCATE_SYNCPOINT (on /dev/host1x)
>>
>> Allocates a free syncpoint, returning a file descriptor representing it.
>> Only the owner of the file descriptor is allowed to mutate the value of
>> the syncpoint.
>>
>> ```
>> struct host1x_ctrl_allocate_syncpoint {
>>         /**
>>          * @fd:
>>          *
>>          * [out] New file descriptor representing the allocated syncpoint.
>>          */
>>         __s32 fd;
>>
>>         __u32 reserved[3];
>> };
> 
> We should need at least these basic things from the sync points API >
> - Execution context shouldn't be able to tamper sync points of the other
> contexts.

This is covered by this UAPI - when submitting, as part of the 
syncpt_incr struct you pass the syncpoint FD. This way the driver can 
check the syncpoints used are correct, or program HW protection.

> 
> - Sync point could be shared with other contexts for explicit fencing.

Not sure what you specifically mean; you can get the ID out of the 
syncpoint fd and share the ID for read-only access. (Or the FD for 
read-write access)

> 
> - Sync points should work reliably.
> 
> Some problems of the current Host1x driver, like where it falls over if
> sync point value is out-of-sync + all the hang-job recovery labor could
> be easily reduced if sync point health is protected by extra UAPI
> constraints. >
> So I think we may want the following:
> 
> 1. We still should need to assign sync point ID to a DRM-channel's
> context. This sync point ID will be used for a commands stream forming,
> like it is done by the current staging UAPI.
> 
> So we should need to retain the DRM_TEGRA_GET_SYNCPT IOCTL, but improve it.
> 
> 2. Allocated sync point must have a clean hardware state.

What do you mean by clean hardware state?

> 
> 3. Sync points should be properly refcounted. Job's sync points
> shouldn't be re-used while job is alive.
> 
> 4. The job's sync point can't be re-used after job's submission (UAPI
> constraint!). Userspace must free sync point and allocate a new one for
> the next job submission. And now we:
> 
>    - Know that job's sync point is always in a healthy state!
> 
>    - We're not limited by a number of physically available hardware sync
> points! Allocation should block until free sync point is available.
> 
>    - The logical number of job's sync point increments matches the SP
> hardware state! Which is handy for a job's debugging.
> 
> Optionally, the job's sync point could be auto-removed from the DRM's
> context after job's submission, avoiding a need for an extra SYNCPT_PUT
> IOCTL invocation to be done by userspace after the job's submission.
> Could be a job's flag.

I think this would cause problems where after a job completes but before 
the fence has been waited, the syncpoint is already recycled (especially 
if the syncpoint is reset into some clean state).

I would prefer having a syncpoint for each userspace channel context 
(several of which could share a hardware channel if MLOCKing is not used).

In my experience it's then not difficult to pinpoint which job has 
failed, and if each userspace channel context uses a separate syncpoint, 
a hanging job wouldn't mess with other application's jobs, either.

Mikko

> 
> We could avoid a need for a statically-allocated sync points at all for
> a patched cmdstreams! The sync point could be dynamically allocated at a
> job's submission time by the kernel driver and then cmdstream will be
> patched with this sync point.
> 

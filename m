Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C3A3219C2E
	for <lists+linux-tegra@lfdr.de>; Thu,  9 Jul 2020 11:28:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726319AbgGIJ2w (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 9 Jul 2020 05:28:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726302AbgGIJ2v (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Jul 2020 05:28:51 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98724C08C5CE
        for <linux-tegra@vger.kernel.org>; Thu,  9 Jul 2020 02:28:50 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id s16so745167lfp.12
        for <linux-tegra@vger.kernel.org>; Thu, 09 Jul 2020 02:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kvgnhQF49mXlO2b9f/CHzVxzk2HkPNlcy9JXirtzMBk=;
        b=JfK+FQK5KNXLnavuVpluQImLVyGEas9CrGAp0Np1jeERhtymxB1I8qpbdSEI6/g3LR
         N9eZiJUDTMRsRQVIZI9TkUh4SGso2nUIE7ZzOQ9iA2Rh3IQUYXjRb01JIMruB6oo6s0g
         6jl3eEuMee6sEQ+SYgcq/cgwJGRtcEgr1ntRRKh5I9DqJ751lblMULdaKw3dt++dDCjj
         0INUL2kLx1Ip03rjwGdAlBrSTJklOz7vmH1h0GvSm/dGqFWG6YzFdL6WbYS0P4sjoHsM
         3pi2Jh9uXPRVL0lK02D98ZeXSnPbEUlnhKZZ1ThQbDzDYiV8KseC9DFpZfgLf1F6FKxD
         NTaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kvgnhQF49mXlO2b9f/CHzVxzk2HkPNlcy9JXirtzMBk=;
        b=aVlg/+kbCfbzKpb1YVwl3ZBbOUpjMHe/BcR+jayQWieBj3x7dzB7ABEcM7RVHA9JfI
         VuBOu4GGPlQnzGY1t8zXgsbsGohKqyrizkb9KZF7D8ZXjfISy9prfIU17w6JiAZKYk6E
         phbcizf2y7cJcPuUJrjO8MgjL6jJlLSnKO6MIVT/emS9Ve3OIdMME2RX8SNbHFF4IeIM
         HYSp/wD4J1o1O87hBKDSg2uHUsgCRu1JqvZtSL0TZPdPD26gMr2yhSxrxR0CMND8OQfO
         QWOJLR6yAruyai/2J326PE+bvPbe2dFIcJPz4UfvX4ZibRZCfny7kqBLCwUnYM6LywQO
         By9w==
X-Gm-Message-State: AOAM5338r+OOKHe7gugMtbIsI0X/Nv5/xOEB3CjbCzRR9A12Uue7L2M5
        MQNZdAnwGYB1nPkl0nI8XU8=
X-Google-Smtp-Source: ABdhPJyQ0vMUncUz8kf6pJzFVa+LJ/TSbO0ixtuJScmjaERCykGUWnx+f7KOpFJSpWctrmduF4MbOA==
X-Received: by 2002:ac2:5e29:: with SMTP id o9mr37974535lfg.196.1594286929079;
        Thu, 09 Jul 2020 02:28:49 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-79-162-105.pppoe.mtu-net.ru. [91.79.162.105])
        by smtp.googlemail.com with ESMTPSA id o9sm606559ljh.78.2020.07.09.02.28.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2020 02:28:48 -0700 (PDT)
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
 <f1a88006-ab3e-9068-e220-15eee17aeba0@gmail.com>
 <3b058989-a93a-6796-8d94-f60ce39e3fba@kapsi.fi>
 <2190fe9d-6381-0b5e-39d8-a04daca9a1bf@gmail.com>
 <a1d6c789-4935-110f-f4fd-db86ae0e4fef@kapsi.fi>
 <a2b1f9cf-cc0b-1a0f-d0ac-addcb1f28502@gmail.com>
 <d3a6c005-0d85-e7b9-41a2-3d86595efbc1@kapsi.fi>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <7feec6b2-3d00-04ac-92d0-dcc40751f9fa@gmail.com>
Date:   Thu, 9 Jul 2020 12:28:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <d3a6c005-0d85-e7b9-41a2-3d86595efbc1@kapsi.fi>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

08.07.2020 13:06, Mikko Perttunen пишет:
> On 7/7/20 2:06 PM, Dmitry Osipenko wrote:
>> 02.07.2020 15:10, Mikko Perttunen пишет:
>>> Ok, so we would have two kinds of syncpoints for the job; one
>>> for kernel job tracking; and one that userspace can
>>> manipulate as it wants to.
>>>
>>> Could we handle the job tracking syncpoint completely inside the kernel,
>>> i.e. allocate it in kernel during job submission, and add an increment
>>> for it at the end of the job (with condition OP_DONE)? For MLOCKing, the
>>> kernel already needs to insert a SYNCPT_INCR(OP_DONE) + WAIT +
>>> MLOCK_RELEASE sequence at the end of each job.
>>
>> If sync point is allocated within kernel, then we'll need to always
>> patch all job's sync point increments with the ID of the allocated sync
>> point, regardless of whether firewall enabled or not.
> 
> The idea was that the job tracking increment would also be added to the
> pushbuffer in the kernel, so gathers would only have increments for the
> "user syncpoints", if any. I think this should work for THI-based
> engines (e.g. VIC), you probably have better information about
> GR2D/GR3D. On newer Tegras we could use CHANNEL/APPID protection to
> prevent the gathers from incrementing these job tracking syncpoints.

Could you please clarify what is THI?

>> Secondly, I'm now recalling that only one sync point could be assigned
>> to a channel at a time on newer Tegras which support sync point
>> protection. So it sounds like we don't really have variants other than
>> to allocate one sync point per channel for the jobs usage if we want to
>> be able to push multiple jobs into channel's pushbuffer, correct?
>>
> 
> The other way around; each syncpoint can be assigned to one channel. One
> channel may have multiple syncpoints.

Okay! So we actually could use a single sync point per-job for user
increments + job tracking, correct?

>> ...
>>>> Hmm, we actually should be able to have a one sync point per-channel
>>>> for
>>>> the job submission, similarly to what the current driver does!
>>>>
>>>> I'm keep forgetting about the waitbase existence!
>>>
>>> Tegra194 doesn't have waitbases, but if we are resubmitting all the jobs
>>> anyway, can't we just recalculate wait thresholds at that time?
>>
>> Yes, thresholds could be recalculated + job should be re-formed at the
>> push-time then.
>>
>> It also means that jobs always should be formed only at the push-time if
>> wait-command is utilized by cmdstream since the waits always need to be
>> patched because we won't know the thresholds until scheduler actually
>> runs the job.
> 
> Could we keep the job tracking syncpoints entirely within the kernel,
> and have all wait commands and other stuff that userspace does use the
> user syncpoints? Then kernel job tracking and userspace activity would
> be separate from each other.

I think this should work, but it's not clear to me what benefits this
brings to us if we could re-use the same user-allocated sync point for
both user increments + kernel job tracking.

Is the idea to protect from userspace incrementing sync point too much?
I.e. job could be treated as completed before CDMA is actually done with
it.

> Alternatively, if we know that jobs can only be removed from the middle
> of pushbuffers, and not added, we could replace any removed jobs with
> syncpoint increments in the pushbuffer and any thresholds would stay
> intact.

A bit unlikely that jobs could ever be removed from the middle of
hardware queue by the DRM scheduler.

Anyways, it should be nicer to shoot down everything and restart with a
clean slate when necessary, like it's already supposed to happen by the
scheduler.

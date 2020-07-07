Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 582D9216B10
	for <lists+linux-tegra@lfdr.de>; Tue,  7 Jul 2020 13:06:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727793AbgGGLGu (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 7 Jul 2020 07:06:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727079AbgGGLGu (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 7 Jul 2020 07:06:50 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C098FC061755
        for <linux-tegra@vger.kernel.org>; Tue,  7 Jul 2020 04:06:49 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id k15so24446901lfc.4
        for <linux-tegra@vger.kernel.org>; Tue, 07 Jul 2020 04:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xFoSuxpGFGrT7m2qOPFkoZEgsAUN6G+H/xhCcVxI1GI=;
        b=tPXUfONFx1O3VJ1NqbRPNLxYLmmiOfz3bKJV8rmbcK2mLYUAcIZvdY59jVPDEqHlLe
         O5wr5E3XOVtvBCcNIsO3OA7RFYBa8kacVjzlSHV4SBtLcKxZsl/j2cscr6odn3tRxzvC
         yHUvR0mEr19z00ffT6g7hYQ2rxcGLmZCvkXshQM8HyrKw2fbFQve8Lr8Dw2vn8yqK928
         1oYJ/NkXHJpp5hGuaWg0x+qhaynJwmogRYRlAR+wT5wBByAFAppWB5kIlMrj1tFlaGCl
         2wmkzV1Gwdqz8njpF6svRaIL+liQZEhJqfAQhBUnFSBQ1S8MhxEZ4LI+cS7wEWsLIZRP
         qlKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xFoSuxpGFGrT7m2qOPFkoZEgsAUN6G+H/xhCcVxI1GI=;
        b=m2G4Yv2hfdCJKPN/brf0+9FcVzzHQhKLHwdOvfqOy+MQBkDYmgF83NfCzBht9KnwkG
         tFj5SE6+TxH5jNuGTXjoq4cpn2Nf49WiwCR87Vk/fuCTZHM6m4XRv7Qx8LS5fwjq+zFL
         HstgaewwHXwPxcANsAtz2tRkI3t9dw2zL2/MX/e8of5JZOkeFPIeM2ENI2iWBXnRGfnu
         Z5Y+sNc+cYa/mfWPz6fIZn0siufN/3FvEvOG/Bn4rqhhnppymV7qy4Lhs/EPDdiMvCch
         u7pzR1TCE0dgqBJPoGQJxkrXRPc+dQCh8hSO3YmTKBcvkXz7oWVt4p5x5P4WaRCCzmpb
         145g==
X-Gm-Message-State: AOAM530Pd0Le8/mFEW9mbh8Ky1wKJVmFlrlikVOFz1M8FqwplSYGEmW6
        SrSl/19UPd+qAisivj2IV0xMnMUy
X-Google-Smtp-Source: ABdhPJwgBagUDLrWSy6j9636Y8+jdO+3yOL5MaUakEqcNPHNwWgZLIOIvNYPEWcSjbQeHhfpH0fl6Q==
X-Received: by 2002:a19:50b:: with SMTP id 11mr18496347lff.154.1594120008224;
        Tue, 07 Jul 2020 04:06:48 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-79-162-105.pppoe.mtu-net.ru. [91.79.162.105])
        by smtp.googlemail.com with ESMTPSA id s12sm87168ljd.116.2020.07.07.04.06.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2020 04:06:46 -0700 (PDT)
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
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a2b1f9cf-cc0b-1a0f-d0ac-addcb1f28502@gmail.com>
Date:   Tue, 7 Jul 2020 14:06:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <a1d6c789-4935-110f-f4fd-db86ae0e4fef@kapsi.fi>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

02.07.2020 15:10, Mikko Perttunen пишет:
> Ok, so we would have two kinds of syncpoints for the job; one
> for kernel job tracking; and one that userspace can
> manipulate as it wants to.
> 
> Could we handle the job tracking syncpoint completely inside the kernel,
> i.e. allocate it in kernel during job submission, and add an increment
> for it at the end of the job (with condition OP_DONE)? For MLOCKing, the
> kernel already needs to insert a SYNCPT_INCR(OP_DONE) + WAIT +
> MLOCK_RELEASE sequence at the end of each job.

If sync point is allocated within kernel, then we'll need to always
patch all job's sync point increments with the ID of the allocated sync
point, regardless of whether firewall enabled or not.

Secondly, I'm now recalling that only one sync point could be assigned
to a channel at a time on newer Tegras which support sync point
protection. So it sounds like we don't really have variants other than
to allocate one sync point per channel for the jobs usage if we want to
be able to push multiple jobs into channel's pushbuffer, correct?

...
>> Hmm, we actually should be able to have a one sync point per-channel for
>> the job submission, similarly to what the current driver does!
>>
>> I'm keep forgetting about the waitbase existence!
> 
> Tegra194 doesn't have waitbases, but if we are resubmitting all the jobs
> anyway, can't we just recalculate wait thresholds at that time?

Yes, thresholds could be recalculated + job should be re-formed at the
push-time then.

It also means that jobs always should be formed only at the push-time if
wait-command is utilized by cmdstream since the waits always need to be
patched because we won't know the thresholds until scheduler actually
runs the job.

> Maybe a more detailed sequence list or diagram of what happens during
> submission and recovery would be useful.

The textual form + code is already good enough to me. A diagram could be
nice to have, although it may take a bit too much effort to create +
maintain it. But I don't mind at all if you'd want to make one :)

...
>>> * We should be able to keep the syncpoint refcounting based on fences.
>>
>> The fence doesn't need the sync point itself, it only needs to get a
>> signal when the threshold is reached or when sync point is ceased.
>>
>> Imagine:
>>
>>    - Process A creates sync point
>>    - Process A creates dma-fence from this sync point
>>    - Process A exports dma-fence to process B
>>    - Process A dies
>>
>> What should happen to process B?
>>
>>    - Should dma-fence of the process B get a error signal when process A
>> dies?
>>    - Should process B get stuck waiting endlessly for the dma-fence?
>>
>> This is one example of why I'm proposing that fence shouldn't be coupled
>> tightly to a sync point.
> 
> As a baseline, we should consider process B to get stuck endlessly
> (until a timeout of its choosing) for the fence. In this case it is
> avoidable, but if the ID/threshold pair is exported out of the fence and
> is waited for otherwise, it is unavoidable. I.e. once the ID/threshold
> are exported out of a fence, the waiter can only see the fence being
> signaled by the threshold being reached, not by the syncpoint getting
> freed.

This is correct. If sync point's FD is exported or once sync point is
resolved from a dma-fence, then sync point will stay alive until the
last reference to the sync point is dropped. I.e. if Process A dies
*after* process B started to wait on the sync point, then it will get stuck.

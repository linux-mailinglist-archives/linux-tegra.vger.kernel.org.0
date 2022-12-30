Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48C3C659716
	for <lists+linux-tegra@lfdr.de>; Fri, 30 Dec 2022 11:04:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234573AbiL3KDm (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 30 Dec 2022 05:03:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230056AbiL3KDk (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 30 Dec 2022 05:03:40 -0500
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9694E19C1D;
        Fri, 30 Dec 2022 02:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
        s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:
        Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=9uDZ+v4Y8BouQxpMmktQOIpdX02LoIv/rDm+AAMvalk=; b=LuP2pOhMw71lPqUjYC3eqanGdm
        z63SRdz7xzjC2pAsiTPvf8lpoIdtgfMoKGhdoSrYTJR71UcHNoK0SbD0OJtQo5hmO0Y7t6Tv+sKTL
        c9OXvM3mc3T6+aghPvhesShVKGvwXL/yGy5qqgV2w3UQ4pf+s03lCcVSsESRgyQOPjqWq4pNhZJc5
        Rm/VVLcSgNu7Ee63VBjlcY2W8x+rDSXFxdQCVCQQoQA+ii0ABUTe9ckvrEGbjm3q4+6MJTnwugPEb
        V19Unnak47HPcMPOerxggUvFRmYN4Ce20D6FZc210YwKF3S6IZMreNDXtmz2e43rt+CQqVliZLaHV
        rLRDRN7g==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <cyndis@kapsi.fi>)
        id 1pBCEY-00GrLw-6I; Fri, 30 Dec 2022 12:03:26 +0200
Message-ID: <a815b74d-c158-73b6-cfc8-583826277b5c@kapsi.fi>
Date:   Fri, 30 Dec 2022 12:03:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] drm/tegra: submit: No need for Null pointer check before
 kfree
Content-Language: en-US
From:   Mikko Perttunen <cyndis@kapsi.fi>
To:     Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Cc:     Deepak R Varma <drv@mailo.com>,
        Praveen Kumar <kumarpraveen@linux.microsoft.com>,
        Saurabh Singh Sengar <ssengar@microsoft.com>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-tegra@vger.kernel.org
References: <Y6sn7XptKyk5cbrA@qemulion>
 <864f2fdd-4289-a178-bbf1-c2a6a579c58c@kapsi.fi> <Y6w/4IzoMFsVnCmu@qemulion>
 <280170a7-de12-f362-cda3-11208ead0a88@kapsi.fi>
 <20221230091501.GA1285371@linux.intel.com>
 <65468c84-fc40-e4e1-0adb-ddfc23ec4fb9@kapsi.fi>
In-Reply-To: <65468c84-fc40-e4e1-0adb-ddfc23ec4fb9@kapsi.fi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 12/30/22 12:01, Mikko Perttunen wrote:
> On 12/30/22 11:15, Stanislaw Gruszka wrote:
>> On Wed, Dec 28, 2022 at 03:17:59PM +0200, Mikko Perttunen wrote:
>>> On 12/28/22 15:08, Deepak R Varma wrote:
>>>> On Wed, Dec 28, 2022 at 02:28:54PM +0200, Mikko Perttunen wrote:
>>>>> On 12/27/22 19:14, Deepak R Varma wrote:
>>>>>> kfree() & vfree() internally perform NULL check on the pointer handed
>>>>>> to it and take no action if it indeed is NULL. Hence there is no need
>>>>>> for a pre-check of the memory pointer before handing it to
>>>>>> kfree()/vfree().
>>>>>>
>>>>>> Issue reported by ifnullfree.cocci Coccinelle semantic patch script.
>>>>>>
>>>>>> Signed-off-by: Deepak R Varma <drv@mailo.com>
>>>>>> ---
>>>>>>     drivers/gpu/drm/tegra/submit.c | 4 ++--
>>>>>>     1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/tegra/submit.c 
>>>>>> b/drivers/gpu/drm/tegra/submit.c
>>>>>> index 066f88564169..06f836db99d0 100644
>>>>>> --- a/drivers/gpu/drm/tegra/submit.c
>>>>>> +++ b/drivers/gpu/drm/tegra/submit.c
>>>>>> @@ -680,8 +680,8 @@ int tegra_drm_ioctl_channel_submit(struct 
>>>>>> drm_device *drm, void *data,
>>>>>>             kfree(job_data->used_mappings);
>>>>>>         }
>>>>>>
>>>>>> -    if (job_data)
>>>>>> -        kfree(job_data);
>>>>>> +    kfree(job_data);
>>>>>> +
>>>>>>     put_bo:
>>>>>>         gather_bo_put(&bo->base);
>>>>>>     unlock:
>>>>>> -- 
>>>>>> 2.34.1
>>>>>>
>>>>>>
>>>>>>
>>>>>
>>>>> It continues to be the case that I think this transform is bad. 
>>>>> Same applies
>>>>> to the host1x patch.
>>>>
>>>> Hello Mikko,
>>>> Thank you for responding to the patch proposal. Could you please 
>>>> explain why is
>>>> this bad?
>>>>
>>>> Regards,
>>>> ./drv
>>>>
>>>>>
>>>>> Mikko
>>>>
>>>>
>>>
>>> Hi,
>>>
>>> it gets rid of visual hints on code paths indicating the possible 
>>> liveness
>>> of pointer variables. I.e., after the change, whether the pointer can be
>>> NULL or not is more difficult to reason about locally, instead requiring
>>> more global reasoning which is mentally more taxing.
>>>
>>> Since C's type system doesn't help with tracking these kinds of 
>>> things, I
>>> believe it is important to have these kinds of local contextual cues 
>>> to help
>>> the programmer.
>>
>> I agree with your point of view. But regarding this particular patch,
>> at least on code base I can see, after free_job_data label job_done
>> can not be NULL. So patch seems to be ok, but maybe changelog need to
>> be different
>>
>> Regards
>> Stanislaw
> 
> It can be NULL; see:
> 
>          job->user_data = job_data;
>          job->release = release_job;
>          job->timeout = 10000;
> 
>          /*
>           * job_data is now part of job reference counting, so don't 
> release
>           * it from here.
>           */
>          job_data = NULL;
> 
> If we go into free_job_data after this code (which happens if there is 
> no error, or if host1x_job_submit fails), job_data will be NULL.
> 
> The memory is instead released in the 'put_job' label; host1x_job_put 
> ends up calling release_job, which does the kfree.

Well, the refcount is dropped -- it's not necessarily freed immediately, 
if the job is in execution.

Mikko

> 
> (Yes, it is rather complicated..)
> 
> Thanks,
> Mikko


Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 160BC31F12A
	for <lists+linux-tegra@lfdr.de>; Thu, 18 Feb 2021 21:41:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229752AbhBRUl3 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 18 Feb 2021 15:41:29 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:43248 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229994AbhBRUjn (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 18 Feb 2021 15:39:43 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: gtucker)
        with ESMTPSA id F168E1F44588
Subject: Re: [PATCH RESEND v2 4/5] iommu/tegra-smmu: Rework
 tegra_smmu_probe_device()
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     will@kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
        jonathanh@nvidia.com, vdumpa@nvidia.com, thierry.reding@gmail.com,
        joro@8bytes.org, kernel@collabora.com,
        Dmitry Osipenko <digetx@gmail.com>,
        "kernelci-results@groups.io" <kernelci-results@groups.io>
References: <20201125101013.14953-1-nicoleotsuka@gmail.com>
 <20201125101013.14953-5-nicoleotsuka@gmail.com>
 <46a96cf9-91cc-2ad4-702a-e95ba7200375@collabora.com>
 <20210205052422.GA11329@Asurada-Nvidia>
 <20210205094556.GA32677@Asurada-Nvidia>
 <f45c94b4-2949-4eac-5944-85d43a8afef5@collabora.com>
 <20210210082052.GA11455@Asurada-Nvidia>
 <df170d15-f5b5-4238-f998-5b8f8e45849a@collabora.com>
 <20210218103510.GA13060@Asurada-Nvidia>
From:   Guillaume Tucker <guillaume.tucker@collabora.com>
Message-ID: <dc0c4040-469d-b4f6-2be5-59a4e2c7f966@collabora.com>
Date:   Thu, 18 Feb 2021 20:38:56 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210218103510.GA13060@Asurada-Nvidia>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 18/02/2021 10:35, Nicolin Chen wrote:
> Hi Guillaume,
> 
> Thank you for the test results! And sorry for my belated reply.

No worries :)

> On Thu, Feb 11, 2021 at 03:50:05PM +0000, Guillaume Tucker wrote:
>>> On Sat, Feb 06, 2021 at 01:40:13PM +0000, Guillaume Tucker wrote:
>>>>> It'd be nicer if I can get both logs of the vanilla kernel (failing)
>>>>> and the commit-reverted version (passing), each applying this patch.
>>>>
>>>> Sure, I've run 3 jobs:
>>>>
>>>> * v5.11-rc6 as a reference, to see the original issue:
>>>>   https://lava.collabora.co.uk/scheduler/job/3187848
>>>>
>>>> * + your debug patch:
>>>>   https://lava.collabora.co.uk/scheduler/job/3187849
>>>>
>>>> * + the "breaking" commit reverted, passing the tests:
>>>>   https://lava.collabora.co.uk/scheduler/job/3187851
>>>
>>> Thanks for the help!
>>>
>>> I am able to figure out what's probably wrong, yet not so sure
>>> about the best solution at this point.
>>>
>>> Would it be possible for you to run one more time with another
>>> debugging patch? I'd like to see the same logs as previous:
>>> 1. Vanilla kernel + debug patch
>>> 2. Vanilla kernel + Reverted + debug patch
>>
>> As it turns out, next-20210210 is passing all the tests again so
>> it looks like this got fixed in the meantime:
>>
>>   https://lava.collabora.co.uk/scheduler/job/3210192
> 
> I checked this passing log, however, found that the regression is
> still there though test passed, as the prints below aren't normal:
>   tegra-mc 70019000.memory-controller: display0a: read @0xfe056b40:
> 	 EMEM address decode error (SMMU translation error [--S])
>   tegra-mc 70019000.memory-controller: display0a: read @0xfe056b40:
> 	 Page fault (SMMU translation error [--S])

Ah yes sorry, there are other KernelCI checks for kernel errors
but that wasn't enabled in the bisection so I didn't notice them.

> I was trying to think of a simpler solution than a revert. However,
> given the fact that the callback sequence could change -- guessing
> likely a recent change in iommu core, I feel it safer to revert my
> previous change, not necessarily being a complete revert though.
> 
> I attached my partial reverting change in this email. Would it be
> possible for you to run one more test for me to confirm it? It'd
> keep the tests passing while eliminating all error prints above.
> 
> If the fix works, I'll re-send it to mail list by adding a commit
> message.

Sure, here's next-20210218 as a reference:

  https://lava.collabora.co.uk/scheduler/job/3241236

and here with your patch applied on top of it:

  https://lava.collabora.co.uk/scheduler/job/3241246

The git branch I've used where your patch is applied:

  https://gitlab.collabora.com/gtucker/linux/-/commits/next-20210218-nyan-big-drm-read/

The errors seem to have disappeared but I'll let you double check
that things are all back to a working state.

BTW: This thread is a good example of how having an "on-demand"
KernelCI service to let developers re-run tests with extra
patches would allow them to fix issues independently.  We'll keep
that in mind for the future.

Best wishes,
Guillaume

Return-Path: <linux-tegra+bounces-2898-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 785B29264F4
	for <lists+linux-tegra@lfdr.de>; Wed,  3 Jul 2024 17:36:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 06FBF1F23198
	for <lists+linux-tegra@lfdr.de>; Wed,  3 Jul 2024 15:36:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E58C9181312;
	Wed,  3 Jul 2024 15:35:58 +0000 (UTC)
X-Original-To: linux-tegra@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9939E17B50D;
	Wed,  3 Jul 2024 15:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720020958; cv=none; b=FwAG2zr3jFQZB+i6dr+EPnkMEro8o7JLyXVsC+QgamLK7KwjFQwQDVk0jb9Dz+W8tLbNKXOzNq72Hdzs+PZ0I/VNe9WlSbLG+C2WGkCPCsno1mu4L0zGTrkc0jzUmRrQ+xLoHyQERdXKMBU8VlPi+PdF7eIil6OkVSrWTOtg9LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720020958; c=relaxed/simple;
	bh=Uyc1hU8okBF33WZyc4l2HVw4+2t1v/yUIooCPhLOmnE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pTJyOW6ikzlgpZhjKYcD1uWaQuZ4Gwff99Rrzp2brq3pzT61tmaYgbRKuusDWSfn67MSQB2FftyN034vSzVxJpsYTgkumvL2fEDO/pcr/V3JVjcrQe5KVX/8+Pszr9o84tUPc7t32robwgz6mLYJ+Jr7czYUKBxWTdRmh+0fqwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2830B367;
	Wed,  3 Jul 2024 08:36:21 -0700 (PDT)
Received: from [10.57.75.119] (unknown [10.57.75.119])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4EC2F3F762;
	Wed,  3 Jul 2024 08:35:54 -0700 (PDT)
Message-ID: <cc69b154-ca4b-42eb-950a-9ea3c5a4e4ee@arm.com>
Date: Wed, 3 Jul 2024 16:35:52 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] iommu: Optimize IOMMU UnMap
To: Ashish Mhetre <amhetre@nvidia.com>, will@kernel.org, joro@8bytes.org,
 linux-arm-kernel@lists.infradead.org, Rob Clark <robdclark@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Cc: vdumpa@nvidia.com, linux-tegra@vger.kernel.org, treding@nvidia.com,
 jonathanh@nvidia.com, iommu@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240523031935.90856-1-amhetre@nvidia.com>
 <6b707eb4-5cf3-4b66-8152-5ba252f5df39@arm.com>
 <2a349725-72cf-45e2-9ca2-5a8b153a6fae@nvidia.com>
 <d854664c-ab56-46b6-81f9-9ef712c32b3a@nvidia.com>
 <39d1635d-25b4-47ca-beb3-0baaae6252db@nvidia.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <39d1635d-25b4-47ca-beb3-0baaae6252db@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2024-07-01 8:49 am, Ashish Mhetre wrote:
> 
> On 5/31/2024 2:52 PM, Ashish Mhetre wrote:
>>
>> On 5/24/2024 6:09 PM, Ashish Mhetre wrote:
>>>
>>> On 5/23/2024 7:11 PM, Robin Murphy wrote:
>>>> External email: Use caution opening links or attachments
>>>>
>>>>
>>>> On 23/05/2024 4:19 am, Ashish Mhetre wrote:
>>>>> The current __arm_lpae_unmap() function calls dma_sync() on individual
>>>>> PTEs after clearing them. By updating the __arm_lpae_unmap() to call
>>>>> dma_sync() once for all cleared PTEs, the overall performance can be
>>>>> improved 25% for large buffer sizes.
>>>>> Below is detailed analysis of average unmap latency(in us) with and
>>>>> without this optimization obtained by running dma_map_benchmark for
>>>>> different buffer sizes.
>>>>>
>>>>> Size  Time W/O        Time With       % Improvement
>>>>>       Optimization    Optimization
>>>>>       (us)            (us)
>>>>>
>>>>> 4KB   3.0             3.1             -3.33
>>>>> 1MB   250.3           187.9           24.93
>>>>
>>>> This seems highly suspect - the smallest possible block size is 2MB 
>>>> so a
>>>> 1MB unmap should not be affected by this path at all.
>>>>
>>> It will be unmapped at 4KB block size, right? The 'size' passed to
>>> __arm_lpae_unmap will be 4KB and 'pgcount' will be 256 for 1MB
>>> buffer from iommu_pgsize() unless the IOVA and phys address met
>>> conditions for next bigger size i.e., 2MB.
>>>>> 2MB   493.7           368.7 25.32
>>>>> 4MB   974.7           723.4           25.78
>>>>
>>>> I'm guessing this is on Tegra with the workaround to force 
>>>> everything to
>>>> PAGE_SIZE? In the normal case a 2MB unmap should be nominally *faster*
>>>> than 4KB, since it would also be a single PTE, but with one fewer level
>>>> of table to walk to reach it. The 25% figure is rather misleading if
>>>> it's only a mitigation of an existing erratum workaround, and the 
>>>> actual
>>>> impact on the majority of non-broken systems is unmeasured.
>>>>
>>> Yes, I forgot about the workaround we have and agree that without the
>>> workaround, 2MB unmap will be faster without this optimization. But
>>> for any size between 4KB and 2MB, this optimization would help in
>>> improving the unmap latencies. To verify that, I reverted the workaround
>>> and again got unmap latencies using dma_map_benchmark which are as
>>> mentioned below. We can see an improvement around 20% to 25%:
>>>
>>> Size          Time WO Opt(us)     Time With Opt(us)       % improvement
>>> 4KB          3                                  3.1 -3.33
>>> 64KB        18.6                            15 19.36
>>> 128KB      35.2                            27.7            21.31
>>> 256KB      67.6                            52.6            22.19
>>> 512KB      128.4                          97.7           23.91
>>> 1MB         249.9                          188.1           24.72
>>> 2MB         67.4                             67.5 -0.15
>>> 4MB         121.3                          121.2           0.08
>>>
>>>> (As an aside, I think that workaround itself is a bit broken, since at
>>>> least on Tegra234 with Cortex-A78, PAGE_SIZE could be 16KB which 
>>>> MMU-500
>>>> doesn't support.)
>>>>
>>> Yes, that's true. For 16KB PAGE_SIZE, we need to fall back to 4KB 
>>> pgsize_bitmap.
>>>>> Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
>>>>> ---
>>>>>   drivers/iommu/io-pgtable-arm.c | 34 
>>>>> +++++++++++++++++++++++++---------
>>>>>   1 file changed, 25 insertions(+), 9 deletions(-)
>>>>>
>>>>> diff --git a/drivers/iommu/io-pgtable-arm.c 
>>>>> b/drivers/iommu/io-pgtable-arm.c
>>>>> index 3d23b924cec1..94094b711cba 100644
>>>>> --- a/drivers/iommu/io-pgtable-arm.c
>>>>> +++ b/drivers/iommu/io-pgtable-arm.c
>>>>> @@ -256,13 +256,15 @@ static void 
>>>>> __arm_lpae_sync_pte(arm_lpae_iopte *ptep, int num_entries,
>>>>>                                  sizeof(*ptep) * num_entries, 
>>>>> DMA_TO_DEVICE);
>>>>>   }
>>>>>
>>>>> -static void __arm_lpae_clear_pte(arm_lpae_iopte *ptep, struct 
>>>>> io_pgtable_cfg *cfg)
>>>>> +static void __arm_lpae_clear_pte(arm_lpae_iopte *ptep, struct 
>>>>> io_pgtable_cfg *cfg, int num_entries)
>>>>>   {
>>>>> +     int i;
>>>>>
>>>>> -     *ptep = 0;
>>>>> +     for (i = 0; i < num_entries; i++)
>>>>> +             ptep[i] = 0;
>>>>>
>>>>>       if (!cfg->coherent_walk)
>>>>> -             __arm_lpae_sync_pte(ptep, 1, cfg);
>>>>> +             __arm_lpae_sync_pte(ptep, num_entries, cfg);
>>>>>   }
>>>>>
>>>>>   static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
>>>>> @@ -633,13 +635,25 @@ static size_t __arm_lpae_unmap(struct 
>>>>> arm_lpae_io_pgtable *data,
>>>>>       if (size == ARM_LPAE_BLOCK_SIZE(lvl, data)) {
>>>>>               max_entries = ARM_LPAE_PTES_PER_TABLE(data) - 
>>>>> unmap_idx_start;
>>>>>               num_entries = min_t(int, pgcount, max_entries);
>>>>> -
>>>>> -             while (i < num_entries) {
>>>>> -                     pte = READ_ONCE(*ptep);
>>>>> +             arm_lpae_iopte *pte_flush;
>>>>> +             int j = 0;
>>>>> +
>>>>> +             pte_flush = kvcalloc(num_entries, sizeof(*pte_flush), 
>>>>> GFP_ATOMIC);
>>>>
>>>> kvmalloc() with GFP_ATOMIC isn't valid. However, I'm not sure if there
>>>> isn't a more fundamental problem here - Rob, Boris; was it just the map
>>>> path, or would any allocation on unmap risk the GPU reclaim deadlock
>>>> thing as well?
>>>>
>>> I am using kvmalloc() here to create an array which is used to store 
>>> PTEs
>>> that are going to be flushed after clearing. If we don't store them then
>>> those will be lost once cleared and we won't be able to flush them.
>>> I tried using GFP_KERNEL instead of GFP_ATOMIC but then I am getting
>>> warning from might_sleep().
>>> Is there any other alternative way we can use here to store the PTEs?
>>>> Thanks,
>>>> Robin.
>>>>
>>>>> +             if (pte_flush) {
>>>>> +                     for (j = 0; j < num_entries; j++) {
>>>>> +                             pte_flush[j] = READ_ONCE(ptep[j]);
>>>>> +                             if (WARN_ON(!pte_flush[j]))
>>>>> +                                     break;
>>>>> +                     }
>>>>> +                     __arm_lpae_clear_pte(ptep, &iop->cfg, j);
>>>>> +             }
>>>>> +             while (i < (pte_flush ? j : num_entries)) {
>>>>> +                     pte = pte_flush ? pte_flush[i] : 
>>>>> READ_ONCE(*ptep);
>>>>>                       if (WARN_ON(!pte))
>>>>>                               break;
>>>>>
>>>>> -                     __arm_lpae_clear_pte(ptep, &iop->cfg);
>>>>> +                     if (!pte_flush)
>>>>> +                             __arm_lpae_clear_pte(ptep, &iop->cfg, 
>>>>> 1);
>>>>>
>>>>>                       if (!iopte_leaf(pte, lvl, iop->fmt)) {
>>>>>                               /* Also flush any partial walks */
>>>>> @@ -649,10 +663,12 @@ static size_t __arm_lpae_unmap(struct 
>>>>> arm_lpae_io_pgtable *data,
>>>>>                       } else if (!iommu_iotlb_gather_queued(gather)) {
>>>>>                               io_pgtable_tlb_add_page(iop, gather, 
>>>>> iova + i * size, size);
>>>>>                       }
>>>>> -
>>>>> -                     ptep++;
>>>>> +                     if (!pte_flush)
>>>>> +                             ptep++;
>>>>>                       i++;
>>>>>               }
>>>>> +             if (pte_flush)
>>>>> +                     kvfree(pte_flush);
>>>>>
>>>>>               return i * size;
>>>>>       } else if (iopte_leaf(pte, lvl, iop->fmt)) {
>> Hi all,
>>
>> Can you please provide feedback on this patch? Is this optimization
>> worth pursuing?
>>
>> Thanks,
>> Ashish Mhetre
> Hi Robin,
> 
> Can you please share feedback on this? Is more testing required
> for this on non-Tegra platforms? Perhaps shall I send it as RFT ?
> I have used 'dma_map_benchmark' available in kernel to test this.
> Same can be used to test on other platforms.

Apologies I was slightly mistaken before - I confess I was trying to 
remember how the code worked from the patch context alone, and forgot 
that this same path is actually used for clearing leaf entries all the 
way down to L3 as well as freeing tables. So yes, indeed there should be 
something to gain in general from combining the syncs for adjacent leaf 
entries. However we still have the problem that we can't put an 
unconditional allocation in here, so we'd have to do something like 
combine up to the next non-leaf entry and keep the "inline" sync for 
those. Or perhaps it might end up quite a neat compromise overall to do 
your current idea on a smaller scale, with a fixed number of PTEs that's 
reasonable to keep on the stack - even in the worst case, I'd expect to 
still get a fair boost from doing, say, 32 syncs of 2 cachelines each 
vs. 512 that touch each line multiple times.

Thanks,
Robin.


Return-Path: <linux-tegra+bounces-7141-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E7FACCC58
	for <lists+linux-tegra@lfdr.de>; Tue,  3 Jun 2025 19:44:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 40F6216763C
	for <lists+linux-tegra@lfdr.de>; Tue,  3 Jun 2025 17:44:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE11F1C8629;
	Tue,  3 Jun 2025 17:44:12 +0000 (UTC)
X-Original-To: linux-tegra@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B56CB1361
	for <linux-tegra@vger.kernel.org>; Tue,  3 Jun 2025 17:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748972652; cv=none; b=NGeCqjtqVjLPuQD9g6v9CeLvmOgHYEiWID5MmplqmaPQrazAUNnfBWFgVTRp8c3gP89JEOWUOODR4wfeCBrP3r7AW2X4gwXwH5zjSCPWsUBV9CuLlHOXIxVMI7ki6BerVoNJoYFDrQZeKdZLD5m3mvF+zqq9tfo3TkqoPyxBymY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748972652; c=relaxed/simple;
	bh=UTb8ZDSnNnfE4kNWe8QXV+RinSAafNMsCyq+Ic89xNM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DWCr1SitR20xR5LAr01l5kOUubAbp0tbeTRlckT91Ffwbr+sbNCGhFNabqHpWlwZyu8E43fRUqvoORRd3o7vId+QGytS2Bcnm1V9g0BBUtvDHeo+oHtYw/t+s6bq6KE06QUDDt5jtLbUAAZgFwNBEXKZTCTrgLSci/f+nGB9KMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 24B9012FC;
	Tue,  3 Jun 2025 10:43:53 -0700 (PDT)
Received: from [10.57.24.31] (unknown [10.57.24.31])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ABF1B3F5A1;
	Tue,  3 Jun 2025 10:44:07 -0700 (PDT)
Message-ID: <ef7c8bf7-d6b1-4486-bb8c-04d24488ecdc@arm.com>
Date: Tue, 3 Jun 2025 18:43:49 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] EMEM address decode error when using Tegra210 media
 engines
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, Jason Gunthorpe <jgg@ziepe.ca>
Cc: thierry.reding@gmail.com, vdumpa@nvidia.com, joro@8bytes.org,
 will@kernel.org, jonathanh@nvidia.com, baolu.lu@linux.intel.com,
 jsnitsel@redhat.com, jroedel@suse.de, regressions@lists.linux.dev,
 linux-tegra@vger.kernel.org, iommu@lists.linux.dev
References: <62e7f7fe-6200-4e4f-ad42-d58ad272baa6@tecnico.ulisboa.pt>
 <20250603153257.GB407166@ziepe.ca>
 <46ef896e-9b73-437f-bfa9-4dcae5089028@tecnico.ulisboa.pt>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <46ef896e-9b73-437f-bfa9-4dcae5089028@tecnico.ulisboa.pt>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2025-06-03 5:52 pm, Diogo Ivo wrote:
> 
> On 6/3/25 4:32 PM, Jason Gunthorpe wrote:
>> On Tue, Jun 03, 2025 at 04:06:47PM +0100, Diogo Ivo wrote:
>>> Hello,
>>>
>>> Commit 50568f87d1e233e introduced a regression when trying to use the 
>>> media
>>> accelerators present on the Tegra X1 SoC.
>>>
>>> I came across this regression when testing the branch [1] that leverages
>>> the NVJPG engine in the Tegra X1 for decoding a JPEG file. After commit
>>> 50568f87d1e233e we see the following error messages after submitting 
>>> a job
>>> through the TEGRA_CHANNEL_SUBMIT IOCTL:
>>
>> Maybe this?
>>
>> @@ -567,7 +567,7 @@ static void tegra_smmu_set_pde(struct 
>> tegra_smmu_as *as, unsigned long iova,
>>          /* The flush the page directory entry from caches */
>>          dma_sync_single_range_for_device(smmu->dev, as->pd_dma, offset,
>> -                                        sizeof(*pd), DMA_TO_DEVICE);
>> +                                        sizeof(pd->val[0]), 
>> DMA_TO_DEVICE);
>>          /* And flush the iommu */
>>          smmu_flush_ptc(smmu, as->pd_dma, offset);
>>
>> It is the only mistake I was able to notice.
>>
>> But I'd be puzzled - I'd expect bigger sizeof would make it slower not
>> broken.. Though your crash sure looks like either missing cache
>> coherency or a bad PTE construction.

I reckon the "unsigned long offset = pd_index * sizeof(*pd);" a few 
lines above is probably more impactful ;)

Robin.

>>
> 
> With this change there is still an error:
> 
> [   21.794016] tegra-mc 70019000.memory-controller: nvjpgsrd: read 
> @0x00000000ffffbe00: EMEM address decode error (SMMU translation error 
> [--S])
> [   21.804409] tegra-mc 70019000.memory-controller: nvjpgsrd: read 
> @0x00000000ffffbe00: Page fault (SMMU translation error [--S])
> 
> the difference being that we only get it for one address compared to the
> previous log.
> 
> Diogo



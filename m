Return-Path: <linux-tegra+bounces-7150-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB75ACCCB0
	for <lists+linux-tegra@lfdr.de>; Tue,  3 Jun 2025 20:14:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4756216D64E
	for <lists+linux-tegra@lfdr.de>; Tue,  3 Jun 2025 18:14:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E55124BBEB;
	Tue,  3 Jun 2025 18:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="ljBy3W9C"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAED11E570D
	for <linux-tegra@vger.kernel.org>; Tue,  3 Jun 2025 18:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748974488; cv=none; b=dETJC33ucnuSQ8oANQno3wY8yn4sk6jTzlJYsR1rQ9s9QZjZh2MF0xdbaFS+iSb5eD7Dk3UOQYBFgV/F/Qjk8e784a9fhVunY3movIeanvtAwwIKGGemkTf8DVDHezSQUqrd01/Q1fkomY1ls+mAytLPNUTkfOIpmjNDUEw3kXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748974488; c=relaxed/simple;
	bh=9vyQ/hWBeMaP41xxr4+/F5bsqXNx99oAM5mI/eDGL7Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cjTI/pvGvUvOvwK8fjhEDZ0+Wl4Pu3Uk/bxMK8rcV4u2xD9UCRzR45Rt/9cQ0JDd/wikD93oYyKjcQnygrI8hF4T4Z8DjKhJ8EJsHxXvneWhO8Wvz1dfTVfhrjPafgfLacwLWA+xHNDO7T6wWYGLwHTP/W4YIsggFopy1m4+Qy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=ljBy3W9C; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id D17BC60022E8;
	Tue,  3 Jun 2025 19:14:43 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id c0RF1RHjHWYO; Tue,  3 Jun 2025 19:14:41 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id CDECA60022ED;
	Tue,  3 Jun 2025 19:14:40 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail; t=1748974481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lJrKSQdj7mdla0nMevQ8JAjDOQ8LmBYVi6tQmOOTlzA=;
	b=ljBy3W9C3kHWU0lywMHhq8oxERm3bvvCgLWWwFwbMVquLDnSYt6JSQPzHX+RzVaQ9LFczn
	dndCjakGLddLxjGSN4hW7C5q/boGOtR9bJ1MwuAUBWtLjPkawwfuJGhNJ9H6x3V5BpM8fp
	IKqQvIMCtkRq82lfSEcn953HW1eabsk=
Received: from [IPV6:2001:8a0:57db:f00:3ee2:38aa:e2c9:7dde] (unknown [IPv6:2001:8a0:57db:f00:3ee2:38aa:e2c9:7dde])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 80A5D360092;
	Tue,  3 Jun 2025 19:14:39 +0100 (WEST)
Message-ID: <1aa9892f-38f6-4d75-b840-c525f24cf934@tecnico.ulisboa.pt>
Date: Tue, 3 Jun 2025 19:14:38 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] EMEM address decode error when using Tegra210 media
 engines
To: Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>
Cc: thierry.reding@gmail.com, vdumpa@nvidia.com, joro@8bytes.org,
 will@kernel.org, jonathanh@nvidia.com, baolu.lu@linux.intel.com,
 jsnitsel@redhat.com, jroedel@suse.de, regressions@lists.linux.dev,
 linux-tegra@vger.kernel.org, iommu@lists.linux.dev
References: <62e7f7fe-6200-4e4f-ad42-d58ad272baa6@tecnico.ulisboa.pt>
 <20250603153257.GB407166@ziepe.ca>
 <46ef896e-9b73-437f-bfa9-4dcae5089028@tecnico.ulisboa.pt>
 <ef7c8bf7-d6b1-4486-bb8c-04d24488ecdc@arm.com>
Content-Language: en-US
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
In-Reply-To: <ef7c8bf7-d6b1-4486-bb8c-04d24488ecdc@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/3/25 6:43 PM, Robin Murphy wrote:
> On 2025-06-03 5:52 pm, Diogo Ivo wrote:
>>
>> On 6/3/25 4:32 PM, Jason Gunthorpe wrote:
>>> On Tue, Jun 03, 2025 at 04:06:47PM +0100, Diogo Ivo wrote:
>>>> Hello,
>>>>
>>>> Commit 50568f87d1e233e introduced a regression when trying to use 
>>>> the media
>>>> accelerators present on the Tegra X1 SoC.
>>>>
>>>> I came across this regression when testing the branch [1] that 
>>>> leverages
>>>> the NVJPG engine in the Tegra X1 for decoding a JPEG file. After commit
>>>> 50568f87d1e233e we see the following error messages after submitting 
>>>> a job
>>>> through the TEGRA_CHANNEL_SUBMIT IOCTL:
>>>
>>> Maybe this?
>>>
>>> @@ -567,7 +567,7 @@ static void tegra_smmu_set_pde(struct 
>>> tegra_smmu_as *as, unsigned long iova,
>>>          /* The flush the page directory entry from caches */
>>>          dma_sync_single_range_for_device(smmu->dev, as->pd_dma, offset,
>>> -                                        sizeof(*pd), DMA_TO_DEVICE);
>>> +                                        sizeof(pd->val[0]), 
>>> DMA_TO_DEVICE);
>>>          /* And flush the iommu */
>>>          smmu_flush_ptc(smmu, as->pd_dma, offset);
>>>
>>> It is the only mistake I was able to notice.
>>>
>>> But I'd be puzzled - I'd expect bigger sizeof would make it slower not
>>> broken.. Though your crash sure looks like either missing cache
>>> coherency or a bad PTE construction.
> 
> I reckon the "unsigned long offset = pd_index * sizeof(*pd);" a few 
> lines above is probably more impactful ;)

Yes, that fixes it :)

Diogo


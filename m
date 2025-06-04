Return-Path: <linux-tegra+bounces-7173-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB1FACDB9C
	for <lists+linux-tegra@lfdr.de>; Wed,  4 Jun 2025 12:04:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A10533A4320
	for <lists+linux-tegra@lfdr.de>; Wed,  4 Jun 2025 10:04:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E98D28C85D;
	Wed,  4 Jun 2025 10:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="gPsK7tna"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA9F238C06
	for <linux-tegra@vger.kernel.org>; Wed,  4 Jun 2025 10:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749031473; cv=none; b=nsXpPVga0M1EQMEFj0+ABEMbHRzLuU8VgpJsfGZai1jZvUagyPlBhT4GDj5S6yaIo+txtJVQxw1mGxJNaaEukReBgP0WiaBNZDz4kSZUYj1IObBmHUodbuxyhCOPVguRlqMOlqjvqmc4v8KOgf9OqQFajU1P/vdFgx1hklat7H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749031473; c=relaxed/simple;
	bh=c6iNIx72UNMmJVTCkfgT/1P4wdsSf5JMfqG3qSXP2wA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j1LXNZmuVIGG34a1bubYlvudyWuDkrRotHF56Qz5tNHomKJRfOAClnGNP6uR8pi8rJSFS35dp79+ss5uOhIt1L0m0WEAXLlR4du5Hhw1oDUIJ0sZi0C2Sj6te7tPrk5axNKCNOkshmVvdicruKdHctq1nKmCRmZFQUQpGQLweTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=gPsK7tna; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 46184600230C;
	Wed,  4 Jun 2025 11:04:28 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id CcyCaA5SXgS9; Wed,  4 Jun 2025 11:04:25 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 89B626003033;
	Wed,  4 Jun 2025 11:04:24 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail; t=1749031464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=krMQNZUb+DoZ25aZwWJ+Z+Q6ZnY6TUDZtR3D+HpWcUo=;
	b=gPsK7tnaMaoxm469r12223mYkxDEuyxiyQ+kCcrrzSq8AdGGu7ahFglicFlbPnRnYX2Mvq
	VhBc0Spag6wIwdIJdtj7GWQ8Mm1nREFS0EmX3dYyDgdsgR9rQGaa1kLPXH1SJhLF11YPrc
	NWrk/oPLhPnvGbC8wBjZ49giYpkPTNQ=
Received: from [IPV6:2001:8a0:57db:f00:3ee2:38aa:e2c9:7dde] (unknown [IPv6:2001:8a0:57db:f00:3ee2:38aa:e2c9:7dde])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 8E7D4360084;
	Wed,  4 Jun 2025 11:04:23 +0100 (WEST)
Message-ID: <e3a4af61-b647-402e-801d-73862679c084@tecnico.ulisboa.pt>
Date: Wed, 4 Jun 2025 11:04:22 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH rc] iommu/terga: Fix incorrect size calculation
To: Jason Gunthorpe <jgg@nvidia.com>, iommu@lists.linux.dev,
 Jonathan Hunter <jonathanh@nvidia.com>, Joerg Roedel <joro@8bytes.org>,
 linux-tegra@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
 Thierry Reding <thierry.reding@gmail.com>, Krishna Reddy
 <vdumpa@nvidia.com>, Will Deacon <will@kernel.org>
Cc: Joerg Roedel <jroedel@suse.de>, patches@lists.linux.dev
References: <0-v1-da7b8b3d57eb+ce-iommu_terga_sizeof_jgg@nvidia.com>
Content-Language: en-US
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
In-Reply-To: <0-v1-da7b8b3d57eb+ce-iommu_terga_sizeof_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/3/25 8:14 PM, Jason Gunthorpe wrote:
> This driver uses a mixture of ways to get the size of a PTE,
> tegra_smmu_set_pde() did it as sizeof(*pd) which became wrong when pd
> switched to a struct tegra_pd.
> 
> Switch pd back to a u32* in tegra_smmu_set_pde() so the sizeof(*pd)
> returns 4.
> 
> Fixes: 50568f87d1e2 ("iommu/terga: Do not use struct page as the handle for as->pd memory")
> Reported-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> Closes: https://lore.kernel.org/all/62e7f7fe-6200-4e4f-ad42-d58ad272baa6@tecnico.ulisboa.pt/
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>   drivers/iommu/tegra-smmu.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
> index 61897d50162dd7..e58fe9d8b9e77e 100644
> --- a/drivers/iommu/tegra-smmu.c
> +++ b/drivers/iommu/tegra-smmu.c
> @@ -559,11 +559,11 @@ static void tegra_smmu_set_pde(struct tegra_smmu_as *as, unsigned long iova,
>   {
>   	unsigned int pd_index = iova_pd_index(iova);
>   	struct tegra_smmu *smmu = as->smmu;
> -	struct tegra_pd *pd = as->pd;
> +	u32 *pd = &as->pd->val[pd_index];
>   	unsigned long offset = pd_index * sizeof(*pd);
>   
>   	/* Set the page directory entry first */
> -	pd->val[pd_index] = value;
> +	*pd = value;
>   
>   	/* The flush the page directory entry from caches */
>   	dma_sync_single_range_for_device(smmu->dev, as->pd_dma, offset,
> 
> base-commit: 7d4dfa6140f75b67f8eff3ae6ebc9937be94c4d3

Just to be explicit about it:

Tested-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>


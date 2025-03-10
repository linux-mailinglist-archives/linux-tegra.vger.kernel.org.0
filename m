Return-Path: <linux-tegra+bounces-5523-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A50AFA594E9
	for <lists+linux-tegra@lfdr.de>; Mon, 10 Mar 2025 13:44:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B01E33AE9E3
	for <lists+linux-tegra@lfdr.de>; Mon, 10 Mar 2025 12:43:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB5B52288F9;
	Mon, 10 Mar 2025 12:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="nzFN2P0q"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B93227B95
	for <linux-tegra@vger.kernel.org>; Mon, 10 Mar 2025 12:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741610480; cv=none; b=Ge9csmoau3yqiu1vPPpCgMxcL5vnx5vGgK4VUU5JxAKLLnZKCunXRHfczKusXDTi1LqNRBF0N/aGmNGPbLUIMUJElEGoGWxcT7182EETyN4qCDYyMYdlXqaR45SVPf6Sy3X0Cj+p3zVEGbzW0cdp0xDiSu+f+UOs2L3aAUPtjC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741610480; c=relaxed/simple;
	bh=7y+Ce3En3FYPPydb2HFzABw4vaWNGqVitA3xGTZeeEQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fGCttC/iAWnu0WcQ6jOz6UXw2TFDAHVuYiDyVpaFMdRKZRJ9dzUPsb+oj9Phg/fOZ9J31oRj+mdB/L4CKMlMWe7lixGnPKxKEJqPu7pqqIYoedAmRq6lXLyqNDpALGfMjzQyqdq7tGZ0RiuTgYydQtD7LnVGhaAt8+TUvXzICcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=nzFN2P0q; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 87D63600302B;
	Mon, 10 Mar 2025 12:34:41 +0000 (WET)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id WKBhROGT4aPH; Mon, 10 Mar 2025 12:34:38 +0000 (WET)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 5C2506000230;
	Mon, 10 Mar 2025 12:34:38 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail; t=1741610078;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nm9bV3SCT7LdcvOrvp1YJMQOgiJT5opS8tBpLu2IzIw=;
	b=nzFN2P0qNrK3M1M7HF/Fw6LYlMHSE5FIdkCtc5prG+gsIvEO9b9ZJAFuO4ItDYXiGOlW8D
	C4yUwhxMJkt13OZx9r6JOXE4lY+K8M6ndjpO8x1UBNVkC+ZZHvgAyLS2yBQe+Ipc+19KVy
	OMGsGXWRyldKgtfTQd8aLim7EQQqiB8=
Received: from [IPV6:2001:8a0:57db:f00:3ee2:38aa:e2c9:7dde] (unknown [IPv6:2001:8a0:57db:f00:3ee2:38aa:e2c9:7dde])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 89AC73600D1;
	Mon, 10 Mar 2025 12:34:37 +0000 (WET)
Message-ID: <19478509-5007-4a20-9512-b965126b7026@tecnico.ulisboa.pt>
Date: Mon, 10 Mar 2025 12:34:35 +0000
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH rc] gpu: host1x: Do not assume that a NULL domain means no
 DMA IOMMU
To: Jason Gunthorpe <jgg@nvidia.com>, David Airlie <airlied@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 Mikko Perttunen <mperttunen@nvidia.com>, Simona Vetter <simona@ffwll.ch>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: Lu Baolu <baolu.lu@linux.intel.com>, Joerg Roedel <jroedel@suse.de>,
 Jerry Snitselaar <jsnitsel@redhat.com>, patches@lists.linux.dev,
 regressions@lists.linux.dev
References: <0-v1-10dcc8ce3869+3a7-host1x_identity_jgg@nvidia.com>
Content-Language: en-US
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
In-Reply-To: <0-v1-10dcc8ce3869+3a7-host1x_identity_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Hello again,

On 2/4/25 7:18 PM, Jason Gunthorpe wrote:
> Previously with tegra-smmu, even with CONFIG_IOMMU_DMA, the default domain
> could have been left as NULL. The NULL domain is specially recognized by
> host1x_iommu_attach() as meaning it is not the DMA domain and
> should be replaced with the special shared domain.
> 
> This happened prior to the below commit because tegra-smmu was using the
> NULL domain to mean IDENTITY.
> 
> Now that the domain is properly labled the test in DRM doesn't see NULL.
> Check for IDENTITY as well to enable the special domains.
> 
> This is the same issue and basic fix as seen in
> commit fae6e669cdc5 ("drm/tegra: Do not assume that a NULL domain means no
> DMA IOMMU").
> 
> Fixes: c8cc2655cc6c ("iommu/tegra-smmu: Implement an IDENTITY domain")
> Reported-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> Closes: https://lore.kernel.org/all/c6a6f114-3acd-4d56-a13b-b88978e927dc@tecnico.ulisboa.pt/
> Tested-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Any news on this patch or any other solutions for this regression? It's
not great if this falls through the cracks, especially when there is a
solution for the problem.

Thanks,
Diogo


Return-Path: <linux-tegra+bounces-13653-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJcMCHOr12lKRQgAu9opvQ
	(envelope-from <linux-tegra+bounces-13653-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Thu, 09 Apr 2026 15:36:51 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FC73CB553
	for <lists+linux-tegra@lfdr.de>; Thu, 09 Apr 2026 15:36:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 65C103011C77
	for <lists+linux-tegra@lfdr.de>; Thu,  9 Apr 2026 13:21:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E65183D5255;
	Thu,  9 Apr 2026 13:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jldMy/Rg"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDE43C7E0C;
	Thu,  9 Apr 2026 13:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775740702; cv=none; b=BxBHfM8jjAWA2m4bQ1MJUU77tbKVzQcvqpWQStsCPE6lsM1LTXywSP9jIJilEfFlakWLA6V0SUr6sPrSQE+9FselWPKW9LhiywKXa0Voi7n91VvfwRDL9IrKosg4Qs6vdsXvVLzS3e5J8dnNxsCj3PA8Mj1g/j5bhB1gT0Xu94Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775740702; c=relaxed/simple;
	bh=GDPcSa8tnotnEXke8Dmj/8tOBXd3u80we22k4SktPrE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GVpP345dtH4kU8TVmUBQxQGymEqdXugwpA4zh/PU+A+dmz9kofXmN996zr07a51QTmuWjiW1NyAMJJIjqiu4EiKT/JFS9nqRoxPmdsTB+4oFyDRicE+PR7feDnW/C1V39MlBMfIT2eGbpkVk0QIDNsw4ss2fi3zm8ZGXJXEAVtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jldMy/Rg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C9DAC4CEF7;
	Thu,  9 Apr 2026 13:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775740702;
	bh=GDPcSa8tnotnEXke8Dmj/8tOBXd3u80we22k4SktPrE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jldMy/RgQ9PoozOj7YSNL+9E9O7hoCjMuQfN084OAqb/Ed2tYi5G3TsdvN1xHyAzJ
	 frymBq+0+imGMDTptONjjPU4FIBYYMecrHJGOZGY7llLM2YHAnh4G5SAaxAd3GONPr
	 2SiiHHKwNyfL6oQIJeOXbISJAp6S9YaUwyVa1LMXjeleRK7StisZ87kfeB8R9+T5HB
	 g9cbqGJG+NRcBwq2XxT3PoddRJyQ3papcMYNkZ3NMbxx91zwqRq1TcxSV9HN7Qp6xm
	 u8IAnhLNUwy69CeVhY+Ti1+EuEjNGu77NYk0kw0/dCITFb3PwSquz0VWGlwQfeP86i
	 5r+DV3RZpR65w==
Date: Thu, 9 Apr 2026 14:18:17 +0100
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: joro@8bytes.org, iommu@lists.linux.dev, linux-tegra@vger.kernel.org,
	Jon Hunter <jonathanh@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
	Russell King <rmk+kernel@armlinux.org.uk>
Subject: Re: [PATCH v2] iommu: Ensure .iotlb_sync is called correctly
Message-ID: <adenGd5d9BxNq_cR@willie-the-truck>
References: <3eed961d41d3a81460031dee9f1db066f1d2e111.1775739433.git.robin.murphy@arm.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3eed961d41d3a81460031dee9f1db066f1d2e111.1775739433.git.robin.murphy@arm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13653-lists,linux-tegra=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[will@kernel.org,linux-tegra@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra,kernel];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nvidia.com:email,armlinux.org.uk:email]
X-Rspamd-Queue-Id: 76FC73CB553
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 09, 2026 at 01:59:41PM +0100, Robin Murphy wrote:
> Many drivers have no reason to use the iotlb_gather mechanism, but do
> still depend on .iotlb_sync being called to properly complete an unmap.
> Missing or incomplete TLB maintenance at this point can then wreak all
> kinds of havoc, particularly in strict DMA mode where IOVAs may be
> reused right away, if DMA traffic for a subsequent new mapping hits a
> stale TLB entry and goes to the wrong physical address.
> 
> Since the core code is now relying on the gather to detect when there
> is legitimately something to sync, it should also take care of encoding
> a successful unmap when the driver does not touch the gather itself.
> 
> Fixes: 90c5def10bea ("iommu: Do not call drivers for empty gathers")
> Reported-by: Jon Hunter <jonathanh@nvidia.com>
> Closes: https://lore.kernel.org/r/8800a38b-8515-4bbe-af15-0dae81274bf7@nvidia.com
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Tested-by: Jon Hunter <jonathanh@nvidia.com>
> Tested-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
> v2: Add tags, clarify implications in commit message [rmk]

Sorry, this raced with me queuing the v1 but I have included some
commentary about the implications in the tag.

Will


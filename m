Return-Path: <linux-tegra+bounces-11753-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4G1REAnKfWnnTgIAu9opvQ
	(envelope-from <linux-tegra+bounces-11753-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Sat, 31 Jan 2026 10:23:21 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4A5C1591
	for <lists+linux-tegra@lfdr.de>; Sat, 31 Jan 2026 10:23:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E6B5A300B9B9
	for <lists+linux-tegra@lfdr.de>; Sat, 31 Jan 2026 09:23:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52141314B84;
	Sat, 31 Jan 2026 09:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="386OtMbc"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C78F827AC45;
	Sat, 31 Jan 2026 09:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769851396; cv=none; b=RIfgwKZ0oP4QHfyHnZIdxuE7d8Duc8KbcNtv86eu16UG5O7MhL/O0IxnHdQm8HZ9zWUeYObRlrlrjtg/zMmy0aWIQWzGON6VPPIoUwhWhZ8wlZr7BLHzwDOimQyl70kz5iyc02qpJMueUiV0sm/d2/hbfFGdbNqw0yd07iiejeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769851396; c=relaxed/simple;
	bh=oq9EKKdg93DkudeARIZwtKEHxeGstm9HG6iU9TSazns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ROVT35EWJqxqeJroMgXeJJFa1CKJRfzNhKPEDJwVSnU9rXL3YZcDjQY6toibGM9B/0AbsbuYd0ec5bp2eGE2LlYiJ55WpJz2ZOVkvnkOezvsULnXQxQvPpPMlVAXsS0v4U33YlPo4QQXEPEAgFXaKYDqQHe3LfDSTGEwExVxx/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=386OtMbc; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (unknown [IPv6:2001:67c:1810:f051:57e6:3c1a:1909:f41d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id DCAFF5C784;
	Sat, 31 Jan 2026 10:23:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1769851388;
	bh=oq9EKKdg93DkudeARIZwtKEHxeGstm9HG6iU9TSazns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=386OtMbcoCIT9uW9KBmYrAmNmaWlPUrk7hOHA4+rnI0vTlSAnxSYkPrD9B9/Oy317
	 ZSjZBo1yAAqtcYgKAJ3pGMG1XML3bn22Z5+0srlen97ffG2+EP0hGkWxc1bWwjARjO
	 TzXqqymqQS51qamNH2Bkvl4ONngc4mSC+BvNRCbkukxHjdOFjDvGFYePMJlxiA7FIe
	 Kx9anYrtLNHT+fOIBOfQ17yN+CRLQMeCt8+lwvcAUpg8rCbOQxPOYCMt6qcVd+tHmL
	 GUZR1oKljzoHcH3wKN/kZS26Nu/QAqxsF9S7mFg92KeYqmdV6jAZSimQdVhyhCcrkK
	 Wq4MERPytoOGA==
Date: Sat, 31 Jan 2026 10:23:05 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, jgg@nvidia.com, robin.murphy@arm.com, 
	linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, ncqb@google.com
Subject: Re: [PATCH rc] iommu/tegra241-cmdqv: Reset VCMDQ in
 tegra241_vcmdq_hw_init_user()
Message-ID: <x75l7ibr4o45dfdmdxlpefusks4maovaf3ugukcxuszd4dvmx3@w3hmrgo4e4qb>
References: <20260129224341.1594785-1-nicolinc@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129224341.1594785-1-nicolinc@nvidia.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.39 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.77)[subject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[8bytes.org:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[8bytes.org: no valid DMARC record];
	TAGGED_FROM(0.00)[bounces-11753-lists,linux-tegra=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[8bytes.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joro@8bytes.org,linux-tegra@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nvidia.com:email,8bytes.org:dkim]
X-Rspamd-Queue-Id: 9B4A5C1591
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 02:43:41PM -0800, Nicolin Chen wrote:
> Fixes: 6717f26ab1e7 ("iommu/tegra241-cmdqv: Add user-space use support")
> Cc: stable@vger.kernel.org
> Reported-by: Bao Nguyen <ncqb@google.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c | 3 +++
>  1 file changed, 3 insertions(+)

Applied, thanks.


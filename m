Return-Path: <linux-tegra+bounces-13181-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AC7BJE2Pw2mCrgQAu9opvQ
	(envelope-from <linux-tegra+bounces-13181-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Wed, 25 Mar 2026 08:31:25 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 25539320B8E
	for <lists+linux-tegra@lfdr.de>; Wed, 25 Mar 2026 08:31:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C540D3021720
	for <lists+linux-tegra@lfdr.de>; Wed, 25 Mar 2026 07:31:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A36E736683B;
	Wed, 25 Mar 2026 07:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s9M27qkL"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8E035294F;
	Wed, 25 Mar 2026 07:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774423861; cv=none; b=PeS9Hsthxm28nOXfDoOKN7Qf3st7zTg5z/HAkCJvj6XU1jy27sl9R5oWdjdTV5wwYygZOvLl0hR4nlQWnUw9lrXBWnERrXyavHSj4ACQ6Oj4ShXSbxSNFCYzemdMDC1SveXorvNW2VJk23mtF8p1PEErtmcIvgF6NKmtFhqD1pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774423861; c=relaxed/simple;
	bh=T+WQgv6CGi+A2a07WHGeBTAyLZMIg8BE4jhyIRJvFaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H3zd6+f7Nc1WfD9OZrbJZQLGInLaKp8HdYGGVqf5V5Bseu3HG48+HZGEJSwJhGC+puysFn1l+FbqoMVafcR3Fy3RwNERe9it4ITrprEy0Grv8LCSqtRwxuuy+Ea1muM1e4VBpJw12w7gIMjHNhhRW3Hi6RBz1cz6+Pd+kx73FEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s9M27qkL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D85FC4CEF7;
	Wed, 25 Mar 2026 07:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774423860;
	bh=T+WQgv6CGi+A2a07WHGeBTAyLZMIg8BE4jhyIRJvFaQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s9M27qkLmEGWvBvR/99BjIjP4EQ/GNcAWrKW7BuEV8n0Ooc5Lvi/yU6UhuTpUxipV
	 KW4mNrQCY14i0iL/mhYBbBNr3C3rPc5S7RBe7/tX8HvdiiDGhX3YzrrG3M1u1uskZM
	 H9IvEYOYdPeC9mAYsfWct6aDT68gVWHaO48gpLneyTCMPFDZsQrpcEsnSD6rzxETh/
	 DGuj7Fit/+3VqysvE/afnxeKh0gJSfQLPEPWuAipoBwm3EEm2+xUprAxRLcjVP8B/D
	 OPc9crQA70LAr2H9zYOWAQI6k3g/Lg950HPJ1x4TCkANKHqqiWu1wLbvxSdrpowUaa
	 HriffsIDXsKrQ==
Date: Wed, 25 Mar 2026 08:30:56 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-ide@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ata: ahci_tegra: remove kcalloc
Message-ID: <acOPMJVsxpBltqGX@ryzen>
References: <20260324211629.26924-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324211629.26924-1-rosenp@gmail.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-13181-lists,linux-tegra=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,nvidia.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cassel@kernel.org,linux-tegra@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 25539320B8E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello Rosen,

subject is a bit misleading:
"remove kcalloc"
you are removing devm_kcalloc(), so device managed.


On Tue, Mar 24, 2026 at 02:16:29PM -0700, Rosen Penev wrote:
> Combine allocations into one by using a flexible array member.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/ata/ahci_tegra.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/ata/ahci_tegra.c b/drivers/ata/ahci_tegra.c
> index 44584eed6374..5972fe04ff3f 100644
> --- a/drivers/ata/ahci_tegra.c
> +++ b/drivers/ata/ahci_tegra.c
> @@ -175,8 +175,9 @@ struct tegra_ahci_priv {
>  	struct reset_control	   *sata_cold_rst;
>  	/* Needs special handling, cannot use ahci_platform */
>  	struct clk		   *sata_clk;
> -	struct regulator_bulk_data *supplies;
>  	const struct tegra_ahci_soc *soc;
> +
> +	struct regulator_bulk_data supplies[];

Personally I'm not a big fan of flexible array members, as there can be
only one. And if you use it you want to use counted_by().

Yes, there are two device managed allocations. But is that so bad?

Since it is device managed, it will get freed on device removal anyway.


Kind regards,
Niklas


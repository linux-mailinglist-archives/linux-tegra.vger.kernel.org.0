Return-Path: <linux-tegra+bounces-11848-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJW5LCRBh2nVVQQAu9opvQ
	(envelope-from <linux-tegra+bounces-11848-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Sat, 07 Feb 2026 14:41:56 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E0E10605E
	for <lists+linux-tegra@lfdr.de>; Sat, 07 Feb 2026 14:41:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BDA8330156C2
	for <lists+linux-tegra@lfdr.de>; Sat,  7 Feb 2026 13:41:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C11B4341AB8;
	Sat,  7 Feb 2026 13:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="bLRbM2YY"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D3B341AB0;
	Sat,  7 Feb 2026 13:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770471697; cv=none; b=eITX8w2boEd/fmHLKR4fjglXLu+9LMG2myd6EaS/lpJQhsJhDFqMXeGb5bVTQb9+Ebn49lHLCA+a2jy30JPPn4Dl/G5aJgmrvQxt5ZZzZLGMkPbnXkzHhbqg3A0o0j2KYtUXebphhajB+AYVUQTIHWiWpitQuPhZOEbxxbVs00I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770471697; c=relaxed/simple;
	bh=4I2vxLMvMa/4tBkb69vcMjaYvVnfV7MPwo11euXXKFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uSqgyRYPXnECp3LljqBIy18eH1wyiIbTl3RKbqcVpkThQxRjreLAteYLl3VbIlkMEIgIPJJvuSAmr0vReM7T09LPILqDT0xZ4Ptz8bwFydm1miE6GRG97ii3cXYtd5G7hWemto2QyAAyIazOcWpQNO8LpHOYyLUsEtKo1Dgyk5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=bLRbM2YY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9243CC116D0;
	Sat,  7 Feb 2026 13:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770471697;
	bh=4I2vxLMvMa/4tBkb69vcMjaYvVnfV7MPwo11euXXKFw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bLRbM2YYAawQcevk4TO2T4zWaZAmmyIlZ6oPbZTJP2y32HLX7bebx2qPtpdXV2VRp
	 eoeNp3dAvL1qt/eCc2S3nVCCNXET+ug1B+MFr2ycAeLFNEZsqwux/VikKPJH2zXKlh
	 /HvvLjyFh/rnSnsQM9uYMcSiAq6OKFhKkXZ/HUDo=
Date: Sat, 7 Feb 2026 14:41:33 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Artem Lytkin <iprintercanon@gmail.com>
Cc: Marc Dietrich <marvin24@gmx.de>, ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: nvec: use strcmp() instead of strncmp() with
 magic length
Message-ID: <2026020754-finalist-unbent-f4fd@gregkh>
References: <20260205234632.1964-1-iprintercanon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205234632.1964-1-iprintercanon@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11848-lists,linux-tegra=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmx.de,lists.launchpad.net,vger.kernel.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-tegra@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-tegra];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 32E0E10605E
X-Rspamd-Action: no action

On Thu, Feb 05, 2026 at 11:46:32PM +0000, Artem Lytkin wrote:
> Replace strncmp() with a hardcoded length of 30 with strcmp().
> The bat_type string is already null-terminated (set two lines above),
> so strncmp() with an arbitrary length is misleading and functionally
> equivalent to strcmp().
> 
> Signed-off-by: Artem Lytkin <iprintercanon@gmail.com>
> ---
>  drivers/staging/nvec/nvec_power.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/nvec/nvec_power.c b/drivers/staging/nvec/nvec_power.c
> index 2faab9fde..89dd997aa 100644
> --- a/drivers/staging/nvec/nvec_power.c
> +++ b/drivers/staging/nvec/nvec_power.c
> @@ -207,7 +207,7 @@ static int nvec_power_bat_notifier(struct notifier_block *nb,
>  		 * This differs a little from the spec fill in more if you find
>  		 * some.
>  		 */
> -		if (!strncmp(power->bat_type, "Li", 30))
> +		if (!strcmp(power->bat_type, "Li"))

Now the checking tools that look for "strcmp() is bad!" will come along
and someone will send a patch that essencially reverts this :)

Please just leave this as-is, it's really fine and is not broken, right?

thanks,

greg k-h


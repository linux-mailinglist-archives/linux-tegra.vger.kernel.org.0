Return-Path: <linux-tegra+bounces-12680-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJwWLxD4rmnZKgIAu9opvQ
	(envelope-from <linux-tegra+bounces-12680-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Mon, 09 Mar 2026 17:40:48 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E68623CE11
	for <lists+linux-tegra@lfdr.de>; Mon, 09 Mar 2026 17:40:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E129B300BBB9
	for <lists+linux-tegra@lfdr.de>; Mon,  9 Mar 2026 16:40:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A31D33B8948;
	Mon,  9 Mar 2026 16:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WERtxANT"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B61C3A9D8A;
	Mon,  9 Mar 2026 16:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773074446; cv=none; b=NHKFklcGky28r1nOXh6zPxB0QJ8q5iZXEPAMEIZi3tewsReww/X6B0qEdAqyjjxULsYlVvlFLmjKPAwCP/FDgHXnLQwMAWoIjcoPojR5+fh7b0BiNxQmPZBr9OtA3E2MjqmYICEG03vzWsVxoR3VsawTnthOMt09UrmTrR9oFs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773074446; c=relaxed/simple;
	bh=v9zpzo6QVhWYqFPLJMzQmIGNKcHXo0KX6tcAhLVt8Ik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qLuGdqpcTTLM6ZuEOxYqjOCww6WoxNN86i9hkGPnJoUmhUho5Mca8t1dGrOvMh/ztjd/frE/aJ/EtcXcUkXMRr7Z6nrmH1AsixWZoi0cXj2d4K4+NziLb6F5A0qaj9KXLfIDAsrMHUZy8zCP4wc0TjFOzVQX2Y3Ug8WJIrWU3gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=WERtxANT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5360C4CEF7;
	Mon,  9 Mar 2026 16:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773074446;
	bh=v9zpzo6QVhWYqFPLJMzQmIGNKcHXo0KX6tcAhLVt8Ik=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WERtxANTtcJQYS8ib1tGXCGkHQisGy9HXwAC/AfhYsS7/trXyly9gPKRruRKEQba6
	 29pEJiT0FhX9K/WYE1AmMCKokM/SpdEGf0NS/murHTQZPN/2qRAapRRjW4Nbfz9Oc4
	 BNNzVJHpRNwPs2emUZjfslPJoddyQNEi71gK32T4=
Date: Mon, 9 Mar 2026 17:40:43 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
Cc: marvin24@gmx.de, linux-staging@lists.linux.dev,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: nvec: fix block comment style in nvec.c
Message-ID: <2026030929-uncheck-reclining-315b@gregkh>
References: <20260304191853.4500-1-rayfraytech@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304191853.4500-1-rayfraytech@gmail.com>
X-Rspamd-Queue-Id: 5E68623CE11
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12680-lists,linux-tegra=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmx.de,lists.linux.dev,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.124];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-tegra@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-tegra];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,linuxfoundation.org:dkim]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 08:18:53PM +0100, Oskar Ray-Frayssinet wrote:
> Fix block comment formatting to use * on subsequent lines
> and */ on a separate line as required by kernel coding style.
> 
> Signed-off-by: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
> ---
>  drivers/staging/nvec/nvec.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
> index e9af66a08448..ee2715df3b48 100644
> --- a/drivers/staging/nvec/nvec.c
> +++ b/drivers/staging/nvec/nvec.c
> @@ -646,7 +646,7 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
>  			nvec->state = 2;
>  		}
>  		break;
> -	case 2:		/* first byte after command */
> +	case 2:		/* First byte after command */

THis change is not what you document above as being changed :(



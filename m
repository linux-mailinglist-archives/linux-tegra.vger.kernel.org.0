Return-Path: <linux-tegra+bounces-12878-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yHTiF2+/umkGbgIAu9opvQ
	(envelope-from <linux-tegra+bounces-12878-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Wed, 18 Mar 2026 16:06:23 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0922BDD7C
	for <lists+linux-tegra@lfdr.de>; Wed, 18 Mar 2026 16:06:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C9AA93017BE0
	for <lists+linux-tegra@lfdr.de>; Wed, 18 Mar 2026 14:59:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24A483DCD91;
	Wed, 18 Mar 2026 14:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KxkZqCG6"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0287E3D9044;
	Wed, 18 Mar 2026 14:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773845988; cv=none; b=G4oLPx6y6/F08PbBb70uo5KAvMcIN50xr/s9N53dXd3H04JunrLv5wI1wpsQYv0EaG9IusBogwv4ZLywB8DhZlnb9UUnTBsWo5EaFaOcZk1lvGUt4waGp9y3BjoSngluEH92e/o4g8J8zawGFX+LD9NdH5ta+lLJ+xpIc13b48c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773845988; c=relaxed/simple;
	bh=n4t5SM3qYpfKRiLOPkdFtXOzFkDdjC+0VzbWwFX43/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mkk2hMslKea7sfp8FdNS3hY5+dFvOjJ26xhFNcpQ+QEvj3aAtqUkaduaQrv6EbZJFJVti881R3KWEAqr0XixgE6TmF57baXG0jqam6v/7GwOBYOfAN5qZVgFiqd2WV5jmjOFtZZP+MPlfN24DZ2z500j6eZgVzuPAJHdP4rSp0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=KxkZqCG6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32EFEC19421;
	Wed, 18 Mar 2026 14:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773845987;
	bh=n4t5SM3qYpfKRiLOPkdFtXOzFkDdjC+0VzbWwFX43/w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KxkZqCG6m3lDS2MsEKFKUFAczUSY0U0+YojwVwqRS50JXxFnqUje22V8P6CDpa2AY
	 W82oGKc3WcUuNyRPMFlHpnnX9RseZk3/2efMmTd6W8l2S+vgTegTx9oDsmm307YvEC
	 pJrhuA4XHXYp+Ay/bWBMBP9YxXyzcp2KNakD4ajM=
Date: Wed, 18 Mar 2026 15:59:43 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
Cc: marvin24@gmx.de, linux-staging@lists.linux.dev,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: nvec: fix block comment style in nvec.c
Message-ID: <2026031833-pampers-steed-4804@gregkh>
References: <2026030929-uncheck-reclining-315b@gregkh>
 <20260309220718.6475-1-rayfraytech@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309220718.6475-1-rayfraytech@gmail.com>
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12878-lists,linux-tegra=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmx.de,lists.linux.dev,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.940];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-tegra@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-tegra];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: CA0922BDD7C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 09, 2026 at 11:07:18PM +0100, Oskar Ray-Frayssinet wrote:
> Fix block comment formatting to use * on subsequent lines
> and */ on a separate line as required by kernel coding style.
> 
> Signed-off-by: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
> ---
>  drivers/staging/nvec/nvec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
> index e70fafc095f2..0e655f79ea4a 100644
> --- a/drivers/staging/nvec/nvec.c
> +++ b/drivers/staging/nvec/nvec.c
> @@ -659,7 +659,7 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
>  			nvec_tx_set(nvec);
>  			to_send = nvec->tx->data[0];
>  			nvec->tx->pos = 1;
> -			/* Delay ACK due to AP20 HW Bug
> +			/* delay ACK due to AP20 HW Bug
>  			 * do not replace by usleep_range
>  			 */
>  			udelay(33);
> -- 
> 2.43.0
> 
> 

This change is not what you documented is changing :(


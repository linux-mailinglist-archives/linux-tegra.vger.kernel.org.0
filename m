Return-Path: <linux-tegra+bounces-13434-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0J0IOb6dymmg+QUAu9opvQ
	(envelope-from <linux-tegra+bounces-13434-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Mon, 30 Mar 2026 17:58:54 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DB835E491
	for <lists+linux-tegra@lfdr.de>; Mon, 30 Mar 2026 17:58:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 267F13052BB7
	for <lists+linux-tegra@lfdr.de>; Mon, 30 Mar 2026 15:50:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5893F374160;
	Mon, 30 Mar 2026 15:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="iUkpoNDV"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F50C346E54;
	Mon, 30 Mar 2026 15:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774885811; cv=none; b=PAJVFdIh3Rb8nfvdt4hQ8uH12fjglT646ag5C6yckfQ47KGfgGez8pa8EYNvbqBEBa2G0zhjlQT7FoqssmHvr4bqHi0QOZVgrRyEF+Sa3TWMlPp3FKe4dFVodQ/MqXphP8GOhj0E5edIqdtEIEhgTzoGUFTF27MC7i6EuAVubqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774885811; c=relaxed/simple;
	bh=fdcUswHsiVrzGL2tlgudlUXpNxOC1l5VB37WuEcFNbo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pDvAc9nbQOf5u1q7rU7O37scvXoBX7Cc2SlkzMvfneNgOqqAuRB564qdYFKYJETWu+rXIDPDkbT4m0EJh5SddZEbnDLaZ1ec7VABgC7dDtSWlazj+QRCNi855YtJs1cxf4vc3OyfI49/8TXIY/eYcgVlJOoVCp8xqYk49whf6VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=iUkpoNDV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62B39C4CEF7;
	Mon, 30 Mar 2026 15:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774885810;
	bh=fdcUswHsiVrzGL2tlgudlUXpNxOC1l5VB37WuEcFNbo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iUkpoNDVGUX3jN+nZo+ouFglsvxSMrNgf6g8nN/95bZPMtI9xPYbn0Blq4ma+Hky3
	 f8NuX8D95Q1bzCXHyFzoLpAe1+0iIUJ76dEzxOb/aCZ27WzWn/249tcUz/AuTSJIaa
	 3wm7wmoTXfPkQsJg+3aLQHZNwVr5Z7JO1HvjFRYc=
Date: Mon, 30 Mar 2026 17:50:07 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Cameron Pinchin <c.w.pinchin@gmail.com>
Cc: Marc Dietrich <marvin24@gmx.de>,
	"moderated list:STAGING - NVIDIA COMPLIANT EMBEDDED CONTROLLER..." <ac100@lists.launchpad.net>,
	"open list:STAGING - NVIDIA COMPLIANT EMBEDDED CONTROLLER..." <linux-tegra@vger.kernel.org>,
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>,
	CameronPinchin <cameronpinchin@cmail.carleton.ca>
Subject: Re: [PATCH] staging: nvec: fix comment formatting
Message-ID: <2026033004-speak-linseed-ca95@gregkh>
References: <20260322023346.100296-1-c.w.pinchin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260322023346.100296-1-c.w.pinchin@gmail.com>
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13434-lists,linux-tegra=lfdr.de];
	TO_DN_ALL(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[gmx.de,lists.launchpad.net,vger.kernel.org,lists.linux.dev,cmail.carleton.ca];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-tegra@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 45DB835E491
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 21, 2026 at 10:33:46PM -0400, Cameron Pinchin wrote:
> From: CameronPinchin <cameronpinchin@cmail.carleton.ca>
> 
> Fix comment formatting to align with kernel-doc guidelines.
> 
> No functional changes.
> 
> Signed-off-by: Cameron Pinchin <cameronpinchin@cmail.carleton.ca>
> ---
>  drivers/staging/nvec/nvec.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
> index e9af66a08..0e655f79e 100644
> --- a/drivers/staging/nvec/nvec.c
> +++ b/drivers/staging/nvec/nvec.c
> @@ -660,7 +660,8 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
>  			to_send = nvec->tx->data[0];
>  			nvec->tx->pos = 1;
>  			/* delay ACK due to AP20 HW Bug
> -			   do not replace by usleep_range */
> +			 * do not replace by usleep_range
> +			 */
>  			udelay(33);
>  		} else if (status == (I2C_SL_IRQ)) {
>  			nvec->rx->data[1] = received;
> -- 
> 2.53.0
> 
> 


Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- Your patch did not apply to any known trees that Greg is in control
  of.  Possibly this is because you made it against Linus's tree, not
  the linux-next tree, which is where all of the development for the
  next version of the kernel is at.  Please refresh your patch against
  the linux-next tree, or even better yet, the development tree
  specified in the MAINTAINERS file for the subsystem you are submitting
  a patch for, and resend it.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot


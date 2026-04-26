Return-Path: <linux-tegra+bounces-13974-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJBYBFXd7mlhywAAu9opvQ
	(envelope-from <linux-tegra+bounces-13974-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Mon, 27 Apr 2026 05:51:49 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5414E46C9F2
	for <lists+linux-tegra@lfdr.de>; Mon, 27 Apr 2026 05:51:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 90C853028825
	for <lists+linux-tegra@lfdr.de>; Mon, 27 Apr 2026 03:50:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CEC2364925;
	Mon, 27 Apr 2026 03:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="yMgWeb26"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4955536CDE8;
	Mon, 27 Apr 2026 03:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777261826; cv=none; b=I2KRSHgcpLHAqO1yZsRaxXxlXgKW8JeMUzEglra8VHbgohm7j+LAj9ltr705oEXkrUukRdUUywKRIOdaSYhwEa51a7AQn603PQ/EKdTdtX1d7EdgVWsReVJXx067s0eXMVTZH7r8pImSeOh0Ho5i/zKE2Z5IKzhlhDcGp3stH4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777261826; c=relaxed/simple;
	bh=EiYNp4neZfyehX1UyfdYk6Aq8XC6jZvla8qu7SZH7fk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WwDhX4fIvyi1XeYqIUw82DskDhCfmuoqm2a4psyJ75zbBXw239tG6Y0R3BxQNBhu6h2dT0Hyy7nSlNAJiHLU2ef2cgKXVxov8jDGq8Xnik/AbEJocehHUfbcjkFAlMOCeq2Ia8YPhkWBT0B4Kt3+SzAejjr04OA4TjnrPKeklc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=yMgWeb26; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91EC0C19425;
	Mon, 27 Apr 2026 03:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777261825;
	bh=EiYNp4neZfyehX1UyfdYk6Aq8XC6jZvla8qu7SZH7fk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yMgWeb26gzo+3MTi6MHy2gvJ/ovLv9Nw262sNwiOwlC64+i9seDMRs9mwZVrgdKD2
	 B0tRA8HFgF0zmsG7zg6qAAg7Snkg2CnQbX2rQYtNkHBFEMpUpCIO85YUAJikbfb1i/
	 bCyIByiOKXihl3Ck7kK1Ex+tZrV+bQPm4Ju65Goc=
Date: Sun, 26 Apr 2026 21:01:36 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Paarth Mahadik <paarth.mahadik@gmail.com>
Cc: marvin24@gmx.de, ac100@lists.launchpad.net, linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: nvec: fix block comment style
Message-ID: <2026042611-alfalfa-boots-a989@gregkh>
References: <20260404063747.114039-1-paarth.mahadik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260404063747.114039-1-paarth.mahadik@gmail.com>
X-Rspamd-Queue-Id: 5414E46C9F2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13974-lists,linux-tegra=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-tegra@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmx.de,lists.launchpad.net,vger.kernel.org,lists.linux.dev];
	TAGGED_RCPT(0.00)[linux-tegra];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Sat, Apr 04, 2026 at 12:07:47PM +0530, Paarth Mahadik wrote:
> Block comments should use * on subsequent lines and
> have the closing */ on a separate line.
> 
> Signed-off-by: Paarth Mahadik <paarth.mahadik@gmail.com>
> ---
>  drivers/staging/nvec/nvec.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
> index e9af66a08448..0e655f79ea4a 100644
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


Return-Path: <linux-tegra+bounces-13977-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFttOPTd7mlhywAAu9opvQ
	(envelope-from <linux-tegra+bounces-13977-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Mon, 27 Apr 2026 05:54:28 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF0E46CA6F
	for <lists+linux-tegra@lfdr.de>; Mon, 27 Apr 2026 05:54:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E39BE3053766
	for <lists+linux-tegra@lfdr.de>; Mon, 27 Apr 2026 03:50:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F0CA3659EB;
	Mon, 27 Apr 2026 03:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="sze+oJxS"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEFB62E11D2;
	Mon, 27 Apr 2026 03:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777261834; cv=none; b=kZsYm5qOKhb0zPP0a5cxj80IR7wDOnL1KxDlG4oWEIPdlqYSxTN6BdX68fmDQgqABFuOPbMyWDAtrO5+aJOOnjCtFp/rBwGHRk2nQcF5KcaoQOMAIkEtv7gf1uVY5P1EP4ghuce8KFojD5XiQmBjg9Yj+M+e2pQVKNHQfGVhljY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777261834; c=relaxed/simple;
	bh=Y5Lp23k3zJJFlxttZ/VmDA9hu3eVLe+0AuwRcDx5wEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VSbLPQ9fMSymCgrWUlJksfWbpKJ/vAuA/GRluVcwKLYc68kbT8QtjGYeCMYZfftRGXvL03fkm293IbFeeuI/iTxajmTgAZgqMWJu2wEJmYQJ7I2anS8e/DH1rETmYmkJZGbUrIbD3MIvx5+UWZhbOOHVi3+wKsZeocotYPyNcBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=sze+oJxS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6257C19425;
	Mon, 27 Apr 2026 03:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777261832;
	bh=Y5Lp23k3zJJFlxttZ/VmDA9hu3eVLe+0AuwRcDx5wEs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sze+oJxSHGomxtCIx8Cr6fVsiRmDQ1EqmUNCL9WTGuSo8cREkFY9j0BzXBndFSLZN
	 cWdccKad7YuF+vb1/r0l/17F9lC9011wI1jBP4cBCTv8B8lj2ubmE9UrTT4gVnQqhw
	 CL9I+IR8old0PwBGfFcs5bi5xlYjipOpI98SaA/U=
Date: Sun, 26 Apr 2026 21:04:14 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alexandru Hossu <hossu.alexandru@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	error27@gmail.com, linux-tegra@vger.kernel.org, marvin24@gmx.de
Subject: Re: [PATCH v3] staging: nvec: fix unconditional pm_power_off teardown
Message-ID: <2026042640-cultivate-flagman-0665@gregkh>
References: <20260413151236.612404-1-hossu.alexandru@gmail.com>
 <20260413200203.726726-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260413200203.726726-1-hossu.alexandru@gmail.com>
X-Rspamd-Queue-Id: 5EF0E46CA6F
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
	TAGGED_FROM(0.00)[bounces-13977-lists,linux-tegra=lfdr.de];
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
	FREEMAIL_CC(0.00)[lists.linux.dev,vger.kernel.org,gmail.com,gmx.de];
	TAGGED_RCPT(0.00)[linux-tegra];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Mon, Apr 13, 2026 at 10:02:03PM +0200, Alexandru Hossu wrote:
> tegra_nvec_remove() unconditionally sets pm_power_off = NULL, even if
> nvec was not the one that registered it. This breaks any other driver
> that may have set pm_power_off to its own handler.
> 
> Replace the unconditional assignment with a guarded check so that
> pm_power_off is only cleared if nvec was the one that set it.
> 
> Also remove the stale FIXME comment, as the guard addresses exactly
> what it was asking for.
> 
> Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
> ---
> v3:
>  - Drop incorrect Fixes tag

I'm confused, I see lots of different patches here, with this final
thread looking like this:

 Apr 13 Alexandru Hossu (  51) [PATCH v2 1/2] staging: nvec: fix use-after-free in nvec_rx_completed()
 Apr 13 Alexandru Hossu (  40) └─>[PATCH v2 2/2] staging: nvec: fix unconditional pm_power_off teardown
 Apr 13 Dan Carpenter   (  26)   ├─>
 Apr 13 Alexandru Hossu (  42)   └─>[PATCH v3] staging: nvec: fix unconditional pm_power_off teardown

What is patch v3 of?  What about patch 1/2?

This is really confusing.

When redoing a patch in a series, you need to resend the whole series as
a new version.  Otherwise I have no idea what to do (and our tools get
_VERY_ confused as well.)

So a v4 full series please?

thanks,

greg k-h



Return-Path: <linux-tegra+bounces-12471-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SAhUKYRIqGlOrwAAu9opvQ
	(envelope-from <linux-tegra+bounces-12471-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Wed, 04 Mar 2026 15:58:12 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3792F20211A
	for <lists+linux-tegra@lfdr.de>; Wed, 04 Mar 2026 15:58:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 222C2310ECB8
	for <lists+linux-tegra@lfdr.de>; Wed,  4 Mar 2026 14:47:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EF1D3AEF57;
	Wed,  4 Mar 2026 14:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="1jbZyPv8"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D8C27FD6D;
	Wed,  4 Mar 2026 14:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772635647; cv=none; b=cKH7gLPcjDGkIGI8U0Z4Eflgao2zcD17QO/PYT70GOlQGrAptTKc0cuxOhufBFV+4Z1D6E6Gys2rnr4AtD3GjamsiMobk51jXiQ2tYUWVAvY3mbMxrYXWqwv1/EveXNLuPpf8yLVFaIExGLdqj6FBwyDtPMDPj6Nio4G/rwrXMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772635647; c=relaxed/simple;
	bh=3VVI/66Nw6XiU0wwB/eTH3WXrj2eFyM5mlM0Ut8qw8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p3hRLun3tZ2awJ2z4HCHanjofjQ4i3TL/y99nCiH8b/EMdlCrbTh1qSYpdqSGgY2hDTArfrrPOlXNMxZiTmo1NatJewtj9gbUgJHn4IrbSUj17OOmmjYCPs52UJ4Kk49XwBNaPAqQ7XlSnz09r2jOb8ZevgrJ4iVBailynN3kxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=1jbZyPv8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D219C4CEF7;
	Wed,  4 Mar 2026 14:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772635646;
	bh=3VVI/66Nw6XiU0wwB/eTH3WXrj2eFyM5mlM0Ut8qw8k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1jbZyPv8shPxzDJr9VQyNR2D68JQT7EkMazxsiqsdbK9iej8Zr4A3caJ8NHpJ8Afh
	 a9LUypunK8uejQbeZDADKmWv+58EAwRwgtba+WaiDL6D98TFmIij8hIJ0cTBNKTcKQ
	 vxx84PCB/hWfNz/AYW3OaMooYwe10Y+mV6tsuGbU=
Date: Wed, 4 Mar 2026 15:47:14 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Alexandru Hossu <hossu.alexandru@gmail.com>
Cc: marvin24@gmx.de, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] staging: nvec: fix block comment style in nvec.c
Message-ID: <2026030405-thirsting-idealness-b1ed@gregkh>
References: <20260304130701.37332-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304130701.37332-1-hossu.alexandru@gmail.com>
X-Rspamd-Queue-Id: 3792F20211A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12471-lists,linux-tegra=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-tegra@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmx.de,lists.linux.dev,vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-tegra];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linuxfoundation.org:dkim]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 02:07:01PM +0100, Alexandru Hossu wrote:
> Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
> ---

No changelog text :(


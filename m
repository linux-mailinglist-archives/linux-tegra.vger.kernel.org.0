Return-Path: <linux-tegra+bounces-13524-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CGvaFjQuzmnIlQYAu9opvQ
	(envelope-from <linux-tegra+bounces-13524-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Thu, 02 Apr 2026 10:52:04 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E4138650A
	for <lists+linux-tegra@lfdr.de>; Thu, 02 Apr 2026 10:52:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 95F183059D0C
	for <lists+linux-tegra@lfdr.de>; Thu,  2 Apr 2026 08:47:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E391397E7E;
	Thu,  2 Apr 2026 08:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DoU/gB+U"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9983019D6;
	Thu,  2 Apr 2026 08:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775119630; cv=none; b=AzC7aTMbxdsEaAzkKhqXH8k/UtbTl2Z6BLUvucoEZAb3uHZ7M+XF1e2LbBjQWpy7c5qofiJO3oiyIs8pXGyWv2t2rw7fGlZEYDMi9olqp+HRaqGTArJv/HsRDp9WQO6ZJx84UH7BaeaVO/E0Q44owHwz4LEqyC4MgOeMRmT8v6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775119630; c=relaxed/simple;
	bh=5w1RcmBPhXcarJWdI8hRbcegLw1Xt/q9SGR3XY1XIrA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kr1wHpLQgQjwMXULeZmOJ/bLLCYvpSDsG38PTslMiHIznADPcevTvrllNHd2Icq3TWcPi7GGy7yK0p/vMTiHRuGSIqUp6o5EnpBAJXbh7Y0YEEggeQd5emWCP9fz0alWxbSvRet1D1HCEo+cH5MdUFmN/kxja855Y6TvwfP11nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DoU/gB+U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AB0AC116C6;
	Thu,  2 Apr 2026 08:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775119630;
	bh=5w1RcmBPhXcarJWdI8hRbcegLw1Xt/q9SGR3XY1XIrA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DoU/gB+Um1uzzqKRZrKXXIQlgB+foTV5N5Zjf7+rE1DEyyNKVi4CcGLbnWBAQ151P
	 OAm1FGJ0+s8gWxXKKUgMhr7ACAZqySoZwEZ0KbVtvBa2Mq9naG0C6eSSZrUJh6tpIt
	 Gedm+pGx3j9uk28QgI1sLUeFg6+luPqp2kmq59DiR9S3LBzsARPHK7KlXILeXM+6iT
	 LNYsO72wkGaBOR+pIc+0txJ12B1uwm2iCDHkiXx3A0w+jrcWLPRdAjx6a0U2no20r+
	 StM6n7m6KG8mK3tAr4VrHPDT6dDHOlzZOcMkJfOPovnY69A+xsWjrZtwHZk92yjZRW
	 HDdrtLTtWtK9w==
Date: Thu, 2 Apr 2026 10:47:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Suneel Garapati <suneelg@nvidia.com>
Cc: dipenp@nvidia.com, jonathanh@nvidia.com, thierry.reding@gmail.com, 
	krzk+dt@kernel.org, conor+dt@kernel.org, amhetre@nvidia.com, sheetal@nvidia.com, 
	kkartik@nvidia.com, robh@kernel.org, pshete@nvidia.com, timestamp@list.linux.dev, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: timestamp: Add Tegra264 support
Message-ID: <20260402-neat-amiable-puma-d747ea@quoll>
References: <20260401213831.187569-1-suneelg@nvidia.com>
 <20260401213831.187569-2-suneelg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260401213831.187569-2-suneelg@nvidia.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13524-lists,linux-tegra=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[nvidia.com,gmail.com,kernel.org,list.linux.dev,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-tegra@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-tegra,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: D2E4138650A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 01, 2026 at 09:38:29PM +0000, Suneel Garapati wrote:
>    reg:
>      maxItems: 1
> @@ -112,6 +114,7 @@ allOf:
>            contains:
>              enum:
>                - nvidia,tegra234-gte-aon
> +              - nvidia,tegra264-gte-aon

And why exactly the slices are variable here? Explain that in commit
msg.

Best regards,
Krzysztof



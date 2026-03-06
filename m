Return-Path: <linux-tegra+bounces-12586-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id jpo5IX8eqmmSLgEAu9opvQ
	(envelope-from <linux-tegra+bounces-12586-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Fri, 06 Mar 2026 01:23:27 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 035A3219C1D
	for <lists+linux-tegra@lfdr.de>; Fri, 06 Mar 2026 01:23:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 812403009153
	for <lists+linux-tegra@lfdr.de>; Fri,  6 Mar 2026 00:23:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 060812BD5BF;
	Fri,  6 Mar 2026 00:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T9AhkB5i"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D733329BDAD;
	Fri,  6 Mar 2026 00:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772756604; cv=none; b=EUL1NLVupE4mTV+r/4UGoB5mXFtWVZtor1AVafg4DAdrQ8B4q/9pT+RbHXrFS0fJOn/YQV18tc1AhSzUyIo4n9Yqgda4/Y2b7i5q5iRPz1A4QKwyXznkb8r/SdJcPJr+MPuUlk3r0ZJquHtnGYqAI2dLS7jEBFLeA59XpdflDoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772756604; c=relaxed/simple;
	bh=7jmzKe/8dP+2ORvxV2+7V4aYxjh8Uex9/w/o/NnpkVI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gtHPuI+HWpmh03Bl6+APMKdnSr9PZBiqrecOIGPLA9H5kUdTq5ean2EziaRu+g+uJnaZoJguXBLF1Nko+wmp6kcUf4kC/2gJt23fXJkHELkyabFz0tFXC3wZNp3KSxjiAID3PBF0zqxJZMNZMwzGoE59gDKCDKywV3+9ZP47qUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T9AhkB5i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 546C9C116C6;
	Fri,  6 Mar 2026 00:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772756604;
	bh=7jmzKe/8dP+2ORvxV2+7V4aYxjh8Uex9/w/o/NnpkVI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T9AhkB5i4OMBrl3qp+OEuS5m+4eAJOszDvW5DRtHiDFOEs/033obBwT+kbfQp2GXg
	 mJDPJiOp8t0CdmEOs/tFVlQxyfhPl7NJSLH51otxjlEIMLXk/g8IsBNr+nzCGniI7G
	 Zd6Hei1birtvQd+rkxKETfVh50SFLDFXaqGjBf3wScJ+gxznySFmbTuxQQKY0pyEBw
	 gGP2sUiQCvOTcm6543Ok8hqIPn9WLgOSgdsByqu3W8ROQRJn+pQd1npsTWPu+yanue
	 XJWuoX+7+EeTm8ctmZSs3ZZYn88nLIBGbEzCT1jm+O+oO0nctqq9ajEifBIqAJ14uh
	 wJl5BSkMJ/TXA==
Date: Thu, 5 Mar 2026 18:23:23 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: linux-tegra@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 04/10] dt-bindings: interrupt-controller: tegra: Fix reg
 entries
Message-ID: <177275660281.847391.1621029290418902145.robh@kernel.org>
References: <20260223143305.3771383-1-thierry.reding@kernel.org>
 <20260223143305.3771383-5-thierry.reding@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223143305.3771383-5-thierry.reding@kernel.org>
X-Rspamd-Queue-Id: 035A3219C1D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12586-lists,linux-tegra=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-tegra@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-tegra,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action


On Mon, 23 Feb 2026 15:32:59 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Tegra210 takes exactly 6 "reg" property entries, as opposed to Tegra30
> which supports only 5 entries.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../nvidia,tegra20-ictlr.yaml                 | 23 +++++++++++++++++--
>  1 file changed, 21 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>



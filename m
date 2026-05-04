Return-Path: <linux-tegra+bounces-14157-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJ9ZLE3c+GnG2QIAu9opvQ
	(envelope-from <linux-tegra+bounces-14157-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Mon, 04 May 2026 19:50:05 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2804C22AC
	for <lists+linux-tegra@lfdr.de>; Mon, 04 May 2026 19:50:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 46A933083A1B
	for <lists+linux-tegra@lfdr.de>; Mon,  4 May 2026 17:48:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F2BA3E5575;
	Mon,  4 May 2026 17:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SFFidD6t"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF913E5565;
	Mon,  4 May 2026 17:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777916893; cv=none; b=NTak8wLelqMly3c1vEYloArGBOOMnq8bAe6raPPS+DGtqSxQ2JIUCmr2WE5JRavjkLM7qGnlO1+uU9lhXj0wsH4VcDin6WJye2dGW1YR8XR+mI/2BjRGtG5j4BtBEG5H09MXxY4ExSDnGQq0mfWp8PnrE2IIeXTOHomMdbpZgik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777916893; c=relaxed/simple;
	bh=JssjQrjG1O8qW8MHiHfAfIvD1YsfKtkzy3BX1R41ToA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=C0zSJcgFT1qnmmm9DZ0oLDgZl5UPW4u9PpI7InQtOkZf94VPpuf8BywuaW7pzRN5ln6Ak8gowbCbPW+m3v6pS/7L2yih2eOKvIkD8TLNAXxLoL1YoTiy2y3v4NPJ3F4QJ4Tu1H3gHH5EUCwJLYwi6qmhai1W6Fc7Ud6iDxs9jpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SFFidD6t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BECD9C2BCF7;
	Mon,  4 May 2026 17:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777916892;
	bh=JssjQrjG1O8qW8MHiHfAfIvD1YsfKtkzy3BX1R41ToA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SFFidD6tL7li4EFnpVM0y34UQbgZ6L6ZY6WBRagUeluW3WSjaXy7/taZgf7ccoCPW
	 Ub+9HV9xoSztXcY6cBZ2t1W9Kl8bOChyQj/M9W5ryK1/61ksXN7mghDpY+7Kbmuije
	 XcIgXh89Ev2T4pMpvqCGrhTzQnb6h3X22QH6UO2iRqMCmxkwvn1L10A8XvtT2ItxsI
	 yE/8TAwL+bVrwvu7jdt1WN2yCJKu3jXxhJODw7lTQL+DF+9pdupC2929YF1V1zu2Fb
	 AoQlR8Owp1ItgKwZdOZLfRr8TUp0pOwuiBC5dx2rEB9dGmp23o0EDboDWlutwN5J5X
	 t1Pziv0ysvjXg==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: robh@kernel.org, conor+dt@kernel.org, =thierry.reding@kernel.org, 
 jonathanh@nvidia.com, sumitg@nvidia.com, Ashish Mhetre <amhetre@nvidia.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org
In-Reply-To: <20260427073419.567360-1-amhetre@nvidia.com>
References: <20260427073419.567360-1-amhetre@nvidia.com>
Subject: Re: [PATCH V2 0/2] memory: tegra: Add Tegra238 memory controller
 support
Message-Id: <177791689051.723206.407498106038794806.b4-ty@b4>
Date: Mon, 04 May 2026 19:48:10 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: EB2804C22AC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14157-lists,linux-tegra=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-tegra@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-tegra,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]


On Mon, 27 Apr 2026 07:34:17 +0000, Ashish Mhetre wrote:
> This series adds Memory Controller driver support for the Tegra238 SoC.
> 
> Tegra238 is similar to Tegra234 but with a reduced memory controller
> configuration featuring 8 channels instead of 16. The driver reuses
> Tegra234 memory client IDs and ICC operations, with Tegra238-specific
> stream IDs for SMMU configuration.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: memory: tegra: Add nvidia,tegra238-mc compatible
      https://git.kernel.org/krzk/linux-mem-ctrl/c/bf7cf25d4245fe49c71eba0e3b09b6260a336999
[2/2] memory: tegra: Add T238 MC support
      https://git.kernel.org/krzk/linux-mem-ctrl/c/907ef6a1baf0ad61f64d31a3f5040feb82f48929

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>



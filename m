Return-Path: <linux-tegra+bounces-12151-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEBLHVKGnWnBQQQAu9opvQ
	(envelope-from <linux-tegra+bounces-12151-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Tue, 24 Feb 2026 12:06:58 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5FC185DFB
	for <lists+linux-tegra@lfdr.de>; Tue, 24 Feb 2026 12:06:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CF7A230CA54B
	for <lists+linux-tegra@lfdr.de>; Tue, 24 Feb 2026 11:01:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5751379999;
	Tue, 24 Feb 2026 11:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cR5ix9GI"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DDA372B2E;
	Tue, 24 Feb 2026 11:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771930894; cv=none; b=W1m/RoHwuClWZZFNqzVFMRfGJSoc/bJ8lrqTzL90vdn0w3EkKVCX0U9dAhJGZBQC+C3vkUssPMhkPEAfi9S7cOAB4k12/aKEn4dfVOV2N+ASD1VN9ipxoZkc5UqmOvGbDXhbeIcSUbDXM3cjYom6gITiJ3z7YG38amsu+moGKiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771930894; c=relaxed/simple;
	bh=2rNO4cnvfeBx041FlC9ODuXhiga5idr1vHqrdxpkKJw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=R1cRRJyIZ59D6MZwr4DBUY+8dm5ofb1kpW4iyyBdVftK879HixfAbVX9sBjyPigszdrHoQy9vV3UGakN9M3j6DNkEu5mCPqcYhGHpIk+0jl0ilGAf16iPUgw3PwxO7LxKUgpCBDNhIgihgLkw2WRwZvy8UFtsbrSrqgxQhf8fe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cR5ix9GI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78055C116D0;
	Tue, 24 Feb 2026 11:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771930894;
	bh=2rNO4cnvfeBx041FlC9ODuXhiga5idr1vHqrdxpkKJw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=cR5ix9GIHDjuxWDsSTcktCiH8d2sSx3DdklkQ1Jh9w3iJDOezSlt4Q4FFQ7HQ9AR9
	 EZV8WaZ68pAOBGv7brS1M+n4GrEvMchk7LMtMZ3VVbP4v4LzGGkR1niPwNB6t35l4R
	 GkMz7BxGSlRy6amXF/HNEFPaoqbL4sPUZ7bY2LXl0BlNEJjFaCAp+bfGZNgf1kgK9F
	 XIKMaoKhCV+iO4OQWm5F/8T3+LXu48SzG7UA9g7IwWD7QYc3oJUsiZyI2bQ7KTXHnI
	 aJcWPs9aS0e2j5RCOYzgRQppe0UXRmdcCbkiVvz0aevao+GQcSFiojw8YfAJ08LFqC
	 ZycGgUjiANgag==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260116123732.140813-1-thierry.reding@gmail.com>
References: <20260116123732.140813-1-thierry.reding@gmail.com>
Subject: Re: [PATCH v2] memory: tegra: Add support for DBB clock on
 Tegra264
Message-Id: <177193089321.47780.10698535665704381032.b4-ty@kernel.org>
Date: Tue, 24 Feb 2026 12:01:33 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12151-lists,linux-tegra=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-tegra@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CF5FC185DFB
X-Rspamd-Action: no action


On Fri, 16 Jan 2026 13:37:32 +0100, Thierry Reding wrote:
> The DBB clock is needed by many IP blocks in order to access system
> memory via the data backbone. The memory controller and external memory
> controllers are the central place where these accesses are managed, so
> make sure that the clock can be controlled from the corresponding
> driver.
> 
> Note that not all drivers fully register bandwidth requests, and hence
> the EMC driver doesn't have enough information to know when it's safe to
> switch the clock off, so for now it will be kept on permanently.
> 
> [...]

Applied, thanks!

[1/1] memory: tegra: Add support for DBB clock on Tegra264
      https://git.kernel.org/krzk/linux-mem-ctrl/c/f3ca1719b114bb3a64592de266f8ff9ce64f311b

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>



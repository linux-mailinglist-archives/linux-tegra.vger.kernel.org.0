Return-Path: <linux-tegra+bounces-14490-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEXsMj5DCGqugwMAu9opvQ
	(envelope-from <linux-tegra+bounces-14490-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Sat, 16 May 2026 12:13:18 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA7C55B133
	for <lists+linux-tegra@lfdr.de>; Sat, 16 May 2026 12:13:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B7BA23015D1D
	for <lists+linux-tegra@lfdr.de>; Sat, 16 May 2026 10:13:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DCAD3D0934;
	Sat, 16 May 2026 10:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nwWW/nJ7"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA99380FC5;
	Sat, 16 May 2026 10:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778926392; cv=none; b=EehgjbpwiPnR8ud9W9zsuEruPme3BxySV44PS2G58KGOMfyyPnCC0Mt54C3LwFaKDmPNZAi6yqF3QKKkb1hxVEC8NlFw+2HL1nYNUcHljgBG75Ks1m8UNCz7wqxr1Z8nuJSHWfyewIsC+2c4GDjaR1LyQb52qKfs0zogrnTPCDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778926392; c=relaxed/simple;
	bh=22sNCp4l7etY2hoe14EWx07LvNAYIqFiKMvt1gefCbk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BeJpGxQmkTUvfpx9G67ig7xYD8EdSJq5gAvXZN+GwW3T+o+iwCFhEI4guUGWppg9VklrQy5KDC8UeWd8nteQe19rWb7+NYKZBSxZDYqxCXYLF+1rlWYXdlrFJDsdtmnbvKBLxDi80Ke2FKtAX6lc9jBAbU/JdyDUI45ktbhlRLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nwWW/nJ7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32C8DC19425;
	Sat, 16 May 2026 10:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778926391;
	bh=22sNCp4l7etY2hoe14EWx07LvNAYIqFiKMvt1gefCbk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nwWW/nJ7P2pBfHkCB8aHkyz/u9GBqz06IOecvzPcS9P/dHxOUlI28AsoLBivenF53
	 p2mv+jGR4lp5VlouUMg4ANeIa/K05UH1maVgDSK8/o7jDxmrthUr/pfUmIfSwWqfGR
	 e56c+J9WoolY9v/Gj4e7TuL74VSttMpHnIbw6WIHIFmqiXfc4GuyCaQgZx46+I3MEr
	 Yz925gwbv0L2E+pXwr8Hjp0hfbqxUKSOPMuwSip3I4MZv3ybMgPANfayxl7UXRWy8M
	 Y8HS+CohK/jl90hPH7esUEzsLGf0zBsfFuRD2GkWHFRQnbziF2RpHBXUQuWlYTvVg5
	 VPl33qix9durA==
Date: Sat, 16 May 2026 12:13:09 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Thierry Reding <thierry.reding@gmail.com>, linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] spi: dt-bindings: tegra: Support IOMMU property for
 Tegra194 QSPI
Message-ID: <20260516-kind-true-buffalo-fd0823@quoll>
References: <20260515-tegra194-qspi-iommu-v1-0-57dfb63cd3d6@gmail.com>
 <20260515-tegra194-qspi-iommu-v1-1-57dfb63cd3d6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260515-tegra194-qspi-iommu-v1-1-57dfb63cd3d6@gmail.com>
X-Rspamd-Queue-Id: 4CA7C55B133
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14490-lists,linux-tegra=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,nvidia.com,gmail.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-tegra@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-tegra,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Action: no action

On Fri, May 15, 2026 at 03:35:27PM -0500, Aaron Kling wrote:
> This is supported via an external dma controller
> 
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>  Documentation/devicetree/bindings/spi/nvidia,tegra210-quad.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof



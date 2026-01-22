Return-Path: <linux-tegra+bounces-11434-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UDfgJCz5cWmvZwAAu9opvQ
	(envelope-from <linux-tegra+bounces-11434-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Thu, 22 Jan 2026 11:17:16 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 34AE2651EB
	for <lists+linux-tegra@lfdr.de>; Thu, 22 Jan 2026 11:17:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 170E3680FA4
	for <lists+linux-tegra@lfdr.de>; Thu, 22 Jan 2026 10:08:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90DBB376BDD;
	Thu, 22 Jan 2026 10:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oHbe6bQS"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BFF836AB7B
	for <linux-tegra@vger.kernel.org>; Thu, 22 Jan 2026 10:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769076501; cv=none; b=L2KhmQdtpn39lwt2Vih6v1oVIFAS8NPdcrbJEvoxsA6w4deTplGqqGDcielVbP+Bw4HQ5mreh1C75iEkmb8Ay0S87aNthqVtBdFudbgE37yFOYgj3N45ioQ6tw9+oKl8n4zXw42J3xQOqHMlOzTs4zzj+1TgZZyJf4Gwth5nZM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769076501; c=relaxed/simple;
	bh=NS1dUdpfEov7TFYOYmIUueAnbmo+14IrbGqTOzqyWvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a5dFX+RVRrg5osbXgsIDI93oXjQgjvqdL0HNvBodfn+ZkbVDNx0iajTa+6A0TWiGOmyAkif/+WhryMkvhHVDix1t/XFxbfqxY2/OOY5hjkSOeZH83oRy474bbmGWilOS/Y7ljBwOCWWN9R2g6zaxehgJGkuFrN7Svp5XynN9OTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oHbe6bQS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83EB8C116C6;
	Thu, 22 Jan 2026 10:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769076501;
	bh=NS1dUdpfEov7TFYOYmIUueAnbmo+14IrbGqTOzqyWvM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oHbe6bQSL4QiwjjO4mUSVMXO5By/hF870UEYDu5DkGHRU9o50dcjo/JKnssq82sJm
	 Ynhr++5vrrNX2U1GQrBsyggmFgmPBATe3feabngNO1ldImAy/4VQz1hDVR7+okp9Ei
	 vUmxTMiTZKFVlSqCqBfVoVssmVFCkT2PH0QEuD2/HydQ+v6wSzsA0Jv46pCvJDPb5p
	 0MHKP5mPQc4SmNO5O0B/JbU+vSJXgbqxeu5d3CdPE1sXkmOngLdtf4ntaPZ/BN5WRd
	 QHp5Un4f6m8UsDhNEsyLU7LM5ket07ec2BP3sFd/d/FhB+XJVisqv+Vw0vuRPGtZeA
	 w4qP/JUtFUEYA==
Date: Thu, 22 Jan 2026 11:08:18 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: arm@kernel.org, soc@kernel.org, Jon Hunter <jonathanh@nvidia.com>, 
	linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [GIT PULL 1/4] dt-bindings: Changes for v6.20-rc1
Message-ID: <20260122-hidden-goat-of-excellence-a43b9f@quoll>
References: <20260118080304.2646387-1-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260118080304.2646387-1-thierry.reding@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11434-lists,linux-tegra=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-tegra@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns]
X-Rspamd-Queue-Id: 34AE2651EB
X-Rspamd-Action: no action

On Sun, Jan 18, 2026 at 09:03:00AM +0100, Thierry Reding wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:
> 
>   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.20-dt-bindings
> 
> for you to fetch changes up to b2788f6320722d6059f849f35a77eb082608c627:
> 
>   ASoC: dt-bindings: realtek,rt5640: Document port node (2026-01-17 01:58:18 +0100)
> 
> Thanks,
> Thierry
> 
> ----------------------------------------------------------------
> dt-bindings: Changes for v6.20-rc1
> 
> This series updates various DT bindings for Tegra architecture,
> primarily focusing on schema validation fixes and new feature
> documentation for Tegra234 and Tegra264 SoCs. Key changes include
> correcting realtek,rt5640 audio codec bindings (adding missing ports,
> clocks, and jack-detect sources), converting Tegra20 NAND bindings to
> YAML, and updating memory, DMA, and IOMMU definitions for Tegra264
> (introducing CMDQV and DBB clock support). Additionally, it resolves
> legacy warnings for Tegra30/132 display and VI interfaces.

Same comment as was for Geert, I am surprised to see DT bindings as
separate pull and I see drivers were alerady merged, so I will defer
entire Tegra pull to Arnd.

Best regards,
Krzysztof



Return-Path: <linux-tegra+bounces-13392-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHqYDxZByWm1wgUAu9opvQ
	(envelope-from <linux-tegra+bounces-13392-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Sun, 29 Mar 2026 17:11:18 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D10753528A4
	for <lists+linux-tegra@lfdr.de>; Sun, 29 Mar 2026 17:11:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 830843011C6B
	for <lists+linux-tegra@lfdr.de>; Sun, 29 Mar 2026 15:11:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD6B937DE9B;
	Sun, 29 Mar 2026 15:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DAAt5zP9"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC85361DA2
	for <linux-tegra@vger.kernel.org>; Sun, 29 Mar 2026 15:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774797069; cv=none; b=PLHkSDwctwirIxATESXmPPF6YxuJUaMwRrUI42h1T2wngV4v59grYMgbK/nAggmOd6XneforCo2WqdPYL5AMDRCale3qp+B4AMOivIPByowrTVNAlROv4a/JxwCw6+aIJ8ri5jBHzYnEXtUlglXp+vzP9vAklto205S0y6QsFzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774797069; c=relaxed/simple;
	bh=48O06jw41mdFWfzz7EZIRuUwiyu34of3gLO+Z+5DX9U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GKbxongu//wXbo22dYsqIdX3MqQVPkss+yrpu9Wu9owm8NhHCUOVSEGHo1y8spdGTVGlG8xLuTqU3+q6K4qDsPjHEs65SfMlEgU9PxdXo/RyOS8xJWC1jen1B6XRm09ljbr2X5ncjQGkiNEiHOcHadslA0V0pGaA0kkeJhtuEfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DAAt5zP9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14A32C116C6;
	Sun, 29 Mar 2026 15:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774797069;
	bh=48O06jw41mdFWfzz7EZIRuUwiyu34of3gLO+Z+5DX9U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DAAt5zP9x1B1zJc01c09CLZyU02+98UDTZrLobQfzigELVdHNbs/kS3BMZCLBU9Rw
	 5JVqbjlZJ5XCENTd8T0cgZUu5Qlf6x49StTWQq4gDgTMtjIFnM1uYJag6gTxnNNmdV
	 QXD35rZf9DOL0pMU0ZlwXDXGCiH8YfeNGaTEtubvxlsY89PMnTvYmjQDUJAZGgR5An
	 yBYBzNoUd3TCGTuXPTJ+sp8upKPoTzxY4jh6faRuKN5SWJDFqsyqgWYXzi5+8NAaLU
	 yAUq63ZdNNXZu9Jg4O1Uip8GkZUxOoMWSWXCVPsh83qCP6FtnEp/0+Zl9mgizOIaG4
	 25KmnYrBjRpfQ==
From: Thierry Reding <thierry.reding@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 7/7] arm64: tegra: Default configuration changes for v7.1-rc1
Date: Sun, 29 Mar 2026 17:10:44 +0200
Message-ID: <20260329151045.1443133-7-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260329151045.1443133-1-thierry.reding@kernel.org>
References: <20260329151045.1443133-1-thierry.reding@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13392-lists,linux-tegra=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,nvidia.com,vger.kernel.org,lists.infradead.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierry.reding@kernel.org,linux-tegra@vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D10753528A4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Thierry Reding <thierry.reding@gmail.com>

Hi ARM SoC maintainers,

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-7.1-arm64-defconfig

for you to fetch changes up to c655a14958363aea8a1d0bbf3358fcee7f89a210:

  arm64: tegra: defconfig: Drop redundant ARCH_TEGRA_foo_SOC (2026-03-25 10:49:46 +0100)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Default configuration changes for v7.1-rc1

Drop the various ARCH_TEGRA_*_SOC options from the default configurations
since they are now enabled by default for ARCH_TEGRA.

----------------------------------------------------------------
Krzysztof Kozlowski (2):
      soc/tegra: Make ARCH_TEGRA_SOC_FOO defaults for NVIDIA Tegra
      arm64: tegra: defconfig: Drop redundant ARCH_TEGRA_foo_SOC

Thierry Reding (1):
      Merge branch 'for-7.1/soc' into for-7.1/arm64/defconfig

 arch/arm64/configs/defconfig |  7 -------
 drivers/soc/tegra/Kconfig    | 11 +++++++++++
 2 files changed, 11 insertions(+), 7 deletions(-)


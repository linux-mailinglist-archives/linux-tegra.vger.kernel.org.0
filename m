Return-Path: <linux-tegra+bounces-12207-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id APS/CrlioGk0jAQAu9opvQ
	(envelope-from <linux-tegra+bounces-12207-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Thu, 26 Feb 2026 16:11:53 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 996F11A84D4
	for <lists+linux-tegra@lfdr.de>; Thu, 26 Feb 2026 16:11:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 564433015A7E
	for <lists+linux-tegra@lfdr.de>; Thu, 26 Feb 2026 15:09:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5528539B48D;
	Thu, 26 Feb 2026 15:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AglWGKwc"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A8F2EC54A
	for <linux-tegra@vger.kernel.org>; Thu, 26 Feb 2026 15:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772118581; cv=none; b=fD0cL7+CQfeFI5ziji0uf181iMtdKkXTd4svfdt12G1MZOwDg3L22vX1vCt/4QtWso20OMtOuumh4lm2VdGD0nY1RC0oq1Nr8Dj09snToPAxJicgvjztjsvOjXOv8wLa+crGTbDoEZ62dRLXYpoXglVuehDIP3DuEQkrlUochjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772118581; c=relaxed/simple;
	bh=v1ACgIlRD8KvR06CUuh6zGTqQBP7zb+Wqfw6At6WSBo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S3HyUngdUOhgBHNiKU5vdKgBt6eALsSL8Hf3+bzOCzZJuN00duFgMz4km4iysO2bIAX4OVEkCHvvG+kbS9nLyNaGviJ++AXcM6/rY85ikVQ9SoFjY0AUGPvOk2GY/zOP5hADeUGldvzbmVi3vxTmKQfplHiwIzSNlhDBwwBfRaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AglWGKwc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40214C116C6;
	Thu, 26 Feb 2026 15:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772118580;
	bh=v1ACgIlRD8KvR06CUuh6zGTqQBP7zb+Wqfw6At6WSBo=;
	h=From:To:Cc:Subject:Date:From;
	b=AglWGKwcJ0FyHd064/As67R7WsRFpIWJ/hOM/h3i3hudcQarvs+8jM8v4eQyN6bNA
	 wTwmgC73q8i0l2dTa+/mPKL12W3JdF/YJATT3eFlCB07VUol8p6eWl0jOuPUQPNC9n
	 C00dAOLqLd8szk+9nUgX3ZpMqhVzh9pu9fntLfhvNM9RfkXeKCrNyRwfWYqYR36hB6
	 pRuiFWWEUdDuj+rHGAWEN7f9Y1MzlRkzmsL7bifxkFrmZ0le405C39BtFSHaGd/Wd3
	 tewIaOspx5ATMxEjNkpcMZnTJNbGjQCUfU7UwRO5xteYOK3weei5SwT6Rkc7nnsLSm
	 2azybZVK/yCbg==
From: Thierry Reding <thierry.reding@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] soc/tegra: Add Tegra238 Kconfig symbol
Date: Thu, 26 Feb 2026 16:09:32 +0100
Message-ID: <20260226150933.4067324-1-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12207-lists,linux-tegra=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierry.reding@kernel.org,linux-tegra@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nvidia.com:email]
X-Rspamd-Queue-Id: 996F11A84D4
X-Rspamd-Action: no action

From: Thierry Reding <treding@nvidia.com>

The NVIDIA Tegra238 SoC is an upcoming new chip. Add a Kconfig symbol to
allow fine-grained selection of support code for this chip.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/soc/tegra/Kconfig | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/soc/tegra/Kconfig b/drivers/soc/tegra/Kconfig
index c0fc54c3cd35..0a84bfd5c657 100644
--- a/drivers/soc/tegra/Kconfig
+++ b/drivers/soc/tegra/Kconfig
@@ -125,6 +125,15 @@ config ARCH_TEGRA_234_SOC
 	help
 	  Enable support for the NVIDIA Tegra234 SoC.
 
+config ARCH_TEGRA_238_SOC
+	bool "NVIDIA Tegra238 SoC"
+	default ARCH_TEGRA
+	depends on !CPU_BIG_ENDIAN
+	select MAILBOX
+	select SOC_TEGRA_PMC
+	help
+	  Enable support for the NVIDIA Tegra238 SoC.
+
 config ARCH_TEGRA_241_SOC
 	bool "NVIDIA Tegra241 SoC"
 	help
-- 
2.52.0



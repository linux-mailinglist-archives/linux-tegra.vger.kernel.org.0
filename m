Return-Path: <linux-tegra+bounces-13391-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPn9Gg1ByWm1wgUAu9opvQ
	(envelope-from <linux-tegra+bounces-13391-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Sun, 29 Mar 2026 17:11:09 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 531F7352888
	for <lists+linux-tegra@lfdr.de>; Sun, 29 Mar 2026 17:11:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B5FF13001FDD
	for <lists+linux-tegra@lfdr.de>; Sun, 29 Mar 2026 15:11:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2949237DE9B;
	Sun, 29 Mar 2026 15:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KpHv66hL"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D26379999
	for <linux-tegra@vger.kernel.org>; Sun, 29 Mar 2026 15:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774797067; cv=none; b=n+xUTpbpifg2t2I/SUuPDA24iIjBtM+m00FnnkUq2RslAD5+2y5fWRsRfwGgu3+loAQnrgTFreQ1gKAVvEiA75pfsloDBtRbIY53iMkLEtIAkM1qJAkV8mTps9ICUzGYaUDkrroFUQ06q83R06GHZtMD2geePg7f7EySm4v/Ru8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774797067; c=relaxed/simple;
	bh=uLUM4o+KLJe4YQmeHIHCsOs0ynRLdm3hUXmN7rvPPFI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nvIITZdcthS8ie77uXFt8pVSfKDlLKcvyrMXVfBXziyfVKn9c2L7Bl+e3vTHudPKtkfueIhaXUOxcv2matT64W9SIHrMJqPvaAHNRXv5WWcCgwL0ocRqfXvcwzqkaQSy7va5KeQr/oTsJftfq76WTTxIkECPc29RRJw6SIWfXRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KpHv66hL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58812C116C6;
	Sun, 29 Mar 2026 15:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774797066;
	bh=uLUM4o+KLJe4YQmeHIHCsOs0ynRLdm3hUXmN7rvPPFI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KpHv66hLSfg9e8z12WOw30PjF1clNYOndpyZVfBQ7NcAgwDuAHJ1cZywIEFtq2Nap
	 CdiOQ+J3tIPUJP9SyQdeY8IlxfDuvnEzbY2H5I/7NMsf39BGfMaWODgAR1+bLtq/nm
	 6K9C/SgiZ+ZyunoZdytc2IXgkJvNQxjl+QqWxtwtB1GEfYPHcMp6rI2eV8Jsm5E1nz
	 3NSMcLICzlX7C4IT88GqxbnT6geVA03u2fi0N21szbL4Ii3KKeuAnlsj5ezeJFVL8H
	 2/Hgj+GRttUNJx7PxR2/8y+LylFNPaeyFrUVlyHDDiV78FpC8mIDbWD5GuIbIZ9rR+
	 OcdtAVImgjSSg==
From: Thierry Reding <thierry.reding@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 6/7] arm64: tegra: Device tree changes for v7.1-rc1
Date: Sun, 29 Mar 2026 17:10:43 +0200
Message-ID: <20260329151045.1443133-6-thierry.reding@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13391-lists,linux-tegra=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 531F7352888
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Thierry Reding <thierry.reding@gmail.com>

Hi ARM SoC maintainers,

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-7.1-arm64-dt

for you to fetch changes up to c70e6bc11d2008fbb19695394b69fd941ab39030:

  arm64: tegra: Add Tegra264 GPIO controllers (2026-03-28 01:36:46 +0100)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree changes for v7.1-rc1

Various fixes and new additions across a number of devices. GPIO and PCI
are enabled on Tegra264 and the Jetson AGX Thor Developer Kit, allowing
it to boot via network and mass storage.

----------------------------------------------------------------
Diogo Ivo (1):
      arm64: tegra: smaug: Enable SPI-NOR flash

Jon Hunter (1):
      arm64: tegra: Fix RTC aliases

Prathamesh Shete (1):
      arm64: tegra: Add Tegra264 GPIO controllers

Thierry Reding (6):
      dt-bindings: pci: Document the NVIDIA Tegra264 PCIe controller
      Merge branch for-7.1/dt-bindings into for-7.1/pci
      arm64: tegra: Fix snps,blen properties
      arm64: tegra: Drop redundant clock and reset names for TSEC
      arm64: tegra: Add PCI controllers on Tegra264
      arm64: tegra: Add Jetson AGX Thor Developer Kit support

 .../bindings/pci/nvidia,tegra264-pcie.yaml         | 149 +++++++++
 arch/arm64/boot/dts/nvidia/Makefile                |   2 +
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts      |  12 +
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |   2 -
 arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi     |   1 +
 arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi     |   1 +
 arch/arm64/boot/dts/nvidia/tegra234.dtsi           |   6 +-
 .../dts/nvidia/tegra264-p4071-0000+p3834-0008.dts  |  11 +
 .../boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi |  12 +
 arch/arm64/boot/dts/nvidia/tegra264.dtsi           | 336 +++++++++++++++++++--
 10 files changed, 500 insertions(+), 32 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/nvidia,tegra264-pcie.yaml
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834-0008.dts
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi


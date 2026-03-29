Return-Path: <linux-tegra+bounces-13393-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8KPNLwhLyWntxAUAu9opvQ
	(envelope-from <linux-tegra+bounces-13393-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Sun, 29 Mar 2026 17:53:44 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9DD352B6B
	for <lists+linux-tegra@lfdr.de>; Sun, 29 Mar 2026 17:53:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2119E304A5B5
	for <lists+linux-tegra@lfdr.de>; Sun, 29 Mar 2026 15:50:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E53B376BCC;
	Sun, 29 Mar 2026 15:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G5QhtjCS"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDA536D4EA;
	Sun, 29 Mar 2026 15:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774799447; cv=none; b=XEz9oEzntMMkkY8cehpi5GrEOSn4Ql4S/SUkkdibjudlzhtqMHn95WrHb/uJCY3H0QC5XBWxeZqBt60guGfQ0gUaZni8VgVfNBvb+op5+MSZKTZhdWCX4sDKbTM+Yjw1LROnPbfE2ywWE+ElXEllgZvyyaEA5KDf7PF38eGDv8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774799447; c=relaxed/simple;
	bh=pZ1YjtlNztckGR9ehBsAHqay77Yd8balGELRv/rE/m0=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=GtudlyPtjyralWs1EE4RjppzoChcxyGYaeJeAatQjl3rfSLuQUZuDcg2CI6JzBnGvARfwMvh6akQ6P31PMYtlWB085x5lsuV65xTtKiKrmHnugrQA1QXYuWQLVy9Imj6Fk9RBjzB3hWWTCh5070UN8BukqH9fhGJZ8upnxrlTLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G5QhtjCS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84F98C116C6;
	Sun, 29 Mar 2026 15:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774799446;
	bh=pZ1YjtlNztckGR9ehBsAHqay77Yd8balGELRv/rE/m0=;
	h=From:To:Cc:Subject:Date:From;
	b=G5QhtjCSnWIbLTSURYAqsSq//35U9CvraJrRSbM+NzNOTZ2kXrTozWPPUM1/+BMBR
	 v+Fj6KmgDK63sTdEHWO7MdB2Xo7qRKaMQQypsil4zi83LYy1ozK45wlv16kx8BWW4E
	 R+NkDdpe6pKVPy1YLtnjSopFgS2yKZfZHDON9AiHuFfGEh5kT7IGjYGTqnzMiuZZAF
	 vosaM2dwemXTzVfggDKBxAS4dgp4KP9wvF43/jptI8GoQXePPR779SIq6fjI9ArAVZ
	 N0hVXm57FVgypTPHcnu+0XWK3WxqlD5zc56aUdjsnzJh8MhACExYAwLrJBqx1huemf
	 JjC2CNHy8feNQ==
From: Thierry Reding <thierry.reding@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [GIT PULL] PCI: tegra: Changes for v7.1-rc1
Date: Sun, 29 Mar 2026 17:50:39 +0200
Message-ID: <20260329155040.1448158-1-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.52.0
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13393-lists,linux-tegra=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierry.reding@kernel.org,linux-tegra@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2F9DD352B6B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Thierry Reding <thierry.reding@gmail.com>

Hi Lorenzo, Bjorn,

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-7.1-pci

for you to fetch changes up to a0c0906bb09ee2f64690b3b8ffb458b4dbbcb26e:

  PCI: tegra: Add Tegra264 support (2026-03-28 15:00:05 +0100)

This is v3 of the Tegra264 PCI patches that can be found here:

  https://lore.kernel.org/linux-pci/20260326135855.2795149-1-thierry.reding@kernel.org/

This looks ready now, but if there's any more feedback, I will happily
respin these driver patches.

Note that the shortlog and the diffstat below include the dependencies
from the Tegra tree, and that subset will go in through the ARM SoC tree
as well. Effectively what's new in this pull request is just the two PCI
patches, the rest is only included here to resolve the build time
dependencies.

Thanks,
Thierry

----------------------------------------------------------------
PCI: tegra: Changes for v7.1-rc1

This set of patches uses standard wait times for PCIe link monitoring
and build on top of that to add Tegra264 support. It also includes all
the Tegra-specific build-dependencies.

----------------------------------------------------------------
Thierry Reding (8):
      firmware: tegra: bpmp: Rename Tegra239 to Tegra238
      soc/tegra: Update BPMP ABI header
      firmware: tegra: bpmp: Add tegra_bpmp_get_with_id() function
      dt-bindings: pci: Document the NVIDIA Tegra264 PCIe controller
      Merge branch for-7.1/dt-bindings into for-7.1/pci
      Merge branch for-7.1/firmware into for-7.1/pci
      PCI: Use standard wait times for PCIe link monitoring
      PCI: tegra: Add Tegra264 support

 .../bindings/pci/nvidia,tegra264-pcie.yaml         |  149 +
 drivers/firmware/tegra/bpmp.c                      |   34 +
 drivers/pci/controller/Kconfig                     |   10 +-
 drivers/pci/controller/Makefile                    |    1 +
 .../controller/cadence/pcie-cadence-host-common.c  |    6 +-
 .../pci/controller/cadence/pcie-cadence-lga-regs.h |    5 -
 drivers/pci/controller/mobiveil/pcie-mobiveil.c    |    4 +-
 drivers/pci/controller/mobiveil/pcie-mobiveil.h    |    5 -
 drivers/pci/controller/pci-aardvark.c              |    7 +-
 drivers/pci/controller/pcie-tegra264.c             |  522 +++
 drivers/pci/controller/pcie-xilinx-nwl.c           |    9 +-
 drivers/pci/controller/plda/pcie-starfive.c        |    9 +-
 drivers/pci/pci.h                                  |    2 +
 include/soc/tegra/bpmp-abi.h                       | 4573 ++++++++++++++++----
 include/soc/tegra/bpmp.h                           |    8 +
 15 files changed, 4412 insertions(+), 932 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/nvidia,tegra264-pcie.yaml
 create mode 100644 drivers/pci/controller/pcie-tegra264.c


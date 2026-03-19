Return-Path: <linux-tegra+bounces-12917-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJTACsUfvGnQswIAu9opvQ
	(envelope-from <linux-tegra+bounces-12917-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Thu, 19 Mar 2026 17:09:41 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7612CE6EA
	for <lists+linux-tegra@lfdr.de>; Thu, 19 Mar 2026 17:09:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0175C32A4B1B
	for <lists+linux-tegra@lfdr.de>; Thu, 19 Mar 2026 16:03:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7F133ED127;
	Thu, 19 Mar 2026 16:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nojLQuhZ"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35B63E3179;
	Thu, 19 Mar 2026 16:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773936079; cv=none; b=kL58iWyZ/7bihOeS6UdCI3C8dJut7a021L+0nKDUW/VVc77ckwP1upLpSeuWf/ARlCbbzxDGorslx7GjJM6+L37shJgeH4lt3Jdin1ySiwyzRYs2QL0Mgo2bN4ilIJJ82ZbHyfMBzPK/IwbPsW4mQQZm0VUfTSzHXL7ZO/99tAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773936079; c=relaxed/simple;
	bh=sM41SGwojTpQVvrcjk2xO9L6REUH8GaV4fgRH+ZGqks=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FO3G3n0JVFOIjqWrKpnhQKA9rdcRAy3M2r70tmZdQKKkLvp1gzI6TDoOGdmEpwN4+4x2M4WCp51UNGiumNGN9PN0jWOkqQ35pfa/2pi59rvQHXA7rW0OkMyERSACkFg5KGMsYSXJzA4y/BbbXpm+o3GVgGYj6pklj1as5MwsjzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nojLQuhZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1920C19424;
	Thu, 19 Mar 2026 16:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773936079;
	bh=sM41SGwojTpQVvrcjk2xO9L6REUH8GaV4fgRH+ZGqks=;
	h=From:To:Cc:Subject:Date:From;
	b=nojLQuhZsbgXkau/qYpdqPcFwClWcDQcJycZmWW2CIlyf25qYi7NhmmqG0HlH6L4f
	 vSVnw3g5zXe+BI3ywwl+bMW9UYeMJuWzA0wSOPx+J0D76eP/B3v66cKPQA9CghXmug
	 UkVRAinSLMWJ3QAgloqvoRozZYfAfhnOkrR0ThhNHFYMBfKlGsh/IrbeRODHdElZRl
	 WyPx9pt8OeH7PU3y9YF3KS4A3cy8lCzKvrvZEuWIeQA7tfFkNn3bvQHyl3VeHwKrQj
	 hly53bqxpQKE5qNn49WrfoVBZs2W74LjBBIhk/GR2g1da0SOc2jZtGVxjPT4tm2Eef
	 6VVzzFItXa2jg==
From: Thierry Reding <thierry.reding@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH 0/5] PCI: tegra: Add Tegra264 support
Date: Thu, 19 Mar 2026 17:01:04 +0100
Message-ID: <20260319160110.2131954-1-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-12917-lists,linux-tegra=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierry.reding@kernel.org,linux-tegra@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.985];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nvidia.com:email]
X-Rspamd-Queue-Id: 8C7612CE6EA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Thierry Reding <treding@nvidia.com>

Hi,

this series adds support for the PCIe controllers found on the Tegra264
SoC. There are six instances, one of which is for internal purposes only
and the other five are general purpose.

The first two patches in the series add the BPMP support needed to power
up/down the PCI link. Patch 3 contains the device tree bindings for the
PCIe controller and patch 4 adds the driver. Finally, patch 5 adds DT
nodes for the controllers found on the Tegra264 SoC.

Regarding merging these patches, I think ideally I'd want to pick up the
PCI driver patch into the Tegra tree because there is a build dependency
on patches 1 and 2. Furthermore, patch 1 depends on another patch that's
already in the Tegra tree, and there will be conflicts if it is merged
in another tree. Alternatively I can provide a stable branch with
patches 1 and 2 for the PCI maintainers to pull in.

Let me know how you'd like to handle this.

Thanks,
Thierry

Thierry Reding (5):
  soc/tegra: Update BPMP ABI header
  firmware: tegra: bpmp: Add tegra_bpmp_get_with_id() function
  dt-bindings: pci: Document the NVIDIA Tegra264 PCIe controller
  PCI: tegra: Add Tegra264 support
  arm64: tegra: Add PCI controllers on Tegra264

 .../bindings/pci/nvidia,tegra264-pcie.yaml    |   92 +
 arch/arm64/boot/dts/nvidia/tegra264.dtsi      |  248 +-
 drivers/firmware/tegra/bpmp.c                 |   34 +
 drivers/pci/controller/Kconfig                |    8 +
 drivers/pci/controller/Makefile               |    1 +
 drivers/pci/controller/pcie-tegra264.c        |  506 ++
 include/soc/tegra/bpmp-abi.h                  | 4565 +++++++++++++----
 include/soc/tegra/bpmp.h                      |    1 +
 8 files changed, 4534 insertions(+), 921 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/nvidia,tegra264-pcie.yaml
 create mode 100644 drivers/pci/controller/pcie-tegra264.c

-- 
2.52.0



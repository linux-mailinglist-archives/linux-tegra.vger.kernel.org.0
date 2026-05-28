Return-Path: <linux-tegra+bounces-14762-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gOVoLEi2GGqkmQgAu9opvQ
	(envelope-from <linux-tegra+bounces-14762-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Thu, 28 May 2026 23:40:24 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 776725FA7F4
	for <lists+linux-tegra@lfdr.de>; Thu, 28 May 2026 23:40:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 45812305F553
	for <lists+linux-tegra@lfdr.de>; Thu, 28 May 2026 21:36:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE9553203B6;
	Thu, 28 May 2026 21:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kWupRwDr"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65E930FF36;
	Thu, 28 May 2026 21:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780004184; cv=none; b=SuX4dyUkvYBPF8mg5zdKsVglhrnRJ3NTgfAXgzvfU7L/DkuU9QEE6rhWe+JNx3mIlVBfEktkFomV4L5xthf7NYRevbdcDrYwxLC+7En9ly5v+r+LUYVznmTAE6hwgBAVLLlGG4RCGIUnO6LY+pMIpwkMNlPrPbsjx2J5mZrXN/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780004184; c=relaxed/simple;
	bh=aNvoAORt41uV3lmG+ocuLXL+KuYSpnwy/aAxYpuP29s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YDN/4O1Hm8VTxf79DgMPb6eNZ+7JubiDdgG+Wq9tW4SJoCV+gv83bOxJHSkctLHgP6YkIKfM1Vun9Ff9PTz2oi7QczLjIPwweiMHoMQEwYhGHwLejl6qxzNl6rAXbZkUhjfEWQL2Y+6Gmt+Aa02b8/aLzlvZJRj/FAWuzB5126g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kWupRwDr; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2EFA1F000E9;
	Thu, 28 May 2026 21:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780004183;
	bh=AOLnJ1MEEkP9mtdtUTkEdFF/2MFoQr/GUGGGHbZ8Zyc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kWupRwDr6qXhFT45EgmCvud4y7TkCQKlczq+2buL/WfkwaI9cupaSylikbTgay2nI
	 bT5Xas874UdZeZrdWNoZhC8ldYUdggmciLHY1bUMX2p072w3x1pPU0Ijsmjw8Bkl8z
	 DhhLdJu6eUmlzWgYmb2YZ4GrXvl6EZo4Pjvb2/AaGG3Sdv4Hsw3X4HImHSFkz6srH9
	 H5uCil+L9+Mqb9dihrznu3owotrAjr5lXdgNXZBEnZWMXWoDQu0RjfVBWdN3M7v27E
	 4q4S5UtIc/HDep1bELWD+bNfRInxGKTVP55syA3/YOh+rJ60vFYBmhp8WvunSP+AE6
	 vWrh6Bw/tvVmA==
From: Thierry Reding <thierry.reding@kernel.org>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	kishon@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org,
	Frank.Li@nxp.com,
	den@valinux.co.jp,
	hongxing.zhu@nxp.com,
	jingoohan1@gmail.com,
	vidyas@nvidia.com,
	cassel@kernel.org,
	18255117159@163.com,
	Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: linux-pci@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v3 0/2] PCI: tegra194: ASPM L1 entrance latency from device tree
Date: Thu, 28 May 2026 23:36:16 +0200
Message-ID: <178000416758.192366.10797753270425875441.b4-ty@b4>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260515070753.3852840-1-mmaddireddy@nvidia.com>
References: <20260515070753.3852840-1-mmaddireddy@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14762-lists,linux-tegra=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[google.com,kernel.org,gmail.com,nvidia.com,arndb.de,linuxfoundation.org,nxp.com,valinux.co.jp,163.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierry.reding@kernel.org,linux-tegra@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 776725FA7F4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Thierry Reding <treding@nvidia.com>


On Fri, 15 May 2026 12:37:51 +0530, Manikanta Maddireddy wrote:
> This series programs Synopsys DesignWare ASPM L1 entrance latency on NVIDIA
> Tegra194/234 PCIe controllers from an optional device tree property and
> corrects the default nanosecond cells so the PORT_AFR field advertises the
> intended latency buckets.
> 
> Background
> ----------
> The controller exposes L1 entrance latency in PCI Express PORT_AFR (DW DBI),
> bits 27:29.  Software must select a 3-bit code for the maximum L1 entry delay
> the platform can tolerate.  Patch 1 reads aspm-l1-entry-delay-ns (nanoseconds),
> converts to whole microseconds with ceiling division (DIV_ROUND_UP), and
> programs min(order_base_2(us), 7) into PORT_AFR during ASPM init.  If the
> property is absent, the driver keeps the existing default (code 7).
> 
> [...]

Applied, thanks!

[2/2] arm64: tegra: fix aspm-l1-entry-delay-ns L1 latency cells
      commit: 56c5f525817ea99ce34110700b3a0ab71add0b8c

Best regards,
-- 
Thierry Reding <treding@nvidia.com>


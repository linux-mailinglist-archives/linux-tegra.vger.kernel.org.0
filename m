Return-Path: <linux-tegra+bounces-14027-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Ox3I07R8GnDYwEAu9opvQ
	(envelope-from <linux-tegra+bounces-14027-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Tue, 28 Apr 2026 17:25:02 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1602F487C50
	for <lists+linux-tegra@lfdr.de>; Tue, 28 Apr 2026 17:25:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EE342301808E
	for <lists+linux-tegra@lfdr.de>; Tue, 28 Apr 2026 15:25:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BD6E3B27F3;
	Tue, 28 Apr 2026 15:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dGVllmvQ"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5694B3B0AF1;
	Tue, 28 Apr 2026 15:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777389900; cv=none; b=G/UrAQNoI/x/7ttdEBPEi0Eqk4mDsvwm/SXsXFNsMs3bdSmUhcfoZ2YBfYS6A5SEdoJMxUhAwD62Y+oCAaifux/ztyBt9rPjqgZKe6G/vBWNvIXfQeCn5zHFBIfBoJrvzus/G7IIp4S1uiwJ0uRPNj8WwUJ5Unr+rl/JFIVJk6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777389900; c=relaxed/simple;
	bh=u64nPhavIjrbkIOuDS+rk495KAKnnTNnuGKl1iIgrnQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HH3rlHxL2z7srupeojQ3kKQBo0BaZiTDvcsKl67BwTWz1uyx1j8Mhzf7VnU65VvBS70gtlIxR72/SiqNxKFBpHKBlTId89k4Y+Fl5P7O2f/FH3NpJg/rrjli3lpLgntqQxX448AOjEJtdlAWutWvPLxA0v4dr9I5+yp9xKm3Bvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dGVllmvQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5289AC2BCAF;
	Tue, 28 Apr 2026 15:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777389899;
	bh=u64nPhavIjrbkIOuDS+rk495KAKnnTNnuGKl1iIgrnQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dGVllmvQI59FU2rKl51MvdlSIUC4iRZxt6th/z8BzKSjvuVMjEzce0//g4FZBqB6R
	 PTWxDsPC1Stg6HSgaJ6NIw+hfxqlofQGb6gStsyQl0a+280uFfyqMMay8W4UoRpfw3
	 pXCOG3YwyvUlS83O6foSv3A9XR7BSENKl8sqaZy78uAbivPW2EA54JjM+mQLRqJJMd
	 +xgOGXj5lvZ0gp+7qz7PF5mZkBPlKhSXRCu11qGTlQZrgBmlqBYyI4uPEp9Vx0fP6g
	 6BnAF3yNLrv2ntGsd5liEd9PmQsvIeTTTdZmxIQkrxRgeutZnapuUv0DAHhCilyGo1
	 gw5/gyEGWj2cQ==
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
Subject: Re: (subset) [PATCH v8 0/9] Enhancements to pcie-tegra194 driver
Date: Tue, 28 Apr 2026 17:24:50 +0200
Message-ID: <177738985833.3914480.661455445762332370.b4-ty@b4>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260324191000.1095768-1-mmaddireddy@nvidia.com>
References: <20260324191000.1095768-1-mmaddireddy@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1602F487C50
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[google.com,kernel.org,gmail.com,nvidia.com,arndb.de,linuxfoundation.org,nxp.com,valinux.co.jp,163.com];
	RCPT_COUNT_TWELVE(0.00)[23];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14027-lists,linux-tegra=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierry.reding@kernel.org,linux-tegra@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,nvidia.com:email]

From: Thierry Reding <treding@nvidia.com>


On Wed, 25 Mar 2026 00:39:51 +0530, Manikanta Maddireddy wrote:
> This series[1] was originally posted by Vidya Sagar, and I have rebased
> it onto 6.19.0-rc6-next. I addressed review comments and split this into
> two series, one for fixes and the other is for enhancements(current).
> I verified these patches on Jetson AGX Orin(Tegra234 SoC).
> 
> Disabling L1SS capability based on support-clkreq device tree property
> is moved to common DWC driver, so I reworked below patch to disable
> just L1.2 capability on Tegra234 SoC.
>  - PCI: tegra194: Disable L1.2 capability of Tegra234 EP
> 
> [...]

Applied, thanks!

[8/9] arm64: tegra: Add aspm-l1-entry-delay-ns to PCIe nodes
      commit: d60ed99f1c9e0bdf1fcd713426f6213abe592c83

Best regards,
-- 
Thierry Reding <treding@nvidia.com>


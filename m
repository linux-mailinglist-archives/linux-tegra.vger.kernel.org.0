Return-Path: <linux-tegra+bounces-11993-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kI4ALKs6lGntAgIAu9opvQ
	(envelope-from <linux-tegra+bounces-11993-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Tue, 17 Feb 2026 10:53:47 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D08FD14A914
	for <lists+linux-tegra@lfdr.de>; Tue, 17 Feb 2026 10:53:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 635AA30046A6
	for <lists+linux-tegra@lfdr.de>; Tue, 17 Feb 2026 09:53:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B1CB31A57C;
	Tue, 17 Feb 2026 09:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="Dn0hrzvM"
X-Original-To: linux-tegra@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CEC131A548;
	Tue, 17 Feb 2026 09:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771322022; cv=none; b=Cfo4ZMsW8+VdMnYMMkJb41fsv78xOOyaOxkqiqqafuJZV8IKZqmvHEX1dxa2EkuocX4Si4O/BaTHwwrCyvz8/RQVQk7wk80NHhzFWhm7I7mXC5tE7e5LUdJxvhRPvRLNJOFgPnzUpey6wpOEpDjDpwijwUvpQpi8ackuJQpE+Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771322022; c=relaxed/simple;
	bh=+hHMMjCmGivOuUVBVB2++cpkvMAUfY6n/jQMTPc1lhk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N0Bsk4HKMKSKez6It8YFGS7m5HSw3tNqy1ZbYcf6QiF0BQcfqyMz3z9BkpFKhfo/9QOmSKNnRAtpVNBE1/Suo2hNh7/OPvQ6lEvTSj/2j1hDKR6O2gt5US7t+u2nQIuyU+jy7OGXhAWL6P8CG41HiyiTAtmGCsyXpehU8cBA6nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=Dn0hrzvM; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ggPH5Y20hoWNO8lI+FCNkaDwu2pNsKAXw0sa+ZPU0LQ=; b=Dn0hrzvM/VJdeQsAGjqG1czRZm
	pnpIslEfGJ2Qn3LVa2VS0/aVSgJ0mVSIq4o8w3E20nWcK683vbm7ojtr9TS7yfiZvgAIeIHEH2eGI
	Rt4UIoUkkNXN3GpzZ6l2IflQQxGDpFxR4x7am3yA1JMoCeuwj+Q2dSY3TX0DVVX10gp8QZnOPvWoP
	juGx6mXJ3jAYX8L691jz3Wo7qqm/crGWYOKZ09BsHvbyVwdwxp/kGwkVGyqJY997OqQQBWaD+2PLf
	xh5spBVW18Iq3mrnZDJi0/V81dBnbegBstYT6/3sJYgHLFqch7cj8JNtiCBS9iXaYnLu7q3Dc9Y4b
	ciakkJBQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:41366)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vsHlu-000000007b6-2njy;
	Tue, 17 Feb 2026 09:53:34 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vsHls-0000000017p-1Ns6;
	Tue, 17 Feb 2026 09:53:32 +0000
Date: Tue, 17 Feb 2026 09:53:32 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Linus Walleij <linusw@kernel.org>,
	Drew Fustini <fustini@kernel.org>
Subject: Re: [PATCH 1/3] soc: tegra: Make ARCH_TEGRA_SOC_FOO defaults for
 Nvidia Tegra
Message-ID: <aZQ6nF9NJA9bqjSD@shell.armlinux.org.uk>
References: <20260217-soc-tegra-arch-kconfig-v1-0-81bf5674d032@oss.qualcomm.com>
 <20260217-soc-tegra-arch-kconfig-v1-1-81bf5674d032@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260217-soc-tegra-arch-kconfig-v1-1-81bf5674d032@oss.qualcomm.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11993-lists,linux-tegra=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-tegra@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D08FD14A914
X-Rspamd-Action: no action

On Tue, Feb 17, 2026 at 10:16:36AM +0100, Krzysztof Kozlowski wrote:
> By convention, only one globally selectable ARCH_PLATFORM is expected
> for given SoC platform, defined in arch/arm64/Kconfig.platforms or
> arch/arm/mach-*/Kconfig, because we target a single multi-platform
> kernel image.
> 
> Platforms wanting different granularity, e.g. due to size constraints on
> their devices, should be sure that globally only one ARCH_PLTAFORM is

typo: ARCH_PLATFORM

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!


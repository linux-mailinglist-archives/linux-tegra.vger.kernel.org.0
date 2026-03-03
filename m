Return-Path: <linux-tegra+bounces-12415-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4B2mC0TppmnjZgAAu9opvQ
	(envelope-from <linux-tegra+bounces-12415-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Tue, 03 Mar 2026 14:59:32 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D13551F0E74
	for <lists+linux-tegra@lfdr.de>; Tue, 03 Mar 2026 14:59:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 841F1305ABFA
	for <lists+linux-tegra@lfdr.de>; Tue,  3 Mar 2026 13:53:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9140C35FF6E;
	Tue,  3 Mar 2026 13:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AlX32pQp"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E07B35F615;
	Tue,  3 Mar 2026 13:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772545902; cv=none; b=T6UlwrFDRufIqTwFHrZF0285KJWFH7EmW1qRAZY5ab8nv/VueS1NBiCspCzEMttmY0Q6XcctmTPhs8UChXrKA1alJJ3+BRW7raM2syJO0/WgVvWu8J9qpRoOMCMAvz0Wn2X7EtuZaql5Kpiwe8OoXO47ybVJvT/shXCN5ujbY+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772545902; c=relaxed/simple;
	bh=37wqk0tb+mVucEdvOHh2goiyzqelsFHVvn0cCNcTSrs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I5WnUaxE0gsS18wSFWiblIc7vwwd4+a//6fyuvGygoiXTDWDj9CdLvsdojzZ8rB2rhAANWijxlSP7ACYio7biSm6NT5pbXaO2Y6NHfMm6ydjLDwwM67l2wnS3g5T7I0Gq2/cmR9RzqbhUQ9LvFzgU8kceY3xT2olV3LE7PfaFYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AlX32pQp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F4029C116C6;
	Tue,  3 Mar 2026 13:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772545902;
	bh=37wqk0tb+mVucEdvOHh2goiyzqelsFHVvn0cCNcTSrs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AlX32pQpMPlkHljOiv79BD0pENVQFDEE4QVTF12m+u7kmWSZ2DiDtvKWE5Oi8ZYiU
	 nHcB5urxTX8rc2LohZ1Fv7BjZoeiVuG8xOcP19RMcDKp9lBvc/mBPo+bMR4yLTJIro
	 LBkycURdJGoaW/2DQsm1lEQ/T1O4NlTakM1fvkcfZEsceAzrWDXBYQuqXtk2CSxzxZ
	 kLIsRvfhQY7d9X7lNNAYpbdSyR8wm+1xTgs61yQZBWQiFqjHI9UwWoMZd4qubKrxzA
	 JASqdVem75Z9NiK9o6meZoZAaHMDAnr/We5YZP74shedhCaZi13fFQtI4Ag1vbE3bi
	 Hgq4PGWGQqPhA==
Date: Tue, 3 Mar 2026 14:51:35 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
	mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com,
	kishon@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
	Frank.Li@nxp.com, den@valinux.co.jp, hongxing.zhu@nxp.com,
	jingoohan1@gmail.com, vidyas@nvidia.com, 18255117159@163.com,
	linux-pci@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] PCI: tegra194: Expose BAR2 (MSI-X) and BAR4 (DMA)
 as 64-bit BAR_RESERVED
Message-ID: <aabnZ2VpSI4GCXUi@ryzen>
References: <20260303072004.2384079-1-mmaddireddy@nvidia.com>
 <20260303072004.2384079-5-mmaddireddy@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303072004.2384079-5-mmaddireddy@nvidia.com>
X-Rspamd-Queue-Id: D13551F0E74
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
	TAGGED_FROM(0.00)[bounces-12415-lists,linux-tegra=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[google.com,kernel.org,gmail.com,nvidia.com,arndb.de,linuxfoundation.org,nxp.com,valinux.co.jp,163.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cassel@kernel.org,linux-tegra@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-tegra,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,nvidia.com:email]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 12:50:03PM +0530, Manikanta Maddireddy wrote:
> Tegra Endpoint exposes three 64-bit BARs at indices 0, 2, and 4:
> - BAR0+BAR1: EPF test/data (programmable 64-bit BAR)
> - BAR2+BAR3: MSI-X table (hardware-backed)
> - BAR4+BAR5: DMA registers (hardware-backed)
> 
> Update tegra_pcie_epc_features so that BAR2 is BAR_RESERVED with
> PCI_EPC_BAR_RSVD_MSIX_TBL_RAM (64 KB) & PCI_EPC_BAR_RSVD_MSIX_PBA_RAM (64 KB),
> BAR3 is BAR_64BIT_UPPER, BAR4 is BAR_RESERVED with
> PCI_EPC_BAR_RSVD_DMA_CTRL_MMIO (4KB), and BAR5 is BAR_64BIT_UPPER.
> This keeps CONSECUTIVE_BAR_TEST working while allowing the host to use
> 64-bit BAR2 (MSI-X) and BAR4 (DMA).
> 
> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> ---

Reviewed-by: Niklas Cassel <cassel@kernel.org>


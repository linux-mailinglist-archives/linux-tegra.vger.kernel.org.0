Return-Path: <linux-tegra+bounces-13631-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIufJZDV1mlTJAgAu9opvQ
	(envelope-from <linux-tegra+bounces-13631-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Thu, 09 Apr 2026 00:24:16 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C68C3C47DE
	for <lists+linux-tegra@lfdr.de>; Thu, 09 Apr 2026 00:24:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A7FE6301A909
	for <lists+linux-tegra@lfdr.de>; Wed,  8 Apr 2026 22:24:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4A9538C2A4;
	Wed,  8 Apr 2026 22:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KyNU+h2i"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBC43396EE;
	Wed,  8 Apr 2026 22:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775687051; cv=none; b=rBkMisUy7RimhWQHdeIebJzQ3JvQBEdXRh2931BztDhnzqsltmxKbywcPteP0dw31gQ073IcX+O+FQAHUbAEO2yScDmxyqTaUdz7zBcftRAHTiO7mDBgdjgfYbG/pBl8h8QCX7dsEx4y/ZeHWDLiyzl8v0dsCcobO/WqQTzPITw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775687051; c=relaxed/simple;
	bh=XLOiSLLiwvobF25UW2qB5pLkUg+ScO5rmKjqBVPgYT0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=aKFjPkxyA2uY/lEYKTVm85qt7h5qCp4D7GZLUjayeyJsIt9RSn5ckGmoCghyFpw4+v87stBQt3Gg1zilqddWjNWyE4ZvQBwxPBYx4u+gQMQ+TFqxU4Ng/X5Sa7kMYyqwFgEbOwd/a1a5mU2vfdRaXetVs+4ONMPwL1UkmPb/F9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KyNU+h2i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C3F3C19421;
	Wed,  8 Apr 2026 22:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775687051;
	bh=XLOiSLLiwvobF25UW2qB5pLkUg+ScO5rmKjqBVPgYT0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=KyNU+h2ixArRqJAxARI/A0ZkyaTXSIK1njheCjnMFjvIW9KQ7hgOrYrzUTcF70bXw
	 jG9DFQb6U43Pfb2piti9GPhijhED2xfrjc0jMWHjBtFltEv7ByofAuAglV6iJHzaUL
	 1H0bAYDttkKJSWbBlSGjk1KOs1nUwitZwX8GEIX082qRJn+9W73pN1vAvYzQjmwnK6
	 NmK6zpH8dmnOdBAmCATxMr3D4C0JuqVXf0Hee11g1t6hIDMbUorNccydFoP1MJgXIE
	 ys8c6Oo65IItsKPJMGUOMktXaMsy5d1wLJRlQ5KBpMIV/655td0Rcg0EmcUJRggAmI
	 WuCgjbg6JnvVQ==
Date: Wed, 8 Apr 2026 17:24:09 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
	mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com,
	kishon@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
	Frank.Li@nxp.com, den@valinux.co.jp, hongxing.zhu@nxp.com,
	jingoohan1@gmail.com, vidyas@nvidia.com, cassel@kernel.org,
	18255117159@163.com, linux-pci@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 12/14] PCI: dwc: Apply ECRC workaround to DesignWare
 5.00a as well
Message-ID: <20260408222409.GA329776@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324190755.1094879-13-mmaddireddy@nvidia.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13631-lists,linux-tegra=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[helgaas@kernel.org,linux-tegra@vger.kernel.org];
	FREEMAIL_CC(0.00)[google.com,kernel.org,gmail.com,nvidia.com,arndb.de,linuxfoundation.org,nxp.com,valinux.co.jp,163.com,vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-tegra,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3C68C3C47DE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 25, 2026 at 12:37:53AM +0530, Manikanta Maddireddy wrote:
> The ECRC (TLP digest) workaround was originally added for DesignWare
> version 4.90a. Tegra234 SoC has 5.00a DWC HW version, which has
> the same ATU TD override behaviour, so apply the workaround for 5.00a
> too.
> 
> Fixes: a54e19073718 ("PCI: tegra194: Add Tegra234 PCIe support")
> Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
> Tested-by: Jon Hunter <jonathanh@nvidia.com>
> Reviewed-by: Vidya Sagar <vidyas@nvidia.com>
> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> ---
> Changes V8: Split into two patches
> Changes V1 -> V7: None
> 
>  drivers/pci/controller/dwc/pcie-designware.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
> index 345365ea97c7..c4dc2d88649e 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.c
> +++ b/drivers/pci/controller/dwc/pcie-designware.c
> @@ -486,7 +486,7 @@ static inline void dw_pcie_writel_atu_ob(struct dw_pcie *pci, u32 index, u32 reg
>  static inline u32 dw_pcie_enable_ecrc(u32 val)
>  {
>  	/*
> -	 * DesignWare core version 4.90A has a design issue where the 'TD'
> +	 * DWC versions 0x3530302a and 0x3536322a has a design issue where the 'TD'

0x3536322a looks like DW_PCIE_VER_562A, not DW_PCIE_VER_500A, so this
comment doesn't seem to match the commit log or the code.

"0x3530302a and 0x3536322a" is not nearly as readable as 4.90A and
5.00A.

>  	 * bit in the Control register-1 of the ATU outbound region acts
>  	 * like an override for the ECRC setting, i.e., the presence of TLP
>  	 * Digest (ECRC) in the outgoing TLPs is solely determined by this
> @@ -559,7 +559,7 @@ int dw_pcie_prog_outbound_atu(struct dw_pcie *pci,
>  	if (upper_32_bits(limit_addr) > upper_32_bits(parent_bus_addr) &&
>  	    dw_pcie_ver_is_ge(pci, 460A))
>  		val |= PCIE_ATU_INCREASE_REGION_SIZE;
> -	if (dw_pcie_ver_is(pci, 490A))
> +	if (dw_pcie_ver_is(pci, 490A) || dw_pcie_ver_is(pci, 500A))
>  		val = dw_pcie_enable_ecrc(val);

This is in shared DWC code, which raises the question of whether this
issue applies *only* to 490A and 500A?  What about other versions,
e.g., 520A (unused AFAICS), 540A, 562A?

>  	dw_pcie_writel_atu_ob(pci, atu->index, PCIE_ATU_REGION_CTRL1, val);
>  
> -- 
> 2.34.1
> 


Return-Path: <linux-tegra+bounces-13623-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0A1uLN7B1mn+HwgAu9opvQ
	(envelope-from <linux-tegra+bounces-13623-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Wed, 08 Apr 2026 23:00:14 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EACE03C3EBA
	for <lists+linux-tegra@lfdr.de>; Wed, 08 Apr 2026 23:00:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D89BF302AE0D
	for <lists+linux-tegra@lfdr.de>; Wed,  8 Apr 2026 21:00:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2362133F36B;
	Wed,  8 Apr 2026 21:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BUGtMSTu"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21683314C5;
	Wed,  8 Apr 2026 20:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775682000; cv=none; b=quVdOz5nQzutSO/FWULEudDBZKhOJwbz+TFKdC4LpeAGwksVMVoIQLHm1KweAal22iDA29xeRZyOk5Mcw6HU/n6q3y/Hns2dXo0XHFcNz7T/bSzGD8RjF9sBuJt4Z6gBkfU94miNTVzVPGmYm+XOUuppYmZiAcYp4NYMCgd4VQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775682000; c=relaxed/simple;
	bh=s4Gn6jvrKOTjgIRkNbleAZrl8eXjkvTuO45CE6gl4Pg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=szrSZYpAY56OLbn6oUdu4iQ6X0C9E7rQhNGsJWrS2t9tETb59pVogGfO+1tcACinDRM0ntY3hYuys9CUV/BkWLvtt9Jt3V0vMB5O4a/Xw4LM9tW1+I9zTOsyCKSMFW/3TZ+gX5uvwhID1SJ0APPIR0IH+Yr/kbFqPtRt84GHrvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BUGtMSTu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BED9C19421;
	Wed,  8 Apr 2026 20:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775681999;
	bh=s4Gn6jvrKOTjgIRkNbleAZrl8eXjkvTuO45CE6gl4Pg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=BUGtMSTus3N+1LcvoKhlsjUq44lgoBH+xHCQUTIG0kBg7RuDl7YZoDHtMeE4NQgwH
	 Jrx/NmnsMfN64W9EW3YcwKtbkDt6ZLJLUVDN0CkCHv960kn5eA8ZT3lHrV2hejE6AG
	 jt/LndxgWnJ1Wj5Go/c0mdMtEANJQhMRmIvce6HM8rSS6O22oPvN86kr2Jyhs2q8eT
	 jcVv7/G4mqnTMQN3cNk2a+hAPmF2i4adEG94wZOd8wcxtP/lNkbR46aWrcebU7pqMq
	 qwTOMK0bd4mzU2GXO68s/GnSReLJLcNbSEXSgSXb95mS2+IXvwaIplPgj/+I6y3ssW
	 JWDJ2+ObdnfHw==
Date: Wed, 8 Apr 2026 15:59:58 -0500
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
Subject: Re: [PATCH v8 09/14] PCI: tegra194: Allow system suspend when the
 Endpoint link is not up
Message-ID: <20260408205958.GA316081@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324190755.1094879-10-mmaddireddy@nvidia.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13623-lists,linux-tegra=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[google.com,kernel.org,gmail.com,nvidia.com,arndb.de,linuxfoundation.org,nxp.com,valinux.co.jp,163.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[helgaas@kernel.org,linux-tegra@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-tegra,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EACE03C3EBA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 25, 2026 at 12:37:50AM +0530, Manikanta Maddireddy wrote:
> From: Vidya Sagar <vidyas@nvidia.com>
> 
> Host software initiates the L2 sequence. PCIe link is kept in L2 state
> during suspend. If Endpoint mode is enabled and the link is up, the
> software cannot proceed with suspend. However, when the PCIe Endpoint
> driver is probed, but the PCIe link is not up, Tegra can go into suspend
> state. So, allow system to suspend in this case.

> +static int tegra_pcie_dw_suspend(struct device *dev)
>  {
>  	struct tegra_pcie_dw *pcie = dev_get_drvdata(dev);
> -	u32 val;
>  
>  	if (pcie->of_data->mode == DW_PCIE_EP_TYPE) {
> -		dev_err(dev, "Failed to Suspend as Tegra PCIe is in EP mode\n"); > -		return -EPERM;
> +		if (pcie->ep_state == EP_STATE_ENABLED) {
> +			dev_err(dev, "Tegra PCIe is in EP mode, suspend not allowed\n");

Should this message say something about endpoint suspend not being
allowed because the link is up?  IIUC, the endpoint *can* suspend if
the link is down.


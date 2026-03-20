Return-Path: <linux-tegra+bounces-12999-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WKUpH5VZvWkA9QIAu9opvQ
	(envelope-from <linux-tegra+bounces-12999-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Fri, 20 Mar 2026 15:28:37 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 271E72DBCB9
	for <lists+linux-tegra@lfdr.de>; Fri, 20 Mar 2026 15:28:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 380B03016EC8
	for <lists+linux-tegra@lfdr.de>; Fri, 20 Mar 2026 14:27:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B5183C13E6;
	Fri, 20 Mar 2026 14:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FPTQ5c6M"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7611F3BA237;
	Fri, 20 Mar 2026 14:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774016827; cv=none; b=kiv7l1ROUncUONAoJDqyQhsIFoxwU+c7qYh8rZsSFPIzSHMBRp1dybS2ICXjsllAyD3e4t/+rmRLpocpBhj6YL8/K+QZwBj8kLdAtC0tBBcZYBdD8GVlqVNHGjBMz1dBoWkAAB80m8ukBzWMOOtoEYRLqjXA7xZ6Pia+en0whJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774016827; c=relaxed/simple;
	bh=k4+Fr8GYTEorydGUVB40cXg47golGvPWBSxULERZI6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IoOxm5Gb7HI4qdvSfcwrg++9RgMqgRIMXExgBjasCq+Y0IiPYNfycKwM2/BaP3OrUEFHX99+UaYsJEbndXmWsZOZa+fq9wmDnSjBTvYAys7E3PTFiGPE7eiA2VUNp90aG6GGeZzZzDIwoRsH23AefzwNhU2V+ZUr7/rnaRzGvIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FPTQ5c6M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8B2CC4CEF7;
	Fri, 20 Mar 2026 14:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774016827;
	bh=k4+Fr8GYTEorydGUVB40cXg47golGvPWBSxULERZI6s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FPTQ5c6Msr57xq9lkdNf8VzHhF7duGR4nqKfjrTBJYu0ZC8dYVE3ITPhKGb5/CYdS
	 dPwH1/E4cAetV9FUcmz3wsvQ0Ck1SWrEKeLfd24wXXvdfx4xRpkRg41yjeiy/lmDJf
	 UqGd7z4Va4JRo2lXXXvV6OmsrH0Zat2UmrIkfuMVpGZPAKHAnMoOEofoAa4Kh5MVFi
	 rC4TdCORw3K6jfMrui35yG0QEIqab4XbQ3utA0PxHI+Y4SUwnp8sj0tf25MB5umk9A
	 Iivmtiqrvw3OJSVGSwQSp6cpxSxAq15BQchdnOZZ74lBmgVpcdUtVHyH11pzbHH7WC
	 DytrxVYskHPnw==
Date: Fri, 20 Mar 2026 09:27:05 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 4/5] PCI: tegra: Add Tegra264 support
Message-ID: <20260320142705.GA699200@bhelgaas>
References: <20260319160110.2131954-5-thierry.reding@kernel.org>
 <20260319174639.GA515667@bhelgaas>
 <ab0XT15uG0YEVjBZ@orome>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab0XT15uG0YEVjBZ@orome>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12999-lists,linux-tegra=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.943];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[helgaas@kernel.org,linux-tegra@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-tegra,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 271E72DBCB9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 20, 2026 at 11:34:53AM +0100, Thierry Reding wrote:
> On Thu, Mar 19, 2026 at 12:46:39PM -0500, Bjorn Helgaas wrote:
> > On Thu, Mar 19, 2026 at 05:01:08PM +0100, Thierry Reding wrote:
> > > From: Thierry Reding <treding@nvidia.com>
> > > 
> > > Add a driver for the PCIe controller found on NVIDIA Tegra264 SoCs. The
> > > driver is very small, with its main purpose being to set up the address
> > > translation registers and then creating a standard PCI host using ECAM.

> > > +#define PCIE_LINK_UP_DELAY	10000	/* 10 msec */
> > > +#define PCIE_LINK_UP_TIMEOUT	1000000	/* 1 s */
> > 
> > Use something from drivers/pci/pci.h if possible.  If not, please add
> > units suffixes to the name, e.g., it looks like these are in "_US".
> > 
> > PCIE_LINK_WAIT_MAX_RETRIES and PCIE_LINK_WAIT_SLEEP_MS look like
> > they're used in similar ways in other drivers.
> 
> I see a bunch of implementations that use custom defines, if you don't
> mind I'll have a go and unifying this a little. Most implementations
> seem to use usleep_range(90000, 100000) with 10 retries.

That would be awesome!

> > > +		err = gpiod_to_irq(pcie->wake_gpio);
> > > +		if (err < 0) {
> > > +			dev_err(pcie->dev, "failed to get wake IRQ: %d\n", err);
> > 
> > Does %pe work here (and below)?
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/core-api/printk-formats.rst?id=v6.19#n96
> 
> It won't work in this particular case because %pe needs an ERR_PTR-
> encoded error code. For the other messages it's probably better to move
> to dev_err_probe() as Krzysztof suggested.

We could use dev_err(dev, "..., %pe\n", ERR_PTR(err)).  It's kind of ugly,
but seems like a fairly common style.  I wish we had a simpler way to do
this; it seems like a shame to print a negative number when we have the
symbols available.

Bjorn


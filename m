Return-Path: <linux-tegra+bounces-13624-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDhTBbLC1mlDIAgAu9opvQ
	(envelope-from <linux-tegra+bounces-13624-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Wed, 08 Apr 2026 23:03:46 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CAB3C3F00
	for <lists+linux-tegra@lfdr.de>; Wed, 08 Apr 2026 23:03:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A4BE030254DB
	for <lists+linux-tegra@lfdr.de>; Wed,  8 Apr 2026 21:03:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E97D3890F6;
	Wed,  8 Apr 2026 21:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o5mVr94D"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED6F388E61;
	Wed,  8 Apr 2026 21:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775682205; cv=none; b=r3FlMopn0w5eZziX+EZEKn50WEfI6xc6N7TyyRxukGP675MMkK9ccj8D1DJjDam5Ce88GFAmR2YLi6s0dB48/CrPGliPkXKAORuGKoOj0VjqK/ttOglxLTPoqLGIZGGn+gha4c9nJP7jLV5a0l60HBqe8b63rcf81tBMOs45tlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775682205; c=relaxed/simple;
	bh=LI4Jdb78+TU/EszwVvJyt9hZyy3f+LfUVsZZrA1dkQs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=nF2kKs0JqsHJPwkCKI6MO9sCVEjW753PfBqtkrAnIOzWmoCQdgHoXC5LQV45p4I8OvHx7Lz+goxjooO9FENJymMINw4iYNnZov3O0T193Tu7ZSoresrArIHHrlCdHwJQm5S+/v3uje4RU3FLPJRg7hdHeOwLyfRjA/mYWu7AUOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o5mVr94D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CC82C4AF09;
	Wed,  8 Apr 2026 21:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775682204;
	bh=LI4Jdb78+TU/EszwVvJyt9hZyy3f+LfUVsZZrA1dkQs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=o5mVr94DBuIfkw5acEPotXIAVE0hXecYIse5xmy9npYYj/8xuAJDvYIn2bfVm2mwV
	 ucoPdHJ2zS7z4+TUa9hEuh9ref+aX2F5u4gs2FDL45rtiJBW7HV8fLY7X/cyV3RexT
	 h8qjlWBwsJwMtEy0IUeHQN8ywJOX/XfEymalv4tqsa1EvzcWubPfxySFLaRtxueiFZ
	 /asqGCsAcAmYJYZqoSb1IgYLIl1PUhb1mi+a31pBmUrFIHRtUhqGO1y58EMCcSUfp8
	 QCGCNXFzdYEw8BVBVShTtS6vaQUsbjaeppYwUrP8aUsIUmlMtQ5msGJoHM4IAjmxIu
	 mr9OZ1X7SR6Og==
Date: Wed, 8 Apr 2026 16:03:23 -0500
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
Message-ID: <20260408210323.GA316307@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260408205958.GA316081@bhelgaas>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13624-lists,linux-tegra=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[google.com,kernel.org,gmail.com,nvidia.com,arndb.de,linuxfoundation.org,nxp.com,valinux.co.jp,163.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[helgaas@kernel.org,linux-tegra@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-tegra,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nvidia.com:email]
X-Rspamd-Queue-Id: 98CAB3C3F00
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 08, 2026 at 03:59:59PM -0500, Bjorn Helgaas wrote:
> On Wed, Mar 25, 2026 at 12:37:50AM +0530, Manikanta Maddireddy wrote:
> > From: Vidya Sagar <vidyas@nvidia.com>
> > 
> > Host software initiates the L2 sequence. PCIe link is kept in L2 state
> > during suspend. If Endpoint mode is enabled and the link is up, the
> > software cannot proceed with suspend. However, when the PCIe Endpoint
> > driver is probed, but the PCIe link is not up, Tegra can go into suspend
> > state. So, allow system to suspend in this case.
> 
> > +static int tegra_pcie_dw_suspend(struct device *dev)
> >  {
> >  	struct tegra_pcie_dw *pcie = dev_get_drvdata(dev);
> > -	u32 val;
> >  
> >  	if (pcie->of_data->mode == DW_PCIE_EP_TYPE) {
> > -		dev_err(dev, "Failed to Suspend as Tegra PCIe is in EP mode\n"); > -		return -EPERM;
> > +		if (pcie->ep_state == EP_STATE_ENABLED) {
> > +			dev_err(dev, "Tegra PCIe is in EP mode, suspend not allowed\n");
> 
> Should this message say something about endpoint suspend not being
> allowed because the link is up?  IIUC, the endpoint *can* suspend if
> the link is down.

Oh, and I forgot: the subject line says "allow *system* suspend", but
it looks like this patch is concerned with *endpoint* suspend.

I assume that whatever an endpoint does, it can't prevent the host
from suspending?  I guess I'm just confused about the usage of "system
suspend" in the subject line and commit message -- does "system" refer
to the host or the endpoint?


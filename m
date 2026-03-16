Return-Path: <linux-tegra+bounces-12795-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGawCwlct2lnQQEAu9opvQ
	(envelope-from <linux-tegra+bounces-12795-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Mon, 16 Mar 2026 02:25:29 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C49762935FB
	for <lists+linux-tegra@lfdr.de>; Mon, 16 Mar 2026 02:25:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 999C63010B94
	for <lists+linux-tegra@lfdr.de>; Mon, 16 Mar 2026 01:25:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 501092192F4;
	Mon, 16 Mar 2026 01:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bEiYDBBN"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254B03B2BA;
	Mon, 16 Mar 2026 01:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773624325; cv=none; b=MH/XzR3fiz/D47Rm9wp4Qne38jL8bB3AHMUKBtTFVHGkIcTxrHRwi6oBWywFkbPSqCA99VMFgD7FMp1Wq2xCfoPiEWJ4wll6BU9bh3hb6M101//f0ruFhQONe7Tx3y9fRAsy38oZka7x479vfbUQvwK4hhVW3+qiuodSNjCqkF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773624325; c=relaxed/simple;
	bh=aHkbnn87tDJLEor7BJnTVAnBMXTWTv+C7Eg7gVuAo3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rh9N8arqdVhD+MZsxhSulhvk7pliItKfWYlVcuKtVzzUdqQ9M2oSXnFeemuqUq8YIxponr8AgTmwWbZ9NEp6fjmfUr51Fzzi09fqRLyuiKxCGbsg1jguek8h9SAhteDWKZVp9vvMFo2wroQ96/sZ48Lr3RAHnJnQ30bT+yfbr/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bEiYDBBN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE981C4CEF7;
	Mon, 16 Mar 2026 01:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773624324;
	bh=aHkbnn87tDJLEor7BJnTVAnBMXTWTv+C7Eg7gVuAo3Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bEiYDBBN7k31TXaMtwHgCb7gjw7pKuOm4itdb4rPNZdZ1FUuaEj2ZQ8BV9+j10I5S
	 38mvrMn2MyeG486OAk0G4xT5fJt8OK1U437FsSqfCvsQS1vyRAjD7VCWnESSqVAMsH
	 HPCbLivTQtjsABRrQT2ZCTH37zqwGC4H3oF8Jg3RODfoVe8LVJ6ryUeRXQ9MeQks6A
	 fShPVP9XRWp+X69goJIDBTOeW+I4P55ZJN2Clft3CjPldi78Hkg0SZi9shcFo2U5zG
	 yxvl2uGvqQCt27L8DuWWYIgzrBcpzSrOF443u+E7uf9Z/jLFBSXbYGP2V34f35gA1p
	 6ajYSQENJa7gQ==
Date: Mon, 16 Mar 2026 06:55:07 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: "bhelgaas@google.com" <bhelgaas@google.com>, 
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, "kwilczynski@kernel.org" <kwilczynski@kernel.org>, 
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, 
	Jon Hunter <jonathanh@nvidia.com>, "kishon@kernel.org" <kishon@kernel.org>, 
	"arnd@arndb.de" <arnd@arndb.de>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, 
	"Frank.Li@nxp.com" <Frank.Li@nxp.com>, "den@valinux.co.jp" <den@valinux.co.jp>, 
	"hongxing.zhu@nxp.com" <hongxing.zhu@nxp.com>, "jingoohan1@gmail.com" <jingoohan1@gmail.com>, 
	Vidya Sagar <vidyas@nvidia.com>, "cassel@kernel.org" <cassel@kernel.org>, 
	"18255117159@163.com" <18255117159@163.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 03/13] PCI: tegra194: Don't force the device into the
 D0 state before L2
Message-ID: <7d7p7b6ntvqmzfkqssioatepxnyh3h2f36uxrwgsc5txeosu46@mhruqj5ikjx7>
References: <20260303065448.2361488-1-mmaddireddy@nvidia.com>
 <20260303065448.2361488-4-mmaddireddy@nvidia.com>
 <6ekumkzuh6znxzf4deaawc46mgoen6haxcrvrein2irpw3xqhc@shwkkvjnlj6h>
 <a917e475-1ae9-4e12-98a1-babc49f042a7@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a917e475-1ae9-4e12-98a1-babc49f042a7@nvidia.com>
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
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12795-lists,linux-tegra=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[google.com,kernel.org,gmail.com,nvidia.com,arndb.de,linuxfoundation.org,nxp.com,valinux.co.jp,163.com,vger.kernel.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-tegra@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nvidia.com:email]
X-Rspamd-Queue-Id: C49762935FB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 15, 2026 at 06:51:23PM +0530, Manikanta Maddireddy wrote:
> 
> 
> On 05/03/26 3:10 pm, Manivannan Sadhasivam wrote:
> > On Tue, Mar 03, 2026 at 12:24:38PM +0530, Manikanta Maddireddy wrote:
> > > From: Vidya Sagar <vidyas@nvidia.com>
> > > 
> > > As per PCIe CEM spec rev 4.0 ver 1.0 sec 2.3, the PCIe Endpoint device
> > > should be in D3 state to assert wake# pin. This takes precedence over PCI
> > 
> > WAKE#
> > 
> > > Express Base r4.0 v1.0 September 27-2017, 5.2 Link State Power Management
> > > which states that the device can be put into D0 state before taking the
> > > link to L2 state. To enable the wake functionality for Endpoint devices,
> > > do not force the devices to D0 state before taking the link to L2 state.
> > > There is no functional issue with the Endpoint devices where the link
> > > doesn't go into L2 state (the reason why the earlier change was made in
> > > the first place) as the Root Port proceeds with the usual flow post PME
> > > timeout.
> > > 
> > 
> > So the previous claim in the comments is not true?
> > 
> > I agree with this patch in principle, but just want to know why the comment
> > claimed there is an issue if the devices are not in D0 state.
> > 
> > - Mani
> No, previous claim is true. D0 fix is done to fix L2 timeout with a specific
> Endpoint. However, later realized that it is breaking wake functionality
> with other Endpoints. As I mentioned in the commit message reverting D0 fix
> still causes L2 timeout with that specific Endpoint, but it doesn't cause
> any functional issue.
> 

Okay, I just looked up the mentioned section in r4.0. The spec suggests that it
is possible to initiate power removal without transitioning the device into
D3Hot. It didn't explicitly say that "put device into D0", which is quite
misleading.

Anyway, the previous comment as well as the workaround is not correct. So ammend
the commit message as per above in next version.

- Mani

-- 
மணிவண்ணன் சதாசிவம்


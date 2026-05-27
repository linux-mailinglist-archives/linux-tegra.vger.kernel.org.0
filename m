Return-Path: <linux-tegra+bounces-14701-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCPzA1gqF2qn7gcAu9opvQ
	(envelope-from <linux-tegra+bounces-14701-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Wed, 27 May 2026 19:31:04 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 641845E8539
	for <lists+linux-tegra@lfdr.de>; Wed, 27 May 2026 19:31:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DA9263066AB3
	for <lists+linux-tegra@lfdr.de>; Wed, 27 May 2026 17:23:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73D8C44A725;
	Wed, 27 May 2026 17:23:08 +0000 (UTC)
X-Original-To: linux-tegra@vger.kernel.org
Received: from mailout2.hostsharing.net (mailout2.hostsharing.net [83.223.78.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB2A175A77;
	Wed, 27 May 2026 17:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.78.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779902588; cv=none; b=gUrC1yjwHe6fA5138Bs/OsowmtPsR1wLuKviN5qMtDv0oX3JeURg4BLdB671k5mTPcUDV2ECfTkRY6eYCewBd8IsbOaREyqB6scn2tvGZI2YnkDMjsHnNXvOcgOSRTflAnUL189ykZpsZJMfR1kS7uytvN5Gi3ja6EOgs1matXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779902588; c=relaxed/simple;
	bh=EG+edTsXg11LXb/S00DjCVoO4co/7ZDo+mROtcbOsIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YHkBQoRM+8dNT56Nh/XHLvGtX751PgHjCBKs5ClkmweizALjw1+bMovqx1OlFRqN82r1b1Zhx9R/UufJuT7fMtoXhPr2/w8GX2i0ANKaHzyKL6L3HBHgbRaaPHK7R0YKywD686DRwnCl6NcVi4DGigm1RrzNhx3Lwxg2FIDgBus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass smtp.mailfrom=wunner.de; arc=none smtp.client-ip=83.223.78.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wunner.de
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (secp384r1) server-digest SHA384
	 client-signature ECDSA (secp384r1) client-digest SHA384)
	(Client CN "*.hostsharing.net", Issuer "GlobalSign GCC R6 AlphaSSL CA 2025" (verified OK))
	by mailout2.hostsharing.net (Postfix) with ESMTPS id 0D13B10DF9;
	Wed, 27 May 2026 19:22:56 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id F2D18610672A; Wed, 27 May 2026 19:22:55 +0200 (CEST)
Date: Wed, 27 May 2026 19:22:55 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Thierry Reding <thierry.reding@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczy??ski <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
	Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Kevin Xie <kevin.xie@starfivetech.com>, Aksh Garg <a-garg7@ti.com>,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v5 2/4] PCI: Use standard wait times for PCIe link
 monitoring
Message-ID: <ahcob7HMbyGvFgxc@wunner.de>
References: <20260526-tegra264-pcie-v5-0-84a813b979d7@nvidia.com>
 <20260526-tegra264-pcie-v5-2-84a813b979d7@nvidia.com>
 <ahV_r6NJWnmJptT2@wunner.de>
 <ahanoZgDwq3v6x8M@orome>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ahanoZgDwq3v6x8M@orome>
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14701-lists,linux-tegra=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[wunner.de: no valid DMARC record];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lukas@wunner.de,linux-tegra@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.996];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,wunner.de:mid]
X-Rspamd-Queue-Id: 641845E8539
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 27, 2026 at 10:28:51AM +0200, Thierry Reding wrote:
> On Tue, May 26, 2026 at 01:10:39PM +0200, Lukas Wunner wrote:
> > On Tue, May 26, 2026 at 10:53:11AM +0200, Thierry Reding wrote:
> > > Instead of defining the wait values for each driver, use common values
> > > defined in the core pci.h header file. Note that most drivers don't use
> > > the millisecond waits, but rather usleep_range(), so add these commonly
> > > used values to the header so that all drivers can use them.
> > 
> > Hm, why not just replace usleep_range() with msleep() and use the existing
> > macro instead of defining new ones?
> 
> I'm trying to somewhat unify the implementations across drivers without
> changing behaviour. I don't have a way of testing any of these drivers,
> so keeping the existing implementation and just switching out the symbol
> seemed like a good compromise.

It looks like the code was copy-pasted from one driver to the next
and I applaud every effort to deduplicate, unify and simplify things.

I don't quite see how using msleep() instead of usleep_range()
should result in breakage.  The drivers are just polling for
link up for an amount of time and as long as you're not decreasing
that amount, everything ought to be fine.  Moving to msleep()
should never decrease the amount.

> Then again, I count 2 drivers (in linux-next) that use the existing
> PCIE_LINK_WAIT_SLEEP_MS, one of which multiplies by MILLI to get at the
> US version (so it could easily be converted to the US_MIN version). Only
> pcie-designware.c uses msleep() with PCIE_LINK_WAIT_SLEEP_MS, so it is
> clearly the outlier.

Konrad Dybcio went ahead and replaced usleep_range() with msleep()
in that driver, kudos to him.  Cf. b262518262f5 ("PCI: dwc: Use msleep()
in dw_pcie_wait_for_link()").  If you could just carry over that change
to the other drivers that would be great.

Thanks,

Lukas


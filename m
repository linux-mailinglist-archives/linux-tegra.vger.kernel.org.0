Return-Path: <linux-tegra+bounces-14669-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4AMUK2OCFWoSWQcAu9opvQ
	(envelope-from <linux-tegra+bounces-14669-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Tue, 26 May 2026 13:22:11 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 56EA25D4CDA
	for <lists+linux-tegra@lfdr.de>; Tue, 26 May 2026 13:22:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C72283055E82
	for <lists+linux-tegra@lfdr.de>; Tue, 26 May 2026 11:18:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 740033E009E;
	Tue, 26 May 2026 11:18:55 +0000 (UTC)
X-Original-To: linux-tegra@vger.kernel.org
Received: from mailout3.hostsharing.net (mailout3.hostsharing.net [144.76.133.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3963321BD;
	Tue, 26 May 2026 11:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.76.133.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779794335; cv=none; b=Y4H8a2VRLrB3yMvHv0e3TTI5e/lOIHGpba7zJG9Nw6nHWT7uxF0Z5zZQLqOYtHQTntLRkq9L60BEb1rfWIs/W/6yAIr36rQN6+az0zpSWhsj/NmBVlNVJowqKg+CQhzp5BIi8MazpIVYbiSROK+pFB37+Xn/jVrKhePZae6eGig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779794335; c=relaxed/simple;
	bh=NJVVcILKyx4gZPT982sDkKyrsOuJppXb9db7z9pGu6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aYch+QVW12jL/2iysLIbsV/2rv8GocCEcydNvvrOvrOVsHGEcLD6xhLLYg4VGCoK4mqB98J4B8LuK20uwq1LnLQQ67qBE/J8IN3nWv1suAvyHQHNFP5Mqg/11wqQRrXWSRdskJABh/dBUqpsjdT5fX1TLSkufyg8igx+VLjUuks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass smtp.mailfrom=wunner.de; arc=none smtp.client-ip=144.76.133.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wunner.de
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (secp384r1) server-digest SHA384
	 client-signature ECDSA (secp384r1) client-digest SHA384)
	(Client CN "*.hostsharing.net", Issuer "GlobalSign GCC R6 AlphaSSL CA 2025" (verified OK))
	by mailout3.hostsharing.net (Postfix) with ESMTPS id 463BFC93;
	Tue, 26 May 2026 13:10:39 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 1E2B36109E4F; Tue, 26 May 2026 13:10:39 +0200 (CEST)
Date: Tue, 26 May 2026 13:10:39 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczy??ski <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
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
Message-ID: <ahV_r6NJWnmJptT2@wunner.de>
References: <20260526-tegra264-pcie-v5-0-84a813b979d7@nvidia.com>
 <20260526-tegra264-pcie-v5-2-84a813b979d7@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526-tegra264-pcie-v5-2-84a813b979d7@nvidia.com>
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[google.com,kernel.org,gmail.com,nvidia.com,mobiveil.co.in,nxp.com,bootlin.com,amd.com,starfivetech.com,ti.com,vger.kernel.org,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14669-lists,linux-tegra=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[wunner.de: no valid DMARC record];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lukas@wunner.de,linux-tegra@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.930];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 56EA25D4CDA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 26, 2026 at 10:53:11AM +0200, Thierry Reding wrote:
> Instead of defining the wait values for each driver, use common values
> defined in the core pci.h header file. Note that most drivers don't use
> the millisecond waits, but rather usleep_range(), so add these commonly
> used values to the header so that all drivers can use them.

Hm, why not just replace usleep_range() with msleep() and use the existing
macro instead of defining new ones?

> +++ b/drivers/pci/pci.h
> @@ -63,6 +63,8 @@ struct pcie_tlp_log;
>  /* Parameters for the waiting for link up routine */
>  #define PCIE_LINK_WAIT_MAX_RETRIES	10
>  #define PCIE_LINK_WAIT_SLEEP_MS		90
> +#define PCIE_LINK_WAIT_US_MIN		90000
> +#define PCIE_LINK_WAIT_US_MAX		100000

If you absolutely positively want to add a new macro, consider
90 * USEC_PER_MSEC instead of 90000.  Moreover, consider using
fsleep() instead of adding an additional MAX macro.

Thanks,

Lukas


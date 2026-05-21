Return-Path: <linux-tegra+bounces-14619-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBqNHw0mD2paGgYAu9opvQ
	(envelope-from <linux-tegra+bounces-14619-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Thu, 21 May 2026 17:34:37 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D61D55A8700
	for <lists+linux-tegra@lfdr.de>; Thu, 21 May 2026 17:34:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D4640330192C
	for <lists+linux-tegra@lfdr.de>; Thu, 21 May 2026 15:07:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63C8F35504D;
	Thu, 21 May 2026 15:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="Re7ewl5q"
X-Original-To: linux-tegra@vger.kernel.org
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0C7304BCB;
	Thu, 21 May 2026 15:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779375859; cv=none; b=jiY4CFvpYS6XmspO35NMKrIDfhE9EsDdDf+q1Hnj1b33sCYmbMlM7hCgpnX+WhSK+dt1kTBIb/JagWFvX5HvtIlnaEksgYoxq16fve6nAceTUaBdogGAZV5Vtd9ESRTczS4h5juhtBSPadOqZcqK89kX9L+m5ichvkzxSkMgFuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779375859; c=relaxed/simple;
	bh=4G1veOWylYb2tPFtyS0w9QISqTZ4cEDAwcsR0Mt6xUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DpMbP8U3WInov4IH/o9U7dsVfF7U2vDdchvdCozHg5HoWbaZLvNdm+FoVF/qzgwmN0PfxTsrepbzJEs5aXAeqFfHqjCg6uCIWQ+hSsZcKqH0LYRYMrmc+z1CmZa7xr669idDuNiHR6GADDGPpkTUtPxjncORS3hcH0+R6ENs+HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=Re7ewl5q; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description;
	bh=UO7LCQlcsGRaCfbYucrA5z24naMLBUSht2C+awTxmlU=; b=Re7ewl5q1VylGMHgOtGfm7zDJd
	Zqc51JriJaLu/IUgeLZaWzWriR8b8dvx6ZZlJMT03QpT7s9tzwCEldRseTP59czQqUbEdvCRg5K1C
	aBKdLDVZSkJQRTMLhNCjkzQ0MH+9tdJ1Fh6ngiQSjOXl3VHz8oUp2zvt97FvBwBYNKg0zf9loHah9
	K6KGpwc5XLc0JufexWr0qVX8fiSt2W0dHv8zEFoHBRnni1QOpsM+jNmmOCuS/i6bMAOu9Zj1luLkH
	nurzwwsHh70hfIDokmxZTjiHlvS2uYN80vgO/+YfGaQFs3ssC+2ISv4CwDU1Qgmy2TZsylwmvgS24
	ZVe/RJuw==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wQ4wX-003y1X-0D;
	Thu, 21 May 2026 15:04:13 +0000
Date: Thu, 21 May 2026 08:04:08 -0700
From: Breno Leitao <leitao@debian.org>
To: Vishwaroop A <va@nvidia.com>
Cc: Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>, 
	Laxman Dewangan <ldewangan@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, 
	Suresh Mangipudi <smangipudi@nvidia.com>, Krishna Yarlagadda <kyarlagadda@nvidia.com>, 
	linux-tegra@vger.kernel.org, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] spi: tegra210-quad: Convert to hard IRQ with
 high-priority workqueue
Message-ID: <ag8dgimI3SfTo1Uy@gmail.com>
References: <20260519155108.4092518-1-va@nvidia.com>
 <20260519155108.4092518-2-va@nvidia.com>
 <ag3ReYsoyCh-niZH@gmail.com>
 <20260520192210.70216-1-va@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260520192210.70216-1-va@nvidia.com>
X-Debian-User: leitao
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[debian.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[debian.org:s=smtpauto.stravinsky];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14619-lists,linux-tegra=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[debian.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leitao@debian.org,linux-tegra@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-tegra];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: D61D55A8700
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello Vishwaroop,

On Wed, May 20, 2026 at 07:22:10PM +0000, Vishwaroop A wrote:
> On Wed, May 20, 2026 at 08:25:23AM -0700, Breno Leitao wrote:
> > > +     status = tegra_qspi_readl(tqspi, QSPI_TRANS_STATUS);
> > > +     if (!(status & QSPI_RDY))
> > > +             return IRQ_NONE;
> > > +
> > > +     spin_lock(&tqspi->lock);
> >
> > Can you help me to understand what the tqspi->lock protects? I am still
> > a bit confused by this lock, but at the first glance, I am wondering if
> > you don't need to have the lock while reading the status.
> 
> The lock itself protects the software state that is shared between
> the ISR, the workqueue bottom-half, and the timeout handler running
> in the transfer thread.

Thanks for the reply!

I got the impression that tqspi->lock is also serializing hardware
accesses — the hard IRQ holds it across the readl(QSPI_FIFO_STATUS) and
across tegra_qspi_mask_clear_irq(), which does an RMW on QSPI_INTR_MASK
and a W1C on QSPI_TRANS_STATUS; the setup, start, error and bottom-half
paths similarly hold it across MMIO.

If the lock is really only guarding curr_xfer / status_reg / tx_status
/ rx_status, why hold it across those register accesses at all?

Thanks,
--breno


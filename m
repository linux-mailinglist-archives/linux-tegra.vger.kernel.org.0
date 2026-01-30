Return-Path: <linux-tegra+bounces-11740-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KODoHYnnfGlTPQIAu9opvQ
	(envelope-from <linux-tegra+bounces-11740-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Fri, 30 Jan 2026 18:16:57 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE9ABCEF5
	for <lists+linux-tegra@lfdr.de>; Fri, 30 Jan 2026 18:16:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 69C05310BB23
	for <lists+linux-tegra@lfdr.de>; Fri, 30 Jan 2026 17:09:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91C8A35CBB5;
	Fri, 30 Jan 2026 17:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XLipvXuQ"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E08D35CB6D;
	Fri, 30 Jan 2026 17:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769792878; cv=none; b=Uw1+lJtuerfnNPhIYs+Y6ojEoYKPbJMGmJ77YeSeHbhkK0uKpBMjKJ8TE/EvvsnJLiOomNAf2BlGlx81e3UzCVHHCCiT41p+YZfwhid2o8zvODSkVbHVn5LUVLTLqLuYEwMYghDbeh/gmQVxpQLDCdZUDrQxdOQEYwSZclBoDRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769792878; c=relaxed/simple;
	bh=xIfKR7/Zry4l82dwEl8qXSXVtg9AxKL9mScw9RoaQyU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WGcQKneZUYZaPAy8ltHzkUfr4MZLPWcV0WbsPd8MxnULx+c5qyyXrdsYSj9ftN48r2WY1ejnYuuUwy/prdKLtVzkYjlAoTX3kK1F0K1y7G9ps9B/DTdTZ/62t2XAYbuLMxocUyfiwV4UUB4Lid3fjW6peJeyzV+nQmhPzMFGEQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XLipvXuQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1588C4CEF7;
	Fri, 30 Jan 2026 17:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769792878;
	bh=xIfKR7/Zry4l82dwEl8qXSXVtg9AxKL9mScw9RoaQyU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=XLipvXuQKXNhkc39H1P3LnIOqcXCtm6xRO8U4XRaHm9f9BHfAcvbAJnNCJcd1Z7Gh
	 IE3cAvHt64lPfmGHB+qY5cfc6zG5oxN609Dm5xGicH1AQnr4nVZBNiVdKofJcrxF8T
	 7GzpVvbR/vFMZhbGl24CzQOKM62cHADGy/CNVg2MuazXHj27yLdIVI8R/UrW22nEiO
	 QNZuaQghlYPi3wsHaqpDvIsxN9RLqaLSOWrfrIgljfSGzKAK7NhJMamKZPaTDUC2gx
	 qTrVB6YCe5V6Anfsv/j0vSCLkoSFDAPzR9IFxp6LXTc1lbZcwLw1l64opo8sWFjtkV
	 DrGVOQnNWktNw==
From: Mark Brown <broonie@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Laxman Dewangan <ldewangan@nvidia.com>, Vishwaroop A <va@nvidia.com>, 
 Breno Leitao <leitao@debian.org>
Cc: Thierry Reding <treding@nvidia.com>, linux-tegra@vger.kernel.org, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel-team@meta.com, soto@nvidia.com
In-Reply-To: <20260126-tegra_xfer-v2-0-6d2115e4f387@debian.org>
References: <20260126-tegra_xfer-v2-0-6d2115e4f387@debian.org>
Subject: Re: [PATCH v2 0/6] spi: tegra-qspi: Fix race condition causing
 NULL pointer dereference and spurious IRQ
Message-Id: <176979287557.687233.9621896934235881934.b4-ty@kernel.org>
Date: Fri, 30 Jan 2026 17:07:55 +0000
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11740-lists,linux-tegra=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,nvidia.com,debian.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-tegra@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CDE9ABCEF5
X-Rspamd-Action: no action

On Mon, 26 Jan 2026 09:50:25 -0800, Breno Leitao wrote:
> The tegra-quad-spi driver is crashing on some hosts. Analysis revealed
> the following failure sequence:
> 
> 1) After running for a while, the interrupt gets marked as spurious:
> 
>     irq 63: nobody cared (try booting with the "irqpoll" option)
>     Disabling IRQ #63
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/6] spi: tegra210-quad: Return IRQ_HANDLED when timeout already processed transfer
      commit: aabd8ea0aa253d40cf5f20a609fc3d6f61e38299
[2/6] spi: tegra210-quad: Move curr_xfer read inside spinlock
      commit: ef13ba357656451d6371940d8414e3e271df97e3
[3/6] spi: tegra210-quad: Protect curr_xfer assignment in tegra_qspi_setup_transfer_one
      commit: f5a4d7f5e32ba163cff893493ec1cbb0fd2fb0d5
[4/6] spi: tegra210-quad: Protect curr_xfer in tegra_qspi_combined_seq_xfer
      commit: bf4528ab28e2bf112c3a2cdef44fd13f007781cd
[5/6] spi: tegra210-quad: Protect curr_xfer clearing in tegra_qspi_non_combined_seq_xfer
      commit: 6d7723e8161f3c3f14125557e19dd080e9d882be
[6/6] spi: tegra210-quad: Protect curr_xfer check in IRQ handler
      commit: edf9088b6e1d6d88982db7eb5e736a0e4fbcc09e

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark



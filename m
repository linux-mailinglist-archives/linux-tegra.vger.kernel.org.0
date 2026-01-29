Return-Path: <linux-tegra+bounces-11706-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eLXJDYVBe2n6CwIAu9opvQ
	(envelope-from <linux-tegra+bounces-11706-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Thu, 29 Jan 2026 12:16:21 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C47BAF855
	for <lists+linux-tegra@lfdr.de>; Thu, 29 Jan 2026 12:16:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B568300CC13
	for <lists+linux-tegra@lfdr.de>; Thu, 29 Jan 2026 11:13:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 953593806A7;
	Thu, 29 Jan 2026 11:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sq+RF7Gy"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72566352C53;
	Thu, 29 Jan 2026 11:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769685212; cv=none; b=Bpv0KBIqFaEbMfjrl2J7X5uviQUyT7edXeU48nnIxQz6OWlR8Sf2zDJBFESauY1kNs+KNy6q5w+U0z9Kz44O+vtIo6zXq+cqDdosFdXh83/jppPIzcbtjwhp15NY14+9Tvjmtbuh5n3HBG6bflMO3MQS3froymRryidGTIv283Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769685212; c=relaxed/simple;
	bh=ZLkeBI2X9xXMREh52V/bUpipA8CqwwGn/yY2655h8l4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PMZsYnWsn4PUFuIjJzBZETMfWt6m8emqiDzr9GijBJKFl06cBnRBIw/dBMdT21iweu7DBcLLx3hqjt1H4V/QD0qVeQrVzPWDVnxczHuedg1pGMp0/22XapPneDnONxr98liyk9zXSlnHSa0fgXlstep7dCEHuwqNwRtYnpn9dYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sq+RF7Gy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E0ACC4CEF7;
	Thu, 29 Jan 2026 11:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769685212;
	bh=ZLkeBI2X9xXMREh52V/bUpipA8CqwwGn/yY2655h8l4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=sq+RF7GyUUE0Y5YQSpuO+1P+8AP8QuyTgqt8+Urnk2VkYRl1srbxgKNv7UK8TQTGM
	 r98sPuP2dakna4RieBkGv44oKWuTuF1MC33F+Or/097mlVYWgT1W8ceHmF/hYKbV9A
	 3TpMGAVvlbo8wi6IckTPSTwNxSfz4xk236TvEfp8v0IVuRz5Yd2Bqn5zBLhumWEYnj
	 70UmKI61Nemftyr9EH1LOemRkf9u9x41q8W+S/GZ2cDEkkcXKFN7KdJbjwbj/hx0iw
	 Tu8vwL7KZykAzK/8qmKUH2n2aBge4ur2TQpCMLsX2LwzXM2RdAMDvjzQsroZh1Lrsn
	 L2hubwkiik9bg==
From: Mark Brown <broonie@kernel.org>
To: "Sheetal ." <sheetal@nvidia.com>
Cc: Sander Vanheule <sander@svanheule.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J . Wysocki" <rafael@kernel.org>, 
 Danilo Krummrich <dakr@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Mohan kumar <mkumard@nvidia.com>, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-tegra@vger.kernel.org
In-Reply-To: <20260123095346.1258556-1-sheetal@nvidia.com>
References: <20260123095346.1258556-1-sheetal@nvidia.com>
Subject: Re: (subset) [RFC PATCH v3 0/4] regmap: reg_default_cb for flat
 cache defaults
Message-Id: <176968520916.21336.4038544695578334286.b4-ty@kernel.org>
Date: Thu, 29 Jan 2026 11:13:29 +0000
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
	TAGGED_FROM(0.00)[bounces-11706-lists,linux-tegra=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[svanheule.net,linuxfoundation.org,kernel.org,gmail.com,perex.cz,suse.com,nvidia.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
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
X-Rspamd-Queue-Id: 8C47BAF855
X-Rspamd-Action: no action

On Fri, 23 Jan 2026 15:23:42 +0530, Sheetal . wrote:
> This series adds a reg_default_cb callback for REGCACHE_FLAT to provide
> defaults for registers not listed in reg_defaults. Defaults are loaded
> eagerly during regcache init and the callback can use writeable_reg to
> filter valid addresses and avoid holes.
> 
> Tegra ASoC drivers set reg_default_cb and add writeable_reg filtering for
> AHUB RX holes to prevent invalid addresses from being marked valid.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: tegra: Add AHUB writeable_reg for RX holes
      commit: 0ba6286a71581aaf8413a55b9bd90ea3463fd23b
[3/4] ASoC: tegra: set reg_default_cb callback
      commit: 9409d18bf7d58ab716337749e28e2caba0d64cb0

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



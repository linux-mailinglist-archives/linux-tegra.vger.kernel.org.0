Return-Path: <linux-tegra+bounces-12407-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DC2LhTGpmn3TQAAu9opvQ
	(envelope-from <linux-tegra+bounces-12407-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Tue, 03 Mar 2026 12:29:24 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0561EDCF0
	for <lists+linux-tegra@lfdr.de>; Tue, 03 Mar 2026 12:29:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E94C3317999D
	for <lists+linux-tegra@lfdr.de>; Tue,  3 Mar 2026 11:21:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37A38428490;
	Tue,  3 Mar 2026 11:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AdTAassW"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB245421F1F;
	Tue,  3 Mar 2026 11:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772536814; cv=none; b=Rnh3BYWxtqs+tm0AZ/iYOpH4Yf3w5qsKM8HJhgKf8nnH16AKZ3ZPpix5/jy+ssyWr4Xexl8pOZtaB0ejEQkiWQw/zIFdt+hhLd6w4kSZpb1SiTnTEu7Fwj2GJWEEg7B8XUFm7Ighab5MyhcDN+47T1GCxAZCUXfaYX4qVg46HfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772536814; c=relaxed/simple;
	bh=5gsU3MpRyvJgy0jHTrGZxVFs3KaPcjh/qBnxHe/0DJI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Nws55VEPcdd5lliPIlRvX7r5Eienvuc3decuUNJWjK/0c7tWJ1JGPJOI9sg5ios7jhNHv2sSTd7UKh/kU7Bscrb8A8ZPp3q6CMBP/Yrkh2Rtsl8I9QqOHiE9AMSZ8JNnqJnIWjLdccmpdTFaxaHI7sf+52+rJTzlR+5Fqs9IEp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AdTAassW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3358C2BC9E;
	Tue,  3 Mar 2026 11:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772536814;
	bh=5gsU3MpRyvJgy0jHTrGZxVFs3KaPcjh/qBnxHe/0DJI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=AdTAassWbw+I6PNYdbChW8VRb84YqbWXS00IQtF+praI+4ik21pZH6TzZCq3CELhE
	 /3Q2yKVRBbEbqg71aLv58173pq6XNg/gj9TbMZ1D0u1aB2Zzyzfff4UqCFLL9KLwE9
	 vKp6ghvxJ+QJ9wUW9tAb4uq8ot7yU60cE09d09HBPvOTbR9og7xbAsr+9/36RgaQDT
	 iQYT5L6cIVZvov8SNe1uazvohn4SZ6y+7HgQP5E9ar22PjFrN4o1IzWqqpJNBeFHYD
	 zWHHna9ZC53iahZ4e2OjS3gFHersye+vjy1VK1FHKlww/6/iqQbowg4r+tkvRd8P8d
	 ygMLJ9zqBVflQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 "Sheetal ." <sheetal@nvidia.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Sameer Pujar <spujar@nvidia.com>, Mohan kumar <mkumard@nvidia.com>, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260302085323.3139571-1-sheetal@nvidia.com>
References: <20260302085323.3139571-1-sheetal@nvidia.com>
Subject: Re: (subset) [PATCH 0/2] ASoC: tegra: Add Tegra238 sound card
 support
Message-Id: <177253681160.22767.9266052644842174169.b4-ty@kernel.org>
Date: Tue, 03 Mar 2026 11:20:11 +0000
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-38bf1
X-Rspamd-Queue-Id: 1D0561EDCF0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12407-lists,linux-tegra=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,nvidia.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-tegra@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Mon, 02 Mar 2026 14:23:21 +0530, Sheetal . wrote:
> Add Tegra238 sound card support in the Tegra audio graph card driver,
> as Tegra238 requires different PLLA and PLLA_OUT0 clock rates compared
> to other Tegra platforms.
> 
> Sheetal (2):
>   ASoC: dt-bindings: tegra: Add compatible for Tegra238 sound card
>   ASoC: tegra: Add support for Tegra238 soundcard
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: tegra: Add compatible for Tegra238 sound card
      commit: a8df7892a9f42b2e2d5851f8835c734bd7fe8ad4

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



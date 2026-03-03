Return-Path: <linux-tegra+bounces-12406-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJqDHdzFpmn3TQAAu9opvQ
	(envelope-from <linux-tegra+bounces-12406-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Tue, 03 Mar 2026 12:28:28 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C72FD1EDCB5
	for <lists+linux-tegra@lfdr.de>; Tue, 03 Mar 2026 12:28:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 45C913160B5E
	for <lists+linux-tegra@lfdr.de>; Tue,  3 Mar 2026 11:20:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94BED423A72;
	Tue,  3 Mar 2026 11:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J08A6Omr"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00575425CFE;
	Tue,  3 Mar 2026 11:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772536807; cv=none; b=rYqZI4pMbRwqNL9YZog7euaFnRkrqg9aRxYPVdbBTvYHUEZwuUg3kqHfgXmhvYOaJL5K45Wv1vd8Z6s7+Xho/jb5noU+JSSOkhzb2zDHWFE7yEAz1494va3U+4DBOor7PdEi9RY0YkgwDRfXLtxAqI6Ybz0jPJRMvCb4pKBT4u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772536807; c=relaxed/simple;
	bh=e2Qz2CYwgr1iExAfg2nlZe4rZPclxfu/shWDQAvDFzQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=H6Ldb2CGbLd7HESf3JQXpMuN1y/9c9UiXwQqJzgtkML8Lc3XzM2wxFhPg+8XQuld45Zn19HRa8Ko5r+BeMw1eku8JOIpYw9wSiC1hyNMungHT8fEAr8q/sMjT3biCNPxrdKX2YISHKQK4sN9vjSDi5h0Ppi59AVEH9pPv7C2pWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J08A6Omr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA1EDC2BC9E;
	Tue,  3 Mar 2026 11:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772536806;
	bh=e2Qz2CYwgr1iExAfg2nlZe4rZPclxfu/shWDQAvDFzQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=J08A6OmrKnYtc0kF6TmtANYWU1D0kgvs92Sym498jl0fG/U1Kql1FpRf+HHawmIuh
	 F+uvXAp4dRueO+6YhWDp/WhOtC4dI45mOn/0YsZzXcecOIF7hyMzceKgpV5tIqOGd6
	 +S/NLYi2HkGFnc0JLiwcsXQcFAInCO2D6ZadkKsqf7W1AjFIU/AVdIFuvRVVkgsVrC
	 QvTglGQLaA6eY1X7g7MFzz+66mUZREq8YPFJT4OFWv9wmip1xa392aWwqlk/4qOcb1
	 8bPB1gKfSpt02Dn4wD03Pm2y45Jboq4op1xeBMFjn26eqFppypG4ppEIvfyUL1OQqg
	 XaXfNYLChtyfQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 =?utf-8?q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>, 
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260223065051.13070-1-clamor95@gmail.com>
References: <20260223065051.13070-1-clamor95@gmail.com>
Subject: Re: [PATCH v3 0/5] ASoC: tegra: Add support for WM8962 and CPCAP
 codecs
Message-Id: <177253680370.22767.5594712156788646964.b4-ty@kernel.org>
Date: Tue, 03 Mar 2026 11:20:03 +0000
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-38bf1
X-Rspamd-Queue-Id: C72FD1EDCB5
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
	TAGGED_FROM(0.00)[bounces-12406-lists,linux-tegra=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,nvidia.com,perex.cz,suse.com,yahoo.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Mon, 23 Feb 2026 08:50:46 +0200, Svyatoslav Ryhel wrote:
> Add support for WM8962 and CPCAP codecs found in various Tegra devices.
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: dt-bindings: nvidia,tegra-audio: document CPCAP CODEC
      commit: d6b634cbc2eed73497877c95a7807d0f34fa4459
[2/5] ASoC: tegra: Support CPCAP by machine driver
      commit: a34547b389a91bf0709f0901c3752ccaf63730cd
[3/5] ASoC: dt-bindings: nvidia,tegra-audio: document WM8962 CODEC
      commit: 79d73f5a0b7a702a19189c1a237ae3728d88de59
[4/5] ASoC: tegra: Support WM8962 by machine driver
      commit: 536ffa105e16ca3f6e7de53f9d6059f53d0207f7
[5/5] ASoC: dt-bindings: nvidia,tegra-audio-max9808x: document additional board pins
      commit: 06dba254de95b16e7793224d29daa5195de2e581

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



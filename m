Return-Path: <linux-tegra+bounces-13242-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kFD0DPgrxGmZwgQAu9opvQ
	(envelope-from <linux-tegra+bounces-13242-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Wed, 25 Mar 2026 19:39:52 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2C032AAB9
	for <lists+linux-tegra@lfdr.de>; Wed, 25 Mar 2026 19:39:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 548A6304601E
	for <lists+linux-tegra@lfdr.de>; Wed, 25 Mar 2026 18:31:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62D6333A708;
	Wed, 25 Mar 2026 18:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mHB06E4o"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FAE9334C28;
	Wed, 25 Mar 2026 18:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774463469; cv=none; b=fp/BuO/GVo54SwLoSDBhgJcT4C3p+705xe3VMDoYPmGi5bHhQ1Kxpn+BkJ6PKy900ghTzExBwffZSyUvpkV78uq4nNKbscUSolPEFZhvaab+wMMz6ukpDxzfoWpHbHSoQIiHyaXjxLuryzeZpvKmJLN9n2KNn6ibsKJb30pATdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774463469; c=relaxed/simple;
	bh=DQbbAOyhxw+23J3KBAlGhHaExbNzeCQDdun5Q8A4fyo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=busTOY1p4g5soHawym0hEig8d3hUZM8KJ6qEi2JqFv/cZImugPgiKnWDg3MdE3oK9PuG5kJ+7JW080bzQ6Z4grmySCJBWOYjeIE18FfLWKwztBAZ8DeRHU+bCroxQhm4zc81I+aiWlNs2iKRzWEDqlZ9QhM9TG3inzN3yhBvvAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mHB06E4o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB380C2BCB0;
	Wed, 25 Mar 2026 18:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774463468;
	bh=DQbbAOyhxw+23J3KBAlGhHaExbNzeCQDdun5Q8A4fyo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mHB06E4oOSK/xs8kR0+aU9mXpI4v4qU5bN9TBZKD8VStKkHDtM/bOorpESsp6L2jw
	 XJtMFBOQqBCz4eJy83r/VVnnHyY2PS4JubFprmmCZTeZI7sIBVqI+pAqxGoYhanEsR
	 BbejA/Nw8/d1iU+B65WhSQ7djFC9WFxZEthkTUnNvEmkxDxw+BdX5+6HxrT+MCudwd
	 MH2AQYebBbJsFfu58W7LOO9osq2w1zwv4GkXa9FyZ/7LCQx0B3HtteD9tgOGg1IoSq
	 3ZQh0V94l2t7WyXxFcuK8/9BT2uwCSOrSZjMTll0hoELPZCnFTJ7pldCBZiZuruh6T
	 k154c3xjstj/g==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Sheetal <sheetal@nvidia.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Mohan Kumar <mkumard@nvidia.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 linux-sound@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260325101437.3059693-1-sheetal@nvidia.com>
References: <20260325101437.3059693-1-sheetal@nvidia.com>
Subject: Re: (subset) [PATCH v3 00/14] ASoC: tegra: Add error logging for
 probe and callback failures
Message-Id: <177444470667.74886.6102317039848964711.b4-ty@b4>
Date: Wed, 25 Mar 2026 13:18:26 +0000
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-6cc06
X-Developer-Signature: v=1; a=openpgp-sha256; l=3222; i=broonie@kernel.org;
 h=from:subject:message-id; bh=DQbbAOyhxw+23J3KBAlGhHaExbNzeCQDdun5Q8A4fyo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpxCnphKVscIT0b0Nxf+oCEKeZZnpyb20MhqiiL
 pT5Z6x/02eJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCacQp6QAKCRAk1otyXVSH
 0NJ1B/9jJ7m4v575HwEEYrieL6J0R8S6E8Xz7L5HDeIwoomDQiJ+KToDrECc+wZhPsNeoUrCtem
 Hq1ye+qlCPH9SXbaX9zfPKY0ihzGPxryuRebb3uIlt51+ZnnonyojoRn7GyY1TehmUXca14P9A8
 I3LuI8o9HlenF3l3/nPJwfT1TSjRIwBIGy9/YzJnA8HfuW2h2ySRNyQdadw2V/OGYaR+wd0RfHe
 N5cINdrjsF8yihO8YcE++xhR5sumHantO5F/wf86Uw5Z5iBmYy//bAL7jJz8PK6eeHUuMXAcO/W
 /Hz1Y7fBsOKjuj0dqI7XsWatwXYm9FaYUgrnMUuIfyKqgWNy
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,nvidia.com];
	TAGGED_FROM(0.00)[bounces-13242-lists,linux-tegra=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-tegra@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8A2C032AAB9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 25 Mar 2026 10:14:23 +0000, Sheetal wrote:
> ASoC: tegra: Add error logging for probe and callback failures
> 
> Log errors in probe and runtime error paths across Tegra audio drivers.
> Use dev_err_probe() in probe paths and dev_err() in runtime callbacks.
> Skip redundant logging where the underlying API already reports errors.
> 
> Changes in v3:
> - Split single patch into per-driver patch series for easier review
>   and incremental merging.
> - Drop dev_err() from tegra_ahub_put_value_enum() since the error path
>   is userspace-triggerable and would allow log spamming.
> - Drop dev_err() from tegra210_mixer_set_audio_cif() since the driver
>   advertises S8 format support but this function doesn't handle it,
>   creating a userspace-triggerable log spam path.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[01/14] ASoC: tegra: Use dev_err_probe() in tegra186_asrc probe
        https://git.kernel.org/broonie/sound/c/884f3101d1ed
[02/14] ASoC: tegra: Use dev_err_probe() in tegra186_dspk probe
        https://git.kernel.org/broonie/sound/c/6205ca05227f
[04/14] ASoC: tegra: Add error logging in tegra210_adx driver
        https://git.kernel.org/broonie/sound/c/50e51b84a4b3
[05/14] ASoC: tegra: Use dev_err_probe() in tegra210_ahub probe
        https://git.kernel.org/broonie/sound/c/802d0d6c25b3
[06/14] ASoC: tegra: Add error logging in tegra210_amx driver
        https://git.kernel.org/broonie/sound/c/d310c08db2d8
[07/14] ASoC: tegra: Use dev_err_probe() in tegra210_dmic probe
        https://git.kernel.org/broonie/sound/c/ca069c3403ec
[08/14] ASoC: tegra: Add error logging in tegra210_i2s driver
        https://git.kernel.org/broonie/sound/c/67b7bcdd9798
[10/14] ASoC: tegra: Use dev_err_probe() in tegra210_mixer probe
        https://git.kernel.org/broonie/sound/c/3d027d4b93b9
[11/14] ASoC: tegra: Use dev_err_probe() in tegra210_mvc probe
        https://git.kernel.org/broonie/sound/c/f2067c1dba07
[12/14] ASoC: tegra: Use dev_err_probe() in tegra210_sfc probe
        https://git.kernel.org/broonie/sound/c/856ffd8f4aae
[13/14] ASoC: tegra: Use dev_err_probe() in tegra_asoc_machine probe
        https://git.kernel.org/broonie/sound/c/fa11e1cb2b77
[14/14] ASoC: tegra: Use dev_err_probe() in tegra_audio_graph_card probe
        https://git.kernel.org/broonie/sound/c/f7d9eb0291ef

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



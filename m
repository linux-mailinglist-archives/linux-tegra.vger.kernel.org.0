Return-Path: <linux-tegra+bounces-13516-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFReHBtUzWk6cAYAu9opvQ
	(envelope-from <linux-tegra+bounces-13516-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Wed, 01 Apr 2026 19:21:31 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1852B37E957
	for <lists+linux-tegra@lfdr.de>; Wed, 01 Apr 2026 19:21:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 058BC3062052
	for <lists+linux-tegra@lfdr.de>; Wed,  1 Apr 2026 17:20:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B63E84779B8;
	Wed,  1 Apr 2026 17:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C8UI8/hW"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7631447DD58;
	Wed,  1 Apr 2026 17:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775063984; cv=none; b=u8SlIkOqZ62TtlR9MMudidN9bGlwcJk3hfHF4gafyusCBcjPxp3OzqdP0jLo7vwF7FNz6oLNTKMuDkVLS9yZ9U875dgJXfvaiyaZdQ5LpBiTE+wsMc6oNoOggcEK2ZCqJxk51Wa11vbtWPjR/Yt+pIwWi9hD1Zqji1nxKrYCnrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775063984; c=relaxed/simple;
	bh=uMhtPXn8heQIL1Q2iGxucpd7hE6zitkIXcCkID7YLsg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=YLd6e5a+ZDfDgFyAMt7Pna6WsvAa7ZhH4QAFmSAkcVqYzz0gPpeazEp8ZOkcqDkl4fQn49c/AxFtlxcfMT62kb0ngChD49ADs1CMldkQwOiYRg6Kg9aZ7RhZCr8VkYP+X1N0IhfYCZB4sRsiWjgkKOfRbFxb5KsqdWSZRTlRugU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C8UI8/hW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34231C4CEF7;
	Wed,  1 Apr 2026 17:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775063984;
	bh=uMhtPXn8heQIL1Q2iGxucpd7hE6zitkIXcCkID7YLsg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=C8UI8/hWaDXvKBtIe1xsIUEnJfO9GU1jC5qEvYoao3udoH7wrw9A91wv/8MOEFKSe
	 fv3ycHj3PubA05euqjOPCvHlCJY9P3Ww0vGJeDw16ZrKhOqCtS/ZZ6RcZjoJSUB/AX
	 kWs2oiwZExcBQsCtvLmxXM15GEeqSF3kCD+jcnzrtxIwELz54s2uvceZk26JgrTZn2
	 ipUuhrNGseVaT0unkdhQqs7ZFeSic55hl3L2qKGNletL7728B1s7u9XnOoN1mbCAD2
	 KTngQgtiqhmh5yb2xJgehCrWhIdV2SGO2YHNwTFTSZs5hN8GcSmdm3L0MfhKhDWKQv
	 Qezlg3SZ/964g==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Sheetal <sheetal@nvidia.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Mohan Kumar <mkumard@nvidia.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 linux-sound@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260401112500.4076861-1-sheetal@nvidia.com>
References: <20260401112500.4076861-1-sheetal@nvidia.com>
Subject: Re: [PATCH v4 0/4] ASoC: tegra: Add error logging for probe and
 callback failures
Message-Id: <177505162649.145704.12817876647775839849.b4-ty@b4>
Date: Wed, 01 Apr 2026 14:53:46 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-7777e
X-Developer-Signature: v=1; a=openpgp-sha256; l=1860; i=broonie@kernel.org;
 h=from:subject:message-id; bh=uMhtPXn8heQIL1Q2iGxucpd7hE6zitkIXcCkID7YLsg=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhsyzwWvtH+j8Y86ckalfX9yQkXb424aYEGbmpEOr+V42b
 g91e6jWyWjMwsDIxSArpsiy9lnGqvRwia3zH81/BTOIlQlkCgMXpwBM5JsZ+38/oc0mFpYvrzMc
 2i+1bpFnlyfr5EX5Z/0aI0LPFIiyvDq6NFnNtT+/c/lPuXqhWWvXKEvEFEW4fLedHmCwcKpgs6j
 uw/RKP51+c8ujQZEPuMwND/0ImmsrYr351B1WduWwqWxxPzyvmrrG7s4zZfaa6znFJu3znoyriq
 db3XNM1q9kS5vOddBF/M5Rozr21y3FxYxP81Xn69/Zda1M+UUgj+x2WT6BjTdyfuvJGfXyZsibB
 cwq4zzPuXb2ef6rbG+L7a4+DT5uevpb7nyOAIe5rm6pd6u9Fr9K3y6bFn5SdFdW+ZytfhuZb2cv
 EYtYz9ekGs3w4Mb+LH2GnyazDd0EUhQFf/BZHc6Tkr0DAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,nvidia.com];
	TAGGED_FROM(0.00)[bounces-13516-lists,linux-tegra=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-tegra@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1852B37E957
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 01 Apr 2026 11:24:56 +0000, Sheetal wrote:
> ASoC: tegra: Add error logging for probe and callback failures
> 
> Resend pending  v3 patches with fixes and add remaining
> dev_err_probe() conversions.
> 
> Patch 1 replaces v3 patch 03/14 (ADMAIF).
> Patch 2 replaces v3 patch 09/14 (OPE/PEQ/MBDRC).
> Patch 3 is new - adds regmap init conversions across 10 drivers.
> Patch 4 is new - adds clock error conversions in tegra_asoc_machine.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/4] ASoC: tegra: Add error logging in tegra210_admaif driver
      https://git.kernel.org/broonie/sound/c/00d6070ec02c
[2/4] ASoC: tegra: Use dev_err_probe() in OPE, PEQ and MBDRC drivers
      https://git.kernel.org/broonie/sound/c/2333abb25c7e
[3/4] ASoC: tegra: Use dev_err_probe() for regmap init failures
      https://git.kernel.org/broonie/sound/c/4a8fe27e122e
[4/4] ASoC: tegra: Use dev_err_probe() in tegra_asoc_machine probe
      https://git.kernel.org/broonie/sound/c/b015ef4eaeff

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



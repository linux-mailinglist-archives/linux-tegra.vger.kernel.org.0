Return-Path: <linux-tegra+bounces-14165-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMliN5VD+WnH7QIAu9opvQ
	(envelope-from <linux-tegra+bounces-14165-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Tue, 05 May 2026 03:10:45 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E65D84C5AA2
	for <lists+linux-tegra@lfdr.de>; Tue, 05 May 2026 03:10:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6CECF301EEE1
	for <lists+linux-tegra@lfdr.de>; Tue,  5 May 2026 01:09:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF4DD3559F2;
	Tue,  5 May 2026 01:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DMsHh4M6"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A479351C22;
	Tue,  5 May 2026 01:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777943344; cv=none; b=cVW0z7CTq6+GtqS+7vYN4dN/Lr/3sljpTzBRbrW4dpvNOIHgllnL+nzXWVdw4ZhyboH9RM9zSHpPejcWkwRZnMtME2mmeyCePGF+jFRaBYHASNpTbEAX1dbHHRQOvryRkdoKz9aCY0mWY32xUA0rijFCIc4uiCHbQerZJ9EbQIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777943344; c=relaxed/simple;
	bh=TpGYXCaAFTOqebHvjztPC+qbVAYxHWhPNx008iiZQp0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LbdYPjMIAPZ4bbaTY1Y+AcNL4iiecTi6rjedxmrSnK69ZiZtx0HTCN/WYcEsEWimkO4e8tWygO61bMEk9+EpZH7/WidwRs/mUHJk1MhQSsXLFLbuFm5EpF9NpDmFdH5fKJ1T+HPSL348RpmrJu3B1Thp6DJK9vjT3ZgcbBXyD4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DMsHh4M6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC2B4C2BCB9;
	Tue,  5 May 2026 01:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777943344;
	bh=TpGYXCaAFTOqebHvjztPC+qbVAYxHWhPNx008iiZQp0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DMsHh4M6qdvwacvzCJwyFc7Gtf+zRpjXlmy2efcs6wg7CZ2F5qdbuQH/XCoppdkZO
	 Tj5d3JRY0jIp38LdvPQkG39WqAUnktqxa1+aqNn4vHqTuESKwfqaOwoZHSao9IMkgL
	 qqafecAklTJF9OPF6FJ1bKdLto9vRw+5sVe6zvMUOABwsmCGxOsGp3sdRjnb7boC9h
	 Q9QA199eq4QZazPtQyh56j4GOe6v2Ox2jWmWxFU0VTlzUw7k7H7f3qfABKpFyct0+T
	 24Zb9zg4W2dSv+Uneo+NM7dnvC2PgxZRVlk9a8gj6Xz94ZfBXUSP8Pp9GV2ECBGamA
	 McSD8G8gLPqkQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, phucduc.bui@gmail.com
Cc: Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Sheetal <sheetal@nvidia.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-sound@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260429102743.103197-1-phucduc.bui@gmail.com>
References: <20260429102743.103197-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH] ASoC: tegra: Use guard() for mutex locks
Message-Id: <177789999646.458539.912040697689212199.b4-ty@b4>
Date: Mon, 04 May 2026 22:06:36 +0900
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1107; i=broonie@kernel.org;
 h=from:subject:message-id; bh=TpGYXCaAFTOqebHvjztPC+qbVAYxHWhPNx008iiZQp0=;
 b=kA0DAAoBJNaLcl1Uh9AByyZiAGn5Qy2iyjgQFLwDiiUWEnpDKH71X5BFWPmjdsMc1y+RkonGp
 YkBMwQAAQoAHRYhBK3maKpnVxi1n+Kf6iTWi3JdVIfQBQJp+UMtAAoJECTWi3JdVIfQYy0H/1fO
 rXO9HddOf3wHCkzOFP6QtXfKybcBXc568T6LijmesaxVew9l9YzBhs8LJly8wAteD6enomhfVEo
 GCQRvjQO8QgmwfWJRqi4wjh53boEfDNElyyClUZO+Vf7KbiJ5/WmCRkyi57iCSV3DxVvaI5BPNz
 8kH/5Y1R2nokfkMmkJ4ZvWjjbWGiV127zDKz3GAs7Mv/vdG8P0lH65QMumuyZZSnCslneb04jug
 svmdBlBDmqEeGM1BBhpEgvnMwrl89LYbkZhuL2zaIyGukEQjCIvNCAvHc1T4rzIcE7ryt4ok1yz
 RJYEjSOvpHWfX+RsVR2Xf+NF5FvT1+Xr8sKUgZ8=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-Rspamd-Queue-Id: E65D84C5AA2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14165-lists,linux-tegra=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-tegra@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[]

On Wed, 29 Apr 2026 17:27:43 +0700, phucduc.bui@gmail.com wrote:
> ASoC: tegra: Use guard() for mutex locks

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: tegra: Use guard() for mutex locks
      https://git.kernel.org/broonie/sound/c/b5a1493d9479

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



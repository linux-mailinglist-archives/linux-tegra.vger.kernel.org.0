Return-Path: <linux-tegra+bounces-13965-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id RwquNS9W7WmWiAAAu9opvQ
	(envelope-from <linux-tegra+bounces-13965-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Sun, 26 Apr 2026 02:02:55 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3109D468624
	for <lists+linux-tegra@lfdr.de>; Sun, 26 Apr 2026 02:02:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7F339300CC0F
	for <lists+linux-tegra@lfdr.de>; Sun, 26 Apr 2026 00:02:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 657BB4A33;
	Sun, 26 Apr 2026 00:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eNGtMeHN"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4038E28F5;
	Sun, 26 Apr 2026 00:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777161772; cv=none; b=Z0n5MwC4+lvB0X7hmmDR2sR3xfdYWqF/TaZ4P7YKRg+F7vbX3uva0xVtmEtVPLXMrYWZW2wTLpwEe6wPv6jK4dgkpZnK4O/vepQJvqKWkDH15yo19vrBZj+ANC4nQRkO5MviwmFzgO/EIcV8pUAcFPs4P5rgq6iALJU2JBv81V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777161772; c=relaxed/simple;
	bh=BHseaMuIagpoO9jrUkIF1FcsO979B0BZteW6pp2JoQY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EhMi0stMUX/BXePhKMUmjclRmyywhPcuhWKIcbImrnNnTzUkxfSSrEIpeVynlf7gNd4ENbIIxXSTMDCjcECg1f/cI/kzut6uIYKCQ9zJi2AR7+qCSVBqaZlv5ylvvaVehl4IuwknflD5Qfv9SfK5KU6DMmV1TzdaxzB4rDap5Wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eNGtMeHN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7A5AC2BCB0;
	Sun, 26 Apr 2026 00:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777161771;
	bh=BHseaMuIagpoO9jrUkIF1FcsO979B0BZteW6pp2JoQY=;
	h=From:To:Cc:Subject:Date:From;
	b=eNGtMeHNnGXje2hc+WAAMVNLv4Rn4kMK2mnzZIHTTuDJWqmlIR7YwqyA7SgG9dSYm
	 GwphvxtLY2xl0BZaezF3I8dqVUcx//SqTN0u9fyuQg+PocNTRtnmkE13PSYAxTieZw
	 pzXujfSCiJREem736jl4O7oT/tN0896ltxemUlteRldyH3LH1Kl7bCO9631zSBqePX
	 S7AiJr83y7YfXjhwWSlzE1cyH2bxWs8PqCSbM6OzyJEihp3OenlodaVYIfHBBoSsHK
	 qqu3OaDxmE/vFRdW+Q0aZe1alfBE36RZ5lKpjClitz5y8w1vyujmBw3IdkHO71A2v/
	 CRxDoaqnDRldQ==
From: Sasha Levin <sashal@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Sasha Levin <sashal@kernel.org>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	linux-sound@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: tegra: Remove stale snd-soc-tegra-utils composite module definition
Date: Sat, 25 Apr 2026 20:02:49 -0400
Message-ID: <20260426000249.54799-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3109D468624
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13965-lists,linux-tegra=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,perex.cz,suse.com,nvidia.com,gmail.com,yahoo.de,vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-tegra@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

kconfiglint reports two warnings for sound/soc/tegra/Makefile:

  M002: composite module 'snd-soc-tegra-utils' defined but not in any obj-*
  M008: composite module 'snd-soc-tegra-utils': tegra_asoc_utils.o has no
        source file

The composite module definition
`snd-soc-tegra-utils-y += tegra_asoc_utils.o` references a source file that
no longer exists and defines a module that is never included in any obj-*
target.

The tegra_asoc_utils module was originally introduced in commit
a3cd50deef7b ("ASoC: Tegra: Move utilities to separate module") by Stephen
Warren in 2011 to provide shared clock/rate utility functions for Tegra
machine drivers. At that time, the Makefile had both the composite
definition (`snd-soc-tegra-utils-objs`) and the build target
(`obj-$(CONFIG_SND_TEGRA_SOC) += snd-soc-tegra-utils.o`).

In 2021,
commit 8c1b3b159300 ("ASoC: tegra: Squash utils into common machine
driver")
by Dmitry Osipenko merged tegra_asoc_utils.c into tegra_asoc_machine.c,
deleting both the .c and .h files. That commit correctly removed the obj-*
build target line but overlooked the composite module definition line
(`snd-soc-tegra-utils-objs += tegra_asoc_utils.o`).

The orphaned line persisted unnoticed and was even mechanically updated in
2024 by
commit 51a50d6ad727 ("ASoC: tegra: Use *-y instead of *-objs in
Makefile")
by Takashi Iwai, which converted it from `-objs` to `-y` syntax as part of
a treewide cleanup — inadvertently refreshing a stale definition.

Remove the orphaned composite module definition since it serves no purpose:
the source file was deleted, the obj-* target was already removed, and the
functionality now lives in tegra_asoc_machine.c.

Assisted-by: Claude:claude-opus-4-6 kconfiglint
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/tegra/Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/tegra/Makefile b/sound/soc/tegra/Makefile
index 3f396c87802ed..1c18ef6971c09 100644
--- a/sound/soc/tegra/Makefile
+++ b/sound/soc/tegra/Makefile
@@ -1,7 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 # Tegra platform Support
 snd-soc-tegra-pcm-y := tegra_pcm.o
-snd-soc-tegra-utils-y += tegra_asoc_utils.o
 snd-soc-tegra20-ac97-y := tegra20_ac97.o
 snd-soc-tegra20-das-y := tegra20_das.o
 snd-soc-tegra20-i2s-y := tegra20_i2s.o
-- 
2.53.0



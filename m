Return-Path: <linux-tegra+bounces-12289-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNvzA2ugo2k3IQUAu9opvQ
	(envelope-from <linux-tegra+bounces-12289-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Sun, 01 Mar 2026 03:11:55 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1789A1CD3F6
	for <lists+linux-tegra@lfdr.de>; Sun, 01 Mar 2026 03:11:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1E40630055DE
	for <lists+linux-tegra@lfdr.de>; Sun,  1 Mar 2026 02:00:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D09C2673AA;
	Sun,  1 Mar 2026 02:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dFlgt9qF"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A477430B9A;
	Sun,  1 Mar 2026 02:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772330441; cv=none; b=oOhFfwkrt3xIm35PxDcHaYwN70MBA0AxE6Wn68hcWefl9fcrAnDS6OEyK5/EKOceNJ5ST2Ju17la/XVBpLonKGMC7otk2KZ9MG80tBy9S2z+vWWcOPGFdQqlc/mlgcWthcVIH0WWsKfmJ3prUuSdhvcJkASDjiL9jdLDtw55GnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772330441; c=relaxed/simple;
	bh=RgXcPaat3tveaK8mP/9fTOe4MdR3mGv+69bcMh/qW3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QybmXLQARmrNI/zDdzWPRiPrjOIAQRKBBD4ofD7YOeV5KpG2YtE7TL4X5An6ck5yOqNufTnLyFGlEBjI/o9+kZ44gJZCnrlmNbO/7Xf+8X5GLjz5tws+ODbz7LsCqM0qJS3p0X8FEOM0gTsZmIOL0SEmAQox2bt25aEWkIzQEHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dFlgt9qF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5F1EC19421;
	Sun,  1 Mar 2026 02:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772330441;
	bh=RgXcPaat3tveaK8mP/9fTOe4MdR3mGv+69bcMh/qW3Y=;
	h=From:To:Cc:Subject:Date:From;
	b=dFlgt9qFsRFa15Rdkp+ksHKP1kqd1rsxgyeresWLnF+Y1abG6gAsJRb3z37tL6tWz
	 kCz+n+hZWX8uYLFM7HkhxohAD7p5vSHeYl8b5afTsw+gNSY4rtGSH6DeM8BruBwZwb
	 a1hwsw+cByHa8oRtDVY5KMqye1bDlFgkdWS65bV4Vs3OWEnMclvzV7MatfI63UQASs
	 Aunie+8uZoJN49qskiy6UDSAT39AGGgB7KrlfDKz2JWhCBWLCLfvwiv3bOaKA6V7al
	 uNNx6teGQm0K+8Nf7PMbaM/tsm7905rZo4JzqD1xECWsF9JjpcGWktelyG9AOniByk
	 qQRrfrocA7P5Q==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	lihaoxiang@isrc.iscas.ac.cn
Cc: Brian Masney <bmasney@redhat.com>,
	Thierry Reding <treding@nvidia.com>,
	linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: FAILED: Patch "clk: tegra: tegra124-emc: Fix potential memory leak in tegra124_clk_register_emc()" failed to apply to 5.10-stable tree
Date: Sat, 28 Feb 2026 21:00:39 -0500
Message-ID: <20260301020039.1726787-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12289-lists,linux-tegra=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-tegra@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iscas.ac.cn:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,nvidia.com:email]
X-Rspamd-Queue-Id: 1789A1CD3F6
X-Rspamd-Action: no action

The patch below does not apply to the 5.10-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From fce0d0bd9c20fefd180ea9e8362d619182f97a1d Mon Sep 17 00:00:00 2001
From: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Date: Thu, 15 Jan 2026 13:05:42 +0800
Subject: [PATCH] clk: tegra: tegra124-emc: Fix potential memory leak in
 tegra124_clk_register_emc()

If clk_register() fails, call kfree to release "tegra".

Fixes: 2db04f16b589 ("clk: tegra: Add EMC clock driver")
Cc: stable@vger.kernel.org
Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Reviewed-by: Brian Masney <bmasney@redhat.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/clk/tegra/clk-tegra124-emc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra124-emc.c b/drivers/clk/tegra/clk-tegra124-emc.c
index 2a6db04342815..0f6fb776b2298 100644
--- a/drivers/clk/tegra/clk-tegra124-emc.c
+++ b/drivers/clk/tegra/clk-tegra124-emc.c
@@ -538,8 +538,10 @@ struct clk *tegra124_clk_register_emc(void __iomem *base, struct device_node *np
 	tegra->hw.init = &init;
 
 	clk = clk_register(NULL, &tegra->hw);
-	if (IS_ERR(clk))
+	if (IS_ERR(clk)) {
+		kfree(tegra);
 		return clk;
+	}
 
 	tegra->prev_parent = clk_hw_get_parent_by_index(
 		&tegra->hw, emc_get_parent(&tegra->hw))->clk;
-- 
2.51.0






Return-Path: <linux-tegra+bounces-13968-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sFcaGnpW7WmWiAAAu9opvQ
	(envelope-from <linux-tegra+bounces-13968-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Sun, 26 Apr 2026 02:04:10 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DAACE468668
	for <lists+linux-tegra@lfdr.de>; Sun, 26 Apr 2026 02:04:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B00913024158
	for <lists+linux-tegra@lfdr.de>; Sun, 26 Apr 2026 00:03:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 078681F94F;
	Sun, 26 Apr 2026 00:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GTREQQAq"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D974640DFDA;
	Sun, 26 Apr 2026 00:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777161796; cv=none; b=d5T41k1n8QAvWTH7Q77AaPczcFfkh7LEQZPMkm8OM7ZMV82VY5fy6qXbCAcegHoFZVYr9aFwh+i6tNQBY1sRbnpMvu0v/piN7AxRVJpHHjFc7uhVqP85p3NFWo5vgn/ezeIqMq4xODTFOZNLxwvPhpqS+Qrdwjc6SBbnToPWxKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777161796; c=relaxed/simple;
	bh=zU9NcrYHhr2d6hlrDrC//RQLLp3HJAAxbg7gychWnIk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CHI4rR7dDV7RGQpR6Nqu6tKmZDhHYyV2AhzW23QGSWgF/nmS+Ki8mGvpRhdJq3MBzsCU6eoIhgmZMZ/ELXRq5xDSCdCVQgYtWP1XnBHvzqRTv/+Ew42o8iqOBQoLh5Pju4LdEBb8oeCPW3a/CahpRfd+m92OKVdLqcYBR7ZWv7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GTREQQAq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD547C2BCB0;
	Sun, 26 Apr 2026 00:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777161796;
	bh=zU9NcrYHhr2d6hlrDrC//RQLLp3HJAAxbg7gychWnIk=;
	h=From:To:Cc:Subject:Date:From;
	b=GTREQQAqUuoxOAvms0auMK2O75FB8Oc2VVpK6Ae5anNUKri3EcUtUrxRe8vDBTEVI
	 tRWhb74XAqF5h1H8W3tS+k0jB4XD4SA4JxSHWG1/tSAA63k5f7+zhpEpF6AFtkWVy5
	 C2FqGRavX6zT5V98QIUfv369xr7tSh36Vzf97tvuobBW/NoCu6w2UDLqW9tjuLKx3/
	 IeoYZ1AfmR01t3BCBisA9OJq1808cKWcUQoPGtDPoLJ8WkNbnqWteauNOm2PBEmLYq
	 srdaE8QsWgwKFqI52p/jE9E9F0kGkA3U8qHYhVY4Wh5QMpGIhMX/jbuhY4d5u70qOo
	 2USvoxHW4I4ww==
From: Sasha Levin <sashal@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Jonathan Hunter <jonathanh@nvidia.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] firmware: tegra: Make TEGRA_IVC a hidden Kconfig symbol
Date: Sat, 25 Apr 2026 20:03:14 -0400
Message-ID: <20260426000314.55529-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: DAACE468668
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13968-lists,linux-tegra=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-tegra@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

kconfiglint reports:

  K002: config TEGRA_BPMP selects visible symbol TEGRA_IVC which has
        dependencies

TEGRA_IVC was originally introduced in
commit ca791d7f4256 ("firmware: tegra:
Add IVC library") as a user-visible
bool with a prompt ("Tegra IVC protocol"). At that time, TEGRA_BPMP
depended on TEGRA_IVC, requiring users to manually enable it.

Recently,
commit 78eb18020a88 ("firmware: tegra: Fix IVC dependency problems")
recognized that TEGRA_IVC is library code that should be activated via
`select` rather than user selection. That commit changed TEGRA_BPMP from
`depends on TEGRA_IVC` to `select TEGRA_IVC`, and restricted TEGRA_IVC's
prompt to only appear under COMPILE_TEST
(`bool "Tegra IVC protocol" if COMPILE_TEST`). The commit message
explicitly states: "The IVC code is library code that other drivers need to
select if they need that library."

However, the `if COMPILE_TEST` qualifier still leaves TEGRA_IVC as a
technically visible symbol, triggering K002 when TEGRA_BPMP selects it.
Since TEGRA_IVC depends on ARCH_TEGRA, it cannot be independently enabled
under COMPILE_TEST without ARCH_TEGRA anyway, limiting the value of the
standalone COMPILE_TEST path. TEGRA_BPMP itself provides adequate
COMPILE_TEST coverage for the IVC library through its own dependency chain.

Complete the transition to a pure library symbol by removing the prompt
entirely, making TEGRA_IVC a hidden bool activated only via select from
TEGRA_BPMP. This is consistent with the intent expressed in 78eb18020a88.

Assisted-by: Claude:claude-opus-4-6 kconfiglint
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/firmware/tegra/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/tegra/Kconfig b/drivers/firmware/tegra/Kconfig
index 91f2320c0d0f8..3a91627064390 100644
--- a/drivers/firmware/tegra/Kconfig
+++ b/drivers/firmware/tegra/Kconfig
@@ -2,7 +2,7 @@
 menu "Tegra firmware driver"
 
 config TEGRA_IVC
-	bool "Tegra IVC protocol" if COMPILE_TEST
+	bool
 	depends on ARCH_TEGRA
 	help
 	  IVC (Inter-VM Communication) protocol is part of the IPC
-- 
2.53.0



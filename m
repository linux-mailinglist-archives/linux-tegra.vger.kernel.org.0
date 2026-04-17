Return-Path: <linux-tegra+bounces-13789-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OTP0Cawy4mlZ3QAAu9opvQ
	(envelope-from <linux-tegra+bounces-13789-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Fri, 17 Apr 2026 15:16:28 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6394F41B849
	for <lists+linux-tegra@lfdr.de>; Fri, 17 Apr 2026 15:16:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2EC0D301AFD7
	for <lists+linux-tegra@lfdr.de>; Fri, 17 Apr 2026 13:16:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A71073A3E7D;
	Fri, 17 Apr 2026 13:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aDPkPTvw"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4753D39C62F;
	Fri, 17 Apr 2026 13:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776431757; cv=none; b=FLFybO5GMYN9XbKWzoVJE+Nh3ZVJ5JoJ+EbrseiSBpXlJW/uh3zYvU62p6aAcBytGhBWxegbsuyqkNw1v4mKfmRVW+Du871m4eMJlwUJ+U/p5Tln3jPjUEOBVG/QYBs9P4pge81NKDqFckV6+FKyRQWgCh8z50iz03ojwf52wcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776431757; c=relaxed/simple;
	bh=CsBxhNpzoUuwJOaSktkuM40YkzYY3O1cx/QZRXjUfYg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rPf4JTXBqLAtFtlzBQG9dMBFKQ3GQXluuA87uKmw1WLTt4VpYD9u7ZzeW/X3pdkkXSxtEDSKRe0RMUWFxR8ODisXEFBrQvgNfGtC8T41OzcJpCt7eI8EoV9KwdL72wlC4IUCwokuxwXtGm3Sq103sZqlaLtWuSoAM4AbBzyz4Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aDPkPTvw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43CB6C19425;
	Fri, 17 Apr 2026 13:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776431756;
	bh=CsBxhNpzoUuwJOaSktkuM40YkzYY3O1cx/QZRXjUfYg=;
	h=From:To:Cc:Subject:Date:From;
	b=aDPkPTvwZG04fqo4mIKgpkVPZbA68bs1sNugmqJla/lLngqRlab2hsE8cLO2NtNhz
	 qAwEx8uDqhlt+GuJqyAv+sJwUQ+FLDKcVor3el0rnxPTA/x29Je9LcBBJf0qeZ5hjA
	 uMCqPr47ZEYQ+Hit5XRg3ydS/Aq8W/h0kl/fwHNUvU1UJcLnyt/thctCtvEKGOjmUL
	 Vz1p38C43OeJKU2+4UyqkQ6ZLUF0eCwDtz1qrJ7X6zyDDiVS+1SAFVa0Bs93HpPZLT
	 Dirva2dVzmH6AUxZhh/emecHUCHIvQFLupvvJmky0nW4muLdTTottnd9JLJaB7rTJ1
	 HaIQcHqLStxXQ==
From: Thierry Reding <thierry.reding@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>
Subject: [PATCH v2 1/3] MAINTAINERS: Move Peter De Schrijver to CREDITS
Date: Fri, 17 Apr 2026 15:15:46 +0200
Message-ID: <20260417131549.3154534-1-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13789-lists,linux-tegra=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[thierry.reding@kernel.org,linux-tegra@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-tegra];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,iki.fi:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,nokia.com:email,mind.be:email,linux-m68k.org:email]
X-Rspamd-Queue-Id: 6394F41B849
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Thierry Reding <treding@nvidia.com>

Peter sadly passed away a while back. Paul did a much better job at
finding the right words to mourn this loss than I ever could, so I will
leave this link here:

  https://lore.kernel.org/lkml/alpine.DEB.2.21.999.2407240345480.11116@utopia.booyaka.com/T/#u

Co-developed-by: Paul Walmsley <pjw@kernel.org>
Co-developed-by: Aaro Koskinen <aaro.koskinen@iki.fi>
Co-developed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v2:
- add more missing entries

 CREDITS     | 10 ++++++++++
 MAINTAINERS |  1 -
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/CREDITS b/CREDITS
index 885fb05d8816..afd1f70b41cf 100644
--- a/CREDITS
+++ b/CREDITS
@@ -3645,7 +3645,17 @@ D: Macintosh IDE Driver
 
 N: Peter De Schrijver
 E: stud11@cc4.kuleuven.ac.be
+E: p2@mind.be
+E: peter.de-schrijver@nokia.com
+E: pdeschrijver@nvidia.com
+E: p2@psychaos.be
+D: Apollo Domain workstations
+D: Ariadne and Hydra Amiga Ethernet drivers
+D: IBM PS/2, Microchannel, and Token Ring support
 D: Mitsumi CD-ROM driver patches March version
+D: TWL4030 power management and audio codec driver
+D: OMAP power management
+D: NVIDIA Tegra clock and BPMP drivers, among many other things
 S: Molenbaan 29
 S: B2240 Zandhoven
 S: Belgium
diff --git a/MAINTAINERS b/MAINTAINERS
index ef978bfca514..ffe20d770249 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26145,7 +26145,6 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git
 N:	[^a-z]tegra
 
 TEGRA CLOCK DRIVER
-M:	Peter De Schrijver <pdeschrijver@nvidia.com>
 M:	Prashant Gaikwad <pgaikwad@nvidia.com>
 S:	Supported
 F:	drivers/clk/tegra/
-- 
2.52.0



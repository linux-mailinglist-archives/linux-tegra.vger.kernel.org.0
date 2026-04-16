Return-Path: <linux-tegra+bounces-13775-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GHHnNB7i4GlhnAAAu9opvQ
	(envelope-from <linux-tegra+bounces-13775-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Thu, 16 Apr 2026 15:20:30 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A4840EB00
	for <lists+linux-tegra@lfdr.de>; Thu, 16 Apr 2026 15:20:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D61630071D5
	for <lists+linux-tegra@lfdr.de>; Thu, 16 Apr 2026 13:18:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD7F737BE74;
	Thu, 16 Apr 2026 13:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PHVocQXh"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C943242BE;
	Thu, 16 Apr 2026 13:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776345499; cv=none; b=qk99pI8b728JM0TfmaGe3IcagSVkfrQJmQkNJkJvdihaJCJqCyHEs9VCZl8R13c3xRsZlNKxQ/BwwOWl6SU/i3MfSf2NRaV65jXJLDiwPOgrZI5Ul2FEI4OrHQwDDPQwZrrv61pbQ7XqPUP5aqR0AkOhE4mB0jfEMbCbUoS+AXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776345499; c=relaxed/simple;
	bh=v2KfXvmyoYN0U8cDqXs3PNwqipn6UcHYXc0jmP5Hn7o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hQLlNTZjukDYfKZFXzC3qFt9OtxCgYcrthAFKfZQurqalytZHV1lB7a/XU+QXvgcRM+bR9B+CY6EMaHcCCVkNwchSwV+xE1wpkUGElWCD8D3ovNCayBseYRwLoEEs/BNUY35wGmh3rlwgLnDlenlscAzZAWJIQA+OVzeIQ2+8Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PHVocQXh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6384C2BCAF;
	Thu, 16 Apr 2026 13:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776345499;
	bh=v2KfXvmyoYN0U8cDqXs3PNwqipn6UcHYXc0jmP5Hn7o=;
	h=From:To:Cc:Subject:Date:From;
	b=PHVocQXhRNsqLT7YGQNw3ajVv1Llnz03oiIhn0EiUKuk5XLmAMbk5xqNmflj+BnI+
	 WAixTVjjAXbjTnaAEdatFvRRVwIltR/jE7owPnoFQaoDqdcg6lYwNZUGB8YDwQAnLa
	 KxNrpZwhqwWP96aLBx/13ve0bO1E+FY1h9LS2QzjUrkd42U0T/JWXRR1Sm0ZFEPjSn
	 2ZAMt6W9sYKu4fREvXh5+IfDmZEZg7LR6hdhNy5tKArtMbgZT9UKXehutZAy+f2JPB
	 4IG6tZZ9an13fhmfAjv/x6cYtrI2/30bDnXcYL/XG4CdLBPrUp34VyLyrdvCNKg8Lg
	 dmH//b/BScw4g==
From: Thierry Reding <thierry.reding@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>
Subject: [PATCH] MAINTAINERS: Move Peter De Schrijver to CREDITS
Date: Thu, 16 Apr 2026 15:18:10 +0200
Message-ID: <20260416131810.3116408-1-thierry.reding@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13775-lists,linux-tegra=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[thierry.reding@kernel.org,linux-tegra@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-tegra];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,kuleuven.ac.be:email]
X-Rspamd-Queue-Id: 58A4840EB00
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Thierry Reding <treding@nvidia.com>

Peter sadly passed away a while back. Paul did a much better job at
finding the right words to mourn this loss than I ever could, so I will
leave this link here:

  https://lore.kernel.org/lkml/alpine.DEB.2.21.999.2407240345480.11116@utopia.booyaka.com/T/#u

Co-developed-by: Paul Walmsley <pjw@kernel.org>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 CREDITS     | 6 ++++++
 MAINTAINERS | 1 -
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/CREDITS b/CREDITS
index 885fb05d8816..29fcfa679430 100644
--- a/CREDITS
+++ b/CREDITS
@@ -3645,7 +3645,13 @@ D: Macintosh IDE Driver
 
 N: Peter De Schrijver
 E: stud11@cc4.kuleuven.ac.be
+E: p2@mind.be
+E: peter.de-schrijver@nokia.com
+E: pdeschrijver@nvidia.com
+E: p2@psychaos.be
 D: Mitsumi CD-ROM driver patches March version
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



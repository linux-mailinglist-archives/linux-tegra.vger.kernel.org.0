Return-Path: <linux-tegra+bounces-11523-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EEKlAy6Ac2ncwwAAu9opvQ
	(envelope-from <linux-tegra+bounces-11523-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Fri, 23 Jan 2026 15:05:34 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9368F76A34
	for <lists+linux-tegra@lfdr.de>; Fri, 23 Jan 2026 15:05:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 08E323003804
	for <lists+linux-tegra@lfdr.de>; Fri, 23 Jan 2026 14:05:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 590F030B525;
	Fri, 23 Jan 2026 14:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b="BUOYWMcG"
X-Original-To: linux-tegra@vger.kernel.org
Received: from imap4.hz.codethink.co.uk (imap4.hz.codethink.co.uk [188.40.203.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D462F2EA15C;
	Fri, 23 Jan 2026 14:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.203.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769177130; cv=none; b=kNT+vQqGDH7Vpp6DdAukZD0rKYTrFCh+QBiZwxCGOlFPzjKtYFnugKVDiIVSwNvMz8aOCGrKqnZzt5/zR2o1DU++W7jd9yeUKevji170nUDd389DEMy92qSj9Izt/klzdWd/EWIP3id6x+Q9s3oYjpDeoCvEtnZXKeWUMloEKpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769177130; c=relaxed/simple;
	bh=2qXO7mYjyOngpq74Un8SEOSEGVT+6ykdbmhCzPwg518=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iesQrA1tBMoFbWgF58FJP0zdPadnSQUUESmkIRvaezyo/TMzyp/QyvcWs1dqs7AH0+6Chlk1JG4zRwAQPLX8cKHSsBqBXuF4hrSa1JA6cVGIk4huQ0o2LHPZoVD33uYBouVAeI1MQgTSvcb2l+lxx9zcjndoVH3WKqv0yWnfxRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk; spf=pass smtp.mailfrom=codethink.com; dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b=BUOYWMcG; arc=none smtp.client-ip=188.40.203.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codethink.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:
	References; bh=3o/V+pItf8hTOU7BXv1sPYSeVAiOjt+faqxkDYxjzE4=; b=BUOYWMcGgpeoyy
	s5OX/n1bWzfWr0NJfhX/X0X1QCf3K5WGPLMT8NhcQJgbc2yz4ad16eq0jY4LmHR7YCSvRDkDCmQmE
	JOlEJGtzBK9RICBYjHbwK9Zeqt3i/K20j6dAKPHK+ejYx6CiVtUMknruLmO9v76JIM9n251voSNhI
	uh1QvV0VXhlrwGeI2fKGiZ6XeHNhRukpkDIl50b4TYQNmJqpetycIAbdpFe+aYJrdjIsSHm8rT6+J
	PIF2cOz5cTpTW6ytrOFa1c1pxSglaIvGTVYfmYY2Ip4FmSE0wTgikW4igJgn1urRcXhV6Ld6SKnkp
	/cM9Qj2fNOK7zse8fn0w==;
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1vjHmj-00BGgw-BW; Fri, 23 Jan 2026 14:05:14 +0000
Received: from ben by rainbowdash with local (Exim 4.99.1)
	(envelope-from <ben@rainbowdash>)
	id 1vjHmk-00000002YTU-0IBH;
	Fri, 23 Jan 2026 14:05:14 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	simona@ffwll.ch,
	airlied@gmail.com,
	mperttunen@nvidia.com,
	thierry.reding@gmail.com
Cc: linux-kernel@vger.kernel.org,
	Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH v2] gpu: host1x: fix missing 'host1x_context_device_bus_type'
Date: Fri, 23 Jan 2026 14:05:12 +0000
Message-Id: <20260123140512.609167-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: srv_ts003@codethink.com
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[codethink.co.uk,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[codethink.co.uk:s=imap4-20230908];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[vger.kernel.org,lists.freedesktop.org,ffwll.ch,gmail.com,nvidia.com];
	TAGGED_FROM(0.00)[bounces-11523-lists,linux-tegra=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ben.dooks@codethink.co.uk,linux-tegra@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[codethink.co.uk:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-tegra];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9368F76A34
X-Rspamd-Action: no action

The drivers/gpu/host1x/context_bus.c does not include
any declaration of host1x_context_device_bus_type, and
after including "context.h" it also showed that there
are two definitons in the kernel, so fix those two

Fix by removing the definition in context.h and include
<linux/host1x_context_bus.h> in context_bus.c

Fixes the following sparse warning:
drivers/gpu/host1x/context_bus.c:9:23: warning: symbol 'host1x_context_device_bus_type' was not declared. Should it be static?

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
--
v2:
  - removed fixes line
  - changed to include into the c files directly
---
 drivers/gpu/host1x/context.c     | 1 +
 drivers/gpu/host1x/context.h     | 2 --
 drivers/gpu/host1x/context_bus.c | 1 +
 3 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/host1x/context.c b/drivers/gpu/host1x/context.c
index a6f6779662a3..476e8c5e1297 100644
--- a/drivers/gpu/host1x/context.c
+++ b/drivers/gpu/host1x/context.c
@@ -12,6 +12,7 @@
 
 #include "context.h"
 #include "dev.h"
+#include <linux/host1x_context_bus.h>
 
 static void host1x_memory_context_release(struct device *dev)
 {
diff --git a/drivers/gpu/host1x/context.h b/drivers/gpu/host1x/context.h
index 3e03bc1d3bac..78bcf08cc90a 100644
--- a/drivers/gpu/host1x/context.h
+++ b/drivers/gpu/host1x/context.h
@@ -13,8 +13,6 @@
 
 struct host1x;
 
-extern struct bus_type host1x_context_device_bus_type;
-
 struct host1x_memory_context_list {
 	struct mutex lock;
 	struct host1x_memory_context *devs;
diff --git a/drivers/gpu/host1x/context_bus.c b/drivers/gpu/host1x/context_bus.c
index 7cd0e1a5edd1..c0ba0433c686 100644
--- a/drivers/gpu/host1x/context_bus.c
+++ b/drivers/gpu/host1x/context_bus.c
@@ -5,6 +5,7 @@
 
 #include <linux/device.h>
 #include <linux/of.h>
+#include <linux/host1x_context_bus.h>
 
 const struct bus_type host1x_context_device_bus_type = {
 	.name = "host1x-context",
-- 
2.37.2.352.g3c44437643



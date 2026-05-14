Return-Path: <linux-tegra+bounces-14445-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCvwNDfjBWrndAIAu9opvQ
	(envelope-from <linux-tegra+bounces-14445-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Thu, 14 May 2026 16:59:03 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D71E5439FF
	for <lists+linux-tegra@lfdr.de>; Thu, 14 May 2026 16:59:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A60BC307D0E2
	for <lists+linux-tegra@lfdr.de>; Thu, 14 May 2026 14:55:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EEB7425CDF;
	Thu, 14 May 2026 14:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="gE8zolpZ"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5951F3BED43;
	Thu, 14 May 2026 14:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778770533; cv=none; b=cRfz8VqXn5kKmQGozCfnGcL58i4SvZLLeYgzGbv3ZYecGlmla7LL4wBoD7l062fSuQCwyFsxyPr+ubQsfHOwW/7hdicDDWvgwSbGZTUNHuIKtzgO5eEcSxqfwA4cMZCXSVcRUBZLxLSTJ4vg0aeP+54Z+AK+iUq3b11WhqbCus0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778770533; c=relaxed/simple;
	bh=iKpL2tZGcpfwQZn6rSsZghYOqthAeTURsDvaVuWlul0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z8qXZrfOza/ZbVqFAqnIJO1L1DSrLjgN1uLkSvuEzg5hSQEmtd9lOwK3Qi0J+6JiP4oDP+785AS7nKlp41tLKoQmgBSaRyxyjNzzi0bk39/7i36yExmXWGduc8ZpyB9jZ88cPVF0wMpWfJSymMvuLn5tt7BULpR2uCpgwUL1Ub0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=gE8zolpZ; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 23F826000222;
	Thu, 14 May 2026 15:47:30 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id sxCi7LopkDkE; Thu, 14 May 2026 15:47:28 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id CA6DD6000874;
	Thu, 14 May 2026 15:47:27 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail2; t=1778770047;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3nchV8R8N22csolYEW3nDc6UaflBfzUU8x9AMzJq3tI=;
	b=gE8zolpZ0jFP/V+8YUQmRf1aiyMqsehtQwKOFK7fjV5RZs5Iy7hyGU4FphdQ+BCgUh9UKV
	h+unP8ghKACIgHzSA8YlDzkn77fE5xMR7oHlyipv7AcxB8ogRuuDVwMQt4BUUbk+gseB6w
	V2I9pKH9SQmgnumCAZnWOBEYn2d5/399/l4P5WTHUnm9T47SvRmC7YqdOJWidqrdNVvphJ
	ZWn5UiqrK5Mus3HJh9jAPBCZKlSevaQv5dyFuNnSu5MVBPo1HZASCqhOjxpPqNDFOVjjBg
	oaipoYV3vSXDc+JIkrLu4AIA8FLBB6M+7w/31T7+Nb36RRlF9W4MpBLx/wZC7w==
Received: from [192.168.1.94] (2a02-842a-00d7-bd01-2527-ff0d-f555-b6e4.rev.sfr.net [IPv6:2a02:842a:d7:bd01:2527:ff0d:f555:b6e4])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 38D3636026F;
	Thu, 14 May 2026 15:47:27 +0100 (WEST)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Date: Thu, 14 May 2026 16:47:19 +0200
Subject: [PATCH 1/4] firmware: psci: switch SYSTEM_OFF to sys-off handler
 API
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-smaug-poweroff-v1-1-30f9a4688966@tecnico.ulisboa.pt>
References: <20260514-smaug-poweroff-v1-0-30f9a4688966@tecnico.ulisboa.pt>
In-Reply-To: <20260514-smaug-poweroff-v1-0-30f9a4688966@tecnico.ulisboa.pt>
To: Mark Rutland <mark.rutland@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778770045; l=1612;
 i=diogo.ivo@tecnico.ulisboa.pt; s=20240529; h=from:subject:message-id;
 bh=iKpL2tZGcpfwQZn6rSsZghYOqthAeTURsDvaVuWlul0=;
 b=mNBKOD3xIOPmaNUJzRwUDmwi+ef8RxjYEkH65pN2enlXmtGLq/ohk+C7tlJmJshxf6TssnUdH
 L9T+3cgibpBDek2qNCbgwB06mtebC9EY88A4hyJNq0xhVTznAkJ6Cna
X-Developer-Key: i=diogo.ivo@tecnico.ulisboa.pt; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=
X-Rspamd-Queue-Id: 4D71E5439FF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[tecnico.ulisboa.pt,quarantine];
	R_DKIM_ALLOW(-0.20)[tecnico.ulisboa.pt:s=mail2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14445-lists,linux-tegra=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tecnico.ulisboa.pt:mid,tecnico.ulisboa.pt:dkim,ulisboa.pt:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[tecnico.ulisboa.pt:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[diogo.ivo@tecnico.ulisboa.pt,linux-tegra@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-tegra,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Replace the legacy pm_power_off hook with the generic sys-off
handler infrastructure.

Convert psci_sys_poweroff() to the sys-off callback prototype and
register it through register_sys_off_handler() with firmware
priority. This removes the direct dependency on pm_power_off and
drops the now-unused <linux/pm.h> include.

This aligns the PSCI poweroff path with the modern system-off
framework used by other firmware and platform drivers.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
 drivers/firmware/psci/psci.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
index 38ca190d4a22..d6e9721d11e5 100644
--- a/drivers/firmware/psci/psci.c
+++ b/drivers/firmware/psci/psci.c
@@ -13,7 +13,6 @@
 #include <linux/errno.h>
 #include <linux/linkage.h>
 #include <linux/of.h>
-#include <linux/pm.h>
 #include <linux/printk.h>
 #include <linux/psci.h>
 #include <linux/reboot.h>
@@ -329,9 +328,11 @@ static struct notifier_block psci_sys_reset_nb = {
 	.priority = 129,
 };
 
-static void psci_sys_poweroff(void)
+static int psci_sys_poweroff(struct sys_off_data *data)
 {
 	invoke_psci_fn(PSCI_0_2_FN_SYSTEM_OFF, 0, 0, 0);
+
+	return NOTIFY_DONE;
 }
 
 #ifdef CONFIG_HIBERNATION
@@ -671,7 +672,8 @@ static void __init psci_0_2_set_functions(void)
 
 	register_restart_handler(&psci_sys_reset_nb);
 
-	pm_power_off = psci_sys_poweroff;
+	register_sys_off_handler(SYS_OFF_MODE_POWER_OFF, SYS_OFF_PRIO_FIRMWARE,
+				 psci_sys_poweroff, NULL);
 }
 
 /*

-- 
2.54.0



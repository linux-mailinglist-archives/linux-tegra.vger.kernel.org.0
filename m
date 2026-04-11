Return-Path: <linux-tegra+bounces-13708-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNWuM+Be2mlQ0wgAu9opvQ
	(envelope-from <linux-tegra+bounces-13708-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Sat, 11 Apr 2026 16:46:56 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C442E3E0667
	for <lists+linux-tegra@lfdr.de>; Sat, 11 Apr 2026 16:46:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8AD913004639
	for <lists+linux-tegra@lfdr.de>; Sat, 11 Apr 2026 14:46:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6655738551B;
	Sat, 11 Apr 2026 14:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zf6yGFCh"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEE542050
	for <linux-tegra@vger.kernel.org>; Sat, 11 Apr 2026 14:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775918811; cv=none; b=sghxRew1FkC2RukvnBMzjFH426fIaBjjJJAIEoyeRlBhO8TMA8HNvCgqL3d2YqLmtcveKdwxTQp653cFoKYS0n52d5MAFT0dnXgj0mcs02zs7v2BSqqFAndSj9ihw4Avq2edTkhcxcc8H+breke6GlOZl3Oja4pyO6B3ZtCMktI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775918811; c=relaxed/simple;
	bh=Sae0b53RDZivkY3LeLMbIAc0T7BB4OuamCGwTSjl1W8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=umLaLWTCoUY5aacNFnSCmw8E9ugKlcBFr0IlXvddN6pC05JU3xHrFI5CWy7XpXJUm3jI/OTjQlwK8aGBxQGRsrDq3maEtImixQxLFuCrurL75XCIIAtKSIf8VQ2B1eE8qWdDwOCzbYkYmoveBUHkuDsDICbznlPwDmHE6OaLwGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zf6yGFCh; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c6e2355739dso1362452a12.2
        for <linux-tegra@vger.kernel.org>; Sat, 11 Apr 2026 07:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775918809; x=1776523609; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W4BX+9CjC8V+lo6sc2a3UGFLrfgqmtBafb7VDPp+26s=;
        b=Zf6yGFCh7085tKQLOT8/h76ziAbyUi8gO2CgL8404hYcw66yK2+ZZVxyKQejvbV61y
         5qzUBYpzZrflrqQzwQoZnc22Y7EOJj3j9SbHfZ9W4OndutprRn7K5NdvTwrW2L1/3lAH
         YwUBzMR6YX+oF1GI/rmGPOLpZZRU1qmX0sM5piuK1oMAcyZelgTuZiwcJq7SBNmTASDX
         t5Ld26ZG4Q78069YQgaZjPxmTMrjzZTU9TlWxKar9gJdM6FTBiqZZsVtTkfsJ21P8AD1
         h8yxOL+LQjGmHAYwPnQGjUI2DC7ruWCfJE62nIIrwfhb68we4OXRAfC5NNvJ7HCe1Ac/
         h3IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775918809; x=1776523609;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W4BX+9CjC8V+lo6sc2a3UGFLrfgqmtBafb7VDPp+26s=;
        b=fTBGd/dwUnaCZE2zCGD03MqddAf2DHnvGVk/6fIUAf5Uu+qnSzwfJLVRTZPQTHhP/S
         KePuWw/i8Qs+J9XTaXEVPj9m0ZpsKNb/49FLrZ3SszmKPbOYaQiizCvPJ3JWCc9jYfQD
         Vuvu0P6Yv1OVvy3brox9jWKXTHSnftU7k00upzlQJRJyJK1Oav09izXJuwPeDaLwfX4g
         rf9BvrAbEFvRBCL/Uli23ZmcQuDzpxswScdkRO5I0Ju4v5gknRtqjmrCv2yWEU+R3cWQ
         dib1aOmQZ/DavBPERSI1sy+LQzaTlwDkSBUlho3ka1bLkGV4bB0Sw2ARMUXuOx8/kR3r
         4e8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXMqvLahqZro3zhP86v4sqSANfOH4aDlS18KFNWF2MU8oMLT+rgM8v1E2D7+T5cmb4KQrvk8k8vG9pFrA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNYXhODDLpkKUZPk+/F6PVoCTzhpNhhZsnjCx8paf3HHAEPrIZ
	mphPOmZWyUs2kO0t5PCPwhcPlorXGnL7HuVm49qcfV1+rSiY/dnXyHWzFaeuYA==
X-Gm-Gg: AeBDievAM5cMNpREPveHt8dUQ9sfBnbVOKYC9DAEx9zXVY22TrtnTxVbIb5v89WA117
	ZcCLXd+f2daLJfi5WsP/G2VKIknYuAPVRgdVuGd/OwTylKQBbqwzrbaiDqkPpH7BAiSana1xmTI
	rrjj6hEyCDepbUSqHNoQoYNbTNBnjyUemDxzMTA4QU/vQyagHbV3K0m06J6aFwDlQeT9oS23QRM
	CHf0Hz9LKXCK5SIxbuxqKnmL9HyLCORv/vNHKqY0TovsXuwNhY/hijYTMlgbmO+DQFdvCD6hstt
	ucennIsPDEqZhMDTCxXl+XVkUqjJJVFDQz0gVcIX4/q2VwxO4jnr0vmI69DBZN1Bnv0BEMKXM5A
	b5Wpihl3bI44t0xaVRJ5G/ecjx2Digleu8hzjai8o/taGGV/YHgKf2gHuQYa688uJQE0kbwPdHZ
	MevWttY0lzMI9J6NYjYl33YN8PqDlxt/V7wxTNmt2jnRdFAS3DwLAj/rqmvd9YIfhMNO7EoF3/f
	8Hikt/tFaBGZR5HSMUL+qA=
X-Received: by 2002:a17:903:704:b0:2b2:ae0c:ad0d with SMTP id d9443c01a7336-2b2d591b960mr51851085ad.5.1775918809394;
        Sat, 11 Apr 2026 07:46:49 -0700 (PDT)
Received: from shyam-VMware-Virtual-Platform.localdomain ([223.181.113.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4ddb742sm63314235ad.27.2026.04.11.07.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 07:46:48 -0700 (PDT)
From: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
To: marvin24@gmx.de,
	gregkh@linuxfoundation.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
Subject: [PATCH v2] staging: nvec: Fix block comment formatting
Date: Sat, 11 Apr 2026 20:01:12 +0530
Message-ID: <20260411144326.3366-2-shyamsunderreddypadira@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13708-lists,linux-tegra=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmx.de,linuxfoundation.org,vger.kernel.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shyamsunderreddypadira@gmail.com,linux-tegra@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-tegra];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C442E3E0667
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Place the closing */ of block comments on a separate line
to follow the coding style.

No functional changes.

changes in v2:
-Fixed trailing whitespaces issues.

Signed-off-by: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
---
 drivers/staging/nvec/nvec.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index e9af66a08448..4799510d2d12 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -659,8 +659,10 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
 			nvec_tx_set(nvec);
 			to_send = nvec->tx->data[0];
 			nvec->tx->pos = 1;
-			/* delay ACK due to AP20 HW Bug
-			   do not replace by usleep_range */
+			/*
+			 * delay ACK due to AP20 HW Bug
+			 * do not replace by usleep_range.
+			 */
 			udelay(33);
 		} else if (status == (I2C_SL_IRQ)) {
 			nvec->rx->data[1] = received;
-- 
2.43.0



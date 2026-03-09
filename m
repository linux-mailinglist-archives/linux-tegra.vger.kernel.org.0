Return-Path: <linux-tegra+bounces-12679-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EActKtH3rmnZKgIAu9opvQ
	(envelope-from <linux-tegra+bounces-12679-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Mon, 09 Mar 2026 17:39:45 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B59E623CDF2
	for <lists+linux-tegra@lfdr.de>; Mon, 09 Mar 2026 17:39:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 40114302B441
	for <lists+linux-tegra@lfdr.de>; Mon,  9 Mar 2026 16:36:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CEF839B48D;
	Mon,  9 Mar 2026 16:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LkG+QxXr"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97D23AEF22
	for <linux-tegra@vger.kernel.org>; Mon,  9 Mar 2026 16:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773074191; cv=none; b=oM0YO582rWLB6FmnRsGrak/A+apmBsjIoK29SMmjhh73pbIRko7aw26lvkOKmuXNhUMk68vPCdZ7azpfCchPIELFIsTcU5OdU5EU468zU5kYm3lmdl9nVR7PLA6jbqirk4sZOqESCa6afAjETJZ6wPt7kwuPWg1ia4z+APYrF64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773074191; c=relaxed/simple;
	bh=jxEri6n9IkuCZ3pmrcgo0GGE1NUE7KcRG433Oye3t/w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pvHKr4btfG/aEnA2WCpuaV+SRQ/iTMoBPwSzLbs1EJlIjEBcRFrYkh2MwzspjLWQIY4gZUeqvmkKnw2QWIqG3ulaVUu1GSqPBS+1W/wR9jAkXm8KvYYHLp5/iF6oqAasbtZlOT+L5yVXQDhWlyegU6ixQaYaujzbIN7sCu8Z7Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LkG+QxXr; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-56afafef7aeso3624447e0c.3
        for <linux-tegra@vger.kernel.org>; Mon, 09 Mar 2026 09:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773074189; x=1773678989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DxT2m6np7uo0cABB26Cll0PvxysiDz7Z+Coo5DaUKlI=;
        b=LkG+QxXrLtrmU93W636pbCis6571v26PGZeG4lIdwJK8Q2UQ7/v74WMWntkpOvHkZa
         AfIhHzWVD8YqccBygZkgpcBlIgYQ2M2VhH4odtSrO6UJvmf+QsPKtCG/PDEKtfCiiDqU
         Itd6FBNC1z6NYnhseKPpBhZb7hT5KDHHQsEvyaepnlvXfF9UKVggXbJEzZmIPr8Lykn2
         4Q94w1eCazYCXIJbzPH6UfeFNrMtlsrMXw2Uf0Nr7s235cRxIZbBe/zvKoTbuLFXXS4w
         J3OoZ6pCmXhb6pIntJG8SIKJBsJZhF+VTM2OBumLYq1NdXHCd/FOxTRzh6r6YYffrGxw
         W04A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773074189; x=1773678989;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DxT2m6np7uo0cABB26Cll0PvxysiDz7Z+Coo5DaUKlI=;
        b=LHFoBMw7Fr4X1S9qzWlgk/8NOaEUu8HkJnmAC/p2UBovwFRBXHt1x5JTgWbF+nEGy3
         pVtvo68oYTjomYHzPHPpA2E/paOVU36/9GJocEUOpNvJyc1gInkCLJUZMuD7upl6zsLi
         zd8C3iamBxqsTBIPDFptZlLeioqFWju7iKhH++DTbn3suxd0p+w2gDZ766fz4wsbvfJ1
         oIgvNbp1DXpiw4iSa4JK7ET2jXtHe5vuIdIt4ZITaGK+hrm8XMIRwFP64PFsqUyRz1EZ
         8drtvzJ3LKBhS9grZGwqyiWMxnEOlN0z+4WijLkEbxZ/XhWt38ml+DMeco0NiDmSg5z+
         2u7g==
X-Forwarded-Encrypted: i=1; AJvYcCUD089NXm/dUc0gKNpdfDIP3ulxJNpHTqkDxNCmRLKzScIAkyB+RFOyTPemBQBf60I7HZVH+iDZXkPNow==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNPirkRkXgDaWW6z4/lhEI1YTsAAypunUH4xByfLbpWpj+T8mK
	AeceYLNrKLOMw38jX4mM+Srtlxqxt4VTqHe78Xc/O0y8B3ZJ6eB2xw3Ogp7LYgmvNp4=
X-Gm-Gg: ATEYQzxOZ9mwLMjYvh4sDoK6iO54UY0cHyUFJN6cHwTTtkbzgJDPjYZsbUi15+ONvjY
	DN3bqzzG4g1LJIdbvkfNJR7S0aYeFL/+UB6Safq3Z8E65Q851aNhH2v9m0LVZJmCw1eASVPyrrF
	wfMQ39l97HxyApC9de1d0puHxOgpu2nuyYiRmIeFlPd99kVxBRHa/P8cVnjk+f0AWCN3Y3REyLw
	OjsTDrlxgyI415TyC4GSak5bf3F/nnmFpdeX5E5edMxdThbFYGjSifvz8ZyKZxW/AFwi4WkyzrX
	kb1ubzxr1oSTFBJFt2z9rM3evAwpDbnBbsTwJpM2sBo7vptNuMIdPMOdWioeGDC7+0u0FppsbzF
	/igVIC19jQHlrkKNNRXCoFqEFTTvcolUsTUreb+ttghp9eWUYVMnrZontbflfkpociy0fo3BQkd
	IpB22f6DHUilbbuw==
X-Received: by 2002:a05:6122:20a9:b0:559:6960:be0d with SMTP id 71dfb90a1353d-56b07e8ab81mr5145281e0c.13.1773074188731;
        Mon, 09 Mar 2026 09:36:28 -0700 (PDT)
Received: from horus ([138.97.160.237])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56b09b20d02sm10493072e0c.15.2026.03.09.09.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 09:36:28 -0700 (PDT)
From: Luis Soza Rodriguez <luistermc789@gmail.com>
X-Google-Original-From: Luis Soza Rodriguez <contact@sluisr.com>
To: marvin24@gmx.de,
	gregkh@linuxfoundation.org
Cc: ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luis Soza Rodriguez <contact@sluisr.com>
Subject: [PATCH] staging: nvec: fix block comment format
Date: Mon,  9 Mar 2026 10:36:25 -0600
Message-ID: <20260309163625.18014-1-contact@sluisr.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B59E623CDF2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12679-lists,linux-tegra=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmx.de,linuxfoundation.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[luistermc789@gmail.com,linux-tegra@vger.kernel.org];
	NEURAL_HAM(-0.00)[-0.964];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

This patch fixes the checkpatch.pl warnings:
WARNING: Block comments use * on subsequent lines
WARNING: Block comments use a trailing */ on a separate line
by reformatting the block comment in nvec.c to use the standard kernel style.

Signed-off-by: Luis Soza Rodriguez <contact@sluisr.com>
---
 drivers/staging/nvec/nvec.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index e9af66a08..62013019a 100644
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
+			 * do not replace by usleep_range
+			 */
 			udelay(33);
 		} else if (status == (I2C_SL_IRQ)) {
 			nvec->rx->data[1] = received;
-- 
2.53.0



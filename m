Return-Path: <linux-tegra+bounces-14604-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHo9EtbODmq7CQYAu9opvQ
	(envelope-from <linux-tegra+bounces-14604-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Thu, 21 May 2026 11:22:30 +0200
X-Original-To: lists+linux-tegra@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F24625A23CE
	for <lists+linux-tegra@lfdr.de>; Thu, 21 May 2026 11:22:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CFE6E32030EF
	for <lists+linux-tegra@lfdr.de>; Thu, 21 May 2026 09:05:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CBB7371D15;
	Thu, 21 May 2026 09:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HVLaCFgQ"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8AB9368D5C
	for <linux-tegra@vger.kernel.org>; Thu, 21 May 2026 09:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779354283; cv=none; b=YX7xFCYc866Xrhn+8zOqg5/QQ7jXSvwhwv2qP3hryJD4V2o/v+U2ZOhIOFzH/wRIuSjHmrg/bh1T+SCSgROGRGdUyRTWfZep8aBqfXe1QFWks7gdjNOQoRZSCQ1FLsSxTYygu6IVb1kact1d2rmru96+LTEicYtzDlMJ+dxBQVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779354283; c=relaxed/simple;
	bh=07NSKHICgCN3pWwcM2NlZ2C6aALUEOm7y9usKcSSRKQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LWbAxNbwD+W9FXvj3zVufyo81fnYJIWySy0OTq2JPIbnTFQoeAYwUqV1qf0IU5BWYrJj5d9+XhFYnqiyB6G+tqxrYf/lpvw3FyaikeeeKUXu9Pc8WZwbKZGFdSDwpab8UmBqT7kSBSV9bH0ulJQfptU9zww4+QRbkLVUA3IkCvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--joonwonkang.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HVLaCFgQ; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joonwonkang.bounces.google.com
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c850fcc89d1so539910a12.1
        for <linux-tegra@vger.kernel.org>; Thu, 21 May 2026 02:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779354281; x=1779959081; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CFeqTPO/75EomKS7CanmkqdMcPboUUUckwg42QFpRDY=;
        b=HVLaCFgQ5AStcp7yy4W38dml1KoMJX4Yq0IhWGckfP+26AxprMzB+Q7RlsPC8N+jgD
         2w2D+e5zHjw1LcfDy6pzidRQO0WjV0sl7vr6tkmgebCZFyJBSb0eNIXFbxrq9knAAFNh
         t+P7yZC8rtxIZ+ff5A50cxdNreH/oHYhwXPfQWHEKii3AkrjS8mig/iqXm+EN9CVigVM
         BJQdQ2+nDzdOY6AfYvcj0WhRcRuvPL7ljYV9UzG49JnT9hIVyrXuoEael2+wHPS/ITGA
         k3fjreFjSmTSpzTHRGo7V3Wl89sd7a9J+E4Hxn72n+fAb9AxGxK9jswt9aAJHsRMV6dl
         N8Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779354281; x=1779959081;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CFeqTPO/75EomKS7CanmkqdMcPboUUUckwg42QFpRDY=;
        b=FNEuReGUR8LyT65y75IYIz74yAUwbS2OBiKDTtsp2mtU454BiCLysLXmM7Y4EzZJv3
         P3yzgD+sEliCCJUYDos/dF/xW0fReQ1G64tg4B+FWnoZ0qiRkbU/486ixXkYp5aJtCNK
         EcnpVtj3Z7fJknLh0IUdUxPuy23NGfuGciptjBagra8OcETISEHn6yKIhX5ccGeXd+HA
         BD+08Azf4gXDjFEpEe0YYZ8aySq5WoRUYP0h3U4JJ96sLqLhe+7R+i8gHD053QnW3d07
         S+d/wRSQW+iQAFOYN9jwoeuWCL9WjIUcrv8KqlhiHqCYrb6i4+XgYcs7OoLpRN0Rv7e+
         /CSg==
X-Forwarded-Encrypted: i=1; AFNElJ+8bSjAAuyEvDm+Kc6LkZoGfCG7l/Y7UJ8I/E3zMXtLj91uqzToRPfSxzLz0lUV1ZFc05kCuls6rsp8Ww==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIPDhvffapOFLQPhvKj6ycTpQ8/IugcuDTotoVxDfEkUU7g9Mz
	mJ3/L9zFTobmLRdIsi48KgnLP7IbMqWzqd4QWr47UtdaLfMr9urB8GXdyqUPNqSRa0y/FAhi0yb
	9vqGj+fXEHJvwDGUTxDHHwSPd3Q==
X-Received: from pfmm4.prod.google.com ([2002:a05:6a00:2484:b0:835:20c7:97df])
 (user=joonwonkang job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:1908:b0:829:8cfb:df45 with SMTP id d2e1a72fcca58-8414acdd152mr2147460b3a.15.1779354280643;
 Thu, 21 May 2026 02:04:40 -0700 (PDT)
Date: Thu, 21 May 2026 09:04:32 +0000
In-Reply-To: <20260521090433.1353240-1-joonwonkang@google.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260521090433.1353240-1-joonwonkang@google.com>
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <20260521090433.1353240-2-joonwonkang@google.com>
Subject: [PATCH RESEND v2 v6.18.y] mailbox: Fix NULL message support in mbox_send_message()
From: Joonwon Kang <joonwonkang@google.com>
To: sashal@kernel.org, stable@vger.kernel.org, jassisinghbrar@gmail.com, 
	greg@kroah.com
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
	joonwonkang@google.com, dianders@chromium.org, sudeep.holla@arm.com, 
	linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,nvidia.com,vger.kernel.org,google.com,chromium.org,arm.com];
	TAGGED_FROM(0.00)[bounces-14604-lists,linux-tegra=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,vger.kernel.org,gmail.com,kroah.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joonwonkang@google.com,linux-tegra@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-tegra];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_TWELVE(0.00)[12]
X-Rspamd-Queue-Id: F24625A23CE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jassi Brar <jassisinghbrar@gmail.com>

commit c58e9456e30c ("mailbox: Fix NULL message support in mbox_send_message()") upstream.

The active_req field serves double duty as both the "is a TX in
flight" flag (NULL means idle) and the storage for the in-flight
message pointer. When a client sends NULL via mbox_send_message(),
active_req is set to NULL, which the framework misinterprets as
"no active request". This breaks the TX state machine by:

 - tx_tick() short-circuits on (!mssg), skipping the tx_done
   callback and the tx_complete completion
 - txdone_hrtimer() skips the channel entirely since active_req
   is NULL, so poll-based TX-done detection never fires.

Fix this by introducing a MBOX_NO_MSG sentinel value that means
"no active request," freeing NULL to be valid message data. The
sentinel is defined in the subsystem-internal mailbox.h so that
controller drivers within drivers/mailbox/ can reference it, but
it is not exposed to clients outside the subsystem.

Fifteen in-tree callers send NULL (doorbell-style IPCs on Qualcomm,
Tegra, TI, Xilinx, i.MX, SCMI, and PCC platforms). All were
audited for regression:

 - Most already work around the bug via knows_txdone=true with a
   manual mbox_client_txdone() call, making the framework's
   tracking irrelevant. These are unaffected.

 - Poll-based callers (Xilinx zynqmp/r5) are strictly better off:
   the poll timer now correctly detects NULL-active channels
   instead of silently skipping them.

 - irq-qcom-mpm.c was a pre-existing bug -- the only Qualcomm
   caller that omitted the knows_txdone + mbox_client_txdone()
   pattern. Fixed in a companion commit ("irqchip/qcom-mpm: Fix
   missing mailbox TX done acknowledgment").

 - No caller sets both a tx_done callback and sends NULL, nor
   combines tx_block=true with NULL sends, so the newly reachable
   callback/completion paths are never exercised.

Also update tegra-hsp's flush callback, which directly inspects
active_req to wait for the channel to drain: the old "!= NULL"
check becomes "!= MBOX_NO_MSG", otherwise flush spins until
timeout since the sentinel is non-NULL.

The only tradeoff is that 'MBOX_NO_MSG' can not be used as a message
by clients.

Reported-by: Joonwon Kang <joonwonkang@google.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Jassi Brar <jassisinghbrar@gmail.com>
Signed-off-by: Joonwon Kang <joonwonkang@google.com>
---
v2: Remove the obsolete change for drivers/mailbox/pcc.c.
v1: Add the MBOX_NO_MSG check to drivers/mailbox/pcc.c.

 drivers/mailbox/mailbox.c          | 15 ++++++++-------
 drivers/mailbox/tegra-hsp.c        |  2 +-
 include/linux/mailbox_controller.h |  3 +++
 3 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index 617ba505691d..9622369cab66 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -52,7 +52,7 @@ static void msg_submit(struct mbox_chan *chan)
 	int err = -EBUSY;
 
 	scoped_guard(spinlock_irqsave, &chan->lock) {
-		if (!chan->msg_count || chan->active_req)
+		if (!chan->msg_count || chan->active_req != MBOX_NO_MSG)
 			break;
 
 		count = chan->msg_count;
@@ -87,13 +87,13 @@ static void tx_tick(struct mbox_chan *chan, int r)
 
 	scoped_guard(spinlock_irqsave, &chan->lock) {
 		mssg = chan->active_req;
-		chan->active_req = NULL;
+		chan->active_req = MBOX_NO_MSG;
 	}
 
 	/* Submit next message */
 	msg_submit(chan);
 
-	if (!mssg)
+	if (mssg == MBOX_NO_MSG)
 		return;
 
 	/* Notify the client */
@@ -114,7 +114,7 @@ static enum hrtimer_restart txdone_hrtimer(struct hrtimer *hrtimer)
 	for (i = 0; i < mbox->num_chans; i++) {
 		struct mbox_chan *chan = &mbox->chans[i];
 
-		if (chan->active_req && chan->cl) {
+		if (chan->active_req != MBOX_NO_MSG && chan->cl) {
 			txdone = chan->mbox->ops->last_tx_done(chan);
 			if (txdone)
 				tx_tick(chan, 0);
@@ -246,7 +246,7 @@ int mbox_send_message(struct mbox_chan *chan, void *mssg)
 {
 	int t;
 
-	if (!chan || !chan->cl)
+	if (!chan || !chan->cl || mssg == MBOX_NO_MSG)
 		return -EINVAL;
 
 	t = add_to_rbuf(chan, mssg);
@@ -319,7 +319,7 @@ static int __mbox_bind_client(struct mbox_chan *chan, struct mbox_client *cl)
 	scoped_guard(spinlock_irqsave, &chan->lock) {
 		chan->msg_free = 0;
 		chan->msg_count = 0;
-		chan->active_req = NULL;
+		chan->active_req = MBOX_NO_MSG;
 		chan->cl = cl;
 		init_completion(&chan->tx_complete);
 
@@ -477,7 +477,7 @@ void mbox_free_channel(struct mbox_chan *chan)
 	/* The queued TX requests are simply aborted, no callbacks are made */
 	scoped_guard(spinlock_irqsave, &chan->lock) {
 		chan->cl = NULL;
-		chan->active_req = NULL;
+		chan->active_req = MBOX_NO_MSG;
 		if (chan->txdone_method == TXDONE_BY_ACK)
 			chan->txdone_method = TXDONE_BY_POLL;
 	}
@@ -532,6 +532,7 @@ int mbox_controller_register(struct mbox_controller *mbox)
 
 		chan->cl = NULL;
 		chan->mbox = mbox;
+		chan->active_req = MBOX_NO_MSG;
 		chan->txdone_method = txdone;
 		spin_lock_init(&chan->lock);
 	}
diff --git a/drivers/mailbox/tegra-hsp.c b/drivers/mailbox/tegra-hsp.c
index ed9a0bb2bcd8..7991e8dba579 100644
--- a/drivers/mailbox/tegra-hsp.c
+++ b/drivers/mailbox/tegra-hsp.c
@@ -497,7 +497,7 @@ static int tegra_hsp_mailbox_flush(struct mbox_chan *chan,
 			mbox_chan_txdone(chan, 0);
 
 			/* Wait until channel is empty */
-			if (chan->active_req != NULL)
+			if (chan->active_req != MBOX_NO_MSG)
 				continue;
 
 			return 0;
diff --git a/include/linux/mailbox_controller.h b/include/linux/mailbox_controller.h
index 80a427c7ca29..1db0069c27c5 100644
--- a/include/linux/mailbox_controller.h
+++ b/include/linux/mailbox_controller.h
@@ -11,6 +11,9 @@
 
 struct mbox_chan;
 
+/* Sentinel value distinguishing "no active request" from "NULL message data" */
+#define MBOX_NO_MSG	((void *)-1)
+
 /**
  * struct mbox_chan_ops - methods to control mailbox channels
  * @send_data:	The API asks the MBOX controller driver, in atomic
-- 
2.54.0.746.g67dd491aae-goog



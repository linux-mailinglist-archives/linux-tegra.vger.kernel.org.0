Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C78667399A
	for <lists+linux-tegra@lfdr.de>; Thu, 19 Jan 2023 14:11:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230354AbjASNL1 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 19 Jan 2023 08:11:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230396AbjASNLF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 19 Jan 2023 08:11:05 -0500
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 155497E698;
        Thu, 19 Jan 2023 05:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
        s=20161220; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
        Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=yxvZRuDgdikFRbFohfPeXUHNucrqEQrrcSHLXLhGx5M=; b=pdwcZbTBVlxfZAqOGr7GGCgL+i
        WgW7WYE0epvjb79N2y/a1lUQqx15OlOBplsaYuXVhGqP4CeK1CsCCybkIlxElOBZu2GN2BRcOrBnl
        jO4bfOTcaX8WVXbZ855ybtzJDTtZGrqhRurrApdstsCUp6uarJRzTphR4KERTzCWACYcpBlGfFeYM
        8LfF3iqftlKeLK+2ccJEevhs6Y5s5UbAz3E5WW8q/g1RWLG6uWe0yK1gumTEniaNURkskFjEfQN20
        46lIjccFirWjgTwscxZt5hb+OwVP6pSE0gD9UsHYPHz7rlLyzU0LjaBaBW3ogV23o+46L77V0ODgS
        cuUd2QBw==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <cyndis@kapsi.fi>)
        id 1pIUfe-000zLh-Mx; Thu, 19 Jan 2023 15:09:34 +0200
From:   Mikko Perttunen <cyndis@kapsi.fi>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     Mikko Perttunen <mperttunen@nvidia.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] gpu: host1x: Implement syncpoint wait using DMA fences
Date:   Thu, 19 Jan 2023 15:09:18 +0200
Message-Id: <20230119130921.1882602-1-cyndis@kapsi.fi>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Mikko Perttunen <mperttunen@nvidia.com>

In anticipation of removal of the intr API, move host1x_syncpt_wait
to use DMA fences instead. As of this patch, this means that waits
have a 30 second maximum timeout because of the implicit timeout
we have with fences, but that will be lifted in a follow-up patch.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/host1x/syncpt.c | 96 ++++++++-----------------------------
 1 file changed, 20 insertions(+), 76 deletions(-)

diff --git a/drivers/gpu/host1x/syncpt.c b/drivers/gpu/host1x/syncpt.c
index f87a8705f518..75f58ec2ae23 100644
--- a/drivers/gpu/host1x/syncpt.c
+++ b/drivers/gpu/host1x/syncpt.c
@@ -7,6 +7,7 @@
 
 #include <linux/module.h>
 #include <linux/device.h>
+#include <linux/dma-fence.h>
 #include <linux/slab.h>
 
 #include <trace/events/host1x.h>
@@ -209,17 +210,6 @@ int host1x_syncpt_incr(struct host1x_syncpt *sp)
 }
 EXPORT_SYMBOL(host1x_syncpt_incr);
 
-/*
- * Updated sync point form hardware, and returns true if syncpoint is expired,
- * false if we may need to wait
- */
-static bool syncpt_load_min_is_expired(struct host1x_syncpt *sp, u32 thresh)
-{
-	host1x_hw_syncpt_load(sp->host, sp);
-
-	return host1x_syncpt_is_expired(sp, thresh);
-}
-
 /**
  * host1x_syncpt_wait() - wait for a syncpoint to reach a given value
  * @sp: host1x syncpoint
@@ -230,10 +220,10 @@ static bool syncpt_load_min_is_expired(struct host1x_syncpt *sp, u32 thresh)
 int host1x_syncpt_wait(struct host1x_syncpt *sp, u32 thresh, long timeout,
 		       u32 *value)
 {
-	DECLARE_WAIT_QUEUE_HEAD_ONSTACK(wq);
-	void *ref;
-	struct host1x_waitlist *waiter;
-	int err = 0, check_count = 0;
+	struct dma_fence *fence;
+	long wait_err;
+
+	host1x_hw_syncpt_load(sp->host, sp);
 
 	if (value)
 		*value = host1x_syncpt_load(sp);
@@ -241,73 +231,27 @@ int host1x_syncpt_wait(struct host1x_syncpt *sp, u32 thresh, long timeout,
 	if (host1x_syncpt_is_expired(sp, thresh))
 		return 0;
 
-	if (!timeout) {
-		err = -EAGAIN;
-		goto done;
-	}
-
-	/* allocate a waiter */
-	waiter = kzalloc(sizeof(*waiter), GFP_KERNEL);
-	if (!waiter) {
-		err = -ENOMEM;
-		goto done;
-	}
-
-	/* schedule a wakeup when the syncpoint value is reached */
-	err = host1x_intr_add_action(sp->host, sp, thresh,
-				     HOST1X_INTR_ACTION_WAKEUP_INTERRUPTIBLE,
-				     &wq, waiter, &ref);
-	if (err)
-		goto done;
-
-	err = -EAGAIN;
-	/* Caller-specified timeout may be impractically low */
 	if (timeout < 0)
 		timeout = LONG_MAX;
+	else if (timeout == 0)
+		return -EAGAIN;
 
-	/* wait for the syncpoint, or timeout, or signal */
-	while (timeout) {
-		long check = min_t(long, SYNCPT_CHECK_PERIOD, timeout);
-		int remain;
-
-		remain = wait_event_interruptible_timeout(wq,
-				syncpt_load_min_is_expired(sp, thresh),
-				check);
-		if (remain > 0 || host1x_syncpt_is_expired(sp, thresh)) {
-			if (value)
-				*value = host1x_syncpt_load(sp);
+	fence = host1x_fence_create(sp, thresh);
+	if (IS_ERR(fence))
+		return PTR_ERR(fence);
 
-			err = 0;
+	wait_err = dma_fence_wait_timeout(fence, true, timeout);
+	dma_fence_put(fence);
 
-			break;
-		}
-
-		if (remain < 0) {
-			err = remain;
-			break;
-		}
-
-		timeout -= check;
-
-		if (timeout && check_count <= MAX_STUCK_CHECK_COUNT) {
-			dev_warn(sp->host->dev,
-				"%s: syncpoint id %u (%s) stuck waiting %d, timeout=%ld\n",
-				 current->comm, sp->id, sp->name,
-				 thresh, timeout);
-
-			host1x_debug_dump_syncpts(sp->host);
-
-			if (check_count == MAX_STUCK_CHECK_COUNT)
-				host1x_debug_dump(sp->host);
-
-			check_count++;
-		}
-	}
-
-	host1x_intr_put_ref(sp->host, sp->id, ref, true);
+	if (value)
+		*value = host1x_syncpt_load(sp);
 
-done:
-	return err;
+	if (wait_err == 0)
+		return -EAGAIN;
+	else if (wait_err < 0)
+		return wait_err;
+	else
+		return 0;
 }
 EXPORT_SYMBOL(host1x_syncpt_wait);
 
-- 
2.39.0


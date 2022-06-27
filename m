Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D43B955C82F
	for <lists+linux-tegra@lfdr.de>; Tue, 28 Jun 2022 14:55:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237097AbiF0OUv (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 27 Jun 2022 10:20:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237035AbiF0OUp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 27 Jun 2022 10:20:45 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87A02101C2;
        Mon, 27 Jun 2022 07:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
        s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=uOwqaF85BPufjNmSTdi3rQT+xpb0ifYZ9SvKkmU1oqA=; b=yMRARXDKbOtS/a0rN5rRqhQP3y
        QCI57BG4IJrk/QYRn/LdoSzsFhmbDunj+i3TaS7C9OHZv+8GwuDOL68cJFXk4xnlHxKs7mKIRra26
        6nbSZYj5kIu65W4PLhdEqP1l7zySJ4qeFH7eZoj5mlFV9SYadpAyFzHKEcUMmYKatM2iyUXow4myQ
        enO55/1yuLavPeXgWcJiA+Nu6BU7gbJsol8b7/dDBiBN49oPV28ZZih+Hrc3rL0bw88N6xKsFishI
        6WduHHVlAK5DXAFX6EywifF/6N2+5o/wKTcIOhcYvsYd7yhGCpmkDwKZzomSwpkdUs23os8ywVyzU
        GsHS3mdQ==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <cyndis@kapsi.fi>)
        id 1o5pbO-003N2J-UY; Mon, 27 Jun 2022 17:20:33 +0300
From:   Mikko Perttunen <cyndis@kapsi.fi>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>
Cc:     Mikko Perttunen <mperttunen@nvidia.com>,
        Robin Murphy <robin.murphy@arm.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7/v3 19/22] gpu: host1x: Rewrite job opcode sequence
Date:   Mon, 27 Jun 2022 17:20:05 +0300
Message-Id: <20220627142008.2072474-20-cyndis@kapsi.fi>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627142008.2072474-1-cyndis@kapsi.fi>
References: <20220627142008.2072474-1-cyndis@kapsi.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Mikko Perttunen <mperttunen@nvidia.com>

For new (Tegra186+) SoCs, use a new ('full-featured') job opcode
sequence that is compatible with virtualization. In particular,
the Host1x hardware in Tegra234 is more strict regarding the sequence,
requiring ACQUIRE_MLOCK-SETCLASS-SETSTREAMID opcodes to occur in
that sequence without gaps (except for SETPAYLOAD), so let's do it
properly in one go now.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/host1x/hw/channel_hw.c | 144 +++++++++++++++++------------
 1 file changed, 85 insertions(+), 59 deletions(-)

diff --git a/drivers/gpu/host1x/hw/channel_hw.c b/drivers/gpu/host1x/hw/channel_hw.c
index f84caf06621a..4eb7fb2e4f0a 100644
--- a/drivers/gpu/host1x/hw/channel_hw.c
+++ b/drivers/gpu/host1x/hw/channel_hw.c
@@ -47,10 +47,41 @@ static void trace_write_gather(struct host1x_cdma *cdma, struct host1x_bo *bo,
 	}
 }
 
-static void submit_wait(struct host1x_cdma *cdma, u32 id, u32 threshold,
+static void submit_wait(struct host1x_job *job, u32 id, u32 threshold,
 			u32 next_class)
 {
-#if HOST1X_HW >= 2
+	struct host1x_cdma *cdma = &job->channel->cdma;
+
+#if HOST1X_HW >= 6
+	u32 stream_id;
+
+	/*
+	 * If a memory context has been set, use it. Otherwise
+	 * (if context isolation is disabled) use the engine's
+	 * firmware stream ID.
+	 */
+	if (job->memory_context)
+		stream_id = job->memory_context->stream_id;
+	else
+		stream_id = job->engine_fallback_streamid;
+
+	host1x_cdma_push_wide(cdma,
+		host1x_opcode_setclass(
+			HOST1X_CLASS_HOST1X,
+			HOST1X_UCLASS_LOAD_SYNCPT_PAYLOAD_32,
+			/* WAIT_SYNCPT_32 is at SYNCPT_PAYLOAD_32+2 */
+			BIT(0) | BIT(2)
+		),
+		threshold,
+		id,
+		HOST1X_OPCODE_NOP
+	);
+	host1x_cdma_push_wide(&job->channel->cdma,
+		host1x_opcode_setclass(job->class, 0, 0),
+		host1x_opcode_setpayload(stream_id),
+		host1x_opcode_setstreamid(job->engine_streamid_offset / 4),
+		HOST1X_OPCODE_NOP);
+#elif HOST1X_HW >= 2
 	host1x_cdma_push_wide(cdma,
 		host1x_opcode_setclass(
 			HOST1X_CLASS_HOST1X,
@@ -97,7 +128,7 @@ static void submit_gathers(struct host1x_job *job, u32 job_syncpt_base)
 			else
 				threshold = cmd->wait.threshold;
 
-			submit_wait(cdma, cmd->wait.id, threshold, cmd->wait.next_class);
+			submit_wait(job, cmd->wait.id, threshold, cmd->wait.next_class);
 		} else {
 			struct host1x_job_gather *g = &cmd->gather;
 
@@ -180,42 +211,70 @@ static void host1x_enable_gather_filter(struct host1x_channel *ch)
 #endif
 }
 
-static void host1x_channel_program_engine_streamid(struct host1x_job *job)
+static void channel_program_cdma(struct host1x_job *job)
 {
+	struct host1x_cdma *cdma = &job->channel->cdma;
+	struct host1x_syncpt *sp = job->syncpt;
+
 #if HOST1X_HW >= 6
 	u32 fence;
 
-	if (!job->memory_context)
-		return;
+	/* Enter engine class with invalid stream ID. */
+	host1x_cdma_push_wide(cdma,
+		host1x_opcode_acquire_mlock(job->class),
+		host1x_opcode_setclass(job->class, 0, 0),
+		host1x_opcode_setpayload(0),
+		host1x_opcode_setstreamid(job->engine_streamid_offset / 4));
 
-	fence = host1x_syncpt_incr_max(job->syncpt, 1);
+	/* Before switching stream ID to real stream ID, ensure engine is idle. */
+	fence = host1x_syncpt_incr_max(sp, 1);
+	host1x_cdma_push(&job->channel->cdma,
+		host1x_opcode_nonincr(HOST1X_UCLASS_INCR_SYNCPT, 1),
+		HOST1X_UCLASS_INCR_SYNCPT_INDX_F(job->syncpt->id) |
+			HOST1X_UCLASS_INCR_SYNCPT_COND_F(4));
+	submit_wait(job, job->syncpt->id, fence, job->class);
 
-	/* First, increment a syncpoint on OP_DONE condition.. */
+	/* Submit work. */
+	job->syncpt_end = host1x_syncpt_incr_max(sp, job->syncpt_incrs);
+	submit_gathers(job, job->syncpt_end - job->syncpt_incrs);
 
+	/* Before releasing MLOCK, ensure engine is idle again. */
+	fence = host1x_syncpt_incr_max(sp, 1);
 	host1x_cdma_push(&job->channel->cdma,
 		host1x_opcode_nonincr(HOST1X_UCLASS_INCR_SYNCPT, 1),
 		HOST1X_UCLASS_INCR_SYNCPT_INDX_F(job->syncpt->id) |
-			HOST1X_UCLASS_INCR_SYNCPT_COND_F(1));
+			HOST1X_UCLASS_INCR_SYNCPT_COND_F(4));
+	submit_wait(job, job->syncpt->id, fence, job->class);
 
-	/* Wait for syncpoint to increment */
+	/* Release MLOCK. */
+	host1x_cdma_push(cdma,
+		HOST1X_OPCODE_NOP, host1x_opcode_release_mlock(job->class));
+#else
+	if (job->serialize) {
+		/*
+		 * Force serialization by inserting a host wait for the
+		 * previous job to finish before this one can commence.
+		 */
+		host1x_cdma_push(cdma,
+				 host1x_opcode_setclass(HOST1X_CLASS_HOST1X,
+					host1x_uclass_wait_syncpt_r(), 1),
+				 host1x_class_host_wait_syncpt(job->syncpt->id,
+					host1x_syncpt_read_max(sp)));
+	}
 
-	host1x_cdma_push(&job->channel->cdma,
-		host1x_opcode_setclass(HOST1X_CLASS_HOST1X,
-			host1x_uclass_wait_syncpt_r(), 1),
-		host1x_class_host_wait_syncpt(job->syncpt->id, fence));
+	/* Synchronize base register to allow using it for relative waiting */
+	if (sp->base)
+		synchronize_syncpt_base(job);
 
-	/*
-	 * Now that we know the engine is idle, return to class and
-	 * change stream ID.
-	 */
+	/* add a setclass for modules that require it */
+	if (job->class)
+		host1x_cdma_push(cdma,
+				 host1x_opcode_setclass(job->class, 0, 0),
+				 HOST1X_OPCODE_NOP);
 
-	host1x_cdma_push(&job->channel->cdma,
-		host1x_opcode_setclass(job->class, 0, 0),
-		HOST1X_OPCODE_NOP);
+	job->syncpt_end = host1x_syncpt_incr_max(sp, job->syncpt_incrs);
 
-	host1x_cdma_push(&job->channel->cdma,
-		host1x_opcode_setpayload(job->memory_context->stream_id),
-		host1x_opcode_setstreamid(job->engine_streamid_offset / 4));
+	submit_gathers(job, job->syncpt_end - job->syncpt_incrs);
 #endif
 }
 
@@ -223,7 +282,6 @@ static int channel_submit(struct host1x_job *job)
 {
 	struct host1x_channel *ch = job->channel;
 	struct host1x_syncpt *sp = job->syncpt;
-	u32 user_syncpt_incrs = job->syncpt_incrs;
 	u32 prev_max = 0;
 	u32 syncval;
 	int err;
@@ -251,6 +309,7 @@ static int channel_submit(struct host1x_job *job)
 
 	host1x_channel_set_streamid(ch);
 	host1x_enable_gather_filter(ch);
+	host1x_hw_syncpt_assign_to_channel(host, sp, ch);
 
 	/* begin a CDMA submit */
 	err = host1x_cdma_begin(&ch->cdma, job);
@@ -259,40 +318,7 @@ static int channel_submit(struct host1x_job *job)
 		goto error;
 	}
 
-	if (job->serialize) {
-		/*
-		 * Force serialization by inserting a host wait for the
-		 * previous job to finish before this one can commence.
-		 */
-		host1x_cdma_push(&ch->cdma,
-				 host1x_opcode_setclass(HOST1X_CLASS_HOST1X,
-					host1x_uclass_wait_syncpt_r(), 1),
-				 host1x_class_host_wait_syncpt(job->syncpt->id,
-					host1x_syncpt_read_max(sp)));
-	}
-
-	/* Synchronize base register to allow using it for relative waiting */
-	if (sp->base)
-		synchronize_syncpt_base(job);
-
-	host1x_hw_syncpt_assign_to_channel(host, sp, ch);
-
-	/* add a setclass for modules that require it */
-	if (job->class)
-		host1x_cdma_push(&ch->cdma,
-				 host1x_opcode_setclass(job->class, 0, 0),
-				 HOST1X_OPCODE_NOP);
-
-	/*
-	 * Ensure engine DMA is idle and set new stream ID. May increment
-	 * syncpt max.
-	 */
-	host1x_channel_program_engine_streamid(job);
-
-	syncval = host1x_syncpt_incr_max(sp, user_syncpt_incrs);
-	job->syncpt_end = syncval;
-
-	submit_gathers(job, syncval - user_syncpt_incrs);
+	channel_program_cdma(job);
 
 	/* end CDMA submit & stash pinned hMems into sync queue */
 	host1x_cdma_end(&ch->cdma, job);
-- 
2.36.1


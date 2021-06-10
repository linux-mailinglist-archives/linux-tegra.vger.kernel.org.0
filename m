Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE5D63A29BB
	for <lists+linux-tegra@lfdr.de>; Thu, 10 Jun 2021 13:05:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230060AbhFJLHS (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 10 Jun 2021 07:07:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230059AbhFJLHR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 10 Jun 2021 07:07:17 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51466C061760
        for <linux-tegra@vger.kernel.org>; Thu, 10 Jun 2021 04:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=qV1B2r0R+nQfQW+w7m+ept7lBhj3+sOiu3983kJfUhk=; b=ofTVB4udEdUyTsS7WQOBELVfpe
        +LcwlhXFiTSw3PdzyXA31XbZYpFWXBd+wb+Y3jWwXzH3L/jo0GJ7jMttU2jj38ldttMXzhPxm8XHW
        T3t+3o8c24LzI/b8r40AFqJjaC8/CP2Quh5AJRPXi0NtW6q22AS4FMzcbdbl6qe/sa2NBwylpeXoJ
        PujTKXe3HWiBztD1E7/bl2Y64ZEcRQVINWRzJ315e8KKJf/c+xoOECJgyB/DzTcHmaX9a7zhNZuX1
        U0jigPtReVFOzftpji3vxblNCVJ6SxskBncr/GiN5bsBZxOJAKLDN86PNwl+HKhiAQVR7+kS8lKDx
        ecE+c7Eg==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <mperttunen@nvidia.com>)
        id 1lrIUs-0001s7-UK; Thu, 10 Jun 2021 14:05:15 +0300
From:   Mikko Perttunen <mperttunen@nvidia.com>
To:     thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com,
        airlied@linux.ie, daniel@ffwll.ch
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH v7 04/15] gpu: host1x: Add support for syncpoint waits in CDMA pushbuffer
Date:   Thu, 10 Jun 2021 14:04:45 +0300
Message-Id: <20210610110456.3692391-5-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210610110456.3692391-1-mperttunen@nvidia.com>
References: <20210610110456.3692391-1-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: mperttunen@nvidia.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add support for inserting syncpoint waits in the CDMA pushbuffer.
These waits need to be done in HOST1X class, while gather submitted
by the application execute in engine class.

Support is added by converting the gather list of job into a command
list that can include both gathers and waits. When the job is
submitted, these commands are pushed as the appropriate opcodes
on the CDMA pushbuffer.

Also supported are waits relative to the start of the job,
which are useful for jobs doing multiple things with an engine
that doesn't natively support pipelining.

While at it, use 32-bit waits on chips that support them.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
v6:
- Change into specified class after wait
- Support waits relative to start of job
- Support 32-bit waits
---
 drivers/gpu/host1x/hw/channel_hw.c         | 85 +++++++++++++++++-----
 drivers/gpu/host1x/hw/debug_hw.c           |  9 ++-
 drivers/gpu/host1x/hw/hw_host1x02_uclass.h | 12 +++
 drivers/gpu/host1x/hw/hw_host1x04_uclass.h | 12 +++
 drivers/gpu/host1x/hw/hw_host1x05_uclass.h | 12 +++
 drivers/gpu/host1x/hw/hw_host1x06_uclass.h | 12 +++
 drivers/gpu/host1x/hw/hw_host1x07_uclass.h | 12 +++
 drivers/gpu/host1x/job.c                   | 70 +++++++++++++-----
 drivers/gpu/host1x/job.h                   | 16 ++++
 include/linux/host1x.h                     |  6 +-
 10 files changed, 203 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/host1x/hw/channel_hw.c b/drivers/gpu/host1x/hw/channel_hw.c
index bf21512e5078..1999780a7203 100644
--- a/drivers/gpu/host1x/hw/channel_hw.c
+++ b/drivers/gpu/host1x/hw/channel_hw.c
@@ -47,39 +47,84 @@ static void trace_write_gather(struct host1x_cdma *cdma, struct host1x_bo *bo,
 	}
 }
 
-static void submit_gathers(struct host1x_job *job)
+static void submit_wait(struct host1x_cdma *cdma, u32 id, u32 threshold,
+			u32 next_class)
+{
+#if HOST1X_HW >= 2
+	host1x_cdma_push_wide(cdma,
+		host1x_opcode_setclass(
+			HOST1X_CLASS_HOST1X,
+			HOST1X_UCLASS_LOAD_SYNCPT_PAYLOAD_32,
+			/* WAIT_SYNCPT_32 is at SYNCPT_PAYLOAD_32+2 */
+			BIT(0) | BIT(2)
+		),
+		threshold,
+		id,
+		host1x_opcode_setclass(next_class, 0, 0)
+	);
+#else
+	/* TODO add waitchk or use waitbases or other mitigation */
+	host1x_cdma_push(cdma,
+		host1x_opcode_setclass(
+			HOST1X_CLASS_HOST1X,
+			host1x_uclass_wait_syncpt_r(),
+			BIT(0)
+		),
+		host1x_class_host_wait_syncpt(id, threshold)
+	);
+	host1x_cdma_push(cdma,
+		host1x_opcode_setclass(next_class, 0, 0),
+		HOST1X_OPCODE_NOP
+	);
+#endif
+}
+
+static void submit_gathers(struct host1x_job *job, u32 job_syncpt_base)
 {
 	struct host1x_cdma *cdma = &job->channel->cdma;
 #if HOST1X_HW < 6
 	struct device *dev = job->channel->dev;
 #endif
 	unsigned int i;
+	u32 threshold;
 
-	for (i = 0; i < job->num_gathers; i++) {
-		struct host1x_job_gather *g = &job->gathers[i];
-		dma_addr_t addr = g->base + g->offset;
-		u32 op2, op3;
+	for (i = 0; i < job->num_cmds; i++) {
+		struct host1x_job_cmd *cmd = &job->cmds[i];
 
-		op2 = lower_32_bits(addr);
-		op3 = upper_32_bits(addr);
+		if (cmd->is_wait) {
+			if (cmd->wait.relative)
+				threshold = job_syncpt_base + cmd->wait.threshold;
+			else
+				threshold = cmd->wait.threshold;
 
-		trace_write_gather(cdma, g->bo, g->offset, g->words);
+			submit_wait(cdma, cmd->wait.id, threshold, cmd->wait.next_class);
+		} else {
+			struct host1x_job_gather *g = &cmd->gather;
+
+			dma_addr_t addr = g->base + g->offset;
+			u32 op2, op3;
+
+			op2 = lower_32_bits(addr);
+			op3 = upper_32_bits(addr);
 
-		if (op3 != 0) {
+			trace_write_gather(cdma, g->bo, g->offset, g->words);
+
+			if (op3 != 0) {
 #if HOST1X_HW >= 6
-			u32 op1 = host1x_opcode_gather_wide(g->words);
-			u32 op4 = HOST1X_OPCODE_NOP;
+				u32 op1 = host1x_opcode_gather_wide(g->words);
+				u32 op4 = HOST1X_OPCODE_NOP;
 
-			host1x_cdma_push_wide(cdma, op1, op2, op3, op4);
+				host1x_cdma_push_wide(cdma, op1, op2, op3, op4);
 #else
-			dev_err(dev, "invalid gather for push buffer %pad\n",
-				&addr);
-			continue;
+				dev_err(dev, "invalid gather for push buffer %pad\n",
+					&addr);
+				continue;
 #endif
-		} else {
-			u32 op1 = host1x_opcode_gather(g->words);
+			} else {
+				u32 op1 = host1x_opcode_gather(g->words);
 
-			host1x_cdma_push(cdma, op1, op2);
+				host1x_cdma_push(cdma, op1, op2);
+			}
 		}
 	}
 }
@@ -126,7 +171,7 @@ static int channel_submit(struct host1x_job *job)
 	struct host1x *host = dev_get_drvdata(ch->dev->parent);
 
 	trace_host1x_channel_submit(dev_name(ch->dev),
-				    job->num_gathers, job->num_relocs,
+				    job->num_cmds, job->num_relocs,
 				    job->syncpt->id, job->syncpt_incrs);
 
 	/* before error checks, return current max */
@@ -181,7 +226,7 @@ static int channel_submit(struct host1x_job *job)
 				 host1x_opcode_setclass(job->class, 0, 0),
 				 HOST1X_OPCODE_NOP);
 
-	submit_gathers(job);
+	submit_gathers(job, syncval - user_syncpt_incrs);
 
 	/* end CDMA submit & stash pinned hMems into sync queue */
 	host1x_cdma_end(&ch->cdma, job);
diff --git a/drivers/gpu/host1x/hw/debug_hw.c b/drivers/gpu/host1x/hw/debug_hw.c
index ceb48229d14b..35952fd5597e 100644
--- a/drivers/gpu/host1x/hw/debug_hw.c
+++ b/drivers/gpu/host1x/hw/debug_hw.c
@@ -208,10 +208,15 @@ static void show_channel_gathers(struct output *o, struct host1x_cdma *cdma)
 				    job->first_get, job->timeout,
 				    job->num_slots, job->num_unpins);
 
-		for (i = 0; i < job->num_gathers; i++) {
-			struct host1x_job_gather *g = &job->gathers[i];
+		for (i = 0; i < job->num_cmds; i++) {
+			struct host1x_job_gather *g;
 			u32 *mapped;
 
+			if (job->cmds[i].is_wait)
+				continue;
+
+			g = &job->cmds[i].gather;
+
 			if (job->gather_copy_mapped)
 				mapped = (u32 *)job->gather_copy_mapped;
 			else
diff --git a/drivers/gpu/host1x/hw/hw_host1x02_uclass.h b/drivers/gpu/host1x/hw/hw_host1x02_uclass.h
index 4fc51f70496b..0a2ab8f1da6f 100644
--- a/drivers/gpu/host1x/hw/hw_host1x02_uclass.h
+++ b/drivers/gpu/host1x/hw/hw_host1x02_uclass.h
@@ -165,5 +165,17 @@ static inline u32 host1x_uclass_indoff_rwn_read_v(void)
 }
 #define HOST1X_UCLASS_INDOFF_INDROFFSET_F(v) \
 	host1x_uclass_indoff_indroffset_f(v)
+static inline u32 host1x_uclass_load_syncpt_payload_32_r(void)
+{
+	return 0x4e;
+}
+#define HOST1X_UCLASS_LOAD_SYNCPT_PAYLOAD_32 \
+	host1x_uclass_load_syncpt_payload_32_r()
+static inline u32 host1x_uclass_wait_syncpt_32_r(void)
+{
+	return 0x50;
+}
+#define HOST1X_UCLASS_WAIT_SYNCPT_32 \
+	host1x_uclass_wait_syncpt_32_r()
 
 #endif
diff --git a/drivers/gpu/host1x/hw/hw_host1x04_uclass.h b/drivers/gpu/host1x/hw/hw_host1x04_uclass.h
index 9e84a4adca9f..60c692b92955 100644
--- a/drivers/gpu/host1x/hw/hw_host1x04_uclass.h
+++ b/drivers/gpu/host1x/hw/hw_host1x04_uclass.h
@@ -165,5 +165,17 @@ static inline u32 host1x_uclass_indoff_rwn_read_v(void)
 }
 #define HOST1X_UCLASS_INDOFF_INDROFFSET_F(v) \
 	host1x_uclass_indoff_indroffset_f(v)
+static inline u32 host1x_uclass_load_syncpt_payload_32_r(void)
+{
+	return 0x4e;
+}
+#define HOST1X_UCLASS_LOAD_SYNCPT_PAYLOAD_32 \
+	host1x_uclass_load_syncpt_payload_32_r()
+static inline u32 host1x_uclass_wait_syncpt_32_r(void)
+{
+	return 0x50;
+}
+#define HOST1X_UCLASS_WAIT_SYNCPT_32 \
+	host1x_uclass_wait_syncpt_32_r()
 
 #endif
diff --git a/drivers/gpu/host1x/hw/hw_host1x05_uclass.h b/drivers/gpu/host1x/hw/hw_host1x05_uclass.h
index aee5a4e32877..2fcc9a2ad3ef 100644
--- a/drivers/gpu/host1x/hw/hw_host1x05_uclass.h
+++ b/drivers/gpu/host1x/hw/hw_host1x05_uclass.h
@@ -165,5 +165,17 @@ static inline u32 host1x_uclass_indoff_rwn_read_v(void)
 }
 #define HOST1X_UCLASS_INDOFF_INDROFFSET_F(v) \
 	host1x_uclass_indoff_indroffset_f(v)
+static inline u32 host1x_uclass_load_syncpt_payload_32_r(void)
+{
+	return 0x4e;
+}
+#define HOST1X_UCLASS_LOAD_SYNCPT_PAYLOAD_32 \
+	host1x_uclass_load_syncpt_payload_32_r()
+static inline u32 host1x_uclass_wait_syncpt_32_r(void)
+{
+	return 0x50;
+}
+#define HOST1X_UCLASS_WAIT_SYNCPT_32 \
+	host1x_uclass_wait_syncpt_32_r()
 
 #endif
diff --git a/drivers/gpu/host1x/hw/hw_host1x06_uclass.h b/drivers/gpu/host1x/hw/hw_host1x06_uclass.h
index c4bacdb7155f..5f831438d19b 100644
--- a/drivers/gpu/host1x/hw/hw_host1x06_uclass.h
+++ b/drivers/gpu/host1x/hw/hw_host1x06_uclass.h
@@ -165,5 +165,17 @@ static inline u32 host1x_uclass_indoff_rwn_read_v(void)
 }
 #define HOST1X_UCLASS_INDOFF_INDROFFSET_F(v) \
 	host1x_uclass_indoff_indroffset_f(v)
+static inline u32 host1x_uclass_load_syncpt_payload_32_r(void)
+{
+	return 0x4e;
+}
+#define HOST1X_UCLASS_LOAD_SYNCPT_PAYLOAD_32 \
+	host1x_uclass_load_syncpt_payload_32_r()
+static inline u32 host1x_uclass_wait_syncpt_32_r(void)
+{
+	return 0x50;
+}
+#define HOST1X_UCLASS_WAIT_SYNCPT_32 \
+	host1x_uclass_wait_syncpt_32_r()
 
 #endif
diff --git a/drivers/gpu/host1x/hw/hw_host1x07_uclass.h b/drivers/gpu/host1x/hw/hw_host1x07_uclass.h
index c74070f3f203..8cd2ef087d5d 100644
--- a/drivers/gpu/host1x/hw/hw_host1x07_uclass.h
+++ b/drivers/gpu/host1x/hw/hw_host1x07_uclass.h
@@ -165,5 +165,17 @@ static inline u32 host1x_uclass_indoff_rwn_read_v(void)
 }
 #define HOST1X_UCLASS_INDOFF_INDROFFSET_F(v) \
 	host1x_uclass_indoff_indroffset_f(v)
+static inline u32 host1x_uclass_load_syncpt_payload_32_r(void)
+{
+	return 0x4e;
+}
+#define HOST1X_UCLASS_LOAD_SYNCPT_PAYLOAD_32 \
+	host1x_uclass_load_syncpt_payload_32_r()
+static inline u32 host1x_uclass_wait_syncpt_32_r(void)
+{
+	return 0x50;
+}
+#define HOST1X_UCLASS_WAIT_SYNCPT_32 \
+	host1x_uclass_wait_syncpt_32_r()
 
 #endif
diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
index 09097e19c0d0..32619b73a2fc 100644
--- a/drivers/gpu/host1x/job.c
+++ b/drivers/gpu/host1x/job.c
@@ -38,7 +38,7 @@ struct host1x_job *host1x_job_alloc(struct host1x_channel *ch,
 	total = sizeof(struct host1x_job) +
 		(u64)num_relocs * sizeof(struct host1x_reloc) +
 		(u64)num_unpins * sizeof(struct host1x_job_unpin_data) +
-		(u64)num_cmdbufs * sizeof(struct host1x_job_gather) +
+		(u64)num_cmdbufs * sizeof(struct host1x_job_cmd) +
 		(u64)num_unpins * sizeof(dma_addr_t) +
 		(u64)num_unpins * sizeof(u32 *);
 	if (total > ULONG_MAX)
@@ -57,8 +57,8 @@ struct host1x_job *host1x_job_alloc(struct host1x_channel *ch,
 	mem += num_relocs * sizeof(struct host1x_reloc);
 	job->unpins = num_unpins ? mem : NULL;
 	mem += num_unpins * sizeof(struct host1x_job_unpin_data);
-	job->gathers = num_cmdbufs ? mem : NULL;
-	mem += num_cmdbufs * sizeof(struct host1x_job_gather);
+	job->cmds = num_cmdbufs ? mem : NULL;
+	mem += num_cmdbufs * sizeof(struct host1x_job_cmd);
 	job->addr_phys = num_unpins ? mem : NULL;
 
 	job->reloc_addr_phys = job->addr_phys;
@@ -101,22 +101,38 @@ EXPORT_SYMBOL(host1x_job_put);
 void host1x_job_add_gather(struct host1x_job *job, struct host1x_bo *bo,
 			   unsigned int words, unsigned int offset)
 {
-	struct host1x_job_gather *gather = &job->gathers[job->num_gathers];
+	struct host1x_job_gather *gather = &job->cmds[job->num_cmds].gather;
 
 	gather->words = words;
 	gather->bo = bo;
 	gather->offset = offset;
 
-	job->num_gathers++;
+	job->num_cmds++;
 }
 EXPORT_SYMBOL(host1x_job_add_gather);
 
+void host1x_job_add_wait(struct host1x_job *job, u32 id, u32 thresh,
+			 bool relative, u32 next_class)
+{
+	struct host1x_job_cmd *cmd = &job->cmds[job->num_cmds];
+
+	cmd->is_wait = true;
+	cmd->wait.id = id;
+	cmd->wait.threshold = thresh;
+	cmd->wait.next_class = next_class;
+	cmd->wait.relative = relative;
+
+	job->num_cmds++;
+}
+EXPORT_SYMBOL(host1x_job_add_wait);
+
 static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
 {
 	struct host1x_client *client = job->client;
 	struct device *dev = client->dev;
 	struct host1x_job_gather *g;
 	struct iommu_domain *domain;
+	struct sg_table *sgt;
 	unsigned int i;
 	int err;
 
@@ -126,7 +142,6 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
 	for (i = 0; i < job->num_relocs; i++) {
 		struct host1x_reloc *reloc = &job->relocs[i];
 		dma_addr_t phys_addr, *phys;
-		struct sg_table *sgt;
 
 		reloc->target.bo = host1x_bo_get(reloc->target.bo);
 		if (!reloc->target.bo) {
@@ -202,17 +217,20 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
 	if (IS_ENABLED(CONFIG_TEGRA_HOST1X_FIREWALL))
 		return 0;
 
-	for (i = 0; i < job->num_gathers; i++) {
+	for (i = 0; i < job->num_cmds; i++) {
 		size_t gather_size = 0;
 		struct scatterlist *sg;
-		struct sg_table *sgt;
 		dma_addr_t phys_addr;
 		unsigned long shift;
 		struct iova *alloc;
 		dma_addr_t *phys;
 		unsigned int j;
 
-		g = &job->gathers[i];
+		if (job->cmds[i].is_wait)
+			continue;
+
+		g = &job->cmds[i].gather;
+
 		g->bo = host1x_bo_get(g->bo);
 		if (!g->bo) {
 			err = -EINVAL;
@@ -545,8 +563,13 @@ static inline int copy_gathers(struct device *host, struct host1x_job *job,
 	fw.num_relocs = job->num_relocs;
 	fw.class = job->class;
 
-	for (i = 0; i < job->num_gathers; i++) {
-		struct host1x_job_gather *g = &job->gathers[i];
+	for (i = 0; i < job->num_cmds; i++) {
+		struct host1x_job_gather *g;
+
+		if (job->cmds[i].is_wait)
+			continue;
+
+		g = &job->cmds[i].gather;
 
 		size += g->words * sizeof(u32);
 	}
@@ -568,10 +591,14 @@ static inline int copy_gathers(struct device *host, struct host1x_job *job,
 
 	job->gather_copy_size = size;
 
-	for (i = 0; i < job->num_gathers; i++) {
-		struct host1x_job_gather *g = &job->gathers[i];
+	for (i = 0; i < job->num_cmds; i++) {
+		struct host1x_job_gather *g;
 		void *gather;
 
+		if (job->cmds[i].is_wait)
+			continue;
+		g = &job->cmds[i].gather;
+
 		/* Copy the gather */
 		gather = host1x_bo_mmap(g->bo);
 		memcpy(job->gather_copy_mapped + offset, gather + g->offset,
@@ -614,8 +641,12 @@ int host1x_job_pin(struct host1x_job *job, struct device *dev)
 	}
 
 	/* patch gathers */
-	for (i = 0; i < job->num_gathers; i++) {
-		struct host1x_job_gather *g = &job->gathers[i];
+	for (i = 0; i < job->num_cmds; i++) {
+		struct host1x_job_gather *g;
+
+		if (job->cmds[i].is_wait)
+			continue;
+		g = &job->cmds[i].gather;
 
 		/* process each gather mem only once */
 		if (g->handled)
@@ -625,10 +656,11 @@ int host1x_job_pin(struct host1x_job *job, struct device *dev)
 		if (!IS_ENABLED(CONFIG_TEGRA_HOST1X_FIREWALL))
 			g->base = job->gather_addr_phys[i];
 
-		for (j = i + 1; j < job->num_gathers; j++) {
-			if (job->gathers[j].bo == g->bo) {
-				job->gathers[j].handled = true;
-				job->gathers[j].base = g->base;
+		for (j = i + 1; j < job->num_cmds; j++) {
+			if (!job->cmds[j].is_wait &&
+			    job->cmds[j].gather.bo == g->bo) {
+				job->cmds[j].gather.handled = true;
+				job->cmds[j].gather.base = g->base;
 			}
 		}
 
diff --git a/drivers/gpu/host1x/job.h b/drivers/gpu/host1x/job.h
index 94bc2e4ae241..b4428c5495c9 100644
--- a/drivers/gpu/host1x/job.h
+++ b/drivers/gpu/host1x/job.h
@@ -18,6 +18,22 @@ struct host1x_job_gather {
 	bool handled;
 };
 
+struct host1x_job_wait {
+	u32 id;
+	u32 threshold;
+	u32 next_class;
+	bool relative;
+};
+
+struct host1x_job_cmd {
+	bool is_wait;
+
+	union {
+		struct host1x_job_gather gather;
+		struct host1x_job_wait wait;
+	};
+};
+
 struct host1x_job_unpin_data {
 	struct host1x_bo *bo;
 	struct sg_table *sgt;
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index 7eecb0aa2519..9b6784708f2e 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -219,8 +219,8 @@ struct host1x_job {
 	struct host1x_client *client;
 
 	/* Gathers and their memory */
-	struct host1x_job_gather *gathers;
-	unsigned int num_gathers;
+	struct host1x_job_cmd *cmds;
+	unsigned int num_cmds;
 
 	/* Array of handles to be pinned & unpinned */
 	struct host1x_reloc *relocs;
@@ -279,6 +279,8 @@ struct host1x_job *host1x_job_alloc(struct host1x_channel *ch,
 				    u32 num_cmdbufs, u32 num_relocs);
 void host1x_job_add_gather(struct host1x_job *job, struct host1x_bo *bo,
 			   unsigned int words, unsigned int offset);
+void host1x_job_add_wait(struct host1x_job *job, u32 id, u32 thresh,
+			 bool relative, u32 next_class);
 struct host1x_job *host1x_job_get(struct host1x_job *job);
 void host1x_job_put(struct host1x_job *job);
 int host1x_job_pin(struct host1x_job *job, struct device *dev);
-- 
2.30.1


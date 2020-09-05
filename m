Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1D3225E6F7
	for <lists+linux-tegra@lfdr.de>; Sat,  5 Sep 2020 12:36:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726582AbgIEKgL (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sat, 5 Sep 2020 06:36:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726591AbgIEKgD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 5 Sep 2020 06:36:03 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07D98C061247
        for <linux-tegra@vger.kernel.org>; Sat,  5 Sep 2020 03:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=GP8XULLqvQHBWLEsOEDRDZQ0///TIiYVbu3OBzkc7gU=; b=XO+uVIZjRU7bAEvrE2KqSzfzwn
        Z+1lOd932no5dyKzGFxWkxKI1gtKnJBbfkqs/xfTwUNY3A1uCxgeOfxmOf6C63i2hFd1gEfVyvcK+
        cD7kb+aKR/2SZYw7jzWprd2zpp/1RN1UyM69SCrytceTwX2Ey0a9h0DvNdJwscn2CM6KpvQIwZu60
        l7DWXE7O+e19SkigbznWykGMfWYq1MWKpMiih9f+olNdlcusNJqYZ1s7Pf5RZIaeecgkvhdCXawdv
        A413h1sjl5v+Zsa5wrmt4eavU+wBEyZSjgLSJP3ZfUz7Ur/xcLHIDbrxlxoZOPSWoEswQhDJbasmV
        8GMxiJHg==;
Received: from dsl-hkibng22-54faab-65.dhcp.inet.fi ([84.250.171.65] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <mperttunen@nvidia.com>)
        id 1kEVXy-0003SS-86; Sat, 05 Sep 2020 13:35:50 +0300
From:   Mikko Perttunen <mperttunen@nvidia.com>
To:     thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com,
        airlied@linux.ie, daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com,
        Mikko Perttunen <mperttunen@nvidia.com>
Subject: [RFC PATCH v2 12/17] gpu: host1x: Add support for syncpoint waits in CDMA pushbuffer
Date:   Sat,  5 Sep 2020 13:34:15 +0300
Message-Id: <20200905103420.3021852-13-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200905103420.3021852-1-mperttunen@nvidia.com>
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.250.171.65
X-SA-Exim-Mail-From: mperttunen@nvidia.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Sender: linux-tegra-owner@vger.kernel.org
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

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/host1x/hw/channel_hw.c | 51 +++++++++++++++--------
 drivers/gpu/host1x/hw/debug_hw.c   |  9 +++-
 drivers/gpu/host1x/job.c           | 67 +++++++++++++++++++++---------
 drivers/gpu/host1x/job.h           | 14 +++++++
 include/linux/host1x.h             |  5 ++-
 5 files changed, 105 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/host1x/hw/channel_hw.c b/drivers/gpu/host1x/hw/channel_hw.c
index 145746c6f6fb..57e99de528de 100644
--- a/drivers/gpu/host1x/hw/channel_hw.c
+++ b/drivers/gpu/host1x/hw/channel_hw.c
@@ -55,31 +55,46 @@ static void submit_gathers(struct host1x_job *job)
 #endif
 	unsigned int i;
 
-	for (i = 0; i < job->num_gathers; i++) {
-		struct host1x_job_gather *g = &job->gathers[i];
-		dma_addr_t addr = g->base + g->offset;
-		u32 op2, op3;
+	for (i = 0; i < job->num_cmds; i++) {
+		struct host1x_job_cmd *cmd = &job->cmds[i];
 
-		op2 = lower_32_bits(addr);
-		op3 = upper_32_bits(addr);
+		if (cmd->is_wait) {
+			/* TODO use modern wait */
+			host1x_cdma_push(cdma,
+				 host1x_opcode_setclass(HOST1X_CLASS_HOST1X,
+					host1x_uclass_wait_syncpt_r(), 1),
+				 host1x_class_host_wait_syncpt(cmd->wait.id,
+					cmd->wait.threshold));
+			host1x_cdma_push(
+				cdma, host1x_opcode_setclass(job->class, 0, 0),
+				HOST1X_OPCODE_NOP);
+		} else {
+			struct host1x_job_gather *g = &cmd->gather;
 
-		trace_write_gather(cdma, g->bo, g->offset, g->words);
+			dma_addr_t addr = g->base + g->offset;
+			u32 op2, op3;
 
-		if (op3 != 0) {
+			op2 = lower_32_bits(addr);
+			op3 = upper_32_bits(addr);
+
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
@@ -126,7 +141,7 @@ static int channel_submit(struct host1x_job *job)
 	struct host1x *host = dev_get_drvdata(ch->dev->parent);
 
 	trace_host1x_channel_submit(dev_name(ch->dev),
-				    job->num_gathers, job->num_relocs,
+				    job->num_cmds, job->num_relocs,
 				    job->syncpt->id, job->syncpt_incrs);
 
 	/* TODO this is racy */
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
diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
index acf322beb56c..ac4091596811 100644
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
@@ -101,22 +101,35 @@ EXPORT_SYMBOL(host1x_job_put);
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
 
+void host1x_job_add_wait(struct host1x_job *job, u32 id, u32 thresh)
+{
+	struct host1x_job_cmd *cmd = &job->cmds[job->num_cmds];
+
+	cmd->is_wait = true;
+	cmd->wait.id = id;
+	cmd->wait.threshold = thresh;
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
 
@@ -126,7 +139,6 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
 	for (i = 0; i < job->num_relocs; i++) {
 		struct host1x_reloc *reloc = &job->relocs[i];
 		dma_addr_t phys_addr, *phys;
-		struct sg_table *sgt;
 
 		reloc->target.bo = host1x_bo_get(reloc->target.bo);
 		if (!reloc->target.bo) {
@@ -204,17 +216,20 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
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
@@ -550,8 +565,13 @@ static inline int copy_gathers(struct device *host, struct host1x_job *job,
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
@@ -573,10 +593,14 @@ static inline int copy_gathers(struct device *host, struct host1x_job *job,
 
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
@@ -619,8 +643,12 @@ int host1x_job_pin(struct host1x_job *job, struct device *dev)
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
@@ -630,10 +658,11 @@ int host1x_job_pin(struct host1x_job *job, struct device *dev)
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
index 94bc2e4ae241..33adfaede842 100644
--- a/drivers/gpu/host1x/job.h
+++ b/drivers/gpu/host1x/job.h
@@ -18,6 +18,20 @@ struct host1x_job_gather {
 	bool handled;
 };
 
+struct host1x_job_wait {
+	u32 id;
+	u32 threshold;
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
index cabc5bef5bae..78ea56230b97 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -211,8 +211,8 @@ struct host1x_job {
 	struct host1x_client *client;
 
 	/* Gathers and their memory */
-	struct host1x_job_gather *gathers;
-	unsigned int num_gathers;
+	struct host1x_job_cmd *cmds;
+	unsigned int num_cmds;
 
 	/* Array of handles to be pinned & unpinned */
 	struct host1x_reloc *relocs;
@@ -271,6 +271,7 @@ struct host1x_job *host1x_job_alloc(struct host1x_channel *ch,
 				    u32 num_cmdbufs, u32 num_relocs);
 void host1x_job_add_gather(struct host1x_job *job, struct host1x_bo *bo,
 			   unsigned int words, unsigned int offset);
+void host1x_job_add_wait(struct host1x_job *job, u32 id, u32 thresh);
 struct host1x_job *host1x_job_get(struct host1x_job *job);
 void host1x_job_put(struct host1x_job *job);
 int host1x_job_pin(struct host1x_job *job, struct device *dev);
-- 
2.28.0


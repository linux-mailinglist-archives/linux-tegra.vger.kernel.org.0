Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A552F28659C
	for <lists+linux-tegra@lfdr.de>; Wed,  7 Oct 2020 19:17:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728105AbgJGRR1 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 7 Oct 2020 13:17:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727824AbgJGRR1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 7 Oct 2020 13:17:27 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09168C0613D3
        for <linux-tegra@vger.kernel.org>; Wed,  7 Oct 2020 10:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=M5G/e3EYtEp9sbnWHOeM/vaSlgfSX4UwozIU6KeY0Jk=; b=m47qpYZmRkYmCh4TVCIQa7V+tl
        QfdUOYDFokn56xzxzn0P6cGAzuD7bUyrTDJLh7bwF2j+iRpc5pOWO5YqFxYuxccjenU6LC+C/cpgW
        9SIQTjFKQFlqBHZeh0Yaxb3twy1+0ACJv5M6WQCPV5epLMJPW6jMwUr/p3ibBT/ZAy2Iy88H8oGMt
        ifARNYHunbH7gZjD3o3Fr6/NHUI/BOLEAbqiVmDf4XwvHZVBv0MvZP9TYcfeoUs+CErJHJ1FXjo/j
        ViieEnKN+RPdEY/f+5fvMu3XHJEmpxy+5MuhgepNxVfDY5M4ACvfUiv3ZX4K5912uqbNCmbUTtng2
        NZdXewlA==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <mperttunen@nvidia.com>)
        id 1kQD40-0006P9-D5; Wed, 07 Oct 2020 20:17:16 +0300
From:   Mikko Perttunen <mperttunen@nvidia.com>
To:     thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com,
        airlied@linux.ie, daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com,
        Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH v3 10/20] gpu: host1x: Add no-recovery mode
Date:   Wed,  7 Oct 2020 20:12:28 +0300
Message-Id: <20201007171238.1795964-11-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201007171238.1795964-1-mperttunen@nvidia.com>
References: <20201007171238.1795964-1-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: mperttunen@nvidia.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add a new property for jobs to enable or disable recovery i.e.
CPU increments of syncpoints to max value on job timeout. This
allows for a more solid model for hanged jobs, where userspace
doesn't need to guess if a syncpoint increment happened because
the job completed, or because job timeout was triggered.

On job timeout, we stop the channel, NOP all future jobs on the
channel using the same syncpoint, mark the syncpoint as locked
and resume the channel from the next job, if any.

The future jobs are NOPed, since because we don't do the CPU
increments, the value of the syncpoint is no longer synchronized,
and any waiters would become confused if a future job incremented
the syncpoint. The syncpoint is marked locked to ensure that any
future jobs cannot increment the syncpoint either, until the
application has recognized the situation and reallocated the
syncpoint.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
v3:
* Move 'locked' check inside CDMA lock to prevent race
* Add clarifying comment to NOP-patching code
---
 drivers/gpu/drm/tegra/drm.c        |  1 +
 drivers/gpu/host1x/cdma.c          | 58 ++++++++++++++++++++++++++----
 drivers/gpu/host1x/hw/channel_hw.c |  2 +-
 drivers/gpu/host1x/job.c           |  4 +++
 drivers/gpu/host1x/syncpt.c        |  2 ++
 drivers/gpu/host1x/syncpt.h        | 12 +++++++
 include/linux/host1x.h             |  9 +++++
 7 files changed, 81 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index ceea9db341f0..7437c67924aa 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -197,6 +197,7 @@ int tegra_drm_submit(struct tegra_drm_context *context,
 	job->client = client;
 	job->class = client->class;
 	job->serialize = true;
+	job->syncpt_recovery = true;
 
 	/*
 	 * Track referenced BOs so that they can be unreferenced after the
diff --git a/drivers/gpu/host1x/cdma.c b/drivers/gpu/host1x/cdma.c
index 6e6ca774f68d..bd151c3a2a5f 100644
--- a/drivers/gpu/host1x/cdma.c
+++ b/drivers/gpu/host1x/cdma.c
@@ -312,10 +312,6 @@ static void update_cdma_locked(struct host1x_cdma *cdma)
 	bool signal = false;
 	struct host1x_job *job, *n;
 
-	/* If CDMA is stopped, queue is cleared and we can return */
-	if (!cdma->running)
-		return;
-
 	/*
 	 * Walk the sync queue, reading the sync point registers as necessary,
 	 * to consume as many sync queue entries as possible without blocking
@@ -324,7 +320,8 @@ static void update_cdma_locked(struct host1x_cdma *cdma)
 		struct host1x_syncpt *sp = job->syncpt;
 
 		/* Check whether this syncpt has completed, and bail if not */
-		if (!host1x_syncpt_is_expired(sp, job->syncpt_end)) {
+		if (!host1x_syncpt_is_expired(sp, job->syncpt_end) &&
+		    !job->cancelled) {
 			/* Start timer on next pending syncpt */
 			if (job->timeout)
 				cdma_start_timer_locked(cdma, job);
@@ -413,8 +410,11 @@ void host1x_cdma_update_sync_queue(struct host1x_cdma *cdma,
 	else
 		restart_addr = cdma->last_pos;
 
+	if (!job)
+		goto resume;
+
 	/* do CPU increments for the remaining syncpts */
-	if (job) {
+	if (job->syncpt_recovery) {
 		dev_dbg(dev, "%s: perform CPU incr on pending buffers\n",
 			__func__);
 
@@ -433,8 +433,44 @@ void host1x_cdma_update_sync_queue(struct host1x_cdma *cdma,
 
 		dev_dbg(dev, "%s: finished sync_queue modification\n",
 			__func__);
+	} else {
+		struct host1x_job *failed_job = job;
+
+		host1x_job_dump(dev, job);
+
+		host1x_syncpt_set_locked(job->syncpt);
+		failed_job->cancelled = true;
+
+		list_for_each_entry_continue(job, &cdma->sync_queue, list) {
+			unsigned int i;
+
+			if (job->syncpt != failed_job->syncpt)
+				continue;
+
+			for (i = 0; i < job->num_slots; i++) {
+				unsigned int slot = (job->first_get/8 + i) %
+						    HOST1X_PUSHBUFFER_SLOTS;
+				u32 *mapped = cdma->push_buffer.mapped;
+
+				/*
+				 * Overwrite opcodes with 0 word writes to
+				 * to offset 0xbad. This does nothing but
+				 * has a easily detected signature in debug
+				 * traces.
+				 */
+				mapped[2*slot+0] = 0x1bad0000;
+				mapped[2*slot+1] = 0x1bad0000;
+			}
+
+			job->cancelled = true;
+		}
+
+		wmb();
+
+		update_cdma_locked(cdma);
 	}
 
+resume:
 	/* roll back DMAGET and start up channel again */
 	host1x_hw_cdma_resume(host1x, cdma, restart_addr);
 }
@@ -490,6 +526,16 @@ int host1x_cdma_begin(struct host1x_cdma *cdma, struct host1x_job *job)
 
 	mutex_lock(&cdma->lock);
 
+	/*
+	 * Check if syncpoint was locked due to previous job timeout.
+	 * This needs to be done within the cdma lock to avoid a race
+	 * with the timeout handler.
+	 */
+	if (job->syncpt->locked) {
+		mutex_unlock(&cdma->lock);
+		return -EPERM;
+	}
+
 	if (job->timeout) {
 		/* init state on first submit with timeout value */
 		if (!cdma->timeout.initialized) {
diff --git a/drivers/gpu/host1x/hw/channel_hw.c b/drivers/gpu/host1x/hw/channel_hw.c
index d4c28faf27d1..bf21512e5078 100644
--- a/drivers/gpu/host1x/hw/channel_hw.c
+++ b/drivers/gpu/host1x/hw/channel_hw.c
@@ -191,7 +191,7 @@ static int channel_submit(struct host1x_job *job)
 	/* schedule a submit complete interrupt */
 	err = host1x_intr_add_action(host, sp, syncval,
 				     HOST1X_INTR_ACTION_SUBMIT_COMPLETE, ch,
-				     completed_waiter, NULL);
+				     completed_waiter, &job->waiter);
 	completed_waiter = NULL;
 	WARN(err, "Failed to set submit complete interrupt");
 
diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
index d8345d3bf0b3..e4f16fc899b0 100644
--- a/drivers/gpu/host1x/job.c
+++ b/drivers/gpu/host1x/job.c
@@ -79,6 +79,10 @@ static void job_free(struct kref *ref)
 {
 	struct host1x_job *job = container_of(ref, struct host1x_job, ref);
 
+	if (job->waiter)
+		host1x_intr_put_ref(job->syncpt->host, job->syncpt->id,
+				    job->waiter);
+
 	if (job->syncpt)
 		host1x_syncpt_put(job->syncpt);
 
diff --git a/drivers/gpu/host1x/syncpt.c b/drivers/gpu/host1x/syncpt.c
index c7b910e413d8..8d658e5f7db2 100644
--- a/drivers/gpu/host1x/syncpt.c
+++ b/drivers/gpu/host1x/syncpt.c
@@ -385,6 +385,8 @@ static void syncpt_release(struct kref *ref)
 {
 	struct host1x_syncpt *sp = container_of(ref, struct host1x_syncpt, ref);
 
+	sp->locked = false;
+
 	mutex_lock(&sp->host->syncpt_mutex);
 
 	host1x_syncpt_base_free(sp->base);
diff --git a/drivers/gpu/host1x/syncpt.h b/drivers/gpu/host1x/syncpt.h
index a6766f8d55ee..93e894677d89 100644
--- a/drivers/gpu/host1x/syncpt.h
+++ b/drivers/gpu/host1x/syncpt.h
@@ -40,6 +40,13 @@ struct host1x_syncpt {
 
 	/* interrupt data */
 	struct host1x_syncpt_intr intr;
+
+	/* 
+	 * If a submission incrementing this syncpoint fails, lock it so that
+	 * further submission cannot be made until application has handled the
+	 * failure.
+	 */
+	bool locked;
 };
 
 /* Initialize sync point array  */
@@ -115,4 +122,9 @@ static inline int host1x_syncpt_is_valid(struct host1x_syncpt *sp)
 	return sp->id < host1x_syncpt_nb_pts(sp->host);
 }
 
+static inline void host1x_syncpt_set_locked(struct host1x_syncpt *sp)
+{
+	sp->locked = true;
+}
+
 #endif
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index bcfb1cc9a1c1..fb62cc8b77dd 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -233,9 +233,15 @@ struct host1x_job {
 	u32 syncpt_incrs;
 	u32 syncpt_end;
 
+	/* Completion waiter ref */
+	void *waiter;
+
 	/* Maximum time to wait for this job */
 	unsigned int timeout;
 
+	/* Job has timed out and should be released */
+	bool cancelled;
+
 	/* Index and number of slots used in the push buffer */
 	unsigned int first_get;
 	unsigned int num_slots;
@@ -256,6 +262,9 @@ struct host1x_job {
 
 	/* Add a channel wait for previous ops to complete */
 	bool serialize;
+
+	/* Fast-forward syncpoint increments on job timeout */
+	bool syncpt_recovery;
 };
 
 struct host1x_job *host1x_job_alloc(struct host1x_channel *ch,
-- 
2.28.0


Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D7DB1E0146
	for <lists+linux-tegra@lfdr.de>; Sun, 24 May 2020 19:52:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387899AbgEXRwr (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 24 May 2020 13:52:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387656AbgEXRwr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 24 May 2020 13:52:47 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE3D7C061A0E
        for <linux-tegra@vger.kernel.org>; Sun, 24 May 2020 10:52:46 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id o14so18455284ljp.4
        for <linux-tegra@vger.kernel.org>; Sun, 24 May 2020 10:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZqX/ziB/3PC8jQi/MNjK/OF3UvmP/IxboFt/kpaG6UI=;
        b=jNSTgmjo7JlEJiRl4entQGAY/9K5w//iPKe7T/dmGV9JEa8Tnfk9pxlc3z1q72l2UI
         1aHWwA1qy7qFQBdXxPMlpvP4udhnvZ0nZvJBX7l6seLztMirVgP/FH0vxQGlGeV7+E9h
         dMcNpM+7nks/gVavzNJXv67F7mGHvyN3JT3TmU1VymyNvblKsCs9XeArZU6UCV8w/Hvu
         s5rQ74eHYc65EWgTmjENLjitWGq/xPu2HFbsy8Y8fGze3Tj7SlatqvTbVRjURaQj+Upy
         NxJoIPs5jlb9J7Sopemmx4UFBa0jCUskrdLfoWqjaWVK8J8TojIxXMqMqHftDrX9jdji
         H26Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZqX/ziB/3PC8jQi/MNjK/OF3UvmP/IxboFt/kpaG6UI=;
        b=ByVrm73ubTj/2BFkrXPF3ystiNoqV9oKkRm1VLRlR05xsGW4tXnjP4dnS5DfsXACsl
         P1fJDpRhopMbVkHwIsoenyDWCGRGXGJT3i2hwt3Gc8d11p/Clf+I7EgPkyxeUdymwXZi
         bhjI4JBwJcvHUGj6aZA/GQ7JQ7JYJBZBn/kCfyHHB4EqZySRozt+LhsGwrL50AGamn7p
         t+1eo+1UB1gg6mEyJBwGW8abrOu+AHjkPSaFM4fvNtR4GL7zm3TLLGqlYqrHiBdQUNsu
         tP7atzjI8xfwWD+77hPIxOUw0v0ev+llo1NVcTT8xYMyetfmiPEvm4Bd+DB08U4uT+Ci
         9rSg==
X-Gm-Message-State: AOAM531W5doQBdNneosqDrwKGWFvxqUBQUe/QgNm/yqW3AYBO2+UnCoG
        jXYgg94ZNj8iu8IEy26SwGU=
X-Google-Smtp-Source: ABdhPJwGLV7Yi1e8Sv66wz7A1qTYC1R8o08w7VEY7vL/P7EyDKWAgu+eTDBV8ZV9Plp7JJ7w3YhdPA==
X-Received: by 2002:a2e:958b:: with SMTP id w11mr12732072ljh.262.1590342765306;
        Sun, 24 May 2020 10:52:45 -0700 (PDT)
Received: from localhost.localdomain (ppp91-76-17-204.pppoe.mtu-net.ru. [91.76.17.204])
        by smtp.gmail.com with ESMTPSA id 130sm4045350lfl.37.2020.05.24.10.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2020 10:52:44 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH v1 1/4] gpu: host1x: Optimize BOs usage when firewall is enabled
Date:   Sun, 24 May 2020 20:50:57 +0300
Message-Id: <20200524175100.9334-2-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200524175100.9334-1-digetx@gmail.com>
References: <20200524175100.9334-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

We don't need to hold and pin original BOs of the gathers in a case of
enabled firewall because in this case gather's content is copied and the
copy is used by the executed job.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/host1x/job.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
index a10643aa89aa..a954bd41aa79 100644
--- a/drivers/gpu/host1x/job.c
+++ b/drivers/gpu/host1x/job.c
@@ -27,10 +27,13 @@ struct host1x_job *host1x_job_alloc(struct host1x_channel *ch,
 				    u32 num_cmdbufs, u32 num_relocs)
 {
 	struct host1x_job *job = NULL;
-	unsigned int num_unpins = num_cmdbufs + num_relocs;
+	unsigned int num_unpins = num_relocs;
 	u64 total;
 	void *mem;
 
+	if (!IS_ENABLED(CONFIG_TEGRA_HOST1X_FIREWALL))
+		num_unpins += num_cmdbufs;
+
 	/* Check that we're not going to overflow */
 	total = sizeof(struct host1x_job) +
 		(u64)num_relocs * sizeof(struct host1x_reloc) +
@@ -183,6 +186,13 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
 		job->num_unpins++;
 	}
 
+	/*
+	 * We will copy gathers BO content later, so there is no need to
+	 * hold and pin them.
+	 */
+	if (IS_ENABLED(CONFIG_TEGRA_HOST1X_FIREWALL))
+		return 0;
+
 	for (i = 0; i < job->num_gathers; i++) {
 		struct host1x_job_gather *g = &job->gathers[i];
 		size_t gather_size = 0;
@@ -216,7 +226,7 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
 			goto unpin;
 		}
 
-		if (!IS_ENABLED(CONFIG_TEGRA_HOST1X_FIREWALL) && host->domain) {
+		if (host->domain) {
 			for_each_sg(sgt->sgl, sg, sgt->nents, j)
 				gather_size += sg->length;
 			gather_size = iova_align(&host->iova, gather_size);
-- 
2.26.0


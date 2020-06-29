Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 450FD20CC14
	for <lists+linux-tegra@lfdr.de>; Mon, 29 Jun 2020 05:18:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726010AbgF2DS5 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 28 Jun 2020 23:18:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725976AbgF2DS4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 28 Jun 2020 23:18:56 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AC81C03E979
        for <linux-tegra@vger.kernel.org>; Sun, 28 Jun 2020 20:18:56 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id d21so8230631lfb.6
        for <linux-tegra@vger.kernel.org>; Sun, 28 Jun 2020 20:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZqX/ziB/3PC8jQi/MNjK/OF3UvmP/IxboFt/kpaG6UI=;
        b=C3CLAnY+ijK+28R1W4aD4su9eW20nda3aXUS0bXEU/A5x8k44CPpWCMbh8DZ5DfYxR
         DP+IryDAr8W7plPjMA9y56zOwQbEdz5GgLdHHFU9dynoQxNkBnuGNoFmGB8qRDay8xED
         EtdZJpOT8EQnBsrRHjrj6y6ccAWiSMN3raiUQRapljYhciukD63uys3QJbRiUfBFqh+/
         9DNXMSJvdXBy5s9KFK7dWyBbL7jvt1mavps1p2oMraiPuIuTNmazLXo+6zZxMib2ksAe
         76n0SKyqhnNcX1cNZAmyIogP76CjyB6fLi1/T9mGxLhSKPOWExyd41gY8yKvbHZuASak
         q0ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZqX/ziB/3PC8jQi/MNjK/OF3UvmP/IxboFt/kpaG6UI=;
        b=I/5YFHOSihrjoGWFCKzY9kZqwWPzi/V38hW4dqyvVgKt4AGOiM+ujnIUGFbnAzvwrw
         uclvpuYMoQD/Q1S6ubMjZjFwOA6tPU5+hQG7/rVpTrV8ZTN5ZlndvYi+ido6ZjyVkTap
         DGOMVmsdjJx8pCaFwBp/KDeqdgHJiJ64UXz6147y2+W29PVEGERWdh+inofOPXK+Vy7L
         QU0trruLEGtJbxxVz2Leygkld002j0qbiw+XdD5tEEVi/uPxYNein5ItfGfI7BQqCclG
         H643rGBLIxIflOPjrH/XZPDwzNJEp9DeQ8eHUKoyRIxZz2kmf9QSKxDmmRO6WeiB2aEr
         5e8A==
X-Gm-Message-State: AOAM530xQBbE9jFDK0kyvzV2pb98E1sCGnkk89AUCTXH3HdeyavzBQUX
        QXWzpmCzYGkjoLqeJQ5tcxk=
X-Google-Smtp-Source: ABdhPJwL8kdj2UBzyr36CG0IGwXDZbazR20iwjZcmzVY4OcOr8SPrDKDMCFosjThrJ4jcE1cuhzpKw==
X-Received: by 2002:ac2:5a5e:: with SMTP id r30mr8052760lfn.30.1593400734694;
        Sun, 28 Jun 2020 20:18:54 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru. [79.139.237.54])
        by smtp.gmail.com with ESMTPSA id m1sm2383295ljg.60.2020.06.28.20.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2020 20:18:54 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mikko Perttunen <cyndis@kapsi.fi>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH v2 3/6] gpu: host1x: Optimize BOs usage when firewall is enabled
Date:   Mon, 29 Jun 2020 06:18:39 +0300
Message-Id: <20200629031842.32463-4-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200629031842.32463-1-digetx@gmail.com>
References: <20200629031842.32463-1-digetx@gmail.com>
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


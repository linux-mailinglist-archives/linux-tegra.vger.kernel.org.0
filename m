Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E291D16B61E
	for <lists+linux-tegra@lfdr.de>; Tue, 25 Feb 2020 00:59:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728320AbgBXX7n (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 24 Feb 2020 18:59:43 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:36428 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728172AbgBXX7m (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 24 Feb 2020 18:59:42 -0500
Received: by mail-lj1-f196.google.com with SMTP id r19so12060002ljg.3
        for <linux-tegra@vger.kernel.org>; Mon, 24 Feb 2020 15:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M6yK3QEGQs7pgYu1gs0wEshn61vM64Z12X6vhp8u+Aw=;
        b=LndlkL06emp/5I6W7PljGFEvp5eYNwB2XpnqivSoTKIu/Qkgg3higmUp5+N8Jm1mNW
         93BPD+JC6wypXDBiwEl4sP8Ua2eVOWWjRYYYsIvUsDZfhg0b6QUbePO9eNr/5/qDIU2w
         LlLI7n2PRtLZ0ijsqrl7EgZir9Rzhh7sU4r+q7TffjY3qe4ewtsszr2y81L1IgLXyVjM
         w7BXEiHd14iRb0RxLyGopSJgRmy7OBH9rAvrCPP1egT5Kne0awDBRbZutXOhpR04Lh0H
         SQkDS1ptnROvoGHlO1zAish7VXp7gJIdATqKNORFijCtk7hAkxhdAr1andvRMevXDkAg
         L/6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M6yK3QEGQs7pgYu1gs0wEshn61vM64Z12X6vhp8u+Aw=;
        b=cJygrhDFqwV1p9pLNb2Gzn7vCQF0D63T/lZTQSxFv5VGq9WMAycM1IayspHJ7U4kXw
         89/7GeCDXS08dfSGob8fFswQnpWWq1Y7MHqTXmSG0SiKcXS88Gu7djuCDv91QL8SOmf9
         ti2wC+wnTE+mLLPhK/oWLBnP3y0SlxKc/mO+dlb0wJYoG738Rrd5wyoDerrNDG1/Z1VM
         n0tIfqA7Zq/w3IoxhXjymGhYmc1bC/kharPNg0De9UQM4Lso0dGeaDHEYCS6IJBhANIS
         v1KpplWQ0epKbNhzld1v56GJt5lj64DOu55po8zzs+yENUZBXcAN4Yz+mEFVOwZaj57R
         k56g==
X-Gm-Message-State: APjAAAUwXZfYxdk+Q3He6NVfMw1d/NnDmZGk3693IrQ3Y5WkmYGjOoDn
        pcTSmtK1KtNCI4T6WGaRvTfWMwhD
X-Google-Smtp-Source: APXvYqxHgYgqlS/nrwwb9MydedVh1RGL8q5NsiwvsiPXx3/xKx+jWB2e7FbfDA9OPgWGCbyuW0wfIg==
X-Received: by 2002:a05:651c:2c7:: with SMTP id f7mr30918201ljo.125.1582588780853;
        Mon, 24 Feb 2020 15:59:40 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.gmail.com with ESMTPSA id d26sm6323774lfa.44.2020.02.24.15.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2020 15:59:40 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-tegra@vger.kernel.org
Subject: [PATCH v1 3/3] memory: tegra: Correct debugfs clk rate-range on Tegra124
Date:   Tue, 25 Feb 2020 02:58:36 +0300
Message-Id: <20200224235836.30694-3-digetx@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200224235836.30694-1-digetx@gmail.com>
References: <20200224235836.30694-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Correctly set clk rate-range if number of available timings is zero.
This fixes noisy "invalid range [4294967295, 0]" error messages during
boot.

Fixes: 6b9acd935546 ("memory: tegra: Refashion EMC debugfs interface on Tegra124")
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/tegra124-emc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/memory/tegra/tegra124-emc.c b/drivers/memory/tegra/tegra124-emc.c
index 284b8aa8418c..ac9ca09c7b0d 100644
--- a/drivers/memory/tegra/tegra124-emc.c
+++ b/drivers/memory/tegra/tegra124-emc.c
@@ -1158,6 +1158,11 @@ static void emc_debugfs_init(struct device *dev, struct tegra_emc *emc)
 			emc->debugfs.max_rate = emc->timings[i].rate;
 	}
 
+	if (!emc->num_timings) {
+		emc->debugfs.min_rate = clk_get_rate(emc->clk);
+		emc->debugfs.max_rate = emc->debugfs.min_rate;
+	}
+
 	err = clk_set_rate_range(emc->clk, emc->debugfs.min_rate,
 				 emc->debugfs.max_rate);
 	if (err < 0) {
-- 
2.24.0


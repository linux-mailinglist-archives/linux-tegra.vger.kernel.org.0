Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FC0F128DB4
	for <lists+linux-tegra@lfdr.de>; Sun, 22 Dec 2019 12:40:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbfLVLkk (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 22 Dec 2019 06:40:40 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:36530 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726189AbfLVLkk (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 22 Dec 2019 06:40:40 -0500
Received: by mail-wm1-f66.google.com with SMTP id p17so13518668wma.1
        for <linux-tegra@vger.kernel.org>; Sun, 22 Dec 2019 03:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=B2fq77/Zf47kZBc4NWGAfPKiLDievQg6BVoMwAARk8I=;
        b=gABBjfms2Po4+Y99OP72OFV6OHiSgmGoREoxuVzd43uxpWiBZTogKAeevbPjF7Ic6S
         B58Y9hhs3imPKCjlKL+2X5qA+2SW0jlwCM0LdNSszu0P88vL1V2YGnn5LjvL7oguLH+9
         RZtY4gWbept6wzgviRR5Csc050lCKcWBWqi+hS4naJclsPNTMBnDI7FQJgRaT3Y0WtS1
         RUqllwLOEoPFUEI9FP89z9SSmlSV7JnmNHLxsvkgSkPnYKgKVgY59z4cUm0vwq5w+Kuv
         XWhGmNQuwXexM28I08buDuFXpJVNTEnhwfBWS7bH6bUjoi63mPN0rR3yx8Bdes/1TD44
         azhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B2fq77/Zf47kZBc4NWGAfPKiLDievQg6BVoMwAARk8I=;
        b=YZmz3cHVF+/B466Rc+6ik921h9mPDLqFwTP0n5JNIspIoS2/TElslySXANKEbKfK+F
         ti02mzKX3fD76UHKls5F7UhF/Mg54GrY4dAHit33fgEf+Ir6b11bofVC+kq/efAihmRT
         pk9SQ6X3XH2AArHIszCAIxxWo64ARRcgnCc1wEcNBijGDD70LV15znUDGlbeOtrKPlez
         Wj9XRfuvU4Kj9oGK+FE8mVySm+9TUoaDoprJbi9M7XU3CzkD355K0kw6jSAbViaGEaKn
         WdcDQJuhJNXCjK9yvQovY/JBY3ul7WipucjfEUAEWJbkAi92CYXNyYan3UGsLvUM8LIq
         HP5w==
X-Gm-Message-State: APjAAAVChzZqkSKsEHYfS9TuM0t1Lc+cfW8o7FkyL3icyzF513mU9Twz
        0y8ew8AH+nt0z87WvDvE8JOa8ffi
X-Google-Smtp-Source: APXvYqwDim6Ty1v1AYX8abVCfRD4x6GPuGbhNOkxVGN15qWv04mBJaka2im1xCd9ED9TpjmqwesTWQ==
X-Received: by 2002:a05:600c:218b:: with SMTP id e11mr24712406wme.121.1577014837570;
        Sun, 22 Dec 2019 03:40:37 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
        by smtp.gmail.com with ESMTPSA id x16sm16483875wmk.35.2019.12.22.03.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2019 03:40:36 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH 2/2] memory: tegra: Implement EMC debugfs interface on Tegra30
Date:   Sun, 22 Dec 2019 12:40:33 +0100
Message-Id: <20191222114033.1469622-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191222114033.1469622-1-thierry.reding@gmail.com>
References: <20191222114033.1469622-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

A common debugfs interface is already available on Tegra20, Tegra124,
Tegra186 and Tegra194. Implement the same interface on Tegra30 to enable
testing of the EMC frequency scaling code using a unified interface.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/memory/tegra/tegra30-emc.c | 173 +++++++++++++++++++++++++++++
 1 file changed, 173 insertions(+)

diff --git a/drivers/memory/tegra/tegra30-emc.c b/drivers/memory/tegra/tegra30-emc.c
index 0b6a5e451ea3..d61cb74cb52b 100644
--- a/drivers/memory/tegra/tegra30-emc.c
+++ b/drivers/memory/tegra/tegra30-emc.c
@@ -12,6 +12,7 @@
 #include <linux/clk.h>
 #include <linux/clk/tegra.h>
 #include <linux/completion.h>
+#include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/interrupt.h>
@@ -347,6 +348,12 @@ struct tegra_emc {
 	bool dll_on : 1;
 	bool prepared : 1;
 	bool bad_state : 1;
+
+	struct {
+		struct dentry *root;
+		unsigned long min_rate;
+		unsigned long max_rate;
+	} debugfs;
 };
 
 static irqreturn_t tegra_emc_isr(int irq, void *data)
@@ -1083,6 +1090,171 @@ static long emc_round_rate(unsigned long rate,
 	return timing->rate;
 }
 
+/*
+ * debugfs interface
+ *
+ * The memory controller driver exposes some files in debugfs that can be used
+ * to control the EMC frequency. The top-level directory can be found here:
+ *
+ *   /sys/kernel/debug/emc
+ *
+ * It contains the following files:
+ *
+ *   - available_rates: This file contains a list of valid, space-separated
+ *     EMC frequencies.
+ *
+ *   - min_rate: Writing a value to this file sets the given frequency as the
+ *       floor of the permitted range. If this is higher than the currently
+ *       configured EMC frequency, this will cause the frequency to be
+ *       increased so that it stays within the valid range.
+ *
+ *   - max_rate: Similarily to the min_rate file, writing a value to this file
+ *       sets the given frequency as the ceiling of the permitted range. If
+ *       the value is lower than the currently configured EMC frequency, this
+ *       will cause the frequency to be decreased so that it stays within the
+ *       valid range.
+ */
+
+static bool tegra_emc_validate_rate(struct tegra_emc *emc, unsigned long rate)
+{
+	unsigned int i;
+
+	for (i = 0; i < emc->num_timings; i++)
+		if (rate == emc->timings[i].rate)
+			return true;
+
+	return false;
+}
+
+static int tegra_emc_debug_available_rates_show(struct seq_file *s, void *data)
+{
+	struct tegra_emc *emc = s->private;
+	const char *prefix = "";
+	unsigned int i;
+
+	for (i = 0; i < emc->num_timings; i++) {
+		seq_printf(s, "%s%lu", prefix, emc->timings[i].rate);
+		prefix = " ";
+	}
+
+	seq_puts(s, "\n");
+
+	return 0;
+}
+
+static int tegra_emc_debug_available_rates_open(struct inode *inode,
+						struct file *file)
+{
+	return single_open(file, tegra_emc_debug_available_rates_show,
+			   inode->i_private);
+}
+
+static const struct file_operations tegra_emc_debug_available_rates_fops = {
+	.open = tegra_emc_debug_available_rates_open,
+	.read = seq_read,
+	.llseek = seq_lseek,
+	.release = single_release,
+};
+
+static int tegra_emc_debug_min_rate_get(void *data, u64 *rate)
+{
+	struct tegra_emc *emc = data;
+
+	*rate = emc->debugfs.min_rate;
+
+	return 0;
+}
+
+static int tegra_emc_debug_min_rate_set(void *data, u64 rate)
+{
+	struct tegra_emc *emc = data;
+	int err;
+
+	if (!tegra_emc_validate_rate(emc, rate))
+		return -EINVAL;
+
+	err = clk_set_min_rate(emc->clk, rate);
+	if (err < 0)
+		return err;
+
+	emc->debugfs.min_rate = rate;
+
+	return 0;
+}
+
+DEFINE_SIMPLE_ATTRIBUTE(tegra_emc_debug_min_rate_fops,
+			tegra_emc_debug_min_rate_get,
+			tegra_emc_debug_min_rate_set, "%llu\n");
+
+static int tegra_emc_debug_max_rate_get(void *data, u64 *rate)
+{
+	struct tegra_emc *emc = data;
+
+	*rate = emc->debugfs.max_rate;
+
+	return 0;
+}
+
+static int tegra_emc_debug_max_rate_set(void *data, u64 rate)
+{
+	struct tegra_emc *emc = data;
+	int err;
+
+	if (!tegra_emc_validate_rate(emc, rate))
+		return -EINVAL;
+
+	err = clk_set_max_rate(emc->clk, rate);
+	if (err < 0)
+		return err;
+
+	emc->debugfs.max_rate = rate;
+
+	return 0;
+}
+
+DEFINE_SIMPLE_ATTRIBUTE(tegra_emc_debug_max_rate_fops,
+			tegra_emc_debug_max_rate_get,
+			tegra_emc_debug_max_rate_set, "%llu\n");
+
+static void tegra_emc_debugfs_init(struct tegra_emc *emc)
+{
+	struct device *dev = emc->dev;
+	unsigned int i;
+	int err;
+
+	emc->debugfs.min_rate = ULONG_MAX;
+	emc->debugfs.max_rate = 0;
+
+	for (i = 0; i < emc->num_timings; i++) {
+		if (emc->timings[i].rate < emc->debugfs.min_rate)
+			emc->debugfs.min_rate = emc->timings[i].rate;
+
+		if (emc->timings[i].rate > emc->debugfs.max_rate)
+			emc->debugfs.max_rate = emc->timings[i].rate;
+	}
+
+	err = clk_set_rate_range(emc->clk, emc->debugfs.min_rate,
+				 emc->debugfs.max_rate);
+	if (err < 0) {
+		dev_err(dev, "failed to set rate range [%lu-%lu] for %pC\n",
+			emc->debugfs.min_rate, emc->debugfs.max_rate,
+			emc->clk);
+	}
+
+	emc->debugfs.root = debugfs_create_dir("emc", NULL);
+	if (!emc->debugfs.root) {
+		dev_err(emc->dev, "failed to create debugfs directory\n");
+		return;
+	}
+
+	debugfs_create_file("available_rates", S_IRUGO, emc->debugfs.root,
+			    emc, &tegra_emc_debug_available_rates_fops);
+	debugfs_create_file("min_rate", S_IRUGO | S_IWUSR, emc->debugfs.root,
+			    emc, &tegra_emc_debug_min_rate_fops);
+	debugfs_create_file("max_rate", S_IRUGO | S_IWUSR, emc->debugfs.root,
+			    emc, &tegra_emc_debug_max_rate_fops);
+}
+
 static int tegra_emc_probe(struct platform_device *pdev)
 {
 	struct platform_device *mc;
@@ -1169,6 +1341,7 @@ static int tegra_emc_probe(struct platform_device *pdev)
 	}
 
 	platform_set_drvdata(pdev, emc);
+	tegra_emc_debugfs_init(emc);
 
 	return 0;
 
-- 
2.24.1


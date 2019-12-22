Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6138B128DB3
	for <lists+linux-tegra@lfdr.de>; Sun, 22 Dec 2019 12:40:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726393AbfLVLkj (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 22 Dec 2019 06:40:39 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:36527 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbfLVLki (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 22 Dec 2019 06:40:38 -0500
Received: by mail-wm1-f66.google.com with SMTP id p17so13518629wma.1
        for <linux-tegra@vger.kernel.org>; Sun, 22 Dec 2019 03:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8iyYBQ4On3uGcnLnIat38av+sdZSiRZB7odb1SzSaMg=;
        b=RgC/BCm+aBaL1uT6opvdUmvIkpb09LaR1tv0GJV2Tot4qsUGzkelK3KTYNWs0s4nmx
         2G++FEdQmroR2SNO2ETSaLjRq0fGGLpawSJ3cBBsXCEDEBA5sSx9rgmOX+67AKjWS/k6
         KRm0hyWBXR0jeQyyuYMJW291hB4u2OTF6/GdslPtMpXLal/q5H3QnCQFP7GdgH2OMjUp
         c/HcH1ojK4Ir2+5ChqdtJiFJ9hfWUrh9Yo/HT2bU9lcSX3mu7iMjyAzXcBovEd0RNVUV
         x1XcyT2vIhuY7P/8gUm/kSGK5kKwRRDJ/Sg96ewTxdjdF04kexcuUIn5L3bCvhmIIah4
         kbXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8iyYBQ4On3uGcnLnIat38av+sdZSiRZB7odb1SzSaMg=;
        b=tHVnvLRHAhFIuj4yBZ/S9rEc9JZ7fSw82N2o22BNHiK0+fZ4obz//eN7quGgXC4wVp
         SFIaQMOU8PZebr+CMQZmvLkGPzpVYLzQSMmFBuT1gY9rpAaosNHJXk/mMFgZlyrUyypC
         Hhgvu68XqWPFYbbDXqM1Hp9oXYX4Z/smqJtb6wH1i+tymOx83y6cSXEH3tRe84U7ghJd
         CjJ9Lwg1feK9i3yHWVYnXvTJZ0KjvdPhMY1A3138tbEVGOreosz1dlGt49549w/LsInh
         ufWBCDRuQh/YPG+n0RQJA/ST759OTan6RJl/UOKXGqRkUxTD97Dml6UNkp5FbWvw06kc
         Il/A==
X-Gm-Message-State: APjAAAXf9QqG2vGqgqFWTCorvDadtEAf5lnbnhmyTy4yUP0UFh7nNEzD
        CL+vYY+jO5uMpaY0ifm3zsIh33Tm
X-Google-Smtp-Source: APXvYqzmZOaKzz/c+sldQuqiKtqP6d2wjywvpBQAejatSE6YAzhBucZA0ltxlkVehnBsLwCA4EQ1Sw==
X-Received: by 2002:a7b:c407:: with SMTP id k7mr26968606wmi.46.1577014835750;
        Sun, 22 Dec 2019 03:40:35 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
        by smtp.gmail.com with ESMTPSA id q19sm15675359wmc.12.2019.12.22.03.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2019 03:40:34 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH 1/2] memory: tegra: Implement EMC debugfs interface on Tegra20
Date:   Sun, 22 Dec 2019 12:40:32 +0100
Message-Id: <20191222114033.1469622-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

A common debugfs interface is already available on Tegra124, Tegra186
and Tegra194. Implement the same interface on Tegra20 to enable testing
of the EMC frequency scaling code using a unified interface.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/memory/tegra/tegra20-emc.c | 175 +++++++++++++++++++++++++++++
 1 file changed, 175 insertions(+)

diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
index 1b23b1c34476..8ae474d9bfb9 100644
--- a/drivers/memory/tegra/tegra20-emc.c
+++ b/drivers/memory/tegra/tegra20-emc.c
@@ -8,6 +8,7 @@
 #include <linux/clk.h>
 #include <linux/clk/tegra.h>
 #include <linux/completion.h>
+#include <linux/debugfs.h>
 #include <linux/err.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
@@ -150,6 +151,12 @@ struct tegra_emc {
 
 	struct emc_timing *timings;
 	unsigned int num_timings;
+
+	struct {
+		struct dentry *root;
+		unsigned long min_rate;
+		unsigned long max_rate;
+	} debugfs;
 };
 
 static irqreturn_t tegra_emc_isr(int irq, void *data)
@@ -478,6 +485,171 @@ static long emc_round_rate(unsigned long rate,
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
 	struct device_node *np;
@@ -550,6 +722,9 @@ static int tegra_emc_probe(struct platform_device *pdev)
 		goto unset_cb;
 	}
 
+	platform_set_drvdata(pdev, emc);
+	tegra_emc_debugfs_init(emc);
+
 	return 0;
 
 unset_cb:
-- 
2.24.1


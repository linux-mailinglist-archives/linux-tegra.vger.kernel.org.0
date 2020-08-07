Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B89F723F0D9
	for <lists+linux-tegra@lfdr.de>; Fri,  7 Aug 2020 18:20:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726066AbgHGQUp (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 7 Aug 2020 12:20:45 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:14643 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726013AbgHGQUp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 7 Aug 2020 12:20:45 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f2d7ef70000>; Fri, 07 Aug 2020 09:19:03 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Fri, 07 Aug 2020 09:20:44 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Fri, 07 Aug 2020 09:20:44 -0700
Received: from tbergstrom-lnx.Nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 7 Aug
 2020 16:20:44 +0000
Received: from pdeschrijver-desktop.nvidia.com (xn--9q8h [127.0.0.1])
        by tbergstrom-lnx.Nvidia.com (Postfix) with ESMTP id 7749940BDB;
        Fri,  7 Aug 2020 19:20:42 +0300 (EEST)
From:   Peter De Schrijver <pdeschrijver@nvidia.com>
To:     <treding@nvidia.com>
CC:     <linux-tegra@vger.kernel.org>, <devicetree@vger.kernel.org>,
        "Peter De Schrijver" <pdeschrijver@nvidia.com>
Subject: [PATCH 3/3 resend] firmware/tegra: add support for reserved memory as mail store
Date:   Fri, 7 Aug 2020 19:20:41 +0300
Message-ID: <20200807162041.17451-1-pdeschrijver@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1596817143; bh=XLLkvzfhXMFp+HeCHtdIakD61lBb6xXZTw7IpBJarZ4=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         X-NVConfidentiality:MIME-Version:Content-Type:X-Originating-IP:
         X-ClientProxiedBy;
        b=PSMZG+dHQ1aMC3wX83LIGEU2Y3t07UcUtQ44ge16svsTMUJ0YISp+4AHkEwKKgikb
         curNac1j1sNgGHALTsN9Xby029brW+L+mTt9RRyVrxGLUhWkR1EKU78sqTea2EXit+
         JTKxpYnHoLRka+SxBReJFgDsAogEYIeQYaESfi9uJOEG1hr/yrakDjExVZWpRV6Ic2
         ov2xrE3twCNEl0oo0Iv1GwbNK7xkunRkCHE6mMTBk7Lp2IV16OzS4Imn5StzcUTant
         TA/5OxJG3MkXHkUihoXdA24434am37c3NsPHRLlQ5EkiOc08HI8KC51qVQwjKFBXUX
         8Wrwt2voYdOzQ==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
---
 drivers/firmware/tegra/bpmp-private.h  |  3 +-
 drivers/firmware/tegra/bpmp-tegra186.c | 57 ++++++++++++++++++++++++--
 drivers/firmware/tegra/bpmp.c          | 10 +++--
 3 files changed, 62 insertions(+), 8 deletions(-)

diff --git a/drivers/firmware/tegra/bpmp-private.h b/drivers/firmware/tegra/bpmp-private.h
index 54d560c48398..182bfe396516 100644
--- a/drivers/firmware/tegra/bpmp-private.h
+++ b/drivers/firmware/tegra/bpmp-private.h
@@ -24,7 +24,8 @@ struct tegra_bpmp_ops {
 };
 
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_186_SOC) || \
-    IS_ENABLED(CONFIG_ARCH_TEGRA_194_SOC)
+    IS_ENABLED(CONFIG_ARCH_TEGRA_194_SOC) || \
+    IS_ENABLED(CONFIG_ARCH_TEGRA_234_SOC)
 extern const struct tegra_bpmp_ops tegra186_bpmp_ops;
 #endif
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC)
diff --git a/drivers/firmware/tegra/bpmp-tegra186.c b/drivers/firmware/tegra/bpmp-tegra186.c
index ca04ba4ae643..05f10c748a9a 100644
--- a/drivers/firmware/tegra/bpmp-tegra186.c
+++ b/drivers/firmware/tegra/bpmp-tegra186.c
@@ -6,6 +6,7 @@
 #include <linux/genalloc.h>
 #include <linux/io.h>
 #include <linux/mailbox_client.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
 
 #include <soc/tegra/bpmp.h>
@@ -288,9 +289,11 @@ static int tegra186_bpmp_init(struct tegra_bpmp *bpmp)
 	bpmp->priv = priv;
 	priv->parent = bpmp;
 
-	err = tegra186_bpmp_sram_init(bpmp);
-	if (err < 0)
-		return err;
+	if (of_reserved_mem_device_init(priv->parent->dev) < 0) {
+		err = tegra186_bpmp_sram_init(bpmp);
+		if (err < 0)
+			return err;
+	}
 
 	err = tegra186_bpmp_channel_setup(bpmp);
 	if (err < 0)
@@ -352,3 +355,51 @@ const struct tegra_bpmp_ops tegra186_bpmp_ops = {
 	.ring_doorbell = tegra186_bpmp_ring_doorbell,
 	.resume = tegra186_bpmp_resume,
 };
+
+static int tegra_bpmp_rmem_device_init(struct reserved_mem *rmem,
+				       struct device *dev)
+{
+	struct tegra_bpmp *bpmp = dev_get_drvdata(dev);
+	struct tegra186_bpmp *priv = bpmp->priv;
+
+	if (rmem->size < 0x2000)
+		return -ENOMEM;
+
+	priv->tx.phys = rmem->base;
+	priv->rx.phys = rmem->base + 0x1000;
+
+	priv->tx.virt = memremap(priv->tx.phys, rmem->size, MEMREMAP_WC);
+	if (priv->tx.virt == NULL)
+		return -ENOMEM;
+	priv->rx.virt = priv->tx.virt + 0x1000;
+
+	priv->type = TEGRA_RMEM;
+
+	return 0;
+}
+
+static void tegra_bpmp_rmem_device_release(struct reserved_mem *rmem,
+					   struct device *dev)
+{
+	struct tegra_bpmp *bpmp = dev_get_drvdata(dev);
+	struct tegra186_bpmp *priv = bpmp->priv;
+
+	memunmap(priv->tx.virt);
+}
+
+
+static const struct reserved_mem_ops tegra_bpmp_rmem_ops = {
+	.device_init = tegra_bpmp_rmem_device_init,
+	.device_release = tegra_bpmp_rmem_device_release,
+};
+
+static int tegra_bpmp_rmem_init(struct reserved_mem *rmem)
+{
+	pr_debug("Tegra BPMP message buffer at %pa, size %lu bytes\n", &rmem->base, (unsigned long)rmem->size);
+
+	rmem->ops = &tegra_bpmp_rmem_ops;
+
+	return 0;
+}
+
+RESERVEDMEM_OF_DECLARE(tegra_bpmp, "nvidia,tegra234-bpmp-shmem", tegra_bpmp_rmem_init);
diff --git a/drivers/firmware/tegra/bpmp.c b/drivers/firmware/tegra/bpmp.c
index dd775e8ba5a0..7f41a605f9bb 100644
--- a/drivers/firmware/tegra/bpmp.c
+++ b/drivers/firmware/tegra/bpmp.c
@@ -739,6 +739,8 @@ static int tegra_bpmp_probe(struct platform_device *pdev)
 	if (!bpmp->threaded_channels)
 		return -ENOMEM;
 
+	platform_set_drvdata(pdev, bpmp);
+
 	err = bpmp->soc->ops->init(bpmp);
 	if (err < 0)
 		return err;
@@ -762,8 +764,6 @@ static int tegra_bpmp_probe(struct platform_device *pdev)
 
 	dev_info(&pdev->dev, "firmware: %.*s\n", (int)sizeof(tag), tag);
 
-	platform_set_drvdata(pdev, bpmp);
-
 	err = of_platform_default_populate(pdev->dev.of_node, NULL, &pdev->dev);
 	if (err < 0)
 		goto free_mrq;
@@ -814,7 +814,8 @@ static int __maybe_unused tegra_bpmp_resume(struct device *dev)
 static SIMPLE_DEV_PM_OPS(tegra_bpmp_pm_ops, NULL, tegra_bpmp_resume);
 
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_186_SOC) || \
-    IS_ENABLED(CONFIG_ARCH_TEGRA_194_SOC)
+    IS_ENABLED(CONFIG_ARCH_TEGRA_194_SOC) || \
+    IS_ENABLED(CONFIG_ARCH_TEGRA_234_SOC)
 static const struct tegra_bpmp_soc tegra186_soc = {
 	.channels = {
 		.cpu_tx = {
@@ -861,7 +862,8 @@ static const struct tegra_bpmp_soc tegra210_soc = {
 
 static const struct of_device_id tegra_bpmp_match[] = {
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_186_SOC) || \
-    IS_ENABLED(CONFIG_ARCH_TEGRA_194_SOC)
+    IS_ENABLED(CONFIG_ARCH_TEGRA_194_SOC) || \
+    IS_ENABLED(CONFIG_ARCH_TEGRA_234_SOC)
 	{ .compatible = "nvidia,tegra186-bpmp", .data = &tegra186_soc },
 #endif
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC)
-- 
2.17.1


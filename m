Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4BA740DD54
	for <lists+linux-tegra@lfdr.de>; Thu, 16 Sep 2021 16:55:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236364AbhIPO44 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 16 Sep 2021 10:56:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238939AbhIPO4u (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 16 Sep 2021 10:56:50 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CBB3C061766;
        Thu, 16 Sep 2021 07:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=tQQvsADDbYfEIswMCXSYBqyHEPHufoqtfOEdvB8ZmGw=; b=Phbr8u4COFbxI3AmkwKSyo636r
        GdaHwz2XO1ybqfi0Yv4ZJZRc4S+btbJnhMHqv+aTFIvHKpRENXNpBR8zRFCjgtnicQUcWH9QEOKeJ
        De8HKs6K1VKGK/zzSpU7UqZjhgw4jf8yqfV6Ppo8WZnt1FpEZdKWa3PHox7AD8xQTuNHJw4R3ba2S
        HOcnFTqIphDHJqfx1YXUPU+JcC4/w6nWofEjGpa5HJjtx599SCejGN75/Oh4k6zqTbY5+c8IS3xyg
        5KgYe7wbM0YaPZlc3wVJZ2uAosq0vXyCcd1clNcxT1Bc5zsbwdaj81Q7kTEHT9s1UlckRzwjJgJ10
        XrxGPoUg==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <mperttunen@nvidia.com>)
        id 1mQsnM-0002zq-An; Thu, 16 Sep 2021 17:55:24 +0300
From:   Mikko Perttunen <mperttunen@nvidia.com>
To:     thierry.reding@gmail.com, jonathanh@nvidia.com, airlied@linux.ie,
        daniel@ffwll.ch, robh+dt@kernel.org
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH v6 3/3] drm/tegra: Add NVDEC driver
Date:   Thu, 16 Sep 2021 17:55:17 +0300
Message-Id: <20210916145517.2047351-4-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210916145517.2047351-1-mperttunen@nvidia.com>
References: <20210916145517.2047351-1-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: mperttunen@nvidia.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add support for booting and using NVDEC on Tegra210, Tegra186
and Tegra194 to the Host1x and TegraDRM drivers. Booting in
secure mode is not currently supported.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
v5:
* Remove num_instances
* Change from nvidia,instance to nvidia,host1x-class
v3:
* Change num_instances to unsigned int
* Remove unnecessary '= 0' initializer
* Populate num_instances data
* Fix instance number check
v2:
* Use devm_platform_get_and_ioremap_resource
* Remove reset handling, done by power domain code
* Assume runtime PM is enabled
---
 drivers/gpu/drm/tegra/Makefile |   3 +-
 drivers/gpu/drm/tegra/drm.c    |   4 +
 drivers/gpu/drm/tegra/drm.h    |   1 +
 drivers/gpu/drm/tegra/nvdec.c  | 464 +++++++++++++++++++++++++++++++++
 drivers/gpu/host1x/dev.c       |  18 ++
 include/linux/host1x.h         |   2 +
 6 files changed, 491 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/tegra/nvdec.c

diff --git a/drivers/gpu/drm/tegra/Makefile b/drivers/gpu/drm/tegra/Makefile
index 5d2039f0c734..b248c631f790 100644
--- a/drivers/gpu/drm/tegra/Makefile
+++ b/drivers/gpu/drm/tegra/Makefile
@@ -24,7 +24,8 @@ tegra-drm-y := \
 	gr2d.o \
 	gr3d.o \
 	falcon.o \
-	vic.o
+	vic.o \
+	nvdec.o
 
 tegra-drm-y += trace.o
 
diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index b20fd0833661..5f5afd7ba37e 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -1337,15 +1337,18 @@ static const struct of_device_id host1x_drm_subdevs[] = {
 	{ .compatible = "nvidia,tegra210-sor", },
 	{ .compatible = "nvidia,tegra210-sor1", },
 	{ .compatible = "nvidia,tegra210-vic", },
+	{ .compatible = "nvidia,tegra210-nvdec", },
 	{ .compatible = "nvidia,tegra186-display", },
 	{ .compatible = "nvidia,tegra186-dc", },
 	{ .compatible = "nvidia,tegra186-sor", },
 	{ .compatible = "nvidia,tegra186-sor1", },
 	{ .compatible = "nvidia,tegra186-vic", },
+	{ .compatible = "nvidia,tegra186-nvdec", },
 	{ .compatible = "nvidia,tegra194-display", },
 	{ .compatible = "nvidia,tegra194-dc", },
 	{ .compatible = "nvidia,tegra194-sor", },
 	{ .compatible = "nvidia,tegra194-vic", },
+	{ .compatible = "nvidia,tegra194-nvdec", },
 	{ /* sentinel */ }
 };
 
@@ -1369,6 +1372,7 @@ static struct platform_driver * const drivers[] = {
 	&tegra_gr2d_driver,
 	&tegra_gr3d_driver,
 	&tegra_vic_driver,
+	&tegra_nvdec_driver,
 };
 
 static int __init host1x_drm_init(void)
diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index 8b28327c931c..fc0a19554eac 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -202,5 +202,6 @@ extern struct platform_driver tegra_sor_driver;
 extern struct platform_driver tegra_gr2d_driver;
 extern struct platform_driver tegra_gr3d_driver;
 extern struct platform_driver tegra_vic_driver;
+extern struct platform_driver tegra_nvdec_driver;
 
 #endif /* HOST1X_DRM_H */
diff --git a/drivers/gpu/drm/tegra/nvdec.c b/drivers/gpu/drm/tegra/nvdec.c
new file mode 100644
index 000000000000..c3b6fe7fb454
--- /dev/null
+++ b/drivers/gpu/drm/tegra/nvdec.c
@@ -0,0 +1,464 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2015-2021, NVIDIA Corporation.
+ */
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/host1x.h>
+#include <linux/iommu.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/reset.h>
+
+#include <soc/tegra/pmc.h>
+
+#include "drm.h"
+#include "falcon.h"
+#include "vic.h"
+
+struct nvdec_config {
+	const char *firmware;
+	unsigned int version;
+	bool supports_sid;
+};
+
+struct nvdec {
+	struct falcon falcon;
+
+	void __iomem *regs;
+	struct tegra_drm_client client;
+	struct host1x_channel *channel;
+	struct device *dev;
+	struct clk *clk;
+
+	/* Platform configuration */
+	const struct nvdec_config *config;
+};
+
+static inline struct nvdec *to_nvdec(struct tegra_drm_client *client)
+{
+	return container_of(client, struct nvdec, client);
+}
+
+static void nvdec_writel(struct nvdec *nvdec, u32 value, unsigned int offset)
+{
+	writel(value, nvdec->regs + offset);
+}
+
+static int nvdec_boot(struct nvdec *nvdec)
+{
+#ifdef CONFIG_IOMMU_API
+	struct iommu_fwspec *spec = dev_iommu_fwspec_get(nvdec->dev);
+#endif
+	int err;
+
+#ifdef CONFIG_IOMMU_API
+	if (nvdec->config->supports_sid && spec) {
+		u32 value;
+
+		value = TRANSCFG_ATT(1, TRANSCFG_SID_FALCON) | TRANSCFG_ATT(0, TRANSCFG_SID_HW);
+		nvdec_writel(nvdec, value, VIC_TFBIF_TRANSCFG);
+
+		if (spec->num_ids > 0) {
+			value = spec->ids[0] & 0xffff;
+
+			nvdec_writel(nvdec, value, VIC_THI_STREAMID0);
+			nvdec_writel(nvdec, value, VIC_THI_STREAMID1);
+		}
+	}
+#endif
+
+	err = falcon_boot(&nvdec->falcon);
+	if (err < 0)
+		return err;
+
+	err = falcon_wait_idle(&nvdec->falcon);
+	if (err < 0) {
+		dev_err(nvdec->dev, "falcon boot timed out\n");
+		return err;
+	}
+
+	return 0;
+}
+
+static int nvdec_init(struct host1x_client *client)
+{
+	struct tegra_drm_client *drm = host1x_to_drm_client(client);
+	struct drm_device *dev = dev_get_drvdata(client->host);
+	struct tegra_drm *tegra = dev->dev_private;
+	struct nvdec *nvdec = to_nvdec(drm);
+	int err;
+
+	err = host1x_client_iommu_attach(client);
+	if (err < 0 && err != -ENODEV) {
+		dev_err(nvdec->dev, "failed to attach to domain: %d\n", err);
+		return err;
+	}
+
+	nvdec->channel = host1x_channel_request(client);
+	if (!nvdec->channel) {
+		err = -ENOMEM;
+		goto detach;
+	}
+
+	client->syncpts[0] = host1x_syncpt_request(client, 0);
+	if (!client->syncpts[0]) {
+		err = -ENOMEM;
+		goto free_channel;
+	}
+
+	err = tegra_drm_register_client(tegra, drm);
+	if (err < 0)
+		goto free_syncpt;
+
+	/*
+	 * Inherit the DMA parameters (such as maximum segment size) from the
+	 * parent host1x device.
+	 */
+	client->dev->dma_parms = client->host->dma_parms;
+
+	return 0;
+
+free_syncpt:
+	host1x_syncpt_put(client->syncpts[0]);
+free_channel:
+	host1x_channel_put(nvdec->channel);
+detach:
+	host1x_client_iommu_detach(client);
+
+	return err;
+}
+
+static int nvdec_exit(struct host1x_client *client)
+{
+	struct tegra_drm_client *drm = host1x_to_drm_client(client);
+	struct drm_device *dev = dev_get_drvdata(client->host);
+	struct tegra_drm *tegra = dev->dev_private;
+	struct nvdec *nvdec = to_nvdec(drm);
+	int err;
+
+	/* avoid a dangling pointer just in case this disappears */
+	client->dev->dma_parms = NULL;
+
+	err = tegra_drm_unregister_client(tegra, drm);
+	if (err < 0)
+		return err;
+
+	host1x_syncpt_put(client->syncpts[0]);
+	host1x_channel_put(nvdec->channel);
+	host1x_client_iommu_detach(client);
+
+	if (client->group) {
+		dma_unmap_single(nvdec->dev, nvdec->falcon.firmware.phys,
+				 nvdec->falcon.firmware.size, DMA_TO_DEVICE);
+		tegra_drm_free(tegra, nvdec->falcon.firmware.size,
+			       nvdec->falcon.firmware.virt,
+			       nvdec->falcon.firmware.iova);
+	} else {
+		dma_free_coherent(nvdec->dev, nvdec->falcon.firmware.size,
+				  nvdec->falcon.firmware.virt,
+				  nvdec->falcon.firmware.iova);
+	}
+
+	return 0;
+}
+
+static const struct host1x_client_ops nvdec_client_ops = {
+	.init = nvdec_init,
+	.exit = nvdec_exit,
+};
+
+static int nvdec_load_firmware(struct nvdec *nvdec)
+{
+	struct host1x_client *client = &nvdec->client.base;
+	struct tegra_drm *tegra = nvdec->client.drm;
+	dma_addr_t iova;
+	size_t size;
+	void *virt;
+	int err;
+
+	if (nvdec->falcon.firmware.virt)
+		return 0;
+
+	err = falcon_read_firmware(&nvdec->falcon, nvdec->config->firmware);
+	if (err < 0)
+		return err;
+
+	size = nvdec->falcon.firmware.size;
+
+	if (!client->group) {
+		virt = dma_alloc_coherent(nvdec->dev, size, &iova, GFP_KERNEL);
+
+		err = dma_mapping_error(nvdec->dev, iova);
+		if (err < 0)
+			return err;
+	} else {
+		virt = tegra_drm_alloc(tegra, size, &iova);
+	}
+
+	nvdec->falcon.firmware.virt = virt;
+	nvdec->falcon.firmware.iova = iova;
+
+	err = falcon_load_firmware(&nvdec->falcon);
+	if (err < 0)
+		goto cleanup;
+
+	/*
+	 * In this case we have received an IOVA from the shared domain, so we
+	 * need to make sure to get the physical address so that the DMA API
+	 * knows what memory pages to flush the cache for.
+	 */
+	if (client->group) {
+		dma_addr_t phys;
+
+		phys = dma_map_single(nvdec->dev, virt, size, DMA_TO_DEVICE);
+
+		err = dma_mapping_error(nvdec->dev, phys);
+		if (err < 0)
+			goto cleanup;
+
+		nvdec->falcon.firmware.phys = phys;
+	}
+
+	return 0;
+
+cleanup:
+	if (!client->group)
+		dma_free_coherent(nvdec->dev, size, virt, iova);
+	else
+		tegra_drm_free(tegra, size, virt, iova);
+
+	return err;
+}
+
+
+static int nvdec_runtime_resume(struct device *dev)
+{
+	struct nvdec *nvdec = dev_get_drvdata(dev);
+	int err;
+
+	err = clk_prepare_enable(nvdec->clk);
+	if (err < 0)
+		return err;
+
+	usleep_range(10, 20);
+
+	err = nvdec_load_firmware(nvdec);
+	if (err < 0)
+		goto disable;
+
+	err = nvdec_boot(nvdec);
+	if (err < 0)
+		goto disable;
+
+	return 0;
+
+disable:
+	clk_disable_unprepare(nvdec->clk);
+	return err;
+}
+
+static int nvdec_runtime_suspend(struct device *dev)
+{
+	struct nvdec *nvdec = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(nvdec->clk);
+
+	return 0;
+}
+
+static int nvdec_open_channel(struct tegra_drm_client *client,
+			    struct tegra_drm_context *context)
+{
+	struct nvdec *nvdec = to_nvdec(client);
+	int err;
+
+	err = pm_runtime_get_sync(nvdec->dev);
+	if (err < 0) {
+		pm_runtime_put(nvdec->dev);
+		return err;
+	}
+
+	context->channel = host1x_channel_get(nvdec->channel);
+	if (!context->channel) {
+		pm_runtime_put(nvdec->dev);
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
+static void nvdec_close_channel(struct tegra_drm_context *context)
+{
+	struct nvdec *nvdec = to_nvdec(context->client);
+
+	host1x_channel_put(context->channel);
+	pm_runtime_put(nvdec->dev);
+}
+
+static const struct tegra_drm_client_ops nvdec_ops = {
+	.open_channel = nvdec_open_channel,
+	.close_channel = nvdec_close_channel,
+	.submit = tegra_drm_submit,
+};
+
+#define NVIDIA_TEGRA_210_NVDEC_FIRMWARE "nvidia/tegra210/nvdec.bin"
+
+static const struct nvdec_config nvdec_t210_config = {
+	.firmware = NVIDIA_TEGRA_210_NVDEC_FIRMWARE,
+	.version = 0x21,
+	.supports_sid = false,
+};
+
+#define NVIDIA_TEGRA_186_NVDEC_FIRMWARE "nvidia/tegra186/nvdec.bin"
+
+static const struct nvdec_config nvdec_t186_config = {
+	.firmware = NVIDIA_TEGRA_186_NVDEC_FIRMWARE,
+	.version = 0x18,
+	.supports_sid = true,
+};
+
+#define NVIDIA_TEGRA_194_NVDEC_FIRMWARE "nvidia/tegra194/nvdec.bin"
+
+static const struct nvdec_config nvdec_t194_config = {
+	.firmware = NVIDIA_TEGRA_194_NVDEC_FIRMWARE,
+	.version = 0x19,
+	.supports_sid = true,
+};
+
+static const struct of_device_id tegra_nvdec_of_match[] = {
+	{ .compatible = "nvidia,tegra210-nvdec", .data = &nvdec_t210_config },
+	{ .compatible = "nvidia,tegra186-nvdec", .data = &nvdec_t186_config },
+	{ .compatible = "nvidia,tegra194-nvdec", .data = &nvdec_t194_config },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, tegra_nvdec_of_match);
+
+static int nvdec_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct host1x_syncpt **syncpts;
+	struct nvdec *nvdec;
+	u32 host_class;
+	int err;
+
+	/* inherit DMA mask from host1x parent */
+	err = dma_coerce_mask_and_coherent(dev, *dev->parent->dma_mask);
+	if (err < 0) {
+		dev_err(&pdev->dev, "failed to set DMA mask: %d\n", err);
+		return err;
+	}
+
+	nvdec = devm_kzalloc(dev, sizeof(*nvdec), GFP_KERNEL);
+	if (!nvdec)
+		return -ENOMEM;
+
+	nvdec->config = of_device_get_match_data(dev);
+
+	syncpts = devm_kzalloc(dev, sizeof(*syncpts), GFP_KERNEL);
+	if (!syncpts)
+		return -ENOMEM;
+
+	nvdec->regs = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
+	if (IS_ERR(nvdec->regs))
+		return PTR_ERR(nvdec->regs);
+
+	nvdec->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(nvdec->clk)) {
+		dev_err(&pdev->dev, "failed to get clock\n");
+		return PTR_ERR(nvdec->clk);
+	}
+
+	err = of_property_read_u32(dev->of_node, "nvidia,host1x-class", &host_class);
+	if (err < 0)
+		host_class = HOST1X_CLASS_NVDEC;
+
+	nvdec->falcon.dev = dev;
+	nvdec->falcon.regs = nvdec->regs;
+
+	err = falcon_init(&nvdec->falcon);
+	if (err < 0)
+		return err;
+
+	platform_set_drvdata(pdev, nvdec);
+
+	INIT_LIST_HEAD(&nvdec->client.base.list);
+	nvdec->client.base.ops = &nvdec_client_ops;
+	nvdec->client.base.dev = dev;
+	nvdec->client.base.class = host_class;
+	nvdec->client.base.syncpts = syncpts;
+	nvdec->client.base.num_syncpts = 1;
+	nvdec->dev = dev;
+
+	INIT_LIST_HEAD(&nvdec->client.list);
+	nvdec->client.version = nvdec->config->version;
+	nvdec->client.ops = &nvdec_ops;
+
+	err = host1x_client_register(&nvdec->client.base);
+	if (err < 0) {
+		dev_err(dev, "failed to register host1x client: %d\n", err);
+		goto exit_falcon;
+	}
+
+	pm_runtime_enable(&pdev->dev);
+	pm_runtime_set_autosuspend_delay(&pdev->dev, 500);
+	pm_runtime_use_autosuspend(&pdev->dev);
+
+	return 0;
+
+exit_falcon:
+	falcon_exit(&nvdec->falcon);
+
+	return err;
+}
+
+static int nvdec_remove(struct platform_device *pdev)
+{
+	struct nvdec *nvdec = platform_get_drvdata(pdev);
+	int err;
+
+	err = host1x_client_unregister(&nvdec->client.base);
+	if (err < 0) {
+		dev_err(&pdev->dev, "failed to unregister host1x client: %d\n",
+			err);
+		return err;
+	}
+
+	if (pm_runtime_enabled(&pdev->dev))
+		pm_runtime_disable(&pdev->dev);
+	else
+		nvdec_runtime_suspend(&pdev->dev);
+
+	falcon_exit(&nvdec->falcon);
+
+	return 0;
+}
+
+static const struct dev_pm_ops nvdec_pm_ops = {
+	SET_RUNTIME_PM_OPS(nvdec_runtime_suspend, nvdec_runtime_resume, NULL)
+};
+
+struct platform_driver tegra_nvdec_driver = {
+	.driver = {
+		.name = "tegra-nvdec",
+		.of_match_table = tegra_nvdec_of_match,
+		.pm = &nvdec_pm_ops
+	},
+	.probe = nvdec_probe,
+	.remove = nvdec_remove,
+};
+
+#if IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC)
+MODULE_FIRMWARE(NVIDIA_TEGRA_210_NVDEC_FIRMWARE);
+#endif
+#if IS_ENABLED(CONFIG_ARCH_TEGRA_186_SOC)
+MODULE_FIRMWARE(NVIDIA_TEGRA_186_NVDEC_FIRMWARE);
+#endif
+#if IS_ENABLED(CONFIG_ARCH_TEGRA_194_SOC)
+MODULE_FIRMWARE(NVIDIA_TEGRA_194_NVDEC_FIRMWARE);
+#endif
diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index fbb6447b8659..e2ddf3fcaa9a 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -132,6 +132,12 @@ static const struct host1x_sid_entry tegra186_sid_table[] = {
 		.offset = 0x30,
 		.limit = 0x34
 	},
+	{
+		/* NVDEC */
+		.base = 0x1b00,
+		.offset = 0x30,
+		.limit = 0x34
+	},
 };
 
 static const struct host1x_info host1x06_info = {
@@ -156,6 +162,18 @@ static const struct host1x_sid_entry tegra194_sid_table[] = {
 		.offset = 0x30,
 		.limit = 0x34
 	},
+	{
+		/* NVDEC */
+		.base = 0x1b00,
+		.offset = 0x30,
+		.limit = 0x34
+	},
+	{
+		/* NVDEC1 */
+		.base = 0x1bc0,
+		.offset = 0x30,
+		.limit = 0x34
+	},
 };
 
 static const struct host1x_info host1x07_info = {
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index 9b6784708f2e..d7d415bcf78b 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -15,6 +15,8 @@ enum host1x_class {
 	HOST1X_CLASS_GR2D_SB = 0x52,
 	HOST1X_CLASS_VIC = 0x5D,
 	HOST1X_CLASS_GR3D = 0x60,
+	HOST1X_CLASS_NVDEC = 0xF0,
+	HOST1X_CLASS_NVDEC1 = 0xF5,
 };
 
 struct host1x;
-- 
2.32.0


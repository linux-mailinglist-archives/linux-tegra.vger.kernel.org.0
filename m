Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FEF9224F95
	for <lists+linux-tegra@lfdr.de>; Sun, 19 Jul 2020 07:06:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725272AbgGSFGV (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 19 Jul 2020 01:06:21 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:18018 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726473AbgGSFGU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 19 Jul 2020 01:06:20 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f13d3ce0000>; Sat, 18 Jul 2020 22:02:06 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Sat, 18 Jul 2020 22:02:19 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Sat, 18 Jul 2020 22:02:19 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 19 Jul
 2020 05:02:18 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Sun, 19 Jul 2020 05:02:18 +0000
Received: from audio.nvidia.com (Not Verified[10.24.34.185]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f13d3d50002>; Sat, 18 Jul 2020 22:02:18 -0700
From:   Sameer Pujar <spujar@nvidia.com>
To:     <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
        <kuninori.morimoto.gx@renesas.com>, <robh+dt@kernel.org>,
        <lgirdwood@gmail.com>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <digetx@gmail.com>, <alsa-devel@alsa-project.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sharadg@nvidia.com>, <mkumard@nvidia.com>,
        <viswanathl@nvidia.com>, <rlokhande@nvidia.com>,
        <dramesh@nvidia.com>, <atalambedu@nvidia.com>,
        <nwartikar@nvidia.com>, <swarren@nvidia.com>,
        <nicoleotsuka@gmail.com>, Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH v5 07/11] ASoC: tegra: Add Tegra210 based ADMAIF driver
Date:   Sun, 19 Jul 2020 10:31:26 +0530
Message-ID: <1595134890-16470-8-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595134890-16470-1-git-send-email-spujar@nvidia.com>
References: <1595134890-16470-1-git-send-email-spujar@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1595134926; bh=1vnn2s/zQugorpD0NwVb8fnzZM3ZeSagZ8N25Tz9FHQ=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=hV5yel06+0aIkyIqcWpvDdlGF5Qrv6twzMkZNOHsS6BlakJr/A6urbNgWhVN5xwlS
         3XxPUAPxzcu9j1NqxZak/bjncyDSk1VXwuRChlAuJ8K6lRS7xvQzPRaUI7uwd0RFJ+
         aAZsQ29MN2JXXL3gkz8PKgP7QUM6qGRzUUNepiHdXQH6dd8bMD4SYubluk6ncRf1gD
         M2ZxLYsX8tjPjtMticlgg6A9S5CtxAf6UBpFP2t8Kt8clDikJknoSjs6Lqamt1EM8T
         VAOKNJJ8/ou36JRfJRXhxOO5y/G0mGagpr9Z3ieRcxsyzbeQiDUSFfZ6eK358O/QcE
         HlYuP2DtDVhEQ==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

ADMAIF is the interface between ADMA and AHUB. Each ADMA channel that
sends/receives data to/from AHUB must intreface through an ADMAIF channel.
ADMA channel sending data to AHUB pairs with an ADMAIF Tx channel and
similarly ADMA channel receiving data from AHUB pairs with an ADMAIF Rx
channel. Buffer size is configurable for each ADMAIF channel, but currently
SW uses default values.

This patch registers ADMAIF driver with ASoC framework. The component
driver exposes DAPM widgets, routes and kcontrols for the device. The DAI
driver exposes ADMAIF interfaces, which can be used to connect different
components in the ASoC layer. Makefile and Kconfig support is added to
allow to build the driver. The ADMAIF device can be enabled in the DT via
"nvidia,tegra210-admaif" compatible binding.

Tegra PCM driver is updated to expose required PCM interfaces and
snd_pcm_ops callbacks.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/soc/tegra/Kconfig           |  12 +
 sound/soc/tegra/Makefile          |   2 +
 sound/soc/tegra/tegra210_admaif.c | 800 ++++++++++++++++++++++++++++++++++++++
 sound/soc/tegra/tegra210_admaif.h | 162 ++++++++
 sound/soc/tegra/tegra_pcm.c       | 235 ++++++++++-
 sound/soc/tegra/tegra_pcm.h       |  21 +-
 6 files changed, 1230 insertions(+), 2 deletions(-)
 create mode 100644 sound/soc/tegra/tegra210_admaif.c
 create mode 100644 sound/soc/tegra/tegra210_admaif.h

diff --git a/sound/soc/tegra/Kconfig b/sound/soc/tegra/Kconfig
index 800cf9c..3d91bd3 100644
--- a/sound/soc/tegra/Kconfig
+++ b/sound/soc/tegra/Kconfig
@@ -106,6 +106,18 @@ config SND_SOC_TEGRA186_DSPK
 	  the desired 1-bit output via Delta Sigma Modulation (DSM).
 	  Say Y or M if you want to add support for Tegra186 DSPK module.
 
+config SND_SOC_TEGRA210_ADMAIF
+	tristate "Tegra210 ADMAIF module"
+	depends on SND_SOC_TEGRA
+	help
+	  Config to enable ADMAIF which is the interface between ADMA and
+	  Audio Hub (AHUB). Each ADMA channel that sends/receives data to/
+	  from AHUB must interface through an ADMAIF channel. ADMA channel
+	  sending data to AHUB pairs with an ADMAIF Tx channel, where as
+	  ADMA channel receiving data from AHUB pairs with an ADMAIF Rx
+	  channel. Buffer size is configurable for each ADMAIIF channel.
+	  Say Y or M if you want to add support for Tegra210 ADMAIF module.
+
 config SND_SOC_TEGRA_RT5640
 	tristate "SoC Audio support for Tegra boards using an RT5640 codec"
 	depends on SND_SOC_TEGRA && I2C && GPIOLIB
diff --git a/sound/soc/tegra/Makefile b/sound/soc/tegra/Makefile
index 336c4c7..60040a0 100644
--- a/sound/soc/tegra/Makefile
+++ b/sound/soc/tegra/Makefile
@@ -12,6 +12,7 @@ snd-soc-tegra210-ahub-objs := tegra210_ahub.o
 snd-soc-tegra210-dmic-objs := tegra210_dmic.o
 snd-soc-tegra210-i2s-objs := tegra210_i2s.o
 snd-soc-tegra186-dspk-objs := tegra186_dspk.o
+snd-soc-tegra210-admaif-objs := tegra210_admaif.o
 
 obj-$(CONFIG_SND_SOC_TEGRA) += snd-soc-tegra-pcm.o
 obj-$(CONFIG_SND_SOC_TEGRA) += snd-soc-tegra-utils.o
@@ -25,6 +26,7 @@ obj-$(CONFIG_SND_SOC_TEGRA210_DMIC) += snd-soc-tegra210-dmic.o
 obj-$(CONFIG_SND_SOC_TEGRA210_AHUB) += snd-soc-tegra210-ahub.o
 obj-$(CONFIG_SND_SOC_TEGRA210_I2S) += snd-soc-tegra210-i2s.o
 obj-$(CONFIG_SND_SOC_TEGRA186_DSPK) += snd-soc-tegra186-dspk.o
+obj-$(CONFIG_SND_SOC_TEGRA210_ADMAIF) += snd-soc-tegra210-admaif.o
 
 # Tegra machine Support
 snd-soc-tegra-rt5640-objs := tegra_rt5640.o
diff --git a/sound/soc/tegra/tegra210_admaif.c b/sound/soc/tegra/tegra210_admaif.c
new file mode 100644
index 0000000..4894e8e
--- /dev/null
+++ b/sound/soc/tegra/tegra210_admaif.c
@@ -0,0 +1,800 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// tegra210_admaif.c - Tegra ADMAIF driver
+//
+// Copyright (c) 2020 NVIDIA CORPORATION.  All rights reserved.
+
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include "tegra210_admaif.h"
+#include "tegra_cif.h"
+#include "tegra_pcm.h"
+
+#define CH_REG(offset, reg, id)						       \
+	((offset) + (reg) + (TEGRA_ADMAIF_CHANNEL_REG_STRIDE * (id)))
+
+#define CH_TX_REG(reg, id) CH_REG(admaif->soc_data->tx_base, reg, id)
+
+#define CH_RX_REG(reg, id) CH_REG(admaif->soc_data->rx_base, reg, id)
+
+#define REG_DEFAULTS(id, rx_ctrl, tx_ctrl, tx_base, rx_base)		       \
+	{ CH_REG(rx_base, TEGRA_ADMAIF_RX_INT_MASK, id), 0x00000001 },	       \
+	{ CH_REG(rx_base, TEGRA_ADMAIF_CH_ACIF_RX_CTRL, id), 0x00007700 },     \
+	{ CH_REG(rx_base, TEGRA_ADMAIF_RX_FIFO_CTRL, id), rx_ctrl },	       \
+	{ CH_REG(tx_base, TEGRA_ADMAIF_TX_INT_MASK, id), 0x00000001 },	       \
+	{ CH_REG(tx_base, TEGRA_ADMAIF_CH_ACIF_TX_CTRL, id), 0x00007700 },     \
+	{ CH_REG(tx_base, TEGRA_ADMAIF_TX_FIFO_CTRL, id), tx_ctrl }
+
+#define ADMAIF_REG_DEFAULTS(id, chip)					       \
+	REG_DEFAULTS((id) - 1,						       \
+		chip ## _ADMAIF_RX ## id ## _FIFO_CTRL_REG_DEFAULT,	       \
+		chip ## _ADMAIF_TX ## id ## _FIFO_CTRL_REG_DEFAULT,	       \
+		chip ## _ADMAIF_TX_BASE,				       \
+		chip ## _ADMAIF_RX_BASE)
+
+static const struct reg_default tegra186_admaif_reg_defaults[] = {
+	{(TEGRA_ADMAIF_GLOBAL_CG_0 + TEGRA186_ADMAIF_GLOBAL_BASE), 0x00000003},
+	ADMAIF_REG_DEFAULTS(1, TEGRA186),
+	ADMAIF_REG_DEFAULTS(2, TEGRA186),
+	ADMAIF_REG_DEFAULTS(3, TEGRA186),
+	ADMAIF_REG_DEFAULTS(4, TEGRA186),
+	ADMAIF_REG_DEFAULTS(5, TEGRA186),
+	ADMAIF_REG_DEFAULTS(6, TEGRA186),
+	ADMAIF_REG_DEFAULTS(7, TEGRA186),
+	ADMAIF_REG_DEFAULTS(8, TEGRA186),
+	ADMAIF_REG_DEFAULTS(9, TEGRA186),
+	ADMAIF_REG_DEFAULTS(10, TEGRA186),
+	ADMAIF_REG_DEFAULTS(11, TEGRA186),
+	ADMAIF_REG_DEFAULTS(12, TEGRA186),
+	ADMAIF_REG_DEFAULTS(13, TEGRA186),
+	ADMAIF_REG_DEFAULTS(14, TEGRA186),
+	ADMAIF_REG_DEFAULTS(15, TEGRA186),
+	ADMAIF_REG_DEFAULTS(16, TEGRA186),
+	ADMAIF_REG_DEFAULTS(17, TEGRA186),
+	ADMAIF_REG_DEFAULTS(18, TEGRA186),
+	ADMAIF_REG_DEFAULTS(19, TEGRA186),
+	ADMAIF_REG_DEFAULTS(20, TEGRA186)
+};
+
+static const struct reg_default tegra210_admaif_reg_defaults[] = {
+	{(TEGRA_ADMAIF_GLOBAL_CG_0 + TEGRA210_ADMAIF_GLOBAL_BASE), 0x00000003},
+	ADMAIF_REG_DEFAULTS(1, TEGRA210),
+	ADMAIF_REG_DEFAULTS(2, TEGRA210),
+	ADMAIF_REG_DEFAULTS(3, TEGRA210),
+	ADMAIF_REG_DEFAULTS(4, TEGRA210),
+	ADMAIF_REG_DEFAULTS(5, TEGRA210),
+	ADMAIF_REG_DEFAULTS(6, TEGRA210),
+	ADMAIF_REG_DEFAULTS(7, TEGRA210),
+	ADMAIF_REG_DEFAULTS(8, TEGRA210),
+	ADMAIF_REG_DEFAULTS(9, TEGRA210),
+	ADMAIF_REG_DEFAULTS(10, TEGRA210)
+};
+
+static bool tegra_admaif_wr_reg(struct device *dev, unsigned int reg)
+{
+	struct tegra_admaif *admaif = dev_get_drvdata(dev);
+	unsigned int ch_stride = TEGRA_ADMAIF_CHANNEL_REG_STRIDE;
+	unsigned int num_ch = admaif->soc_data->num_ch;
+	unsigned int rx_base = admaif->soc_data->rx_base;
+	unsigned int tx_base = admaif->soc_data->tx_base;
+	unsigned int global_base = admaif->soc_data->global_base;
+	unsigned int reg_max = admaif->soc_data->regmap_conf->max_register;
+	unsigned int rx_max = rx_base + (num_ch * ch_stride);
+	unsigned int tx_max = tx_base + (num_ch * ch_stride);
+
+	if ((reg >= rx_base) && (reg < rx_max)) {
+		reg = (reg - rx_base) % ch_stride;
+		if ((reg == TEGRA_ADMAIF_RX_ENABLE) ||
+		    (reg == TEGRA_ADMAIF_RX_FIFO_CTRL) ||
+		    (reg == TEGRA_ADMAIF_RX_SOFT_RESET) ||
+		    (reg == TEGRA_ADMAIF_CH_ACIF_RX_CTRL))
+			return true;
+	} else if ((reg >= tx_base) && (reg < tx_max)) {
+		reg = (reg - tx_base) % ch_stride;
+		if ((reg == TEGRA_ADMAIF_TX_ENABLE) ||
+		    (reg == TEGRA_ADMAIF_TX_FIFO_CTRL) ||
+		    (reg == TEGRA_ADMAIF_TX_SOFT_RESET) ||
+		    (reg == TEGRA_ADMAIF_CH_ACIF_TX_CTRL))
+			return true;
+	} else if ((reg >= global_base) && (reg < reg_max)) {
+		if (reg == (global_base + TEGRA_ADMAIF_GLOBAL_ENABLE))
+			return true;
+	}
+
+	return false;
+}
+
+static bool tegra_admaif_rd_reg(struct device *dev, unsigned int reg)
+{
+	struct tegra_admaif *admaif = dev_get_drvdata(dev);
+	unsigned int ch_stride = TEGRA_ADMAIF_CHANNEL_REG_STRIDE;
+	unsigned int num_ch = admaif->soc_data->num_ch;
+	unsigned int rx_base = admaif->soc_data->rx_base;
+	unsigned int tx_base = admaif->soc_data->tx_base;
+	unsigned int global_base = admaif->soc_data->global_base;
+	unsigned int reg_max = admaif->soc_data->regmap_conf->max_register;
+	unsigned int rx_max = rx_base + (num_ch * ch_stride);
+	unsigned int tx_max = tx_base + (num_ch * ch_stride);
+
+	if ((reg >= rx_base) && (reg < rx_max)) {
+		reg = (reg - rx_base) % ch_stride;
+		if ((reg == TEGRA_ADMAIF_RX_ENABLE) ||
+		    (reg == TEGRA_ADMAIF_RX_STATUS) ||
+		    (reg == TEGRA_ADMAIF_RX_INT_STATUS) ||
+		    (reg == TEGRA_ADMAIF_RX_FIFO_CTRL) ||
+		    (reg == TEGRA_ADMAIF_RX_SOFT_RESET) ||
+		    (reg == TEGRA_ADMAIF_CH_ACIF_RX_CTRL))
+			return true;
+	} else if ((reg >= tx_base) && (reg < tx_max)) {
+		reg = (reg - tx_base) % ch_stride;
+		if ((reg == TEGRA_ADMAIF_TX_ENABLE) ||
+		    (reg == TEGRA_ADMAIF_TX_STATUS) ||
+		    (reg == TEGRA_ADMAIF_TX_INT_STATUS) ||
+		    (reg == TEGRA_ADMAIF_TX_FIFO_CTRL) ||
+		    (reg == TEGRA_ADMAIF_TX_SOFT_RESET) ||
+		    (reg == TEGRA_ADMAIF_CH_ACIF_TX_CTRL))
+			return true;
+	} else if ((reg >= global_base) && (reg < reg_max)) {
+		if ((reg == (global_base + TEGRA_ADMAIF_GLOBAL_ENABLE)) ||
+		    (reg == (global_base + TEGRA_ADMAIF_GLOBAL_CG_0)) ||
+		    (reg == (global_base + TEGRA_ADMAIF_GLOBAL_STATUS)) ||
+		    (reg == (global_base +
+				TEGRA_ADMAIF_GLOBAL_RX_ENABLE_STATUS)) ||
+		    (reg == (global_base +
+				TEGRA_ADMAIF_GLOBAL_TX_ENABLE_STATUS)))
+			return true;
+	}
+
+	return false;
+}
+
+static bool tegra_admaif_volatile_reg(struct device *dev, unsigned int reg)
+{
+	struct tegra_admaif *admaif = dev_get_drvdata(dev);
+	unsigned int ch_stride = TEGRA_ADMAIF_CHANNEL_REG_STRIDE;
+	unsigned int num_ch = admaif->soc_data->num_ch;
+	unsigned int rx_base = admaif->soc_data->rx_base;
+	unsigned int tx_base = admaif->soc_data->tx_base;
+	unsigned int global_base = admaif->soc_data->global_base;
+	unsigned int reg_max = admaif->soc_data->regmap_conf->max_register;
+	unsigned int rx_max = rx_base + (num_ch * ch_stride);
+	unsigned int tx_max = tx_base + (num_ch * ch_stride);
+
+	if ((reg >= rx_base) && (reg < rx_max)) {
+		reg = (reg - rx_base) % ch_stride;
+		if ((reg == TEGRA_ADMAIF_RX_ENABLE) ||
+		    (reg == TEGRA_ADMAIF_RX_STATUS) ||
+		    (reg == TEGRA_ADMAIF_RX_INT_STATUS) ||
+		    (reg == TEGRA_ADMAIF_RX_SOFT_RESET))
+			return true;
+	} else if ((reg >= tx_base) && (reg < tx_max)) {
+		reg = (reg - tx_base) % ch_stride;
+		if ((reg == TEGRA_ADMAIF_TX_ENABLE) ||
+		    (reg == TEGRA_ADMAIF_TX_STATUS) ||
+		    (reg == TEGRA_ADMAIF_TX_INT_STATUS) ||
+		    (reg == TEGRA_ADMAIF_TX_SOFT_RESET))
+			return true;
+	} else if ((reg >= global_base) && (reg < reg_max)) {
+		if ((reg == (global_base + TEGRA_ADMAIF_GLOBAL_STATUS)) ||
+		    (reg == (global_base +
+				TEGRA_ADMAIF_GLOBAL_RX_ENABLE_STATUS)) ||
+		    (reg == (global_base +
+				TEGRA_ADMAIF_GLOBAL_TX_ENABLE_STATUS)))
+			return true;
+	}
+
+	return false;
+}
+
+static const struct regmap_config tegra210_admaif_regmap_config = {
+	.reg_bits		= 32,
+	.reg_stride		= 4,
+	.val_bits		= 32,
+	.max_register		= TEGRA210_ADMAIF_LAST_REG,
+	.writeable_reg		= tegra_admaif_wr_reg,
+	.readable_reg		= tegra_admaif_rd_reg,
+	.volatile_reg		= tegra_admaif_volatile_reg,
+	.reg_defaults		= tegra210_admaif_reg_defaults,
+	.num_reg_defaults	= TEGRA210_ADMAIF_CHANNEL_COUNT * 6 + 1,
+	.cache_type		= REGCACHE_FLAT,
+};
+
+static const struct regmap_config tegra186_admaif_regmap_config = {
+	.reg_bits		= 32,
+	.reg_stride		= 4,
+	.val_bits		= 32,
+	.max_register		= TEGRA186_ADMAIF_LAST_REG,
+	.writeable_reg		= tegra_admaif_wr_reg,
+	.readable_reg		= tegra_admaif_rd_reg,
+	.volatile_reg		= tegra_admaif_volatile_reg,
+	.reg_defaults		= tegra186_admaif_reg_defaults,
+	.num_reg_defaults	= TEGRA186_ADMAIF_CHANNEL_COUNT * 6 + 1,
+	.cache_type		= REGCACHE_FLAT,
+};
+
+static int tegra_admaif_runtime_suspend(struct device *dev)
+{
+	struct tegra_admaif *admaif = dev_get_drvdata(dev);
+
+	regcache_cache_only(admaif->regmap, true);
+	regcache_mark_dirty(admaif->regmap);
+
+	return 0;
+}
+
+static int tegra_admaif_runtime_resume(struct device *dev)
+{
+	struct tegra_admaif *admaif = dev_get_drvdata(dev);
+
+	regcache_cache_only(admaif->regmap, false);
+	regcache_sync(admaif->regmap);
+
+	return 0;
+}
+
+static int tegra_admaif_set_pack_mode(struct regmap *map, unsigned int reg,
+				      int valid_bit)
+{
+	switch (valid_bit) {
+	case DATA_8BIT:
+		regmap_update_bits(map, reg, PACK8_EN_MASK, PACK8_EN);
+		regmap_update_bits(map, reg, PACK16_EN_MASK, 0);
+		break;
+	case DATA_16BIT:
+		regmap_update_bits(map, reg, PACK16_EN_MASK, PACK16_EN);
+		regmap_update_bits(map, reg, PACK8_EN_MASK, 0);
+		break;
+	case DATA_32BIT:
+		regmap_update_bits(map, reg, PACK16_EN_MASK, 0);
+		regmap_update_bits(map, reg, PACK8_EN_MASK, 0);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int tegra_admaif_hw_params(struct snd_pcm_substream *substream,
+				  struct snd_pcm_hw_params *params,
+				  struct snd_soc_dai *dai)
+{
+	struct device *dev = dai->dev;
+	struct tegra_admaif *admaif = snd_soc_dai_get_drvdata(dai);
+	struct tegra_cif_conf cif_conf;
+	unsigned int reg, path;
+	int valid_bit, channels;
+
+	memset(&cif_conf, 0, sizeof(struct tegra_cif_conf));
+
+	switch (params_format(params)) {
+	case SNDRV_PCM_FORMAT_S8:
+		cif_conf.audio_bits = TEGRA_ACIF_BITS_8;
+		cif_conf.client_bits = TEGRA_ACIF_BITS_8;
+		valid_bit = DATA_8BIT;
+		break;
+	case SNDRV_PCM_FORMAT_S16_LE:
+		cif_conf.audio_bits = TEGRA_ACIF_BITS_16;
+		cif_conf.client_bits = TEGRA_ACIF_BITS_16;
+		valid_bit = DATA_16BIT;
+		break;
+	case SNDRV_PCM_FORMAT_S32_LE:
+		cif_conf.audio_bits = TEGRA_ACIF_BITS_32;
+		cif_conf.client_bits = TEGRA_ACIF_BITS_32;
+		valid_bit  = DATA_32BIT;
+		break;
+	default:
+		dev_err(dev, "unsupported format!\n");
+		return -EOPNOTSUPP;
+	}
+
+	channels = params_channels(params);
+	cif_conf.client_ch = channels;
+	cif_conf.audio_ch = channels;
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		path = ADMAIF_TX_PATH;
+		reg = CH_TX_REG(TEGRA_ADMAIF_CH_ACIF_TX_CTRL, dai->id);
+	} else {
+		path = ADMAIF_RX_PATH;
+		reg = CH_RX_REG(TEGRA_ADMAIF_CH_ACIF_RX_CTRL, dai->id);
+	}
+
+	cif_conf.mono_conv = admaif->mono_to_stereo[path][dai->id];
+	cif_conf.stereo_conv = admaif->stereo_to_mono[path][dai->id];
+
+	tegra_admaif_set_pack_mode(admaif->regmap, reg, valid_bit);
+
+	tegra_set_cif(admaif->regmap, reg, &cif_conf);
+
+	return 0;
+}
+
+static int tegra_admaif_start(struct snd_soc_dai *dai, int direction)
+{
+	struct tegra_admaif *admaif = snd_soc_dai_get_drvdata(dai);
+	unsigned int reg, mask, val;
+
+	switch (direction) {
+	case SNDRV_PCM_STREAM_PLAYBACK:
+		mask = TX_ENABLE_MASK;
+		val = TX_ENABLE;
+		reg = CH_TX_REG(TEGRA_ADMAIF_TX_ENABLE, dai->id);
+		break;
+	case SNDRV_PCM_STREAM_CAPTURE:
+		mask = RX_ENABLE_MASK;
+		val = RX_ENABLE;
+		reg = CH_RX_REG(TEGRA_ADMAIF_RX_ENABLE, dai->id);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	regmap_update_bits(admaif->regmap, reg, mask, val);
+
+	return 0;
+}
+
+static int tegra_admaif_stop(struct snd_soc_dai *dai, int direction)
+{
+	struct tegra_admaif *admaif = snd_soc_dai_get_drvdata(dai);
+	unsigned int enable_reg, status_reg, reset_reg, mask, val;
+	char *dir_name;
+	int err, enable;
+
+	switch (direction) {
+	case SNDRV_PCM_STREAM_PLAYBACK:
+		mask = TX_ENABLE_MASK;
+		enable = TX_ENABLE;
+		dir_name = "TX";
+		enable_reg = CH_TX_REG(TEGRA_ADMAIF_TX_ENABLE, dai->id);
+		status_reg = CH_TX_REG(TEGRA_ADMAIF_TX_STATUS, dai->id);
+		reset_reg = CH_TX_REG(TEGRA_ADMAIF_TX_SOFT_RESET, dai->id);
+		break;
+	case SNDRV_PCM_STREAM_CAPTURE:
+		mask = RX_ENABLE_MASK;
+		enable = RX_ENABLE;
+		dir_name = "RX";
+		enable_reg = CH_RX_REG(TEGRA_ADMAIF_RX_ENABLE, dai->id);
+		status_reg = CH_RX_REG(TEGRA_ADMAIF_RX_STATUS, dai->id);
+		reset_reg = CH_RX_REG(TEGRA_ADMAIF_RX_SOFT_RESET, dai->id);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	/* Disable TX/RX channel */
+	regmap_update_bits(admaif->regmap, enable_reg, mask, ~enable);
+
+	/* Wait until ADMAIF TX/RX status is disabled */
+	err = regmap_read_poll_timeout_atomic(admaif->regmap, status_reg, val,
+					      !(val & enable), 10, 10000);
+	if (err < 0)
+		dev_warn(dai->dev, "timeout: failed to disable ADMAIF%d_%s\n",
+			 dai->id + 1, dir_name);
+
+	/* SW reset */
+	regmap_update_bits(admaif->regmap, reset_reg, SW_RESET_MASK, SW_RESET);
+
+	/* Wait till SW reset is complete */
+	err = regmap_read_poll_timeout_atomic(admaif->regmap, reset_reg, val,
+					      !(val & SW_RESET_MASK & SW_RESET),
+					      10, 10000);
+	if (err) {
+		dev_err(dai->dev, "timeout: SW reset failed for ADMAIF%d_%s\n",
+			dai->id + 1, dir_name);
+		return err;
+	}
+
+	return 0;
+}
+
+static int tegra_admaif_trigger(struct snd_pcm_substream *substream, int cmd,
+				struct snd_soc_dai *dai)
+{
+	int err;
+
+	err = snd_dmaengine_pcm_trigger(substream, cmd);
+	if (err)
+		return err;
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+	case SNDRV_PCM_TRIGGER_RESUME:
+		return tegra_admaif_start(dai, substream->stream);
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+		return tegra_admaif_stop(dai, substream->stream);
+	default:
+		return -EINVAL;
+	}
+}
+
+static const struct snd_soc_dai_ops tegra_admaif_dai_ops = {
+	.hw_params	= tegra_admaif_hw_params,
+	.trigger	= tegra_admaif_trigger,
+};
+
+static int tegra_admaif_get_control(struct snd_kcontrol *kcontrol,
+				    struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct soc_enum *ec = (struct soc_enum *)kcontrol->private_value;
+	struct tegra_admaif *admaif = snd_soc_component_get_drvdata(cmpnt);
+	long *uctl_val = &ucontrol->value.integer.value[0];
+
+	if (strstr(kcontrol->id.name, "Playback Mono To Stereo"))
+		*uctl_val = admaif->mono_to_stereo[ADMAIF_TX_PATH][ec->reg];
+	else if (strstr(kcontrol->id.name, "Capture Mono To Stereo"))
+		*uctl_val = admaif->mono_to_stereo[ADMAIF_RX_PATH][ec->reg];
+	else if (strstr(kcontrol->id.name, "Playback Stereo To Mono"))
+		*uctl_val = admaif->stereo_to_mono[ADMAIF_TX_PATH][ec->reg];
+	else if (strstr(kcontrol->id.name, "Capture Stereo To Mono"))
+		*uctl_val = admaif->stereo_to_mono[ADMAIF_RX_PATH][ec->reg];
+
+	return 0;
+}
+
+static int tegra_admaif_put_control(struct snd_kcontrol *kcontrol,
+				    struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct soc_enum *ec = (struct soc_enum *)kcontrol->private_value;
+	struct tegra_admaif *admaif = snd_soc_component_get_drvdata(cmpnt);
+	int value = ucontrol->value.integer.value[0];
+
+	if (strstr(kcontrol->id.name, "Playback Mono To Stereo"))
+		admaif->mono_to_stereo[ADMAIF_TX_PATH][ec->reg] = value;
+	else if (strstr(kcontrol->id.name, "Capture Mono To Stereo"))
+		admaif->mono_to_stereo[ADMAIF_RX_PATH][ec->reg] = value;
+	else if (strstr(kcontrol->id.name, "Playback Stereo To Mono"))
+		admaif->stereo_to_mono[ADMAIF_TX_PATH][ec->reg] = value;
+	else if (strstr(kcontrol->id.name, "Capture Stereo To Mono"))
+		admaif->stereo_to_mono[ADMAIF_RX_PATH][ec->reg] = value;
+
+	return 0;
+}
+
+static int tegra_admaif_dai_probe(struct snd_soc_dai *dai)
+{
+	struct tegra_admaif *admaif = snd_soc_dai_get_drvdata(dai);
+
+	dai->capture_dma_data = &admaif->capture_dma_data[dai->id];
+	dai->playback_dma_data = &admaif->playback_dma_data[dai->id];
+
+	return 0;
+}
+
+#define DAI(dai_name)					\
+	{							\
+		.name = dai_name,				\
+		.probe = tegra_admaif_dai_probe,		\
+		.playback = {					\
+			.stream_name = dai_name " Playback",	\
+			.channels_min = 1,			\
+			.channels_max = 16,			\
+			.rates = SNDRV_PCM_RATE_8000_192000,	\
+			.formats = SNDRV_PCM_FMTBIT_S8 |	\
+				SNDRV_PCM_FMTBIT_S16_LE |	\
+				SNDRV_PCM_FMTBIT_S32_LE,	\
+		},						\
+		.capture = {					\
+			.stream_name = dai_name " Capture",	\
+			.channels_min = 1,			\
+			.channels_max = 16,			\
+			.rates = SNDRV_PCM_RATE_8000_192000,	\
+			.formats = SNDRV_PCM_FMTBIT_S8 |	\
+				SNDRV_PCM_FMTBIT_S16_LE |	\
+				SNDRV_PCM_FMTBIT_S32_LE,	\
+		},						\
+		.ops = &tegra_admaif_dai_ops,			\
+	}
+
+static struct snd_soc_dai_driver tegra210_admaif_cmpnt_dais[] = {
+	DAI("ADMAIF1"),
+	DAI("ADMAIF2"),
+	DAI("ADMAIF3"),
+	DAI("ADMAIF4"),
+	DAI("ADMAIF5"),
+	DAI("ADMAIF6"),
+	DAI("ADMAIF7"),
+	DAI("ADMAIF8"),
+	DAI("ADMAIF9"),
+	DAI("ADMAIF10"),
+};
+
+static struct snd_soc_dai_driver tegra186_admaif_cmpnt_dais[] = {
+	DAI("ADMAIF1"),
+	DAI("ADMAIF2"),
+	DAI("ADMAIF3"),
+	DAI("ADMAIF4"),
+	DAI("ADMAIF5"),
+	DAI("ADMAIF6"),
+	DAI("ADMAIF7"),
+	DAI("ADMAIF8"),
+	DAI("ADMAIF9"),
+	DAI("ADMAIF10"),
+	DAI("ADMAIF11"),
+	DAI("ADMAIF12"),
+	DAI("ADMAIF13"),
+	DAI("ADMAIF14"),
+	DAI("ADMAIF15"),
+	DAI("ADMAIF16"),
+	DAI("ADMAIF17"),
+	DAI("ADMAIF18"),
+	DAI("ADMAIF19"),
+	DAI("ADMAIF20"),
+};
+
+static const char * const tegra_admaif_stereo_conv_text[] = {
+	"CH0", "CH1", "AVG",
+};
+
+static const char * const tegra_admaif_mono_conv_text[] = {
+	"Zero", "Copy",
+};
+
+/*
+ * Below macro is added to avoid looping over all ADMAIFx controls related
+ * to mono/stereo conversions in get()/put() callbacks.
+ */
+#define NV_SOC_ENUM_EXT(xname, xreg, xhandler_get, xhandler_put, xenum_text)   \
+{									       \
+	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,				       \
+	.info = snd_soc_info_enum_double,				       \
+	.name = xname,							       \
+	.get = xhandler_get,						       \
+	.put = xhandler_put,						       \
+	.private_value = (unsigned long)&(struct soc_enum)		       \
+		SOC_ENUM_SINGLE(xreg, 0, ARRAY_SIZE(xenum_text), xenum_text)   \
+}
+
+#define TEGRA_ADMAIF_CIF_CTRL(reg)					       \
+	NV_SOC_ENUM_EXT("ADMAIF" #reg " Playback Mono To Stereo", reg - 1,\
+			tegra_admaif_get_control, tegra_admaif_put_control,    \
+			tegra_admaif_mono_conv_text),			       \
+	NV_SOC_ENUM_EXT("ADMAIF" #reg " Playback Stereo To Mono", reg - 1,\
+			tegra_admaif_get_control, tegra_admaif_put_control,    \
+			tegra_admaif_stereo_conv_text),			       \
+	NV_SOC_ENUM_EXT("ADMAIF" #reg " Capture Mono To Stereo", reg - 1, \
+			tegra_admaif_get_control, tegra_admaif_put_control,    \
+			tegra_admaif_mono_conv_text),			       \
+	NV_SOC_ENUM_EXT("ADMAIF" #reg " Capture Stereo To Mono", reg - 1, \
+			tegra_admaif_get_control, tegra_admaif_put_control,    \
+			tegra_admaif_stereo_conv_text)
+
+static struct snd_kcontrol_new tegra210_admaif_controls[] = {
+	TEGRA_ADMAIF_CIF_CTRL(1),
+	TEGRA_ADMAIF_CIF_CTRL(2),
+	TEGRA_ADMAIF_CIF_CTRL(3),
+	TEGRA_ADMAIF_CIF_CTRL(4),
+	TEGRA_ADMAIF_CIF_CTRL(5),
+	TEGRA_ADMAIF_CIF_CTRL(6),
+	TEGRA_ADMAIF_CIF_CTRL(7),
+	TEGRA_ADMAIF_CIF_CTRL(8),
+	TEGRA_ADMAIF_CIF_CTRL(9),
+	TEGRA_ADMAIF_CIF_CTRL(10),
+};
+
+static struct snd_kcontrol_new tegra186_admaif_controls[] = {
+	TEGRA_ADMAIF_CIF_CTRL(1),
+	TEGRA_ADMAIF_CIF_CTRL(2),
+	TEGRA_ADMAIF_CIF_CTRL(3),
+	TEGRA_ADMAIF_CIF_CTRL(4),
+	TEGRA_ADMAIF_CIF_CTRL(5),
+	TEGRA_ADMAIF_CIF_CTRL(6),
+	TEGRA_ADMAIF_CIF_CTRL(7),
+	TEGRA_ADMAIF_CIF_CTRL(8),
+	TEGRA_ADMAIF_CIF_CTRL(9),
+	TEGRA_ADMAIF_CIF_CTRL(10),
+	TEGRA_ADMAIF_CIF_CTRL(11),
+	TEGRA_ADMAIF_CIF_CTRL(12),
+	TEGRA_ADMAIF_CIF_CTRL(13),
+	TEGRA_ADMAIF_CIF_CTRL(14),
+	TEGRA_ADMAIF_CIF_CTRL(15),
+	TEGRA_ADMAIF_CIF_CTRL(16),
+	TEGRA_ADMAIF_CIF_CTRL(17),
+	TEGRA_ADMAIF_CIF_CTRL(18),
+	TEGRA_ADMAIF_CIF_CTRL(19),
+	TEGRA_ADMAIF_CIF_CTRL(20),
+};
+
+static const struct snd_soc_component_driver tegra210_admaif_cmpnt = {
+	.controls		= tegra210_admaif_controls,
+	.num_controls		= ARRAY_SIZE(tegra210_admaif_controls),
+	.pcm_construct		= tegra_pcm_construct,
+	.pcm_destruct		= tegra_pcm_destruct,
+	.open			= tegra_pcm_open,
+	.close			= tegra_pcm_close,
+	.hw_params		= tegra_pcm_hw_params,
+	.hw_free		= tegra_pcm_hw_free,
+	.mmap			= tegra_pcm_mmap,
+	.pointer		= tegra_pcm_pointer,
+};
+
+static const struct snd_soc_component_driver tegra186_admaif_cmpnt = {
+	.controls		= tegra186_admaif_controls,
+	.num_controls		= ARRAY_SIZE(tegra186_admaif_controls),
+	.pcm_construct		= tegra_pcm_construct,
+	.pcm_destruct		= tegra_pcm_destruct,
+	.open			= tegra_pcm_open,
+	.close			= tegra_pcm_close,
+	.hw_params		= tegra_pcm_hw_params,
+	.hw_free		= tegra_pcm_hw_free,
+	.mmap			= tegra_pcm_mmap,
+	.pointer		= tegra_pcm_pointer,
+};
+
+static const struct tegra_admaif_soc_data soc_data_tegra210 = {
+	.num_ch		= TEGRA210_ADMAIF_CHANNEL_COUNT,
+	.cmpnt		= &tegra210_admaif_cmpnt,
+	.dais		= tegra210_admaif_cmpnt_dais,
+	.regmap_conf	= &tegra210_admaif_regmap_config,
+	.global_base	= TEGRA210_ADMAIF_GLOBAL_BASE,
+	.tx_base	= TEGRA210_ADMAIF_TX_BASE,
+	.rx_base	= TEGRA210_ADMAIF_RX_BASE,
+};
+
+static const struct tegra_admaif_soc_data soc_data_tegra186 = {
+	.num_ch		= TEGRA186_ADMAIF_CHANNEL_COUNT,
+	.cmpnt		= &tegra186_admaif_cmpnt,
+	.dais		= tegra186_admaif_cmpnt_dais,
+	.regmap_conf	= &tegra186_admaif_regmap_config,
+	.global_base	= TEGRA186_ADMAIF_GLOBAL_BASE,
+	.tx_base	= TEGRA186_ADMAIF_TX_BASE,
+	.rx_base	= TEGRA186_ADMAIF_RX_BASE,
+};
+
+static const struct of_device_id tegra_admaif_of_match[] = {
+	{ .compatible = "nvidia,tegra210-admaif", .data = &soc_data_tegra210 },
+	{ .compatible = "nvidia,tegra186-admaif", .data = &soc_data_tegra186 },
+	{},
+};
+MODULE_DEVICE_TABLE(of, tegra_admaif_of_match);
+
+static int tegra_admaif_probe(struct platform_device *pdev)
+{
+	struct tegra_admaif *admaif;
+	void __iomem *regs;
+	struct resource *res;
+	int err, i;
+
+	admaif = devm_kzalloc(&pdev->dev, sizeof(*admaif), GFP_KERNEL);
+	if (!admaif)
+		return -ENOMEM;
+
+	admaif->soc_data = of_device_get_match_data(&pdev->dev);
+
+	dev_set_drvdata(&pdev->dev, admaif);
+
+	admaif->capture_dma_data =
+		devm_kcalloc(&pdev->dev,
+			     admaif->soc_data->num_ch,
+			     sizeof(struct snd_dmaengine_dai_dma_data),
+			     GFP_KERNEL);
+	if (!admaif->capture_dma_data)
+		return -ENOMEM;
+
+	admaif->playback_dma_data =
+		devm_kcalloc(&pdev->dev,
+			     admaif->soc_data->num_ch,
+			     sizeof(struct snd_dmaengine_dai_dma_data),
+			     GFP_KERNEL);
+	if (!admaif->playback_dma_data)
+		return -ENOMEM;
+
+	for (i = 0; i < ADMAIF_PATHS; i++) {
+		admaif->mono_to_stereo[i] =
+			devm_kcalloc(&pdev->dev, admaif->soc_data->num_ch,
+				     sizeof(unsigned int), GFP_KERNEL);
+		if (!admaif->mono_to_stereo[i])
+			return -ENOMEM;
+
+		admaif->stereo_to_mono[i] =
+			devm_kcalloc(&pdev->dev, admaif->soc_data->num_ch,
+				     sizeof(unsigned int), GFP_KERNEL);
+		if (!admaif->stereo_to_mono[i])
+			return -ENOMEM;
+	}
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+
+	regs = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
+
+	admaif->regmap = devm_regmap_init_mmio(&pdev->dev, regs,
+					       admaif->soc_data->regmap_conf);
+	if (IS_ERR(admaif->regmap)) {
+		dev_err(&pdev->dev, "regmap init failed\n");
+		return PTR_ERR(admaif->regmap);
+	}
+
+	regcache_cache_only(admaif->regmap, true);
+
+	regmap_update_bits(admaif->regmap, admaif->soc_data->global_base +
+			   TEGRA_ADMAIF_GLOBAL_ENABLE, 1, 1);
+
+	for (i = 0; i < admaif->soc_data->num_ch; i++) {
+		admaif->playback_dma_data[i].addr = res->start +
+			CH_TX_REG(TEGRA_ADMAIF_TX_FIFO_WRITE, i);
+
+		admaif->capture_dma_data[i].addr = res->start +
+			CH_RX_REG(TEGRA_ADMAIF_RX_FIFO_READ, i);
+
+		admaif->playback_dma_data[i].addr_width = 32;
+
+		if (of_property_read_string_index(pdev->dev.of_node,
+				"dma-names", (i * 2) + 1,
+				&admaif->playback_dma_data[i].chan_name) < 0) {
+			dev_err(&pdev->dev,
+				"missing property nvidia,dma-names\n");
+
+			return -ENODEV;
+		}
+
+		admaif->capture_dma_data[i].addr_width = 32;
+
+		if (of_property_read_string_index(pdev->dev.of_node,
+				"dma-names",
+				(i * 2),
+				&admaif->capture_dma_data[i].chan_name) < 0) {
+			dev_err(&pdev->dev,
+				"missing property nvidia,dma-names\n");
+
+			return -ENODEV;
+		}
+	}
+
+	err = devm_snd_soc_register_component(&pdev->dev,
+					      admaif->soc_data->cmpnt,
+					      admaif->soc_data->dais,
+					      admaif->soc_data->num_ch);
+	if (err) {
+		dev_err(&pdev->dev,
+			"can't register ADMAIF component, err: %d\n", err);
+		return err;
+	}
+
+	pm_runtime_enable(&pdev->dev);
+
+	return 0;
+}
+
+static int tegra_admaif_remove(struct platform_device *pdev)
+{
+	pm_runtime_disable(&pdev->dev);
+
+	return 0;
+}
+
+static const struct dev_pm_ops tegra_admaif_pm_ops = {
+	SET_RUNTIME_PM_OPS(tegra_admaif_runtime_suspend,
+			   tegra_admaif_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
+};
+
+static struct platform_driver tegra_admaif_driver = {
+	.probe = tegra_admaif_probe,
+	.remove = tegra_admaif_remove,
+	.driver = {
+		.name = "tegra210-admaif",
+		.of_match_table = tegra_admaif_of_match,
+		.pm = &tegra_admaif_pm_ops,
+	},
+};
+module_platform_driver(tegra_admaif_driver);
+
+MODULE_AUTHOR("Songhee Baek <sbaek@nvidia.com>");
+MODULE_DESCRIPTION("Tegra210 ASoC ADMAIF driver");
+MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/tegra/tegra210_admaif.h b/sound/soc/tegra/tegra210_admaif.h
new file mode 100644
index 0000000..96686dc
--- /dev/null
+++ b/sound/soc/tegra/tegra210_admaif.h
@@ -0,0 +1,162 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * tegra210_admaif.h - Tegra ADMAIF registers
+ *
+ * Copyright (c) 2020 NVIDIA CORPORATION.  All rights reserved.
+ *
+ */
+
+#ifndef __TEGRA_ADMAIF_H__
+#define __TEGRA_ADMAIF_H__
+
+#define TEGRA_ADMAIF_CHANNEL_REG_STRIDE			0x40
+/* Tegra210 specific */
+#define TEGRA210_ADMAIF_LAST_REG			0x75f
+#define TEGRA210_ADMAIF_CHANNEL_COUNT			10
+#define TEGRA210_ADMAIF_RX_BASE				0x0
+#define TEGRA210_ADMAIF_TX_BASE				0x300
+#define TEGRA210_ADMAIF_GLOBAL_BASE			0x700
+/* Tegra186 specific */
+#define TEGRA186_ADMAIF_LAST_REG			0xd5f
+#define TEGRA186_ADMAIF_CHANNEL_COUNT			20
+#define TEGRA186_ADMAIF_RX_BASE				0x0
+#define TEGRA186_ADMAIF_TX_BASE				0x500
+#define TEGRA186_ADMAIF_GLOBAL_BASE			0xd00
+/* Global registers */
+#define TEGRA_ADMAIF_GLOBAL_ENABLE			0x0
+#define TEGRA_ADMAIF_GLOBAL_CG_0			0x8
+#define TEGRA_ADMAIF_GLOBAL_STATUS			0x10
+#define TEGRA_ADMAIF_GLOBAL_RX_ENABLE_STATUS		0x20
+#define TEGRA_ADMAIF_GLOBAL_TX_ENABLE_STATUS		0x24
+/* RX channel registers */
+#define TEGRA_ADMAIF_RX_ENABLE				0x0
+#define TEGRA_ADMAIF_RX_SOFT_RESET			0x4
+#define TEGRA_ADMAIF_RX_STATUS				0xc
+#define TEGRA_ADMAIF_RX_INT_STATUS			0x10
+#define TEGRA_ADMAIF_RX_INT_MASK			0x14
+#define TEGRA_ADMAIF_RX_INT_SET				0x18
+#define TEGRA_ADMAIF_RX_INT_CLEAR			0x1c
+#define TEGRA_ADMAIF_CH_ACIF_RX_CTRL			0x20
+#define TEGRA_ADMAIF_RX_FIFO_CTRL			0x28
+#define TEGRA_ADMAIF_RX_FIFO_READ			0x2c
+/* TX channel registers */
+#define TEGRA_ADMAIF_TX_ENABLE				0x0
+#define TEGRA_ADMAIF_TX_SOFT_RESET			0x4
+#define TEGRA_ADMAIF_TX_STATUS				0xc
+#define TEGRA_ADMAIF_TX_INT_STATUS			0x10
+#define TEGRA_ADMAIF_TX_INT_MASK			0x14
+#define TEGRA_ADMAIF_TX_INT_SET				0x18
+#define TEGRA_ADMAIF_TX_INT_CLEAR			0x1c
+#define TEGRA_ADMAIF_CH_ACIF_TX_CTRL			0x20
+#define TEGRA_ADMAIF_TX_FIFO_CTRL			0x28
+#define TEGRA_ADMAIF_TX_FIFO_WRITE			0x2c
+/* Bit fields */
+#define PACK8_EN_SHIFT					31
+#define PACK8_EN_MASK					BIT(PACK8_EN_SHIFT)
+#define PACK8_EN					BIT(PACK8_EN_SHIFT)
+#define PACK16_EN_SHIFT					30
+#define PACK16_EN_MASK					BIT(PACK16_EN_SHIFT)
+#define PACK16_EN					BIT(PACK16_EN_SHIFT)
+#define TX_ENABLE_SHIFT					0
+#define TX_ENABLE_MASK					BIT(TX_ENABLE_SHIFT)
+#define TX_ENABLE					BIT(TX_ENABLE_SHIFT)
+#define RX_ENABLE_SHIFT					0
+#define RX_ENABLE_MASK					BIT(RX_ENABLE_SHIFT)
+#define RX_ENABLE					BIT(RX_ENABLE_SHIFT)
+#define SW_RESET_MASK					1
+#define SW_RESET					1
+/* Default values - Tegra210 */
+#define TEGRA210_ADMAIF_RX1_FIFO_CTRL_REG_DEFAULT	0x00000300
+#define TEGRA210_ADMAIF_RX2_FIFO_CTRL_REG_DEFAULT	0x00000304
+#define TEGRA210_ADMAIF_RX3_FIFO_CTRL_REG_DEFAULT	0x00000208
+#define TEGRA210_ADMAIF_RX4_FIFO_CTRL_REG_DEFAULT	0x0000020b
+#define TEGRA210_ADMAIF_RX5_FIFO_CTRL_REG_DEFAULT	0x0000020e
+#define TEGRA210_ADMAIF_RX6_FIFO_CTRL_REG_DEFAULT	0x00000211
+#define TEGRA210_ADMAIF_RX7_FIFO_CTRL_REG_DEFAULT	0x00000214
+#define TEGRA210_ADMAIF_RX8_FIFO_CTRL_REG_DEFAULT	0x00000217
+#define TEGRA210_ADMAIF_RX9_FIFO_CTRL_REG_DEFAULT	0x0000021a
+#define TEGRA210_ADMAIF_RX10_FIFO_CTRL_REG_DEFAULT	0x0000021d
+#define TEGRA210_ADMAIF_TX1_FIFO_CTRL_REG_DEFAULT	0x02000300
+#define TEGRA210_ADMAIF_TX2_FIFO_CTRL_REG_DEFAULT	0x02000304
+#define TEGRA210_ADMAIF_TX3_FIFO_CTRL_REG_DEFAULT	0x01800208
+#define TEGRA210_ADMAIF_TX4_FIFO_CTRL_REG_DEFAULT	0x0180020b
+#define TEGRA210_ADMAIF_TX5_FIFO_CTRL_REG_DEFAULT	0x0180020e
+#define TEGRA210_ADMAIF_TX6_FIFO_CTRL_REG_DEFAULT	0x01800211
+#define TEGRA210_ADMAIF_TX7_FIFO_CTRL_REG_DEFAULT	0x01800214
+#define TEGRA210_ADMAIF_TX8_FIFO_CTRL_REG_DEFAULT	0x01800217
+#define TEGRA210_ADMAIF_TX9_FIFO_CTRL_REG_DEFAULT	0x0180021a
+#define TEGRA210_ADMAIF_TX10_FIFO_CTRL_REG_DEFAULT	0x0180021d
+/* Default values - Tegra186 */
+#define TEGRA186_ADMAIF_RX1_FIFO_CTRL_REG_DEFAULT	0x00000300
+#define TEGRA186_ADMAIF_RX2_FIFO_CTRL_REG_DEFAULT	0x00000304
+#define TEGRA186_ADMAIF_RX3_FIFO_CTRL_REG_DEFAULT	0x00000308
+#define TEGRA186_ADMAIF_RX4_FIFO_CTRL_REG_DEFAULT	0x0000030c
+#define TEGRA186_ADMAIF_RX5_FIFO_CTRL_REG_DEFAULT	0x00000210
+#define TEGRA186_ADMAIF_RX6_FIFO_CTRL_REG_DEFAULT	0x00000213
+#define TEGRA186_ADMAIF_RX7_FIFO_CTRL_REG_DEFAULT	0x00000216
+#define TEGRA186_ADMAIF_RX8_FIFO_CTRL_REG_DEFAULT	0x00000219
+#define TEGRA186_ADMAIF_RX9_FIFO_CTRL_REG_DEFAULT	0x0000021c
+#define TEGRA186_ADMAIF_RX10_FIFO_CTRL_REG_DEFAULT	0x0000021f
+#define TEGRA186_ADMAIF_RX11_FIFO_CTRL_REG_DEFAULT	0x00000222
+#define TEGRA186_ADMAIF_RX12_FIFO_CTRL_REG_DEFAULT	0x00000225
+#define TEGRA186_ADMAIF_RX13_FIFO_CTRL_REG_DEFAULT	0x00000228
+#define TEGRA186_ADMAIF_RX14_FIFO_CTRL_REG_DEFAULT	0x0000022b
+#define TEGRA186_ADMAIF_RX15_FIFO_CTRL_REG_DEFAULT	0x0000022e
+#define TEGRA186_ADMAIF_RX16_FIFO_CTRL_REG_DEFAULT	0x00000231
+#define TEGRA186_ADMAIF_RX17_FIFO_CTRL_REG_DEFAULT	0x00000234
+#define TEGRA186_ADMAIF_RX18_FIFO_CTRL_REG_DEFAULT	0x00000237
+#define TEGRA186_ADMAIF_RX19_FIFO_CTRL_REG_DEFAULT	0x0000023a
+#define TEGRA186_ADMAIF_RX20_FIFO_CTRL_REG_DEFAULT	0x0000023d
+#define TEGRA186_ADMAIF_TX1_FIFO_CTRL_REG_DEFAULT	0x02000300
+#define TEGRA186_ADMAIF_TX2_FIFO_CTRL_REG_DEFAULT	0x02000304
+#define TEGRA186_ADMAIF_TX3_FIFO_CTRL_REG_DEFAULT	0x02000308
+#define TEGRA186_ADMAIF_TX4_FIFO_CTRL_REG_DEFAULT	0x0200030c
+#define TEGRA186_ADMAIF_TX5_FIFO_CTRL_REG_DEFAULT	0x01800210
+#define TEGRA186_ADMAIF_TX6_FIFO_CTRL_REG_DEFAULT	0x01800213
+#define TEGRA186_ADMAIF_TX7_FIFO_CTRL_REG_DEFAULT	0x01800216
+#define TEGRA186_ADMAIF_TX8_FIFO_CTRL_REG_DEFAULT	0x01800219
+#define TEGRA186_ADMAIF_TX9_FIFO_CTRL_REG_DEFAULT	0x0180021c
+#define TEGRA186_ADMAIF_TX10_FIFO_CTRL_REG_DEFAULT	0x0180021f
+#define TEGRA186_ADMAIF_TX11_FIFO_CTRL_REG_DEFAULT	0x01800222
+#define TEGRA186_ADMAIF_TX12_FIFO_CTRL_REG_DEFAULT	0x01800225
+#define TEGRA186_ADMAIF_TX13_FIFO_CTRL_REG_DEFAULT	0x01800228
+#define TEGRA186_ADMAIF_TX14_FIFO_CTRL_REG_DEFAULT	0x0180022b
+#define TEGRA186_ADMAIF_TX15_FIFO_CTRL_REG_DEFAULT	0x0180022e
+#define TEGRA186_ADMAIF_TX16_FIFO_CTRL_REG_DEFAULT	0x01800231
+#define TEGRA186_ADMAIF_TX17_FIFO_CTRL_REG_DEFAULT	0x01800234
+#define TEGRA186_ADMAIF_TX18_FIFO_CTRL_REG_DEFAULT	0x01800237
+#define TEGRA186_ADMAIF_TX19_FIFO_CTRL_REG_DEFAULT	0x0180023a
+#define TEGRA186_ADMAIF_TX20_FIFO_CTRL_REG_DEFAULT	0x0180023d
+
+enum {
+	DATA_8BIT,
+	DATA_16BIT,
+	DATA_32BIT
+};
+
+enum {
+	ADMAIF_RX_PATH,
+	ADMAIF_TX_PATH,
+	ADMAIF_PATHS,
+};
+
+struct tegra_admaif_soc_data {
+	const struct snd_soc_component_driver *cmpnt;
+	const struct regmap_config *regmap_conf;
+	struct snd_soc_dai_driver *dais;
+	unsigned int global_base;
+	unsigned int tx_base;
+	unsigned int rx_base;
+	unsigned int num_ch;
+};
+
+struct tegra_admaif {
+	struct snd_dmaengine_dai_dma_data *capture_dma_data;
+	struct snd_dmaengine_dai_dma_data *playback_dma_data;
+	const struct tegra_admaif_soc_data *soc_data;
+	unsigned int *mono_to_stereo[ADMAIF_PATHS];
+	unsigned int *stereo_to_mono[ADMAIF_PATHS];
+	struct regmap *regmap;
+};
+
+#endif
diff --git a/sound/soc/tegra/tegra_pcm.c b/sound/soc/tegra/tegra_pcm.c
index f246df8..b3f3651 100644
--- a/sound/soc/tegra/tegra_pcm.c
+++ b/sound/soc/tegra/tegra_pcm.c
@@ -16,12 +16,12 @@
  */
 
 #include <linux/module.h>
+#include <linux/dma-mapping.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include <sound/dmaengine_pcm.h>
-
 #include "tegra_pcm.h"
 
 static const struct snd_pcm_hardware tegra_pcm_hardware = {
@@ -67,6 +67,239 @@ void tegra_pcm_platform_unregister(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(tegra_pcm_platform_unregister);
 
+int tegra_pcm_open(struct snd_soc_component *component,
+		   struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_dmaengine_dai_dma_data *dmap;
+	struct dma_chan *chan;
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	int ret;
+
+	if (rtd->dai_link->no_pcm)
+		return 0;
+
+	dmap = snd_soc_dai_get_dma_data(cpu_dai, substream);
+
+	/* Set HW params now that initialization is complete */
+	snd_soc_set_runtime_hwparams(substream, &tegra_pcm_hardware);
+
+	/* Ensure period size is multiple of 8 */
+	ret = snd_pcm_hw_constraint_step(substream->runtime, 0,
+					 SNDRV_PCM_HW_PARAM_PERIOD_BYTES, 0x8);
+	if (ret) {
+		dev_err(rtd->dev, "failed to set constraint %d\n", ret);
+		return ret;
+	}
+
+	chan = dma_request_slave_channel(cpu_dai->dev, dmap->chan_name);
+	if (!chan) {
+		dev_err(cpu_dai->dev,
+			"dmaengine request slave channel failed! (%s)\n",
+			dmap->chan_name);
+		return -ENODEV;
+	}
+
+	ret = snd_dmaengine_pcm_open(substream, chan);
+	if (ret) {
+		dev_err(rtd->dev,
+			"dmaengine pcm open failed with err %d (%s)\n", ret,
+			dmap->chan_name);
+
+		dma_release_channel(chan);
+
+		return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(tegra_pcm_open);
+
+int tegra_pcm_close(struct snd_soc_component *component,
+		    struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+
+	if (rtd->dai_link->no_pcm)
+		return 0;
+
+	snd_dmaengine_pcm_close_release_chan(substream);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(tegra_pcm_close);
+
+int tegra_pcm_hw_params(struct snd_soc_component *component,
+			struct snd_pcm_substream *substream,
+			struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_dmaengine_dai_dma_data *dmap;
+	struct dma_slave_config slave_config;
+	struct dma_chan *chan;
+	int ret;
+
+	if (rtd->dai_link->no_pcm)
+		return 0;
+
+	dmap = snd_soc_dai_get_dma_data(asoc_rtd_to_cpu(rtd, 0), substream);
+	if (!dmap)
+		return 0;
+
+	chan = snd_dmaengine_pcm_get_chan(substream);
+
+	ret = snd_hwparams_to_dma_slave_config(substream, params,
+					       &slave_config);
+	if (ret) {
+		dev_err(rtd->dev, "hw params config failed with err %d\n", ret);
+		return ret;
+	}
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		slave_config.dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
+		slave_config.dst_addr = dmap->addr;
+		slave_config.dst_maxburst = 8;
+	} else {
+		slave_config.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
+		slave_config.src_addr = dmap->addr;
+		slave_config.src_maxburst = 8;
+	}
+
+	ret = dmaengine_slave_config(chan, &slave_config);
+	if (ret < 0) {
+		dev_err(rtd->dev, "dma slave config failed with err %d\n", ret);
+		return ret;
+	}
+
+	snd_pcm_set_runtime_buffer(substream, &substream->dma_buffer);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(tegra_pcm_hw_params);
+
+int tegra_pcm_hw_free(struct snd_soc_component *component,
+		      struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+
+	if (rtd->dai_link->no_pcm)
+		return 0;
+
+	snd_pcm_set_runtime_buffer(substream, NULL);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(tegra_pcm_hw_free);
+
+int tegra_pcm_mmap(struct snd_soc_component *component,
+		   struct snd_pcm_substream *substream,
+		   struct vm_area_struct *vma)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_pcm_runtime *runtime = substream->runtime;
+
+	if (rtd->dai_link->no_pcm)
+		return 0;
+
+	return dma_mmap_wc(substream->pcm->card->dev, vma, runtime->dma_area,
+			   runtime->dma_addr, runtime->dma_bytes);
+}
+EXPORT_SYMBOL_GPL(tegra_pcm_mmap);
+
+snd_pcm_uframes_t tegra_pcm_pointer(struct snd_soc_component *component,
+				    struct snd_pcm_substream *substream)
+{
+	return snd_dmaengine_pcm_pointer(substream);
+}
+EXPORT_SYMBOL_GPL(tegra_pcm_pointer);
+
+static int tegra_pcm_preallocate_dma_buffer(struct snd_pcm *pcm, int stream,
+					    size_t size)
+{
+	struct snd_pcm_substream *substream = pcm->streams[stream].substream;
+	struct snd_dma_buffer *buf = &substream->dma_buffer;
+
+	buf->area = dma_alloc_wc(pcm->card->dev, size, &buf->addr, GFP_KERNEL);
+	if (!buf->area)
+		return -ENOMEM;
+
+	buf->private_data = NULL;
+	buf->dev.type = SNDRV_DMA_TYPE_DEV;
+	buf->dev.dev = pcm->card->dev;
+	buf->bytes = size;
+
+	return 0;
+}
+
+static void tegra_pcm_deallocate_dma_buffer(struct snd_pcm *pcm, int stream)
+{
+	struct snd_pcm_substream *substream;
+	struct snd_dma_buffer *buf;
+
+	substream = pcm->streams[stream].substream;
+	if (!substream)
+		return;
+
+	buf = &substream->dma_buffer;
+	if (!buf->area)
+		return;
+
+	dma_free_wc(pcm->card->dev, buf->bytes, buf->area, buf->addr);
+	buf->area = NULL;
+}
+
+static int tegra_pcm_dma_allocate(struct snd_soc_pcm_runtime *rtd,
+				  size_t size)
+{
+	struct snd_card *card = rtd->card->snd_card;
+	struct snd_pcm *pcm = rtd->pcm;
+	int ret;
+
+	ret = dma_set_mask(card->dev, DMA_BIT_MASK(32));
+	if (ret < 0)
+		return ret;
+
+	ret = dma_set_coherent_mask(card->dev, DMA_BIT_MASK(32));
+	if (ret < 0)
+		return ret;
+
+	if (pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream) {
+		ret = tegra_pcm_preallocate_dma_buffer(pcm,
+			SNDRV_PCM_STREAM_PLAYBACK, size);
+		if (ret)
+			goto err;
+	}
+
+	if (pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream) {
+		ret = tegra_pcm_preallocate_dma_buffer(pcm,
+			SNDRV_PCM_STREAM_CAPTURE, size);
+		if (ret)
+			goto err_free_play;
+	}
+
+	return 0;
+
+err_free_play:
+	tegra_pcm_deallocate_dma_buffer(pcm, SNDRV_PCM_STREAM_PLAYBACK);
+err:
+	return ret;
+}
+
+int tegra_pcm_construct(struct snd_soc_component *component,
+			struct snd_soc_pcm_runtime *rtd)
+{
+	return tegra_pcm_dma_allocate(rtd, tegra_pcm_hardware.buffer_bytes_max);
+}
+EXPORT_SYMBOL_GPL(tegra_pcm_construct);
+
+void tegra_pcm_destruct(struct snd_soc_component *component,
+			struct snd_pcm *pcm)
+{
+	tegra_pcm_deallocate_dma_buffer(pcm, SNDRV_PCM_STREAM_CAPTURE);
+	tegra_pcm_deallocate_dma_buffer(pcm, SNDRV_PCM_STREAM_PLAYBACK);
+}
+EXPORT_SYMBOL_GPL(tegra_pcm_destruct);
+
 MODULE_AUTHOR("Stephen Warren <swarren@nvidia.com>");
 MODULE_DESCRIPTION("Tegra PCM ASoC driver");
 MODULE_LICENSE("GPL");
diff --git a/sound/soc/tegra/tegra_pcm.h b/sound/soc/tegra/tegra_pcm.h
index 0433372..4838cdc 100644
--- a/sound/soc/tegra/tegra_pcm.h
+++ b/sound/soc/tegra/tegra_pcm.h
@@ -17,8 +17,27 @@
 #ifndef __TEGRA_PCM_H__
 #define __TEGRA_PCM_H__
 
-struct snd_dmaengine_pcm_config;
+#include <sound/dmaengine_pcm.h>
+#include <sound/asound.h>
 
+int tegra_pcm_construct(struct snd_soc_component *component,
+			struct snd_soc_pcm_runtime *rtd);
+void tegra_pcm_destruct(struct snd_soc_component *component,
+			struct snd_pcm *pcm);
+int tegra_pcm_open(struct snd_soc_component *component,
+		   struct snd_pcm_substream *substream);
+int tegra_pcm_close(struct snd_soc_component *component,
+		    struct snd_pcm_substream *substream);
+int tegra_pcm_hw_params(struct snd_soc_component *component,
+			struct snd_pcm_substream *substream,
+			struct snd_pcm_hw_params *params);
+int tegra_pcm_hw_free(struct snd_soc_component *component,
+		      struct snd_pcm_substream *substream);
+int tegra_pcm_mmap(struct snd_soc_component *component,
+		   struct snd_pcm_substream *substream,
+		   struct vm_area_struct *vma);
+snd_pcm_uframes_t tegra_pcm_pointer(struct snd_soc_component *component,
+				    struct snd_pcm_substream *substream);
 int tegra_pcm_platform_register(struct device *dev);
 int tegra_pcm_platform_register_with_chan_names(struct device *dev,
 				struct snd_dmaengine_pcm_config *config,
-- 
2.7.4


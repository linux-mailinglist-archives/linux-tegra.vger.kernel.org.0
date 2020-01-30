Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7754614D900
	for <lists+linux-tegra@lfdr.de>; Thu, 30 Jan 2020 11:34:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726873AbgA3KeX (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 30 Jan 2020 05:34:23 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:13036 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726885AbgA3KeX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 30 Jan 2020 05:34:23 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e32b11e0000>; Thu, 30 Jan 2020 02:34:06 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 30 Jan 2020 02:34:20 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 30 Jan 2020 02:34:20 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 30 Jan
 2020 10:34:20 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 30 Jan 2020 10:34:20 +0000
Received: from audio.nvidia.com (Not Verified[10.24.34.185]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5e32b1270000>; Thu, 30 Jan 2020 02:34:19 -0800
From:   Sameer Pujar <spujar@nvidia.com>
To:     <perex@perex.cz>, <tiwai@suse.com>, <robh+dt@kernel.org>
CC:     <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <digetx@gmail.com>, <alsa-devel@alsa-project.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <sharadg@nvidia.com>,
        <mkumard@nvidia.com>, <viswanathl@nvidia.com>,
        <rlokhande@nvidia.com>, <dramesh@nvidia.com>,
        <atalambedu@nvidia.com>, Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH v2 3/9] ASoC: tegra: add Tegra210 based DMIC driver
Date:   Thu, 30 Jan 2020 16:03:36 +0530
Message-ID: <1580380422-3431-4-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1580380422-3431-1-git-send-email-spujar@nvidia.com>
References: <1580380422-3431-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1580380446; bh=XjalcuxPa50jlUM4WuXBq+KHQIlqtVnMRbZwI5FXz3Y=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:Content-Type;
        b=MY4TjOkcSOSakQR0PTc8wCeJPBiXnapcWLQ0Pz+Vn+04e0+x918BGkSPTIwUUrQSq
         X2x6pASlXf4PnqV18Aucr9L4tdseaLISLfLsOaNHVG+P/KCvPlNBw7OrOhUTETYNMk
         tIpPhoXzvHICn5ucqObnFcoF9fJto3GGa8pXrbWmEkdL4kW0heHI3pDguXVPkcuoqH
         FAYsDD4unQ4emDBufi/RzjA9EXvZEDN56ZHHrL33qFH50PvglGQFEOGmrL/uSUF4yV
         8cCYybTXQNLLKdffNqlrvqwTbTfsOO/OXovqwp2s0GhO7rcr6L8g0ZseVA4JzNjGrk
         MS14sxh445S0g==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The Digital MIC (DMIC) Controller is used to interface with Pulse Density
Modulation (PDM) input devices. The DMIC controller implements a converter
to convert PDM signals to Pulse Code Modulation (PCM) signals. From signal
flow perspective, the DMIC can be viewed as a PDM receiver.

This patch registers DMIC component with ASoC framework. The component
driver exposes DAPM widgets, routes and kcontrols for the device. The DAI
driver exposes DMIC interfaces, which can be used to connect different
components in the ASoC layer. Makefile and Kconfig support is added to
allow to build the driver. The DMIC devices can be enabled in the DT via
"nvidia,tegra210-dmic" compatible string. This driver can be used for
Tegra186 and Tegra194 chips as well.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/soc/tegra/Kconfig         |  11 +
 sound/soc/tegra/Makefile        |   2 +
 sound/soc/tegra/tegra210_dmic.c | 517 ++++++++++++++++++++++++++++++++++++++++
 sound/soc/tegra/tegra210_dmic.h |  85 +++++++
 4 files changed, 615 insertions(+)
 create mode 100644 sound/soc/tegra/tegra210_dmic.c
 create mode 100644 sound/soc/tegra/tegra210_dmic.h

diff --git a/sound/soc/tegra/Kconfig b/sound/soc/tegra/Kconfig
index addadc8..2bde1e6 100644
--- a/sound/soc/tegra/Kconfig
+++ b/sound/soc/tegra/Kconfig
@@ -62,6 +62,17 @@ config SND_SOC_TEGRA30_I2S
 	  Tegra30 I2S interface. You will also need to select the individual
 	  machine drivers to support below.
 
+config SND_SOC_TEGRA210_DMIC
+        tristate "Tegra210 DMIC module"
+        depends on SND_SOC_TEGRA
+        help
+          Config to enable the Digital MIC (DMIC) controller which is used
+          to interface with Pulse Density Modulation (PDM) input devices.
+          The DMIC controller implements a converter to convert PDM signals
+          to Pulse Code Modulation (PCM) signals. This can be viewed as a
+          PDM receiver.
+          Say Y or M if you want to add support for Tegra210 DMIC module.
+
 config SND_SOC_TEGRA_RT5640
 	tristate "SoC Audio support for Tegra boards using an RT5640 codec"
 	depends on SND_SOC_TEGRA && I2C && GPIOLIB
diff --git a/sound/soc/tegra/Makefile b/sound/soc/tegra/Makefile
index 261aa21..9e78fe4 100644
--- a/sound/soc/tegra/Makefile
+++ b/sound/soc/tegra/Makefile
@@ -9,6 +9,7 @@ snd-soc-tegra20-spdif-objs := tegra20_spdif.o
 snd-soc-tegra30-ahub-objs := tegra30_ahub.o
 snd-soc-tegra30-i2s-objs := tegra30_i2s.o
 snd-soc-tegra-cif-objs := tegra_cif.o
+snd-soc-tegra210-dmic-objs := tegra210_dmic.o
 
 obj-$(CONFIG_SND_SOC_TEGRA) += snd-soc-tegra-pcm.o
 obj-$(CONFIG_SND_SOC_TEGRA) += snd-soc-tegra-utils.o
@@ -19,6 +20,7 @@ obj-$(CONFIG_SND_SOC_TEGRA20_I2S) += snd-soc-tegra20-i2s.o
 obj-$(CONFIG_SND_SOC_TEGRA20_SPDIF) += snd-soc-tegra20-spdif.o
 obj-$(CONFIG_SND_SOC_TEGRA30_AHUB) += snd-soc-tegra30-ahub.o
 obj-$(CONFIG_SND_SOC_TEGRA30_I2S) += snd-soc-tegra30-i2s.o
+obj-$(CONFIG_SND_SOC_TEGRA210_DMIC) += snd-soc-tegra210-dmic.o
 
 # Tegra machine Support
 snd-soc-tegra-rt5640-objs := tegra_rt5640.o
diff --git a/sound/soc/tegra/tegra210_dmic.c b/sound/soc/tegra/tegra210_dmic.c
new file mode 100644
index 0000000..48eab54
--- /dev/null
+++ b/sound/soc/tegra/tegra210_dmic.c
@@ -0,0 +1,517 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * tegra210_dmic.c - Tegra210 DMIC driver
+ *
+ * Copyright (c) 2020 NVIDIA CORPORATION.  All rights reserved.
+ *
+ */
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <sound/core.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include "tegra210_dmic.h"
+#include "tegra_cif.h"
+
+static const struct reg_default tegra210_dmic_reg_defaults[] = {
+	{ TEGRA210_DMIC_TX_INT_MASK, 0x00000001},
+	{ TEGRA210_DMIC_TX_CIF_CTRL, 0x00007700},
+	{ TEGRA210_DMIC_CG, 0x1},
+	{ TEGRA210_DMIC_CTRL, 0x00000301},
+	/* Below enables all filters - DCR, LP and SC */
+	{ TEGRA210_DMIC_DBG_CTRL, 0xe },
+	/* Below as per latest POR value */
+	{ TEGRA210_DMIC_DCR_BIQUAD_0_COEF_4, 0x0},
+	/* LP filter is configured for pass through and used to apply gain */
+	{ TEGRA210_DMIC_LP_BIQUAD_0_COEF_0, 0x00800000},
+	{ TEGRA210_DMIC_LP_BIQUAD_0_COEF_1, 0x0},
+	{ TEGRA210_DMIC_LP_BIQUAD_0_COEF_2, 0x0},
+	{ TEGRA210_DMIC_LP_BIQUAD_0_COEF_3, 0x0},
+	{ TEGRA210_DMIC_LP_BIQUAD_0_COEF_4, 0x0},
+	{ TEGRA210_DMIC_LP_BIQUAD_1_COEF_0, 0x00800000},
+	{ TEGRA210_DMIC_LP_BIQUAD_1_COEF_1, 0x0},
+	{ TEGRA210_DMIC_LP_BIQUAD_1_COEF_2, 0x0},
+	{ TEGRA210_DMIC_LP_BIQUAD_1_COEF_3, 0x0},
+	{ TEGRA210_DMIC_LP_BIQUAD_1_COEF_4, 0x0},
+};
+
+static int tegra210_dmic_runtime_suspend(struct device *dev)
+{
+	struct tegra210_dmic *dmic = dev_get_drvdata(dev);
+
+	regcache_cache_only(dmic->regmap, true);
+	regcache_mark_dirty(dmic->regmap);
+
+	clk_disable_unprepare(dmic->clk_dmic);
+
+	return 0;
+}
+
+static int tegra210_dmic_runtime_resume(struct device *dev)
+{
+	struct tegra210_dmic *dmic = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_prepare_enable(dmic->clk_dmic);
+	if (ret) {
+		dev_err(dev, "failed to enable DMIC clock, err: %d\n", ret);
+		return ret;
+	}
+
+	regcache_cache_only(dmic->regmap, false);
+	regcache_sync(dmic->regmap);
+
+	return 0;
+}
+
+static const int tegra210_dmic_fmts[] = {
+	0,
+	TEGRA_ACIF_BITS_16,
+	TEGRA_ACIF_BITS_32,
+};
+
+static int tegra210_dmic_hw_params(struct snd_pcm_substream *substream,
+				   struct snd_pcm_hw_params *params,
+				   struct snd_soc_dai *dai)
+{
+	struct tegra210_dmic *dmic = snd_soc_dai_get_drvdata(dai);
+	unsigned int srate, clk_rate, channels;
+	struct tegra_cif_conf cif_conf;
+	unsigned long long gain_q23 = DEFAULT_GAIN_Q23;
+	int ret;
+
+	memset(&cif_conf, 0, sizeof(struct tegra_cif_conf));
+
+	channels = params_channels(params);
+
+	cif_conf.audio_ch = channels;
+	if (dmic->audio_ch_override)
+		cif_conf.audio_ch = dmic->audio_ch_override;
+
+	switch (dmic->ch_select) {
+	case DMIC_CH_SELECT_LEFT:
+	case DMIC_CH_SELECT_RIGHT:
+		cif_conf.client_ch = 1;
+		break;
+	case DMIC_CH_SELECT_STEREO:
+		cif_conf.client_ch = 2;
+		break;
+	default:
+		dev_err(dai->dev, "invalid DMIC client channels\n");
+		return -EINVAL;
+	}
+
+	srate = params_rate(params);
+	if (dmic->srate_override)
+		srate = dmic->srate_override;
+
+	/*
+	 * DMIC clock rate is a multiple of 'Over Sampling Ratio' and
+	 * 'Sample Rate'. The supported OSR values are 64, 128 and 256.
+	 */
+	clk_rate = (DMIC_OSR_FACTOR << dmic->osr_val) * srate;
+
+	ret = clk_set_rate(dmic->clk_dmic, clk_rate);
+	if (ret) {
+		dev_err(dai->dev, "can't set DMIC clock rate %u, err: %d\n",
+			clk_rate, ret);
+		return ret;
+	}
+
+	regmap_update_bits(dmic->regmap,
+			   /* Reg */
+			   TEGRA210_DMIC_CTRL,
+			   /* Mask */
+			   TEGRA210_DMIC_CTRL_LRSEL_POLARITY_MASK |
+			   TEGRA210_DMIC_CTRL_OSR_MASK |
+			   TEGRA210_DMIC_CTRL_CHANNEL_SELECT_MASK,
+			   /* Value */
+			   (dmic->lrsel << LRSEL_POL_SHIFT) |
+			   (dmic->osr_val << OSR_SHIFT) |
+			   ((dmic->ch_select + 1) << CH_SEL_SHIFT));
+
+	/*
+	 * Use LP filter gain register to apply boost.
+	 * Boost Gain control has 100x factor.
+	 */
+	if (dmic->boost_gain)
+		gain_q23 = (gain_q23 * dmic->boost_gain) / 100;
+
+	regmap_write(dmic->regmap, TEGRA210_DMIC_LP_FILTER_GAIN,
+		     (unsigned int)gain_q23);
+
+	switch (params_format(params)) {
+	case SNDRV_PCM_FORMAT_S16_LE:
+		cif_conf.audio_bits = TEGRA_ACIF_BITS_16;
+		break;
+	case SNDRV_PCM_FORMAT_S32_LE:
+		cif_conf.audio_bits = TEGRA_ACIF_BITS_32;
+		break;
+	default:
+		dev_err(dai->dev, "unsupported format!\n");
+		return -ENOTSUPP;
+	}
+
+	if (dmic->audio_bits_override)
+		cif_conf.audio_bits =
+			tegra210_dmic_fmts[dmic->audio_bits_override];
+
+	cif_conf.client_bits = TEGRA_ACIF_BITS_24;
+	cif_conf.mono_conv = dmic->mono_to_stereo;
+	cif_conf.stereo_conv = dmic->stereo_to_mono;
+
+	tegra_set_cif(dmic->regmap, TEGRA210_DMIC_TX_CIF_CTRL, &cif_conf);
+
+	return 0;
+}
+
+static int tegra210_dmic_get_control(struct snd_kcontrol *kcontrol,
+				     struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct tegra210_dmic *dmic = snd_soc_component_get_drvdata(comp);
+
+	if (strstr(kcontrol->id.name, "Boost Gain"))
+		ucontrol->value.integer.value[0] = dmic->boost_gain;
+	else if (strstr(kcontrol->id.name, "Channel Select"))
+		ucontrol->value.integer.value[0] = dmic->ch_select;
+	else if (strstr(kcontrol->id.name, "Mono To Stereo"))
+		ucontrol->value.integer.value[0] = dmic->mono_to_stereo;
+	else if (strstr(kcontrol->id.name, "Stereo To Mono"))
+		ucontrol->value.integer.value[0] = dmic->stereo_to_mono;
+	else if (strstr(kcontrol->id.name, "Audio Bit Format"))
+		ucontrol->value.integer.value[0] = dmic->audio_bits_override;
+	else if (strstr(kcontrol->id.name, "Sample Rate"))
+		ucontrol->value.integer.value[0] = dmic->srate_override;
+	else if (strstr(kcontrol->id.name, "Audio Channels"))
+		ucontrol->value.integer.value[0] = dmic->audio_ch_override;
+	else if (strstr(kcontrol->id.name, "OSR Value"))
+		ucontrol->value.integer.value[0] = dmic->osr_val;
+	else if (strstr(kcontrol->id.name, "LR Polarity Select"))
+		ucontrol->value.integer.value[0] = dmic->lrsel;
+
+	return 0;
+}
+
+static int tegra210_dmic_put_control(struct snd_kcontrol *kcontrol,
+				     struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct tegra210_dmic *dmic = snd_soc_component_get_drvdata(comp);
+	int value = ucontrol->value.integer.value[0];
+
+	if (strstr(kcontrol->id.name, "Boost Gain"))
+		dmic->boost_gain = value;
+	else if (strstr(kcontrol->id.name, "Channel Select"))
+		dmic->ch_select = ucontrol->value.integer.value[0];
+	else if (strstr(kcontrol->id.name, "Mono To Stereo"))
+		dmic->mono_to_stereo = value;
+	else if (strstr(kcontrol->id.name, "Stereo To Mono"))
+		dmic->stereo_to_mono = value;
+	else if (strstr(kcontrol->id.name, "Audio Bit Format"))
+		dmic->audio_bits_override = value;
+	else if (strstr(kcontrol->id.name, "Sample Rate"))
+		dmic->srate_override = value;
+	else if (strstr(kcontrol->id.name, "Audio Channels"))
+		dmic->audio_ch_override = value;
+	else if (strstr(kcontrol->id.name, "OSR Value"))
+		dmic->osr_val = value;
+	else if (strstr(kcontrol->id.name, "LR Polarity Select"))
+		dmic->lrsel = value;
+
+	return 0;
+}
+
+static const struct snd_soc_dai_ops tegra210_dmic_dai_ops = {
+	.hw_params	= tegra210_dmic_hw_params,
+};
+
+/*
+ * Three DAIs are exposed
+ * 1. "CIF" DAI for connecting with XBAR
+ * 2. "DAP" DAI for connecting with CODEC
+ * 3. "DUMMY_SOURCE" can be used when no external
+ *    codec connection is available. In such case
+ *    "DAP" is connected with "DUMMY_SOURCE"
+ */
+static struct snd_soc_dai_driver tegra210_dmic_dais[] = {
+	{
+		.name = "CIF",
+		.capture = {
+			.stream_name = "DMIC Transmit",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = SNDRV_PCM_RATE_8000_48000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |
+				   SNDRV_PCM_FMTBIT_S32_LE,
+		},
+		.ops = &tegra210_dmic_dai_ops,
+		.symmetric_rates = 1,
+	},
+	{
+		.name = "DAP",
+		.playback = {
+			.stream_name = "DMIC Receive",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = SNDRV_PCM_RATE_8000_48000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |
+				   SNDRV_PCM_FMTBIT_S32_LE,
+		},
+	},
+	{
+		.name = "DUMMY_SOURCE",
+		.capture = {
+			.stream_name = "Dummy Capture",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = SNDRV_PCM_RATE_8000_48000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |
+				   SNDRV_PCM_FMTBIT_S32_LE,
+		},
+	}
+};
+
+static const struct snd_soc_dapm_widget tegra210_dmic_widgets[] = {
+	SND_SOC_DAPM_AIF_IN("DMIC TX", NULL, 0, TEGRA210_DMIC_ENABLE, 0, 0),
+	SND_SOC_DAPM_MIC("Dummy Input", NULL),
+};
+
+static const struct snd_soc_dapm_route tegra210_dmic_routes[] = {
+	{ "DMIC TX",	   NULL, "DMIC Receive" },
+	{ "DMIC Transmit", NULL, "DMIC TX" },
+	{ "Dummy Capture", NULL, "Dummy Input" },
+};
+
+static const char * const tegra210_dmic_ch_select[] = {
+	"Left", "Right", "Stereo",
+};
+
+static const struct soc_enum tegra210_dmic_ch_enum =
+	SOC_ENUM_SINGLE(0, 0, ARRAY_SIZE(tegra210_dmic_ch_select),
+			tegra210_dmic_ch_select);
+
+static const char * const tegra210_dmic_mono_conv_text[] = {
+	"ZERO", "COPY",
+};
+
+static const char * const tegra210_dmic_stereo_conv_text[] = {
+	"CH0", "CH1", "AVG",
+};
+
+static const struct soc_enum tegra210_dmic_mono_conv_enum =
+	SOC_ENUM_SINGLE(0, 0, ARRAY_SIZE(tegra210_dmic_mono_conv_text),
+			tegra210_dmic_mono_conv_text);
+
+static const struct soc_enum tegra210_dmic_stereo_conv_enum =
+	SOC_ENUM_SINGLE(0, 0, ARRAY_SIZE(tegra210_dmic_stereo_conv_text),
+			tegra210_dmic_stereo_conv_text);
+
+static const char * const tegra210_dmic_format_text[] = {
+	"None",
+	"16",
+	"32",
+};
+
+static const struct soc_enum tegra210_dmic_format_enum =
+	SOC_ENUM_SINGLE(0, 0, ARRAY_SIZE(tegra210_dmic_format_text),
+			tegra210_dmic_format_text);
+
+static const char * const tegra210_dmic_osr_text[] = {
+	"OSR_64", "OSR_128", "OSR_256",
+};
+
+static const struct soc_enum tegra210_dmic_osr_enum =
+	SOC_ENUM_SINGLE(0, 0, ARRAY_SIZE(tegra210_dmic_osr_text),
+			tegra210_dmic_osr_text);
+
+static const char * const tegra210_dmic_lrsel_text[] = {
+	"Left", "Right",
+};
+
+static const struct soc_enum tegra210_dmic_lrsel_enum =
+	SOC_ENUM_SINGLE(0, 0, ARRAY_SIZE(tegra210_dmic_lrsel_text),
+			tegra210_dmic_lrsel_text);
+
+static const struct snd_kcontrol_new tegra210_dmic_controls[] = {
+	SOC_SINGLE_EXT("Boost Gain", 0, 0, MAX_BOOST_GAIN, 0,
+		       tegra210_dmic_get_control, tegra210_dmic_put_control),
+	SOC_ENUM_EXT("Channel Select", tegra210_dmic_ch_enum,
+		     tegra210_dmic_get_control, tegra210_dmic_put_control),
+	SOC_ENUM_EXT("Mono To Stereo",
+		     tegra210_dmic_mono_conv_enum, tegra210_dmic_get_control,
+		     tegra210_dmic_put_control),
+	SOC_ENUM_EXT("Stereo To Mono",
+		     tegra210_dmic_stereo_conv_enum, tegra210_dmic_get_control,
+		     tegra210_dmic_put_control),
+	SOC_ENUM_EXT("Audio Bit Format", tegra210_dmic_format_enum,
+		     tegra210_dmic_get_control, tegra210_dmic_put_control),
+	SOC_SINGLE_EXT("Sample Rate", 0, 0, 48000, 0, tegra210_dmic_get_control,
+		       tegra210_dmic_put_control),
+	SOC_SINGLE_EXT("Audio Channels", 0, 0, 2, 0, tegra210_dmic_get_control,
+		       tegra210_dmic_put_control),
+	SOC_ENUM_EXT("OSR Value", tegra210_dmic_osr_enum,
+		     tegra210_dmic_get_control, tegra210_dmic_put_control),
+	SOC_ENUM_EXT("LR Polarity Select", tegra210_dmic_lrsel_enum,
+		     tegra210_dmic_get_control, tegra210_dmic_put_control),
+};
+
+static const struct snd_soc_component_driver tegra210_dmic_compnt = {
+	.dapm_widgets		= tegra210_dmic_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(tegra210_dmic_widgets),
+	.dapm_routes		= tegra210_dmic_routes,
+	.num_dapm_routes	= ARRAY_SIZE(tegra210_dmic_routes),
+	.controls		= tegra210_dmic_controls,
+	.num_controls		= ARRAY_SIZE(tegra210_dmic_controls),
+};
+
+static bool tegra210_dmic_wr_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case TEGRA210_DMIC_TX_INT_MASK ... TEGRA210_DMIC_TX_CIF_CTRL:
+	case TEGRA210_DMIC_ENABLE ... TEGRA210_DMIC_CG:
+	case TEGRA210_DMIC_CTRL:
+	case TEGRA210_DMIC_DBG_CTRL:
+	case TEGRA210_DMIC_DCR_BIQUAD_0_COEF_4 ... TEGRA210_DMIC_LP_BIQUAD_1_COEF_4:
+		return true;
+	default:
+		return false;
+	};
+}
+
+static bool tegra210_dmic_rd_reg(struct device *dev, unsigned int reg)
+{
+	if (tegra210_dmic_wr_reg(dev, reg))
+		return true;
+
+	switch (reg) {
+	case TEGRA210_DMIC_TX_STATUS:
+	case TEGRA210_DMIC_TX_INT_STATUS:
+	case TEGRA210_DMIC_STATUS:
+	case TEGRA210_DMIC_INT_STATUS:
+		return true;
+	default:
+		return false;
+	};
+}
+
+static bool tegra210_dmic_volatile_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case TEGRA210_DMIC_TX_STATUS:
+	case TEGRA210_DMIC_TX_INT_STATUS:
+	case TEGRA210_DMIC_TX_INT_SET:
+	case TEGRA210_DMIC_SOFT_RESET:
+	case TEGRA210_DMIC_STATUS:
+	case TEGRA210_DMIC_INT_STATUS:
+		return true;
+	default:
+		return false;
+	};
+}
+
+static const struct regmap_config tegra210_dmic_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = TEGRA210_DMIC_LP_BIQUAD_1_COEF_4,
+	.writeable_reg = tegra210_dmic_wr_reg,
+	.readable_reg = tegra210_dmic_rd_reg,
+	.volatile_reg = tegra210_dmic_volatile_reg,
+	.reg_defaults = tegra210_dmic_reg_defaults,
+	.num_reg_defaults = ARRAY_SIZE(tegra210_dmic_reg_defaults),
+	.cache_type = REGCACHE_FLAT,
+};
+
+static const struct of_device_id tegra210_dmic_of_match[] = {
+	{ .compatible = "nvidia,tegra210-dmic" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, tegra210_dmic_of_match);
+
+static int tegra210_dmic_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct tegra210_dmic *dmic;
+	void __iomem *regs;
+	int ret;
+
+	dmic = devm_kcalloc(dev, 1, sizeof(*dmic), GFP_KERNEL);
+	if (!dmic)
+		return -ENOMEM;
+
+	dmic->osr_val = DMIC_OSR_64;
+	dmic->ch_select = DMIC_CH_SELECT_STEREO;
+	dmic->lrsel = DMIC_LRSEL_LEFT;
+	dmic->boost_gain = 0;
+	dmic->stereo_to_mono = 0; /* "CH0" */
+
+	dev_set_drvdata(dev, dmic);
+
+	dmic->clk_dmic = devm_clk_get(dev, "dmic");
+	if (IS_ERR(dmic->clk_dmic)) {
+		dev_err(dev, "can't retrieve DMIC clock\n");
+		return PTR_ERR(dmic->clk_dmic);
+	}
+
+	regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
+
+	dmic->regmap = devm_regmap_init_mmio(dev, regs,
+					     &tegra210_dmic_regmap_config);
+	if (IS_ERR(dmic->regmap)) {
+		dev_err(dev, "regmap init failed\n");
+		return PTR_ERR(dmic->regmap);
+	}
+
+	regcache_cache_only(dmic->regmap, true);
+
+	ret = devm_snd_soc_register_component(dev, &tegra210_dmic_compnt,
+					      tegra210_dmic_dais,
+					      ARRAY_SIZE(tegra210_dmic_dais));
+	if (ret) {
+		dev_err(dev, "failed to register DMIC component\n");
+		return ret;
+	}
+
+	pm_runtime_enable(dev);
+
+	return 0;
+}
+
+static int tegra210_dmic_remove(struct platform_device *pdev)
+{
+	pm_runtime_disable(&pdev->dev);
+	if (!pm_runtime_status_suspended(&pdev->dev))
+		tegra210_dmic_runtime_suspend(&pdev->dev);
+
+	return 0;
+}
+
+static const struct dev_pm_ops tegra210_dmic_pm_ops = {
+	SET_RUNTIME_PM_OPS(tegra210_dmic_runtime_suspend,
+			   tegra210_dmic_runtime_resume, NULL)
+	SET_LATE_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				     pm_runtime_force_resume)
+};
+
+static struct platform_driver tegra210_dmic_driver = {
+	.driver = {
+		.name = "tegra210-dmic",
+		.of_match_table = tegra210_dmic_of_match,
+		.pm = &tegra210_dmic_pm_ops,
+	},
+	.probe = tegra210_dmic_probe,
+	.remove = tegra210_dmic_remove,
+};
+module_platform_driver(tegra210_dmic_driver)
+
+MODULE_AUTHOR("Rahul Mittal <rmittal@nvidia.com>");
+MODULE_DESCRIPTION("Tegra210 ASoC DMIC driver");
+MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/tegra/tegra210_dmic.h b/sound/soc/tegra/tegra210_dmic.h
new file mode 100644
index 0000000..a08d136
--- /dev/null
+++ b/sound/soc/tegra/tegra210_dmic.h
@@ -0,0 +1,85 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * tegra210_dmic.h - Definitions for Tegra210 DMIC driver
+ *
+ * Copyright (c) 2020 NVIDIA CORPORATION.  All rights reserved.
+ *
+ */
+
+#ifndef __TEGRA210_DMIC_H__
+#define __TEGRA210_DMIC_H__
+
+/* Register offsets from DMIC BASE */
+#define TEGRA210_DMIC_TX_STATUS				0x0c
+#define TEGRA210_DMIC_TX_INT_STATUS			0x10
+#define TEGRA210_DMIC_TX_INT_MASK			0x14
+#define TEGRA210_DMIC_TX_INT_SET			0x18
+#define TEGRA210_DMIC_TX_INT_CLEAR			0x1c
+#define TEGRA210_DMIC_TX_CIF_CTRL			0x20
+#define TEGRA210_DMIC_ENABLE				0x40
+#define TEGRA210_DMIC_SOFT_RESET			0x44
+#define TEGRA210_DMIC_CG				0x48
+#define TEGRA210_DMIC_STATUS				0x4c
+#define TEGRA210_DMIC_INT_STATUS			0x50
+#define TEGRA210_DMIC_CTRL				0x64
+#define TEGRA210_DMIC_DBG_CTRL				0x70
+#define TEGRA210_DMIC_DCR_BIQUAD_0_COEF_4		0x88
+#define TEGRA210_DMIC_LP_FILTER_GAIN			0x8c
+#define TEGRA210_DMIC_LP_BIQUAD_0_COEF_0		0x90
+#define TEGRA210_DMIC_LP_BIQUAD_0_COEF_1		0x94
+#define TEGRA210_DMIC_LP_BIQUAD_0_COEF_2		0x98
+#define TEGRA210_DMIC_LP_BIQUAD_0_COEF_3		0x9c
+#define TEGRA210_DMIC_LP_BIQUAD_0_COEF_4		0xa0
+#define TEGRA210_DMIC_LP_BIQUAD_1_COEF_0		0xa4
+#define TEGRA210_DMIC_LP_BIQUAD_1_COEF_1		0xa8
+#define TEGRA210_DMIC_LP_BIQUAD_1_COEF_2		0xac
+#define TEGRA210_DMIC_LP_BIQUAD_1_COEF_3		0xb0
+#define TEGRA210_DMIC_LP_BIQUAD_1_COEF_4		0xb4
+
+/* Fields in TEGRA210_DMIC_CTRL */
+#define CH_SEL_SHIFT					8
+#define TEGRA210_DMIC_CTRL_CHANNEL_SELECT_MASK		(0x3 << CH_SEL_SHIFT)
+#define LRSEL_POL_SHIFT					4
+#define TEGRA210_DMIC_CTRL_LRSEL_POLARITY_MASK		(0x1 << LRSEL_POL_SHIFT)
+#define OSR_SHIFT					0
+#define TEGRA210_DMIC_CTRL_OSR_MASK			(0x3 << OSR_SHIFT)
+
+#define DMIC_OSR_FACTOR					64
+
+#define DEFAULT_GAIN_Q23				0x800000
+
+/* Max boost gain factor used for mixer control */
+#define MAX_BOOST_GAIN 25599
+
+enum tegra_dmic_ch_select {
+	DMIC_CH_SELECT_LEFT,
+	DMIC_CH_SELECT_RIGHT,
+	DMIC_CH_SELECT_STEREO,
+};
+
+enum tegra_dmic_osr {
+	DMIC_OSR_64,
+	DMIC_OSR_128,
+	DMIC_OSR_256,
+};
+
+enum tegra_dmic_lrsel {
+	DMIC_LRSEL_LEFT,
+	DMIC_LRSEL_RIGHT,
+};
+
+struct tegra210_dmic {
+	struct clk *clk_dmic;
+	struct regmap *regmap;
+	unsigned int audio_ch_override;
+	unsigned int audio_bits_override;
+	unsigned int srate_override;
+	unsigned int mono_to_stereo;
+	unsigned int stereo_to_mono;
+	unsigned int boost_gain;
+	unsigned int ch_select;
+	unsigned int osr_val;
+	unsigned int lrsel;
+};
+
+#endif
-- 
2.7.4


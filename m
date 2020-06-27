Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C29B20BE74
	for <lists+linux-tegra@lfdr.de>; Sat, 27 Jun 2020 06:54:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726013AbgF0Ey2 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sat, 27 Jun 2020 00:54:28 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:17349 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725861AbgF0Ey1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 27 Jun 2020 00:54:27 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ef6d0f60000>; Fri, 26 Jun 2020 21:54:14 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Fri, 26 Jun 2020 21:54:27 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Fri, 26 Jun 2020 21:54:27 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 27 Jun
 2020 04:54:26 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Sat, 27 Jun 2020 04:54:26 +0000
Received: from audio.nvidia.com (Not Verified[10.24.34.185]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5ef6d0fd0000>; Fri, 26 Jun 2020 21:54:26 -0700
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
Subject: [PATCH v4 02/23] ASoC: tegra: Add support for CIF programming
Date:   Sat, 27 Jun 2020 10:23:24 +0530
Message-ID: <1593233625-14961-3-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
References: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1593233654; bh=avjJNBmyDs+NaCxpIRi8FaEhEBoDKZ4zb32eB5KFuzY=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:Content-Type;
        b=PmNqNJA6ZF73lNzFMWvRrn1CB54zY98H6qjPNJgOWWaoZkzDBEMcHc+jqDYF9qxYY
         9BFZVcgywVQ4joAX1w6atMRdS2vXzPYImq6AAK/Woq5DRNtzmJr2cTmh16yKamO7Vc
         OLji5KkFM9mTtA0QJDbZxjTI1Spziko0aY0huN2S6U50hIjwIyQwa6yI/uLKnvS0C6
         kGvqcJ9JMMvLh/fAq1BkH7w7XkXKVBnCqM8iPFL9/sSNf76w76vXDK2fg6SrFlTsU5
         TC9ywOKCm91pm6XkQB0aSw2j6lAFAMZDptcB6h//t9KzMW4QmlxnFFPAssUFFi9fdv
         jazp/XUJfxaew==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Audio Client Interface (CIF) is a proprietary interface employed to route
audio samples through Audio Hub (AHUB) components by inter connecting the
various modules.

This patch exports an inline function tegra_set_cif() which can be used,
for now, to program CIF on Tegra210 and later Tegra generations. Later it
can be extended to include helpers for legacy chips as well.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra_cif.h | 65 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 sound/soc/tegra/tegra_cif.h

diff --git a/sound/soc/tegra/tegra_cif.h b/sound/soc/tegra/tegra_cif.h
new file mode 100644
index 0000000..7cca806
--- /dev/null
+++ b/sound/soc/tegra/tegra_cif.h
@@ -0,0 +1,65 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * tegra_cif.h - TEGRA Audio CIF Programming
+ *
+ * Copyright (c) 2020 NVIDIA CORPORATION.  All rights reserved.
+ *
+ */
+
+#ifndef __TEGRA_CIF_H__
+#define __TEGRA_CIF_H__
+
+#include <linux/regmap.h>
+
+#define TEGRA_ACIF_CTRL_FIFO_TH_SHIFT		24
+#define TEGRA_ACIF_CTRL_AUDIO_CH_SHIFT		20
+#define TEGRA_ACIF_CTRL_CLIENT_CH_SHIFT		16
+#define TEGRA_ACIF_CTRL_AUDIO_BITS_SHIFT	12
+#define TEGRA_ACIF_CTRL_CLIENT_BITS_SHIFT	8
+#define TEGRA_ACIF_CTRL_EXPAND_SHIFT		6
+#define TEGRA_ACIF_CTRL_STEREO_CONV_SHIFT	4
+#define TEGRA_ACIF_CTRL_REPLICATE_SHIFT		3
+#define TEGRA_ACIF_CTRL_TRUNCATE_SHIFT		1
+#define TEGRA_ACIF_CTRL_MONO_CONV_SHIFT		0
+
+/* AUDIO/CLIENT_BITS values */
+#define TEGRA_ACIF_BITS_8			1
+#define TEGRA_ACIF_BITS_16			3
+#define TEGRA_ACIF_BITS_24			5
+#define TEGRA_ACIF_BITS_32			7
+
+#define TEGRA_ACIF_UPDATE_MASK			0x3ffffffb
+
+struct tegra_cif_conf {
+	unsigned int threshold;
+	unsigned int audio_ch;
+	unsigned int client_ch;
+	unsigned int audio_bits;
+	unsigned int client_bits;
+	unsigned int expand;
+	unsigned int stereo_conv;
+	unsigned int replicate;
+	unsigned int truncate;
+	unsigned int mono_conv;
+};
+
+static inline void tegra_set_cif(struct regmap *regmap, unsigned int reg,
+				 struct tegra_cif_conf *conf)
+{
+	unsigned int value;
+
+	value = (conf->threshold << TEGRA_ACIF_CTRL_FIFO_TH_SHIFT) |
+		((conf->audio_ch - 1) << TEGRA_ACIF_CTRL_AUDIO_CH_SHIFT) |
+		((conf->client_ch - 1) << TEGRA_ACIF_CTRL_CLIENT_CH_SHIFT) |
+		(conf->audio_bits << TEGRA_ACIF_CTRL_AUDIO_BITS_SHIFT) |
+		(conf->client_bits << TEGRA_ACIF_CTRL_CLIENT_BITS_SHIFT) |
+		(conf->expand << TEGRA_ACIF_CTRL_EXPAND_SHIFT) |
+		(conf->stereo_conv << TEGRA_ACIF_CTRL_STEREO_CONV_SHIFT) |
+		(conf->replicate << TEGRA_ACIF_CTRL_REPLICATE_SHIFT) |
+		(conf->truncate << TEGRA_ACIF_CTRL_TRUNCATE_SHIFT) |
+		(conf->mono_conv << TEGRA_ACIF_CTRL_MONO_CONV_SHIFT);
+
+	regmap_update_bits(regmap, reg, TEGRA_ACIF_UPDATE_MASK, value);
+}
+
+#endif
-- 
2.7.4


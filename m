Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF0D852C15D
	for <lists+linux-tegra@lfdr.de>; Wed, 18 May 2022 19:50:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241046AbiERRi3 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 18 May 2022 13:38:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241024AbiERRi1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 18 May 2022 13:38:27 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2065.outbound.protection.outlook.com [40.107.220.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD4AF1EEE2F;
        Wed, 18 May 2022 10:38:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VTFO4UvFJU+i5HrFy+Mf8DCRvapnozq7gwfZbUab2tQdlfjFrXzTmPdqfgdjbI+roYCcOxRf5+R3o1EdOdfJFWD7JXSs2ZLbR8NleE0a+5gjRQGAa3xkPgn9BxB27opUrQh7w0RTCx0UK0M1itDsvg77n88Og83kPp97E4TY3nnm/KlW0jzXt5RnLsYpAlVwSXrz/fYFsgsULSARyodPPoGPRqMkArUnYR1C/uYAFQekGuLeODwpDEqPmhrUqMshEJpGAuNx4Tv6OVmkZkAlXeoHKUN+TIlK0OMXQJDAKoCjORym8z50Y1ui79il1sGZgVCn2CjU/23FGql4JCZnPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AqLfYSNkeScbROtipMB0C/KlBw68wDkOWThrMGzed5g=;
 b=PhANnZVCekf05aUejEiRCSXJCkORIueFq2Fc3wWCbVFeqoRjICNuHg/+J03sdhhP5qYSsY0cBRr2zLRyMe/8JO7regYSjmpg/Qc78YNFXQJNeKSSdCi6ZVbmDHdZbN46eRpb8fwXIcJHEgpnm00LiUdQD4EAxY80h7cq/ykxUbG84KjVBvFyDmaxRKHEjaT5UGgWioMQWlG2fWB2MInc0Bz2f05Di+IUbt7nWAYyCUvKu1XLe7Fvg9i5ZaBU3dAut44uN0Pe5p0PsjExevchAgoSiyjWBq0TxKilCztZ5iFzDkoy1qBgkd6Z/m9E1aqNJGjmz7hw5g2ta+zXu5b/KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.236) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AqLfYSNkeScbROtipMB0C/KlBw68wDkOWThrMGzed5g=;
 b=cbZGGZ5JLVK1fCw/dWFv4cCH84f1U/LP3IBFUNYYR4Zv/wbL4w5PKmFWhI2L9MtQXgEWaUe8W92dkueBIwrfriuwojCftyE3GXGUfaDXsQVt4CUliyRMRPcZcGa5ZrWcWBBM6o3UzjG89k4N2U4EzMsfVRtL6DzYLekR4XiRQblwq0/zYkPWzUQDRwYDfJRk3l1rfzR+rb4ljSKEt8kacuH8K0A+UKNdwnlvCIZ7BLHkOOo33/FP+tnkqD2DZ3Yd/6DbwTfHAHf2+2YM3xSEHIphorxB4tS75JrMhct3jb7YRDS7wdjhW8ALiT1qfpMQLMdVeobuYOrnw4i1CSZ7eQ==
Received: from DM6PR11CA0064.namprd11.prod.outlook.com (2603:10b6:5:14c::41)
 by DM6PR12MB5698.namprd12.prod.outlook.com (2603:10b6:5:78::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Wed, 18 May
 2022 17:38:21 +0000
Received: from DM6NAM11FT019.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:14c:cafe::4) by DM6PR11CA0064.outlook.office365.com
 (2603:10b6:5:14c::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18 via Frontend
 Transport; Wed, 18 May 2022 17:38:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.236)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.236 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.236; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.236) by
 DM6NAM11FT019.mail.protection.outlook.com (10.13.172.172) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5273.14 via Frontend Transport; Wed, 18 May 2022 17:38:21 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by DRHQMAIL109.nvidia.com
 (10.27.9.19) with Microsoft SMTP Server (TLS) id 15.0.1497.32; Wed, 18 May
 2022 17:38:20 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 18 May
 2022 10:38:18 -0700
Received: from audio.nvidia.com (10.127.8.10) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.986.22 via Frontend Transport; Wed, 18 May
 2022 10:38:15 -0700
From:   Sameer Pujar <spujar@nvidia.com>
To:     <broonie@kernel.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <thierry.reding@gmail.com>,
        <catalin.marinas@arm.com>, <will@kernel.org>, <perex@perex.cz>,
        <tiwai@suse.com>
CC:     <jonathanh@nvidia.com>, <alsa-devel@alsa-project.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH 2/6] ASoC: tegra: Add Tegra210 based OPE driver
Date:   Wed, 18 May 2022 23:06:08 +0530
Message-ID: <1652895372-29885-3-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1652895372-29885-1-git-send-email-spujar@nvidia.com>
References: <1652895372-29885-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5102c1df-a1f1-4de1-6882-08da38f533d6
X-MS-TrafficTypeDiagnostic: DM6PR12MB5698:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB5698B2DD49C9D52FFA8FB45CA7D19@DM6PR12MB5698.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZC16K76GOQpoYAsDshO8u3Ox7vHiVpEgU9eLdqa5IlbjVaGNbFqx4wSE7sqegONfysw04WqJLFGvkegNwkaxzLwELigwohsSIvf4kRgTO4rubqkvvUiBpGdzddX4Bm1rtj65hR+Cb9B0H3i0yl20wX5Y+DUiarvYZwO10DmbnSdKZXaT/tiyQLOKmTWyDYBnvUoIeKLWL+1BipC53HP6dWqk32dzIVdkez1bo7oNfoVxb5MgpJ4rGPK7kgSWvHAdp4Dai4gBhJ7aDqtWMB0QgvW4tQsoNhsN4aVEA9KWk6SPTWPplVRCW0RJjk5RkWIqz04rOc7K2FWjLDTl2GtnaKYGcdoVx0VCASg8RZY90vWKVjmzJQh9LrHCJUXHbgpSQ4ysdpQGm7ULBuLRC1k/FNh0UdTeu5POUIydEym4c5O5QSof/+euGa7pmvQcCcAcmXm6+ofZILAnhnFhqSg6Pq48JB6JZOxh0Z/sKf5nHBa6VgEQ5gMLQWG5WLrtAw2tQ7xS2pd4ioCNrHHtTw2pib5I8Ba/3HPqXmIasyu6RJCE1RgWDrpU2N3A3hQG/hSQu3bF3Idyw4m5tzLklwLj1DeszK5wy78LQi+D4xTnJHaAzF8lpm2ItUOwh2WppGsLhDefZH92B1JzhtAmx6GzvShDviEnirnzimy0hHhXTBQMZlkjP4XZVNCBF2JSVTffumIqAOdzXBqXuc0otzz3ig==
X-Forefront-Antispam-Report: CIP:12.22.5.236;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(508600001)(2616005)(5660300002)(107886003)(8936002)(70206006)(26005)(2906002)(70586007)(316002)(83380400001)(336012)(186003)(7416002)(54906003)(40460700003)(30864003)(356005)(7696005)(426003)(4326008)(47076005)(86362001)(110136005)(36756003)(81166007)(6666004)(36860700001)(82310400005)(8676002)(36900700001)(559001)(579004);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2022 17:38:21.3085
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5102c1df-a1f1-4de1-6882-08da38f533d6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.236];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT019.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB5698
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The Output Processing Engine (OPE) is one of the AHUB client. It has
PEQ (Parametric Equalizer) and MBDRC (Multi Band Dynamic Range Compressor)
sub blocks for data processing. The PEQ block gets samples from the MBDRC
block.

This patch registers OPE driver with ASoC framework. The component driver
exposes DAPM widgets, routes and kcontrols for the device. The DAI driver
exposes OPE interfaces, which can be used to connect different components
in the ASoC layer. Makefile and Kconfig support is added to allow build
the driver.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/soc/tegra/Kconfig          |    9 +
 sound/soc/tegra/Makefile         |    2 +
 sound/soc/tegra/tegra210_mbdrc.c | 1012 ++++++++++++++++++++++++++++++++++++++
 sound/soc/tegra/tegra210_mbdrc.h |  215 ++++++++
 sound/soc/tegra/tegra210_ope.c   |  419 ++++++++++++++++
 sound/soc/tegra/tegra210_ope.h   |   90 ++++
 sound/soc/tegra/tegra210_peq.c   |  434 ++++++++++++++++
 sound/soc/tegra/tegra210_peq.h   |   56 +++
 8 files changed, 2237 insertions(+)
 create mode 100644 sound/soc/tegra/tegra210_mbdrc.c
 create mode 100644 sound/soc/tegra/tegra210_mbdrc.h
 create mode 100644 sound/soc/tegra/tegra210_ope.c
 create mode 100644 sound/soc/tegra/tegra210_ope.h
 create mode 100644 sound/soc/tegra/tegra210_peq.c
 create mode 100644 sound/soc/tegra/tegra210_peq.h

diff --git a/sound/soc/tegra/Kconfig b/sound/soc/tegra/Kconfig
index b337852..65c6c47 100644
--- a/sound/soc/tegra/Kconfig
+++ b/sound/soc/tegra/Kconfig
@@ -88,6 +88,15 @@ config SND_SOC_TEGRA210_I2S
 	  compatible devices.
 	  Say Y or M if you want to add support for Tegra210 I2S module.
 
+config SND_SOC_TEGRA210_OPE
+	tristate "Tegra210 OPE module"
+	help
+	  Config to enable the Output Processing Engine (OPE) which includes
+	  Parametric Equalizer (PEQ) and Multi Band Dynamic Range Compressor
+	  (MBDRC) sub blocks for data processing. It can support up to 8
+	  channels.
+	  Say Y or M if you want to add support for Tegra210 OPE module.
+
 config SND_SOC_TEGRA186_ASRC
 	tristate "Tegra186 ASRC module"
 	help
diff --git a/sound/soc/tegra/Makefile b/sound/soc/tegra/Makefile
index 70a498d..b723c78 100644
--- a/sound/soc/tegra/Makefile
+++ b/sound/soc/tegra/Makefile
@@ -19,6 +19,7 @@ snd-soc-tegra210-sfc-objs := tegra210_sfc.o
 snd-soc-tegra210-amx-objs := tegra210_amx.o
 snd-soc-tegra210-adx-objs := tegra210_adx.o
 snd-soc-tegra210-mixer-objs := tegra210_mixer.o
+snd-soc-tegra210-ope-objs := tegra210_ope.o tegra210_mbdrc.o tegra210_peq.o
 
 obj-$(CONFIG_SND_SOC_TEGRA) += snd-soc-tegra-pcm.o
 obj-$(CONFIG_SND_SOC_TEGRA20_AC97) += snd-soc-tegra20-ac97.o
@@ -38,6 +39,7 @@ obj-$(CONFIG_SND_SOC_TEGRA210_SFC) += snd-soc-tegra210-sfc.o
 obj-$(CONFIG_SND_SOC_TEGRA210_AMX) += snd-soc-tegra210-amx.o
 obj-$(CONFIG_SND_SOC_TEGRA210_ADX) += snd-soc-tegra210-adx.o
 obj-$(CONFIG_SND_SOC_TEGRA210_MIXER) += snd-soc-tegra210-mixer.o
+obj-$(CONFIG_SND_SOC_TEGRA210_OPE) += snd-soc-tegra210-ope.o
 
 # Tegra machine Support
 snd-soc-tegra-wm8903-objs := tegra_wm8903.o
diff --git a/sound/soc/tegra/tegra210_mbdrc.c b/sound/soc/tegra/tegra210_mbdrc.c
new file mode 100644
index 00000000..d1623991
--- /dev/null
+++ b/sound/soc/tegra/tegra210_mbdrc.c
@@ -0,0 +1,1012 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// tegra210_mbdrc.c - Tegra210 MBDRC driver
+//
+// Copyright (c) 2022, NVIDIA CORPORATION. All rights reserved.
+
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of_address.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <sound/core.h>
+#include <sound/soc.h>
+#include <sound/tlv.h>
+
+#include "tegra210_mbdrc.h"
+#include "tegra210_ope.h"
+
+#define MBDRC_FILTER_REG(reg, id)					    \
+	((reg) + ((id) * TEGRA210_MBDRC_FILTER_PARAM_STRIDE))
+
+#define MBDRC_FILTER_REG_DEFAULTS(id)					    \
+	{ MBDRC_FILTER_REG(TEGRA210_MBDRC_IIR_CFG, id), 0x00000005},	    \
+	{ MBDRC_FILTER_REG(TEGRA210_MBDRC_IN_ATTACK, id), 0x3e48590c},	    \
+	{ MBDRC_FILTER_REG(TEGRA210_MBDRC_IN_RELEASE, id), 0x08414e9f},	    \
+	{ MBDRC_FILTER_REG(TEGRA210_MBDRC_FAST_ATTACK, id), 0x7fffffff},    \
+	{ MBDRC_FILTER_REG(TEGRA210_MBDRC_IN_THRESHOLD, id), 0x06145082},   \
+	{ MBDRC_FILTER_REG(TEGRA210_MBDRC_OUT_THRESHOLD, id), 0x060d379b},  \
+	{ MBDRC_FILTER_REG(TEGRA210_MBDRC_RATIO_1ST, id), 0x0000a000},	    \
+	{ MBDRC_FILTER_REG(TEGRA210_MBDRC_RATIO_2ND, id), 0x00002000},	    \
+	{ MBDRC_FILTER_REG(TEGRA210_MBDRC_RATIO_3RD, id), 0x00000b33},	    \
+	{ MBDRC_FILTER_REG(TEGRA210_MBDRC_RATIO_4TH, id), 0x00000800},	    \
+	{ MBDRC_FILTER_REG(TEGRA210_MBDRC_RATIO_5TH, id), 0x0000019a},	    \
+	{ MBDRC_FILTER_REG(TEGRA210_MBDRC_MAKEUP_GAIN, id), 0x00000002},    \
+	{ MBDRC_FILTER_REG(TEGRA210_MBDRC_INIT_GAIN, id), 0x00066666},	    \
+	{ MBDRC_FILTER_REG(TEGRA210_MBDRC_GAIN_ATTACK, id), 0x00d9ba0e},    \
+	{ MBDRC_FILTER_REG(TEGRA210_MBDRC_GAIN_RELEASE, id), 0x3e48590c},   \
+	{ MBDRC_FILTER_REG(TEGRA210_MBDRC_FAST_RELEASE, id), 0x7ffff26a},   \
+	{ MBDRC_FILTER_REG(TEGRA210_MBDRC_CFG_RAM_CTRL, id), 0x4000}
+
+static const struct reg_default tegra210_mbdrc_reg_defaults[] = {
+	{ TEGRA210_MBDRC_CFG, 0x0030de51},
+	{ TEGRA210_MBDRC_CHANNEL_MASK, 0x00000003},
+	{ TEGRA210_MBDRC_FAST_FACTOR, 0x30000800},
+
+	MBDRC_FILTER_REG_DEFAULTS(0),
+	MBDRC_FILTER_REG_DEFAULTS(1),
+	MBDRC_FILTER_REG_DEFAULTS(2),
+};
+
+/* Default MBDRC parameters */
+static const struct tegra210_mbdrc_config mbdrc_init_config = {
+	.mode			= 0, /* Bypass */
+	.rms_off		= 48,
+	.peak_rms_mode		= 1, /* PEAK */
+	.fliter_structure	= 0, /* All-pass tree */
+	.shift_ctrl		= 30,
+	.frame_size		= 32,
+	.channel_mask		= 0x3,
+	.fa_factor		= 2048,
+	.fr_factor		= 14747,
+
+	.band_params[MBDRC_LOW_BAND] = {
+		.band			= MBDRC_LOW_BAND,
+		.iir_stages		= 5,
+		.in_attack_tc		= 1044928780,
+		.in_release_tc		= 138497695,
+		.fast_attack_tc		= 2147483647,
+		.in_threshold		= {130, 80, 20, 6},
+		.out_threshold		= {155, 55, 13, 6},
+		.ratio			= {40960, 8192, 2867, 2048, 410},
+		.makeup_gain		= 4,
+		.gain_init		= 419430,
+		.gain_attack_tc		= 14268942,
+		.gain_release_tc	= 1440547090,
+		.fast_release_tc	= 2147480170,
+
+		.biquad_params	= {
+			/*
+			 * Gains:
+			 *
+			 * b0, b1, a0,
+			 * a1, a2,
+			 */
+
+			/* Band-0 */
+			961046798, -2030431983, 1073741824,
+			2030431983, -961046798,
+			/* Band-1 */
+			1030244425, -2099481453, 1073741824,
+			2099481453, -1030244425,
+			/* Band-2 */
+			1067169294, -2136327263, 1073741824,
+			2136327263, -1067169294,
+			/* Band-3 */
+			434951949, -1306567134, 1073741824,
+			1306567134, -434951949,
+			/* Band-4 */
+			780656019, -1605955641, 1073741824,
+			1605955641, -780656019,
+			/* Band-5 */
+			1024497031, -1817128152, 1073741824,
+			1817128152, -1024497031,
+			/* Band-6 */
+			1073741824, 0, 0,
+			0, 0,
+			/* Band-7 */
+			1073741824, 0, 0,
+			0, 0,
+		}
+	},
+
+	.band_params[MBDRC_MID_BAND] = {
+		.band			= MBDRC_MID_BAND,
+		.iir_stages		= 5,
+		.in_attack_tc		= 1581413104,
+		.in_release_tc		= 35494783,
+		.fast_attack_tc		= 2147483647,
+		.in_threshold		= {130, 50, 30, 6},
+		.out_threshold		= {106, 50, 30, 13},
+		.ratio			= {40960, 2867, 4096, 2867, 410},
+		.makeup_gain		= 6,
+		.gain_init		= 419430,
+		.gain_attack_tc		= 4766887,
+		.gain_release_tc	= 1044928780,
+		.fast_release_tc	= 2147480170,
+
+		.biquad_params = {
+			/*
+			 * Gains:
+			 *
+			 * b0, b1, a0,
+			 * a1, a2,
+			 */
+
+			/* Band-0 */
+			-1005668963, 1073741824, 0,
+			1005668963, 0,
+			/* Band-1 */
+			998437058, -2067742187, 1073741824,
+			2067742187, -998437058,
+			/* Band-2 */
+			1051963422, -2121153948, 1073741824,
+			2121153948, -1051963422,
+			/* Band-3 */
+			434951949, -1306567134, 1073741824,
+			1306567134, -434951949,
+			/* Band-4 */
+			780656019, -1605955641, 1073741824,
+			1605955641, -780656019,
+			/* Band-5 */
+			1024497031, -1817128152, 1073741824,
+			1817128152, -1024497031,
+			/* Band-6 */
+			1073741824, 0, 0,
+			0, 0,
+			/* Band-7 */
+			1073741824, 0, 0,
+			0, 0,
+		}
+	},
+
+	.band_params[MBDRC_HIGH_BAND] = {
+		.band			= MBDRC_HIGH_BAND,
+		.iir_stages		= 5,
+		.in_attack_tc		= 2144750688,
+		.in_release_tc		= 70402888,
+		.fast_attack_tc		= 2147483647,
+		.in_threshold		= {130, 50, 30, 6},
+		.out_threshold		= {106, 50, 30, 13},
+		.ratio			= {40960, 2867, 4096, 2867, 410},
+		.makeup_gain		= 6,
+		.gain_init		= 419430,
+		.gain_attack_tc		= 4766887,
+		.gain_release_tc	= 1044928780,
+		.fast_release_tc	= 2147480170,
+
+		.biquad_params = {
+			/*
+			 * Gains:
+			 *
+			 * b0, b1, a0,
+			 * a1, a2,
+			 */
+
+			/* Band-0 */
+			1073741824, 0, 0,
+			0, 0,
+			/* Band-1 */
+			1073741824, 0, 0,
+			0, 0,
+			/* Band-2 */
+			1073741824, 0, 0,
+			0, 0,
+			/* Band-3 */
+			-619925131, 1073741824, 0,
+			619925131, 0,
+			/* Band-4 */
+			606839335, -1455425976, 1073741824,
+			1455425976, -606839335,
+			/* Band-5 */
+			917759617, -1724690840, 1073741824,
+			1724690840, -917759617,
+			/* Band-6 */
+			1073741824, 0, 0,
+			0, 0,
+			/* Band-7 */
+			1073741824, 0, 0,
+			0, 0,
+		}
+	}
+};
+
+static void tegra210_mbdrc_write_ram(struct regmap *regmap, unsigned int reg_ctrl,
+				     unsigned int reg_data, unsigned int ram_offset,
+				     unsigned int *data, size_t size)
+{
+	unsigned int val;
+	unsigned int i;
+
+	val = ram_offset & TEGRA210_MBDRC_RAM_CTRL_RAM_ADDR_MASK;
+	val |= TEGRA210_MBDRC_RAM_CTRL_ADDR_INIT_EN;
+	val |= TEGRA210_MBDRC_RAM_CTRL_SEQ_ACCESS_EN;
+	val |= TEGRA210_MBDRC_RAM_CTRL_RW_WRITE;
+
+	regmap_write(regmap, reg_ctrl, val);
+
+	for (i = 0; i < size; i++)
+		regmap_write(regmap, reg_data, data[i]);
+}
+
+static int tegra210_mbdrc_get(struct snd_kcontrol *kcontrol,
+			      struct snd_ctl_elem_value *ucontrol)
+{
+	struct soc_mixer_control *mc =
+		(struct soc_mixer_control *)kcontrol->private_value;
+	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct tegra210_ope *ope = snd_soc_component_get_drvdata(cmpnt);
+	unsigned int val;
+
+	regmap_read(ope->mbdrc_regmap, mc->reg, &val);
+
+	ucontrol->value.integer.value[0] = (val >> mc->shift) & mc->max;
+
+	return 0;
+}
+
+static int tegra210_mbdrc_put(struct snd_kcontrol *kcontrol,
+			      struct snd_ctl_elem_value *ucontrol)
+{
+	struct soc_mixer_control *mc =
+		(struct soc_mixer_control *)kcontrol->private_value;
+	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct tegra210_ope *ope = snd_soc_component_get_drvdata(cmpnt);
+	unsigned int val = ucontrol->value.integer.value[0];
+	bool change = false;
+
+	val = val << mc->shift;
+
+	regmap_update_bits_check(ope->mbdrc_regmap, mc->reg,
+				 (mc->max << mc->shift), val, &change);
+
+	return change ? 1 : 0;
+}
+
+static int tegra210_mbdrc_get_enum(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct tegra210_ope *ope = snd_soc_component_get_drvdata(cmpnt);
+	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
+	unsigned int val;
+
+	regmap_read(ope->mbdrc_regmap, e->reg, &val);
+
+	ucontrol->value.enumerated.item[0] = (val >> e->shift_l) & e->mask;
+
+	return 0;
+}
+
+static int tegra210_mbdrc_put_enum(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct tegra210_ope *ope = snd_soc_component_get_drvdata(cmpnt);
+	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
+	bool change = false;
+	unsigned int val;
+	unsigned int mask;
+
+	if (ucontrol->value.enumerated.item[0] > e->items - 1)
+		return -EINVAL;
+
+	val = ucontrol->value.enumerated.item[0] << e->shift_l;
+	mask = e->mask << e->shift_l;
+
+	regmap_update_bits_check(ope->mbdrc_regmap, e->reg, mask, val,
+				 &change);
+
+	return change ? 1 : 0;
+}
+
+static int tegra210_mbdrc_band_params_get(struct snd_kcontrol *kcontrol,
+					  struct snd_ctl_elem_value *ucontrol)
+{
+	struct tegra_soc_bytes *params = (void *)kcontrol->private_value;
+	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct tegra210_ope *ope = snd_soc_component_get_drvdata(cmpnt);
+	u32 *data = (u32 *)ucontrol->value.bytes.data;
+	u32 regs = params->soc.base;
+	u32 mask = params->soc.mask;
+	u32 shift = params->shift;
+	unsigned int i;
+
+	for (i = 0; i < params->soc.num_regs; i++, regs += cmpnt->val_bytes) {
+		regmap_read(ope->mbdrc_regmap, regs, &data[i]);
+
+		data[i] = ((data[i] & mask) >> shift);
+	}
+
+	return 0;
+}
+
+static int tegra210_mbdrc_band_params_put(struct snd_kcontrol *kcontrol,
+					  struct snd_ctl_elem_value *ucontrol)
+{
+	struct tegra_soc_bytes *params = (void *)kcontrol->private_value;
+	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct tegra210_ope *ope = snd_soc_component_get_drvdata(cmpnt);
+	u32 *data = (u32 *)ucontrol->value.bytes.data;
+	u32 regs = params->soc.base;
+	u32 mask = params->soc.mask;
+	u32 shift = params->shift;
+	bool change = false;
+	unsigned int i;
+
+	for (i = 0; i < params->soc.num_regs; i++, regs += cmpnt->val_bytes) {
+		bool update = false;
+
+		regmap_update_bits_check(ope->mbdrc_regmap, regs, mask,
+					 data[i] << shift, &update);
+
+		change |= update;
+	}
+
+	return change ? 1 : 0;
+}
+
+static int tegra210_mbdrc_threshold_get(struct snd_kcontrol *kcontrol,
+					struct snd_ctl_elem_value *ucontrol)
+{
+	struct tegra_soc_bytes *params = (void *)kcontrol->private_value;
+	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct tegra210_ope *ope = snd_soc_component_get_drvdata(cmpnt);
+	u32 *data = (u32 *)ucontrol->value.bytes.data;
+	u32 regs = params->soc.base;
+	u32 num_regs = params->soc.num_regs;
+	u32 val;
+	unsigned int i;
+
+	for (i = 0; i < num_regs; i += 4, regs += cmpnt->val_bytes) {
+		regmap_read(ope->mbdrc_regmap, regs, &val);
+
+		data[i] = (val & TEGRA210_MBDRC_THRESH_1ST_MASK) >>
+			  TEGRA210_MBDRC_THRESH_1ST_SHIFT;
+		data[i + 1] = (val & TEGRA210_MBDRC_THRESH_2ND_MASK) >>
+			      TEGRA210_MBDRC_THRESH_2ND_SHIFT;
+		data[i + 2] = (val & TEGRA210_MBDRC_THRESH_3RD_MASK) >>
+			      TEGRA210_MBDRC_THRESH_3RD_SHIFT;
+		data[i + 3] = (val & TEGRA210_MBDRC_THRESH_4TH_MASK) >>
+			      TEGRA210_MBDRC_THRESH_4TH_SHIFT;
+	}
+
+	return 0;
+}
+
+static int tegra210_mbdrc_threshold_put(struct snd_kcontrol *kcontrol,
+					struct snd_ctl_elem_value *ucontrol)
+{
+	struct tegra_soc_bytes *params = (void *)kcontrol->private_value;
+	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct tegra210_ope *ope = snd_soc_component_get_drvdata(cmpnt);
+	u32 *data = (u32 *)ucontrol->value.bytes.data;
+	u32 regs = params->soc.base;
+	u32 num_regs = params->soc.num_regs;
+	bool change = false;
+	unsigned int i;
+
+	for (i = 0; i < num_regs; i += 4, regs += cmpnt->val_bytes) {
+		bool update = false;
+
+		data[i] = (((data[i] >> TEGRA210_MBDRC_THRESH_1ST_SHIFT) &
+			    TEGRA210_MBDRC_THRESH_1ST_MASK) |
+			   ((data[i + 1] >> TEGRA210_MBDRC_THRESH_2ND_SHIFT) &
+			    TEGRA210_MBDRC_THRESH_2ND_MASK) |
+			   ((data[i + 2] >> TEGRA210_MBDRC_THRESH_3RD_SHIFT) &
+			    TEGRA210_MBDRC_THRESH_3RD_MASK) |
+			   ((data[i + 3] >> TEGRA210_MBDRC_THRESH_4TH_SHIFT) &
+			    TEGRA210_MBDRC_THRESH_4TH_MASK));
+
+		regmap_update_bits_check(ope->mbdrc_regmap, regs, 0xffffffff,
+					 data[i], &update);
+
+		change |= update;
+	}
+
+	return change ? 1 : 0;
+}
+
+static int tegra210_mbdrc_biquad_coeffs_get(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct tegra_soc_bytes *params = (void *)kcontrol->private_value;
+	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	u32 *data = (u32 *)ucontrol->value.bytes.data;
+
+	memset(data, 0, params->soc.num_regs * cmpnt->val_bytes);
+
+	return 0;
+}
+
+static int tegra210_mbdrc_biquad_coeffs_put(struct snd_kcontrol *kcontrol,
+					    struct snd_ctl_elem_value *ucontrol)
+{
+	struct tegra_soc_bytes *params = (void *)kcontrol->private_value;
+	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct tegra210_ope *ope = snd_soc_component_get_drvdata(cmpnt);
+	u32 reg_ctrl = params->soc.base;
+	u32 reg_data = reg_ctrl + cmpnt->val_bytes;
+	u32 *data = (u32 *)ucontrol->value.bytes.data;
+
+	tegra210_mbdrc_write_ram(ope->mbdrc_regmap, reg_ctrl, reg_data,
+				 params->shift, data, params->soc.num_regs);
+
+	return 1;
+}
+
+static int tegra210_mbdrc_param_info(struct snd_kcontrol *kcontrol,
+				     struct snd_ctl_elem_info *uinfo)
+{
+	struct soc_bytes *params = (void *)kcontrol->private_value;
+
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_BYTES;
+	uinfo->count = params->num_regs * sizeof(u32);
+
+	return 0;
+}
+
+static int tegra210_mbdrc_vol_get(struct snd_kcontrol *kcontrol,
+				  struct snd_ctl_elem_value *ucontrol)
+{
+	struct soc_mixer_control *mc =
+		(struct soc_mixer_control *)kcontrol->private_value;
+	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct tegra210_ope *ope = snd_soc_component_get_drvdata(cmpnt);
+	int val;
+
+	regmap_read(ope->mbdrc_regmap, mc->reg, &val);
+
+	ucontrol->value.integer.value[0] =
+		((val >> mc->shift) - TEGRA210_MBDRC_MASTER_VOL_MIN);
+
+	return 0;
+}
+
+static int tegra210_mbdrc_vol_put(struct snd_kcontrol *kcontrol,
+				  struct snd_ctl_elem_value *ucontrol)
+{
+	struct soc_mixer_control *mc =
+		(struct soc_mixer_control *)kcontrol->private_value;
+	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct tegra210_ope *ope = snd_soc_component_get_drvdata(cmpnt);
+	int val = ucontrol->value.integer.value[0];
+	bool change = false;
+
+	val += TEGRA210_MBDRC_MASTER_VOL_MIN;
+
+	regmap_update_bits_check(ope->mbdrc_regmap, mc->reg,
+				 mc->max << mc->shift, val << mc->shift,
+				 &change);
+
+	regmap_read(ope->mbdrc_regmap, mc->reg, &val);
+
+	return change ? 1 : 0;
+}
+
+static const char * const tegra210_mbdrc_mode_text[] = {
+	"Bypass", "Fullband", "Dualband", "Multiband"
+};
+
+static const struct soc_enum tegra210_mbdrc_mode_enum =
+	SOC_ENUM_SINGLE(TEGRA210_MBDRC_CFG, TEGRA210_MBDRC_CFG_MBDRC_MODE_SHIFT,
+			4, tegra210_mbdrc_mode_text);
+
+static const char * const tegra210_mbdrc_peak_rms_text[] = {
+	"Peak", "RMS"
+};
+
+static const struct soc_enum tegra210_mbdrc_peak_rms_enum =
+	SOC_ENUM_SINGLE(TEGRA210_MBDRC_CFG, TEGRA210_MBDRC_CFG_PEAK_RMS_SHIFT,
+			2, tegra210_mbdrc_peak_rms_text);
+
+static const char * const tegra210_mbdrc_filter_structure_text[] = {
+	"All-pass-tree", "Flexible"
+};
+
+static const struct soc_enum tegra210_mbdrc_filter_structure_enum =
+	SOC_ENUM_SINGLE(TEGRA210_MBDRC_CFG,
+			TEGRA210_MBDRC_CFG_FILTER_STRUCTURE_SHIFT, 2,
+			tegra210_mbdrc_filter_structure_text);
+
+static const char * const tegra210_mbdrc_frame_size_text[] = {
+	"N1", "N2", "N4", "N8", "N16", "N32", "N64"
+};
+
+static const struct soc_enum tegra210_mbdrc_frame_size_enum =
+	SOC_ENUM_SINGLE(TEGRA210_MBDRC_CFG, TEGRA210_MBDRC_CFG_FRAME_SIZE_SHIFT,
+			7, tegra210_mbdrc_frame_size_text);
+
+#define TEGRA_MBDRC_BYTES_EXT(xname, xbase, xregs, xshift, xmask, xinfo)    \
+	TEGRA_SOC_BYTES_EXT(xname, xbase, xregs, xshift, xmask,		    \
+			    tegra210_mbdrc_band_params_get,		    \
+			    tegra210_mbdrc_band_params_put,		    \
+			    tegra210_mbdrc_param_info)
+
+#define TEGRA_MBDRC_BAND_BYTES_EXT(xname, xbase, xshift, xmask, xinfo)	    \
+	TEGRA_MBDRC_BYTES_EXT(xname, xbase, TEGRA210_MBDRC_FILTER_COUNT,    \
+			      xshift, xmask, xinfo)
+
+static const DECLARE_TLV_DB_MINMAX(mdbrc_vol_tlv, -25600, 25500);
+
+static const struct snd_kcontrol_new tegra210_mbdrc_controls[] = {
+	SOC_ENUM_EXT("MBDRC Peak RMS Mode", tegra210_mbdrc_peak_rms_enum,
+		     tegra210_mbdrc_get_enum, tegra210_mbdrc_put_enum),
+
+	SOC_ENUM_EXT("MBDRC Filter Structure",
+		     tegra210_mbdrc_filter_structure_enum,
+		     tegra210_mbdrc_get_enum, tegra210_mbdrc_put_enum),
+
+	SOC_ENUM_EXT("MBDRC Frame Size", tegra210_mbdrc_frame_size_enum,
+		     tegra210_mbdrc_get_enum, tegra210_mbdrc_put_enum),
+
+	SOC_ENUM_EXT("MBDRC Mode", tegra210_mbdrc_mode_enum,
+		     tegra210_mbdrc_get_enum, tegra210_mbdrc_put_enum),
+
+	SOC_SINGLE_EXT("MBDRC RMS Offset", TEGRA210_MBDRC_CFG,
+		       TEGRA210_MBDRC_CFG_RMS_OFFSET_SHIFT, 0x1ff, 0,
+		       tegra210_mbdrc_get, tegra210_mbdrc_put),
+
+	SOC_SINGLE_EXT("MBDRC Shift Control", TEGRA210_MBDRC_CFG,
+		       TEGRA210_MBDRC_CFG_SHIFT_CTRL_SHIFT, 0x1f, 0,
+		       tegra210_mbdrc_get, tegra210_mbdrc_put),
+
+	SOC_SINGLE_EXT("MBDRC Fast Attack Factor", TEGRA210_MBDRC_FAST_FACTOR,
+		       TEGRA210_MBDRC_FAST_FACTOR_ATTACK_SHIFT, 0xffff, 0,
+		       tegra210_mbdrc_get, tegra210_mbdrc_put),
+
+	SOC_SINGLE_EXT("MBDRC Fast Release Factor", TEGRA210_MBDRC_FAST_FACTOR,
+		       TEGRA210_MBDRC_FAST_FACTOR_RELEASE_SHIFT, 0xffff, 0,
+		       tegra210_mbdrc_get, tegra210_mbdrc_put),
+
+	SOC_SINGLE_RANGE_EXT_TLV("MBDRC Master Volume",
+				 TEGRA210_MBDRC_MASTER_VOL,
+				 TEGRA210_MBDRC_MASTER_VOL_SHIFT,
+				 0, 0x1ff, 0,
+				 tegra210_mbdrc_vol_get, tegra210_mbdrc_vol_put,
+				 mdbrc_vol_tlv),
+
+	TEGRA_SOC_BYTES_EXT("MBDRC IIR Stages", TEGRA210_MBDRC_IIR_CFG,
+			    TEGRA210_MBDRC_FILTER_COUNT,
+			    TEGRA210_MBDRC_IIR_CFG_NUM_STAGES_SHIFT,
+			    TEGRA210_MBDRC_IIR_CFG_NUM_STAGES_MASK,
+			    tegra210_mbdrc_band_params_get,
+			    tegra210_mbdrc_band_params_put,
+			    tegra210_mbdrc_param_info),
+
+	TEGRA_SOC_BYTES_EXT("MBDRC In Attack Time Const", TEGRA210_MBDRC_IN_ATTACK,
+			    TEGRA210_MBDRC_FILTER_COUNT,
+			    TEGRA210_MBDRC_IN_ATTACK_TC_SHIFT,
+			    TEGRA210_MBDRC_IN_ATTACK_TC_MASK,
+			    tegra210_mbdrc_band_params_get,
+			    tegra210_mbdrc_band_params_put,
+			    tegra210_mbdrc_param_info),
+
+	TEGRA_SOC_BYTES_EXT("MBDRC In Release Time Const", TEGRA210_MBDRC_IN_RELEASE,
+			    TEGRA210_MBDRC_FILTER_COUNT,
+			    TEGRA210_MBDRC_IN_RELEASE_TC_SHIFT,
+			    TEGRA210_MBDRC_IN_RELEASE_TC_MASK,
+			    tegra210_mbdrc_band_params_get,
+			    tegra210_mbdrc_band_params_put,
+			    tegra210_mbdrc_param_info),
+
+	TEGRA_SOC_BYTES_EXT("MBDRC Fast Attack Time Const", TEGRA210_MBDRC_FAST_ATTACK,
+			    TEGRA210_MBDRC_FILTER_COUNT,
+			    TEGRA210_MBDRC_FAST_ATTACK_TC_SHIFT,
+			    TEGRA210_MBDRC_FAST_ATTACK_TC_MASK,
+			    tegra210_mbdrc_band_params_get,
+			    tegra210_mbdrc_band_params_put,
+			    tegra210_mbdrc_param_info),
+
+	TEGRA_SOC_BYTES_EXT("MBDRC In Threshold", TEGRA210_MBDRC_IN_THRESHOLD,
+			    TEGRA210_MBDRC_FILTER_COUNT * 4, 0, 0xffffffff,
+			    tegra210_mbdrc_threshold_get,
+			    tegra210_mbdrc_threshold_put,
+			    tegra210_mbdrc_param_info),
+
+	TEGRA_SOC_BYTES_EXT("MBDRC Out Threshold", TEGRA210_MBDRC_OUT_THRESHOLD,
+			    TEGRA210_MBDRC_FILTER_COUNT * 4, 0, 0xffffffff,
+			    tegra210_mbdrc_threshold_get,
+			    tegra210_mbdrc_threshold_put,
+			    tegra210_mbdrc_param_info),
+
+	TEGRA_SOC_BYTES_EXT("MBDRC Ratio", TEGRA210_MBDRC_RATIO_1ST,
+			    TEGRA210_MBDRC_FILTER_COUNT * 5,
+			    TEGRA210_MBDRC_RATIO_1ST_SHIFT, TEGRA210_MBDRC_RATIO_1ST_MASK,
+			    tegra210_mbdrc_band_params_get,
+			    tegra210_mbdrc_band_params_put,
+			    tegra210_mbdrc_param_info),
+
+	TEGRA_SOC_BYTES_EXT("MBDRC Makeup Gain", TEGRA210_MBDRC_MAKEUP_GAIN,
+			    TEGRA210_MBDRC_FILTER_COUNT,
+			    TEGRA210_MBDRC_MAKEUP_GAIN_SHIFT,
+			    TEGRA210_MBDRC_MAKEUP_GAIN_MASK,
+			    tegra210_mbdrc_band_params_get,
+			    tegra210_mbdrc_band_params_put,
+			    tegra210_mbdrc_param_info),
+
+	TEGRA_SOC_BYTES_EXT("MBDRC Init Gain", TEGRA210_MBDRC_INIT_GAIN,
+			    TEGRA210_MBDRC_FILTER_COUNT,
+			    TEGRA210_MBDRC_INIT_GAIN_SHIFT,
+			    TEGRA210_MBDRC_INIT_GAIN_MASK,
+			    tegra210_mbdrc_band_params_get,
+			    tegra210_mbdrc_band_params_put,
+			    tegra210_mbdrc_param_info),
+
+	TEGRA_SOC_BYTES_EXT("MBDRC Attack Gain", TEGRA210_MBDRC_GAIN_ATTACK,
+			    TEGRA210_MBDRC_FILTER_COUNT,
+			    TEGRA210_MBDRC_GAIN_ATTACK_SHIFT,
+			    TEGRA210_MBDRC_GAIN_ATTACK_MASK,
+			    tegra210_mbdrc_band_params_get,
+			    tegra210_mbdrc_band_params_put,
+			    tegra210_mbdrc_param_info),
+
+	TEGRA_SOC_BYTES_EXT("MBDRC Release Gain", TEGRA210_MBDRC_GAIN_RELEASE,
+			    TEGRA210_MBDRC_FILTER_COUNT,
+			    TEGRA210_MBDRC_GAIN_RELEASE_SHIFT,
+			    TEGRA210_MBDRC_GAIN_RELEASE_MASK,
+			    tegra210_mbdrc_band_params_get,
+			    tegra210_mbdrc_band_params_put,
+			    tegra210_mbdrc_param_info),
+
+	TEGRA_SOC_BYTES_EXT("MBDRC Fast Release Gain",
+			    TEGRA210_MBDRC_FAST_RELEASE,
+			    TEGRA210_MBDRC_FILTER_COUNT,
+			    TEGRA210_MBDRC_FAST_RELEASE_SHIFT,
+			    TEGRA210_MBDRC_FAST_RELEASE_MASK,
+			    tegra210_mbdrc_band_params_get,
+			    tegra210_mbdrc_band_params_put,
+			    tegra210_mbdrc_param_info),
+
+	TEGRA_SOC_BYTES_EXT("MBDRC Low Band Biquad Coeffs",
+			    TEGRA210_MBDRC_CFG_RAM_CTRL,
+			    TEGRA210_MBDRC_MAX_BIQUAD_STAGES * 5, 0, 0xffffffff,
+			    tegra210_mbdrc_biquad_coeffs_get,
+			    tegra210_mbdrc_biquad_coeffs_put,
+			    tegra210_mbdrc_param_info),
+
+	TEGRA_SOC_BYTES_EXT("MBDRC Mid Band Biquad Coeffs",
+			    TEGRA210_MBDRC_CFG_RAM_CTRL +
+				TEGRA210_MBDRC_FILTER_PARAM_STRIDE,
+			    TEGRA210_MBDRC_MAX_BIQUAD_STAGES * 5, 0, 0xffffffff,
+			    tegra210_mbdrc_biquad_coeffs_get,
+			    tegra210_mbdrc_biquad_coeffs_put,
+			    tegra210_mbdrc_param_info),
+
+	TEGRA_SOC_BYTES_EXT("MBDRC High Band Biquad Coeffs",
+			    TEGRA210_MBDRC_CFG_RAM_CTRL +
+				(TEGRA210_MBDRC_FILTER_PARAM_STRIDE * 2),
+			    TEGRA210_MBDRC_MAX_BIQUAD_STAGES * 5, 0, 0xffffffff,
+			    tegra210_mbdrc_biquad_coeffs_get,
+			    tegra210_mbdrc_biquad_coeffs_put,
+			    tegra210_mbdrc_param_info),
+};
+
+static bool tegra210_mbdrc_wr_reg(struct device *dev, unsigned int reg)
+{
+	if (reg >= TEGRA210_MBDRC_IIR_CFG)
+		reg -= ((reg - TEGRA210_MBDRC_IIR_CFG) %
+			(TEGRA210_MBDRC_FILTER_PARAM_STRIDE *
+			 TEGRA210_MBDRC_FILTER_COUNT));
+
+	switch (reg) {
+	case TEGRA210_MBDRC_SOFT_RESET:
+	case TEGRA210_MBDRC_CG:
+	case TEGRA210_MBDRC_CFG ... TEGRA210_MBDRC_CFG_RAM_DATA:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool tegra210_mbdrc_rd_reg(struct device *dev, unsigned int reg)
+{
+	if (tegra210_mbdrc_wr_reg(dev, reg))
+		return true;
+
+	if (reg >= TEGRA210_MBDRC_IIR_CFG)
+		reg -= ((reg - TEGRA210_MBDRC_IIR_CFG) %
+			(TEGRA210_MBDRC_FILTER_PARAM_STRIDE *
+			 TEGRA210_MBDRC_FILTER_COUNT));
+
+	switch (reg) {
+	case TEGRA210_MBDRC_STATUS:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool tegra210_mbdrc_volatile_reg(struct device *dev, unsigned int reg)
+{
+	if (reg >= TEGRA210_MBDRC_IIR_CFG)
+		reg -= ((reg - TEGRA210_MBDRC_IIR_CFG) %
+			(TEGRA210_MBDRC_FILTER_PARAM_STRIDE *
+			 TEGRA210_MBDRC_FILTER_COUNT));
+
+	switch (reg) {
+	case TEGRA210_MBDRC_SOFT_RESET:
+	case TEGRA210_MBDRC_STATUS:
+	case TEGRA210_MBDRC_CFG_RAM_CTRL:
+	case TEGRA210_MBDRC_CFG_RAM_DATA:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool tegra210_mbdrc_precious_reg(struct device *dev, unsigned int reg)
+{
+	if (reg >= TEGRA210_MBDRC_IIR_CFG)
+		reg -= ((reg - TEGRA210_MBDRC_IIR_CFG) %
+			(TEGRA210_MBDRC_FILTER_PARAM_STRIDE *
+			 TEGRA210_MBDRC_FILTER_COUNT));
+
+	switch (reg) {
+	case TEGRA210_MBDRC_CFG_RAM_DATA:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static const struct regmap_config tegra210_mbdrc_regmap_cfg = {
+	.name			= "mbdrc",
+	.reg_bits		= 32,
+	.reg_stride		= 4,
+	.val_bits		= 32,
+	.max_register		= TEGRA210_MBDRC_MAX_REG,
+	.writeable_reg		= tegra210_mbdrc_wr_reg,
+	.readable_reg		= tegra210_mbdrc_rd_reg,
+	.volatile_reg		= tegra210_mbdrc_volatile_reg,
+	.precious_reg		= tegra210_mbdrc_precious_reg,
+	.reg_defaults		= tegra210_mbdrc_reg_defaults,
+	.num_reg_defaults	= ARRAY_SIZE(tegra210_mbdrc_reg_defaults),
+	.cache_type		= REGCACHE_FLAT,
+};
+
+int tegra210_mbdrc_hw_params(struct snd_soc_component *cmpnt)
+{
+	struct tegra210_ope *ope = snd_soc_component_get_drvdata(cmpnt);
+	const struct tegra210_mbdrc_config *conf = &mbdrc_init_config;
+	u32 val = 0;
+	unsigned int i;
+
+	regmap_read(ope->mbdrc_regmap, TEGRA210_MBDRC_CFG, &val);
+
+	if (val & TEGRA210_MBDRC_CFG_MBDRC_MODE_BYPASS)
+		return 0;
+
+	for (i = 0; i < MBDRC_NUM_BAND; i++) {
+		const struct tegra210_mbdrc_band_params *params =
+			&conf->band_params[i];
+
+		u32 reg_off = i * TEGRA210_MBDRC_FILTER_PARAM_STRIDE;
+
+		tegra210_mbdrc_write_ram(ope->mbdrc_regmap,
+					 reg_off + TEGRA210_MBDRC_CFG_RAM_CTRL,
+					 reg_off + TEGRA210_MBDRC_CFG_RAM_DATA,
+					 0, (u32 *)&params->biquad_params[0],
+					 TEGRA210_MBDRC_MAX_BIQUAD_STAGES * 5);
+	}
+	return 0;
+}
+
+int tegra210_mbdrc_component_init(struct snd_soc_component *cmpnt)
+{
+	struct tegra210_ope *ope = snd_soc_component_get_drvdata(cmpnt);
+	const struct tegra210_mbdrc_config *conf = &mbdrc_init_config;
+	unsigned int i;
+	u32 val;
+
+	pm_runtime_get_sync(cmpnt->dev);
+
+	/* Initialize MBDRC registers and AHUB RAM with default params */
+	regmap_update_bits(ope->mbdrc_regmap, TEGRA210_MBDRC_CFG,
+		TEGRA210_MBDRC_CFG_MBDRC_MODE_MASK,
+		conf->mode << TEGRA210_MBDRC_CFG_MBDRC_MODE_SHIFT);
+
+	regmap_update_bits(ope->mbdrc_regmap, TEGRA210_MBDRC_CFG,
+		TEGRA210_MBDRC_CFG_RMS_OFFSET_MASK,
+		conf->rms_off << TEGRA210_MBDRC_CFG_RMS_OFFSET_SHIFT);
+
+	regmap_update_bits(ope->mbdrc_regmap, TEGRA210_MBDRC_CFG,
+		TEGRA210_MBDRC_CFG_PEAK_RMS_MASK,
+		conf->peak_rms_mode << TEGRA210_MBDRC_CFG_PEAK_RMS_SHIFT);
+
+	regmap_update_bits(ope->mbdrc_regmap, TEGRA210_MBDRC_CFG,
+		TEGRA210_MBDRC_CFG_FILTER_STRUCTURE_MASK,
+		conf->fliter_structure <<
+		TEGRA210_MBDRC_CFG_FILTER_STRUCTURE_SHIFT);
+
+	regmap_update_bits(ope->mbdrc_regmap, TEGRA210_MBDRC_CFG,
+		TEGRA210_MBDRC_CFG_SHIFT_CTRL_MASK,
+		conf->shift_ctrl << TEGRA210_MBDRC_CFG_SHIFT_CTRL_SHIFT);
+
+	regmap_update_bits(ope->mbdrc_regmap, TEGRA210_MBDRC_CFG,
+		TEGRA210_MBDRC_CFG_FRAME_SIZE_MASK,
+		__ffs(conf->frame_size) <<
+		TEGRA210_MBDRC_CFG_FRAME_SIZE_SHIFT);
+
+	regmap_update_bits(ope->mbdrc_regmap, TEGRA210_MBDRC_CHANNEL_MASK,
+		TEGRA210_MBDRC_CHANNEL_MASK_MASK,
+		conf->channel_mask << TEGRA210_MBDRC_CHANNEL_MASK_SHIFT);
+
+	regmap_update_bits(ope->mbdrc_regmap, TEGRA210_MBDRC_FAST_FACTOR,
+		TEGRA210_MBDRC_FAST_FACTOR_ATTACK_MASK,
+		conf->fa_factor << TEGRA210_MBDRC_FAST_FACTOR_ATTACK_SHIFT);
+
+	regmap_update_bits(ope->mbdrc_regmap, TEGRA210_MBDRC_FAST_FACTOR,
+		TEGRA210_MBDRC_FAST_FACTOR_ATTACK_MASK,
+		conf->fr_factor << TEGRA210_MBDRC_FAST_FACTOR_ATTACK_SHIFT);
+
+	for (i = 0; i < MBDRC_NUM_BAND; i++) {
+		const struct tegra210_mbdrc_band_params *params =
+						&conf->band_params[i];
+		u32 reg_off = i * TEGRA210_MBDRC_FILTER_PARAM_STRIDE;
+
+		regmap_update_bits(ope->mbdrc_regmap,
+			reg_off + TEGRA210_MBDRC_IIR_CFG,
+			TEGRA210_MBDRC_IIR_CFG_NUM_STAGES_MASK,
+			params->iir_stages <<
+				TEGRA210_MBDRC_IIR_CFG_NUM_STAGES_SHIFT);
+
+		regmap_update_bits(ope->mbdrc_regmap,
+			reg_off + TEGRA210_MBDRC_IN_ATTACK,
+			TEGRA210_MBDRC_IN_ATTACK_TC_MASK,
+			params->in_attack_tc <<
+				TEGRA210_MBDRC_IN_ATTACK_TC_SHIFT);
+
+		regmap_update_bits(ope->mbdrc_regmap,
+			reg_off + TEGRA210_MBDRC_IN_RELEASE,
+			TEGRA210_MBDRC_IN_RELEASE_TC_MASK,
+			params->in_release_tc <<
+				TEGRA210_MBDRC_IN_RELEASE_TC_SHIFT);
+
+		regmap_update_bits(ope->mbdrc_regmap,
+			reg_off + TEGRA210_MBDRC_FAST_ATTACK,
+			TEGRA210_MBDRC_FAST_ATTACK_TC_MASK,
+			params->fast_attack_tc <<
+				TEGRA210_MBDRC_FAST_ATTACK_TC_SHIFT);
+
+		val = (((params->in_threshold[0] >>
+			 TEGRA210_MBDRC_THRESH_1ST_SHIFT) &
+			TEGRA210_MBDRC_THRESH_1ST_MASK) |
+			((params->in_threshold[1] >>
+			  TEGRA210_MBDRC_THRESH_2ND_SHIFT) &
+			 TEGRA210_MBDRC_THRESH_2ND_MASK) |
+			((params->in_threshold[2] >>
+			  TEGRA210_MBDRC_THRESH_3RD_SHIFT) &
+			 TEGRA210_MBDRC_THRESH_3RD_MASK) |
+			((params->in_threshold[3] >>
+			  TEGRA210_MBDRC_THRESH_4TH_SHIFT) &
+			 TEGRA210_MBDRC_THRESH_4TH_MASK));
+
+		regmap_update_bits(ope->mbdrc_regmap,
+				   reg_off + TEGRA210_MBDRC_IN_THRESHOLD,
+				   0xffffffff, val);
+
+		val = (((params->out_threshold[0] >>
+			 TEGRA210_MBDRC_THRESH_1ST_SHIFT) &
+			TEGRA210_MBDRC_THRESH_1ST_MASK) |
+			((params->out_threshold[1] >>
+			  TEGRA210_MBDRC_THRESH_2ND_SHIFT) &
+			 TEGRA210_MBDRC_THRESH_2ND_MASK) |
+			((params->out_threshold[2] >>
+			  TEGRA210_MBDRC_THRESH_3RD_SHIFT) &
+			 TEGRA210_MBDRC_THRESH_3RD_MASK) |
+			((params->out_threshold[3] >>
+			  TEGRA210_MBDRC_THRESH_4TH_SHIFT) &
+			 TEGRA210_MBDRC_THRESH_4TH_MASK));
+
+		regmap_update_bits(ope->mbdrc_regmap,
+			reg_off + TEGRA210_MBDRC_OUT_THRESHOLD,
+			0xffffffff, val);
+
+		regmap_update_bits(ope->mbdrc_regmap,
+			reg_off + TEGRA210_MBDRC_RATIO_1ST,
+			TEGRA210_MBDRC_RATIO_1ST_MASK,
+			params->ratio[0] << TEGRA210_MBDRC_RATIO_1ST_SHIFT);
+
+		regmap_update_bits(ope->mbdrc_regmap,
+			reg_off + TEGRA210_MBDRC_RATIO_2ND,
+			TEGRA210_MBDRC_RATIO_2ND_MASK,
+			params->ratio[1] << TEGRA210_MBDRC_RATIO_2ND_SHIFT);
+
+		regmap_update_bits(ope->mbdrc_regmap,
+			reg_off + TEGRA210_MBDRC_RATIO_3RD,
+			TEGRA210_MBDRC_RATIO_3RD_MASK,
+			params->ratio[2] << TEGRA210_MBDRC_RATIO_3RD_SHIFT);
+
+		regmap_update_bits(ope->mbdrc_regmap,
+			reg_off + TEGRA210_MBDRC_RATIO_4TH,
+			TEGRA210_MBDRC_RATIO_4TH_MASK,
+			params->ratio[3] << TEGRA210_MBDRC_RATIO_4TH_SHIFT);
+
+		regmap_update_bits(ope->mbdrc_regmap,
+			reg_off + TEGRA210_MBDRC_RATIO_5TH,
+			TEGRA210_MBDRC_RATIO_5TH_MASK,
+			params->ratio[4] << TEGRA210_MBDRC_RATIO_5TH_SHIFT);
+
+		regmap_update_bits(ope->mbdrc_regmap,
+			reg_off + TEGRA210_MBDRC_MAKEUP_GAIN,
+			TEGRA210_MBDRC_MAKEUP_GAIN_MASK,
+			params->makeup_gain <<
+				TEGRA210_MBDRC_MAKEUP_GAIN_SHIFT);
+
+		regmap_update_bits(ope->mbdrc_regmap,
+			reg_off + TEGRA210_MBDRC_INIT_GAIN,
+			TEGRA210_MBDRC_INIT_GAIN_MASK,
+			params->gain_init <<
+				TEGRA210_MBDRC_INIT_GAIN_SHIFT);
+
+		regmap_update_bits(ope->mbdrc_regmap,
+			reg_off + TEGRA210_MBDRC_GAIN_ATTACK,
+			TEGRA210_MBDRC_GAIN_ATTACK_MASK,
+			params->gain_attack_tc <<
+				TEGRA210_MBDRC_GAIN_ATTACK_SHIFT);
+
+		regmap_update_bits(ope->mbdrc_regmap,
+			reg_off + TEGRA210_MBDRC_GAIN_RELEASE,
+			TEGRA210_MBDRC_GAIN_RELEASE_MASK,
+			params->gain_release_tc <<
+				TEGRA210_MBDRC_GAIN_RELEASE_SHIFT);
+
+		regmap_update_bits(ope->mbdrc_regmap,
+			reg_off + TEGRA210_MBDRC_FAST_RELEASE,
+			TEGRA210_MBDRC_FAST_RELEASE_MASK,
+			params->fast_release_tc <<
+				TEGRA210_MBDRC_FAST_RELEASE_SHIFT);
+
+		tegra210_mbdrc_write_ram(ope->mbdrc_regmap,
+			reg_off + TEGRA210_MBDRC_CFG_RAM_CTRL,
+			reg_off + TEGRA210_MBDRC_CFG_RAM_DATA, 0,
+			(u32 *)&params->biquad_params[0],
+			TEGRA210_MBDRC_MAX_BIQUAD_STAGES * 5);
+	}
+
+	pm_runtime_put_sync(cmpnt->dev);
+
+	snd_soc_add_component_controls(cmpnt, tegra210_mbdrc_controls,
+				       ARRAY_SIZE(tegra210_mbdrc_controls));
+
+	return 0;
+}
+
+int tegra210_mbdrc_regmap_init(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct tegra210_ope *ope = dev_get_drvdata(dev);
+	struct device_node *child;
+	struct resource mem;
+	void __iomem *regs;
+	int err;
+
+	child = of_get_child_by_name(dev->of_node, "mbdrc");
+	if (!child)
+		return -ENODEV;
+
+	err = of_address_to_resource(child, 0, &mem);
+	of_node_put(child);
+	if (err < 0) {
+		dev_err(dev, "fail to get MBDRC resource\n");
+		return err;
+	}
+
+	mem.flags = IORESOURCE_MEM;
+	regs = devm_ioremap_resource(dev, &mem);
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
+
+	ope->mbdrc_regmap = devm_regmap_init_mmio(dev, regs,
+						  &tegra210_mbdrc_regmap_cfg);
+	if (IS_ERR(ope->mbdrc_regmap)) {
+		dev_err(dev, "regmap init failed\n");
+		return PTR_ERR(ope->mbdrc_regmap);
+	}
+
+	regcache_cache_only(ope->mbdrc_regmap, true);
+
+	return 0;
+}
diff --git a/sound/soc/tegra/tegra210_mbdrc.h b/sound/soc/tegra/tegra210_mbdrc.h
new file mode 100644
index 00000000..4c48da0
--- /dev/null
+++ b/sound/soc/tegra/tegra210_mbdrc.h
@@ -0,0 +1,215 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * tegra210_mbdrc.h - Definitions for Tegra210 MBDRC driver
+ *
+ * Copyright (c) 2022, NVIDIA CORPORATION. All rights reserved.
+ *
+ */
+
+#ifndef __TEGRA210_MBDRC_H__
+#define __TEGRA210_MBDRC_H__
+
+#include <linux/platform_device.h>
+#include <sound/soc.h>
+
+/* Register offsets from TEGRA210_MBDRC*_BASE */
+#define TEGRA210_MBDRC_SOFT_RESET			0x4
+#define TEGRA210_MBDRC_CG				0x8
+#define TEGRA210_MBDRC_STATUS				0xc
+#define TEGRA210_MBDRC_CFG				0x28
+#define TEGRA210_MBDRC_CHANNEL_MASK			0x2c
+#define TEGRA210_MBDRC_MASTER_VOL			0x30
+#define TEGRA210_MBDRC_FAST_FACTOR			0x34
+
+#define TEGRA210_MBDRC_FILTER_COUNT			3
+#define TEGRA210_MBDRC_FILTER_PARAM_STRIDE		0x4
+
+#define TEGRA210_MBDRC_IIR_CFG				0x38
+#define TEGRA210_MBDRC_IN_ATTACK			0x44
+#define TEGRA210_MBDRC_IN_RELEASE			0x50
+#define TEGRA210_MBDRC_FAST_ATTACK			0x5c
+#define TEGRA210_MBDRC_IN_THRESHOLD			0x68
+#define TEGRA210_MBDRC_OUT_THRESHOLD			0x74
+#define TEGRA210_MBDRC_RATIO_1ST			0x80
+#define TEGRA210_MBDRC_RATIO_2ND			0x8c
+#define TEGRA210_MBDRC_RATIO_3RD			0x98
+#define TEGRA210_MBDRC_RATIO_4TH			0xa4
+#define TEGRA210_MBDRC_RATIO_5TH			0xb0
+#define TEGRA210_MBDRC_MAKEUP_GAIN			0xbc
+#define TEGRA210_MBDRC_INIT_GAIN			0xc8
+#define TEGRA210_MBDRC_GAIN_ATTACK			0xd4
+#define TEGRA210_MBDRC_GAIN_RELEASE			0xe0
+#define TEGRA210_MBDRC_FAST_RELEASE			0xec
+#define TEGRA210_MBDRC_CFG_RAM_CTRL			0xf8
+#define TEGRA210_MBDRC_CFG_RAM_DATA			0x104
+
+#define TEGRA210_MBDRC_MAX_REG				(TEGRA210_MBDRC_CFG_RAM_DATA +		\
+							 (TEGRA210_MBDRC_FILTER_PARAM_STRIDE *	\
+							  (TEGRA210_MBDRC_FILTER_COUNT - 1)))
+
+/* Fields for TEGRA210_MBDRC_CFG */
+#define TEGRA210_MBDRC_CFG_RMS_OFFSET_SHIFT		16
+#define TEGRA210_MBDRC_CFG_RMS_OFFSET_MASK		(0x1ff << TEGRA210_MBDRC_CFG_RMS_OFFSET_SHIFT)
+
+#define TEGRA210_MBDRC_CFG_PEAK_RMS_SHIFT		14
+#define TEGRA210_MBDRC_CFG_PEAK_RMS_MASK		(0x1 << TEGRA210_MBDRC_CFG_PEAK_RMS_SHIFT)
+#define TEGRA210_MBDRC_CFG_PEAK				(1 << TEGRA210_MBDRC_CFG_PEAK_RMS_SHIFT)
+
+#define TEGRA210_MBDRC_CFG_FILTER_STRUCTURE_SHIFT	13
+#define TEGRA210_MBDRC_CFG_FILTER_STRUCTURE_MASK	(0x1 << TEGRA210_MBDRC_CFG_FILTER_STRUCTURE_SHIFT)
+#define TEGRA210_MBDRC_CFG_FILTER_STRUCTURE_FLEX	(1 << TEGRA210_MBDRC_CFG_FILTER_STRUCTURE_SHIFT)
+
+#define TEGRA210_MBDRC_CFG_SHIFT_CTRL_SHIFT		8
+#define TEGRA210_MBDRC_CFG_SHIFT_CTRL_MASK		(0x1f << TEGRA210_MBDRC_CFG_SHIFT_CTRL_SHIFT)
+
+#define TEGRA210_MBDRC_CFG_FRAME_SIZE_SHIFT		4
+#define TEGRA210_MBDRC_CFG_FRAME_SIZE_MASK		(0xf << TEGRA210_MBDRC_CFG_FRAME_SIZE_SHIFT)
+
+#define TEGRA210_MBDRC_CFG_MBDRC_MODE_SHIFT		0
+#define TEGRA210_MBDRC_CFG_MBDRC_MODE_MASK		(0x3 << TEGRA210_MBDRC_CFG_MBDRC_MODE_SHIFT)
+#define TEGRA210_MBDRC_CFG_MBDRC_MODE_BYPASS		(0 << TEGRA210_MBDRC_CFG_MBDRC_MODE_SHIFT)
+
+/* Fields for TEGRA210_MBDRC_CHANNEL_MASK */
+#define TEGRA210_MBDRC_CHANNEL_MASK_SHIFT		0
+#define TEGRA210_MBDRC_CHANNEL_MASK_MASK		(0xff << TEGRA210_MBDRC_CHANNEL_MASK_SHIFT)
+
+/* Fields for TEGRA210_MBDRC_MASTER_VOL */
+#define TEGRA210_MBDRC_MASTER_VOL_SHIFT			23
+#define TEGRA210_MBDRC_MASTER_VOL_MIN			-256
+#define TEGRA210_MBDRC_MASTER_VOL_MAX			256
+
+/* Fields for TEGRA210_MBDRC_FAST_FACTOR */
+#define TEGRA210_MBDRC_FAST_FACTOR_RELEASE_SHIFT	16
+#define TEGRA210_MBDRC_FAST_FACTOR_RELEASE_MASK		(0xffff << TEGRA210_MBDRC_FAST_FACTOR_RELEASE_SHIFT)
+
+#define TEGRA210_MBDRC_FAST_FACTOR_ATTACK_SHIFT		0
+#define TEGRA210_MBDRC_FAST_FACTOR_ATTACK_MASK		(0xffff << TEGRA210_MBDRC_FAST_FACTOR_ATTACK_SHIFT)
+
+/* Fields for TEGRA210_MBDRC_IIR_CFG */
+#define TEGRA210_MBDRC_IIR_CFG_NUM_STAGES_SHIFT		0
+#define TEGRA210_MBDRC_IIR_CFG_NUM_STAGES_MASK		(0xf << TEGRA210_MBDRC_IIR_CFG_NUM_STAGES_SHIFT)
+
+/* Fields for TEGRA210_MBDRC_IN_ATTACK */
+#define TEGRA210_MBDRC_IN_ATTACK_TC_SHIFT		0
+#define TEGRA210_MBDRC_IN_ATTACK_TC_MASK		(0xffffffff << TEGRA210_MBDRC_IN_ATTACK_TC_SHIFT)
+
+/* Fields for TEGRA210_MBDRC_IN_RELEASE */
+#define TEGRA210_MBDRC_IN_RELEASE_TC_SHIFT		0
+#define TEGRA210_MBDRC_IN_RELEASE_TC_MASK		(0xffffffff << TEGRA210_MBDRC_IN_RELEASE_TC_SHIFT)
+
+/* Fields for TEGRA210_MBDRC_FAST_ATTACK */
+#define TEGRA210_MBDRC_FAST_ATTACK_TC_SHIFT		0
+#define TEGRA210_MBDRC_FAST_ATTACK_TC_MASK		(0xffffffff << TEGRA210_MBDRC_FAST_ATTACK_TC_SHIFT)
+
+/* Fields for TEGRA210_MBDRC_IN_THRESHOLD / TEGRA210_MBDRC_OUT_THRESHOLD */
+#define TEGRA210_MBDRC_THRESH_4TH_SHIFT			24
+#define TEGRA210_MBDRC_THRESH_4TH_MASK			(0xff << TEGRA210_MBDRC_THRESH_4TH_SHIFT)
+
+#define TEGRA210_MBDRC_THRESH_3RD_SHIFT			16
+#define TEGRA210_MBDRC_THRESH_3RD_MASK			(0xff << TEGRA210_MBDRC_THRESH_3RD_SHIFT)
+
+#define TEGRA210_MBDRC_THRESH_2ND_SHIFT			8
+#define TEGRA210_MBDRC_THRESH_2ND_MASK			(0xff << TEGRA210_MBDRC_THRESH_2ND_SHIFT)
+
+#define TEGRA210_MBDRC_THRESH_1ST_SHIFT			0
+#define TEGRA210_MBDRC_THRESH_1ST_MASK			(0xff << TEGRA210_MBDRC_THRESH_1ST_SHIFT)
+
+/* Fields for TEGRA210_MBDRC_RATIO_1ST */
+#define TEGRA210_MBDRC_RATIO_1ST_SHIFT			0
+#define TEGRA210_MBDRC_RATIO_1ST_MASK			(0xffff << TEGRA210_MBDRC_RATIO_1ST_SHIFT)
+
+/* Fields for TEGRA210_MBDRC_RATIO_2ND */
+#define TEGRA210_MBDRC_RATIO_2ND_SHIFT			0
+#define TEGRA210_MBDRC_RATIO_2ND_MASK			(0xffff << TEGRA210_MBDRC_RATIO_2ND_SHIFT)
+
+/* Fields for TEGRA210_MBDRC_RATIO_3RD */
+#define TEGRA210_MBDRC_RATIO_3RD_SHIFT			0
+#define TEGRA210_MBDRC_RATIO_3RD_MASK			(0xffff << TEGRA210_MBDRC_RATIO_3RD_SHIFT)
+
+/* Fields for TEGRA210_MBDRC_RATIO_4TH */
+#define TEGRA210_MBDRC_RATIO_4TH_SHIFT			0
+#define TEGRA210_MBDRC_RATIO_4TH_MASK			(0xffff << TEGRA210_MBDRC_RATIO_4TH_SHIFT)
+
+/* Fields for TEGRA210_MBDRC_RATIO_5TH */
+#define TEGRA210_MBDRC_RATIO_5TH_SHIFT			0
+#define TEGRA210_MBDRC_RATIO_5TH_MASK			(0xffff << TEGRA210_MBDRC_RATIO_5TH_SHIFT)
+
+/* Fields for TEGRA210_MBDRC_MAKEUP_GAIN */
+#define TEGRA210_MBDRC_MAKEUP_GAIN_SHIFT		0
+#define TEGRA210_MBDRC_MAKEUP_GAIN_MASK			(0x3f << TEGRA210_MBDRC_MAKEUP_GAIN_SHIFT)
+
+/* Fields for TEGRA210_MBDRC_INIT_GAIN */
+#define TEGRA210_MBDRC_INIT_GAIN_SHIFT			0
+#define TEGRA210_MBDRC_INIT_GAIN_MASK			(0xffffffff << TEGRA210_MBDRC_INIT_GAIN_SHIFT)
+
+/* Fields for TEGRA210_MBDRC_GAIN_ATTACK */
+#define TEGRA210_MBDRC_GAIN_ATTACK_SHIFT		0
+#define TEGRA210_MBDRC_GAIN_ATTACK_MASK			(0xffffffff << TEGRA210_MBDRC_GAIN_ATTACK_SHIFT)
+
+/* Fields for TEGRA210_MBDRC_GAIN_RELEASE */
+#define TEGRA210_MBDRC_GAIN_RELEASE_SHIFT		0
+#define TEGRA210_MBDRC_GAIN_RELEASE_MASK		(0xffffffff << TEGRA210_MBDRC_GAIN_RELEASE_SHIFT)
+
+/* Fields for TEGRA210_MBDRC_FAST_RELEASE */
+#define TEGRA210_MBDRC_FAST_RELEASE_SHIFT		0
+#define TEGRA210_MBDRC_FAST_RELEASE_MASK		(0xffffffff << TEGRA210_MBDRC_FAST_RELEASE_SHIFT)
+
+#define TEGRA210_MBDRC_RAM_CTRL_RW_READ			0
+#define TEGRA210_MBDRC_RAM_CTRL_RW_WRITE		(1 << 14)
+#define TEGRA210_MBDRC_RAM_CTRL_ADDR_INIT_EN		(1 << 13)
+#define TEGRA210_MBDRC_RAM_CTRL_SEQ_ACCESS_EN		(1 << 12)
+#define TEGRA210_MBDRC_RAM_CTRL_RAM_ADDR_MASK		0x1ff
+
+/*
+ * Order and size of each structure element for following structures should not
+ * be altered size order of elements and their size are based on PEQ co-eff ram
+ * and shift ram layout.
+ */
+#define TEGRA210_MBDRC_THRESHOLD_NUM				4
+#define TEGRA210_MBDRC_RATIO_NUM				(TEGRA210_MBDRC_THRESHOLD_NUM + 1)
+#define TEGRA210_MBDRC_MAX_BIQUAD_STAGES			8
+
+/* Order of these enums are same as the order of band specific hw registers */
+enum {
+	MBDRC_LOW_BAND,
+	MBDRC_MID_BAND,
+	MBDRC_HIGH_BAND,
+	MBDRC_NUM_BAND,
+};
+
+struct tegra210_mbdrc_band_params {
+	u32 band;
+	u32 iir_stages;
+	u32 in_attack_tc;
+	u32 in_release_tc;
+	u32 fast_attack_tc;
+	u32 in_threshold[TEGRA210_MBDRC_THRESHOLD_NUM];
+	u32 out_threshold[TEGRA210_MBDRC_THRESHOLD_NUM];
+	u32 ratio[TEGRA210_MBDRC_RATIO_NUM];
+	u32 makeup_gain;
+	u32 gain_init;
+	u32 gain_attack_tc;
+	u32 gain_release_tc;
+	u32 fast_release_tc;
+	/* For biquad_params[][5] order of coeff is b0, b1, a0, a1, a2 */
+	u32 biquad_params[TEGRA210_MBDRC_MAX_BIQUAD_STAGES * 5];
+};
+
+struct tegra210_mbdrc_config {
+	unsigned int mode;
+	unsigned int rms_off;
+	unsigned int peak_rms_mode;
+	unsigned int fliter_structure;
+	unsigned int shift_ctrl;
+	unsigned int frame_size;
+	unsigned int channel_mask;
+	unsigned int fa_factor;	/* Fast attack factor */
+	unsigned int fr_factor;	/* Fast release factor */
+	struct tegra210_mbdrc_band_params band_params[MBDRC_NUM_BAND];
+};
+
+int tegra210_mbdrc_regmap_init(struct platform_device *pdev);
+int tegra210_mbdrc_component_init(struct snd_soc_component *cmpnt);
+int tegra210_mbdrc_hw_params(struct snd_soc_component *cmpnt);
+
+#endif
diff --git a/sound/soc/tegra/tegra210_ope.c b/sound/soc/tegra/tegra210_ope.c
new file mode 100644
index 00000000..3dd2bde
--- /dev/null
+++ b/sound/soc/tegra/tegra210_ope.c
@@ -0,0 +1,419 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// tegra210_ope.c - Tegra210 OPE driver
+//
+// Copyright (c) 2022, NVIDIA CORPORATION. All rights reserved.
+
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <sound/core.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+
+#include "tegra210_mbdrc.h"
+#include "tegra210_ope.h"
+#include "tegra210_peq.h"
+#include "tegra_cif.h"
+
+static const struct reg_default tegra210_ope_reg_defaults[] = {
+	{ TEGRA210_OPE_RX_INT_MASK, 0x00000001},
+	{ TEGRA210_OPE_RX_CIF_CTRL, 0x00007700},
+	{ TEGRA210_OPE_TX_INT_MASK, 0x00000001},
+	{ TEGRA210_OPE_TX_CIF_CTRL, 0x00007700},
+	{ TEGRA210_OPE_CG, 0x1},
+};
+
+static int tegra210_ope_set_audio_cif(struct tegra210_ope *ope,
+				      struct snd_pcm_hw_params *params,
+				      unsigned int reg)
+{
+	int channels, audio_bits;
+	struct tegra_cif_conf cif_conf;
+
+	memset(&cif_conf, 0, sizeof(struct tegra_cif_conf));
+
+	channels = params_channels(params);
+	if (channels < 2)
+		return -EINVAL;
+
+	switch (params_format(params)) {
+	case SNDRV_PCM_FORMAT_S16_LE:
+		audio_bits = TEGRA_ACIF_BITS_16;
+		break;
+	case SNDRV_PCM_FORMAT_S32_LE:
+		audio_bits = TEGRA_ACIF_BITS_32;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	cif_conf.audio_ch = channels;
+	cif_conf.client_ch = channels;
+	cif_conf.audio_bits = audio_bits;
+	cif_conf.client_bits = audio_bits;
+
+	tegra_set_cif(ope->regmap, reg, &cif_conf);
+
+	return 0;
+}
+
+static int tegra210_ope_hw_params(struct snd_pcm_substream *substream,
+				 struct snd_pcm_hw_params *params,
+				 struct snd_soc_dai *dai)
+{
+	struct device *dev = dai->dev;
+	struct tegra210_ope *ope = snd_soc_dai_get_drvdata(dai);
+	int err;
+
+	/* Set RX and TX CIF */
+	err = tegra210_ope_set_audio_cif(ope, params,
+					 TEGRA210_OPE_RX_CIF_CTRL);
+	if (err) {
+		dev_err(dev, "Can't set OPE RX CIF: %d\n", err);
+		return err;
+	}
+
+	err = tegra210_ope_set_audio_cif(ope, params,
+					 TEGRA210_OPE_TX_CIF_CTRL);
+	if (err) {
+		dev_err(dev, "Can't set OPE TX CIF: %d\n", err);
+		return err;
+	}
+
+	tegra210_mbdrc_hw_params(dai->component);
+
+	return err;
+}
+
+static int tegra210_ope_component_probe(struct snd_soc_component *cmpnt)
+{
+	struct tegra210_ope *ope = dev_get_drvdata(cmpnt->dev);
+
+	tegra210_peq_component_init(cmpnt);
+	tegra210_mbdrc_component_init(cmpnt);
+
+	/*
+	 * The OPE, PEQ and MBDRC functionalities are combined under one
+	 * device registered by OPE driver. In fact OPE HW block includes
+	 * sub blocks PEQ and MBDRC. However driver registers separate
+	 * regmap interfaces for each of these. ASoC core depends on
+	 * dev_get_regmap() to populate the regmap field for a given ASoC
+	 * component. A component can have one regmap reference and since
+	 * the DAPM routes depend on OPE regmap only, below explicit
+	 * assignment is done to highlight this. This is needed for ASoC
+	 * core to access correct regmap during DAPM path setup.
+	 */
+	snd_soc_component_init_regmap(cmpnt, ope->regmap);
+
+	return 0;
+}
+
+static const struct snd_soc_dai_ops tegra210_ope_dai_ops = {
+	.hw_params	= tegra210_ope_hw_params,
+};
+
+static struct snd_soc_dai_driver tegra210_ope_dais[] = {
+	{
+		.name = "OPE-RX-CIF",
+		.playback = {
+			.stream_name = "RX-CIF-Playback",
+			.channels_min = 1,
+			.channels_max = 8,
+			.rates = SNDRV_PCM_RATE_8000_192000,
+			.formats = SNDRV_PCM_FMTBIT_S8 |
+				SNDRV_PCM_FMTBIT_S16_LE |
+				SNDRV_PCM_FMTBIT_S32_LE,
+		},
+		.capture = {
+			.stream_name = "RX-CIF-Capture",
+			.channels_min = 1,
+			.channels_max = 8,
+			.rates = SNDRV_PCM_RATE_8000_192000,
+			.formats = SNDRV_PCM_FMTBIT_S8 |
+				SNDRV_PCM_FMTBIT_S16_LE |
+				SNDRV_PCM_FMTBIT_S32_LE,
+		},
+	},
+	{
+		.name = "OPE-TX-CIF",
+		.playback = {
+			.stream_name = "TX-CIF-Playback",
+			.channels_min = 1,
+			.channels_max = 8,
+			.rates = SNDRV_PCM_RATE_8000_192000,
+			.formats = SNDRV_PCM_FMTBIT_S8 |
+				SNDRV_PCM_FMTBIT_S16_LE |
+				SNDRV_PCM_FMTBIT_S32_LE,
+		},
+		.capture = {
+			.stream_name = "TX-CIF-Capture",
+			.channels_min = 1,
+			.channels_max = 8,
+			.rates = SNDRV_PCM_RATE_8000_192000,
+			.formats = SNDRV_PCM_FMTBIT_S8 |
+				SNDRV_PCM_FMTBIT_S16_LE |
+				SNDRV_PCM_FMTBIT_S32_LE,
+		},
+		.ops = &tegra210_ope_dai_ops,
+	}
+};
+
+static const struct snd_soc_dapm_widget tegra210_ope_widgets[] = {
+	SND_SOC_DAPM_AIF_IN("RX", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("TX", NULL, 0, TEGRA210_OPE_ENABLE,
+			     TEGRA210_OPE_EN_SHIFT, 0),
+};
+
+#define OPE_ROUTES(sname)					\
+	{ "RX XBAR-" sname,	NULL,	"XBAR-TX" },		\
+	{ "RX-CIF-" sname,	NULL,	"RX XBAR-" sname },	\
+	{ "RX",			NULL,	"RX-CIF-" sname },	\
+	{ "TX-CIF-" sname,	NULL,	"TX" },			\
+	{ "TX XBAR-" sname,	NULL,	"TX-CIF-" sname },	\
+	{ "XBAR-RX",		NULL,	"TX XBAR-" sname }
+
+static const struct snd_soc_dapm_route tegra210_ope_routes[] = {
+	{ "TX", NULL, "RX" },
+	OPE_ROUTES("Playback"),
+	OPE_ROUTES("Capture"),
+};
+
+static const char * const tegra210_ope_data_dir_text[] = {
+	"MBDRC to PEQ",
+	"PEQ to MBDRC"
+};
+
+static const struct soc_enum tegra210_ope_data_dir_enum =
+	SOC_ENUM_SINGLE(TEGRA210_OPE_DIR, TEGRA210_OPE_DIR_SHIFT,
+			2, tegra210_ope_data_dir_text);
+
+static int tegra210_ope_get_data_dir(struct snd_kcontrol *kcontrol,
+				     struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct tegra210_ope *ope = snd_soc_component_get_drvdata(cmpnt);
+
+	ucontrol->value.enumerated.item[0] = ope->data_dir;
+
+	return 0;
+}
+
+static int tegra210_ope_put_data_dir(struct snd_kcontrol *kcontrol,
+				     struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct tegra210_ope *ope = snd_soc_component_get_drvdata(cmpnt);
+	unsigned int value = ucontrol->value.enumerated.item[0];
+
+	if (value == ope->data_dir)
+		return 0;
+
+	ope->data_dir = value;
+
+	return 1;
+}
+
+static const struct snd_kcontrol_new tegra210_ope_controls[] = {
+	SOC_ENUM_EXT("Data Flow Direction", tegra210_ope_data_dir_enum,
+		     tegra210_ope_get_data_dir, tegra210_ope_put_data_dir),
+};
+
+static const struct snd_soc_component_driver tegra210_ope_cmpnt = {
+	.probe			= tegra210_ope_component_probe,
+	.dapm_widgets		= tegra210_ope_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(tegra210_ope_widgets),
+	.dapm_routes		= tegra210_ope_routes,
+	.num_dapm_routes	= ARRAY_SIZE(tegra210_ope_routes),
+	.controls		= tegra210_ope_controls,
+	.num_controls		= ARRAY_SIZE(tegra210_ope_controls),
+};
+
+static bool tegra210_ope_wr_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case TEGRA210_OPE_RX_INT_MASK ... TEGRA210_OPE_RX_CIF_CTRL:
+	case TEGRA210_OPE_TX_INT_MASK ... TEGRA210_OPE_TX_CIF_CTRL:
+	case TEGRA210_OPE_ENABLE ... TEGRA210_OPE_CG:
+	case TEGRA210_OPE_DIR:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool tegra210_ope_rd_reg(struct device *dev, unsigned int reg)
+{
+	if (tegra210_ope_wr_reg(dev, reg))
+		return true;
+
+	switch (reg) {
+	case TEGRA210_OPE_RX_STATUS:
+	case TEGRA210_OPE_RX_INT_STATUS:
+	case TEGRA210_OPE_TX_STATUS:
+	case TEGRA210_OPE_TX_INT_STATUS:
+	case TEGRA210_OPE_STATUS:
+	case TEGRA210_OPE_INT_STATUS:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool tegra210_ope_volatile_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case TEGRA210_OPE_RX_STATUS:
+	case TEGRA210_OPE_RX_INT_STATUS:
+	case TEGRA210_OPE_TX_STATUS:
+	case TEGRA210_OPE_TX_INT_STATUS:
+	case TEGRA210_OPE_SOFT_RESET:
+	case TEGRA210_OPE_STATUS:
+	case TEGRA210_OPE_INT_STATUS:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static const struct regmap_config tegra210_ope_regmap_config = {
+	.reg_bits		= 32,
+	.reg_stride		= 4,
+	.val_bits		= 32,
+	.max_register		= TEGRA210_OPE_DIR,
+	.writeable_reg		= tegra210_ope_wr_reg,
+	.readable_reg		= tegra210_ope_rd_reg,
+	.volatile_reg		= tegra210_ope_volatile_reg,
+	.reg_defaults		= tegra210_ope_reg_defaults,
+	.num_reg_defaults	= ARRAY_SIZE(tegra210_ope_reg_defaults),
+	.cache_type		= REGCACHE_FLAT,
+};
+
+static int tegra210_ope_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct tegra210_ope *ope;
+	void __iomem *regs;
+	int err;
+
+	ope = devm_kzalloc(dev, sizeof(*ope), GFP_KERNEL);
+	if (!ope)
+		return -ENOMEM;
+
+	regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
+
+	ope->regmap = devm_regmap_init_mmio(dev, regs,
+					    &tegra210_ope_regmap_config);
+	if (IS_ERR(ope->regmap)) {
+		dev_err(dev, "regmap init failed\n");
+		return PTR_ERR(ope->regmap);
+	}
+
+	regcache_cache_only(ope->regmap, true);
+
+	dev_set_drvdata(dev, ope);
+
+	err = tegra210_peq_regmap_init(pdev);
+	if (err < 0) {
+		dev_err(dev, "PEQ init failed\n");
+		return err;
+	}
+
+	err = tegra210_mbdrc_regmap_init(pdev);
+	if (err < 0) {
+		dev_err(dev, "MBDRC init failed\n");
+		return err;
+	}
+
+	err = devm_snd_soc_register_component(dev, &tegra210_ope_cmpnt,
+					      tegra210_ope_dais,
+					      ARRAY_SIZE(tegra210_ope_dais));
+	if (err) {
+		dev_err(dev, "can't register OPE component, err: %d\n", err);
+		return err;
+	}
+
+	pm_runtime_enable(dev);
+
+	return 0;
+}
+
+static int tegra210_ope_remove(struct platform_device *pdev)
+{
+	pm_runtime_disable(&pdev->dev);
+
+	return 0;
+}
+
+static int __maybe_unused tegra210_ope_runtime_suspend(struct device *dev)
+{
+	struct tegra210_ope *ope = dev_get_drvdata(dev);
+
+	tegra210_peq_save(ope->peq_regmap, ope->peq_biquad_gains,
+			  ope->peq_biquad_shifts);
+
+	regcache_cache_only(ope->mbdrc_regmap, true);
+	regcache_cache_only(ope->peq_regmap, true);
+	regcache_cache_only(ope->regmap, true);
+
+	regcache_mark_dirty(ope->regmap);
+	regcache_mark_dirty(ope->peq_regmap);
+	regcache_mark_dirty(ope->mbdrc_regmap);
+
+	return 0;
+}
+
+static int __maybe_unused tegra210_ope_runtime_resume(struct device *dev)
+{
+	struct tegra210_ope *ope = dev_get_drvdata(dev);
+
+	regcache_cache_only(ope->regmap, false);
+	regcache_cache_only(ope->peq_regmap, false);
+	regcache_cache_only(ope->mbdrc_regmap, false);
+
+	regcache_sync(ope->regmap);
+	regcache_sync(ope->peq_regmap);
+	regcache_sync(ope->mbdrc_regmap);
+
+	tegra210_peq_restore(ope->peq_regmap, ope->peq_biquad_gains,
+			     ope->peq_biquad_shifts);
+
+	return 0;
+}
+
+static const struct dev_pm_ops tegra210_ope_pm_ops = {
+	SET_RUNTIME_PM_OPS(tegra210_ope_runtime_suspend,
+			   tegra210_ope_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
+};
+
+static const struct of_device_id tegra210_ope_of_match[] = {
+	{ .compatible = "nvidia,tegra210-ope" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, tegra210_ope_of_match);
+
+static struct platform_driver tegra210_ope_driver = {
+	.driver = {
+		.name = "tegra210-ope",
+		.of_match_table = tegra210_ope_of_match,
+		.pm = &tegra210_ope_pm_ops,
+	},
+	.probe = tegra210_ope_probe,
+	.remove = tegra210_ope_remove,
+};
+module_platform_driver(tegra210_ope_driver)
+
+MODULE_AUTHOR("Sumit Bhattacharya <sumitb@nvidia.com>");
+MODULE_DESCRIPTION("Tegra210 OPE ASoC driver");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/tegra/tegra210_ope.h b/sound/soc/tegra/tegra210_ope.h
new file mode 100644
index 00000000..2835af6
--- /dev/null
+++ b/sound/soc/tegra/tegra210_ope.h
@@ -0,0 +1,90 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * tegra210_ope.h - Definitions for Tegra210 OPE driver
+ *
+ * Copyright (c) 2022, NVIDIA CORPORATION. All rights reserved.
+ *
+ */
+
+#ifndef __TEGRA210_OPE_H__
+#define __TEGRA210_OPE_H__
+
+#include <linux/regmap.h>
+#include <sound/soc.h>
+
+#include "tegra210_peq.h"
+
+/*
+ * OPE_RX registers are with respect to XBAR.
+ * The data comes from XBAR to OPE
+ */
+#define TEGRA210_OPE_RX_STATUS			0xc
+#define TEGRA210_OPE_RX_INT_STATUS		0x10
+#define TEGRA210_OPE_RX_INT_MASK		0x14
+#define TEGRA210_OPE_RX_INT_SET			0x18
+#define TEGRA210_OPE_RX_INT_CLEAR		0x1c
+#define TEGRA210_OPE_RX_CIF_CTRL		0x20
+
+/*
+ * OPE_TX registers are with respect to XBAR.
+ * The data goes out from OPE to XBAR
+ */
+#define TEGRA210_OPE_TX_STATUS			0x4c
+#define TEGRA210_OPE_TX_INT_STATUS		0x50
+#define TEGRA210_OPE_TX_INT_MASK		0x54
+#define TEGRA210_OPE_TX_INT_SET			0x58
+#define TEGRA210_OPE_TX_INT_CLEAR		0x5c
+#define TEGRA210_OPE_TX_CIF_CTRL		0x60
+
+/* OPE Gloabal registers */
+#define TEGRA210_OPE_ENABLE			0x80
+#define TEGRA210_OPE_SOFT_RESET			0x84
+#define TEGRA210_OPE_CG				0x88
+#define TEGRA210_OPE_STATUS			0x8c
+#define TEGRA210_OPE_INT_STATUS			0x90
+#define TEGRA210_OPE_DIR			0x94
+
+/* Fields for TEGRA210_OPE_ENABLE */
+#define TEGRA210_OPE_EN_SHIFT			0
+#define TEGRA210_OPE_EN				(1 << TEGRA210_OPE_EN_SHIFT)
+
+/* Fields for TEGRA210_OPE_SOFT_RESET */
+#define TEGRA210_OPE_SOFT_RESET_SHIFT		0
+#define TEGRA210_OPE_SOFT_RESET_EN		(1 << TEGRA210_OPE_SOFT_RESET_SHIFT)
+
+#define TEGRA210_OPE_DIR_SHIFT			0
+
+struct tegra210_ope {
+	struct regmap *regmap;
+	struct regmap *peq_regmap;
+	struct regmap *mbdrc_regmap;
+	u32 peq_biquad_gains[TEGRA210_PEQ_GAIN_PARAM_SIZE_PER_CH];
+	u32 peq_biquad_shifts[TEGRA210_PEQ_SHIFT_PARAM_SIZE_PER_CH];
+	unsigned int data_dir;
+};
+
+/* Extension of soc_bytes structure defined in sound/soc.h */
+struct tegra_soc_bytes {
+	struct soc_bytes soc;
+	u32 shift; /* Used as offset for AHUB RAM related programing */
+};
+
+/* Utility structures for using mixer control of type snd_soc_bytes */
+#define TEGRA_SOC_BYTES_EXT(xname, xbase, xregs, xshift, xmask,		\
+			    xhandler_get, xhandler_put, xinfo)		\
+{									\
+	.iface	= SNDRV_CTL_ELEM_IFACE_MIXER,				\
+	.name	= xname,						\
+	.info	= xinfo,						\
+	.get	= xhandler_get,						\
+	.put	= xhandler_put,						\
+	.private_value = ((unsigned long)&(struct tegra_soc_bytes)	\
+	{								\
+		.soc.base	= xbase,				\
+		.soc.num_regs	= xregs,				\
+		.soc.mask	= xmask,				\
+		.shift		= xshift				\
+	})								\
+}
+
+#endif
diff --git a/sound/soc/tegra/tegra210_peq.c b/sound/soc/tegra/tegra210_peq.c
new file mode 100644
index 00000000..3d63402
--- /dev/null
+++ b/sound/soc/tegra/tegra210_peq.c
@@ -0,0 +1,434 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// tegra210_peq.c - Tegra210 PEQ driver
+//
+// Copyright (c) 2022, NVIDIA CORPORATION. All rights reserved.
+
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <sound/core.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+
+#include "tegra210_ope.h"
+#include "tegra210_peq.h"
+
+static const struct reg_default tegra210_peq_reg_defaults[] = {
+	{ TEGRA210_PEQ_CFG, 0x00000013},
+	{ TEGRA210_PEQ_CFG_RAM_CTRL, 0x00004000},
+	{ TEGRA210_PEQ_CFG_RAM_SHIFT_CTRL, 0x00004000},
+};
+
+static const u32 biquad_init_gains[TEGRA210_PEQ_GAIN_PARAM_SIZE_PER_CH] = {
+	1495012349, /* Pre-gain */
+
+	/* Gains : b0, b1, a0, a1, a2 */
+	536870912, -1073741824, 536870912, 2143508246, -1069773768, /* Band-0 */
+	134217728, -265414508, 131766272, 2140402222, -1071252997,  /* Band-1 */
+	268435456, -233515765, -33935948, 1839817267, -773826124,   /* Band-2 */
+	536870912, -672537913, 139851540, 1886437554, -824433167,   /* Band-3 */
+	268435456, -114439279, 173723964, 205743566, 278809729,     /* Band-4 */
+	1, 0, 0, 0, 0, /* Band-5 */
+	1, 0, 0, 0, 0, /* Band-6 */
+	1, 0, 0, 0, 0, /* Band-7 */
+	1, 0, 0, 0, 0, /* Band-8 */
+	1, 0, 0, 0, 0, /* Band-9 */
+	1, 0, 0, 0, 0, /* Band-10 */
+	1, 0, 0, 0, 0, /* Band-11 */
+
+	963423114, /* Post-gain */
+};
+
+static const u32 biquad_init_shifts[TEGRA210_PEQ_SHIFT_PARAM_SIZE_PER_CH] = {
+	23, /* Pre-shift */
+	30, 30, 30, 30, 30, 0, 0, 0, 0, 0, 0, 0, /* Shift for bands */
+	28, /* Post-shift */
+};
+
+static s32 biquad_coeff_buffer[TEGRA210_PEQ_GAIN_PARAM_SIZE_PER_CH];
+
+static void tegra210_peq_read_ram(struct regmap *regmap, unsigned int reg_ctrl,
+				  unsigned int reg_data, unsigned int ram_offset,
+				  unsigned int *data, size_t size)
+{
+	unsigned int val;
+	unsigned int i;
+
+	val = ram_offset & TEGRA210_PEQ_RAM_CTRL_RAM_ADDR_MASK;
+	val |= TEGRA210_PEQ_RAM_CTRL_ADDR_INIT_EN;
+	val |= TEGRA210_PEQ_RAM_CTRL_SEQ_ACCESS_EN;
+	val |= TEGRA210_PEQ_RAM_CTRL_RW_READ;
+
+	regmap_write(regmap, reg_ctrl, val);
+
+	/*
+	 * Since all ahub non-io modules work under same ahub clock it is not
+	 * necessary to check ahub read busy bit after every read.
+	 */
+	for (i = 0; i < size; i++)
+		regmap_read(regmap, reg_data, &data[i]);
+}
+
+static void tegra210_peq_write_ram(struct regmap *regmap, unsigned int reg_ctrl,
+				   unsigned int reg_data, unsigned int ram_offset,
+				   unsigned int *data, size_t size)
+{
+	unsigned int val;
+	unsigned int i;
+
+	val = ram_offset & TEGRA210_PEQ_RAM_CTRL_RAM_ADDR_MASK;
+	val |= TEGRA210_PEQ_RAM_CTRL_ADDR_INIT_EN;
+	val |= TEGRA210_PEQ_RAM_CTRL_SEQ_ACCESS_EN;
+	val |= TEGRA210_PEQ_RAM_CTRL_RW_WRITE;
+
+	regmap_write(regmap, reg_ctrl, val);
+
+	for (i = 0; i < size; i++)
+		regmap_write(regmap, reg_data, data[i]);
+}
+
+static int tegra210_peq_get(struct snd_kcontrol *kcontrol,
+			    struct snd_ctl_elem_value *ucontrol)
+{
+	struct soc_mixer_control *mc =
+		(struct soc_mixer_control *)kcontrol->private_value;
+	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct tegra210_ope *ope = snd_soc_component_get_drvdata(cmpnt);
+	unsigned int mask = (1 << fls(mc->max)) - 1;
+	unsigned int val;
+
+	regmap_read(ope->peq_regmap, mc->reg, &val);
+
+	ucontrol->value.integer.value[0] = (val >> mc->shift) & mask;
+
+	if (!mc->invert)
+		return 0;
+
+	ucontrol->value.integer.value[0] =
+		mc->max - ucontrol->value.integer.value[0];
+
+	return 0;
+}
+
+static int tegra210_peq_put(struct snd_kcontrol *kcontrol,
+			    struct snd_ctl_elem_value *ucontrol)
+{
+	struct soc_mixer_control *mc =
+		(struct soc_mixer_control *)kcontrol->private_value;
+	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct tegra210_ope *ope = snd_soc_component_get_drvdata(cmpnt);
+	unsigned int mask = (1 << fls(mc->max)) - 1;
+	bool change = false;
+	unsigned int val;
+
+	val = (ucontrol->value.integer.value[0] & mask);
+
+	if (mc->invert)
+		val = mc->max - val;
+
+	val = val << mc->shift;
+
+	regmap_update_bits_check(ope->peq_regmap, mc->reg, (mask << mc->shift),
+				 val, &change);
+
+	return change ? 1 : 0;
+}
+
+static int tegra210_peq_ram_get(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct tegra_soc_bytes *params = (void *)kcontrol->private_value;
+	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct tegra210_ope *ope = snd_soc_component_get_drvdata(cmpnt);
+	u32 i, reg_ctrl = params->soc.base;
+	u32 reg_data = reg_ctrl + cmpnt->val_bytes;
+	s32 *data = (s32 *)biquad_coeff_buffer;
+
+	pm_runtime_get_sync(cmpnt->dev);
+
+	tegra210_peq_read_ram(ope->peq_regmap, reg_ctrl, reg_data,
+			      params->shift, data, params->soc.num_regs);
+
+	pm_runtime_put_sync(cmpnt->dev);
+
+	for (i = 0; i < params->soc.num_regs; i++)
+		ucontrol->value.integer.value[i] = (long)data[i];
+
+	return 0;
+}
+
+static int tegra210_peq_ram_put(struct snd_kcontrol *kcontrol,
+				     struct snd_ctl_elem_value *ucontrol)
+{
+	struct tegra_soc_bytes *params = (void *)kcontrol->private_value;
+	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct tegra210_ope *ope = snd_soc_component_get_drvdata(cmpnt);
+	u32 i, reg_ctrl = params->soc.base;
+	u32 reg_data = reg_ctrl + cmpnt->val_bytes;
+	s32 *data = (s32 *)biquad_coeff_buffer;
+
+	for (i = 0; i < params->soc.num_regs; i++)
+		data[i] = (s32)ucontrol->value.integer.value[i];
+
+	pm_runtime_get_sync(cmpnt->dev);
+
+	tegra210_peq_write_ram(ope->peq_regmap, reg_ctrl, reg_data,
+			       params->shift, data, params->soc.num_regs);
+
+	pm_runtime_put_sync(cmpnt->dev);
+
+	return 1;
+}
+
+static int tegra210_peq_param_info(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_info *uinfo)
+{
+	struct soc_bytes *params = (void *)kcontrol->private_value;
+
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->value.integer.min = INT_MIN;
+	uinfo->value.integer.max = INT_MAX;
+	uinfo->count = params->num_regs;
+
+	return 0;
+}
+
+#define TEGRA210_PEQ_GAIN_PARAMS_CTRL(chan)				  \
+	TEGRA_SOC_BYTES_EXT("PEQ Channel-" #chan " Biquad Gain Params",	  \
+		TEGRA210_PEQ_CFG_RAM_CTRL,				  \
+		TEGRA210_PEQ_GAIN_PARAM_SIZE_PER_CH,			  \
+		(TEGRA210_PEQ_GAIN_PARAM_SIZE_PER_CH * chan), 0xffffffff, \
+		tegra210_peq_ram_get, tegra210_peq_ram_put,		  \
+		tegra210_peq_param_info)
+
+#define TEGRA210_PEQ_SHIFT_PARAMS_CTRL(chan)				  \
+	TEGRA_SOC_BYTES_EXT("PEQ Channel-" #chan " Biquad Shift Params",  \
+		TEGRA210_PEQ_CFG_RAM_SHIFT_CTRL,			  \
+		TEGRA210_PEQ_SHIFT_PARAM_SIZE_PER_CH,			  \
+		(TEGRA210_PEQ_SHIFT_PARAM_SIZE_PER_CH * chan), 0x1f,	  \
+		tegra210_peq_ram_get, tegra210_peq_ram_put,		  \
+		tegra210_peq_param_info)
+
+static const struct snd_kcontrol_new tegra210_peq_controls[] = {
+	SOC_SINGLE_EXT("PEQ Active", TEGRA210_PEQ_CFG,
+		       TEGRA210_PEQ_CFG_MODE_SHIFT, 1, 0,
+		       tegra210_peq_get, tegra210_peq_put),
+
+	SOC_SINGLE_EXT("PEQ Biquad Stages", TEGRA210_PEQ_CFG,
+		       TEGRA210_PEQ_CFG_BIQUAD_STAGES_SHIFT,
+		       TEGRA210_PEQ_MAX_BIQUAD_STAGES - 1, 0,
+		       tegra210_peq_get, tegra210_peq_put),
+
+	TEGRA210_PEQ_GAIN_PARAMS_CTRL(0),
+	TEGRA210_PEQ_GAIN_PARAMS_CTRL(1),
+	TEGRA210_PEQ_GAIN_PARAMS_CTRL(2),
+	TEGRA210_PEQ_GAIN_PARAMS_CTRL(3),
+	TEGRA210_PEQ_GAIN_PARAMS_CTRL(4),
+	TEGRA210_PEQ_GAIN_PARAMS_CTRL(5),
+	TEGRA210_PEQ_GAIN_PARAMS_CTRL(6),
+	TEGRA210_PEQ_GAIN_PARAMS_CTRL(7),
+
+	TEGRA210_PEQ_SHIFT_PARAMS_CTRL(0),
+	TEGRA210_PEQ_SHIFT_PARAMS_CTRL(1),
+	TEGRA210_PEQ_SHIFT_PARAMS_CTRL(2),
+	TEGRA210_PEQ_SHIFT_PARAMS_CTRL(3),
+	TEGRA210_PEQ_SHIFT_PARAMS_CTRL(4),
+	TEGRA210_PEQ_SHIFT_PARAMS_CTRL(5),
+	TEGRA210_PEQ_SHIFT_PARAMS_CTRL(6),
+	TEGRA210_PEQ_SHIFT_PARAMS_CTRL(7),
+};
+
+static bool tegra210_peq_wr_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case TEGRA210_PEQ_SOFT_RESET:
+	case TEGRA210_PEQ_CG:
+	case TEGRA210_PEQ_CFG ... TEGRA210_PEQ_CFG_RAM_SHIFT_DATA:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool tegra210_peq_rd_reg(struct device *dev, unsigned int reg)
+{
+	if (tegra210_peq_wr_reg(dev, reg))
+		return true;
+
+	switch (reg) {
+	case TEGRA210_PEQ_STATUS:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool tegra210_peq_volatile_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case TEGRA210_PEQ_SOFT_RESET:
+	case TEGRA210_PEQ_STATUS:
+	case TEGRA210_PEQ_CFG_RAM_CTRL ... TEGRA210_PEQ_CFG_RAM_SHIFT_DATA:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool tegra210_peq_precious_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case TEGRA210_PEQ_CFG_RAM_DATA:
+	case TEGRA210_PEQ_CFG_RAM_SHIFT_DATA:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static const struct regmap_config tegra210_peq_regmap_config = {
+	.name			= "peq",
+	.reg_bits		= 32,
+	.reg_stride		= 4,
+	.val_bits		= 32,
+	.max_register		= TEGRA210_PEQ_CFG_RAM_SHIFT_DATA,
+	.writeable_reg		= tegra210_peq_wr_reg,
+	.readable_reg		= tegra210_peq_rd_reg,
+	.volatile_reg		= tegra210_peq_volatile_reg,
+	.precious_reg		= tegra210_peq_precious_reg,
+	.reg_defaults		= tegra210_peq_reg_defaults,
+	.num_reg_defaults	= ARRAY_SIZE(tegra210_peq_reg_defaults),
+	.cache_type		= REGCACHE_FLAT,
+};
+
+void tegra210_peq_restore(struct regmap *regmap, u32 *biquad_gains,
+			  u32 *biquad_shifts)
+{
+	unsigned int i;
+
+	for (i = 0; i < TEGRA210_PEQ_MAX_CHANNELS; i++) {
+		tegra210_peq_write_ram(regmap, TEGRA210_PEQ_CFG_RAM_CTRL,
+			TEGRA210_PEQ_CFG_RAM_DATA,
+			(i * TEGRA210_PEQ_GAIN_PARAM_SIZE_PER_CH),
+			biquad_gains,
+			TEGRA210_PEQ_GAIN_PARAM_SIZE_PER_CH);
+
+		tegra210_peq_write_ram(regmap,
+			TEGRA210_PEQ_CFG_RAM_SHIFT_CTRL,
+			TEGRA210_PEQ_CFG_RAM_SHIFT_DATA,
+			(i * TEGRA210_PEQ_SHIFT_PARAM_SIZE_PER_CH),
+			biquad_shifts,
+			TEGRA210_PEQ_SHIFT_PARAM_SIZE_PER_CH);
+
+	}
+}
+
+void tegra210_peq_save(struct regmap *regmap, u32 *biquad_gains,
+		       u32 *biquad_shifts)
+{
+	unsigned int i;
+
+	for (i = 0; i < TEGRA210_PEQ_MAX_CHANNELS; i++) {
+		tegra210_peq_read_ram(regmap,
+			TEGRA210_PEQ_CFG_RAM_CTRL,
+			TEGRA210_PEQ_CFG_RAM_DATA,
+			(i * TEGRA210_PEQ_GAIN_PARAM_SIZE_PER_CH),
+			biquad_gains,
+			TEGRA210_PEQ_GAIN_PARAM_SIZE_PER_CH);
+
+		tegra210_peq_read_ram(regmap,
+			TEGRA210_PEQ_CFG_RAM_SHIFT_CTRL,
+			TEGRA210_PEQ_CFG_RAM_SHIFT_DATA,
+			(i * TEGRA210_PEQ_SHIFT_PARAM_SIZE_PER_CH),
+			biquad_shifts,
+			TEGRA210_PEQ_SHIFT_PARAM_SIZE_PER_CH);
+	}
+}
+
+int tegra210_peq_component_init(struct snd_soc_component *cmpnt)
+{
+	struct tegra210_ope *ope = snd_soc_component_get_drvdata(cmpnt);
+	unsigned int i;
+
+	pm_runtime_get_sync(cmpnt->dev);
+	regmap_update_bits(ope->peq_regmap, TEGRA210_PEQ_CFG,
+		TEGRA210_PEQ_CFG_MODE_MASK,
+		0 << TEGRA210_PEQ_CFG_MODE_SHIFT);
+	regmap_update_bits(ope->peq_regmap, TEGRA210_PEQ_CFG,
+		TEGRA210_PEQ_CFG_BIQUAD_STAGES_MASK,
+		(TEGRA210_PEQ_BIQUAD_INIT_STAGE - 1) <<
+		TEGRA210_PEQ_CFG_BIQUAD_STAGES_SHIFT);
+
+	/* Initialize PEQ AHUB RAM with default params */
+	for (i = 0; i < TEGRA210_PEQ_MAX_CHANNELS; i++) {
+
+		/* Set default gain params */
+		tegra210_peq_write_ram(ope->peq_regmap,
+			TEGRA210_PEQ_CFG_RAM_CTRL,
+			TEGRA210_PEQ_CFG_RAM_DATA,
+			(i * TEGRA210_PEQ_GAIN_PARAM_SIZE_PER_CH),
+			(u32 *)&biquad_init_gains,
+			TEGRA210_PEQ_GAIN_PARAM_SIZE_PER_CH);
+
+		/* Set default shift params */
+		tegra210_peq_write_ram(ope->peq_regmap,
+			TEGRA210_PEQ_CFG_RAM_SHIFT_CTRL,
+			TEGRA210_PEQ_CFG_RAM_SHIFT_DATA,
+			(i * TEGRA210_PEQ_SHIFT_PARAM_SIZE_PER_CH),
+			(u32 *)&biquad_init_shifts,
+			TEGRA210_PEQ_SHIFT_PARAM_SIZE_PER_CH);
+
+	}
+
+	pm_runtime_put_sync(cmpnt->dev);
+
+	snd_soc_add_component_controls(cmpnt, tegra210_peq_controls,
+				       ARRAY_SIZE(tegra210_peq_controls));
+
+	return 0;
+}
+
+int tegra210_peq_regmap_init(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct tegra210_ope *ope = dev_get_drvdata(dev);
+	struct device_node *child;
+	struct resource mem;
+	void __iomem *regs;
+	int err;
+
+	child = of_get_child_by_name(dev->of_node, "peq");
+	if (!child)
+		return -ENODEV;
+
+	err = of_address_to_resource(child, 0, &mem);
+	of_node_put(child);
+	if (err < 0) {
+		dev_err(dev, "fail to get PEQ resource\n");
+		return err;
+	}
+
+	mem.flags = IORESOURCE_MEM;
+	regs = devm_ioremap_resource(dev, &mem);
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
+	ope->peq_regmap = devm_regmap_init_mmio(dev, regs,
+						&tegra210_peq_regmap_config);
+	if (IS_ERR(ope->peq_regmap)) {
+		dev_err(dev, "regmap init failed\n");
+		return PTR_ERR(ope->peq_regmap);
+	}
+
+	regcache_cache_only(ope->peq_regmap, true);
+
+	return 0;
+}
diff --git a/sound/soc/tegra/tegra210_peq.h b/sound/soc/tegra/tegra210_peq.h
new file mode 100644
index 00000000..6d3de4f
--- /dev/null
+++ b/sound/soc/tegra/tegra210_peq.h
@@ -0,0 +1,56 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * tegra210_peq.h - Definitions for Tegra210 PEQ driver
+ *
+ * Copyright (c) 2022, NVIDIA CORPORATION. All rights reserved.
+ *
+ */
+
+#ifndef __TEGRA210_PEQ_H__
+#define __TEGRA210_PEQ_H__
+
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <sound/soc.h>
+
+/* Register offsets from PEQ base */
+#define TEGRA210_PEQ_SOFT_RESET				0x0
+#define TEGRA210_PEQ_CG					0x4
+#define TEGRA210_PEQ_STATUS				0x8
+#define TEGRA210_PEQ_CFG				0xc
+#define TEGRA210_PEQ_CFG_RAM_CTRL			0x10
+#define TEGRA210_PEQ_CFG_RAM_DATA			0x14
+#define TEGRA210_PEQ_CFG_RAM_SHIFT_CTRL			0x18
+#define TEGRA210_PEQ_CFG_RAM_SHIFT_DATA			0x1c
+
+/* Fields in TEGRA210_PEQ_CFG */
+#define TEGRA210_PEQ_CFG_BIQUAD_STAGES_SHIFT		2
+#define TEGRA210_PEQ_CFG_BIQUAD_STAGES_MASK		(0xf << TEGRA210_PEQ_CFG_BIQUAD_STAGES_SHIFT)
+
+#define TEGRA210_PEQ_CFG_MODE_SHIFT			0
+#define TEGRA210_PEQ_CFG_MODE_MASK			(0x1 << TEGRA210_PEQ_CFG_MODE_SHIFT)
+
+#define TEGRA210_PEQ_RAM_CTRL_RW_READ			0
+#define TEGRA210_PEQ_RAM_CTRL_RW_WRITE			(1 << 14)
+#define TEGRA210_PEQ_RAM_CTRL_ADDR_INIT_EN		(1 << 13)
+#define TEGRA210_PEQ_RAM_CTRL_SEQ_ACCESS_EN		(1 << 12)
+#define TEGRA210_PEQ_RAM_CTRL_RAM_ADDR_MASK		0x1ff
+
+/* PEQ register definition ends here */
+#define TEGRA210_PEQ_MAX_BIQUAD_STAGES			12
+
+#define TEGRA210_PEQ_MAX_CHANNELS			8
+
+#define TEGRA210_PEQ_BIQUAD_INIT_STAGE			5
+
+#define TEGRA210_PEQ_GAIN_PARAM_SIZE_PER_CH (2 + TEGRA210_PEQ_MAX_BIQUAD_STAGES * 5)
+#define TEGRA210_PEQ_SHIFT_PARAM_SIZE_PER_CH (2 + TEGRA210_PEQ_MAX_BIQUAD_STAGES)
+
+int tegra210_peq_regmap_init(struct platform_device *pdev);
+int tegra210_peq_component_init(struct snd_soc_component *cmpnt);
+void tegra210_peq_restore(struct regmap *regmap, u32 *biquad_gains,
+			  u32 *biquad_shifts);
+void tegra210_peq_save(struct regmap *regmap, u32 *biquad_gains,
+		       u32 *biquad_shifts);
+
+#endif
-- 
2.7.4


Return-Path: <linux-tegra+bounces-6072-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77378A95F69
	for <lists+linux-tegra@lfdr.de>; Tue, 22 Apr 2025 09:30:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 73CFD178ED6
	for <lists+linux-tegra@lfdr.de>; Tue, 22 Apr 2025 07:29:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E7362517B9;
	Tue, 22 Apr 2025 07:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="AkhfA5vA"
X-Original-To: linux-tegra@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2078.outbound.protection.outlook.com [40.107.93.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F78024888D;
	Tue, 22 Apr 2025 07:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745306944; cv=fail; b=U7FnAviGKeAmHHBfkDus4rGc5G+kQVU3CTE/hM2fVKnwyp9Me8K9tM5plXwZKFBY564c4hqw80Wq43oUUxYLYwYv/ABDk9GmtWxQbbxZRk/iqUzRlnt89iE82LzjKEsJ3AbkR1zDXdCIrZ4aZwHw3nataQnxHq0CNAYe5Zqbx8g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745306944; c=relaxed/simple;
	bh=TlYMJ4pTpJdP3SxoPQEIaXfUmt80+YZdh8Ay/mkwdRw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GQzej4QFDYOynWVrrweK+OSxLaJBUCYabM/4goHj+ROAHz6gULyhFm9WxBapu4ChzD0SDjiPX+iMvmLE5/VyOQsD69gjCaHfF62opsxohUhlrBxEj0seyPITugi2cQ2gJ9VwV1RasG9iP2EZHQWLLysbXLt3zkxSXoTlsEUjPi8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=AkhfA5vA; arc=fail smtp.client-ip=40.107.93.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fyIS+KSF/PMps5EkEdkMDbYC7rsh/whnvrSrxZXrhuHX3PdoVdYhuNkYTFik26hIs9b8QWTiakdRVTYwDk5NaZCLcyGgq4O2XEVBvX9FCCWecysygvgYJ0fFVAmfObydQEYOtucL0UW1KiMF/DB6cghPRnHdtZVUWeEaav5oD8+PY8Yd0mH3/nC0rAxLJcDeYFNzEMscaAnwh2M7g0mm07gBvwQMqiP8HMJRm7jlLfP4CO0fp5IX+mrcpfOHpn4VJCFL/HLNmk+T1bG9fUWXwww9CkRyD4QOn8V/KN7oiW9VBbokWXzA1uBFvRNPQZWK6bZbeG/Lf7iQxrxzL6ykpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RnlkzjZy0ROvLGnOytKgILJe2WhWONMOCUWcbDn+c5k=;
 b=PkVvpBSbi0TImnTQN+O4ciN52E/WvzkQRVhpjncOPibOnI+N5D0cld5GREUpXelNcJVn6nc/JorT85ab+QWIB8wD43Ds4H+MVVo05Z0kdMn1uP1RIlzqUhZhZ1plJhkhwtBo/7WDMe3mkfgauIMJV5vGFcxEHRs3hobKVkEW977EKoQnRgEtoiONwHAFepBkWzmKvKSzwDbyzmJTpOm8aHP9jpCjR0DyLTaOmxdkocLpU4Oz4FgVtKv0D+qlx5mOZi+OYqLah2C9MMwXNYh2Vc30xmOGYgWeDzcieIj1MSBZbsclfkC+6YaZ6BuBhM8iZarvDuKZWGKIrBMQIYVrLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RnlkzjZy0ROvLGnOytKgILJe2WhWONMOCUWcbDn+c5k=;
 b=AkhfA5vA2GAt8dpAcAcHrY7mVHybTfkVVNPcaaoVLHxymS0gm+UqgJkcG6iJmey1xo5ujfV4skJh9863Hais7ug/JM9bi36snUxtsu8h8peLyA4/HEeY3zmm9Htfgv+TaNPO9fuo6lv/neRpJxt5YA+oXtUhia8qH/sXHWfK9wzgQqs0SoyNANXDDaxK+wH1u1amk9XI/QXi0j2U0aAQzBKd4WgXh7/79ZMBJQyfprD01m1ZxW3tkSn/kGwA+a2nu3PQ6qmtMqoSTnWV/fucSWWxpwFy1mAUvhrodlJXgda/8/UGofKtNt3MgWMKGo1tmpST6eP7Ou2Y4Y6FDnbbrQ==
Received: from DS7PR06CA0053.namprd06.prod.outlook.com (2603:10b6:8:54::8) by
 DS0PR12MB8479.namprd12.prod.outlook.com (2603:10b6:8:155::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.35; Tue, 22 Apr 2025 07:28:54 +0000
Received: from DS3PEPF0000C37F.namprd04.prod.outlook.com
 (2603:10b6:8:54:cafe::9) by DS7PR06CA0053.outlook.office365.com
 (2603:10b6:8:54::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Tue,
 22 Apr 2025 07:28:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS3PEPF0000C37F.mail.protection.outlook.com (10.167.23.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Tue, 22 Apr 2025 07:28:54 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 22 Apr
 2025 00:28:39 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 22 Apr
 2025 00:28:39 -0700
Received: from build-sheetal-bionic-20250305.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Tue, 22 Apr 2025 00:28:39 -0700
From: "Sheetal ." <sheetal@nvidia.com>
To: <broonie@kernel.org>, <linux-sound@vger.kernel.org>
CC: <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<jonathanh@nvidia.com>, <thierry.reding@gmail.com>, <mkumard@nvidia.com>,
	<spujar@nvidia.com>, Sheetal <sheetal@nvidia.com>
Subject: [PATCH 06/10] ASoC: tegra: I2S: Add Tegra264 support
Date: Tue, 22 Apr 2025 07:28:01 +0000
Message-ID: <20250422072805.501152-7-sheetal@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250422072805.501152-1-sheetal@nvidia.com>
References: <20250422072805.501152-1-sheetal@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37F:EE_|DS0PR12MB8479:EE_
X-MS-Office365-Filtering-Correlation-Id: 74bfb8e9-df1f-4d18-c505-08dd816f563f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ButMuxXLfJxWRH4qZdqrNWdOmEmsl7KMiIPqdPTmwO6dhU9yL1c7oq4F24nc?=
 =?us-ascii?Q?ST0qJcZ1sozJFdec7lWWsEK1lIj9vJwDralVQWSytvh32OBqnCyQJpcXcLzh?=
 =?us-ascii?Q?BXiCG5CAEwDCoPfE0SkPU/VThHf097kWBJqLWSICHLSzuuU4I7gETQwCq86B?=
 =?us-ascii?Q?+RPhh2TMKyFaCppRCwGcxU57nA12oRfwv8Wwvy9d/LqdS4AiiY+6oCmL03jX?=
 =?us-ascii?Q?DvHQ8j2udo49m+4UgO1datHOZfrGgqzn1rPTHGx23uzL3ebHzGITqGA4F5yD?=
 =?us-ascii?Q?P0gLLQr+cSk3HTWBRN1TXLRlul9KL4b/zyP/Daz7YDB415uRldKpqgUUpvEG?=
 =?us-ascii?Q?y2eLo4TOFDuG5ZKRf2uvVBYyYmVqWnb+LzMNfONM5i+yqtrljVln6Aq0Qmm/?=
 =?us-ascii?Q?SCg+MFIh20dbav6H3EqwVTDGivV5FEam8AiYgS/K/DyclfXr0Z88PIQO9Sit?=
 =?us-ascii?Q?ZaU49Z6BNCwEgrl9gODBOBGyOICB3wTNN8dfua9AiOVwt1Ys6ij8IBWCOkfp?=
 =?us-ascii?Q?unUxUGK8R+5qUSINHqbP+G5t/lIXsdbQQsw+hstoWN1tQ9rnbm2CllK1YgBP?=
 =?us-ascii?Q?hElzEsjYBBy4r2iGhCPlwBTzT7WoLl7h7Hjj732DAbEMU3nmMomOwQPjtZCS?=
 =?us-ascii?Q?LW2BrE3Ay0p6KWJwLfxS3eSvogxrRqYTm96/OEmmjynhmkFg31ICrEIRLUYV?=
 =?us-ascii?Q?vP6ZhLkGOfoALY1CjUjI5azKTDSWnsNnAbCRzfuXbawGpctj7uit1VYG5z+l?=
 =?us-ascii?Q?uHyZL0x2WELeyU71Is/d/8ExIZdnrYv36PYzYU43xszTcO0CBHUUwND65sW3?=
 =?us-ascii?Q?BAZ7pWt97qyvozqeGWwsQbm/vtY6EEAv91KzpSKIxmu8cCIQ1cTOfx7s0dIz?=
 =?us-ascii?Q?RjdpjVxOuUKs8m1T1VU1YyTXekMyb0ipCiiIEvjF+BNk43hZmuzFXhABlZ+V?=
 =?us-ascii?Q?O6n52DuTD1rJk79t66tidkY+6kYVeqyi5tAlVzb1DzJBJjsCkv7p+nS4mpEm?=
 =?us-ascii?Q?1Hy1JwlgTQOyGQgO1WF+l6NZXH87UreXlLuZYQShLbF8VaHKcTJ2JTM5+zp2?=
 =?us-ascii?Q?w7xzpkalG66nraOWvcmrdhnhsoVd4NswuDVaof/05xT4fWkUUb3HihCoWIF9?=
 =?us-ascii?Q?2RxXLE0COKdDZdBAz4bVKlQ/IrQDPP8am0vV8ut6p0xouMtnFSXXhMd7syXi?=
 =?us-ascii?Q?eFwqY2I5jle4XIf7vH8iqIyMhN2tuqtVj6gDm/sXhXiumWV2tPNE/18/Fjw2?=
 =?us-ascii?Q?zZCaquPARPej9b28r0sS3MNWhc/QWUonp/XUQmPH0t+tc37BOwFws8ZwWu7Z?=
 =?us-ascii?Q?gMU2xcCrLtc6IpxZW4WS4lUprEW18sWLmxdPEQNMmsL2hiBKDgVC5P/tGtvL?=
 =?us-ascii?Q?o08M3v6o4r0Zf2b0npFpp1OO8AopTLsw5JS6vKCjitK85xYkMhkQFZq11Jyf?=
 =?us-ascii?Q?bQ3zvhrEqANUMF2oZ8KKNKIKcZvJSsVJmaRzjvaFw/vSJ0nF9ktOOFlQazA5?=
 =?us-ascii?Q?k5SNYVBsftqZRBdyaorFPA0afx2ZWmqlgOa4?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 07:28:54.2976
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74bfb8e9-df1f-4d18-c505-08dd816f563f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C37F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8479

From: Sheetal <sheetal@nvidia.com>

Add Tegra264 I2S support with following changes:
- Add soc_data for Tegra264-specific variations
- Tegra264 I2S supports 32 audio channels, hence update the TDM config,
  CIF configuration API and DAI channel_max parameter.
- Register offsets and default values are updated to align with Tegra264.

Signed-off-by: Sheetal <sheetal@nvidia.com>
---
 sound/soc/tegra/tegra210_i2s.c | 231 ++++++++++++++++++++++++++-------
 sound/soc/tegra/tegra210_i2s.h |  51 +++++++-
 2 files changed, 233 insertions(+), 49 deletions(-)

diff --git a/sound/soc/tegra/tegra210_i2s.c b/sound/soc/tegra/tegra210_i2s.c
index 766cddebd5f6..100277c39001 100644
--- a/sound/soc/tegra/tegra210_i2s.c
+++ b/sound/soc/tegra/tegra210_i2s.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-// SPDX-FileCopyrightText: Copyright (c) 2020-2024 NVIDIA CORPORATION & AFFILIATES.
+// SPDX-FileCopyrightText: Copyright (c) 2020-2025 NVIDIA CORPORATION & AFFILIATES.
 // All rights reserved.
 //
 // tegra210_i2s.c - Tegra210 I2S driver
@@ -36,14 +36,28 @@ static const struct reg_default tegra210_i2s_reg_defaults[] = {
 	{ TEGRA210_I2S_CYA, 0x1 },
 };
 
-static void tegra210_i2s_set_slot_ctrl(struct regmap *regmap,
+static const struct reg_default tegra264_i2s_reg_defaults[] = {
+	{ TEGRA210_I2S_RX_INT_MASK, 0x00000003 },
+	{ TEGRA210_I2S_RX_CIF_CTRL, 0x00003f00 },
+	{ TEGRA264_I2S_TX_INT_MASK, 0x00000003 },
+	{ TEGRA264_I2S_TX_CIF_CTRL, 0x00003f00 },
+	{ TEGRA264_I2S_CG, 0x1 },
+	{ TEGRA264_I2S_TIMING, 0x0000001f },
+	{ TEGRA264_I2S_ENABLE, 0x1 },
+	{ TEGRA264_I2S_RX_FIFO_WR_ACCESS_MODE, 0x1 },
+	{ TEGRA264_I2S_TX_FIFO_RD_ACCESS_MODE, 0x1 },
+};
+
+static void tegra210_i2s_set_slot_ctrl(struct tegra210_i2s *i2s,
 				       unsigned int total_slots,
 				       unsigned int tx_slot_mask,
 				       unsigned int rx_slot_mask)
 {
-	regmap_write(regmap, TEGRA210_I2S_SLOT_CTRL, total_slots - 1);
-	regmap_write(regmap, TEGRA210_I2S_TX_SLOT_CTRL, tx_slot_mask);
-	regmap_write(regmap, TEGRA210_I2S_RX_SLOT_CTRL, rx_slot_mask);
+	regmap_write(i2s->regmap, TEGRA210_I2S_SLOT_CTRL + i2s->soc_data->i2s_ctrl_offset,
+		     total_slots - 1);
+	regmap_write(i2s->regmap, TEGRA210_I2S_TX_SLOT_CTRL + i2s->soc_data->tx_offset,
+		     tx_slot_mask);
+	regmap_write(i2s->regmap, TEGRA210_I2S_RX_SLOT_CTRL, rx_slot_mask);
 }
 
 static int tegra210_i2s_set_clock_rate(struct device *dev,
@@ -53,7 +67,7 @@ static int tegra210_i2s_set_clock_rate(struct device *dev,
 	unsigned int val;
 	int err;
 
-	regmap_read(i2s->regmap, TEGRA210_I2S_CTRL, &val);
+	regmap_read(i2s->regmap, TEGRA210_I2S_CTRL + i2s->soc_data->i2s_ctrl_offset, &val);
 
 	/* No need to set rates if I2S is being operated in slave */
 	if (!(val & I2S_CTRL_MASTER_EN))
@@ -100,15 +114,15 @@ static int tegra210_i2s_sw_reset(struct snd_soc_component *compnt,
 		cif_reg = TEGRA210_I2S_RX_CIF_CTRL;
 		stream_reg = TEGRA210_I2S_RX_CTRL;
 	} else {
-		reset_reg = TEGRA210_I2S_TX_SOFT_RESET;
-		cif_reg = TEGRA210_I2S_TX_CIF_CTRL;
-		stream_reg = TEGRA210_I2S_TX_CTRL;
+		reset_reg = TEGRA210_I2S_TX_SOFT_RESET + i2s->soc_data->tx_offset;
+		cif_reg = TEGRA210_I2S_TX_CIF_CTRL + i2s->soc_data->tx_offset;
+		stream_reg = TEGRA210_I2S_TX_CTRL + i2s->soc_data->tx_offset;
 	}
 
 	/* Store CIF and I2S control values */
 	regmap_read(i2s->regmap, cif_reg, &cif_ctrl);
 	regmap_read(i2s->regmap, stream_reg, &stream_ctrl);
-	regmap_read(i2s->regmap, TEGRA210_I2S_CTRL, &i2s_ctrl);
+	regmap_read(i2s->regmap, TEGRA210_I2S_CTRL + i2s->soc_data->i2s_ctrl_offset, &i2s_ctrl);
 
 	/* Reset to make sure the previous transactions are clean */
 	regmap_update_bits(i2s->regmap, reset_reg, reset_mask, reset_en);
@@ -125,7 +139,7 @@ static int tegra210_i2s_sw_reset(struct snd_soc_component *compnt,
 	/* Restore CIF and I2S control values */
 	regmap_write(i2s->regmap, cif_reg, cif_ctrl);
 	regmap_write(i2s->regmap, stream_reg, stream_ctrl);
-	regmap_write(i2s->regmap, TEGRA210_I2S_CTRL, i2s_ctrl);
+	regmap_write(i2s->regmap, TEGRA210_I2S_CTRL + i2s->soc_data->i2s_ctrl_offset, i2s_ctrl);
 
 	return 0;
 }
@@ -140,16 +154,13 @@ static int tegra210_i2s_init(struct snd_soc_dapm_widget *w,
 	int stream;
 	int err;
 
-	switch (w->reg) {
-	case TEGRA210_I2S_RX_ENABLE:
+	if (w->reg == TEGRA210_I2S_RX_ENABLE) {
 		stream = SNDRV_PCM_STREAM_PLAYBACK;
 		status_reg = TEGRA210_I2S_RX_STATUS;
-		break;
-	case TEGRA210_I2S_TX_ENABLE:
+	} else if (w->reg == (TEGRA210_I2S_TX_ENABLE + i2s->soc_data->tx_offset)) {
 		stream = SNDRV_PCM_STREAM_CAPTURE;
-		status_reg = TEGRA210_I2S_TX_STATUS;
-		break;
-	default:
+		status_reg = TEGRA210_I2S_TX_STATUS + i2s->soc_data->tx_offset;
+	} else {
 		return -EINVAL;
 	}
 
@@ -199,7 +210,7 @@ static void tegra210_i2s_set_data_offset(struct tegra210_i2s *i2s,
 					 unsigned int data_offset)
 {
 	/* Capture path */
-	regmap_update_bits(i2s->regmap, TEGRA210_I2S_TX_CTRL,
+	regmap_update_bits(i2s->regmap, TEGRA210_I2S_TX_CTRL + i2s->soc_data->tx_offset,
 			   I2S_CTRL_DATA_OFFSET_MASK,
 			   data_offset << I2S_DATA_SHIFT);
 
@@ -282,7 +293,8 @@ static int tegra210_i2s_set_fmt(struct snd_soc_dai *dai,
 		return -EINVAL;
 	}
 
-	regmap_update_bits(i2s->regmap, TEGRA210_I2S_CTRL, mask, val);
+	regmap_update_bits(i2s->regmap, TEGRA210_I2S_CTRL + i2s->soc_data->i2s_ctrl_offset,
+			   mask, val);
 
 	i2s->dai_fmt = fmt & SND_SOC_DAIFMT_FORMAT_MASK;
 
@@ -296,10 +308,10 @@ static int tegra210_i2s_set_tdm_slot(struct snd_soc_dai *dai,
 	struct tegra210_i2s *i2s = snd_soc_dai_get_drvdata(dai);
 
 	/* Copy the required tx and rx mask */
-	i2s->tx_mask = (tx_mask > DEFAULT_I2S_SLOT_MASK) ?
-		       DEFAULT_I2S_SLOT_MASK : tx_mask;
-	i2s->rx_mask = (rx_mask > DEFAULT_I2S_SLOT_MASK) ?
-		       DEFAULT_I2S_SLOT_MASK : rx_mask;
+	i2s->tx_mask = (tx_mask > i2s->soc_data->slot_mask) ?
+		       i2s->soc_data->slot_mask : tx_mask;
+	i2s->rx_mask = (rx_mask > i2s->soc_data->slot_mask) ?
+		       i2s->soc_data->slot_mask : rx_mask;
 
 	return 0;
 }
@@ -327,8 +339,8 @@ static int tegra210_i2s_put_loopback(struct snd_kcontrol *kcontrol,
 
 	i2s->loopback = value;
 
-	regmap_update_bits(i2s->regmap, TEGRA210_I2S_CTRL, I2S_CTRL_LPBK_MASK,
-			   i2s->loopback << I2S_CTRL_LPBK_SHIFT);
+	regmap_update_bits(i2s->regmap, TEGRA210_I2S_CTRL + i2s->soc_data->i2s_ctrl_offset,
+			   I2S_CTRL_LPBK_MASK, i2s->loopback << I2S_CTRL_LPBK_SHIFT);
 
 	return 1;
 }
@@ -364,9 +376,9 @@ static int tegra210_i2s_put_fsync_width(struct snd_kcontrol *kcontrol,
 	 * cases mixer control is used to update custom values. A value
 	 * of "N" here means, width is "N + 1" bit clock wide.
 	 */
-	regmap_update_bits(i2s->regmap, TEGRA210_I2S_CTRL,
-			   I2S_CTRL_FSYNC_WIDTH_MASK,
-			   i2s->fsync_width << I2S_FSYNC_WIDTH_SHIFT);
+	regmap_update_bits(i2s->regmap, TEGRA210_I2S_CTRL + i2s->soc_data->i2s_ctrl_offset,
+			   i2s->soc_data->fsync_width_mask,
+			   i2s->fsync_width << i2s->soc_data->fsync_width_shift);
 
 	return 1;
 }
@@ -562,7 +574,7 @@ static int tegra210_i2s_set_timing_params(struct device *dev,
 		return err;
 	}
 
-	regmap_read(i2s->regmap, TEGRA210_I2S_CTRL, &val);
+	regmap_read(i2s->regmap, TEGRA210_I2S_CTRL + i2s->soc_data->i2s_ctrl_offset, &val);
 
 	/*
 	 * For LRCK mode, channel bit count depends on number of bit clocks
@@ -578,7 +590,7 @@ static int tegra210_i2s_set_timing_params(struct device *dev,
 	case I2S_CTRL_FRAME_FMT_FSYNC_MODE:
 		bit_count = (bclk_rate / srate) - 1;
 
-		tegra210_i2s_set_slot_ctrl(i2s->regmap, channels,
+		tegra210_i2s_set_slot_ctrl(i2s, channels,
 					   i2s->tx_mask, i2s->rx_mask);
 		break;
 	default:
@@ -591,7 +603,7 @@ static int tegra210_i2s_set_timing_params(struct device *dev,
 		return -EINVAL;
 	}
 
-	regmap_write(i2s->regmap, TEGRA210_I2S_TIMING,
+	regmap_write(i2s->regmap, TEGRA210_I2S_TIMING + i2s->soc_data->i2s_ctrl_offset,
 		     bit_count << I2S_TIMING_CH_BIT_CNT_SHIFT);
 
 	return 0;
@@ -673,7 +685,7 @@ static int tegra210_i2s_hw_params(struct snd_pcm_substream *substream,
 	}
 
 	/* Program sample size */
-	regmap_update_bits(i2s->regmap, TEGRA210_I2S_CTRL,
+	regmap_update_bits(i2s->regmap, TEGRA210_I2S_CTRL + i2s->soc_data->i2s_ctrl_offset,
 			   I2S_CTRL_BIT_SIZE_MASK, val);
 
 	srate = params_rate(params);
@@ -697,13 +709,16 @@ static int tegra210_i2s_hw_params(struct snd_pcm_substream *substream,
 
 		reg = TEGRA210_I2S_RX_CIF_CTRL;
 	} else {
-		reg = TEGRA210_I2S_TX_CIF_CTRL;
+		reg = TEGRA210_I2S_TX_CIF_CTRL + i2s->soc_data->tx_offset;
 	}
 
 	cif_conf.mono_conv = i2s->mono_to_stereo[path];
 	cif_conf.stereo_conv = i2s->stereo_to_mono[path];
 
-	tegra_set_cif(i2s->regmap, reg, &cif_conf);
+	if (i2s->soc_data->max_ch == TEGRA264_I2S_MAX_CHANNEL)
+		tegra264_set_cif(i2s->regmap, reg, &cif_conf);
+	else
+		tegra_set_cif(i2s->regmap, reg, &cif_conf);
 
 	return tegra210_i2s_set_timing_params(dev, sample_size, srate,
 					      cif_conf.client_ch);
@@ -808,13 +823,20 @@ static const struct snd_kcontrol_new tegra210_i2s_controls[] = {
 		       tegra210_i2s_put_bclk_ratio),
 };
 
-static const struct snd_soc_dapm_widget tegra210_i2s_widgets[] = {
-	SND_SOC_DAPM_AIF_IN_E("RX", NULL, 0, TEGRA210_I2S_RX_ENABLE,
-			      0, 0, tegra210_i2s_init, SND_SOC_DAPM_PRE_PMU),
-	SND_SOC_DAPM_AIF_OUT_E("TX", NULL, 0, TEGRA210_I2S_TX_ENABLE,
-			       0, 0, tegra210_i2s_init, SND_SOC_DAPM_PRE_PMU),
-	SND_SOC_DAPM_MIC("MIC", NULL),
+#define TEGRA_I2S_WIDGETS(tx_enable_reg) \
+	SND_SOC_DAPM_AIF_IN_E("RX", NULL, 0, TEGRA210_I2S_RX_ENABLE, \
+			      0, 0, tegra210_i2s_init, SND_SOC_DAPM_PRE_PMU), \
+	SND_SOC_DAPM_AIF_OUT_E("TX", NULL, 0, tx_enable_reg, \
+			       0, 0, tegra210_i2s_init, SND_SOC_DAPM_PRE_PMU), \
+	SND_SOC_DAPM_MIC("MIC", NULL), \
 	SND_SOC_DAPM_SPK("SPK", NULL),
+
+static const struct snd_soc_dapm_widget tegra210_i2s_widgets[] = {
+	TEGRA_I2S_WIDGETS(TEGRA210_I2S_TX_ENABLE)
+};
+
+static const struct snd_soc_dapm_widget tegra264_i2s_widgets[] = {
+	TEGRA_I2S_WIDGETS(TEGRA264_I2S_TX_ENABLE)
 };
 
 static const struct snd_soc_dapm_route tegra210_i2s_routes[] = {
@@ -841,6 +863,15 @@ static const struct snd_soc_component_driver tegra210_i2s_cmpnt = {
 	.num_controls		= ARRAY_SIZE(tegra210_i2s_controls),
 };
 
+static const struct snd_soc_component_driver tegra264_i2s_cmpnt = {
+	.dapm_widgets		= tegra264_i2s_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(tegra264_i2s_widgets),
+	.dapm_routes		= tegra210_i2s_routes,
+	.num_dapm_routes	= ARRAY_SIZE(tegra210_i2s_routes),
+	.controls		= tegra210_i2s_controls,
+	.num_controls		= ARRAY_SIZE(tegra210_i2s_controls),
+};
+
 static bool tegra210_i2s_wr_reg(struct device *dev, unsigned int reg)
 {
 	switch (reg) {
@@ -895,7 +926,68 @@ static bool tegra210_i2s_volatile_reg(struct device *dev, unsigned int reg)
 	}
 }
 
-static const struct regmap_config tegra210_i2s_regmap_config = {
+static bool tegra264_i2s_wr_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case TEGRA210_I2S_RX_ENABLE ... TEGRA210_I2S_RX_SOFT_RESET:
+	case TEGRA210_I2S_RX_INT_MASK ... TEGRA264_I2S_RX_CYA:
+	case TEGRA264_I2S_TX_ENABLE ... TEGRA264_I2S_TX_SOFT_RESET:
+	case TEGRA264_I2S_TX_INT_MASK ... TEGRA264_I2S_TX_FIFO_RD_ACCESS_MODE:
+	case TEGRA264_I2S_TX_FIFO_THRESHOLD ... TEGRA264_I2S_TX_CYA:
+	case TEGRA264_I2S_ENABLE ... TEGRA264_I2S_CG:
+	case TEGRA264_I2S_INT_SET ... TEGRA264_I2S_INT_MASK:
+	case TEGRA264_I2S_CTRL ... TEGRA264_I2S_CYA:
+		return true;
+	default:
+		return false;
+	};
+}
+
+static bool tegra264_i2s_rd_reg(struct device *dev, unsigned int reg)
+{
+	if (tegra264_i2s_wr_reg(dev, reg))
+		return true;
+
+	switch (reg) {
+	case TEGRA210_I2S_RX_STATUS:
+	case TEGRA210_I2S_RX_INT_STATUS:
+	case TEGRA264_I2S_RX_CIF_FIFO_STATUS:
+	case TEGRA264_I2S_TX_STATUS:
+	case TEGRA264_I2S_TX_INT_STATUS:
+	case TEGRA264_I2S_TX_FIFO_RD_DATA:
+	case TEGRA264_I2S_TX_CIF_FIFO_STATUS:
+	case TEGRA264_I2S_STATUS:
+	case TEGRA264_I2S_INT_STATUS:
+	case TEGRA264_I2S_PIO_MODE_ENABLE:
+	case TEGRA264_I2S_PAD_MACRO_STATUS:
+		return true;
+	default:
+		return false;
+	};
+}
+
+static bool tegra264_i2s_volatile_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case TEGRA210_I2S_RX_SOFT_RESET:
+	case TEGRA210_I2S_RX_STATUS:
+	case TEGRA210_I2S_RX_INT_STATUS:
+	case TEGRA264_I2S_RX_CIF_FIFO_STATUS:
+	case TEGRA264_I2S_TX_STATUS:
+	case TEGRA264_I2S_TX_INT_STATUS:
+	case TEGRA264_I2S_TX_FIFO_RD_DATA:
+	case TEGRA264_I2S_TX_CIF_FIFO_STATUS:
+	case TEGRA264_I2S_STATUS:
+	case TEGRA264_I2S_INT_STATUS:
+	case TEGRA264_I2S_TX_SOFT_RESET:
+	case TEGRA264_I2S_PAD_MACRO_STATUS:
+		return true;
+	default:
+		return false;
+	};
+}
+
+static const struct regmap_config tegra210_regmap_conf = {
 	.reg_bits		= 32,
 	.reg_stride		= 4,
 	.val_bits		= 32,
@@ -942,20 +1034,34 @@ static void tegra210_parse_client_convert(struct device *dev)
 		i2s->client_sample_format = simple_util_get_sample_fmt(&data);
 }
 
+static const struct regmap_config tegra264_regmap_conf = {
+	.reg_bits		= 32,
+	.reg_stride		= 4,
+	.val_bits		= 32,
+	.max_register		= TEGRA264_I2S_PAD_MACRO_STATUS,
+	.writeable_reg		= tegra264_i2s_wr_reg,
+	.readable_reg		= tegra264_i2s_rd_reg,
+	.volatile_reg		= tegra264_i2s_volatile_reg,
+	.reg_defaults		= tegra264_i2s_reg_defaults,
+	.num_reg_defaults	= ARRAY_SIZE(tegra264_i2s_reg_defaults),
+	.cache_type		= REGCACHE_FLAT,
+};
+
 static int tegra210_i2s_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct tegra210_i2s *i2s;
 	void __iomem *regs;
-	int err;
+	int err, id;
 
 	i2s = devm_kzalloc(dev, sizeof(*i2s), GFP_KERNEL);
 	if (!i2s)
 		return -ENOMEM;
 
+	i2s->soc_data = of_device_get_match_data(&pdev->dev);
 	i2s->rx_fifo_th = DEFAULT_I2S_RX_FIFO_THRESHOLD;
-	i2s->tx_mask = DEFAULT_I2S_SLOT_MASK;
-	i2s->rx_mask = DEFAULT_I2S_SLOT_MASK;
+	i2s->tx_mask = i2s->soc_data->slot_mask;
+	i2s->rx_mask = i2s->soc_data->slot_mask;
 	i2s->loopback = false;
 	i2s->client_sample_format = -EINVAL;
 
@@ -981,7 +1087,7 @@ static int tegra210_i2s_probe(struct platform_device *pdev)
 		return PTR_ERR(regs);
 
 	i2s->regmap = devm_regmap_init_mmio(dev, regs,
-					    &tegra210_i2s_regmap_config);
+					    i2s->soc_data->regmap_conf);
 	if (IS_ERR(i2s->regmap)) {
 		dev_err(dev, "regmap init failed\n");
 		return PTR_ERR(i2s->regmap);
@@ -991,7 +1097,13 @@ static int tegra210_i2s_probe(struct platform_device *pdev)
 
 	regcache_cache_only(i2s->regmap, true);
 
-	err = devm_snd_soc_register_component(dev, &tegra210_i2s_cmpnt,
+	/* Update the dais max channel as per soc */
+	for (id = 0; id < ARRAY_SIZE(tegra210_i2s_dais); id++) {
+		tegra210_i2s_dais[id].playback.channels_max = i2s->soc_data->max_ch;
+		tegra210_i2s_dais[id].capture.channels_max = i2s->soc_data->max_ch;
+	}
+
+	err = devm_snd_soc_register_component(dev, i2s->soc_data->i2s_cmpnt,
 					      tegra210_i2s_dais,
 					      ARRAY_SIZE(tegra210_i2s_dais));
 	if (err) {
@@ -1015,8 +1127,31 @@ static const struct dev_pm_ops tegra210_i2s_pm_ops = {
 	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 };
 
+static const struct tegra_i2s_soc_data soc_data_tegra210 = {
+	.regmap_conf		= &tegra210_regmap_conf,
+	.i2s_cmpnt		= &tegra210_i2s_cmpnt,
+	.max_ch			= TEGRA210_I2S_MAX_CHANNEL,
+	.tx_offset		= TEGRA210_I2S_TX_OFFSET,
+	.i2s_ctrl_offset	= TEGRA210_I2S_CTRL_OFFSET,
+	.fsync_width_mask	= I2S_CTRL_FSYNC_WIDTH_MASK,
+	.fsync_width_shift	= I2S_FSYNC_WIDTH_SHIFT,
+	.slot_mask		= DEFAULT_I2S_SLOT_MASK,
+};
+
+static const struct tegra_i2s_soc_data soc_data_tegra264 = {
+	.regmap_conf		= &tegra264_regmap_conf,
+	.i2s_cmpnt		= &tegra264_i2s_cmpnt,
+	.max_ch			= TEGRA264_I2S_MAX_CHANNEL,
+	.tx_offset		= TEGRA264_I2S_TX_OFFSET,
+	.i2s_ctrl_offset	= TEGRA264_I2S_CTRL_OFFSET,
+	.fsync_width_mask	= TEGRA264_I2S_CTRL_FSYNC_WIDTH_MASK,
+	.fsync_width_shift	= TEGRA264_I2S_FSYNC_WIDTH_SHIFT,
+	.slot_mask		= TEGRA264_DEFAULT_I2S_SLOT_MASK,
+};
+
 static const struct of_device_id tegra210_i2s_of_match[] = {
-	{ .compatible = "nvidia,tegra210-i2s" },
+	{ .compatible = "nvidia,tegra210-i2s", .data = &soc_data_tegra210 },
+	{ .compatible = "nvidia,tegra264-i2s", .data = &soc_data_tegra264 },
 	{},
 };
 MODULE_DEVICE_TABLE(of, tegra210_i2s_of_match);
diff --git a/sound/soc/tegra/tegra210_i2s.h b/sound/soc/tegra/tegra210_i2s.h
index 543332de7405..42be2137342c 100644
--- a/sound/soc/tegra/tegra210_i2s.h
+++ b/sound/soc/tegra/tegra210_i2s.h
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0-only
- * SPDX-FileCopyrightText: Copyright (c) 2020-2024 NVIDIA CORPORATION & AFFILIATES.
+ * SPDX-FileCopyrightText: Copyright (c) 2020-2025 NVIDIA CORPORATION & AFFILIATES.
  * All rights reserved.
  *
  * tegra210_i2s.h - Definitions for Tegra210 I2S driver
@@ -47,9 +47,38 @@
 #define TEGRA210_I2S_CLK_TRIM			0xac
 #define TEGRA210_I2S_CYA			0xb0
 
+/* T264 specific registers */
+#define TEGRA264_I2S_RX_FIFO_WR_ACCESS_MODE	0x30
+#define TEGRA264_I2S_RX_CYA			0x3c
+#define TEGRA264_I2S_RX_CIF_FIFO_STATUS		0x40
+#define TEGRA264_I2S_TX_ENABLE			0x80
+#define TEGRA264_I2S_TX_SOFT_RESET		0x84
+#define TEGRA264_I2S_TX_STATUS			0x8c
+#define TEGRA264_I2S_TX_INT_STATUS		0x90
+#define TEGRA264_I2S_TX_INT_MASK		0x94
+#define TEGRA264_I2S_TX_CIF_CTRL		0xa0
+#define TEGRA264_I2S_TX_FIFO_RD_ACCESS_MODE	0xb0
+#define TEGRA264_I2S_TX_FIFO_RD_DATA		0xb4
+#define TEGRA264_I2S_TX_FIFO_THRESHOLD		0xb8
+#define TEGRA264_I2S_TX_CYA			0xbc
+#define TEGRA264_I2S_TX_CIF_FIFO_STATUS		0xc0
+#define TEGRA264_I2S_ENABLE			0x100
+#define TEGRA264_I2S_CG				0x108
+#define TEGRA264_I2S_STATUS			0x10c
+#define TEGRA264_I2S_INT_STATUS			0x110
+#define TEGRA264_I2S_INT_SET			0x114
+#define TEGRA264_I2S_INT_MASK			0x11c
+#define TEGRA264_I2S_CTRL			0x12c
+#define TEGRA264_I2S_TIMING			0x130
+#define TEGRA264_I2S_CYA			0x13c
+#define TEGRA264_I2S_PIO_MODE_ENABLE		0x140
+#define TEGRA264_I2S_PAD_MACRO_STATUS		0x144
+
 /* Bit fields, shifts and masks */
 #define I2S_DATA_SHIFT				8
 #define I2S_CTRL_DATA_OFFSET_MASK		(0x7ff << I2S_DATA_SHIFT)
+#define TEGRA264_I2S_FSYNC_WIDTH_SHIFT		23
+#define TEGRA264_I2S_CTRL_FSYNC_WIDTH_MASK	(0x1ff << TEGRA264_I2S_FSYNC_WIDTH_SHIFT)
 
 #define I2S_EN_SHIFT				0
 #define I2S_EN_MASK				BIT(I2S_EN_SHIFT)
@@ -102,6 +131,14 @@
 #define DEFAULT_I2S_RX_FIFO_THRESHOLD		3
 
 #define DEFAULT_I2S_SLOT_MASK			0xffff
+#define TEGRA210_I2S_TX_OFFSET			0
+#define TEGRA210_I2S_CTRL_OFFSET		0
+#define TEGRA210_I2S_MAX_CHANNEL		16
+
+#define TEGRA264_DEFAULT_I2S_SLOT_MASK		0xffffffff
+#define TEGRA264_I2S_TX_OFFSET			0x40
+#define TEGRA264_I2S_CTRL_OFFSET		0x8c
+#define TEGRA264_I2S_MAX_CHANNEL		32
 
 enum tegra210_i2s_path {
 	I2S_RX_PATH,
@@ -109,7 +146,19 @@ enum tegra210_i2s_path {
 	I2S_PATHS,
 };
 
+struct tegra_i2s_soc_data {
+	const struct regmap_config *regmap_conf;
+	const struct snd_soc_component_driver *i2s_cmpnt;
+	unsigned int max_ch;
+	unsigned int tx_offset;
+	unsigned int i2s_ctrl_offset;
+	unsigned int fsync_width_mask;
+	unsigned int fsync_width_shift;
+	unsigned int slot_mask;
+};
+
 struct tegra210_i2s {
+	const struct tegra_i2s_soc_data *soc_data;
 	struct clk *clk_i2s;
 	struct clk *clk_sync_input;
 	struct regmap *regmap;
-- 
2.17.1



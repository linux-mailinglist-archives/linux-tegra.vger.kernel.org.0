Return-Path: <linux-tegra+bounces-6790-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C22A4AB2EEF
	for <lists+linux-tegra@lfdr.de>; Mon, 12 May 2025 07:21:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2FA1F3BAB30
	for <lists+linux-tegra@lfdr.de>; Mon, 12 May 2025 05:20:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBA182586D9;
	Mon, 12 May 2025 05:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ETL+GamV"
X-Original-To: linux-tegra@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2075.outbound.protection.outlook.com [40.107.237.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA521C84CE;
	Mon, 12 May 2025 05:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747027126; cv=fail; b=XdsuN3q3VfYmHMouiPiFhceHmFrEGPa968UX6vwBTfuvZFSjvdD3Uq4yhywVJ8mZ/9LxaYyIAeP860zDbbuUw9mRuo+z8DApBLEeAp+CGbuxSEtZchN3GCZQh3zPAvNm3CYCoO5rfzhIIb8vB1csS8GwDYphboj/2Xq+8b/0SK4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747027126; c=relaxed/simple;
	bh=ySoZdWrxmklKIRYpiHpR7pkGWuBskFmWi75GR2IDpSk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mFM3ZmeLZ2LPgGfEctwgDc1N5pt196ApC1dXOe6GKPoJKVXvpYmb8kelhord6OpeKdiJOGi4fNv+ev0TdbYl9emhy2Qf2JJvz++RyLt6OB7/T1Jwgv1Z083mMTR1qXQ/dQTXUSoqUYC1wBzs5mWBNopfGTGpmefmC8a6EATn4fQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ETL+GamV; arc=fail smtp.client-ip=40.107.237.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qDGs/UBMGEJO3AbzoF+Vs/rrjvYVBKV26S0ggMmprzbrHe/vngVbRC3mpzOV9C9Z3teKcYjgKzO3WghD1odAO9sNSYcXgFqIPmN6sVeFbV/HWPw7BePMDiVESoAOD/T0Iyc2Hg75F8J6BVxRXlS2lAC6nPowyvq/fh0Kr63IGQjbHma+ozkfNKWQw7BAO53/G0kcdSEayraaISDDf+kJAyHGF1xzpssSBBMMS0VncJ8bs+2BrsZmd+eQYIXzU3M/+huyJBr3428LgD9Cy1ID2d6rWGgReExF0PoUsF1MATea9n7rK+c71xxFQlSzkiQwx3DqTXJSvEIRyz+rnTdYRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+rPL7nUCO79QV07KaSz3HbTzrcZPuy8Ji6bJwLuOP1U=;
 b=EfiGM5W6taTXOV5vC5+amaqG/NHuPBE+hZo3MWEAKDHOEWfh9S4ZN4WZahs32PD/SJuZNpSAr3FEMCrvnNg/vomuaB7LiRuPAYdD0xZgw70MQuh/VQqDDoCeQa/BmykSYB2rp159yHX0gBPolYHr76DcbRGmefAE5jkf7OXttnqnH4IO93Z16tdnXAwWsz9qXMoCw1qlubCh/rRL3DTNF2h538g34mKpHrIv/5RkSlaUQEOOJzwSyXiEpj0mPm8+a+TCppj/MWZ0iUivzlh38+ULBYI6nxh3UUf2fHTAbkDOxGkCyrSzvBhWrYi8uK3PRQ9NvE3+7ECYKEr8MQTl1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+rPL7nUCO79QV07KaSz3HbTzrcZPuy8Ji6bJwLuOP1U=;
 b=ETL+GamVJl8L/5/Mkf+eg/Cbpf79ZScaLoF+e/ayaoDPy5XM4FV/eIudXW7uvPzDfjiy5LILQ/sumZKrUSw+j/0uDMZQ5EtA4sWNbe4E290KPx19/5Vmd4MixfsljBuCYQaRyLGrPV/6zPrCrWEcUtQQ5qFu91a/kVy2Pk7f4Wbma1WZoJW8Fmx0v34psLexDXTsRW9jMtJkAZwkluSnPFAN0/VruZ2mTj96soKTwN846FpIQjCwiq3VCAszCqQODwTRV0294nc8Upcsd50x/9P5ie2g2C/vC8HcNSdrKLbWj9/XN13BHtSSnJWbds+LpPvmgXXZ8W5TvxDnlfgP9g==
Received: from BY1P220CA0016.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5c3::13)
 by DS0PR12MB7900.namprd12.prod.outlook.com (2603:10b6:8:14e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Mon, 12 May
 2025 05:18:31 +0000
Received: from CY4PEPF0000EE38.namprd03.prod.outlook.com
 (2603:10b6:a03:5c3:cafe::a8) by BY1P220CA0016.outlook.office365.com
 (2603:10b6:a03:5c3::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.30 via Frontend Transport; Mon,
 12 May 2025 05:18:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CY4PEPF0000EE38.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Mon, 12 May 2025 05:18:30 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 11 May
 2025 22:18:15 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 11 May 2025 22:18:15 -0700
Received: from build-sheetal-bionic-20250305.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.14
 via Frontend Transport; Sun, 11 May 2025 22:18:15 -0700
From: "Sheetal ." <sheetal@nvidia.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<lgirdwood@gmail.com>, <broonie@kernel.org>
CC: <perex@perex.cz>, <tiwai@suse.com>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <spujar@nvidia.com>, <mkumard@nvidia.com>, Sheetal
	<sheetal@nvidia.com>
Subject: [PATCH v3 10/11] ASoC: tegra: AHUB: Add Tegra264 support
Date: Mon, 12 May 2025 05:17:46 +0000
Message-ID: <20250512051747.1026770-11-sheetal@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250512051747.1026770-1-sheetal@nvidia.com>
References: <20250512051747.1026770-1-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE38:EE_|DS0PR12MB7900:EE_
X-MS-Office365-Filtering-Correlation-Id: f66834d6-b168-4713-22f3-08dd91146f2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|7416014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?i6qZP0YFmCdk3jsPW2m3P8akgFreLeHwiB0vahL0KJe0Sln3MhifCAcwqKZ6?=
 =?us-ascii?Q?pzNIZyx81k/kc7pqRqii8e5BXfD1i/HpH6ET7g9Zuhk+MwwaWnfqDAZcouiu?=
 =?us-ascii?Q?ILIcWBGyxDzLdhu37/9UK0Io1NzCCjcxj54LyTbu41bNapJfDumrjVNzNBSY?=
 =?us-ascii?Q?9sPayBDaK13LPvg1fwi/1pM3m03gkie8RubYXpdshwowwRK9Lxhq1+vsTt4O?=
 =?us-ascii?Q?BZR70l5CB7ILD4GD1uSqZ63pVVx4hLn5d1kcOiURQVZT7IN/9MLvl9mI0ZI9?=
 =?us-ascii?Q?MMWt2x8COVSMBn2XYE1Sx54rDJCDBRCsjVEmqivwluVEiK9yQirL5vofdZ5I?=
 =?us-ascii?Q?nPH6OHld+Hw0v0i+bQ/clvA2LVM52TkclhczHIjzNCdWGIoKBBPcFAfEhAj7?=
 =?us-ascii?Q?LOVMsTB4TPorM1y47XCNb6SNEORBnMRzc8arvvqZ5Zvw/hckLmcFfVZAYT4Z?=
 =?us-ascii?Q?JUVm6l8X8coYtur2Nme7PtVAeDlvDAEdkSehdu+QctA8X1jy4+IWZDpEJV6S?=
 =?us-ascii?Q?TfoJdPjxoWNlJyhKNr7p0tneU9MU2FmI6ySfG2O7ylDUk5gTJnR9OnY6SFUU?=
 =?us-ascii?Q?Tlm7THVVlwO1/wNHYVIvtN+8m/lrrdnjrb54YetM581OBsR0EKuyFu0SSJp3?=
 =?us-ascii?Q?8r+fm50v+NSSICU/Tdu0wDyVNGKcij/mosuBfO3fuRUEYUf7CY7dvqBuFtMg?=
 =?us-ascii?Q?eXYWpb4OGtx5hSkPbqcKd/Fvi/eRjhd/KRn1NE00T3mLhuTzLK37XiBDD7ly?=
 =?us-ascii?Q?OmZ70VCqBz5kMA1njo5iqW8OhtIHB0y+WytcotTWiCKaeq6/b3ofo8L5QKK2?=
 =?us-ascii?Q?Nj7chDuIzEdC5BSH9ltBygVmhG31FtZO+bb4j5+MuaYOoAAro3QeUHnudVnX?=
 =?us-ascii?Q?TFU0BpKjsVuI2a1G44PxEQeNQx4TnPJh3wlp0i1v4yoz4BzrUeC2/bfKw8Fq?=
 =?us-ascii?Q?UwWdw+AotoZ0oK4WymxDSvxl6c9nzmP9Z/YnAQQ+xRLgM3FahgJGrq/spDkx?=
 =?us-ascii?Q?HlesDdS8Hgw8NgiqfAbVqFvUpWzEs2Q2gvNW9JsJwoK55Zh6mPSdbizPLMuV?=
 =?us-ascii?Q?dYG/71brVZqT2l1pF1CjRD15Ib1qW9A3a2bs/l0jd9rL+eLTxKo/RxB1huFL?=
 =?us-ascii?Q?LymhajCQV+UlnyLE8XUJoY01r5GmPhz0bmlzfOLiD93Jn4Krmo9E6l3UeX+o?=
 =?us-ascii?Q?gWhGzQDYk+VbvY38/HLjEIdLZMdhTAUU0stn9nuN6EMY72VmDR5zezeEYYvM?=
 =?us-ascii?Q?VXG0tTPUmXVmWdSc2o7tIjygGhEDRQcxNj5lCHMLpTV3AlrLAu0En1MOaAEE?=
 =?us-ascii?Q?zVVwnhe7Yg9OVT8mmitfoMnqH1nNHJyCyykQG8mRbTYbGG/Ql5Cc5jQunO7D?=
 =?us-ascii?Q?ixClqGn4egba1gtdZKOcCITS97v+YzcA9JnZozTTYASKiaRDaF4PBfIhhs4S?=
 =?us-ascii?Q?iWcqOeu5iq9j80fyNohu3hEYI+kR1OgrFQnLIl2gSCBqioA7ccYKBJyqD7Ey?=
 =?us-ascii?Q?dhBytD0rF2h63mqejs1x+AeYmts2GMNW19ES?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(7416014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 05:18:30.5938
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f66834d6-b168-4713-22f3-08dd91146f2f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE38.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7900

From: Sheetal <sheetal@nvidia.com>

Add Tegra264 AHUB support with following changes:
- Update Tegra264 IP instances: DMIC(2), DSPK(1), AMX(6), ADX(6), I2S(8).
- Update register offsets for Tegra264.
- Add soc_data for Tegra264 chip-specific variations.
- Increase channels_max to 32 for Tegra264 DAIs.

Signed-off-by: Sheetal <sheetal@nvidia.com>
---
 sound/soc/tegra/tegra210_ahub.c | 848 +++++++++++++++++++++++++++++++-
 sound/soc/tegra/tegra210_ahub.h |  52 +-
 2 files changed, 891 insertions(+), 9 deletions(-)

diff --git a/sound/soc/tegra/tegra210_ahub.c b/sound/soc/tegra/tegra210_ahub.c
index 99683f292b5d..41cf5c3e1aa5 100644
--- a/sound/soc/tegra/tegra210_ahub.c
+++ b/sound/soc/tegra/tegra210_ahub.c
@@ -2,7 +2,7 @@
 //
 // tegra210_ahub.c - Tegra210 AHUB driver
 //
-// Copyright (c) 2020-2024, NVIDIA CORPORATION.  All rights reserved.
+// Copyright (c) 2020-2025, NVIDIA CORPORATION.  All rights reserved.
 
 #include <linux/clk.h>
 #include <linux/device.h>
@@ -29,7 +29,7 @@ static int tegra_ahub_get_value_enum(struct snd_kcontrol *kctl,
 	for (i = 0; i < ahub->soc_data->reg_count; i++) {
 		unsigned int reg_val;
 
-		reg = e->reg + (TEGRA210_XBAR_PART1_RX * i);
+		reg = e->reg + (ahub->soc_data->xbar_part_size * i);
 		reg_val = snd_soc_component_read(cmpnt, reg);
 		reg_val &= ahub->soc_data->mask[i];
 
@@ -80,7 +80,7 @@ static int tegra_ahub_put_value_enum(struct snd_kcontrol *kctl,
 	 * different part of the MUX register.
 	 */
 	for (i = 0; i < ahub->soc_data->reg_count; i++) {
-		update[i].reg = e->reg + (TEGRA210_XBAR_PART1_RX * i);
+		update[i].reg = e->reg + (ahub->soc_data->xbar_part_size * i);
 		update[i].val = (i == reg_idx) ? reg_val : 0;
 		update[i].mask = ahub->soc_data->mask[i];
 		update[i].kcontrol = kctl;
@@ -304,6 +304,164 @@ static struct snd_soc_dai_driver tegra186_ahub_dais[] = {
 	DAI(OPE1 TX),
 };
 
+static struct snd_soc_dai_driver tegra264_ahub_dais[] = {
+	DAI(ADMAIF1),
+	DAI(ADMAIF2),
+	DAI(ADMAIF3),
+	DAI(ADMAIF4),
+	DAI(ADMAIF5),
+	DAI(ADMAIF6),
+	DAI(ADMAIF7),
+	DAI(ADMAIF8),
+	DAI(ADMAIF9),
+	DAI(ADMAIF10),
+	DAI(ADMAIF11),
+	DAI(ADMAIF12),
+	DAI(ADMAIF13),
+	DAI(ADMAIF14),
+	DAI(ADMAIF15),
+	DAI(ADMAIF16),
+	DAI(ADMAIF17),
+	DAI(ADMAIF18),
+	DAI(ADMAIF19),
+	DAI(ADMAIF20),
+	DAI(ADMAIF21),
+	DAI(ADMAIF22),
+	DAI(ADMAIF23),
+	DAI(ADMAIF24),
+	DAI(ADMAIF25),
+	DAI(ADMAIF26),
+	DAI(ADMAIF27),
+	DAI(ADMAIF28),
+	DAI(ADMAIF29),
+	DAI(ADMAIF30),
+	DAI(ADMAIF31),
+	DAI(ADMAIF32),
+	/* XBAR <-> I2S <-> Codec */
+	DAI(I2S1),
+	DAI(I2S2),
+	DAI(I2S3),
+	DAI(I2S4),
+	DAI(I2S5),
+	DAI(I2S6),
+	DAI(I2S7),
+	DAI(I2S8),
+	/* XBAR <-> DMIC <-> Codec */
+	DAI(DMIC1),
+	DAI(DMIC2),
+	/* XBAR <-> DSPK <-> Codec */
+	DAI(DSPK1),
+	/* XBAR -> SFC -> XBAR */
+	DAI(SFC1 RX),
+	DAI(SFC1 TX),
+	DAI(SFC2 RX),
+	DAI(SFC2 TX),
+	DAI(SFC3 RX),
+	DAI(SFC3 TX),
+	DAI(SFC4 RX),
+	DAI(SFC4 TX),
+	/* XBAR -> MVC -> XBAR */
+	DAI(MVC1 RX),
+	DAI(MVC1 TX),
+	DAI(MVC2 RX),
+	DAI(MVC2 TX),
+	/* XBAR -> AMX(4:1) -> XBAR */
+	DAI(AMX1 RX1),
+	DAI(AMX1 RX2),
+	DAI(AMX1 RX3),
+	DAI(AMX1 RX4),
+	DAI(AMX1),
+	DAI(AMX2 RX1),
+	DAI(AMX2 RX2),
+	DAI(AMX2 RX3),
+	DAI(AMX2 RX4),
+	DAI(AMX2),
+	DAI(AMX3 RX1),
+	DAI(AMX3 RX2),
+	DAI(AMX3 RX3),
+	DAI(AMX3 RX4),
+	DAI(AMX3),
+	DAI(AMX4 RX1),
+	DAI(AMX4 RX2),
+	DAI(AMX4 RX3),
+	DAI(AMX4 RX4),
+	DAI(AMX4),
+	DAI(AMX5 RX1),
+	DAI(AMX5 RX2),
+	DAI(AMX5 RX3),
+	DAI(AMX5 RX4),
+	DAI(AMX5),
+	DAI(AMX6 RX1),
+	DAI(AMX6 RX2),
+	DAI(AMX6 RX3),
+	DAI(AMX6 RX4),
+	DAI(AMX6),
+	/* XBAR -> ADX(1:4) -> XBAR */
+	DAI(ADX1),
+	DAI(ADX1 TX1),
+	DAI(ADX1 TX2),
+	DAI(ADX1 TX3),
+	DAI(ADX1 TX4),
+	DAI(ADX2),
+	DAI(ADX2 TX1),
+	DAI(ADX2 TX2),
+	DAI(ADX2 TX3),
+	DAI(ADX2 TX4),
+	DAI(ADX3),
+	DAI(ADX3 TX1),
+	DAI(ADX3 TX2),
+	DAI(ADX3 TX3),
+	DAI(ADX3 TX4),
+	DAI(ADX4),
+	DAI(ADX4 TX1),
+	DAI(ADX4 TX2),
+	DAI(ADX4 TX3),
+	DAI(ADX4 TX4),
+	DAI(ADX5),
+	DAI(ADX5 TX1),
+	DAI(ADX5 TX2),
+	DAI(ADX5 TX3),
+	DAI(ADX5 TX4),
+	DAI(ADX6),
+	DAI(ADX6 TX1),
+	DAI(ADX6 TX2),
+	DAI(ADX6 TX3),
+	DAI(ADX6 TX4),
+	/* XBAR -> MIXER1(10:5) -> XBAR */
+	DAI(MIXER1 RX1),
+	DAI(MIXER1 RX2),
+	DAI(MIXER1 RX3),
+	DAI(MIXER1 RX4),
+	DAI(MIXER1 RX5),
+	DAI(MIXER1 RX6),
+	DAI(MIXER1 RX7),
+	DAI(MIXER1 RX8),
+	DAI(MIXER1 RX9),
+	DAI(MIXER1 RX10),
+	DAI(MIXER1 TX1),
+	DAI(MIXER1 TX2),
+	DAI(MIXER1 TX3),
+	DAI(MIXER1 TX4),
+	DAI(MIXER1 TX5),
+	/* XBAR -> ASRC -> XBAR */
+	DAI(ASRC1 RX1),
+	DAI(ASRC1 TX1),
+	DAI(ASRC1 RX2),
+	DAI(ASRC1 TX2),
+	DAI(ASRC1 RX3),
+	DAI(ASRC1 TX3),
+	DAI(ASRC1 RX4),
+	DAI(ASRC1 TX4),
+	DAI(ASRC1 RX5),
+	DAI(ASRC1 TX5),
+	DAI(ASRC1 RX6),
+	DAI(ASRC1 TX6),
+	DAI(ASRC1 RX7),
+	/* XBAR -> OPE -> XBAR */
+	DAI(OPE1 RX),
+	DAI(OPE1 TX),
+};
+
 static const char * const tegra210_ahub_mux_texts[] = {
 	"None",
 	"ADMAIF1",
@@ -421,6 +579,100 @@ static const char * const tegra186_ahub_mux_texts[] = {
 	"OPE1",
 };
 
+static const char * const tegra264_ahub_mux_texts[] = {
+	"None",
+	"ADMAIF1",
+	"ADMAIF2",
+	"ADMAIF3",
+	"ADMAIF4",
+	"ADMAIF5",
+	"ADMAIF6",
+	"ADMAIF7",
+	"ADMAIF8",
+	"ADMAIF9",
+	"ADMAIF10",
+	"ADMAIF11",
+	"ADMAIF12",
+	"ADMAIF13",
+	"ADMAIF14",
+	"ADMAIF15",
+	"ADMAIF16",
+	"I2S1",
+	"I2S2",
+	"I2S3",
+	"I2S4",
+	"I2S5",
+	"I2S6",
+	"I2S7",
+	"I2S8",
+	"SFC1",
+	"SFC2",
+	"SFC3",
+	"SFC4",
+	"MIXER1 TX1",
+	"MIXER1 TX2",
+	"MIXER1 TX3",
+	"MIXER1 TX4",
+	"MIXER1 TX5",
+	"AMX1",
+	"AMX2",
+	"AMX3",
+	"AMX4",
+	"AMX5",
+	"AMX6",
+	"OPE1",
+	"MVC1",
+	"MVC2",
+	"DMIC1",
+	"DMIC2",
+	"ADX1 TX1",
+	"ADX1 TX2",
+	"ADX1 TX3",
+	"ADX1 TX4",
+	"ADX2 TX1",
+	"ADX2 TX2",
+	"ADX2 TX3",
+	"ADX2 TX4",
+	"ADX3 TX1",
+	"ADX3 TX2",
+	"ADX3 TX3",
+	"ADX3 TX4",
+	"ADX4 TX1",
+	"ADX4 TX2",
+	"ADX4 TX3",
+	"ADX4 TX4",
+	"ADX5 TX1",
+	"ADX5 TX2",
+	"ADX5 TX3",
+	"ADX5 TX4",
+	"ADX6 TX1",
+	"ADX6 TX2",
+	"ADX6 TX3",
+	"ADX6 TX4",
+	"ASRC1 TX1",
+	"ASRC1 TX2",
+	"ASRC1 TX3",
+	"ASRC1 TX4",
+	"ASRC1 TX5",
+	"ASRC1 TX6",
+	"ADMAIF17",
+	"ADMAIF18",
+	"ADMAIF19",
+	"ADMAIF20",
+	"ADMAIF21",
+	"ADMAIF22",
+	"ADMAIF23",
+	"ADMAIF24",
+	"ADMAIF25",
+	"ADMAIF26",
+	"ADMAIF27",
+	"ADMAIF28",
+	"ADMAIF29",
+	"ADMAIF30",
+	"ADMAIF31",
+	"ADMAIF32",
+};
+
 static const unsigned int tegra210_ahub_mux_values[] = {
 	0,
 	/* ADMAIF */
@@ -558,6 +810,111 @@ static const unsigned int tegra186_ahub_mux_values[] = {
 	MUX_VALUE(2, 0),
 };
 
+static const unsigned int tegra264_ahub_mux_values[] = {
+	0,
+	/* ADMAIF */
+	MUX_VALUE(0, 0),
+	MUX_VALUE(0, 1),
+	MUX_VALUE(0, 2),
+	MUX_VALUE(0, 3),
+	MUX_VALUE(0, 4),
+	MUX_VALUE(0, 5),
+	MUX_VALUE(0, 6),
+	MUX_VALUE(0, 7),
+	MUX_VALUE(0, 8),
+	MUX_VALUE(0, 9),
+	MUX_VALUE(0, 10),
+	MUX_VALUE(0, 11),
+	MUX_VALUE(0, 12),
+	MUX_VALUE(0, 13),
+	MUX_VALUE(0, 14),
+	MUX_VALUE(0, 15),
+	/* I2S */
+	MUX_VALUE(0, 16),
+	MUX_VALUE(0, 17),
+	MUX_VALUE(0, 18),
+	MUX_VALUE(0, 19),
+	MUX_VALUE(0, 20),
+	MUX_VALUE(0, 21),
+	MUX_VALUE(0, 22),
+	MUX_VALUE(0, 23),
+	/* SFC */
+	MUX_VALUE(0, 24),
+	MUX_VALUE(0, 25),
+	MUX_VALUE(0, 26),
+	MUX_VALUE(0, 27),
+	/* MIXER */
+	MUX_VALUE(1, 0),
+	MUX_VALUE(1, 1),
+	MUX_VALUE(1, 2),
+	MUX_VALUE(1, 3),
+	MUX_VALUE(1, 4),
+	/* AMX */
+	MUX_VALUE(1, 8),
+	MUX_VALUE(1, 9),
+	MUX_VALUE(1, 10),
+	MUX_VALUE(1, 11),
+	MUX_VALUE(1, 12),
+	MUX_VALUE(1, 13),
+	/* OPE */
+	MUX_VALUE(2, 0),
+	/* MVC */
+	MUX_VALUE(2, 8),
+	MUX_VALUE(2, 9),
+	/* DMIC */
+	MUX_VALUE(2, 18),
+	MUX_VALUE(2, 19),
+	/* ADX */
+	MUX_VALUE(2, 24),
+	MUX_VALUE(2, 25),
+	MUX_VALUE(2, 26),
+	MUX_VALUE(2, 27),
+	MUX_VALUE(2, 28),
+	MUX_VALUE(2, 29),
+	MUX_VALUE(2, 30),
+	MUX_VALUE(2, 31),
+	MUX_VALUE(3, 0),
+	MUX_VALUE(3, 1),
+	MUX_VALUE(3, 2),
+	MUX_VALUE(3, 3),
+	MUX_VALUE(3, 4),
+	MUX_VALUE(3, 5),
+	MUX_VALUE(3, 6),
+	MUX_VALUE(3, 7),
+	MUX_VALUE(3, 8),
+	MUX_VALUE(3, 9),
+	MUX_VALUE(3, 10),
+	MUX_VALUE(3, 11),
+	MUX_VALUE(3, 12),
+	MUX_VALUE(3, 13),
+	MUX_VALUE(3, 14),
+	MUX_VALUE(3, 15),
+	/* ASRC */
+	MUX_VALUE(3, 24),
+	MUX_VALUE(3, 25),
+	MUX_VALUE(3, 26),
+	MUX_VALUE(3, 27),
+	MUX_VALUE(3, 28),
+	MUX_VALUE(3, 29),
+	/* ADMAIF */
+	MUX_VALUE(4, 7),
+	MUX_VALUE(4, 8),
+	MUX_VALUE(4, 9),
+	MUX_VALUE(4, 10),
+	MUX_VALUE(4, 11),
+	MUX_VALUE(4, 12),
+	MUX_VALUE(4, 13),
+	MUX_VALUE(4, 14),
+	MUX_VALUE(4, 15),
+	MUX_VALUE(4, 16),
+	MUX_VALUE(4, 17),
+	MUX_VALUE(4, 18),
+	MUX_VALUE(4, 19),
+	MUX_VALUE(4, 20),
+	MUX_VALUE(4, 21),
+	MUX_VALUE(4, 22),
+};
+
 /* Controls for t210 */
 MUX_ENUM_CTRL_DECL(t210_admaif1_tx, 0x00);
 MUX_ENUM_CTRL_DECL(t210_admaif2_tx, 0x01);
@@ -712,6 +1069,103 @@ MUX_ENUM_CTRL_DECL_234(t234_asrc15_tx, 0x68);
 MUX_ENUM_CTRL_DECL_234(t234_asrc16_tx, 0x69);
 MUX_ENUM_CTRL_DECL_234(t234_asrc17_tx, 0x6a);
 
+/* Controls for t264 */
+MUX_ENUM_CTRL_DECL_264(t264_admaif1_tx, 0x00);
+MUX_ENUM_CTRL_DECL_264(t264_admaif2_tx, 0x01);
+MUX_ENUM_CTRL_DECL_264(t264_admaif3_tx, 0x02);
+MUX_ENUM_CTRL_DECL_264(t264_admaif4_tx, 0x03);
+MUX_ENUM_CTRL_DECL_264(t264_admaif5_tx, 0x04);
+MUX_ENUM_CTRL_DECL_264(t264_admaif6_tx, 0x05);
+MUX_ENUM_CTRL_DECL_264(t264_admaif7_tx, 0x06);
+MUX_ENUM_CTRL_DECL_264(t264_admaif8_tx, 0x07);
+MUX_ENUM_CTRL_DECL_264(t264_admaif9_tx, 0x08);
+MUX_ENUM_CTRL_DECL_264(t264_admaif10_tx, 0x09);
+MUX_ENUM_CTRL_DECL_264(t264_admaif11_tx, 0x0a);
+MUX_ENUM_CTRL_DECL_264(t264_admaif12_tx, 0x0b);
+MUX_ENUM_CTRL_DECL_264(t264_admaif13_tx, 0x0c);
+MUX_ENUM_CTRL_DECL_264(t264_admaif14_tx, 0x0d);
+MUX_ENUM_CTRL_DECL_264(t264_admaif15_tx, 0x0e);
+MUX_ENUM_CTRL_DECL_264(t264_admaif16_tx, 0x0f);
+MUX_ENUM_CTRL_DECL_264(t264_i2s1_tx, 0x10);
+MUX_ENUM_CTRL_DECL_264(t264_i2s2_tx, 0x11);
+MUX_ENUM_CTRL_DECL_264(t264_i2s3_tx, 0x12);
+MUX_ENUM_CTRL_DECL_264(t264_i2s4_tx, 0x13);
+MUX_ENUM_CTRL_DECL_264(t264_i2s5_tx, 0x14);
+MUX_ENUM_CTRL_DECL_264(t264_i2s6_tx, 0x15);
+MUX_ENUM_CTRL_DECL_264(t264_i2s7_tx, 0x16);
+MUX_ENUM_CTRL_DECL_264(t264_i2s8_tx, 0x17);
+MUX_ENUM_CTRL_DECL_264(t264_sfc1_tx, 0x18);
+MUX_ENUM_CTRL_DECL_264(t264_sfc2_tx, 0x19);
+MUX_ENUM_CTRL_DECL_264(t264_sfc3_tx, 0x1a);
+MUX_ENUM_CTRL_DECL_264(t264_sfc4_tx, 0x1b);
+MUX_ENUM_CTRL_DECL_264(t264_mixer11_tx, 0x20);
+MUX_ENUM_CTRL_DECL_264(t264_mixer12_tx, 0x21);
+MUX_ENUM_CTRL_DECL_264(t264_mixer13_tx, 0x22);
+MUX_ENUM_CTRL_DECL_264(t264_mixer14_tx, 0x23);
+MUX_ENUM_CTRL_DECL_264(t264_mixer15_tx, 0x24);
+MUX_ENUM_CTRL_DECL_264(t264_mixer16_tx, 0x25);
+MUX_ENUM_CTRL_DECL_264(t264_mixer17_tx, 0x26);
+MUX_ENUM_CTRL_DECL_264(t264_mixer18_tx, 0x27);
+MUX_ENUM_CTRL_DECL_264(t264_mixer19_tx, 0x28);
+MUX_ENUM_CTRL_DECL_264(t264_mixer110_tx, 0x29);
+MUX_ENUM_CTRL_DECL_264(t264_dspk1_tx, 0x30);
+MUX_ENUM_CTRL_DECL_264(t264_ope1_tx, 0x40);
+MUX_ENUM_CTRL_DECL_264(t264_mvc1_tx, 0x44);
+MUX_ENUM_CTRL_DECL_264(t264_mvc2_tx, 0x45);
+MUX_ENUM_CTRL_DECL_264(t264_amx11_tx, 0x48);
+MUX_ENUM_CTRL_DECL_264(t264_amx12_tx, 0x49);
+MUX_ENUM_CTRL_DECL_264(t264_amx13_tx, 0x4a);
+MUX_ENUM_CTRL_DECL_264(t264_amx14_tx, 0x4b);
+MUX_ENUM_CTRL_DECL_264(t264_amx21_tx, 0x4c);
+MUX_ENUM_CTRL_DECL_264(t264_amx22_tx, 0x4d);
+MUX_ENUM_CTRL_DECL_264(t264_amx23_tx, 0x4e);
+MUX_ENUM_CTRL_DECL_264(t264_amx24_tx, 0x4f);
+MUX_ENUM_CTRL_DECL_264(t264_amx31_tx, 0x50);
+MUX_ENUM_CTRL_DECL_264(t264_amx32_tx, 0x51);
+MUX_ENUM_CTRL_DECL_264(t264_amx33_tx, 0x52);
+MUX_ENUM_CTRL_DECL_264(t264_amx34_tx, 0x53);
+MUX_ENUM_CTRL_DECL_264(t264_adx1_tx, 0x58);
+MUX_ENUM_CTRL_DECL_264(t264_adx2_tx, 0x59);
+MUX_ENUM_CTRL_DECL_264(t264_adx3_tx, 0x5a);
+MUX_ENUM_CTRL_DECL_264(t264_adx4_tx, 0x5b);
+MUX_ENUM_CTRL_DECL_264(t264_amx41_tx, 0x5c);
+MUX_ENUM_CTRL_DECL_264(t264_amx42_tx, 0x5d);
+MUX_ENUM_CTRL_DECL_264(t264_amx43_tx, 0x5e);
+MUX_ENUM_CTRL_DECL_264(t264_amx44_tx, 0x5f);
+MUX_ENUM_CTRL_DECL_264(t264_admaif17_tx, 0x60);
+MUX_ENUM_CTRL_DECL_264(t264_admaif18_tx, 0x61);
+MUX_ENUM_CTRL_DECL_264(t264_admaif19_tx, 0x62);
+MUX_ENUM_CTRL_DECL_264(t264_admaif20_tx, 0x63);
+MUX_ENUM_CTRL_DECL_264(t264_asrc11_tx, 0x64);
+MUX_ENUM_CTRL_DECL_264(t264_asrc12_tx, 0x65);
+MUX_ENUM_CTRL_DECL_264(t264_asrc13_tx, 0x66);
+MUX_ENUM_CTRL_DECL_264(t264_asrc14_tx, 0x67);
+MUX_ENUM_CTRL_DECL_264(t264_asrc15_tx, 0x68);
+MUX_ENUM_CTRL_DECL_264(t264_asrc16_tx, 0x69);
+MUX_ENUM_CTRL_DECL_264(t264_asrc17_tx, 0x6a);
+MUX_ENUM_CTRL_DECL_264(t264_admaif21_tx, 0x74);
+MUX_ENUM_CTRL_DECL_264(t264_admaif22_tx, 0x75);
+MUX_ENUM_CTRL_DECL_264(t264_admaif23_tx, 0x76);
+MUX_ENUM_CTRL_DECL_264(t264_admaif24_tx, 0x77);
+MUX_ENUM_CTRL_DECL_264(t264_admaif25_tx, 0x78);
+MUX_ENUM_CTRL_DECL_264(t264_admaif26_tx, 0x79);
+MUX_ENUM_CTRL_DECL_264(t264_admaif27_tx, 0x7a);
+MUX_ENUM_CTRL_DECL_264(t264_admaif28_tx, 0x7b);
+MUX_ENUM_CTRL_DECL_264(t264_admaif29_tx, 0x7c);
+MUX_ENUM_CTRL_DECL_264(t264_admaif30_tx, 0x7d);
+MUX_ENUM_CTRL_DECL_264(t264_admaif31_tx, 0x7e);
+MUX_ENUM_CTRL_DECL_264(t264_admaif32_tx, 0x7f);
+MUX_ENUM_CTRL_DECL_264(t264_amx51_tx, 0x80);
+MUX_ENUM_CTRL_DECL_264(t264_amx52_tx, 0x81);
+MUX_ENUM_CTRL_DECL_264(t264_amx53_tx, 0x82);
+MUX_ENUM_CTRL_DECL_264(t264_amx54_tx, 0x83);
+MUX_ENUM_CTRL_DECL_264(t264_amx61_tx, 0x84);
+MUX_ENUM_CTRL_DECL_264(t264_amx62_tx, 0x85);
+MUX_ENUM_CTRL_DECL_264(t264_amx63_tx, 0x86);
+MUX_ENUM_CTRL_DECL_264(t264_amx64_tx, 0x87);
+MUX_ENUM_CTRL_DECL_264(t264_adx5_tx, 0x88);
+MUX_ENUM_CTRL_DECL_264(t264_adx6_tx, 0x89);
+
 static const struct snd_soc_dapm_widget tegra210_ahub_widgets[] = {
 	WIDGETS("ADMAIF1", t210_admaif1_tx),
 	WIDGETS("ADMAIF2", t210_admaif2_tx),
@@ -996,6 +1450,147 @@ static const struct snd_soc_dapm_widget tegra234_ahub_widgets[] = {
 	WIDGETS("OPE1", t186_ope1_tx),
 };
 
+static const struct snd_soc_dapm_widget tegra264_ahub_widgets[] = {
+	WIDGETS("ADMAIF1", t264_admaif1_tx),
+	WIDGETS("ADMAIF2", t264_admaif2_tx),
+	WIDGETS("ADMAIF3", t264_admaif3_tx),
+	WIDGETS("ADMAIF4", t264_admaif4_tx),
+	WIDGETS("ADMAIF5", t264_admaif5_tx),
+	WIDGETS("ADMAIF6", t264_admaif6_tx),
+	WIDGETS("ADMAIF7", t264_admaif7_tx),
+	WIDGETS("ADMAIF8", t264_admaif8_tx),
+	WIDGETS("ADMAIF9", t264_admaif9_tx),
+	WIDGETS("ADMAIF10", t264_admaif10_tx),
+	WIDGETS("ADMAIF11", t264_admaif11_tx),
+	WIDGETS("ADMAIF12", t264_admaif12_tx),
+	WIDGETS("ADMAIF13", t264_admaif13_tx),
+	WIDGETS("ADMAIF14", t264_admaif14_tx),
+	WIDGETS("ADMAIF15", t264_admaif15_tx),
+	WIDGETS("ADMAIF16", t264_admaif16_tx),
+	WIDGETS("ADMAIF17", t264_admaif17_tx),
+	WIDGETS("ADMAIF18", t264_admaif18_tx),
+	WIDGETS("ADMAIF19", t264_admaif19_tx),
+	WIDGETS("ADMAIF20", t264_admaif20_tx),
+	WIDGETS("ADMAIF21", t264_admaif21_tx),
+	WIDGETS("ADMAIF22", t264_admaif22_tx),
+	WIDGETS("ADMAIF23", t264_admaif23_tx),
+	WIDGETS("ADMAIF24", t264_admaif24_tx),
+	WIDGETS("ADMAIF25", t264_admaif25_tx),
+	WIDGETS("ADMAIF26", t264_admaif26_tx),
+	WIDGETS("ADMAIF27", t264_admaif27_tx),
+	WIDGETS("ADMAIF28", t264_admaif28_tx),
+	WIDGETS("ADMAIF29", t264_admaif29_tx),
+	WIDGETS("ADMAIF30", t264_admaif30_tx),
+	WIDGETS("ADMAIF31", t264_admaif31_tx),
+	WIDGETS("ADMAIF32", t264_admaif32_tx),
+	WIDGETS("I2S1", t264_i2s1_tx),
+	WIDGETS("I2S2", t264_i2s2_tx),
+	WIDGETS("I2S3", t264_i2s3_tx),
+	WIDGETS("I2S4", t264_i2s4_tx),
+	WIDGETS("I2S5", t264_i2s5_tx),
+	WIDGETS("I2S6", t264_i2s6_tx),
+	WIDGETS("I2S7", t264_i2s7_tx),
+	WIDGETS("I2S8", t264_i2s8_tx),
+	TX_WIDGETS("DMIC1"),
+	TX_WIDGETS("DMIC2"),
+	WIDGETS("DSPK1", t264_dspk1_tx),
+	WIDGETS("SFC1", t264_sfc1_tx),
+	WIDGETS("SFC2", t264_sfc2_tx),
+	WIDGETS("SFC3", t264_sfc3_tx),
+	WIDGETS("SFC4", t264_sfc4_tx),
+	WIDGETS("MVC1", t264_mvc1_tx),
+	WIDGETS("MVC2", t264_mvc2_tx),
+	WIDGETS("AMX1 RX1", t264_amx11_tx),
+	WIDGETS("AMX1 RX2", t264_amx12_tx),
+	WIDGETS("AMX1 RX3", t264_amx13_tx),
+	WIDGETS("AMX1 RX4", t264_amx14_tx),
+	WIDGETS("AMX2 RX1", t264_amx21_tx),
+	WIDGETS("AMX2 RX2", t264_amx22_tx),
+	WIDGETS("AMX2 RX3", t264_amx23_tx),
+	WIDGETS("AMX2 RX4", t264_amx24_tx),
+	WIDGETS("AMX3 RX1", t264_amx31_tx),
+	WIDGETS("AMX3 RX2", t264_amx32_tx),
+	WIDGETS("AMX3 RX3", t264_amx33_tx),
+	WIDGETS("AMX3 RX4", t264_amx34_tx),
+	WIDGETS("AMX4 RX1", t264_amx41_tx),
+	WIDGETS("AMX4 RX2", t264_amx42_tx),
+	WIDGETS("AMX4 RX3", t264_amx43_tx),
+	WIDGETS("AMX4 RX4", t264_amx44_tx),
+	WIDGETS("AMX5 RX1", t264_amx51_tx),
+	WIDGETS("AMX5 RX2", t264_amx52_tx),
+	WIDGETS("AMX5 RX3", t264_amx53_tx),
+	WIDGETS("AMX5 RX4", t264_amx54_tx),
+	WIDGETS("AMX6 RX1", t264_amx61_tx),
+	WIDGETS("AMX6 RX2", t264_amx62_tx),
+	WIDGETS("AMX6 RX3", t264_amx63_tx),
+	WIDGETS("AMX6 RX4", t264_amx64_tx),
+	TX_WIDGETS("AMX1"),
+	TX_WIDGETS("AMX2"),
+	TX_WIDGETS("AMX3"),
+	TX_WIDGETS("AMX4"),
+	TX_WIDGETS("AMX5"),
+	TX_WIDGETS("AMX6"),
+	WIDGETS("ADX1", t264_adx1_tx),
+	WIDGETS("ADX2", t264_adx2_tx),
+	WIDGETS("ADX3", t264_adx3_tx),
+	WIDGETS("ADX4", t264_adx4_tx),
+	WIDGETS("ADX5", t264_adx5_tx),
+	WIDGETS("ADX6", t264_adx6_tx),
+	TX_WIDGETS("ADX1 TX1"),
+	TX_WIDGETS("ADX1 TX2"),
+	TX_WIDGETS("ADX1 TX3"),
+	TX_WIDGETS("ADX1 TX4"),
+	TX_WIDGETS("ADX2 TX1"),
+	TX_WIDGETS("ADX2 TX2"),
+	TX_WIDGETS("ADX2 TX3"),
+	TX_WIDGETS("ADX2 TX4"),
+	TX_WIDGETS("ADX3 TX1"),
+	TX_WIDGETS("ADX3 TX2"),
+	TX_WIDGETS("ADX3 TX3"),
+	TX_WIDGETS("ADX3 TX4"),
+	TX_WIDGETS("ADX4 TX1"),
+	TX_WIDGETS("ADX4 TX2"),
+	TX_WIDGETS("ADX4 TX3"),
+	TX_WIDGETS("ADX4 TX4"),
+	TX_WIDGETS("ADX5 TX1"),
+	TX_WIDGETS("ADX5 TX2"),
+	TX_WIDGETS("ADX5 TX3"),
+	TX_WIDGETS("ADX5 TX4"),
+	TX_WIDGETS("ADX6 TX1"),
+	TX_WIDGETS("ADX6 TX2"),
+	TX_WIDGETS("ADX6 TX3"),
+	TX_WIDGETS("ADX6 TX4"),
+	WIDGETS("MIXER1 RX1", t264_mixer11_tx),
+	WIDGETS("MIXER1 RX2", t264_mixer12_tx),
+	WIDGETS("MIXER1 RX3", t264_mixer13_tx),
+	WIDGETS("MIXER1 RX4", t264_mixer14_tx),
+	WIDGETS("MIXER1 RX5", t264_mixer15_tx),
+	WIDGETS("MIXER1 RX6", t264_mixer16_tx),
+	WIDGETS("MIXER1 RX7", t264_mixer17_tx),
+	WIDGETS("MIXER1 RX8", t264_mixer18_tx),
+	WIDGETS("MIXER1 RX9", t264_mixer19_tx),
+	WIDGETS("MIXER1 RX10", t264_mixer110_tx),
+	TX_WIDGETS("MIXER1 TX1"),
+	TX_WIDGETS("MIXER1 TX2"),
+	TX_WIDGETS("MIXER1 TX3"),
+	TX_WIDGETS("MIXER1 TX4"),
+	TX_WIDGETS("MIXER1 TX5"),
+	WIDGETS("ASRC1 RX1", t264_asrc11_tx),
+	WIDGETS("ASRC1 RX2", t264_asrc12_tx),
+	WIDGETS("ASRC1 RX3", t264_asrc13_tx),
+	WIDGETS("ASRC1 RX4", t264_asrc14_tx),
+	WIDGETS("ASRC1 RX5", t264_asrc15_tx),
+	WIDGETS("ASRC1 RX6", t264_asrc16_tx),
+	WIDGETS("ASRC1 RX7", t264_asrc17_tx),
+	TX_WIDGETS("ASRC1 TX1"),
+	TX_WIDGETS("ASRC1 TX2"),
+	TX_WIDGETS("ASRC1 TX3"),
+	TX_WIDGETS("ASRC1 TX4"),
+	TX_WIDGETS("ASRC1 TX5"),
+	TX_WIDGETS("ASRC1 TX6"),
+	WIDGETS("OPE1", t264_ope1_tx),
+};
+
 #define TEGRA_COMMON_MUX_ROUTES(name)					\
 	{ name " XBAR-TX",	 NULL,		name " Mux" },		\
 	{ name " Mux",		"ADMAIF1",	"ADMAIF1 XBAR-RX" },	\
@@ -1015,7 +1610,6 @@ static const struct snd_soc_dapm_widget tegra234_ahub_widgets[] = {
 	{ name " Mux",		"I2S5",		"I2S5 XBAR-RX" },	\
 	{ name " Mux",		"DMIC1",	"DMIC1 XBAR-RX" },	\
 	{ name " Mux",		"DMIC2",	"DMIC2 XBAR-RX" },	\
-	{ name " Mux",		"DMIC3",	"DMIC3 XBAR-RX" },	\
 	{ name " Mux",		"SFC1",		"SFC1 XBAR-RX" },	\
 	{ name " Mux",		"SFC2",		"SFC2 XBAR-RX" },	\
 	{ name " Mux",		"SFC3",		"SFC3 XBAR-RX" },	\
@@ -1040,6 +1634,7 @@ static const struct snd_soc_dapm_widget tegra234_ahub_widgets[] = {
 	{ name " Mux",		"OPE1",		"OPE1 XBAR-RX" },
 
 #define TEGRA210_ONLY_MUX_ROUTES(name)					\
+	{ name " Mux",		"DMIC3",	"DMIC3 XBAR-RX" },	\
 	{ name " Mux",          "OPE2",         "OPE2 XBAR-RX" },
 
 #define TEGRA186_ONLY_MUX_ROUTES(name)					\
@@ -1054,6 +1649,7 @@ static const struct snd_soc_dapm_widget tegra234_ahub_widgets[] = {
 	{ name " Mux",		"ADMAIF19",	"ADMAIF19 XBAR-RX" },	\
 	{ name " Mux",		"ADMAIF20",	"ADMAIF20 XBAR-RX" },	\
 	{ name " Mux",		"I2S6",		"I2S6 XBAR-RX" },	\
+	{ name " Mux",		"DMIC3",	"DMIC3 XBAR-RX" },	\
 	{ name " Mux",		"DMIC4",	"DMIC4 XBAR-RX" },	\
 	{ name " Mux",		"AMX3",		"AMX3 XBAR-RX" },	\
 	{ name " Mux",		"AMX4",		"AMX4 XBAR-RX" },	\
@@ -1072,6 +1668,59 @@ static const struct snd_soc_dapm_widget tegra234_ahub_widgets[] = {
 	{ name " Mux",		"ASRC1 TX5",	"ASRC1 TX5 XBAR-RX" },	\
 	{ name " Mux",		"ASRC1 TX6",	"ASRC1 TX6 XBAR-RX" },
 
+#define TEGRA264_ONLY_MUX_ROUTES(name)					\
+	{ name " Mux",		"ADMAIF11",	"ADMAIF11 XBAR-RX" },	\
+	{ name " Mux",		"ADMAIF12",	"ADMAIF12 XBAR-RX" },	\
+	{ name " Mux",		"ADMAIF13",	"ADMAIF13 XBAR-RX" },	\
+	{ name " Mux",		"ADMAIF14",	"ADMAIF14 XBAR-RX" },	\
+	{ name " Mux",		"ADMAIF15",	"ADMAIF15 XBAR-RX" },	\
+	{ name " Mux",		"ADMAIF16",	"ADMAIF16 XBAR-RX" },	\
+	{ name " Mux",		"ADMAIF17",	"ADMAIF17 XBAR-RX" },	\
+	{ name " Mux",		"ADMAIF18",	"ADMAIF18 XBAR-RX" },	\
+	{ name " Mux",		"ADMAIF19",	"ADMAIF19 XBAR-RX" },	\
+	{ name " Mux",		"ADMAIF20",	"ADMAIF20 XBAR-RX" },	\
+	{ name " Mux",		"ADMAIF21",	"ADMAIF21 XBAR-RX" },	\
+	{ name " Mux",		"ADMAIF22",	"ADMAIF22 XBAR-RX" },	\
+	{ name " Mux",		"ADMAIF23",	"ADMAIF23 XBAR-RX" },	\
+	{ name " Mux",		"ADMAIF24",	"ADMAIF24 XBAR-RX" },	\
+	{ name " Mux",		"ADMAIF25",	"ADMAIF25 XBAR-RX" },	\
+	{ name " Mux",		"ADMAIF26",	"ADMAIF26 XBAR-RX" },	\
+	{ name " Mux",		"ADMAIF27",	"ADMAIF27 XBAR-RX" },	\
+	{ name " Mux",		"ADMAIF28",	"ADMAIF28 XBAR-RX" },	\
+	{ name " Mux",		"ADMAIF29",	"ADMAIF29 XBAR-RX" },	\
+	{ name " Mux",		"ADMAIF30",	"ADMAIF30 XBAR-RX" },	\
+	{ name " Mux",		"ADMAIF31",	"ADMAIF31 XBAR-RX" },	\
+	{ name " Mux",		"ADMAIF32",	"ADMAIF32 XBAR-RX" },	\
+	{ name " Mux",		"I2S6",		"I2S6 XBAR-RX" },	\
+	{ name " Mux",		"I2S7",		"I2S7 XBAR-RX" },	\
+	{ name " Mux",		"I2S8",		"I2S8 XBAR-RX" },	\
+	{ name " Mux",		"AMX3",		"AMX3 XBAR-RX" },	\
+	{ name " Mux",		"AMX4",		"AMX4 XBAR-RX" },	\
+	{ name " Mux",		"AMX5",		"AMX5 XBAR-RX" },	\
+	{ name " Mux",		"AMX6",		"AMX6 XBAR-RX" },	\
+	{ name " Mux",		"ADX3 TX1",	"ADX3 TX1 XBAR-RX" },	\
+	{ name " Mux",		"ADX3 TX2",	"ADX3 TX2 XBAR-RX" },	\
+	{ name " Mux",		"ADX3 TX3",	"ADX3 TX3 XBAR-RX" },	\
+	{ name " Mux",		"ADX3 TX4",	"ADX3 TX4 XBAR-RX" },	\
+	{ name " Mux",		"ADX4 TX1",	"ADX4 TX1 XBAR-RX" },	\
+	{ name " Mux",		"ADX4 TX2",	"ADX4 TX2 XBAR-RX" },	\
+	{ name " Mux",		"ADX4 TX3",	"ADX4 TX3 XBAR-RX" },	\
+	{ name " Mux",		"ADX4 TX4",	"ADX4 TX4 XBAR-RX" },	\
+	{ name " Mux",		"ADX5 TX1",	"ADX5 TX1 XBAR-RX" },	\
+	{ name " Mux",		"ADX5 TX2",	"ADX5 TX2 XBAR-RX" },	\
+	{ name " Mux",		"ADX5 TX3",	"ADX5 TX3 XBAR-RX" },	\
+	{ name " Mux",		"ADX5 TX4",	"ADX5 TX4 XBAR-RX" },	\
+	{ name " Mux",		"ADX6 TX1",	"ADX6 TX1 XBAR-RX" },	\
+	{ name " Mux",		"ADX6 TX2",	"ADX6 TX2 XBAR-RX" },	\
+	{ name " Mux",		"ADX6 TX3",	"ADX6 TX3 XBAR-RX" },	\
+	{ name " Mux",		"ADX6 TX4",	"ADX6 TX4 XBAR-RX" },	\
+	{ name " Mux",		"ASRC1 TX1",	"ASRC1 TX1 XBAR-RX" },	\
+	{ name " Mux",		"ASRC1 TX2",	"ASRC1 TX2 XBAR-RX" },	\
+	{ name " Mux",		"ASRC1 TX3",	"ASRC1 TX3 XBAR-RX" },	\
+	{ name " Mux",		"ASRC1 TX4",	"ASRC1 TX4 XBAR-RX" },	\
+	{ name " Mux",		"ASRC1 TX5",	"ASRC1 TX5 XBAR-RX" },	\
+	{ name " Mux",		"ASRC1 TX6",	"ASRC1 TX6 XBAR-RX" },
+
 #define TEGRA210_MUX_ROUTES(name)					\
 	TEGRA_COMMON_MUX_ROUTES(name)					\
 	TEGRA210_ONLY_MUX_ROUTES(name)
@@ -1080,6 +1729,10 @@ static const struct snd_soc_dapm_widget tegra234_ahub_widgets[] = {
 	TEGRA_COMMON_MUX_ROUTES(name)					\
 	TEGRA186_ONLY_MUX_ROUTES(name)
 
+#define TEGRA264_MUX_ROUTES(name)					\
+	TEGRA_COMMON_MUX_ROUTES(name)					\
+	TEGRA264_ONLY_MUX_ROUTES(name)
+
 /* Connect FEs with XBAR */
 #define TEGRA_FE_ROUTES(name) \
 	{ name " XBAR-Playback",	NULL,	name " Playback" },	\
@@ -1238,6 +1891,136 @@ static const struct snd_soc_dapm_route tegra186_ahub_routes[] = {
 	TEGRA186_MUX_ROUTES("OPE1")
 };
 
+static const struct snd_soc_dapm_route tegra264_ahub_routes[] = {
+	TEGRA_FE_ROUTES("ADMAIF1")
+	TEGRA_FE_ROUTES("ADMAIF2")
+	TEGRA_FE_ROUTES("ADMAIF3")
+	TEGRA_FE_ROUTES("ADMAIF4")
+	TEGRA_FE_ROUTES("ADMAIF5")
+	TEGRA_FE_ROUTES("ADMAIF6")
+	TEGRA_FE_ROUTES("ADMAIF7")
+	TEGRA_FE_ROUTES("ADMAIF8")
+	TEGRA_FE_ROUTES("ADMAIF9")
+	TEGRA_FE_ROUTES("ADMAIF10")
+	TEGRA_FE_ROUTES("ADMAIF11")
+	TEGRA_FE_ROUTES("ADMAIF12")
+	TEGRA_FE_ROUTES("ADMAIF13")
+	TEGRA_FE_ROUTES("ADMAIF14")
+	TEGRA_FE_ROUTES("ADMAIF15")
+	TEGRA_FE_ROUTES("ADMAIF16")
+	TEGRA_FE_ROUTES("ADMAIF17")
+	TEGRA_FE_ROUTES("ADMAIF18")
+	TEGRA_FE_ROUTES("ADMAIF19")
+	TEGRA_FE_ROUTES("ADMAIF20")
+	TEGRA_FE_ROUTES("ADMAIF21")
+	TEGRA_FE_ROUTES("ADMAIF22")
+	TEGRA_FE_ROUTES("ADMAIF23")
+	TEGRA_FE_ROUTES("ADMAIF24")
+	TEGRA_FE_ROUTES("ADMAIF25")
+	TEGRA_FE_ROUTES("ADMAIF26")
+	TEGRA_FE_ROUTES("ADMAIF27")
+	TEGRA_FE_ROUTES("ADMAIF28")
+	TEGRA_FE_ROUTES("ADMAIF29")
+	TEGRA_FE_ROUTES("ADMAIF30")
+	TEGRA_FE_ROUTES("ADMAIF31")
+	TEGRA_FE_ROUTES("ADMAIF32")
+	TEGRA264_MUX_ROUTES("ADMAIF1")
+	TEGRA264_MUX_ROUTES("ADMAIF2")
+	TEGRA264_MUX_ROUTES("ADMAIF3")
+	TEGRA264_MUX_ROUTES("ADMAIF4")
+	TEGRA264_MUX_ROUTES("ADMAIF5")
+	TEGRA264_MUX_ROUTES("ADMAIF6")
+	TEGRA264_MUX_ROUTES("ADMAIF7")
+	TEGRA264_MUX_ROUTES("ADMAIF8")
+	TEGRA264_MUX_ROUTES("ADMAIF9")
+	TEGRA264_MUX_ROUTES("ADMAIF10")
+	TEGRA264_MUX_ROUTES("ADMAIF11")
+	TEGRA264_MUX_ROUTES("ADMAIF12")
+	TEGRA264_MUX_ROUTES("ADMAIF13")
+	TEGRA264_MUX_ROUTES("ADMAIF14")
+	TEGRA264_MUX_ROUTES("ADMAIF15")
+	TEGRA264_MUX_ROUTES("ADMAIF16")
+	TEGRA264_MUX_ROUTES("ADMAIF17")
+	TEGRA264_MUX_ROUTES("ADMAIF18")
+	TEGRA264_MUX_ROUTES("ADMAIF19")
+	TEGRA264_MUX_ROUTES("ADMAIF20")
+	TEGRA264_MUX_ROUTES("ADMAIF21")
+	TEGRA264_MUX_ROUTES("ADMAIF22")
+	TEGRA264_MUX_ROUTES("ADMAIF23")
+	TEGRA264_MUX_ROUTES("ADMAIF24")
+	TEGRA264_MUX_ROUTES("ADMAIF25")
+	TEGRA264_MUX_ROUTES("ADMAIF26")
+	TEGRA264_MUX_ROUTES("ADMAIF27")
+	TEGRA264_MUX_ROUTES("ADMAIF28")
+	TEGRA264_MUX_ROUTES("ADMAIF29")
+	TEGRA264_MUX_ROUTES("ADMAIF30")
+	TEGRA264_MUX_ROUTES("ADMAIF31")
+	TEGRA264_MUX_ROUTES("ADMAIF32")
+	TEGRA264_MUX_ROUTES("I2S1")
+	TEGRA264_MUX_ROUTES("I2S2")
+	TEGRA264_MUX_ROUTES("I2S3")
+	TEGRA264_MUX_ROUTES("I2S4")
+	TEGRA264_MUX_ROUTES("I2S5")
+	TEGRA264_MUX_ROUTES("I2S6")
+	TEGRA264_MUX_ROUTES("I2S7")
+	TEGRA264_MUX_ROUTES("I2S8")
+	TEGRA264_MUX_ROUTES("DSPK1")
+	TEGRA264_MUX_ROUTES("SFC1")
+	TEGRA264_MUX_ROUTES("SFC2")
+	TEGRA264_MUX_ROUTES("SFC3")
+	TEGRA264_MUX_ROUTES("SFC4")
+	TEGRA264_MUX_ROUTES("MVC1")
+	TEGRA264_MUX_ROUTES("MVC2")
+	TEGRA264_MUX_ROUTES("AMX1 RX1")
+	TEGRA264_MUX_ROUTES("AMX1 RX2")
+	TEGRA264_MUX_ROUTES("AMX1 RX3")
+	TEGRA264_MUX_ROUTES("AMX1 RX4")
+	TEGRA264_MUX_ROUTES("AMX2 RX1")
+	TEGRA264_MUX_ROUTES("AMX2 RX2")
+	TEGRA264_MUX_ROUTES("AMX2 RX3")
+	TEGRA264_MUX_ROUTES("AMX2 RX4")
+	TEGRA264_MUX_ROUTES("AMX3 RX1")
+	TEGRA264_MUX_ROUTES("AMX3 RX2")
+	TEGRA264_MUX_ROUTES("AMX3 RX3")
+	TEGRA264_MUX_ROUTES("AMX3 RX4")
+	TEGRA264_MUX_ROUTES("AMX4 RX1")
+	TEGRA264_MUX_ROUTES("AMX4 RX2")
+	TEGRA264_MUX_ROUTES("AMX4 RX3")
+	TEGRA264_MUX_ROUTES("AMX4 RX4")
+	TEGRA264_MUX_ROUTES("AMX5 RX1")
+	TEGRA264_MUX_ROUTES("AMX5 RX2")
+	TEGRA264_MUX_ROUTES("AMX5 RX3")
+	TEGRA264_MUX_ROUTES("AMX5 RX4")
+	TEGRA264_MUX_ROUTES("AMX6 RX1")
+	TEGRA264_MUX_ROUTES("AMX6 RX2")
+	TEGRA264_MUX_ROUTES("AMX6 RX3")
+	TEGRA264_MUX_ROUTES("AMX6 RX4")
+	TEGRA264_MUX_ROUTES("ADX1")
+	TEGRA264_MUX_ROUTES("ADX2")
+	TEGRA264_MUX_ROUTES("ADX3")
+	TEGRA264_MUX_ROUTES("ADX4")
+	TEGRA264_MUX_ROUTES("ADX5")
+	TEGRA264_MUX_ROUTES("ADX6")
+	TEGRA264_MUX_ROUTES("MIXER1 RX1")
+	TEGRA264_MUX_ROUTES("MIXER1 RX2")
+	TEGRA264_MUX_ROUTES("MIXER1 RX3")
+	TEGRA264_MUX_ROUTES("MIXER1 RX4")
+	TEGRA264_MUX_ROUTES("MIXER1 RX5")
+	TEGRA264_MUX_ROUTES("MIXER1 RX6")
+	TEGRA264_MUX_ROUTES("MIXER1 RX7")
+	TEGRA264_MUX_ROUTES("MIXER1 RX8")
+	TEGRA264_MUX_ROUTES("MIXER1 RX9")
+	TEGRA264_MUX_ROUTES("MIXER1 RX10")
+	TEGRA264_MUX_ROUTES("ASRC1 RX1")
+	TEGRA264_MUX_ROUTES("ASRC1 RX2")
+	TEGRA264_MUX_ROUTES("ASRC1 RX3")
+	TEGRA264_MUX_ROUTES("ASRC1 RX4")
+	TEGRA264_MUX_ROUTES("ASRC1 RX5")
+	TEGRA264_MUX_ROUTES("ASRC1 RX6")
+	TEGRA264_MUX_ROUTES("ASRC1 RX7")
+	TEGRA264_MUX_ROUTES("OPE1")
+};
+
 static const struct snd_soc_component_driver tegra210_ahub_component = {
 	.dapm_widgets		= tegra210_ahub_widgets,
 	.num_dapm_widgets	= ARRAY_SIZE(tegra210_ahub_widgets),
@@ -1259,6 +2042,36 @@ static const struct snd_soc_component_driver tegra234_ahub_component = {
 	.num_dapm_routes	= ARRAY_SIZE(tegra186_ahub_routes),
 };
 
+static const struct snd_soc_component_driver tegra264_ahub_component = {
+	.dapm_widgets		= tegra264_ahub_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(tegra264_ahub_widgets),
+	.dapm_routes		= tegra264_ahub_routes,
+	.num_dapm_routes	= ARRAY_SIZE(tegra264_ahub_routes),
+};
+
+static bool tegra264_ahub_wr_reg(struct device *dev, unsigned int reg)
+{
+	int part;
+
+	for (part = 0; part < TEGRA264_XBAR_UPDATE_MAX_REG; part++) {
+		switch (reg & ~(part << 12)) {
+		case TEGRA264_AXBAR_ADMAIF_RX1 ... TEGRA264_AXBAR_SFC4_RX1:
+		case TEGRA264_AXBAR_MIXER1_RX1 ... TEGRA264_AXBAR_MIXER1_RX10:
+		case TEGRA264_AXBAR_DSPK1_RX1:
+		case TEGRA264_AXBAR_OPE1_RX1:
+		case TEGRA264_AXBAR_MVC1_RX1 ... TEGRA264_AXBAR_MVC2_RX1:
+		case TEGRA264_AXBAR_AMX1_RX1 ... TEGRA264_AXBAR_AMX3_RX4:
+		case TEGRA264_AXBAR_ADX1_RX1 ... TEGRA264_AXBAR_ASRC1_RX7:
+		case TEGRA264_AXBAR_ADMAIF_RX21 ... TEGRA264_AXBAR_ADX6_RX1:
+			return true;
+		default:
+			break;
+		};
+	}
+
+	return false;
+}
+
 static const struct regmap_config tegra210_ahub_regmap_config = {
 	.reg_bits		= 32,
 	.val_bits		= 32,
@@ -1275,6 +2088,15 @@ static const struct regmap_config tegra186_ahub_regmap_config = {
 	.cache_type		= REGCACHE_FLAT,
 };
 
+static const struct regmap_config tegra264_ahub_regmap_config = {
+	.reg_bits		= 32,
+	.val_bits		= 32,
+	.reg_stride		= 4,
+	.writeable_reg		= tegra264_ahub_wr_reg,
+	.max_register		= TEGRA264_MAX_REGISTER_ADDR,
+	.cache_type		= REGCACHE_FLAT,
+};
+
 static const struct tegra_ahub_soc_data soc_data_tegra210 = {
 	.cmpnt_drv	= &tegra210_ahub_component,
 	.dai_drv	= tegra210_ahub_dais,
@@ -1285,6 +2107,7 @@ static const struct tegra_ahub_soc_data soc_data_tegra210 = {
 	.mask[2]	= TEGRA210_XBAR_REG_MASK_2,
 	.mask[3]	= TEGRA210_XBAR_REG_MASK_3,
 	.reg_count	= TEGRA210_XBAR_UPDATE_MAX_REG,
+	.xbar_part_size	= TEGRA210_XBAR_PART1_RX,
 };
 
 static const struct tegra_ahub_soc_data soc_data_tegra186 = {
@@ -1297,6 +2120,7 @@ static const struct tegra_ahub_soc_data soc_data_tegra186 = {
 	.mask[2]	= TEGRA186_XBAR_REG_MASK_2,
 	.mask[3]	= TEGRA186_XBAR_REG_MASK_3,
 	.reg_count	= TEGRA186_XBAR_UPDATE_MAX_REG,
+	.xbar_part_size	= TEGRA210_XBAR_PART1_RX,
 };
 
 static const struct tegra_ahub_soc_data soc_data_tegra234 = {
@@ -1309,12 +2133,28 @@ static const struct tegra_ahub_soc_data soc_data_tegra234 = {
 	.mask[2]	= TEGRA186_XBAR_REG_MASK_2,
 	.mask[3]	= TEGRA186_XBAR_REG_MASK_3,
 	.reg_count	= TEGRA186_XBAR_UPDATE_MAX_REG,
+	.xbar_part_size	= TEGRA210_XBAR_PART1_RX,
+};
+
+static const struct tegra_ahub_soc_data soc_data_tegra264 = {
+	.cmpnt_drv	= &tegra264_ahub_component,
+	.dai_drv	= tegra264_ahub_dais,
+	.num_dais	= ARRAY_SIZE(tegra264_ahub_dais),
+	.regmap_config	= &tegra264_ahub_regmap_config,
+	.mask[0]	= TEGRA264_XBAR_REG_MASK_0,
+	.mask[1]	= TEGRA264_XBAR_REG_MASK_1,
+	.mask[2]	= TEGRA264_XBAR_REG_MASK_2,
+	.mask[3]	= TEGRA264_XBAR_REG_MASK_3,
+	.mask[4]	= TEGRA264_XBAR_REG_MASK_4,
+	.reg_count	= TEGRA264_XBAR_UPDATE_MAX_REG,
+	.xbar_part_size	= TEGRA264_XBAR_PART1_RX,
 };
 
 static const struct of_device_id tegra_ahub_of_match[] = {
 	{ .compatible = "nvidia,tegra210-ahub", .data = &soc_data_tegra210 },
 	{ .compatible = "nvidia,tegra186-ahub", .data = &soc_data_tegra186 },
 	{ .compatible = "nvidia,tegra234-ahub", .data = &soc_data_tegra234 },
+	{ .compatible = "nvidia,tegra264-ahub", .data = &soc_data_tegra264 },
 	{},
 };
 MODULE_DEVICE_TABLE(of, tegra_ahub_of_match);
diff --git a/sound/soc/tegra/tegra210_ahub.h b/sound/soc/tegra/tegra210_ahub.h
index 2728db4d24f2..f355b2cfd19b 100644
--- a/sound/soc/tegra/tegra210_ahub.h
+++ b/sound/soc/tegra/tegra210_ahub.h
@@ -2,7 +2,7 @@
 /*
  * tegra210_ahub.h - TEGRA210 AHUB
  *
- * Copyright (c) 2020-2022, NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (c) 2020-2025, NVIDIA CORPORATION.  All rights reserved.
  *
  */
 
@@ -28,7 +28,39 @@
 #define TEGRA186_XBAR_REG_MASK_3			0x3f0f00ff
 #define TEGRA186_XBAR_UPDATE_MAX_REG			4
 
-#define TEGRA_XBAR_UPDATE_MAX_REG (TEGRA186_XBAR_UPDATE_MAX_REG)
+/* Tegra264 specific */
+#define TEGRA264_XBAR_PART1_RX				0x1000
+#define TEGRA264_XBAR_PART2_RX				0x2000
+#define TEGRA264_XBAR_PART3_RX				0x3000
+#define TEGRA264_XBAR_PART4_RX				0x4000
+#define TEGRA264_XBAR_PART0_ADX6_RX1			0x224
+#define TEGRA264_XBAR_AUDIO_RX_COUNT			((TEGRA264_XBAR_PART0_ADX6_RX1 / 4) + 1)
+#define TEGRA264_XBAR_REG_MASK_0			0xfffffff
+#define TEGRA264_XBAR_REG_MASK_1			0x3f013f1f
+#define TEGRA264_XBAR_REG_MASK_2			0xff3c0301
+#define TEGRA264_XBAR_REG_MASK_3			0x3f00ffff
+#define TEGRA264_XBAR_REG_MASK_4			0x7fff9f
+#define TEGRA264_XBAR_UPDATE_MAX_REG			5
+
+#define TEGRA264_AXBAR_ADMAIF_RX1			0x0
+#define TEGRA264_AXBAR_SFC4_RX1				0x6c
+#define TEGRA264_AXBAR_MIXER1_RX1			0x80
+#define TEGRA264_AXBAR_MIXER1_RX10			0xa4
+#define TEGRA264_AXBAR_DSPK1_RX1			0xc0
+#define TEGRA264_AXBAR_OPE1_RX1				0x100
+#define TEGRA264_AXBAR_MVC1_RX1				0x110
+#define TEGRA264_AXBAR_MVC2_RX1				0x114
+#define TEGRA264_AXBAR_AMX1_RX1				0x120
+#define TEGRA264_AXBAR_AMX3_RX4				0x14c
+#define TEGRA264_AXBAR_ADX1_RX1				0x160
+#define TEGRA264_AXBAR_ASRC1_RX7			0x1a8
+#define TEGRA264_AXBAR_ADMAIF_RX21			0x1d0
+#define TEGRA264_AXBAR_ADX6_RX1				0x224
+
+#define TEGRA_XBAR_UPDATE_MAX_REG (TEGRA264_XBAR_UPDATE_MAX_REG)
+
+#define TEGRA264_MAX_REGISTER_ADDR (TEGRA264_XBAR_PART4_RX +		\
+	(TEGRA210_XBAR_RX_STRIDE * (TEGRA264_XBAR_AUDIO_RX_COUNT - 1)))
 
 #define TEGRA186_MAX_REGISTER_ADDR (TEGRA186_XBAR_PART3_RX +		\
 	(TEGRA210_XBAR_RX_STRIDE * (TEGRA186_XBAR_AUDIO_RX_COUNT - 1)))
@@ -76,6 +108,15 @@
 
 #define MUX_ENUM_CTRL_DECL_234(ename, id) MUX_ENUM_CTRL_DECL_186(ename, id)
 
+#define MUX_ENUM_CTRL_DECL_264(ename, id)				\
+	SOC_VALUE_ENUM_WIDE_DECL(ename##_enum, MUX_REG(id), 0,		\
+				 tegra264_ahub_mux_texts,		\
+				 tegra264_ahub_mux_values);		\
+	static const struct snd_kcontrol_new ename##_control =		\
+		SOC_DAPM_ENUM_EXT("Route", ename##_enum,		\
+				  tegra_ahub_get_value_enum,		\
+				  tegra_ahub_put_value_enum)
+
 #define WIDGETS(sname, ename)						     \
 	SND_SOC_DAPM_AIF_IN(sname " XBAR-RX", NULL, 0, SND_SOC_NOPM, 0, 0),  \
 	SND_SOC_DAPM_AIF_OUT(sname " XBAR-TX", NULL, 0, SND_SOC_NOPM, 0, 0), \
@@ -92,7 +133,7 @@
 		.playback = {						\
 			.stream_name = #sname " XBAR-Playback",		\
 			.channels_min = 1,				\
-			.channels_max = 16,				\
+			.channels_max = 32,				\
 			.rates = SNDRV_PCM_RATE_8000_192000,		\
 			.formats = SNDRV_PCM_FMTBIT_S8 |		\
 				SNDRV_PCM_FMTBIT_S16_LE |		\
@@ -102,7 +143,7 @@
 		.capture = {						\
 			.stream_name = #sname " XBAR-Capture",		\
 			.channels_min = 1,				\
-			.channels_max = 16,				\
+			.channels_max = 32,				\
 			.rates = SNDRV_PCM_RATE_8000_192000,		\
 			.formats = SNDRV_PCM_FMTBIT_S8 |		\
 				SNDRV_PCM_FMTBIT_S16_LE |		\
@@ -115,9 +156,10 @@ struct tegra_ahub_soc_data {
 	const struct regmap_config *regmap_config;
 	const struct snd_soc_component_driver *cmpnt_drv;
 	struct snd_soc_dai_driver *dai_drv;
-	unsigned int mask[4];
+	unsigned int mask[TEGRA_XBAR_UPDATE_MAX_REG];
 	unsigned int reg_count;
 	unsigned int num_dais;
+	unsigned int xbar_part_size;
 };
 
 struct tegra_ahub {
-- 
2.17.1



Return-Path: <linux-tegra+bounces-2325-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B37BD8C9CA2
	for <lists+linux-tegra@lfdr.de>; Mon, 20 May 2024 13:50:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0F348B21BAE
	for <lists+linux-tegra@lfdr.de>; Mon, 20 May 2024 11:50:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 159EA54735;
	Mon, 20 May 2024 11:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="loSkRGXm"
X-Original-To: linux-tegra@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2085.outbound.protection.outlook.com [40.107.237.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51CEF53E07;
	Mon, 20 May 2024 11:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716205795; cv=fail; b=ianZgo8uYRnf8C8djTCgvXp/Pa6uo9tvw3dOUdC1thoD/wdEUA2m79Mk3sGiC8UCDEF4MDfbgMuUjWrzCw+7Mj6jnvrKMdVSChRygHhcZ8XtOPsdDxtuo/TVPLfeu3DcOw5t5TFCnWV7IP82bzZ5BQtc+IQrkOtfV82x7E9zDB4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716205795; c=relaxed/simple;
	bh=a0REPNbuIHSoWHoQfsgWgJbtychCnXXW6GLy4PNwQok=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D/twL7LmzUdvidXVYQAIRDdw7N5YWq4T3tjO0RtMYKr0h4kU4ufXGGc5irtAbiBigcooGJNXrurH4Jie5Sqm/rX0uDN7lHQEfHlSz3hBgvRgspW7tP9O9kXfptUCwFhofJvbpkD8MHdycqB8hZtset55w7woUpWIkhsCMrwjqzY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=loSkRGXm; arc=fail smtp.client-ip=40.107.237.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UuHGHvwaP6rkXTIK1U2+Nlg6SsWlkqpAykDHgvhUM5VXlhVOmd5/C0XIoB2wRjKcerQvjam4LxejvQOzlbHHhEGa2pq+QZQtSJ+1cIm1I7hdeCXo8+jlZefPduvCRQP7UXLmGe9ahnMESdmuTxLE1PN0CISdoxjTRzEIKuGyHUtjSIZQ2k0Cill5C6MC09AIaT7VJKevsJmnDpAccpsmMwC7U8nLsz5Y1bDvLB8xMDfFnba4swy3hA0dR7OdpDb7zoDox2hO8HfGgykltW6o4xjiwhri9oQOTgMwnW+u0hSRJQzBU7GDAXsNHp3swuFpiqdYgjVvZbV7cegUHyjOqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bl/ZA2+WnCpyMbxp7vZHNbPEAEvoiRjkFL+KokRs0Oo=;
 b=F9f7hpsXxK9qiNP1lKB3WJQ+uclPwuAN8XGG20yivfHAsc+3oA4gvN1jLj6mG1DWc0FRn3/eMgT26i12GkLNCmJnMiXhbhA/eXvf8cCxlucPz86BXp9aqUlfjx6GcAXjfIYizppD9cKpeZw5TDRyQJ8/Cw79CpTVUSkuDAZyPSI1OU2yOGbU0MuCYDnmjUYDGS+hO+BpVM8J9LXlj0Ml9cbnD7bSJsQwZr10ZkLHAyT5l21Cdsr9oAw9tybjQVzBp0fjKiHy5l8EDGkRWZVZB9mMgYpCp76jI97ROyrUS37vrhUw+UNRTRE6ybB4vcgO7cURaQv4Pc0W2vPcDitO4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bl/ZA2+WnCpyMbxp7vZHNbPEAEvoiRjkFL+KokRs0Oo=;
 b=loSkRGXmHWod2Qb3/PD2D5jfEPRDLiWmPO/URxdZxo3m19FewCFlERq49OcV10CWrBrxZmbDa0TlR7gzUIfClL5Xw6i3Zs+ZJPMFjExoe6vbDe521cMgoEar7LULz6dCM+bPIEknjRFn38VaQHTNTWTYVI3aoGoBjqG5iBNG9SVk1GnByaHU8PjGh2IpON24x4mMuW8QfDX/EaFJlnYfEAAciNCNXRqxRrQ9KbhJibDaDodTqlTC1URIoJz0+JHV3rPGQMrWaXeFePEMF3lDgDuKUwdwA3FM+0lSJIBCy5FGo/nTKaNwXDXPNHdQvSUsGLKpjy+sK1YVvlA/x4EH2w==
Received: from PH8PR20CA0024.namprd20.prod.outlook.com (2603:10b6:510:23c::19)
 by CH3PR12MB8725.namprd12.prod.outlook.com (2603:10b6:610:170::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Mon, 20 May
 2024 11:49:46 +0000
Received: from CY4PEPF0000E9D5.namprd05.prod.outlook.com
 (2603:10b6:510:23c:cafe::b9) by PH8PR20CA0024.outlook.office365.com
 (2603:10b6:510:23c::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36 via Frontend
 Transport; Mon, 20 May 2024 11:49:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000E9D5.mail.protection.outlook.com (10.167.241.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7611.14 via Frontend Transport; Mon, 20 May 2024 11:49:45 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 20 May
 2024 04:49:33 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 20 May
 2024 04:49:33 -0700
Received: from build-spujar-20240506T080629452.internal (10.127.8.9) by
 mail.nvidia.com (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.4 via
 Frontend Transport; Mon, 20 May 2024 04:49:33 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <linux-sound@vger.kernel.org>,
	<alsa-devel@alsa-project.org>
CC: <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<lgirdwood@gmail.com>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
	<mkumard@nvidia.com>, <spujar@nvidia.com>
Subject: [PATCH 1/2] ASoC: simple-card-utils: Split simple_fixup_sample_fmt func
Date: Mon, 20 May 2024 11:49:01 +0000
Message-ID: <20240520114902.1663695-2-spujar@nvidia.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240520114902.1663695-1-spujar@nvidia.com>
References: <20240520114902.1663695-1-spujar@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D5:EE_|CH3PR12MB8725:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b3bb443-d422-4ee2-9f86-08dc78c2f206
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|82310400017|376005|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GkVBLZ0rQtE4jg1Gt6b6mhLjvq5J9Rzj9W5RFE4zHzerrV6R+LJjQnPretWW?=
 =?us-ascii?Q?NgKa4Ymzy73Uw7zfjEBVxgD+Sta6dNXGR1Mwsleu+xKMJhWbCucQigsW03K3?=
 =?us-ascii?Q?mgSSZX54lQhISC7gyP+uasvO7TZxmKufJFBgWkFXCGmN3Ed8E9y7vBFaMLk7?=
 =?us-ascii?Q?EEeLfaCk5QWrX+h/OHFimnDKqd1jGvBbizbI/S3TtuVxV/ZKod6L2F6Sc6a0?=
 =?us-ascii?Q?L0t/ASkGtwlfk2vy9nr43Fps6Es9hLj3c5PD9NXY33tLiEyG6znOcJ7Qd+Fx?=
 =?us-ascii?Q?B8xSKTPpSBFH+knAQO+ah92imgE1TSgHdyxxBzV98S7QMEUTRn3yK3MJ/RlQ?=
 =?us-ascii?Q?agFmu+p5lctfoYgBdHkU73mJzdnfqphNPBB3Xb9aF7GQOdNAI/T32JvWbWt2?=
 =?us-ascii?Q?dsdSww/lCSlpGaKxYiEq6RRTf2O5/IzxoC5YM+bp5aYMf6cPOe87YYwa+M6k?=
 =?us-ascii?Q?Ee2pqbmOAURCQddYFSFZ5BR/kWDfUR1GvYpqZWnSPZJnyGWx3nJsJ7wpTjNt?=
 =?us-ascii?Q?Z8uYg6kSley9MorG3smkJzjFe/OFeDt2Gm9QTsGVi25bIaxPhITtTMB/+uNr?=
 =?us-ascii?Q?SaBxu6GZ2PUwRHKj0wsPAKK9BumGYMaKPUuRmwhrMTCl8FctCouVd+yc/y3+?=
 =?us-ascii?Q?803o/4mNF+G7ic42lrlI0JzsOFeTUdaRvXYnfju8gwmpaVkN+7ec/siMontf?=
 =?us-ascii?Q?Ea4TflYxqZ7fG98N7IXsVVwUQjUb0X9v+vZcMk+LxUpTbydFZsgZUcj/feJS?=
 =?us-ascii?Q?otfEtJ7SW4AGWW2Mzzxw4TjyVRQTozOkBTE4P95PtlaHbnzxP8+p6Y4oWjHr?=
 =?us-ascii?Q?z4E2CRAjWsC6tN4LMsMLuGv5NebWwyrsreThBsn0d+hfO4dFo8l0Nn2Uea5t?=
 =?us-ascii?Q?BJ9vunc/2w/7WcYqPXvD20lffU6ULUZOvIT7INL2PyamoLAjZBWWjkJUl3Ku?=
 =?us-ascii?Q?gcIyV6F2DMQ+aHK4Mo0OOaw99nhQIMthpJKe0iABhxlfmg2CHwer6k9W1P1K?=
 =?us-ascii?Q?r0amDsPciZR/fR91W88wKVzZEpuulDfFXZnRxQfQYbCtZfFX2NCs7ZW4oynB?=
 =?us-ascii?Q?prMqJVH8JceI4mLScsTR1lu1xW1sMbixlSRZuKDVw0J7EtoFDCPFNsrXKp48?=
 =?us-ascii?Q?BlZlgAmVhaavfeQjboOS+8Z4oBlp9NTZpPnbTYtmiKB9UBV7X3dJgVPCkIwM?=
 =?us-ascii?Q?oYtK2VI69It4SImlCYSfyUgAnYgqUG0B9kHHVqXFOkdlM5//HYDQIZ+X4S9t?=
 =?us-ascii?Q?tlJrIfJgTYQjccZJPVf7msJLcgbxM3A/iVMfODTuKcuVQ369Av+5+oaXcWBK?=
 =?us-ascii?Q?yIHRSBpHVBR12y9h1dnqAL41aVLn651/Ps2eYV5Edw9z0i4OPrVW7st7MFIS?=
 =?us-ascii?Q?kRC0pMzSFNYP4lVBrBP2JJSBy31Q?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(1800799015)(82310400017)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2024 11:49:45.7870
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b3bb443-d422-4ee2-9f86-08dc78c2f206
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8725

From: Mohan Kumar <mkumard@nvidia.com>

Split the simple_fixup_sample_fmt() into two functions by adding
one more function named simple_util_get_sample_fmt() to return
the sample format value.

This is useful for drivers that wish to simply get the sample format
without setting the mask.

Signed-off-by: Mohan Kumar <mkumard@nvidia.com>
Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 include/sound/simple_card_utils.h     |  2 ++
 sound/soc/generic/simple-card-utils.c | 26 ++++++++++++++++++++------
 2 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_utils.h
index ad67957b7b48..2c2279d082ec 100644
--- a/include/sound/simple_card_utils.h
+++ b/include/sound/simple_card_utils.h
@@ -174,6 +174,8 @@ void simple_util_parse_convert(struct device_node *np, char *prefix,
 			       struct simple_util_data *data);
 bool simple_util_is_convert_required(const struct simple_util_data *data);
 
+int simple_util_get_sample_fmt(struct simple_util_data *data);
+
 int simple_util_parse_routing(struct snd_soc_card *card,
 				      char *prefix);
 int simple_util_parse_widgets(struct snd_soc_card *card,
diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index 81077d16d22f..f1f5a1c025fc 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -13,12 +13,11 @@
 #include <sound/pcm_params.h>
 #include <sound/simple_card_utils.h>
 
-static void simple_fixup_sample_fmt(struct simple_util_data *data,
-					 struct snd_pcm_hw_params *params)
+int simple_util_get_sample_fmt(struct simple_util_data *data)
 {
 	int i;
-	struct snd_mask *mask = hw_param_mask(params,
-					      SNDRV_PCM_HW_PARAM_FORMAT);
+	int val = -EINVAL;
+
 	struct {
 		char *fmt;
 		u32 val;
@@ -33,11 +32,26 @@ static void simple_fixup_sample_fmt(struct simple_util_data *data,
 	for (i = 0; i < ARRAY_SIZE(of_sample_fmt_table); i++) {
 		if (!strcmp(data->convert_sample_format,
 			    of_sample_fmt_table[i].fmt)) {
-			snd_mask_none(mask);
-			snd_mask_set(mask, of_sample_fmt_table[i].val);
+			val = of_sample_fmt_table[i].val;
 			break;
 		}
 	}
+	return val;
+}
+EXPORT_SYMBOL_GPL(simple_util_get_sample_fmt);
+
+static void simple_fixup_sample_fmt(struct simple_util_data *data,
+				    struct snd_pcm_hw_params *params)
+{
+	int val;
+	struct snd_mask *mask = hw_param_mask(params,
+					      SNDRV_PCM_HW_PARAM_FORMAT);
+
+	val = simple_util_get_sample_fmt(data);
+	if (val >= 0) {
+		snd_mask_none(mask);
+		snd_mask_set(mask, val);
+	}
 }
 
 void simple_util_parse_convert(struct device_node *np,
-- 
2.45.1



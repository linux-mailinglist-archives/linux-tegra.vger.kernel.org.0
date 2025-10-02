Return-Path: <linux-tegra+bounces-9636-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 38407BB3649
	for <lists+linux-tegra@lfdr.de>; Thu, 02 Oct 2025 11:04:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E0001895F2C
	for <lists+linux-tegra@lfdr.de>; Thu,  2 Oct 2025 09:04:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CCC4313262;
	Thu,  2 Oct 2025 09:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CrVVHWVq"
X-Original-To: linux-tegra@vger.kernel.org
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012027.outbound.protection.outlook.com [40.107.209.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BDC30BBA4;
	Thu,  2 Oct 2025 09:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759395715; cv=fail; b=AmhLNsf7skQkANXC0JdhaEP4fngYnDl6me/chVazDqjdIwF4BQ7RHVYExnle6ChwKQbgfXph6SSG+myyCdtT+B6DLRgDfoaUAXSKiPb1kNC1X4XmzaAjfAPBrXFHgKdRwM/2Hzu6Q6nVEcZ4n1Uij8tKX+v+ZqT1ksHH/aJrZik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759395715; c=relaxed/simple;
	bh=aLBKozcO3QomUZybxk12ZDZjatlgY9EimjR4Gl0NcDM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GKhFy6WoCX8aP5tV7loAyuAqbyX/RX3GqJpTnVppgpZiayIrV8GGCJFHiDxcyni/j33UwFE9+eo+vIrsuNsXzSlyE4kP6FihmYR+0SP3xhF08HMv6uzTHrSfd2zUcXao68p+oY+oPd+5hX+oWvQcb0765GR1Z1Ce2WyDHZRvd8M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CrVVHWVq; arc=fail smtp.client-ip=40.107.209.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VBljMOSN8IVwuffhFvFPGDSQIrz7yIfi/hOpwrcyh6KZcEDKIMQa7B2Be0mgoLkS+jYpTbtLjmMoU8T3MztoCHUIw3CL2xzvEv9g74oFofhN6CcsflHu/Hrp+spKuvRqKh7HWwH5PHHytM6PzdlTExK7/ua1dhObXo2VKcRsP0eexxDLWGlXBlMXvGmKzmvHygo7dgAuUR7kk8KmomAB5LP9BBE6Cnk+5Ybx8YGc5hJZ1Llz2DtNHNWPYXORIcTxbYCEOChbWqFe15iAWhj/qc0I36hkjfqrjUR3j7Fl9vZFUoHsNT0eW7jk81PrP0+7AxBWqEeYkwrnJL+yDgsiqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2/qGmecjKezmAu8QyWJGYstrZARVYzgu21fQ+qS5jOw=;
 b=R3saMOt5H/wrzIk6rUiAz0psJqUWinrQsP+t9yYjthoiiHE1cxnyczx15pqzlO0CjXJxhP4m4wI6yAWSobi/f4s/YmTY5o4LVDznTTDdnB5R2SVXafwxEvbyr1Sg6UGlnn71uIKu+1fMqMCCitjiNifDU3SnalSD84uHW2LL/VkVbXO1SPbhbypL3H3FRpQ4pLlBXPISb8AsABNenYVDzgEizs++GPa/grbAYf47aIMCib/+A+LC37ut8lHL/C+s7KngeoiPQuOIZcV+6vlvHtPA+gqLprt19nDwX/rvArMscTNpAFlv7zrwpa4EoKPuwOYRrSdtiIQIljlwy5zn5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2/qGmecjKezmAu8QyWJGYstrZARVYzgu21fQ+qS5jOw=;
 b=CrVVHWVqgaVR2fxW7+jVPDdH0JV36xB4/Mxym7eFCaEkVKzi6q0SFd4hFvOMzb+bkolTTwi2E9c+pk99lj9qPYRZbqr1sHcn5NU+jsn6QutOlmH51Ac2PPbkaiqs75Csz/j4U9fBP6fjhZGpNrR6traf8Dwe+vSob6ZvgDN2tTR3bmbcLvQm5yArAEgI+WuQaMGpMjMUU0kEzKWmhPFerRhfb5c0EyenyLGg4zVBQ37QenS+S4KpfyjW/juEhranUI4hP74aq4s0UWW+zD4YGei3AL//2RFnHkgo0FqKEzAQuuBlcLQTnDj+knVwAXx3QMLjfwxQJe5AHNy5II8uWA==
Received: from CH0PR03CA0194.namprd03.prod.outlook.com (2603:10b6:610:e4::19)
 by PH8PR12MB6963.namprd12.prod.outlook.com (2603:10b6:510:1be::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Thu, 2 Oct
 2025 09:01:46 +0000
Received: from CH1PEPF0000A346.namprd04.prod.outlook.com
 (2603:10b6:610:e4:cafe::4c) by CH0PR03CA0194.outlook.office365.com
 (2603:10b6:610:e4::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.15 via Frontend Transport; Thu,
 2 Oct 2025 09:01:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH1PEPF0000A346.mail.protection.outlook.com (10.167.244.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.15 via Frontend Transport; Thu, 2 Oct 2025 09:01:45 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.34; Thu, 2 Oct
 2025 02:01:33 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 2 Oct
 2025 02:01:32 -0700
Received: from build-ketanp-bionic-20250813.nvidia.com (10.127.8.10) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Thu, 2 Oct 2025 02:01:32 -0700
From: Ketan Patil <ketanp@nvidia.com>
To: <krzk@kernel.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Ketan Patil
	<ketanp@nvidia.com>
Subject: [PATCH v2 4/4] memory: tegra: Add MC error logging support for Tegra264
Date: Thu, 2 Oct 2025 09:00:54 +0000
Message-ID: <20251002090054.1837481-5-ketanp@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251002090054.1837481-1-ketanp@nvidia.com>
References: <20251002090054.1837481-1-ketanp@nvidia.com>
X-NVConfidentiality: public
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A346:EE_|PH8PR12MB6963:EE_
X-MS-Office365-Filtering-Correlation-Id: 93ded41c-b3a4-455f-8e83-08de0192506f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tRQ3YL/0eVXJ7ZIRzR8Jo2aNeDjkaiUxGGzjtGohjAxLYBRuSpPImxLpMsP2?=
 =?us-ascii?Q?j7jVrwWd2LrltpHeY8y9Xhcist/YUKfYpyb03WEaK5QlN0dAgspL3Bj5uJXH?=
 =?us-ascii?Q?VGIcTSCUFKeXpnosgiGrwnh1ArMnxV/4sPYmQEj6OAelphWOJ5PBzWht5Sfr?=
 =?us-ascii?Q?uG5157HXxZf8SyISgrXBzB2TuSuN+IuSCQeffo94uI/XLuWlW+GEysWssg4j?=
 =?us-ascii?Q?XqtDNnBiH6d6zz2tNbgFRZYQMHRtI8/Zqa+1iOKTpAU5WCuSzuQzsP2BPAzg?=
 =?us-ascii?Q?LI2Oq2sB/7cHlDQLYUs7ZpkxinXLGbEMzmpGPQlGRabZrt504wPJ0+6RAAqt?=
 =?us-ascii?Q?RemZKll+UvMezopuCFXW/E6nLmHWhu7SSqCdB2AG+BnYHpOTjAxQ+F9yNMym?=
 =?us-ascii?Q?vj/ctfVKItx+lX8ZROqoXhQ8Rv5m4tXHl1QvCQlFmNsrFs38tWASJrE4UWau?=
 =?us-ascii?Q?f4cL+ae0tUgAC3/WnktSwZy18k48RfvogSw/5IK1wKdAnZl85gfk3MhH6pHV?=
 =?us-ascii?Q?8pzNb71lM/erXWxwmMaC+bcg+q2a1A0SV85OBskpB4O0erCQu98COtfnyzbb?=
 =?us-ascii?Q?NHwJ3Uy4g7aVYZf3Q4QYdiV0KGSdkXnNcFvat9Je/UBUY2m2NOTZ78BeigOt?=
 =?us-ascii?Q?XMVp1lEdXAO8dTKDuhY6W9Sqn5zY8TP4tQ77hQ1d4OH+t0ADaPbaHxUhhUhs?=
 =?us-ascii?Q?pROyuiVJWSqjyL2UwxB7MnAPyHPtxLQ1MpePT5T+A7CvGDSS/ViuXkn5GKpk?=
 =?us-ascii?Q?SCZLUeWbGhbMm4GBdXBlrHYJIRJpQkpEQV7GyPvOsUtCb3FhIP76j77ZFIIN?=
 =?us-ascii?Q?kN2lFxn+CwsbV9yITMvM1egW3aac5wlejhiVYC3raEgSf1tBZI5OYGRv2fZB?=
 =?us-ascii?Q?bM61t0oBiEhkAi+9/hnmOsZX/7SeeJk/1Cg4Q+lXkI3qa/sUT9GXzbRjeztc?=
 =?us-ascii?Q?WWw86x5x+MeUeo4Pvhwd1kTepbr9dX5w1W+eL9p/762wHlSBtiHc+srK6PGA?=
 =?us-ascii?Q?+PwTzR9cVi9729+gOEoLgJxUa5IjrMXbKhNfFqNmtZ1le7mX9ldAqJI2Q035?=
 =?us-ascii?Q?aPt5GlwTWtvQsvtw/bG16/U4ptNdk1hW2OF2zo1nHPH2Os27cncWZ3lzdixM?=
 =?us-ascii?Q?1MPILZT5ti1eMqB3fQtV02xafuFgs2UDNzHFK4HW9mlECiCttm63xjdO2SDZ?=
 =?us-ascii?Q?8VCoP4Vf+ldv4/aoqRrifEx+H7tOIwph1glgR2WH8XcO6tdBbtCS8jBJhbQe?=
 =?us-ascii?Q?Sqs3QKJ2l3uYkrES3jYzTKDCiWHKHJGjTC/g5b+UucApaCclcxyibM4z8u3E?=
 =?us-ascii?Q?ptAIgaB2wb59EP5mbuyV5Yutg3pwMl5mAT/29LiN7Bdp29BKvqLCNbyS5/Tn?=
 =?us-ascii?Q?SK+/bCIaxzPbXeEuGoK5MrpEd3fkKFcrMk63qiAF2UInXKiI5codITe4C6XL?=
 =?us-ascii?Q?vEwPMKsy3IX+Oa11Od08zmjN6PraVKVvGTDF34a6b8s1a5PEoT3UvwJyN71i?=
 =?us-ascii?Q?F+xlYdQXJ/yXSad/2ScaQKl+RQk0pXQpX5QM+0vZKpX5flmiGI6onj9oB+28?=
 =?us-ascii?Q?tP9izYZzgVkb4H+88q0=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 09:01:45.8011
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93ded41c-b3a4-455f-8e83-08de0192506f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A346.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6963

In Tegra264, different components from memory subsystems like Memory
Controller Fabric (MCF), HUB, HUB Common (HUBC), Side Band Shim (SBS)
and MC Channels have different interrupt lines for receiving memory
controller error interrupts.

Add support for logging memory controller errors on Tegra264.
- Add MC error handling flow for MCF, HUB, HUBC, SBS and MC Channel.
- Each of these components have different interrupt lines for MC error.
- Register interrupt handlers for interrupts from these different MC
components.
- There is no global interrupt status register in Tegra264 unlike older
Tegra chips.
- There are common interrupt status registers in case of MCF, HUB, HUBC
from which figure out the slice number or hub number responsible for
generating interrupt and then read interrupt status register to find out
type of violation.
- Introduce new SoC specific fields in tegra_mc_soc like interrupt mask
values for MCF, HUB, HUBC etc., which are SOC specific.

Signed-off-by: Ketan Patil <ketanp@nvidia.com>
---
 drivers/memory/tegra/mc.c       |  49 +++-
 drivers/memory/tegra/mc.h       |  78 +++++-
 drivers/memory/tegra/tegra186.c |  10 +-
 drivers/memory/tegra/tegra194.c |   2 +
 drivers/memory/tegra/tegra20.c  |  10 +-
 drivers/memory/tegra/tegra234.c |   2 +
 drivers/memory/tegra/tegra264.c | 407 +++++++++++++++++++++++++++++++-
 drivers/memory/tegra/tegra30.c  |   2 +
 include/soc/tegra/mc.h          |   7 +
 9 files changed, 537 insertions(+), 30 deletions(-)

diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index 03cf49165439..244706c4b16c 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -606,7 +606,7 @@ irqreturn_t tegra30_mc_handle_irq(int irq, void *data)
 		return IRQ_NONE;
 
 	for_each_set_bit(bit, &status, 32) {
-		const char *error = tegra_mc_status_names[bit] ?: "unknown";
+		const char *error = tegra20_mc_status_names[bit] ?: "unknown";
 		const char *client = "unknown", *desc;
 		const char *direction, *secure;
 		u32 status_reg, addr_reg;
@@ -671,7 +671,7 @@ irqreturn_t tegra30_mc_handle_irq(int irq, void *data)
 					addr = mc_readl(mc, addr_hi_reg);
 			} else {
 				addr = ((value >> MC_ERR_STATUS_ADR_HI_SHIFT) &
-					MC_ERR_STATUS_ADR_HI_MASK);
+					mc->soc->mc_addr_hi_mask);
 			}
 			addr <<= 32;
 		}
@@ -696,11 +696,11 @@ irqreturn_t tegra30_mc_handle_irq(int irq, void *data)
 			}
 		}
 
-		type = (value & MC_ERR_STATUS_TYPE_MASK) >>
+		type = (value & mc->soc->mc_err_status_type_mask) >>
 		       MC_ERR_STATUS_TYPE_SHIFT;
-		desc = tegra_mc_error_names[type];
+		desc = tegra20_mc_error_names[type];
 
-		switch (value & MC_ERR_STATUS_TYPE_MASK) {
+		switch (value & mc->soc->mc_err_status_type_mask) {
 		case MC_ERR_STATUS_TYPE_INVALID_SMMU_PAGE:
 			perm[0] = ' ';
 			perm[1] = '[';
@@ -753,7 +753,7 @@ irqreturn_t tegra30_mc_handle_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-const char *const tegra_mc_status_names[32] = {
+const char *const tegra20_mc_status_names[32] = {
 	[ 1] = "External interrupt",
 	[ 6] = "EMEM address decode error",
 	[ 7] = "GART page fault",
@@ -768,7 +768,7 @@ const char *const tegra_mc_status_names[32] = {
 	[20] = "Route Sanity error",
 };
 
-const char *const tegra_mc_error_names[8] = {
+const char *const tegra20_mc_error_names[8] = {
 	[2] = "EMEM decode error",
 	[3] = "TrustZone violation",
 	[4] = "Carveout violation",
@@ -976,11 +976,36 @@ static int tegra_mc_probe(struct platform_device *pdev)
 			}
 		}
 
-		if (mc->soc->num_channels)
-			mc_ch_writel(mc, MC_BROADCAST_CHANNEL, mc->soc->intmask,
-				     MC_INTMASK);
-		else
-			mc_writel(mc, mc->soc->intmask, MC_INTMASK);
+		if (mc->soc->ops->num_interrupts > 1) {
+			/* Unmask MCF interrupts */
+			mc_ch_writel(mc, MC_BROADCAST_CHANNEL, mc->soc->mcf_intmask, MCF_INTMASK_0);
+			mc_ch_writel(mc, MC_BROADCAST_CHANNEL, mc->soc->mcf_intmask,
+				MCF_INTPRIORITY_0);
+
+			/* Unmask HUB and HUBC interrupts */
+			mc_ch_writel(mc, MC_BROADCAST_CHANNEL, mc->soc->hub_intmask,
+				MSS_HUB_INTRMASK_0);
+			mc_ch_writel(mc, MC_BROADCAST_CHANNEL, mc->soc->hub_intmask,
+				MSS_HUB_INTRPRIORITY_0);
+			mc_ch_writel(mc, MC_BROADCAST_CHANNEL, mc->soc->hubc_intmask,
+				MSS_HUB_HUBC_INTMASK_0);
+			mc_ch_writel(mc, MC_BROADCAST_CHANNEL, mc->soc->hubc_intmask,
+				MSS_HUB_HUBC_INTPRIORITY_0);
+
+			/* Unmask SBS interrupts */
+			mc_ch_writel(mc, MC_BROADCAST_CHANNEL, mc->soc->sbs_intmask,
+				MSS_SBS_INTMASK_0);
+
+			/* Unmask MC channel interrupt */
+			mc_ch_writel(mc, MC_BROADCAST_CHANNEL, mc->soc->mc_ch_intmask,
+				MC_CH_INTMASK_0);
+		} else {
+			if (mc->soc->num_channels)
+				mc_ch_writel(mc, MC_BROADCAST_CHANNEL, mc->soc->intmask,
+					MC_INTMASK);
+			else
+				mc_writel(mc, mc->soc->intmask, MC_INTMASK);
+		}
 	}
 
 	if (mc->soc->reset_ops) {
diff --git a/drivers/memory/tegra/mc.h b/drivers/memory/tegra/mc.h
index 06ae3dd37a47..fabbebf8a36c 100644
--- a/drivers/memory/tegra/mc.h
+++ b/drivers/memory/tegra/mc.h
@@ -25,6 +25,7 @@
 #define MC_INT_DECERR_MTS				BIT(16)
 #define MC_INT_DECERR_GENERALIZED_CARVEOUT		BIT(17)
 #define MC_INT_DECERR_ROUTE_SANITY			BIT(20)
+#define MC_INT_DECERR_ROUTE_SANITY_GIC_MSI		BIT(21)
 
 #define MC_INTMASK					0x04
 #define MC_GART_ERROR_REQ				0x30
@@ -63,6 +64,60 @@
 
 #define MC_GLOBAL_INTSTATUS				0xf24
 
+/* Registers for MSS HUB */
+#define MSS_HUB_GLOBAL_INTSTATUS_0			0x6000
+#define MSS_HUBC_INTR					BIT(0)
+
+#define MSS_HUB_HUBC_INTSTATUS_0			0x6008
+#define MSS_HUB_INTRSTATUS_0				0x600c
+#define MSS_HUB_HUBC_INTMASK_0				0x6010
+#define MSS_HUB_HUBC_SCRUB_DONE_INTMASK			BIT(0)
+
+#define MSS_HUB_HUBC_INTPRIORITY_0			0x6014
+#define MSS_HUB_INTRMASK_0				0x6018
+#define MSS_HUB_COALESCER_ERR_INTMASK			BIT(0)
+#define MSS_HUB_SMMU_BYPASS_ALLOW_ERR_INTMASK		BIT(1)
+#define MSS_HUB_ILLEGAL_TBUGRP_ID_INTMASK		BIT(2)
+#define MSS_HUB_MSI_ERR_INTMASK				BIT(3)
+#define MSS_HUB_POISON_RSP_INTMASK			BIT(4)
+#define MSS_HUB_RESTRICTED_ACCESS_ERR_INTMASK		BIT(5)
+#define MSS_HUB_RESERVED_PA_ERR_INTMASK			BIT(6)
+
+#define MSS_HUB_INTRPRIORITY_0				0x601c
+#define MSS_HUB_SMMU_BYPASS_ALLOW_ERR_STATUS_0		0x6020
+#define MSS_HUB_MSI_ERR_STATUS_0			0x6024
+#define MSS_HUB_POISON_RSP_STATUS_0			0x6028
+#define MSS_HUB_COALESCE_ERR_STATUS_0			0x60e0
+#define MSS_HUB_COALESCE_ERR_ADR_HI_0			0x60e4
+#define MSS_HUB_COALESCE_ERR_ADR_0			0x60e8
+#define MSS_HUB_RESTRICTED_ACCESS_ERR_STATUS_0		0x638c
+#define MSS_HUB_RESERVED_PA_ERR_STATUS_0		0x6390
+#define MSS_HUB_ILLEGAL_TBUGRP_ID_ERR_STATUS_0		0x63b0
+
+/* Registers for MC Channel */
+#define MC_CH_INTSTATUS_0				0x82d4
+#define MC_CH_INTMASK_0					0x82d8
+#define WCAM_ERR_INTMASK				BIT(19)
+
+#define MC_ERR_GENERALIZED_CARVEOUT_STATUS_1_0		0xbc74
+
+/* Registers for MCF */
+#define MCF_COMMON_INTSTATUS0_0_0			0xce04
+#define MCF_INTSTATUS_0					0xce2c
+#define MCF_INTMASK_0					0xce30
+#define MCF_INTPRIORITY_0				0xce34
+
+/* Registers for SBS */
+#define MSS_SBS_INTSTATUS_0				0xec08
+#define MSS_SBS_INTMASK_0				0xec0c
+#define MSS_SBS_FILL_FIFO_ISO_OVERFLOW_INTMASK		BIT(0)
+#define MSS_SBS_FILL_FIFO_SISO_OVERFLOW_INTMASK		BIT(1)
+#define MSS_SBS_FILL_FIFO_NISO_OVERFLOW_INTMASK		BIT(2)
+
+/* Bit field of MC_ERR_ROUTE_SANITY_STATUS_0 register */
+#define MC_ERR_ROUTE_SANITY_RW				BIT(12)
+#define MC_ERR_ROUTE_SANITY_SEC				BIT(13)
+
 /* Bit field of MC_ERR_STATUS_0 register */
 #define MC_ERR_STATUS_RW				BIT(16)
 #define MC_ERR_STATUS_SECURITY				BIT(17)
@@ -70,12 +125,22 @@
 #define MC_ERR_STATUS_WRITABLE				BIT(26)
 #define MC_ERR_STATUS_READABLE				BIT(27)
 
+#define MC_ERR_STATUS_GSC_ADR_HI_MASK			0xffff
+#define MC_ERR_STATUS_GSC_ADR_HI_SHIFT			16
+#define MC_ERR_STATUS_RT_ADR_HI_SHIFT			15
+
 #define MC_ERR_STATUS_TYPE_SHIFT			28
 #define MC_ERR_STATUS_TYPE_INVALID_SMMU_PAGE		(0x6 << 28)
 #define MC_ERR_STATUS_TYPE_MASK				(0x7 << 28)
+#define MC_ERR_STATUS_RT_TYPE_MASK			(0xf << 28)
+#define MC_ERR_STATUS_RT_TYPE_SHIFT			28
 
 #define MC_ERR_STATUS_ADR_HI_SHIFT			20
-#define MC_ERR_STATUS_ADR_HI_MASK			0x3
+
+#define ERR_GENERALIZED_APERTURE_ID_SHIFT		0
+#define ERR_GENERALIZED_APERTURE_ID_MASK		0x1F
+#define ERR_GENERALIZED_CARVEOUT_APERTURE_ID_SHIFT	5
+#define ERR_GENERALIZED_CARVEOUT_APERTURE_ID_MASK	0x1F
 
 #define MC_EMEM_ARB_CFG_CYCLES_PER_UPDATE(x)		((x) & 0x1ff)
 #define MC_EMEM_ARB_CFG_CYCLES_PER_UPDATE_MASK		0x1ff
@@ -188,15 +253,18 @@ extern const struct tegra_mc_ops tegra30_mc_ops;
 
 #if defined(CONFIG_ARCH_TEGRA_186_SOC) || \
     defined(CONFIG_ARCH_TEGRA_194_SOC) || \
-    defined(CONFIG_ARCH_TEGRA_234_SOC) || \
-    defined(CONFIG_ARCH_TEGRA_264_SOC)
+    defined(CONFIG_ARCH_TEGRA_234_SOC)
 extern const struct tegra_mc_ops tegra186_mc_ops;
 #endif
 
 irqreturn_t tegra30_mc_handle_irq(int irq, void *data);
 extern const irq_handler_t tegra30_mc_irq_handlers[];
-extern const char * const tegra_mc_status_names[32];
-extern const char * const tegra_mc_error_names[8];
+extern const char * const tegra20_mc_status_names[32];
+extern const char * const tegra20_mc_error_names[8];
+int tegra186_mc_probe(struct tegra_mc *mc);
+int tegra186_mc_probe_device(struct tegra_mc *mc, struct device *dev);
+int tegra186_mc_resume(struct tegra_mc *mc);
+void tegra186_mc_remove(struct tegra_mc *mc);
 
 /*
  * These IDs are for internal use of Tegra ICC drivers. The ID numbers are
diff --git a/drivers/memory/tegra/tegra186.c b/drivers/memory/tegra/tegra186.c
index a3727fc383ac..f977a317d1e8 100644
--- a/drivers/memory/tegra/tegra186.c
+++ b/drivers/memory/tegra/tegra186.c
@@ -23,7 +23,7 @@
 #define MC_SID_STREAMID_SECURITY_WRITE_ACCESS_DISABLED BIT(16)
 #define MC_SID_STREAMID_SECURITY_OVERRIDE BIT(8)
 
-static int tegra186_mc_probe(struct tegra_mc *mc)
+int tegra186_mc_probe(struct tegra_mc *mc)
 {
 	struct platform_device *pdev = to_platform_device(mc->dev);
 	struct resource *res;
@@ -76,7 +76,7 @@ static int tegra186_mc_probe(struct tegra_mc *mc)
 	return 0;
 }
 
-static void tegra186_mc_remove(struct tegra_mc *mc)
+void tegra186_mc_remove(struct tegra_mc *mc)
 {
 	of_platform_depopulate(mc->dev);
 }
@@ -124,7 +124,7 @@ static void tegra186_mc_client_sid_override(struct tegra_mc *mc,
 }
 #endif
 
-static int tegra186_mc_probe_device(struct tegra_mc *mc, struct device *dev)
+int tegra186_mc_probe_device(struct tegra_mc *mc, struct device *dev)
 {
 #if IS_ENABLED(CONFIG_IOMMU_API)
 	struct of_phandle_args args;
@@ -154,7 +154,7 @@ static int tegra186_mc_probe_device(struct tegra_mc *mc, struct device *dev)
 	return 0;
 }
 
-static int tegra186_mc_resume(struct tegra_mc *mc)
+int tegra186_mc_resume(struct tegra_mc *mc)
 {
 #if IS_ENABLED(CONFIG_IOMMU_API)
 	unsigned int i;
@@ -916,5 +916,7 @@ const struct tegra_mc_soc tegra186_mc_soc = {
 	.ch_intmask = 0x0000000f,
 	.global_intstatus_channel_shift = 0,
 	.mc_regs = &tegra20_mc_regs,
+	.mc_addr_hi_mask = 0x3,
+	.mc_err_status_type_mask = (0x7 << 28),
 };
 #endif
diff --git a/drivers/memory/tegra/tegra194.c b/drivers/memory/tegra/tegra194.c
index fade258c0ea7..66916bf4b7d2 100644
--- a/drivers/memory/tegra/tegra194.c
+++ b/drivers/memory/tegra/tegra194.c
@@ -1359,4 +1359,6 @@ const struct tegra_mc_soc tegra194_mc_soc = {
 	.ch_intmask = 0x00000f00,
 	.global_intstatus_channel_shift = 8,
 	.mc_regs = &tegra20_mc_regs,
+	.mc_addr_hi_mask = 0x3,
+	.mc_err_status_type_mask = (0x7 << 28),
 };
diff --git a/drivers/memory/tegra/tegra20.c b/drivers/memory/tegra/tegra20.c
index 75eeb49054cc..1ecf98764297 100644
--- a/drivers/memory/tegra/tegra20.c
+++ b/drivers/memory/tegra/tegra20.c
@@ -700,7 +700,7 @@ static irqreturn_t tegra20_mc_handle_irq(int irq, void *data)
 		return IRQ_NONE;
 
 	for_each_set_bit(bit, &status, 32) {
-		const char *error = tegra_mc_status_names[bit];
+		const char *error = tegra20_mc_status_names[bit];
 		const char *direction = "read", *secure = "";
 		const char *client, *desc;
 		phys_addr_t addr;
@@ -713,7 +713,7 @@ static irqreturn_t tegra20_mc_handle_irq(int irq, void *data)
 			value = mc_readl(mc, reg);
 
 			id = value & mc->soc->client_id_mask;
-			desc = tegra_mc_error_names[2];
+			desc = tegra20_mc_error_names[2];
 
 			if (value & BIT(31))
 				direction = "write";
@@ -724,7 +724,7 @@ static irqreturn_t tegra20_mc_handle_irq(int irq, void *data)
 			value = mc_readl(mc, reg);
 
 			id = (value >> 1) & mc->soc->client_id_mask;
-			desc = tegra_mc_error_names[2];
+			desc = tegra20_mc_error_names[2];
 
 			if (value & BIT(0))
 				direction = "write";
@@ -736,7 +736,7 @@ static irqreturn_t tegra20_mc_handle_irq(int irq, void *data)
 
 			id = value & mc->soc->client_id_mask;
 			type = (value & BIT(30)) ? 4 : 3;
-			desc = tegra_mc_error_names[type];
+			desc = tegra20_mc_error_names[type];
 			secure = "secure ";
 
 			if (value & BIT(31))
@@ -784,4 +784,6 @@ const struct tegra_mc_soc tegra20_mc_soc = {
 	.icc_ops = &tegra20_mc_icc_ops,
 	.ops = &tegra20_mc_ops,
 	.mc_regs = &tegra20_mc_regs,
+	.mc_addr_hi_mask = 0x3,
+	.mc_err_status_type_mask = (0x7 << 28),
 };
diff --git a/drivers/memory/tegra/tegra234.c b/drivers/memory/tegra/tegra234.c
index 23276f622aab..1f5a5e13e4ab 100644
--- a/drivers/memory/tegra/tegra234.c
+++ b/drivers/memory/tegra/tegra234.c
@@ -1153,4 +1153,6 @@ const struct tegra_mc_soc tegra234_mc_soc = {
 	 */
 	.num_carveouts = 32,
 	.mc_regs = &tegra20_mc_regs,
+	.mc_addr_hi_mask = 0x3,
+	.mc_err_status_type_mask = (0x7 << 28),
 };
diff --git a/drivers/memory/tegra/tegra264.c b/drivers/memory/tegra/tegra264.c
index 5203e6c11372..7e5d07c9755c 100644
--- a/drivers/memory/tegra/tegra264.c
+++ b/drivers/memory/tegra/tegra264.c
@@ -188,6 +188,45 @@ static const struct tegra_mc_client tegra264_mc_clients[] = {
 	},
 };
 
+static const char *const tegra264_mc_status_names[32] = {
+	[6] = "EMEM address decode error",
+	[8] = "Security violation",
+	[12] = "VPR violation",
+	[13] = "Secure carveout violation",
+	[16] = "MTS carveout violation",
+	[17] = "Generalized carveout violation",
+	[20] = "Route Sanity error",
+	[21] = "GIC_MSI error",
+};
+
+static const char *const tegra_hub_status_names[32] = {
+	[0] = "coalescer error",
+	[1] = "SMMU BYPASS ALLOW error",
+	[2] = "Illegal tbugrp_id error",
+	[3] = "Malformed MSI request error",
+	[4] = "Read response with poison bit error",
+	[5] = "Restricted access violation error",
+	[6] = "Reserved PA error",
+};
+
+static const char *const tegra264_mc_error_names[4] = {
+	[1] = "EMEM decode error",
+	[2] = "TrustZone violation",
+	[3] = "Carveout violation",
+};
+
+static const char *const tegra_rt_error_names[16] = {
+	[1] = "DECERR_PARTIAL_POPULATED",
+	[2] = "DECERR_SMMU_BYPASS",
+	[3] = "DECERR_INVALID_MMIO",
+	[4] = "DECERR_INVALID_GIC_MSI",
+	[5] = "DECERR_ATOMIC_SYSRAM",
+	[9] = "DECERR_REMOTE_REQ_PRE_BOOT",
+	[10] = "DECERR_ISO_OVER_C2C",
+	[11] = "DECERR_UNSUPPORTED_SBS_OPCODE",
+	[12] = "DECERR_SBS_REQ_OVER_SISO_LL",
+};
+
 /*
  * tegra264_mc_icc_set() - Pass MC client info to the BPMP-FW
  * @src: ICC node for Memory Controller's (MC) Client
@@ -283,6 +322,334 @@ static int tegra264_mc_icc_get_init_bw(struct icc_node *node, u32 *avg, u32 *pea
 	return 0;
 }
 
+static void mcf_log_fault(struct tegra_mc *mc, u32 channel, unsigned long mcf_ch_intstatus)
+{
+	unsigned int bit;
+
+	for_each_set_bit(bit, &mcf_ch_intstatus, 32) {
+		const char *error = tegra264_mc_status_names[bit] ?: "unknown";
+		u32 intmask = BIT(bit);
+		u32 status_reg, status1_reg = 0, addr_reg, addr_hi_reg = 0;
+		u32 addr_val, value, client_id, i, addr_hi_shift = 0, addr_hi_mask = 0, status1;
+		const char *direction, *secure;
+		const char *client = "unknown", *desc = "NA";
+		phys_addr_t addr = 0;
+		bool is_gsc = false, err_type_valid = false, err_rt_type_valid = false;
+		u8 type;
+		u32 mc_rw_bit = MC_ERR_STATUS_RW, mc_sec_bit = MC_ERR_STATUS_SECURITY;
+
+		switch (intmask) {
+		case MC_INT_DECERR_EMEM:
+			status_reg = mc->soc->mc_regs->mc_err_status;
+			addr_reg = mc->soc->mc_regs->mc_err_add;
+			addr_hi_reg = mc->soc->mc_regs->mc_err_add_hi;
+			err_type_valid = true;
+			break;
+
+		case MC_INT_SECURITY_VIOLATION:
+			status_reg = mc->soc->mc_regs->mc_err_status;
+			addr_reg = mc->soc->mc_regs->mc_err_add;
+			addr_hi_reg = mc->soc->mc_regs->mc_err_add_hi;
+			err_type_valid = true;
+			break;
+
+		case MC_INT_DECERR_VPR:
+			status_reg = mc->soc->mc_regs->mc_err_vpr_status;
+			addr_reg = mc->soc->mc_regs->mc_err_vpr_add;
+			addr_hi_shift = MC_ERR_STATUS_ADR_HI_SHIFT;
+			addr_hi_mask = mc->soc->mc_addr_hi_mask;
+			break;
+
+		case MC_INT_SECERR_SEC:
+			status_reg = mc->soc->mc_regs->mc_err_sec_status;
+			addr_reg = mc->soc->mc_regs->mc_err_sec_add;
+			addr_hi_shift = MC_ERR_STATUS_ADR_HI_SHIFT;
+			addr_hi_mask = mc->soc->mc_addr_hi_mask;
+			break;
+
+		case MC_INT_DECERR_MTS:
+			status_reg = mc->soc->mc_regs->mc_err_mts_status;
+			addr_reg = mc->soc->mc_regs->mc_err_mts_add;
+			addr_hi_shift = MC_ERR_STATUS_ADR_HI_SHIFT;
+			addr_hi_mask = mc->soc->mc_addr_hi_mask;
+			break;
+
+		case MC_INT_DECERR_GENERALIZED_CARVEOUT:
+			status_reg = mc->soc->mc_regs->mc_err_gen_co_status;
+			status1_reg = MC_ERR_GENERALIZED_CARVEOUT_STATUS_1_0;
+			addr_reg = mc->soc->mc_regs->mc_err_gen_co_add;
+			addr_hi_shift = MC_ERR_STATUS_GSC_ADR_HI_SHIFT;
+			addr_hi_mask = MC_ERR_STATUS_GSC_ADR_HI_MASK;
+			is_gsc = true;
+			break;
+
+		case MC_INT_DECERR_ROUTE_SANITY:
+			status_reg = mc->soc->mc_regs->mc_err_route_status;
+			addr_reg = mc->soc->mc_regs->mc_err_route_add;
+			addr_hi_shift = MC_ERR_STATUS_RT_ADR_HI_SHIFT;
+			addr_hi_mask = mc->soc->mc_addr_hi_mask;
+			mc_sec_bit = MC_ERR_ROUTE_SANITY_SEC;
+			mc_rw_bit = MC_ERR_ROUTE_SANITY_RW;
+			err_rt_type_valid = true;
+			break;
+
+		case MC_INT_DECERR_ROUTE_SANITY_GIC_MSI:
+			status_reg = mc->soc->mc_regs->mc_err_route_status;
+			addr_reg = mc->soc->mc_regs->mc_err_route_add;
+			addr_hi_shift = MC_ERR_STATUS_RT_ADR_HI_SHIFT;
+			addr_hi_mask = mc->soc->mc_addr_hi_mask;
+			mc_sec_bit = MC_ERR_ROUTE_SANITY_SEC;
+			mc_rw_bit = MC_ERR_ROUTE_SANITY_RW;
+			err_rt_type_valid = true;
+			break;
+
+		default:
+			dev_err_ratelimited(mc->dev, "Incorrect MC interrupt mask\n");
+			return;
+		}
+
+		value = mc_ch_readl(mc, channel, status_reg);
+		if (addr_hi_reg) {
+			addr = mc_ch_readl(mc, channel, addr_hi_reg);
+		} else {
+			if (!is_gsc) {
+				addr = ((value >> addr_hi_shift) & addr_hi_mask);
+			} else {
+				status1 = mc_ch_readl(mc, channel, status1_reg);
+				addr = ((status1 >> addr_hi_shift) & addr_hi_mask);
+			}
+		}
+
+		addr <<= 32;
+		addr_val = mc_ch_readl(mc, channel, addr_reg);
+		addr |= addr_val;
+
+		if (value & mc_rw_bit)
+			direction = "write";
+		else
+			direction = "read";
+
+		if (value & mc_sec_bit)
+			secure = "secure";
+		else
+			secure = "non-secure";
+
+		client_id = value & mc->soc->client_id_mask;
+		for (i = 0; i < mc->soc->num_clients; i++) {
+			if (mc->soc->clients[i].id == client_id) {
+				client = mc->soc->clients[i].name;
+				break;
+			}
+		}
+
+		if (err_type_valid) {
+			type = (value & mc->soc->mc_err_status_type_mask) >>
+					MC_ERR_STATUS_TYPE_SHIFT;
+			desc = tegra264_mc_error_names[type];
+		} else if (err_rt_type_valid) {
+			type = (value & MC_ERR_STATUS_RT_TYPE_MASK) >>
+				MC_ERR_STATUS_RT_TYPE_SHIFT;
+			desc = tegra_rt_error_names[type];
+		}
+
+		dev_err_ratelimited(mc->dev, "%s: %s %s @%pa: %s (%s)\n",
+				    client, secure, direction, &addr, error, desc);
+		if (is_gsc) {
+			dev_err_ratelimited(mc->dev, "gsc_apr_id=%u gsc_co_apr_id=%u\n",
+					    ((status1 >> ERR_GENERALIZED_APERTURE_ID_SHIFT)
+					    & ERR_GENERALIZED_APERTURE_ID_MASK),
+					    ((status1 >> ERR_GENERALIZED_CARVEOUT_APERTURE_ID_SHIFT)
+					    & ERR_GENERALIZED_CARVEOUT_APERTURE_ID_MASK));
+		}
+	}
+
+	/* clear interrupts */
+	mc_ch_writel(mc, channel, mcf_ch_intstatus, MCF_INTSTATUS_0);
+}
+
+static irqreturn_t handle_mcf_irq(int irq, void *data)
+{
+	struct tegra_mc *mc = data;
+	unsigned long mcf_common_intstat, mcf_intstatus;
+	unsigned int slice;
+
+	/* Read MCF_COMMON_INTSTATUS0_0_0 from MCB block */
+	mcf_common_intstat = mc_ch_readl(mc, MC_BROADCAST_CHANNEL, MCF_COMMON_INTSTATUS0_0_0);
+	if (mcf_common_intstat == 0) {
+		dev_err(mc->dev, "No interrupt in MCF\n");
+		return IRQ_NONE;
+	}
+
+	for_each_set_bit(slice, &mcf_common_intstat, 32) {
+		/* Find out the slice number on which interrupt occurred */
+		if (slice > 4) {
+			dev_err(mc->dev, "Invalid value in registeer MCF_COMMON_INTSTATUS0_0_0\n");
+			return IRQ_NONE;
+		}
+
+		mcf_intstatus = mc_ch_readl(mc, slice, MCF_INTSTATUS_0);
+		if (mcf_intstatus != 0)
+			mcf_log_fault(mc, slice, mcf_intstatus);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static void hub_log_fault(struct tegra_mc *mc, u32 hub, unsigned long hub_intstat)
+{
+	unsigned int bit;
+
+	for_each_set_bit(bit, &hub_intstat, 32) {
+		const char *error = tegra_hub_status_names[bit] ?: "unknown";
+		u32 intmask = BIT(bit), client_id;
+		const char *client = "unknown";
+		u32 status_reg, addr_reg = 0, addr_hi_reg = 0;
+		u32 value, addr_val, i;
+		phys_addr_t addr = 0;
+
+		switch (intmask) {
+		case MSS_HUB_COALESCER_ERR_INTMASK:
+			status_reg = MSS_HUB_COALESCE_ERR_STATUS_0;
+			addr_reg = MSS_HUB_COALESCE_ERR_ADR_0;
+			addr_hi_reg = MSS_HUB_COALESCE_ERR_ADR_HI_0;
+			break;
+
+		case MSS_HUB_SMMU_BYPASS_ALLOW_ERR_INTMASK:
+			status_reg = MSS_HUB_SMMU_BYPASS_ALLOW_ERR_STATUS_0;
+			break;
+
+		case MSS_HUB_ILLEGAL_TBUGRP_ID_INTMASK:
+			status_reg = MSS_HUB_ILLEGAL_TBUGRP_ID_ERR_STATUS_0;
+			break;
+
+		case MSS_HUB_MSI_ERR_INTMASK:
+			status_reg = MSS_HUB_MSI_ERR_STATUS_0;
+			break;
+
+		case MSS_HUB_POISON_RSP_INTMASK:
+			status_reg = MSS_HUB_POISON_RSP_STATUS_0;
+			break;
+
+		case MSS_HUB_RESTRICTED_ACCESS_ERR_INTMASK:
+			status_reg = MSS_HUB_RESTRICTED_ACCESS_ERR_STATUS_0;
+			break;
+
+		case MSS_HUB_RESERVED_PA_ERR_INTMASK:
+			status_reg = MSS_HUB_RESERVED_PA_ERR_STATUS_0;
+			break;
+
+		default:
+			dev_err_ratelimited(mc->dev, "Incorrect HUB interrupt mask\n");
+			return;
+		}
+
+		value = mc_ch_readl(mc, hub, status_reg);
+		if (addr_reg) {
+			addr = mc_ch_readl(mc, hub, addr_hi_reg);
+			addr <<= 32;
+			addr_val = mc_ch_readl(mc, hub, addr_reg);
+			addr |= addr_val;
+		}
+
+		client_id = value & mc->soc->client_id_mask;
+		for (i = 0; i < mc->soc->num_clients; i++) {
+			if (mc->soc->clients[i].id == client_id) {
+				client = mc->soc->clients[i].name;
+				break;
+			}
+		}
+
+		dev_err_ratelimited(mc->dev, "%s: @%pa: %s status:%u\n",
+				    client, &addr, error, value);
+	}
+
+	/* clear interrupts */
+	mc_ch_writel(mc, hub, hub_intstat, MSS_HUB_INTRSTATUS_0);
+}
+
+static irqreturn_t handle_hub_irq(int irq, void *data)
+{
+	struct tegra_mc *mc = data;
+	unsigned long hub_global_intstat, hub_intstat, hub_interrupted = 0;
+	unsigned int hub_gobal_mask = 0x7F00, hub_gobal_shift = 8, hub;
+
+	/* Read MSS_HUB_GLOBAL_INTSTATUS_0 from MCB block */
+	hub_global_intstat = mc_ch_readl(mc, MC_BROADCAST_CHANNEL, MSS_HUB_GLOBAL_INTSTATUS_0);
+	if (hub_global_intstat == 0) {
+		dev_err(mc->dev, "No interrupt in HUB/HUBC\n");
+		return IRQ_NONE;
+	}
+
+	/* Handle interrupt from hubc */
+	if (hub_global_intstat & MSS_HUBC_INTR) {
+		/* Read MSS_HUB_HUBC_INTSTATUS_0 from block MCB */
+		hub_intstat = mc_ch_readl(mc, MC_BROADCAST_CHANNEL, MSS_HUB_HUBC_INTSTATUS_0);
+		if (hub_intstat != 0) {
+			dev_err_ratelimited(mc->dev, "Scrubber operation status:%lu\n",
+					    hub_intstat);
+			/* Clear hubc interrupt */
+			mc_ch_writel(mc, MC_BROADCAST_CHANNEL, hub_intstat,
+				     MSS_HUB_HUBC_INTSTATUS_0);
+		}
+	}
+
+	hub_interrupted = (hub_global_intstat & hub_gobal_mask) >> hub_gobal_shift;
+	/* Handle interrupt from hub */
+	for_each_set_bit(hub, &hub_interrupted, 32) {
+		/* Read MSS_HUB_INTRSTATUS_0 from block MCi */
+		hub_intstat = mc_ch_readl(mc, hub, MSS_HUB_INTRSTATUS_0);
+		if (hub_intstat != 0)
+			hub_log_fault(mc, hub, hub_intstat);
+	}
+
+	/* Clear global interrupt status register */
+	mc_ch_writel(mc, MC_BROADCAST_CHANNEL, hub_global_intstat, MSS_HUB_GLOBAL_INTSTATUS_0);
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t handle_generic_irq(struct tegra_mc *mc, unsigned long intstat_reg)
+{
+	unsigned long intstat;
+	unsigned int i;
+
+	/* Iterate over all MC blocks to read INTSTATUS */
+	for (i = 0; i < mc->num_channels; i++) {
+		intstat = mc_ch_readl(mc, i, intstat_reg);
+		if (intstat) {
+			dev_err_ratelimited(mc->dev, "channel:%i status:%lu\n", i, intstat);
+			/* Clear interrupt */
+			mc_ch_writel(mc, i, intstat, intstat_reg);
+		}
+	}
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t handle_sbs_irq(int irq, void *data)
+{
+	return handle_generic_irq((struct tegra_mc *)data, MSS_SBS_INTSTATUS_0);
+}
+
+static irqreturn_t handle_channel_irq(int irq, void *data)
+{
+	return handle_generic_irq((struct tegra_mc *)data, MC_CH_INTSTATUS_0);
+}
+
+static const irq_handler_t tegra264_mc_irq_handlers[8] = {
+	handle_mcf_irq, handle_hub_irq, handle_hub_irq,
+	handle_hub_irq, handle_hub_irq, handle_hub_irq,
+	handle_sbs_irq, handle_channel_irq
+};
+
+static const struct tegra_mc_ops tegra264_mc_ops = {
+	.probe = tegra186_mc_probe,
+	.remove = tegra186_mc_remove,
+	.probe_device = tegra186_mc_probe_device,
+	.resume = tegra186_mc_resume,
+	.handle_irq = tegra264_mc_irq_handlers,
+	.num_interrupts = ARRAY_SIZE(tegra264_mc_irq_handlers),
+};
+
 static const struct tegra_mc_icc_ops tegra264_mc_icc_ops = {
 	.xlate = tegra_mc_icc_xlate,
 	.aggregate = tegra264_mc_icc_aggregate,
@@ -290,18 +657,31 @@ static const struct tegra_mc_icc_ops tegra264_mc_icc_ops = {
 	.set = tegra264_mc_icc_set,
 };
 
+static const struct tegra_mc_regs tegra264_mc_regs = {
+	.mc_cfg_channel_enable = 0x8870,
+	.mc_err_status = 0xbc00,
+	.mc_err_add = 0xbc04,
+	.mc_err_add_hi = 0xbc08,
+	.mc_err_vpr_status = 0xbc20,
+	.mc_err_vpr_add = 0xbc24,
+	.mc_err_sec_status = 0xbc3c,
+	.mc_err_sec_add = 0xbc40,
+	.mc_err_mts_status = 0xbc5c,
+	.mc_err_mts_add = 0xbc60,
+	.mc_err_gen_co_status = 0xbc78,
+	.mc_err_gen_co_add = 0xbc7c,
+	.mc_err_route_status = 0xbc64,
+	.mc_err_route_add = 0xbc68,
+};
+
 const struct tegra_mc_soc tegra264_mc_soc = {
 	.num_clients = ARRAY_SIZE(tegra264_mc_clients),
 	.clients = tegra264_mc_clients,
 	.num_address_bits = 40,
 	.num_channels = 16,
 	.client_id_mask = 0x1ff,
-	.intmask = MC_INT_DECERR_ROUTE_SANITY |
-		   MC_INT_DECERR_GENERALIZED_CARVEOUT | MC_INT_DECERR_MTS |
-		   MC_INT_SECERR_SEC | MC_INT_DECERR_VPR |
-		   MC_INT_SECURITY_VIOLATION | MC_INT_DECERR_EMEM,
 	.has_addr_hi_reg = true,
-	.ops = &tegra186_mc_ops,
+	.ops = &tegra264_mc_ops,
 	.icc_ops = &tegra264_mc_icc_ops,
 	.ch_intmask = 0x0000ff00,
 	.global_intstatus_channel_shift = 8,
@@ -310,4 +690,21 @@ const struct tegra_mc_soc tegra264_mc_soc = {
 	 * supported.
 	 */
 	.num_carveouts = 32,
+	.mc_regs = &tegra264_mc_regs,
+	.mc_addr_hi_mask = 0xff,
+	.mc_err_status_type_mask = (0x3 << 28),
+	.mcf_intmask = MC_INT_DECERR_ROUTE_SANITY_GIC_MSI |
+			MC_INT_DECERR_ROUTE_SANITY |
+			MC_INT_DECERR_GENERALIZED_CARVEOUT | MC_INT_DECERR_MTS |
+			MC_INT_SECERR_SEC | MC_INT_DECERR_VPR |
+			MC_INT_SECURITY_VIOLATION | MC_INT_DECERR_EMEM,
+	.hub_intmask = MSS_HUB_COALESCER_ERR_INTMASK | MSS_HUB_SMMU_BYPASS_ALLOW_ERR_INTMASK |
+			MSS_HUB_ILLEGAL_TBUGRP_ID_INTMASK | MSS_HUB_MSI_ERR_INTMASK |
+			MSS_HUB_POISON_RSP_INTMASK | MSS_HUB_RESTRICTED_ACCESS_ERR_INTMASK |
+			MSS_HUB_RESERVED_PA_ERR_INTMASK,
+	.hubc_intmask = MSS_HUB_HUBC_SCRUB_DONE_INTMASK,
+	.sbs_intmask = MSS_SBS_FILL_FIFO_ISO_OVERFLOW_INTMASK |
+			MSS_SBS_FILL_FIFO_SISO_OVERFLOW_INTMASK |
+			MSS_SBS_FILL_FIFO_NISO_OVERFLOW_INTMASK,
+	.mc_ch_intmask = WCAM_ERR_INTMASK,
 };
diff --git a/drivers/memory/tegra/tegra30.c b/drivers/memory/tegra/tegra30.c
index f22febcbee59..bae473527a57 100644
--- a/drivers/memory/tegra/tegra30.c
+++ b/drivers/memory/tegra/tegra30.c
@@ -1401,4 +1401,6 @@ const struct tegra_mc_soc tegra30_mc_soc = {
 	.icc_ops = &tegra30_mc_icc_ops,
 	.ops = &tegra30_mc_ops,
 	.mc_regs = &tegra20_mc_regs,
+	.mc_addr_hi_mask = 0x3,
+	.mc_err_status_type_mask = (0x7 << 28),
 };
diff --git a/include/soc/tegra/mc.h b/include/soc/tegra/mc.h
index 4a2cadbc0084..61943a3e6249 100644
--- a/include/soc/tegra/mc.h
+++ b/include/soc/tegra/mc.h
@@ -216,6 +216,13 @@ struct tegra_mc_soc {
 	const struct tegra_mc_icc_ops *icc_ops;
 	const struct tegra_mc_ops *ops;
 	const struct tegra_mc_regs *mc_regs;
+	unsigned int mc_addr_hi_mask;
+	unsigned int mc_err_status_type_mask;
+	u32 mcf_intmask;
+	u32 hub_intmask;
+	u32 hubc_intmask;
+	u32 sbs_intmask;
+	u32 mc_ch_intmask;
 };
 
 struct tegra_mc {
-- 
2.17.1



Return-Path: <linux-tegra+bounces-3289-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7B2953E93
	for <lists+linux-tegra@lfdr.de>; Fri, 16 Aug 2024 02:58:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D0430B252DA
	for <lists+linux-tegra@lfdr.de>; Fri, 16 Aug 2024 00:58:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14F0279DC7;
	Fri, 16 Aug 2024 00:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qUn83w8B"
X-Original-To: linux-tegra@vger.kernel.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2062.outbound.protection.outlook.com [40.107.212.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5416E168D0;
	Fri, 16 Aug 2024 00:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723769773; cv=fail; b=IJeLSrWN56uffsr8W+hnkWb5Pj0Pjs6swkfsXmQ9Kiv7MOY7CoPcB41EXbVFFpNEj+haGEWB6WKpDL3UF4LL423UvsLo7cDFc9Rn55g2Q3gfTVeQuWj1qkVbWyyoc+erIyOn4qajjCJqkPAXAJ4cnur3jseemKJXbWSHddfj+u8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723769773; c=relaxed/simple;
	bh=mzi/481lBuau0m0RJzeC1SqLHr0V2KN0fRSisRWE2A4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DwpeTWhBrtTn8kFIBtT21RNahZ//GiT/vJqaM6sR7cTlB1gqwRQquSxsbnRCB6Bpjx7VYswzdEj7+yq4uFUt3zHolYebdIW0yaUXdxnM5IvONdnvG2kLs8AuymawxFzahLIOiUXD/+o3laRSB/xIuHMWjbZKpnQQC+Vgn4cXFGQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qUn83w8B; arc=fail smtp.client-ip=40.107.212.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wmQr3MvXdhzF12cqHHzfAK/rftWBWZPBXzzmpYO916W7dsVOHCMS6965Cu+fXe7P67Z+Ho9juCbJ4hZX6mtku+o9QUhZXfo1tL2dyDrRY90UaPKZTdr6jUD1t20REzhEl/RJ2CwoYqsjmX2pq6qY9RvSnQl6JJtx62TQH2hYesM2wYeC7j+iEFlePMKG6yLeG2DAQvlsXJUHfW3yPw0T+qx7mdtSBhmB00yNjPgWLyeJYpBp1BJZt/oPXLZhdlEqA/tdek829VgOKB7OIcUQX+UUIUdHVnBSI0iqgLYGa5mwRYICV8G/Kd/6ogtstUBkdNH07a28r15hmIW0IQO8WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OgM8mtUpF+HBEIGp/Dx+04Cj5IJks/PE9RWP78E2fOw=;
 b=rrhjyEem/D2MVoF/CFa4fudh/CwqmSsUeqRBV4XljE7aajMQ0hWmYp47hHrCp5J6avt0u+0vBOzFBjZrrqDG+nm7zUieKKdk6B2/32l4VMvZJQPEbfGpDZaVjNqawahb9v7Wj4e3OY9jOqMo+I5FKpYGkjB+awRl5d00ywq5dUqwyyi1mcWXWTmMHeoc2QErzbmsOJBKTHb5atgDh+tfh4EcCz6Iwtted4sEz2grkPGyIqhH3wGO+EPfYav+X8OP72Wj6TjiDNpK9Fhhgvv59k8CrSY4OuB9fbOTRcoZWsVXFgP2+6woq/vF7/sc44GU3y+yKqXyenRTqNLBEi5+Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OgM8mtUpF+HBEIGp/Dx+04Cj5IJks/PE9RWP78E2fOw=;
 b=qUn83w8BDi2iiNMsQdoxcYguztW9neQstwdX1G+4A75GGa18KDEQS/Ajq8rWXN4YNETfR3dBf10dWnZMX50DKWtG/ph6Q0l1guzdMCPotTQRuUAbeVXcZ2oB9yN0SB0YzlDHX+KJ+SwZluRWU/8R40V8axhzKpZ84mcJuwcLIQRNMa1VnvQk1VoXVSjL+9NN7Vopjm5++ANbgpnZIlMmJkyYnF4R26wycdPSj2wb3peHX69D/6DIgBwCuyfziUymxq8MfzGBhKL8p8d7Oq//ug1bn9P1VpY5PMtyer4quSIEZ18w16IffalrnGF7XpW2tFz4ppvD42d/x7zE7A8LkQ==
Received: from SJ0PR05CA0190.namprd05.prod.outlook.com (2603:10b6:a03:330::15)
 by PH7PR12MB9127.namprd12.prod.outlook.com (2603:10b6:510:2f6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Fri, 16 Aug
 2024 00:56:03 +0000
Received: from CO1PEPF000075F3.namprd03.prod.outlook.com
 (2603:10b6:a03:330:cafe::4f) by SJ0PR05CA0190.outlook.office365.com
 (2603:10b6:a03:330::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.15 via Frontend
 Transport; Fri, 16 Aug 2024 00:56:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF000075F3.mail.protection.outlook.com (10.167.249.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.19 via Frontend Transport; Fri, 16 Aug 2024 00:56:02 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 15 Aug
 2024 17:55:47 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 15 Aug
 2024 17:55:47 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Thu, 15 Aug 2024 17:55:46 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>
CC: <robin.murphy@arm.com>, <joro@8bytes.org>, <jgg@nvidia.com>,
	<thierry.reding@gmail.com>, <vdumpa@nvidia.com>, <jonathanh@nvidia.com>,
	<linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-tegra@vger.kernel.org>
Subject: [PATCH v12 09/10] iommu/arm-smmu-v3: Add in-kernel support for NVIDIA Tegra241 (Grace) CMDQV
Date: Thu, 15 Aug 2024 17:55:30 -0700
Message-ID: <c342c29e51ce3a14c30bd1145a933f415a55b85f.1723754745.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1723754745.git.nicolinc@nvidia.com>
References: <cover.1723754745.git.nicolinc@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F3:EE_|PH7PR12MB9127:EE_
X-MS-Office365-Filtering-Correlation-Id: 39c28bc4-fd9a-48c7-981e-08dcbd8e33b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FBi4CQmNNiswTca80HfIh1YdvWynyWw8pJX8Sa0wqrj5aNZt2q+A81deJg+w?=
 =?us-ascii?Q?e3kGIASbUPJTzh9YzfRN+UCY3Hmxf1fuBekKgaqLZpT1zI4w2hHTb0SRv+0m?=
 =?us-ascii?Q?9famx5q1z9QIWp80XPcYkhWTvsRVPNfBETRNKtkkPKRAh0BGP0OgXnltvk0/?=
 =?us-ascii?Q?20tPA0LoQDaJW6QdMTuub7J302rXF4sTRXQnNVTJajVHAkFY0S1d6DGts5DS?=
 =?us-ascii?Q?/4JnL1Y1zrBkzt13rp26kywlAEKMv25syL/zZ9/jUKHlIMh7G0zvmLJxO/j0?=
 =?us-ascii?Q?5w1HX/1V3ZJrYXo8HedkqnqdymQkrkzFhCoAOsauxqn8ehJ4zuFMxScjbOZc?=
 =?us-ascii?Q?sAKzDYidocD/y6e5hJlxBaqmwMvpzc2UIm+OQKBAOGzjs3B3Lmlp6to27yie?=
 =?us-ascii?Q?4vI73kf2iGflJiNjDwGeOu8PGgNm3Nne/qIkTbaT+VWVrPx6KtLWtZnKUhyg?=
 =?us-ascii?Q?23+a7c0I077DU51TXx9MtrSg5GX1hZbJOmgSiI2o8rCKQ5rBf/aEbWJamf/e?=
 =?us-ascii?Q?eHrbw2L05EuIcXK19l5U13bliFD+VKwhVIKJv4EjfFMk6ODTrenXeWUQcRka?=
 =?us-ascii?Q?M+lL9qdH+RPl7fE7PhpdKZUtHDaZ94O99a50KZZAo5cOTqN/M6lvpOKvD+C7?=
 =?us-ascii?Q?hzpl8BywoVOvirWnTdO0j66LWnJovA13exdC4y+PiBMQmqJmy870uDIjvRZU?=
 =?us-ascii?Q?1tHiaqYhUvWlHe6qm05+AV0IrhG+sUN0qW2dIDUI07V/WQqSS9Tm5IHBjahg?=
 =?us-ascii?Q?MNTtwCy8+ALL4oXghzG6xH7RXzeDeU6Ov5OzLd3OjGT1Q4wcPvl9N1nKdTRS?=
 =?us-ascii?Q?L+UYhLStX3ERBjFAKINuUCMYoXN0dlM3xC4df7ut3xbjAITRCMxYIuJXZxZC?=
 =?us-ascii?Q?rosQa5iTUTR3xF5nTCp+UeSZxCmcqLRdCX3AdOAecVtXVTeddGkuK6L5Y/YX?=
 =?us-ascii?Q?bJvMDNk4P0zsm9zWYySYRUt37hjHZwqTmETTkl4IpAMOS21Ym8bctfRWhiZV?=
 =?us-ascii?Q?7Ujk4yEA7QX0ldCvnadXKK9AmB4MsEbtY2z2ox4FyK3kY0xoJpU+pcsDotXe?=
 =?us-ascii?Q?ak3G+6JkFydlEmQn+VLzhmHi5/byckX0idlLP8IUWu5vJOHm7TRddTW2157n?=
 =?us-ascii?Q?uQbFTldDfwDBYR9M/dcn8DGdjAITrqXBvKBX0CzQ42Crs6BgVsxoGpO2t7Aq?=
 =?us-ascii?Q?vYAaoonpFu/tqAeDaUQXoRxm0behH9te5JNdctHLY0ftyBvuWS2j6IMji6V+?=
 =?us-ascii?Q?1wsOymHCYy22f0U6K/7gyoMzeW5V5x8kIvBktBBD+aTIuwm05sT8wAiLwpVI?=
 =?us-ascii?Q?/O9KQFMgzqewd4HyKhqdazAwrVbBNmzcE0pZaPCTY6A6O6VmcDQkZgkrIxBG?=
 =?us-ascii?Q?3izI6KsxcjUCjbwY3HmReKDvDem6gJu3BN2Asg/6dHHxgJpRb0TOtK0Wyc9c?=
 =?us-ascii?Q?95OcvwqdtlFqeMpdQposF80nnEfAOyJE?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 00:56:02.9243
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39c28bc4-fd9a-48c7-981e-08dcbd8e33b3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075F3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9127

From: Nate Watterson <nwatterson@nvidia.com>

NVIDIA's Tegra241 Soc has a CMDQ-Virtualization (CMDQV) hardware, extending
the standard ARM SMMU v3 IP to support multiple VCMDQs with virtualization
capabilities. In terms of command queue, they are very like a standard SMMU
CMDQ (or ECMDQs), but only support CS_NONE in the CS field of CMD_SYNC.

Add a new tegra241-cmdqv driver, and insert its structure pointer into the
existing arm_smmu_device, and then add related function calls in the SMMUv3
driver to interact with the CMDQV driver.

In the CMDQV driver, add a minimal part for the in-kernel support: reserve
VINTF0 for in-kernel use, and assign some of the VCMDQs to the VINTF0, and
select one VCMDQ based on the current CPU ID to execute supported commands.
This multi-queue design for in-kernel use gives some limited improvements:
up to 20% reduction of invalidation time was measured by a multi-threaded
DMA unmap benchmark, compared to a single queue.

The other part of the CMDQV driver will be user-space support that gives a
hypervisor running on the host OS to talk to the driver for virtualization
use cases, allowing VMs to use VCMDQs without trappings, i.e. no VM Exits.
This is designed based on IOMMUFD, and its RFC series is also under review.
It will provide a guest OS a bigger improvement: 70% to 90% reductions of
TLB invalidation time were measured by DMA unmap tests running in a guest,
compared to nested SMMU CMDQ (with trappings).

As the initial version, the CMDQV driver only supports ACPI configurations.

Signed-off-by: Nate Watterson <nwatterson@nvidia.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Co-developed-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 MAINTAINERS                                   |   1 +
 drivers/iommu/Kconfig                         |  11 +
 drivers/iommu/arm/arm-smmu-v3/Makefile        |   1 +
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   |   2 +-
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  11 +
 .../iommu/arm/arm-smmu-v3/tegra241-cmdqv.c    | 872 ++++++++++++++++++
 6 files changed, 897 insertions(+), 1 deletion(-)
 create mode 100644 drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c

diff --git a/MAINTAINERS b/MAINTAINERS
index f328373463b0..dad28b828143 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22474,6 +22474,7 @@ M:	Thierry Reding <thierry.reding@gmail.com>
 R:	Krishna Reddy <vdumpa@nvidia.com>
 L:	linux-tegra@vger.kernel.org
 S:	Supported
+F:	drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
 F:	drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c
 F:	drivers/iommu/tegra*
 
diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index a82f10054aec..22addaedf64d 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -424,6 +424,17 @@ config ARM_SMMU_V3_KUNIT_TEST
 	  Enable this option to unit-test arm-smmu-v3 driver functions.
 
 	  If unsure, say N.
+
+config TEGRA241_CMDQV
+	bool "NVIDIA Tegra241 CMDQ-V extension support for ARM SMMUv3"
+	depends on ACPI
+	help
+	  Support for NVIDIA CMDQ-Virtualization extension for ARM SMMUv3. The
+	  CMDQ-V extension is similar to v3.3 ECMDQ for multi command queues
+	  support, except with virtualization capabilities.
+
+	  Say Y here if your system is NVIDIA Tegra241 (Grace) or it has the same
+	  CMDQ-V extension.
 endif
 
 config S390_IOMMU
diff --git a/drivers/iommu/arm/arm-smmu-v3/Makefile b/drivers/iommu/arm/arm-smmu-v3/Makefile
index 355173d1441d..dc98c88b48c8 100644
--- a/drivers/iommu/arm/arm-smmu-v3/Makefile
+++ b/drivers/iommu/arm/arm-smmu-v3/Makefile
@@ -2,5 +2,6 @@
 obj-$(CONFIG_ARM_SMMU_V3) += arm_smmu_v3.o
 arm_smmu_v3-y := arm-smmu-v3.o
 arm_smmu_v3-$(CONFIG_ARM_SMMU_V3_SVA) += arm-smmu-v3-sva.o
+arm_smmu_v3-$(CONFIG_TEGRA241_CMDQV) += tegra241-cmdqv.o
 
 obj-$(CONFIG_ARM_SMMU_V3_KUNIT_TEST) += arm-smmu-v3-test.o
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 2159455cd781..839db3bdcfc9 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -4481,7 +4481,7 @@ static struct arm_smmu_device *arm_smmu_impl_probe(struct arm_smmu_device *smmu)
 	struct arm_smmu_device *new_smmu = ERR_PTR(-ENODEV);
 	int ret;
 
-	/* Add impl probe */
+	new_smmu = tegra241_cmdqv_acpi_dsdt_probe(smmu);
 
 	if (new_smmu == ERR_PTR(-ENODEV))
 		return smmu;
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index 475517729307..7f1bd95f3f25 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -891,4 +891,15 @@ static inline void arm_smmu_sva_remove_dev_pasid(struct iommu_domain *domain,
 {
 }
 #endif /* CONFIG_ARM_SMMU_V3_SVA */
+
+#ifdef CONFIG_TEGRA241_CMDQV
+struct arm_smmu_device *
+tegra241_cmdqv_acpi_dsdt_probe(struct arm_smmu_device *smmu);
+#else /* CONFIG_TEGRA241_CMDQV */
+static inline struct arm_smmu_device *
+tegra241_cmdqv_acpi_dsdt_probe(struct arm_smmu_device *smmu)
+{
+	return ERR_PTR(-ENODEV);
+}
+#endif /* CONFIG_TEGRA241_CMDQV */
 #endif /* _ARM_SMMU_V3_H */
diff --git a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
new file mode 100644
index 000000000000..844c27cdc946
--- /dev/null
+++ b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
@@ -0,0 +1,872 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright (C) 2021-2024 NVIDIA CORPORATION & AFFILIATES. */
+
+#define dev_fmt(fmt) "tegra241_cmdqv: " fmt
+
+#include <linux/acpi.h>
+#include <linux/debugfs.h>
+#include <linux/dma-mapping.h>
+#include <linux/interrupt.h>
+#include <linux/iommu.h>
+#include <linux/iopoll.h>
+
+#include <acpi/acpixf.h>
+
+#include "arm-smmu-v3.h"
+
+#define TEGRA241_CMDQV_HID		"NVDA200C"
+
+/* CMDQV register page base and size defines */
+#define TEGRA241_CMDQV_CONFIG_BASE	(0)
+#define TEGRA241_CMDQV_CONFIG_SIZE	(SZ_64K)
+#define TEGRA241_VCMDQ_PAGE0_BASE	(TEGRA241_CMDQV_CONFIG_BASE + SZ_64K)
+#define TEGRA241_VCMDQ_PAGE1_BASE	(TEGRA241_VCMDQ_PAGE0_BASE + SZ_64K)
+#define TEGRA241_VINTF_PAGE_BASE	(TEGRA241_VCMDQ_PAGE1_BASE + SZ_64K)
+
+/* CMDQV global base regs */
+#define TEGRA241_CMDQV_CONFIG		0x0000
+#define  CMDQV_EN			BIT(0)
+
+#define TEGRA241_CMDQV_PARAM		0x0004
+#define  CMDQV_NUM_VINTF_LOG2		GENMASK(11, 8)
+#define  CMDQV_NUM_VCMDQ_LOG2		GENMASK(7, 4)
+
+#define TEGRA241_CMDQV_STATUS		0x0008
+#define  CMDQV_ENABLED			BIT(0)
+
+#define TEGRA241_CMDQV_VINTF_ERR_MAP	0x0014
+#define TEGRA241_CMDQV_VINTF_INT_MASK	0x001C
+#define TEGRA241_CMDQV_CMDQ_ERR_MAP(m)  (0x0024 + 0x4*(m))
+
+#define TEGRA241_CMDQV_CMDQ_ALLOC(q)	(0x0200 + 0x4*(q))
+#define  CMDQV_CMDQ_ALLOC_VINTF		GENMASK(20, 15)
+#define  CMDQV_CMDQ_ALLOC_LVCMDQ	GENMASK(7, 1)
+#define  CMDQV_CMDQ_ALLOCATED		BIT(0)
+
+/* VINTF base regs */
+#define TEGRA241_VINTF(v)		(0x1000 + 0x100*(v))
+
+#define TEGRA241_VINTF_CONFIG		0x0000
+#define  VINTF_HYP_OWN			BIT(17)
+#define  VINTF_VMID			GENMASK(16, 1)
+#define  VINTF_EN			BIT(0)
+
+#define TEGRA241_VINTF_STATUS		0x0004
+#define  VINTF_STATUS			GENMASK(3, 1)
+#define  VINTF_ENABLED			BIT(0)
+
+#define TEGRA241_VINTF_LVCMDQ_ERR_MAP_64(m) \
+					(0x00C0 + 0x8*(m))
+#define  LVCMDQ_ERR_MAP_NUM_64		2
+
+/* VCMDQ base regs */
+/* -- PAGE0 -- */
+#define TEGRA241_VCMDQ_PAGE0(q)		(TEGRA241_VCMDQ_PAGE0_BASE + 0x80*(q))
+
+#define TEGRA241_VCMDQ_CONS		0x00000
+#define  VCMDQ_CONS_ERR			GENMASK(30, 24)
+
+#define TEGRA241_VCMDQ_PROD		0x00004
+
+#define TEGRA241_VCMDQ_CONFIG		0x00008
+#define  VCMDQ_EN			BIT(0)
+
+#define TEGRA241_VCMDQ_STATUS		0x0000C
+#define  VCMDQ_ENABLED			BIT(0)
+
+#define TEGRA241_VCMDQ_GERROR		0x00010
+#define TEGRA241_VCMDQ_GERRORN		0x00014
+
+/* -- PAGE1 -- */
+#define TEGRA241_VCMDQ_PAGE1(q)		(TEGRA241_VCMDQ_PAGE1_BASE + 0x80*(q))
+#define  VCMDQ_ADDR			GENMASK(47, 5)
+#define  VCMDQ_LOG2SIZE			GENMASK(4, 0)
+#define  VCMDQ_LOG2SIZE_MAX		19
+
+#define TEGRA241_VCMDQ_BASE		0x00000
+#define TEGRA241_VCMDQ_CONS_INDX_BASE	0x00008
+
+/* VINTF logical-VCMDQ pages */
+#define TEGRA241_VINTFi_PAGE0(i)	(TEGRA241_VINTF_PAGE_BASE + SZ_128K*(i))
+#define TEGRA241_VINTFi_PAGE1(i)	(TEGRA241_VINTFi_PAGE0(i) + SZ_64K)
+#define TEGRA241_VINTFi_LVCMDQ_PAGE0(i, q) \
+					(TEGRA241_VINTFi_PAGE0(i) + 0x80*(q))
+#define TEGRA241_VINTFi_LVCMDQ_PAGE1(i, q) \
+					(TEGRA241_VINTFi_PAGE1(i) + 0x80*(q))
+
+/* MMIO helpers */
+#define REG_CMDQV(_cmdqv, _regname) \
+	((_cmdqv)->base + TEGRA241_CMDQV_##_regname)
+#define REG_VINTF(_vintf, _regname) \
+	((_vintf)->base + TEGRA241_VINTF_##_regname)
+#define REG_VCMDQ_PAGE0(_vcmdq, _regname) \
+	((_vcmdq)->page0 + TEGRA241_VCMDQ_##_regname)
+#define REG_VCMDQ_PAGE1(_vcmdq, _regname) \
+	((_vcmdq)->page1 + TEGRA241_VCMDQ_##_regname)
+
+
+static bool disable_cmdqv;
+module_param(disable_cmdqv, bool, 0444);
+MODULE_PARM_DESC(disable_cmdqv,
+	"This allows to disable CMDQV HW and use default SMMU internal CMDQ.");
+
+static bool bypass_vcmdq;
+module_param(bypass_vcmdq, bool, 0444);
+MODULE_PARM_DESC(bypass_vcmdq,
+	"This allows to bypass VCMDQ for debugging use or perf comparison.");
+
+/**
+ * struct tegra241_vcmdq - Virtual Command Queue
+ * @idx: Global index in the CMDQV
+ * @lidx: Local index in the VINTF
+ * @enabled: Enable status
+ * @cmdqv: Parent CMDQV pointer
+ * @vintf: Parent VINTF pointer
+ * @cmdq: Command Queue struct
+ * @page0: MMIO Page0 base address
+ * @page1: MMIO Page1 base address
+ */
+struct tegra241_vcmdq {
+	u16 idx;
+	u16 lidx;
+
+	bool enabled;
+
+	struct tegra241_cmdqv *cmdqv;
+	struct tegra241_vintf *vintf;
+	struct arm_smmu_cmdq cmdq;
+
+	void __iomem *page0;
+	void __iomem *page1;
+};
+
+/**
+ * struct tegra241_vintf - Virtual Interface
+ * @idx: Global index in the CMDQV
+ * @enabled: Enable status
+ * @cmdqv: Parent CMDQV pointer
+ * @lvcmdqs: List of logical VCMDQ pointers
+ * @base: MMIO base address
+ */
+struct tegra241_vintf {
+	u16 idx;
+
+	bool enabled;
+
+	struct tegra241_cmdqv *cmdqv;
+	struct tegra241_vcmdq **lvcmdqs;
+
+	void __iomem *base;
+};
+
+/**
+ * struct tegra241_cmdqv - CMDQ-V for SMMUv3
+ * @smmu: SMMUv3 device
+ * @base: MMIO base address
+ * @irq: IRQ number
+ * @num_vintfs: Total number of VINTFs
+ * @num_vcmdqs: Total number of VCMDQs
+ * @num_lvcmdqs_per_vintf: Number of logical VCMDQs per VINTF
+ * @vintf_ids: VINTF id allocator
+ * @vintfs: List of VINTFs
+ */
+struct tegra241_cmdqv {
+	struct arm_smmu_device smmu;
+
+	void __iomem *base;
+	int irq;
+
+	/* CMDQV Hardware Params */
+	u16 num_vintfs;
+	u16 num_vcmdqs;
+	u16 num_lvcmdqs_per_vintf;
+
+	struct ida vintf_ids;
+
+	struct tegra241_vintf **vintfs;
+};
+
+/* Config and Polling Helpers */
+
+static inline int tegra241_cmdqv_write_config(struct tegra241_cmdqv *cmdqv,
+					      void __iomem *addr_config,
+					      void __iomem *addr_status,
+					      u32 regval, const char *header,
+					      bool *out_enabled)
+{
+	bool en = regval & BIT(0);
+	int ret;
+
+	writel(regval, addr_config);
+	ret = readl_poll_timeout(addr_status, regval,
+				 en ? regval & BIT(0) : !(regval & BIT(0)),
+				 1, ARM_SMMU_POLL_TIMEOUT_US);
+	if (ret)
+		dev_err(cmdqv->smmu.dev, "%sfailed to %sable, STATUS=0x%08X\n",
+			header, en ? "en" : "dis", regval);
+	if (out_enabled)
+		WRITE_ONCE(*out_enabled, regval & BIT(0));
+	return ret;
+}
+
+static inline int cmdqv_write_config(struct tegra241_cmdqv *cmdqv, u32 regval)
+{
+	return tegra241_cmdqv_write_config(cmdqv,
+					   REG_CMDQV(cmdqv, CONFIG),
+					   REG_CMDQV(cmdqv, STATUS),
+					   regval, "CMDQV: ", NULL);
+}
+
+static inline int vintf_write_config(struct tegra241_vintf *vintf, u32 regval)
+{
+	char header[16];
+
+	snprintf(header, 16, "VINTF%u: ", vintf->idx);
+	return tegra241_cmdqv_write_config(vintf->cmdqv,
+					   REG_VINTF(vintf, CONFIG),
+					   REG_VINTF(vintf, STATUS),
+					   regval, header, &vintf->enabled);
+}
+
+static inline char *lvcmdq_error_header(struct tegra241_vcmdq *vcmdq,
+					char *header, int hlen)
+{
+	WARN_ON(hlen < 32);
+	if (WARN_ON(!vcmdq->vintf))
+		return "";
+	snprintf(header, hlen, "VINTF%u: VCMDQ%u/LVCMDQ%u: ",
+		 vcmdq->vintf->idx, vcmdq->idx, vcmdq->lidx);
+	return header;
+}
+
+static inline int vcmdq_write_config(struct tegra241_vcmdq *vcmdq, u32 regval)
+{
+	char header[32], *h = lvcmdq_error_header(vcmdq, header, 32);
+
+	return tegra241_cmdqv_write_config(vcmdq->cmdqv,
+					   REG_VCMDQ_PAGE0(vcmdq, CONFIG),
+					   REG_VCMDQ_PAGE0(vcmdq, STATUS),
+					   regval, h, &vcmdq->enabled);
+}
+
+/* ISR Functions */
+
+static void tegra241_vintf0_handle_error(struct tegra241_vintf *vintf)
+{
+	int i;
+
+	for (i = 0; i < LVCMDQ_ERR_MAP_NUM_64; i++) {
+		u64 map = readq_relaxed(REG_VINTF(vintf, LVCMDQ_ERR_MAP_64(i)));
+
+		while (map) {
+			unsigned long lidx = __ffs64(map) - 1;
+			struct tegra241_vcmdq *vcmdq = vintf->lvcmdqs[lidx];
+			u32 gerror = readl_relaxed(REG_VCMDQ_PAGE0(vcmdq, GERROR));
+
+			__arm_smmu_cmdq_skip_err(&vintf->cmdqv->smmu, &vcmdq->cmdq);
+			writel(gerror, REG_VCMDQ_PAGE0(vcmdq, GERRORN));
+			map &= ~BIT_ULL(lidx);
+		}
+	}
+}
+
+static irqreturn_t tegra241_cmdqv_isr(int irq, void *devid)
+{
+	struct tegra241_cmdqv *cmdqv = (struct tegra241_cmdqv *)devid;
+	void __iomem *reg_vintf_map = REG_CMDQV(cmdqv, VINTF_ERR_MAP);
+	char err_str[256];
+	u64 vintf_map;
+
+	/* Use readl_relaxed() as register addresses are not 64-bit aligned */
+	vintf_map = (u64)readl_relaxed(reg_vintf_map + 0x4) << 32 |
+		    (u64)readl_relaxed(reg_vintf_map);
+
+	snprintf(err_str, sizeof(err_str),
+		 "vintf_map: %016llx, vcmdq_map %08x:%08x:%08x:%08x", vintf_map,
+		 readl_relaxed(REG_CMDQV(cmdqv, CMDQ_ERR_MAP(3))),
+		 readl_relaxed(REG_CMDQV(cmdqv, CMDQ_ERR_MAP(2))),
+		 readl_relaxed(REG_CMDQV(cmdqv, CMDQ_ERR_MAP(1))),
+		 readl_relaxed(REG_CMDQV(cmdqv, CMDQ_ERR_MAP(0))));
+
+	dev_warn(cmdqv->smmu.dev, "unexpected error reported. %s\n", err_str);
+
+	/* Handle VINTF0 and its LVCMDQs */
+	if (vintf_map & BIT_ULL(0)) {
+		tegra241_vintf0_handle_error(cmdqv->vintfs[0]);
+		vintf_map &= ~BIT_ULL(0);
+	}
+
+	return IRQ_HANDLED;
+}
+
+/* Command Queue Function */
+
+static struct arm_smmu_cmdq *
+tegra241_cmdqv_get_cmdq(struct arm_smmu_device *smmu)
+{
+	struct tegra241_cmdqv *cmdqv =
+		container_of(smmu, struct tegra241_cmdqv, smmu);
+	struct tegra241_vintf *vintf = cmdqv->vintfs[0];
+	struct tegra241_vcmdq *vcmdq;
+	u16 lidx;
+
+	if (READ_ONCE(bypass_vcmdq))
+		return NULL;
+
+	/* Use SMMU CMDQ if VINTF0 is uninitialized */
+	if (!READ_ONCE(vintf->enabled))
+		return NULL;
+
+	/*
+	 * Select a LVCMDQ to use. Here we use a temporal solution to
+	 * balance out traffic on cmdq issuing: each cmdq has its own
+	 * lock, if all cpus issue cmdlist using the same cmdq, only
+	 * one CPU at a time can enter the process, while the others
+	 * will be spinning at the same lock.
+	 */
+	lidx = smp_processor_id() % cmdqv->num_lvcmdqs_per_vintf;
+	vcmdq = vintf->lvcmdqs[lidx];
+	if (!vcmdq || !READ_ONCE(vcmdq->enabled))
+		return NULL;
+	return &vcmdq->cmdq;
+}
+
+/* HW Reset Functions */
+
+static void tegra241_vcmdq_hw_deinit(struct tegra241_vcmdq *vcmdq)
+{
+	char header[32], *h = lvcmdq_error_header(vcmdq, header, 32);
+	u32 gerrorn, gerror;
+
+	if (vcmdq_write_config(vcmdq, 0)) {
+		dev_err(vcmdq->cmdqv->smmu.dev,
+			"%sGERRORN=0x%X, GERROR=0x%X, CONS=0x%X\n", h,
+			readl_relaxed(REG_VCMDQ_PAGE0(vcmdq, GERRORN)),
+			readl_relaxed(REG_VCMDQ_PAGE0(vcmdq, GERROR)),
+			readl_relaxed(REG_VCMDQ_PAGE0(vcmdq, CONS)));
+	}
+	writel_relaxed(0, REG_VCMDQ_PAGE0(vcmdq, PROD));
+	writel_relaxed(0, REG_VCMDQ_PAGE0(vcmdq, CONS));
+	writeq_relaxed(0, REG_VCMDQ_PAGE1(vcmdq, BASE));
+	writeq_relaxed(0, REG_VCMDQ_PAGE1(vcmdq, CONS_INDX_BASE));
+
+	gerrorn = readl_relaxed(REG_VCMDQ_PAGE0(vcmdq, GERRORN));
+	gerror = readl_relaxed(REG_VCMDQ_PAGE0(vcmdq, GERROR));
+	if (gerror != gerrorn) {
+		dev_warn(vcmdq->cmdqv->smmu.dev,
+			 "%suncleared error detected, resetting\n", h);
+		writel(gerror, REG_VCMDQ_PAGE0(vcmdq, GERRORN));
+	}
+
+	dev_dbg(vcmdq->cmdqv->smmu.dev, "%sdeinited\n", h);
+}
+
+static int tegra241_vcmdq_hw_init(struct tegra241_vcmdq *vcmdq)
+{
+	char header[32], *h = lvcmdq_error_header(vcmdq, header, 32);
+	int ret;
+
+	/* Reset VCMDQ */
+	tegra241_vcmdq_hw_deinit(vcmdq);
+
+	/* Configure and enable VCMDQ */
+	writeq_relaxed(vcmdq->cmdq.q.q_base, REG_VCMDQ_PAGE1(vcmdq, BASE));
+
+	ret = vcmdq_write_config(vcmdq, VCMDQ_EN);
+	if (ret) {
+		dev_err(vcmdq->cmdqv->smmu.dev,
+			"%sGERRORN=0x%X, GERROR=0x%X, CONS=0x%X\n", h,
+			readl_relaxed(REG_VCMDQ_PAGE0(vcmdq, GERRORN)),
+			readl_relaxed(REG_VCMDQ_PAGE0(vcmdq, GERROR)),
+			readl_relaxed(REG_VCMDQ_PAGE0(vcmdq, CONS)));
+		return ret;
+	}
+
+	dev_dbg(vcmdq->cmdqv->smmu.dev, "%sinited\n", h);
+	return 0;
+}
+
+static void tegra241_vintf_hw_deinit(struct tegra241_vintf *vintf)
+{
+	u16 lidx;
+
+	for (lidx = 0; lidx < vintf->cmdqv->num_lvcmdqs_per_vintf; lidx++)
+		if (vintf->lvcmdqs && vintf->lvcmdqs[lidx])
+			tegra241_vcmdq_hw_deinit(vintf->lvcmdqs[lidx]);
+	vintf_write_config(vintf, 0);
+}
+
+static int tegra241_vintf_hw_init(struct tegra241_vintf *vintf, bool hyp_own)
+{
+	u32 regval;
+	u16 lidx;
+	int ret;
+
+	/* Reset VINTF */
+	tegra241_vintf_hw_deinit(vintf);
+
+	/* Configure and enable VINTF */
+	regval = FIELD_PREP(VINTF_HYP_OWN, hyp_own);
+	writel(regval, REG_VINTF(vintf, CONFIG));
+
+	ret = vintf_write_config(vintf, regval | VINTF_EN);
+	if (ret)
+		return ret;
+
+	for (lidx = 0; lidx < vintf->cmdqv->num_lvcmdqs_per_vintf; lidx++) {
+		if (vintf->lvcmdqs && vintf->lvcmdqs[lidx]) {
+			ret = tegra241_vcmdq_hw_init(vintf->lvcmdqs[lidx]);
+			if (ret) {
+				tegra241_vintf_hw_deinit(vintf);
+				return ret;
+			}
+		}
+	}
+
+	return 0;
+}
+
+static int tegra241_cmdqv_hw_reset(struct arm_smmu_device *smmu)
+{
+	struct tegra241_cmdqv *cmdqv =
+		container_of(smmu, struct tegra241_cmdqv, smmu);
+	u16 qidx, lidx, idx;
+	u32 regval;
+	int ret;
+
+	/* Reset CMDQV */
+	regval = readl_relaxed(REG_CMDQV(cmdqv, CONFIG));
+	ret = cmdqv_write_config(cmdqv, regval & ~CMDQV_EN);
+	if (ret)
+		return ret;
+	ret = cmdqv_write_config(cmdqv, regval | CMDQV_EN);
+	if (ret)
+		return ret;
+
+	/* Assign preallocated global VCMDQs to each VINTF as LVCMDQs */
+	for (idx = 0, qidx = 0; idx < cmdqv->num_vintfs; idx++) {
+		for (lidx = 0; lidx < cmdqv->num_lvcmdqs_per_vintf; lidx++) {
+			regval  = FIELD_PREP(CMDQV_CMDQ_ALLOC_VINTF, idx);
+			regval |= FIELD_PREP(CMDQV_CMDQ_ALLOC_LVCMDQ, lidx);
+			regval |= CMDQV_CMDQ_ALLOCATED;
+			writel_relaxed(regval,
+				       REG_CMDQV(cmdqv, CMDQ_ALLOC(qidx++)));
+		}
+	}
+
+	return tegra241_vintf_hw_init(cmdqv->vintfs[0], true);
+}
+
+/* VCMDQ Resource Helpers */
+
+static void tegra241_vcmdq_free_smmu_cmdq(struct tegra241_vcmdq *vcmdq)
+{
+	struct arm_smmu_queue *q = &vcmdq->cmdq.q;
+	size_t nents = 1 << q->llq.max_n_shift;
+	size_t qsz = nents << CMDQ_ENT_SZ_SHIFT;
+
+	if (!q->base)
+		return;
+	dmam_free_coherent(vcmdq->cmdqv->smmu.dev, qsz, q->base, q->base_dma);
+}
+
+static int tegra241_vcmdq_alloc_smmu_cmdq(struct tegra241_vcmdq *vcmdq)
+{
+	struct arm_smmu_device *smmu = &vcmdq->cmdqv->smmu;
+	struct arm_smmu_cmdq *cmdq = &vcmdq->cmdq;
+	struct arm_smmu_queue *q = &cmdq->q;
+	char name[16];
+	int ret;
+
+	snprintf(name, 16, "vcmdq%u", vcmdq->idx);
+
+	q->llq.max_n_shift = VCMDQ_LOG2SIZE_MAX;
+
+	/* Use the common helper to init the VCMDQ, and then... */
+	ret = arm_smmu_init_one_queue(smmu, q, vcmdq->page0,
+				      TEGRA241_VCMDQ_PROD, TEGRA241_VCMDQ_CONS,
+				      CMDQ_ENT_DWORDS, name);
+	if (ret)
+		return ret;
+
+	/* ...override q_base to write VCMDQ_BASE registers */
+	q->q_base = q->base_dma & VCMDQ_ADDR;
+	q->q_base |= FIELD_PREP(VCMDQ_LOG2SIZE, q->llq.max_n_shift);
+
+	return arm_smmu_cmdq_init(smmu, cmdq);
+}
+
+/* VINTF Logical VCMDQ Resource Helpers */
+
+static void tegra241_vintf_deinit_lvcmdq(struct tegra241_vintf *vintf, u16 lidx)
+{
+	vintf->lvcmdqs[lidx] = NULL;
+}
+
+static int tegra241_vintf_init_lvcmdq(struct tegra241_vintf *vintf, u16 lidx,
+				      struct tegra241_vcmdq *vcmdq)
+{
+	struct tegra241_cmdqv *cmdqv = vintf->cmdqv;
+	u16 idx = vintf->idx;
+
+	vcmdq->idx = idx * cmdqv->num_lvcmdqs_per_vintf + lidx;
+	vcmdq->lidx = lidx;
+	vcmdq->cmdqv = cmdqv;
+	vcmdq->vintf = vintf;
+	vcmdq->page0 = cmdqv->base + TEGRA241_VINTFi_LVCMDQ_PAGE0(idx, lidx);
+	vcmdq->page1 = cmdqv->base + TEGRA241_VINTFi_LVCMDQ_PAGE1(idx, lidx);
+
+	vintf->lvcmdqs[lidx] = vcmdq;
+	return 0;
+}
+
+static void tegra241_vintf_free_lvcmdq(struct tegra241_vintf *vintf, u16 lidx)
+{
+	struct tegra241_vcmdq *vcmdq = vintf->lvcmdqs[lidx];
+	char header[32];
+
+	tegra241_vcmdq_free_smmu_cmdq(vcmdq);
+	tegra241_vintf_deinit_lvcmdq(vintf, lidx);
+
+	dev_dbg(vintf->cmdqv->smmu.dev,
+		"%sdeallocated\n", lvcmdq_error_header(vcmdq, header, 32));
+	kfree(vcmdq);
+}
+
+static struct tegra241_vcmdq *
+tegra241_vintf_alloc_lvcmdq(struct tegra241_vintf *vintf, u16 lidx)
+{
+	struct tegra241_cmdqv *cmdqv = vintf->cmdqv;
+	struct tegra241_vcmdq *vcmdq;
+	char header[32];
+	int ret;
+
+	vcmdq = kzalloc(sizeof(*vcmdq), GFP_KERNEL);
+	if (!vcmdq)
+		return ERR_PTR(-ENOMEM);
+
+	ret = tegra241_vintf_init_lvcmdq(vintf, lidx, vcmdq);
+	if (ret)
+		goto free_vcmdq;
+
+	/* Build an arm_smmu_cmdq for each LVCMDQ */
+	ret = tegra241_vcmdq_alloc_smmu_cmdq(vcmdq);
+	if (ret)
+		goto deinit_lvcmdq;
+
+	dev_dbg(cmdqv->smmu.dev,
+		"%sallocated\n", lvcmdq_error_header(vcmdq, header, 32));
+	return vcmdq;
+
+deinit_lvcmdq:
+	tegra241_vintf_deinit_lvcmdq(vintf, lidx);
+free_vcmdq:
+	kfree(vcmdq);
+	return ERR_PTR(ret);
+}
+
+/* VINTF Resource Helpers */
+
+static void tegra241_cmdqv_deinit_vintf(struct tegra241_cmdqv *cmdqv, u16 idx)
+{
+	kfree(cmdqv->vintfs[idx]->lvcmdqs);
+	ida_free(&cmdqv->vintf_ids, idx);
+	cmdqv->vintfs[idx] = NULL;
+}
+
+static int tegra241_cmdqv_init_vintf(struct tegra241_cmdqv *cmdqv, u16 max_idx,
+				     struct tegra241_vintf *vintf)
+{
+
+	u16 idx;
+	int ret;
+
+	ret = ida_alloc_max(&cmdqv->vintf_ids, max_idx, GFP_KERNEL);
+	if (ret < 0)
+		return ret;
+	idx = ret;
+
+	vintf->idx = idx;
+	vintf->cmdqv = cmdqv;
+	vintf->base = cmdqv->base + TEGRA241_VINTF(idx);
+
+	vintf->lvcmdqs = kcalloc(cmdqv->num_lvcmdqs_per_vintf,
+				 sizeof(*vintf->lvcmdqs), GFP_KERNEL);
+	if (!vintf->lvcmdqs) {
+		ida_free(&cmdqv->vintf_ids, idx);
+		return -ENOMEM;
+	}
+
+	cmdqv->vintfs[idx] = vintf;
+	return ret;
+}
+
+/* Remove Helpers */
+
+static void tegra241_vintf_remove_lvcmdq(struct tegra241_vintf *vintf, u16 lidx)
+{
+	tegra241_vcmdq_hw_deinit(vintf->lvcmdqs[lidx]);
+	tegra241_vintf_free_lvcmdq(vintf, lidx);
+}
+
+static void tegra241_cmdqv_remove_vintf(struct tegra241_cmdqv *cmdqv, u16 idx)
+{
+	struct tegra241_vintf *vintf = cmdqv->vintfs[idx];
+	u16 lidx;
+
+	/* Remove LVCMDQ resources */
+	for (lidx = 0; lidx < vintf->cmdqv->num_lvcmdqs_per_vintf; lidx++)
+		if (vintf->lvcmdqs[lidx])
+			tegra241_vintf_remove_lvcmdq(vintf, lidx);
+
+	/* Remove VINTF resources */
+	tegra241_vintf_hw_deinit(vintf);
+
+	dev_dbg(cmdqv->smmu.dev, "VINTF%u: deallocated\n", vintf->idx);
+	tegra241_cmdqv_deinit_vintf(cmdqv, idx);
+	kfree(vintf);
+}
+
+static void tegra241_cmdqv_remove(struct arm_smmu_device *smmu)
+{
+	struct tegra241_cmdqv *cmdqv =
+		container_of(smmu, struct tegra241_cmdqv, smmu);
+	u16 idx;
+
+	/* Remove VINTF resources */
+	for (idx = 0; idx < cmdqv->num_vintfs; idx++) {
+		if (cmdqv->vintfs[idx]) {
+			/* Only vintf0 should remain at this stage */
+			WARN_ON(idx > 0);
+			tegra241_cmdqv_remove_vintf(cmdqv, idx);
+		}
+	}
+
+	/* Remove cmdqv resources */
+	ida_destroy(&cmdqv->vintf_ids);
+
+	if (cmdqv->irq > 0)
+		free_irq(cmdqv->irq, cmdqv);
+	iounmap(cmdqv->base);
+	kfree(cmdqv->vintfs);
+}
+
+static struct arm_smmu_impl_ops tegra241_cmdqv_impl_ops = {
+	.get_secondary_cmdq = tegra241_cmdqv_get_cmdq,
+	.device_reset = tegra241_cmdqv_hw_reset,
+	.device_remove = tegra241_cmdqv_remove,
+};
+
+/* Probe Functions */
+
+static int tegra241_cmdqv_acpi_is_memory(struct acpi_resource *res, void *data)
+{
+	struct resource_win win;
+
+	return !acpi_dev_resource_address_space(res, &win);
+}
+
+static int tegra241_cmdqv_acpi_get_irqs(struct acpi_resource *ares, void *data)
+{
+	struct resource r;
+	int *irq = data;
+
+	if (*irq <= 0 && acpi_dev_resource_interrupt(ares, 0, &r))
+		*irq = r.start;
+	return 1; /* No need to add resource to the list */
+}
+
+static struct resource *
+tegra241_cmdqv_find_acpi_resource(struct arm_smmu_device *smmu, int *irq)
+{
+	struct device *dev = smmu->dev;
+	struct list_head resource_list;
+	struct resource_entry *rentry;
+	struct acpi_iort_node *node;
+	struct resource *res = NULL;
+	struct acpi_device *adev;
+	const char *match_uid;
+	int ret;
+
+	if (acpi_disabled || dev->of_node)
+		return NULL;
+
+	node = arm_smmu_get_iort_node(smmu);
+
+	/* Look for a device in the DSDT whose _UID matches the SMMU node ID */
+	match_uid = kasprintf(GFP_KERNEL, "%u", node->identifier);
+	adev = acpi_dev_get_first_match_dev(TEGRA241_CMDQV_HID, match_uid, -1);
+	kfree(match_uid);
+
+	if (!adev)
+		return NULL;
+
+	dev_info(dev, "found companion CMDQV device, %s\n",
+		 dev_name(&adev->dev));
+
+	INIT_LIST_HEAD(&resource_list);
+	ret = acpi_dev_get_resources(adev, &resource_list,
+				     tegra241_cmdqv_acpi_is_memory, NULL);
+	if (ret < 0) {
+		dev_err(dev, "failed to get memory resource: %d\n", ret);
+		goto put_dev;
+	}
+
+	rentry = list_first_entry_or_null(&resource_list,
+					  struct resource_entry, node);
+	if (!rentry) {
+		dev_err(dev, "failed to get memory resource entry\n");
+		goto free_list;
+	}
+
+	/* Caller must free the res */
+	res = kzalloc(sizeof(*res), GFP_KERNEL);
+	if (!res)
+		goto free_list;
+
+	*res = *rentry->res;
+
+	acpi_dev_free_resource_list(&resource_list);
+
+	INIT_LIST_HEAD(&resource_list);
+
+	if (irq)
+		ret = acpi_dev_get_resources(adev, &resource_list,
+					     tegra241_cmdqv_acpi_get_irqs, irq);
+	if (ret < 0 || !irq || *irq <= 0)
+		dev_warn(dev, "no interrupt. errors will not be reported\n");
+
+free_list:
+	acpi_dev_free_resource_list(&resource_list);
+put_dev:
+	put_device(&adev->dev);
+
+	return res;
+}
+
+struct dentry *cmdqv_debugfs_dir;
+
+static struct arm_smmu_device *
+tegra241_cmdqv_probe(struct arm_smmu_device *smmu, struct resource *res, int irq)
+{
+	static struct arm_smmu_device *new_smmu;
+	struct tegra241_cmdqv *cmdqv = NULL;
+	struct tegra241_vintf *vintf;
+	void __iomem *base;
+	u32 regval;
+	int lidx;
+	int ret;
+
+	static_assert(offsetof(struct tegra241_cmdqv, smmu) == 0);
+
+	base = ioremap(res->start, resource_size(res));
+	if (IS_ERR(base)) {
+		dev_err(smmu->dev, "failed to ioremap: %ld\n", PTR_ERR(base));
+		goto iounmap;
+	}
+
+	regval = readl(base + TEGRA241_CMDQV_CONFIG);
+	if (disable_cmdqv) {
+		dev_info(smmu->dev, "Detected disable_cmdqv=true\n");
+		writel(regval & ~CMDQV_EN, base + TEGRA241_CMDQV_CONFIG);
+		goto iounmap;
+	}
+
+	cmdqv = devm_krealloc(smmu->dev, smmu, sizeof(*cmdqv), GFP_KERNEL);
+	if (!cmdqv)
+		goto iounmap;
+	new_smmu = &cmdqv->smmu;
+
+	cmdqv->irq = irq;
+	cmdqv->base = base;
+
+	if (cmdqv->irq > 0) {
+		ret = request_irq(irq, tegra241_cmdqv_isr, 0, "tegra241-cmdqv",
+				  cmdqv);
+		if (ret) {
+			dev_err(smmu->dev, "failed to request irq (%d): %d\n",
+				cmdqv->irq, ret);
+			goto iounmap;
+		}
+	}
+
+	regval = readl_relaxed(REG_CMDQV(cmdqv, PARAM));
+	cmdqv->num_vintfs = 1 << FIELD_GET(CMDQV_NUM_VINTF_LOG2, regval);
+	cmdqv->num_vcmdqs = 1 << FIELD_GET(CMDQV_NUM_VCMDQ_LOG2, regval);
+	cmdqv->num_lvcmdqs_per_vintf = cmdqv->num_vcmdqs / cmdqv->num_vintfs;
+
+	cmdqv->vintfs =
+		kcalloc(cmdqv->num_vintfs, sizeof(*cmdqv->vintfs), GFP_KERNEL);
+	if (!cmdqv->vintfs)
+		goto free_irq;
+
+	ida_init(&cmdqv->vintf_ids);
+
+	vintf = kzalloc(sizeof(*vintf), GFP_KERNEL);
+	if (!vintf)
+		goto destroy_ids;
+
+	/* Init VINTF0 for in-kernel use */
+	ret = tegra241_cmdqv_init_vintf(cmdqv, 0, vintf);
+	if (ret) {
+		dev_err(smmu->dev, "failed to init vintf0: %d\n", ret);
+		goto free_vintf;
+	}
+
+	/* Preallocate logical VCMDQs to VINTF0 */
+	for (lidx = 0; lidx < cmdqv->num_lvcmdqs_per_vintf; lidx++) {
+		struct tegra241_vcmdq *vcmdq;
+
+		vcmdq = tegra241_vintf_alloc_lvcmdq(vintf, lidx);
+		if (IS_ERR(vcmdq))
+			goto free_lvcmdq;
+	}
+
+#ifdef CONFIG_IOMMU_DEBUGFS
+	if (!cmdqv_debugfs_dir) {
+		cmdqv_debugfs_dir =
+			debugfs_create_dir("tegra241_cmdqv", iommu_debugfs_dir);
+		debugfs_create_bool("bypass_vcmdq", 0644, cmdqv_debugfs_dir,
+				    &bypass_vcmdq);
+	}
+#endif
+
+	new_smmu->impl_ops = &tegra241_cmdqv_impl_ops;
+	new_smmu->options |= ARM_SMMU_OPT_SECONDARY_CMDQ_CS_NONE_ONLY;
+
+	return new_smmu;
+
+free_lvcmdq:
+	for (lidx--; lidx >= 0; lidx--)
+		tegra241_vintf_free_lvcmdq(vintf, lidx);
+	tegra241_cmdqv_deinit_vintf(cmdqv, vintf->idx);
+free_vintf:
+	kfree(vintf);
+destroy_ids:
+	ida_destroy(&cmdqv->vintf_ids);
+	kfree(cmdqv->vintfs);
+free_irq:
+	if (cmdqv->irq > 0)
+		free_irq(cmdqv->irq, cmdqv);
+iounmap:
+	iounmap(base);
+	dev_info(smmu->dev, "Falling back to standard SMMU CMDQ\n");
+	return ERR_PTR(-ENODEV);
+}
+
+struct arm_smmu_device *
+tegra241_cmdqv_acpi_dsdt_probe(struct arm_smmu_device *smmu)
+{
+	struct arm_smmu_device *new_smmu;
+	struct resource *res;
+	int irq;
+
+	/* Keep the pointer smmu intact if !res */
+	res = tegra241_cmdqv_find_acpi_resource(smmu, &irq);
+	if (!res)
+		return ERR_PTR(-ENODEV);
+
+	new_smmu = tegra241_cmdqv_probe(smmu, res, irq);
+	kfree(res);
+	return new_smmu;
+}
-- 
2.43.0



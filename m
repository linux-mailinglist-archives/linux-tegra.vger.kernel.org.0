Return-Path: <linux-tegra+bounces-2660-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FAD905DE9
	for <lists+linux-tegra@lfdr.de>; Wed, 12 Jun 2024 23:46:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9BFABB21261
	for <lists+linux-tegra@lfdr.de>; Wed, 12 Jun 2024 21:46:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D616012C54B;
	Wed, 12 Jun 2024 21:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OqOzLYo+"
X-Original-To: linux-tegra@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2088.outbound.protection.outlook.com [40.107.223.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD44312BF2B;
	Wed, 12 Jun 2024 21:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718228765; cv=fail; b=bER3FldIG9AK/6QHWvFJ9V16pkBYcrw+w7YxVeeABk0/I3q8gMQTwL238MUgNVS2XI7DYIb0RMhZOf0WAuRkRMeR8NXwLNoNj8acbz20nkz0iK48fMmy6+OJVbhJpLrL4zrhjrSaBep5CKzsCSUMIXeyWDfU/QRQQnU0+VmUcRE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718228765; c=relaxed/simple;
	bh=WCoXOeqXUKIk8zNcFr46/IgU6OxyfVXD1Y4rxNjUfA0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e96WQF9N8hQvDNi2bCKqg5rANxSbhrVPXnWR2Wd65HpYwYVSXvJT5CjxsQUs4ho0FiVxcKvvebWjvSVZ9UXYClDUO73M9DbwV9wbw+xDfRzvc6S/KZXJrUtOPSNTOQPyCDoWMtq3c/o80sof61WAjTCjD2XfTlPhPu8Tt796DH4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OqOzLYo+; arc=fail smtp.client-ip=40.107.223.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d54Jp/VoLJWl1rBq27wqm0uAS357Y+iloR91oQSfnjzx26S51FDLEAPHcYXn/gMAssZayXms6fvtmhdrt1Q+c3H1jA3XO/Ea6H907zT+SjXZAyzUORdNqCLpAXGZRlBx4R0ddtynu7QxsFVQwFasmEmDG9zc/53F8fh62inbQlk5BxOaY3oHIzQaHObqcxkiZYnTWFXTgWGsOAFRjWSzpW0RU0AKaAusvFWLyHLZ4sOvBipBIAyQZ6FTT9yDwA0hiIIkmIa06/jrltjgVPMNWWS8P3Ug0YQopFdlVgu0lMJ8x7bENVbyC+tyguhm2lsCyOEzvqwgNz/NboOuvKqNdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EDjvstGW4KHxF1+n7J6gbHerjJexZTgEHYoQ3OuaUk8=;
 b=KIhtsgx5fk9isA/G9rNCrA/vtGQpnN4fHiGQMrOLPnN74ITvSl+17bXnQPn8lB4/qlpBhLLdY5H1ZKmkjJg8VBiheASdWBaFfC9n9swvxl/iLQ8hK1xVeqjKnOZSPHEYcpMp/bhMfzYZb3OMH2nCbLhvXZTzh4CbsZ4QSAOHXMckQKQCb3ivnZVPVVN2gdPJmGsB2LyUSKXbsngmRv2FNoTWJC4SVnTu3lyBiM9EmXAK73qVSqNTy6feCon8FFLozzeNVsRMfMC3HsyqR4PK+3yaYvtpCstw/ienfbJ8FgwU4j4jRl1ThxUv2T2X5uT/Cr0hvEFU6bOUhv4UaQFj6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EDjvstGW4KHxF1+n7J6gbHerjJexZTgEHYoQ3OuaUk8=;
 b=OqOzLYo+e/PvKvw0FsI+1txp8wwTmGO2mmjs62Ezj1XYq5HdNt5xBVi1huznndRAJ9EnywuX2UnUrqaEbqrq3JqMW752y+tZMXd1nNRDRI/hZ1TxkYCoA2KwDMikdxLWJtzPJPfNXDDUOnw723Rulgda3zzxPMQjrKaJWFVa1osT2MrKm5KyE0k8i135KlogLW16hkht0E9c4Q/D1mrEp/6FYvAhC3SUGowFcZUZGwn0QnYcdCoUmBGB0IncVCiwc2joSrnY8ykkSpONXgUT/kD6IjhfPG0/R0hzESd5b3ZMeafdKlRxeuobtfCopAzk2LwnVV53XM0OAyw2gfaYwA==
Received: from SA1P222CA0025.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:22c::10)
 by SA1PR12MB6702.namprd12.prod.outlook.com (2603:10b6:806:252::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.38; Wed, 12 Jun
 2024 21:45:57 +0000
Received: from SA2PEPF00003AEB.namprd02.prod.outlook.com
 (2603:10b6:806:22c:cafe::5d) by SA1P222CA0025.outlook.office365.com
 (2603:10b6:806:22c::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.20 via Frontend
 Transport; Wed, 12 Jun 2024 21:45:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SA2PEPF00003AEB.mail.protection.outlook.com (10.167.248.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.15 via Frontend Transport; Wed, 12 Jun 2024 21:45:57 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 12 Jun
 2024 14:45:45 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Wed, 12 Jun 2024 14:45:45 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Wed, 12 Jun 2024 14:45:44 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>, <robin.murphy@arm.com>
CC: <joro@8bytes.org>, <jgg@nvidia.com>, <thierry.reding@gmail.com>,
	<vdumpa@nvidia.com>, <jonathanh@nvidia.com>, <linux-kernel@vger.kernel.org>,
	<iommu@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-tegra@vger.kernel.org>
Subject: [PATCH v9 5/6] iommu/arm-smmu-v3: Add in-kernel support for NVIDIA Tegra241 (Grace) CMDQV
Date: Wed, 12 Jun 2024 14:45:32 -0700
Message-ID: <d74b091a1216421ab8431f4c684242cd70ef0b77.1718228494.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1718228494.git.nicolinc@nvidia.com>
References: <cover.1718228494.git.nicolinc@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AEB:EE_|SA1PR12MB6702:EE_
X-MS-Office365-Filtering-Correlation-Id: 3272c0dc-ae5d-4b60-eabd-08dc8b290b44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230034|36860700007|376008|1800799018|82310400020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QLqY+hlbl2xvv2eIExxm9PGRbx0VLl4EZW7gDG48tJ2P6mWZRlicyVgQrFTp?=
 =?us-ascii?Q?QpRjXbtx8ef8WSICtojewOU39BccTMWdA5/4Nzt5O9iRro9+00VtaGrywR8L?=
 =?us-ascii?Q?7PqzueHNcvypFM6hVFns7Nsm6BE/T6so3Oa5CN4gDiQjglpfHZDQ6WFWt199?=
 =?us-ascii?Q?jVRRR+mnCj1hwYRMzepgo/s020zGBrH7Fe8rkbDLTExPEV3R9asqNpx0tSwx?=
 =?us-ascii?Q?VwJHG1uhYkKlGHnKrdDJPI7wnDh1cVjREONqWwivzU44up4vxRkaZpmefA8s?=
 =?us-ascii?Q?QC+zU93aM3svwAOv68M2q+vCD8hZjFlabWzDB3s1nsNWiSjM6xRG0mAi82xL?=
 =?us-ascii?Q?JvRvlJq+MkF2tvKTybFUpesEB/oh4jConZE8dO/qgVPPqQd6Aeej/0tR2m0m?=
 =?us-ascii?Q?mXvPLrtNG8G2UShzOO+SN8XR33ct33dRCcbiNjODgYxsgWRVCZSYQ9gfTEKs?=
 =?us-ascii?Q?KyJrWZC+HouvkBGxwgsQAOwR8Nq3lOPZvqDYGReRa92KX2bYpM3ENJoiwamN?=
 =?us-ascii?Q?P05248R8qM3zyMEs60RaHvG9Bi6CyREYfzR8vLoCDFm19fZcJNDL1hFC/Wn+?=
 =?us-ascii?Q?OUcEO9xPYeyJY/cZWYVfKdH0/TISWFWRX33d3DHncoJ87OpR7DIf2DdBYI7L?=
 =?us-ascii?Q?0k9nyjrHppxFbkfZduhaRbuK5APo224dx0+HzMw+gqtJYALDvXo9Bc+iUCce?=
 =?us-ascii?Q?EnXIQ4YMa0c86GGifZnHPr01VuCctqMUnIE8lRnYZ38b81NunH94jIrEjY5z?=
 =?us-ascii?Q?skurUpV0WoIl2Zv9VSu2G7Kn9WnWz0CH/nv6g4r9J7T038AcpKdotHoVLSh9?=
 =?us-ascii?Q?duw+p8Tsg/np54XB/2l0qYdKnXkRQxA0ZFh9YlH6cINa7HcoHlGQ4A7h61bX?=
 =?us-ascii?Q?DYxELM5XHJAos4wieaxb50XvkXnawjbuMUplXtzikiaCpaLk/1YQyFoHd/b4?=
 =?us-ascii?Q?eNON9ruW0Oe8skG30eB95GIBMXYLQhbNjJEahdfnbF2I2UU1KDAiRicvhL7P?=
 =?us-ascii?Q?GA0jlGeMD+Xw1AJRXknj29R9MWoT1XyzTnBdTOamrM9kA7Fbfeg9KO7S6k0l?=
 =?us-ascii?Q?zzugIYEAEVnBGJsUodVHNKnwjnq2OeFzBNBIx8lycxjjATb3I0IoYyQr96nt?=
 =?us-ascii?Q?Bx727htNnv8Ag9X6JmroZkdCtnypzCykFUAK5l2hTH0gCkUr8iOCl/vtHWRX?=
 =?us-ascii?Q?Iq+CZoL0bzKmuHuyPiJPDYTRC95w55lvmSsKySsd5S5G2tsc+Zc/aeZk2Kut?=
 =?us-ascii?Q?uOF/OH8PXmGn1t71kGTp51SFUGeQWfx/R4sw3Pc8AEojIo+dNeeOlIe8VeWS?=
 =?us-ascii?Q?EKzVRR21NmcsSUZ/5HFj85ewnkplSp77Ayhqm4jZPKEZrBQH+NeM/0SW1nVL?=
 =?us-ascii?Q?BFD8690BnxFr3SSlXM7JL1AuyVESguxsRrM3S9sNIZ8hcy1KIA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230034)(36860700007)(376008)(1800799018)(82310400020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2024 21:45:57.7503
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3272c0dc-ae5d-4b60-eabd-08dc8b290b44
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AEB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6702

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

However, it is very important for this in-kernel support to get merged and
installed to VMs running on Grace-powered servers as soon as possible. So,
later those servers would only need to upgrade their host kernels for the
user-space support.

As the initial version, the CMDQV driver only supports ACPI configurations.

Signed-off-by: Nate Watterson <nwatterson@nvidia.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Co-developed-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 MAINTAINERS                                   |   1 +
 drivers/iommu/Kconfig                         |  11 +
 drivers/iommu/arm/arm-smmu-v3/Makefile        |   1 +
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   |  52 +-
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  50 ++
 .../iommu/arm/arm-smmu-v3/tegra241-cmdqv.c    | 842 ++++++++++++++++++
 6 files changed, 945 insertions(+), 12 deletions(-)
 create mode 100644 drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c

diff --git a/MAINTAINERS b/MAINTAINERS
index aacccb376c28..ecf7af1b2df8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22078,6 +22078,7 @@ M:	Thierry Reding <thierry.reding@gmail.com>
 R:	Krishna Reddy <vdumpa@nvidia.com>
 L:	linux-tegra@vger.kernel.org
 S:	Supported
+F:	drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
 F:	drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c
 F:	drivers/iommu/tegra*
 
diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index c04584be3089..e009387d3cba 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -423,6 +423,17 @@ config ARM_SMMU_V3_KUNIT_TEST
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
index 014a997753a8..55201fdd7007 100644
--- a/drivers/iommu/arm/arm-smmu-v3/Makefile
+++ b/drivers/iommu/arm/arm-smmu-v3/Makefile
@@ -2,6 +2,7 @@
 obj-$(CONFIG_ARM_SMMU_V3) += arm_smmu_v3.o
 arm_smmu_v3-objs-y += arm-smmu-v3.o
 arm_smmu_v3-objs-$(CONFIG_ARM_SMMU_V3_SVA) += arm-smmu-v3-sva.o
+arm_smmu_v3-objs-$(CONFIG_TEGRA241_CMDQV) += tegra241-cmdqv.o
 arm_smmu_v3-objs := $(arm_smmu_v3-objs-y)
 
 obj-$(CONFIG_ARM_SMMU_V3_KUNIT_TEST) += arm-smmu-v3-test.o
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index ba0e24d5ffbf..430e84fe3679 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -334,6 +334,9 @@ static int arm_smmu_cmdq_build_cmd(u64 *cmd, struct arm_smmu_cmdq_ent *ent)
 
 static struct arm_smmu_cmdq *arm_smmu_get_cmdq(struct arm_smmu_device *smmu)
 {
+	if (arm_smmu_has_tegra241_cmdqv(smmu))
+		return tegra241_cmdqv_get_cmdq(smmu);
+
 	return &smmu->cmdq;
 }
 
@@ -3591,6 +3594,15 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
 		return ret;
 	}
 
+	if (arm_smmu_has_tegra241_cmdqv(smmu)) {
+		ret = tegra241_cmdqv_device_reset(smmu);
+		if (ret) {
+			dev_warn(smmu->dev,
+				 "tegra241_cmdqv: falling back to cmdq\n");
+			tegra241_cmdqv_device_remove(smmu);
+		}
+	}
+
 	/* Invalidate any cached configuration */
 	cmd.opcode = CMDQ_OP_CFGI_ALL;
 	arm_smmu_cmdq_issue_cmd_with_sync(smmu, &cmd);
@@ -3959,6 +3971,8 @@ static int arm_smmu_device_acpi_probe(struct platform_device *pdev,
 	if (iort_smmu->flags & ACPI_IORT_SMMU_V3_COHACC_OVERRIDE)
 		smmu->features |= ARM_SMMU_FEAT_COHERENCY;
 
+	smmu->tegra241_cmdqv = tegra241_cmdqv_acpi_probe(smmu, node);
+
 	return 0;
 }
 #else
@@ -4063,11 +4077,14 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 
 	/* Base address */
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res)
-		return -EINVAL;
+	if (!res) {
+		ret = -EINVAL;
+		goto out;
+	}
 	if (resource_size(res) < arm_smmu_resource_size(smmu)) {
 		dev_err(dev, "MMIO region too small (%pr)\n", res);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto out;
 	}
 	ioaddr = res->start;
 
@@ -4076,14 +4093,18 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 	 * the PMCG registers which are reserved by the PMU driver.
 	 */
 	smmu->base = arm_smmu_ioremap(dev, ioaddr, ARM_SMMU_REG_SZ);
-	if (IS_ERR(smmu->base))
-		return PTR_ERR(smmu->base);
+	if (IS_ERR(smmu->base)) {
+		ret = PTR_ERR(smmu->base);
+		goto out;
+	}
 
 	if (arm_smmu_resource_size(smmu) > SZ_64K) {
 		smmu->page1 = arm_smmu_ioremap(dev, ioaddr + SZ_64K,
 					       ARM_SMMU_REG_SZ);
-		if (IS_ERR(smmu->page1))
-			return PTR_ERR(smmu->page1);
+		if (IS_ERR(smmu->page1)) {
+			ret = PTR_ERR(smmu->page1);
+			goto out;
+		}
 	} else {
 		smmu->page1 = smmu->base;
 	}
@@ -4109,12 +4130,12 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 	/* Probe the h/w */
 	ret = arm_smmu_device_hw_probe(smmu);
 	if (ret)
-		return ret;
+		goto out;
 
 	/* Initialise in-memory data structures */
 	ret = arm_smmu_init_structures(smmu);
 	if (ret)
-		return ret;
+		goto out;
 
 	/* Record our private device structure */
 	platform_set_drvdata(pdev, smmu);
@@ -4125,28 +4146,35 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 	/* Reset the device */
 	ret = arm_smmu_device_reset(smmu);
 	if (ret)
-		return ret;
+		goto out;
 
 	/* And we're up. Go go go! */
 	ret = iommu_device_sysfs_add(&smmu->iommu, dev, NULL,
 				     "smmu3.%pa", &ioaddr);
 	if (ret)
-		return ret;
+		goto out;
 
 	ret = iommu_device_register(&smmu->iommu, &arm_smmu_ops, dev);
 	if (ret) {
 		dev_err(dev, "Failed to register iommu\n");
 		iommu_device_sysfs_remove(&smmu->iommu);
-		return ret;
+		goto out;
 	}
 
 	return 0;
+
+out:
+	if (arm_smmu_has_tegra241_cmdqv(smmu))
+		tegra241_cmdqv_device_remove(smmu);
+	return ret;
 }
 
 static void arm_smmu_device_remove(struct platform_device *pdev)
 {
 	struct arm_smmu_device *smmu = platform_get_drvdata(pdev);
 
+	if (arm_smmu_has_tegra241_cmdqv(smmu))
+		tegra241_cmdqv_device_remove(smmu);
 	iommu_device_unregister(&smmu->iommu);
 	iommu_device_sysfs_remove(&smmu->iommu);
 	arm_smmu_device_disable(smmu);
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index 01227c0de290..604e26a292e7 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -14,6 +14,9 @@
 #include <linux/mmzone.h>
 #include <linux/sizes.h>
 
+struct acpi_iort_node;
+struct tegra241_cmdqv;
+
 /* MMIO registers */
 #define ARM_SMMU_IDR0			0x0
 #define IDR0_ST_LVL			GENMASK(28, 27)
@@ -685,6 +688,12 @@ struct arm_smmu_device {
 
 	struct rb_root			streams;
 	struct mutex			streams_mutex;
+
+	/*
+	 * Pointer to NVIDIA Tegra241 CMDQ-Virtualization Extension support,
+	 * similar to v3.3 ECMDQ except with virtualization capabilities.
+	 */
+	struct tegra241_cmdqv		*tegra241_cmdqv;
 };
 
 struct arm_smmu_stream {
@@ -859,4 +868,45 @@ static inline void arm_smmu_sva_remove_dev_pasid(struct iommu_domain *domain,
 {
 }
 #endif /* CONFIG_ARM_SMMU_V3_SVA */
+
+#ifdef CONFIG_TEGRA241_CMDQV
+static inline bool arm_smmu_has_tegra241_cmdqv(struct arm_smmu_device *smmu)
+{
+	return !!smmu->tegra241_cmdqv;
+}
+
+struct tegra241_cmdqv *tegra241_cmdqv_acpi_probe(struct arm_smmu_device *smmu,
+						 struct acpi_iort_node *node);
+void tegra241_cmdqv_device_remove(struct arm_smmu_device *smmu);
+int tegra241_cmdqv_device_reset(struct arm_smmu_device *smmu);
+struct arm_smmu_cmdq *tegra241_cmdqv_get_cmdq(struct arm_smmu_device *smmu);
+#else /* CONFIG_TEGRA241_CMDQV */
+static inline bool arm_smmu_has_tegra241_cmdqv(struct arm_smmu_device *smmu)
+{
+	return false;
+}
+
+static inline struct tegra241_cmdqv *
+tegra241_cmdqv_acpi_probe(struct arm_smmu_device *smmu,
+			  struct acpi_iort_node *node)
+{
+	return NULL;
+}
+
+static inline void tegra241_cmdqv_device_remove(struct arm_smmu_device *smmu)
+{
+}
+
+static inline int tegra241_cmdqv_device_reset(struct arm_smmu_device *smmu)
+{
+	return -ENODEV;
+}
+
+static inline struct arm_smmu_cmdq *
+tegra241_cmdqv_get_cmdq(struct arm_smmu_device *smmu)
+{
+	return NULL;
+}
+#endif /* CONFIG_TEGRA241_CMDQV */
+
 #endif /* _ARM_SMMU_V3_H */
diff --git a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
new file mode 100644
index 000000000000..1a2680d31c3d
--- /dev/null
+++ b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
@@ -0,0 +1,842 @@
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
+#define TEGRA241_CMDQV_CMDQ_ERR_MAP_64(m) \
+					(0x0024 + 0x8*(m))
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
+ * @smmu: Parent SMMUv3 pointer
+ * @base: MMIO base address
+ * @irq: IRQ number
+ * @num_vintfs: Total number of VINTFs
+ * @num_vcmdqs: Total number of VCMDQs
+ * @num_lvcmdqs_per_vintf: Number of logical VCMDQs per VINTF
+ * @vintf_ids: VINTF id allocator
+ * @vtinfs: List of VINTFs
+ */
+struct tegra241_cmdqv {
+	struct arm_smmu_device *smmu;
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
+		dev_err(cmdqv->smmu->dev, "%sfailed to %sable, STATUS=0x%08X\n",
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
+			__arm_smmu_cmdq_skip_err(vintf->cmdqv->smmu,
+						 &vcmdq->cmdq.q);
+			writel(gerror, REG_VCMDQ_PAGE0(vcmdq, GERRORN));
+			map &= ~BIT_ULL(lidx);
+		}
+	}
+}
+
+static irqreturn_t tegra241_cmdqv_isr(int irq, void *devid)
+{
+	struct tegra241_cmdqv *cmdqv = (struct tegra241_cmdqv *)devid;
+	u64 vintf_map = readq_relaxed(REG_CMDQV(cmdqv, VINTF_ERR_MAP));
+
+	dev_warn(cmdqv->smmu->dev,
+		 "unexpected error reported. vintf_map: %016llx, vcmdq_map: %016llx%016llx\n",
+		 vintf_map, readq_relaxed(REG_CMDQV(cmdqv, CMDQ_ERR_MAP_64(1))),
+		 readq_relaxed(REG_CMDQV(cmdqv, CMDQ_ERR_MAP_64(0))));
+
+	/* Handle VINTF0 and its LVCMDQs */
+	if (vintf_map & BIT_ULL(0))
+		tegra241_vintf0_handle_error(cmdqv->vintfs[0]);
+
+	return IRQ_HANDLED;
+}
+
+/* Command Queue Selecting Function */
+
+struct arm_smmu_cmdq *tegra241_cmdqv_get_cmdq(struct arm_smmu_device *smmu)
+{
+	struct tegra241_cmdqv *cmdqv = smmu->tegra241_cmdqv;
+	struct tegra241_vintf *vintf = cmdqv->vintfs[0];
+	struct tegra241_vcmdq *vcmdq;
+	u16 lidx;
+
+	if (READ_ONCE(bypass_vcmdq))
+		return &smmu->cmdq;
+
+	/* Use SMMU CMDQ if VINTF0 is uninitialized */
+	if (!READ_ONCE(vintf->enabled))
+		return &smmu->cmdq;
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
+		return &smmu->cmdq;
+	return &vcmdq->cmdq;
+}
+
+/* Device Reset (HW init/deinit) Functions */
+
+static void tegra241_vcmdq_hw_deinit(struct tegra241_vcmdq *vcmdq)
+{
+	char header[32], *h = lvcmdq_error_header(vcmdq, header, 32);
+	u32 gerrorn, gerror;
+
+	if (vcmdq_write_config(vcmdq, 0)) {
+		dev_err(vcmdq->cmdqv->smmu->dev,
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
+		dev_warn(vcmdq->cmdqv->smmu->dev,
+			 "%suncleared error detected, resetting\n", h);
+		writel(gerror, REG_VCMDQ_PAGE0(vcmdq, GERRORN));
+	}
+
+	dev_dbg(vcmdq->cmdqv->smmu->dev, "%sdeinited\n", h);
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
+		dev_err(vcmdq->cmdqv->smmu->dev,
+			"%sGERRORN=0x%X, GERROR=0x%X, CONS=0x%X\n", h,
+			readl_relaxed(REG_VCMDQ_PAGE0(vcmdq, GERRORN)),
+			readl_relaxed(REG_VCMDQ_PAGE0(vcmdq, GERROR)),
+			readl_relaxed(REG_VCMDQ_PAGE0(vcmdq, CONS)));
+		return ret;
+	}
+
+	dev_dbg(vcmdq->cmdqv->smmu->dev, "%sinited\n", h);
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
+int tegra241_cmdqv_device_reset(struct arm_smmu_device *smmu)
+{
+	struct tegra241_cmdqv *cmdqv = smmu->tegra241_cmdqv;
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
+static struct tegra241_cmdqv *
+tegra241_cmdqv_find_resource(struct arm_smmu_device *smmu,
+			     struct acpi_iort_node *node)
+{
+	struct tegra241_cmdqv *cmdqv = NULL;
+	struct device *dev = smmu->dev;
+	struct list_head resource_list;
+	struct resource_entry *rentry;
+	struct acpi_device *adev;
+	const char *match_uid;
+	int ret;
+
+	if (acpi_disabled)
+		return NULL;
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
+	cmdqv = kzalloc(sizeof(*cmdqv), GFP_KERNEL);
+	if (!cmdqv)
+		goto free_list;
+
+	cmdqv->smmu = smmu;
+
+	rentry = list_first_entry_or_null(&resource_list,
+					  struct resource_entry, node);
+	if (!rentry) {
+		dev_err(dev, "failed to get memory resource entry\n");
+		goto free_cmdqv;
+	}
+
+	cmdqv->base = ioremap(rentry->res->start, resource_size(rentry->res));
+	if (IS_ERR(cmdqv->base)) {
+		dev_err(dev, "failed to ioremap: %ld\n", PTR_ERR(cmdqv->base));
+		goto free_cmdqv;
+	}
+
+	acpi_dev_free_resource_list(&resource_list);
+
+	INIT_LIST_HEAD(&resource_list);
+
+	ret = acpi_dev_get_resources(adev, &resource_list,
+				     tegra241_cmdqv_acpi_get_irqs, &cmdqv->irq);
+	if (ret < 0 || cmdqv->irq <= 0) {
+		dev_warn(dev, "no interrupt. errors will not be reported\n");
+	} else {
+		ret = request_irq(cmdqv->irq, tegra241_cmdqv_isr, 0,
+				  "tegra241-cmdqv", cmdqv);
+		if (ret) {
+			dev_err(dev, "failed to request irq (%d): %d\n",
+				cmdqv->irq, ret);
+			goto iounmap;
+		}
+	}
+
+	goto free_list;
+
+iounmap:
+	iounmap(cmdqv->base);
+free_cmdqv:
+	kfree(cmdqv);
+	cmdqv = NULL;
+free_list:
+	acpi_dev_free_resource_list(&resource_list);
+put_dev:
+	put_device(&adev->dev);
+
+	return cmdqv;
+}
+
+static int tegra241_vcmdq_alloc_smmu_cmdq(struct tegra241_vcmdq *vcmdq)
+{
+	struct arm_smmu_device *smmu = vcmdq->cmdqv->smmu;
+	struct arm_smmu_cmdq *cmdq = &vcmdq->cmdq;
+	struct arm_smmu_queue *q = &cmdq->q;
+	char name[16];
+	int ret;
+
+	snprintf(name, 16, "vcmdq%u", vcmdq->idx);
+
+	q->llq.max_n_shift = ilog2(SZ_64K >> CMDQ_ENT_SZ_SHIFT);
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
+	/* All VCMDQs support CS_NONE only for CMD_SYNC */
+	q->quirks = CMDQ_QUIRK_SYNC_CS_NONE_ONLY;
+
+	return arm_smmu_cmdq_init(smmu, cmdq);
+}
+
+static void tegra241_vcmdq_free_smmu_cmdq(struct tegra241_vcmdq *vcmdq)
+{
+	struct arm_smmu_queue *q = &vcmdq->cmdq.q;
+	size_t nents = 1 << q->llq.max_n_shift;
+	size_t qsz = nents << CMDQ_ENT_SZ_SHIFT;
+
+	if (!q->base)
+		return;
+	dmam_free_coherent(vcmdq->cmdqv->smmu->dev, qsz, q->base, q->base_dma);
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
+static void tegra241_vintf_deinit_lvcmdq(struct tegra241_vintf *vintf, u16 lidx)
+{
+	vintf->lvcmdqs[lidx] = NULL;
+}
+
+static struct tegra241_vcmdq *
+tegra241_vintf0_alloc_lvcmdq(struct tegra241_vintf *vintf, u16 lidx)
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
+	dev_dbg(cmdqv->smmu->dev,
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
+static void tegra241_vintf_free_lvcmdq(struct tegra241_vintf *vintf, u16 lidx)
+{
+	struct tegra241_vcmdq *vcmdq = vintf->lvcmdqs[lidx];
+	char header[32];
+
+	tegra241_vcmdq_free_smmu_cmdq(vcmdq);
+	tegra241_vintf_deinit_lvcmdq(vintf, lidx);
+
+	dev_dbg(vintf->cmdqv->smmu->dev,
+		"%sdeallocated\n", lvcmdq_error_header(vcmdq, header, 32));
+	kfree(vcmdq);
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
+				sizeof(*vintf->lvcmdqs), GFP_KERNEL);
+	if (!vintf->lvcmdqs) {
+		ida_free(&cmdqv->vintf_ids, idx);
+		return -ENOMEM;
+	}
+
+	cmdqv->vintfs[idx] = vintf;
+	return ret;
+}
+
+static void tegra241_cmdqv_deinit_vintf(struct tegra241_cmdqv *cmdqv, u16 idx)
+{
+	kfree(cmdqv->vintfs[idx]->lvcmdqs);
+	ida_free(&cmdqv->vintf_ids, idx);
+	cmdqv->vintfs[idx] = NULL;
+}
+
+struct dentry *cmdqv_debugfs_dir;
+
+static int tegra241_cmdqv_probe(struct tegra241_cmdqv *cmdqv)
+{
+	struct tegra241_vintf *vintf;
+	u32 regval;
+	u16 lidx;
+	int ret;
+
+	regval = readl(REG_CMDQV(cmdqv, CONFIG));
+	if (disable_cmdqv) {
+		dev_info(cmdqv->smmu->dev,
+			 "disable_cmdqv=true. Falling back to SMMU CMDQ\n");
+		cmdqv_write_config(cmdqv, regval & ~CMDQV_EN);
+		return -ENODEV;
+	}
+
+	ret = cmdqv_write_config(cmdqv, regval | CMDQV_EN);
+	if (ret)
+		return ret;
+
+	regval = readl_relaxed(REG_CMDQV(cmdqv, PARAM));
+	cmdqv->num_vintfs = 1 << FIELD_GET(CMDQV_NUM_VINTF_LOG2, regval);
+	cmdqv->num_vcmdqs = 1 << FIELD_GET(CMDQV_NUM_VCMDQ_LOG2, regval);
+	cmdqv->num_lvcmdqs_per_vintf = cmdqv->num_vcmdqs / cmdqv->num_vintfs;
+
+	cmdqv->vintfs = kcalloc(cmdqv->num_vintfs,
+				sizeof(*cmdqv->vintfs), GFP_KERNEL);
+	if (!cmdqv->vintfs)
+		return -ENOMEM;
+	ida_init(&cmdqv->vintf_ids);
+
+	vintf = kzalloc(sizeof(*vintf), GFP_KERNEL);
+	if (!vintf) {
+		ret = -ENOMEM;
+		goto destroy_ids;
+	}
+
+	/* Init VINTF0 for in-kernel use */
+	ret = tegra241_cmdqv_init_vintf(cmdqv, 0, vintf);
+	if (ret) {
+		dev_err(cmdqv->smmu->dev, "failed to init vintf0: %d\n", ret);
+		goto free_vintf;
+	}
+
+	/* Preallocate logical VCMDQs to VINTF0 */
+	for (lidx = 0; lidx < cmdqv->num_lvcmdqs_per_vintf; lidx++) {
+		struct tegra241_vcmdq *vcmdq;
+
+		vcmdq = tegra241_vintf0_alloc_lvcmdq(vintf, lidx);
+		if (IS_ERR(vcmdq)) {
+			ret = PTR_ERR(vcmdq);
+			goto free_lvcmdq;
+		}
+	}
+
+#ifdef CONFIG_IOMMU_DEBUGFS
+	if (!cmdqv_debugfs_dir) {
+		cmdqv_debugfs_dir =
+			debugfs_create_dir("tegra241_cmdqv", iommu_debugfs_dir);
+		debugfs_create_bool("bypass_vcmdq", 0644,
+				    cmdqv_debugfs_dir, &bypass_vcmdq);
+	}
+#endif
+
+	return 0;
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
+	return ret;
+}
+
+struct tegra241_cmdqv *tegra241_cmdqv_acpi_probe(struct arm_smmu_device *smmu,
+						 struct acpi_iort_node *node)
+{
+	struct tegra241_cmdqv *cmdqv;
+
+	cmdqv = tegra241_cmdqv_find_resource(smmu, node);
+	if (!cmdqv)
+		return NULL;
+
+	if (tegra241_cmdqv_probe(cmdqv)) {
+		if (cmdqv->irq > 0)
+			free_irq(cmdqv->irq, cmdqv);
+		iounmap(cmdqv->base);
+		kfree(cmdqv);
+		return NULL;
+	}
+
+	return cmdqv;
+}
+
+/* Remove Functions */
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
+	ida_free(&cmdqv->vintf_ids, vintf->idx);
+	cmdqv->vintfs[idx] = NULL;
+
+	dev_dbg(cmdqv->smmu->dev, "VINTF%u: deallocated\n", vintf->idx);
+	kfree(vintf->lvcmdqs);
+	kfree(vintf);
+}
+
+void tegra241_cmdqv_device_remove(struct arm_smmu_device *smmu)
+{
+	struct tegra241_cmdqv *cmdqv = smmu->tegra241_cmdqv;
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
+	smmu->tegra241_cmdqv = NULL;
+
+	if (cmdqv->irq > 0)
+		free_irq(cmdqv->irq, cmdqv);
+	iounmap(cmdqv->base);
+	kfree(cmdqv->vintfs);
+	kfree(cmdqv);
+}
-- 
2.43.0



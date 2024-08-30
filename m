Return-Path: <linux-tegra+bounces-3564-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4278E965305
	for <lists+linux-tegra@lfdr.de>; Fri, 30 Aug 2024 00:36:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 68B4B1C22483
	for <lists+linux-tegra@lfdr.de>; Thu, 29 Aug 2024 22:36:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD61D1BC9FB;
	Thu, 29 Aug 2024 22:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RuPTJ41t"
X-Original-To: linux-tegra@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2065.outbound.protection.outlook.com [40.107.94.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965CA1BBBE4;
	Thu, 29 Aug 2024 22:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724970912; cv=fail; b=hpqhj2UOXj3K3DsK8lmT3zebSqsvx+7CeoB2VM+6IyV4+8X0g2AR+6hYV24GWtrTWsgmmhn5fNydDmn4OMQEWaAuf1HMCoKuD/zIdUOSB9AeFIV0jCXVNKr4SxfUxMwCBKAxWz8JobLnR5t/SQywdffl+HjfAV/DGysNRhOlvUI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724970912; c=relaxed/simple;
	bh=LaZvTic+/c2Wm+eoLn/UudvUWlzg6zzAjz9Zb5h4sPs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tDkesq3+PVSmU8x8ZiRYxVJaL7g2ru46gi1J+1n/hhNfodLqyKyJvTozQuW8ZkoAXjkh6uytO5dzXaaxDbx7eWzlhnmcsZFe9Cgx55333es649NZ6flZaLzr0fnVAq+ZA2fKbZIiBo5yBQ06r5HmKQM5l2T9zFhXKYXtbj0MgpM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RuPTJ41t; arc=fail smtp.client-ip=40.107.94.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SA+4DGar2UkgJaRG227OIYwp1Nh3eCXAQZZy+bnFvk7S57wThDIArAXvXmfjL32HN2J6BGgHU/+2GhVE/KJ5aeEqHWVxup1TJyF/BGnrUgOgIuI4XG9DSdqHxYuxiNKGZnWGJjJ8d2JKjTgvhiINt3+X5epYqJ/RaI+dcFPcQX9ZxWAn22pk2FCknOgdq1RRa/SA+ujMVH+R5b4M5c709ik9UxnT6U2XFY9T2ZztF4pwqoxgeVNY6Oja7Xr2cPqx+UZJVI3pWkxP//m/AgaSCOo3lQu74NqnLz5JcjPwZm+92afjKyxQvFScBtCQlgNs3pWapl2q1ERuz9oHAkfVig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iMKoCTzmDCS43d2v1KXyIvR+OyoGzPkViGY+VcFcEq8=;
 b=a5ApluKFsALX3i4ENRcAt4ht0ko2DYpsFVM2IUC8mA0lkGNgjZmAZMo2ISelAB+McyoEdw45jSkTUlLV2a94inxZJ5cHl8acmOcKooOySYmhJKcMX7t+45BpCf2GUsk0AGQBy23FamGXfiqQg+rEFxs3mYmEwBIADUJF8EYHAHimbERBzg3lYTUaPk5wMAJ0cDRXVJrF2Tbafm6kFUV2lfH8b73uQP/aMaWGoP+T2fcaC1R4yUZ8CZdBLsJSiz7BzdiI+tN/6LUnoOi6NtTWHh59ZXxEbn5sOkLJeO5HKcH3nKqR6VCFQWKEX3vvwXA3hmqLR9b/qMPBwWJHFIjONw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iMKoCTzmDCS43d2v1KXyIvR+OyoGzPkViGY+VcFcEq8=;
 b=RuPTJ41thWwEhLH2pyJwZNUfqFseu0JDhUOc2CnGHWkPBVpUNgA5uExB9xyZZ9CpPNvnon+ZgLazQ6vef+XTIW38IOMx1FseTeYGXlnEicPK/BSyVdeGoRnPF44p/DcnfTnTjo8bLcYjAsOsK/2Irf9DiHP8S/1I5Dx2cakqkDM7YC1y7BklFI4QYr3BKky4GEeqc5iRb4nH519hyxiF7br4h+Md4Eb5vuuooC031M4kJHlzznK/li44u4R10wd8pcyCu3OrEhe94vwliGMZARVcXa8epnFvJ7fmeysqtMouJzbvYUA2y4u2iOwDIxZQlkYRtad1uLeZAS3t5ZkIRw==
Received: from CH2PR14CA0029.namprd14.prod.outlook.com (2603:10b6:610:60::39)
 by DM4PR12MB7503.namprd12.prod.outlook.com (2603:10b6:8:111::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Thu, 29 Aug
 2024 22:35:03 +0000
Received: from CH3PEPF0000000F.namprd04.prod.outlook.com
 (2603:10b6:610:60:cafe::75) by CH2PR14CA0029.outlook.office365.com
 (2603:10b6:610:60::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28 via Frontend
 Transport; Thu, 29 Aug 2024 22:35:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH3PEPF0000000F.mail.protection.outlook.com (10.167.244.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.13 via Frontend Transport; Thu, 29 Aug 2024 22:35:02 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 29 Aug
 2024 15:34:52 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 29 Aug
 2024 15:34:51 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Thu, 29 Aug 2024 15:34:51 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>
CC: <robin.murphy@arm.com>, <joro@8bytes.org>, <jgg@nvidia.com>,
	<thierry.reding@gmail.com>, <vdumpa@nvidia.com>, <jonathanh@nvidia.com>,
	<linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-tegra@vger.kernel.org>
Subject: [PATCH v14 08/10] iommu/arm-smmu-v3: Add in-kernel support for NVIDIA Tegra241 (Grace) CMDQV
Date: Thu, 29 Aug 2024 15:34:37 -0700
Message-ID: <dce50490b2c10b7254fb36aa73ed7ffd812b283a.1724970714.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1724970714.git.nicolinc@nvidia.com>
References: <cover.1724970714.git.nicolinc@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000F:EE_|DM4PR12MB7503:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a6dfd0d-7e31-402a-db02-08dcc87ad2e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mUEDwhnKskbgO3YwgUpQqaySoYkHVr8P2JD4f14FirmXGnjMv60B6wCBKnoZ?=
 =?us-ascii?Q?BD/yMoVqyq/v3Yitbz2XQXvwJU7UsWiAXWiKCA87DM6o0TGkgjfU+mEdxmuZ?=
 =?us-ascii?Q?m5YswLrsTXAbYhZWVaG9k8/yGKwPrHG7m6d1LgbzLQLhDz1n19f+1J7DJqS3?=
 =?us-ascii?Q?bhSTERyZclifi8viA19XKJvh0uKE4HCqqwFpBnUVOAc54hzq+HsnATDVsuo3?=
 =?us-ascii?Q?Ug+mt/850AnaSwz7V7hcEoOA4Udy7HgYBpHEtQ1Qz2gHZ4gQGkUt1FQ+0EIu?=
 =?us-ascii?Q?1h8CK5vd4T8uKcVFZP+52AdpdjyDekGej18XJwtPEsXdbG6soKGQG6m+5AmU?=
 =?us-ascii?Q?ULHqaHby3R79/mvcPxJh7qLSVo4WS/W9XVmHedTCrry0IbO2DHD8j+yQtP8P?=
 =?us-ascii?Q?vW0pzrmR4UsU7a0eRty8HBk3QOxaVTZ5BVtZ21H2IoC5YK03wY5zj/IIu+ov?=
 =?us-ascii?Q?42hPSkpld4vFJuuUj1EZH2nU6jMDQgj0UNMRZiWH/8f4v7eVNckHshWk431r?=
 =?us-ascii?Q?Gt5JAie55EQw4kXPWFPBvwKav131mfQTa+qAu/KSFIjPF0wWXBydOYDMxmzh?=
 =?us-ascii?Q?vfDMwTksceJf8BWjexIU0VfN+CAeuWJs74JgXddELTZvKsQgkIUA50jf0DQf?=
 =?us-ascii?Q?f8XnU014G9Ay7fO8lB0LWtgcMAsws3M+rA4ui8fOD2iAOwk1o4d5dzuHcVlc?=
 =?us-ascii?Q?awkARls/9JbaANWVd4rq8azEn9P0cIc3Wdffa2LLqh6BuXOUjR6fL+Q3W/yq?=
 =?us-ascii?Q?bxSsziV0k/cGvAHrDWULddnwspjJ5miBb/4Nwis7f4uldNJejxJHwd37fu2a?=
 =?us-ascii?Q?glbIDaCEtB+4id8r0SXbXj8tfLJFlwLgs9/9h1Khc21C/wErpTTatELUmPkp?=
 =?us-ascii?Q?X3oWTE10SA/CNWx6rbXbb1KZ3cUYvufeSpCbThp2kA8FbHzHPpzUt94bbe4M?=
 =?us-ascii?Q?6h8FUnTXeSANRNf4mVU+vkHQmwykPfHKFfYCAee8/Svp2Y/8tXoUMuOzpfnZ?=
 =?us-ascii?Q?Y2EiIEWkdMXxWKu4lIUI4c2Q7hGGMGdCjqrFX6AbXAMYyEVQ6E+oePNinxaa?=
 =?us-ascii?Q?KDHAmttzmy/10y4KgmU32Xx78Cb+54gKI6tlsCk+YtfrIa4zCno6CTUlJ/TS?=
 =?us-ascii?Q?teWmfNATJccWCkb1XSnukuPkkQkAFrBNN4uZfIycyBmhSbYQWjGBhKjK0u/J?=
 =?us-ascii?Q?0/XWLvgUdZSJHYo0X1cU2x9NSbuUixhW9vX/h/+8700+IEiKNFcYtGbLfQ58?=
 =?us-ascii?Q?sJeI8Phy1z7Nn/8k4Sy0Gnr1emg8rVvQ0Yz9fTD8ulnJ/dbuRyR8A6/RxImx?=
 =?us-ascii?Q?u9ywmRipVRuW33F54GuGdm0INaYClsgeXE3wBDIagg9FKWZYoaaQPXN5A4pv?=
 =?us-ascii?Q?Upt2ULxmVBmVAP4KSFgWiMgmg7R4eWWaoe7FOPLlwOYMtTd/bthIK6hLXSPe?=
 =?us-ascii?Q?/WxXR9JE6ZOyNTltRZt6FHV5pw5730Us?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 22:35:02.7631
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a6dfd0d-7e31-402a-db02-08dcc87ad2e1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7503

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
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   |  28 +-
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  11 +
 .../iommu/arm/arm-smmu-v3/tegra241-cmdqv.c    | 858 ++++++++++++++++++
 6 files changed, 909 insertions(+), 1 deletion(-)
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
index ca7b037f4eae..9e71e404fd7f 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -4354,6 +4354,26 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
 }
 
 #ifdef CONFIG_ACPI
+static void acpi_smmu_dsdt_probe_tegra241_cmdqv(struct acpi_iort_node *node,
+						struct arm_smmu_device *smmu)
+{
+#ifdef CONFIG_TEGRA241_CMDQV
+	const char *uid = kasprintf(GFP_KERNEL, "%u", node->identifier);
+	struct acpi_device *adev;
+
+	/* Look for an NVDA200C node whose _UID matches the SMMU node ID */
+	adev = acpi_dev_get_first_match_dev("NVDA200C", uid, -1);
+	if (adev) {
+		/* Tegra241 CMDQV driver is responsible for put_device() */
+		smmu->impl_dev = &adev->dev;
+		smmu->options |= ARM_SMMU_OPT_TEGRA241_CMDQV;
+		dev_info(smmu->dev, "found companion CMDQV device: %s\n",
+			 dev_name(smmu->impl_dev));
+	}
+	kfree(uid);
+#endif
+}
+
 static int acpi_smmu_iort_probe_model(struct acpi_iort_node *node,
 				      struct arm_smmu_device *smmu)
 {
@@ -4368,6 +4388,11 @@ static int acpi_smmu_iort_probe_model(struct acpi_iort_node *node,
 		smmu->options |= ARM_SMMU_OPT_SKIP_PREFETCH;
 		break;
 	case ACPI_IORT_SMMU_V3_GENERIC:
+		/*
+		 * Tegra241 implementation stores its SMMU options and impl_dev
+		 * in DSDT. Thus, go through the ACPI tables unconditionally.
+		 */
+		acpi_smmu_dsdt_probe_tegra241_cmdqv(node, smmu);
 		break;
 	default:
 		dev_err(smmu->dev, "Unknown/unsupported IORT model!\n");
@@ -4500,7 +4525,8 @@ static struct arm_smmu_device *arm_smmu_impl_probe(struct arm_smmu_device *smmu)
 	struct arm_smmu_device *new_smmu = ERR_PTR(-ENODEV);
 	int ret;
 
-	/* Add impl probe */
+	if (smmu->impl_dev && (smmu->options & ARM_SMMU_OPT_TEGRA241_CMDQV))
+		new_smmu = tegra241_cmdqv_probe(smmu);
 
 	if (new_smmu == ERR_PTR(-ENODEV))
 		return smmu;
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index 8d7a95b0dbd9..9fa22ee2383d 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -641,6 +641,7 @@ struct arm_smmu_impl_ops {
 /* An SMMUv3 instance */
 struct arm_smmu_device {
 	struct device			*dev;
+	struct device			*impl_dev;
 	const struct arm_smmu_impl_ops	*impl_ops;
 
 	void __iomem			*base;
@@ -882,4 +883,14 @@ static inline void arm_smmu_sva_notifier_synchronize(void) {}
 #define arm_smmu_sva_domain_alloc NULL
 
 #endif /* CONFIG_ARM_SMMU_V3_SVA */
+
+#ifdef CONFIG_TEGRA241_CMDQV
+struct arm_smmu_device *tegra241_cmdqv_probe(struct arm_smmu_device *smmu);
+#else /* CONFIG_TEGRA241_CMDQV */
+static inline struct arm_smmu_device *
+tegra241_cmdqv_probe(struct arm_smmu_device *smmu)
+{
+	return ERR_PTR(-ENODEV);
+}
+#endif /* CONFIG_TEGRA241_CMDQV */
 #endif /* _ARM_SMMU_V3_H */
diff --git a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
new file mode 100644
index 000000000000..5ac3032ee6dd
--- /dev/null
+++ b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
@@ -0,0 +1,858 @@
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
+ * @dev: CMDQV device
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
+	struct device *dev;
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
+		dev_err(cmdqv->dev, "%sfailed to %sable, STATUS=0x%08X\n",
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
+			unsigned long lidx = __ffs64(map);
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
+	dev_warn(cmdqv->dev, "unexpected error reported. %s\n", err_str);
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
+		dev_err(vcmdq->cmdqv->dev,
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
+		dev_warn(vcmdq->cmdqv->dev,
+			 "%suncleared error detected, resetting\n", h);
+		writel(gerror, REG_VCMDQ_PAGE0(vcmdq, GERRORN));
+	}
+
+	dev_dbg(vcmdq->cmdqv->dev, "%sdeinited\n", h);
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
+		dev_err(vcmdq->cmdqv->dev,
+			"%sGERRORN=0x%X, GERROR=0x%X, CONS=0x%X\n", h,
+			readl_relaxed(REG_VCMDQ_PAGE0(vcmdq, GERRORN)),
+			readl_relaxed(REG_VCMDQ_PAGE0(vcmdq, GERROR)),
+			readl_relaxed(REG_VCMDQ_PAGE0(vcmdq, CONS)));
+		return ret;
+	}
+
+	dev_dbg(vcmdq->cmdqv->dev, "%sinited\n", h);
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
+	dev_dbg(vintf->cmdqv->dev,
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
+	dev_dbg(cmdqv->dev,
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
+	dev_dbg(cmdqv->dev, "VINTF%u: deallocated\n", vintf->idx);
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
+	put_device(cmdqv->dev); /* smmu->impl_dev */
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
+tegra241_cmdqv_find_acpi_resource(struct device *dev, int *irq)
+{
+	struct acpi_device *adev = to_acpi_device(dev);
+	struct list_head resource_list;
+	struct resource_entry *rentry;
+	struct resource *res = NULL;
+	int ret;
+
+	INIT_LIST_HEAD(&resource_list);
+	ret = acpi_dev_get_resources(adev, &resource_list,
+				     tegra241_cmdqv_acpi_is_memory, NULL);
+	if (ret < 0) {
+		dev_err(dev, "failed to get memory resource: %d\n", ret);
+		return NULL;
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
+	return res;
+}
+
+struct dentry *cmdqv_debugfs_dir;
+
+static struct arm_smmu_device *
+__tegra241_cmdqv_probe(struct arm_smmu_device *smmu, struct resource *res,
+		       int irq)
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
+	cmdqv->dev = smmu->impl_dev;
+
+	if (cmdqv->irq > 0) {
+		ret = request_irq(irq, tegra241_cmdqv_isr, 0, "tegra241-cmdqv",
+				  cmdqv);
+		if (ret) {
+			dev_err(cmdqv->dev, "failed to request irq (%d): %d\n",
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
+		dev_err(cmdqv->dev, "failed to init vintf0: %d\n", ret);
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
+	return NULL;
+}
+
+struct arm_smmu_device *tegra241_cmdqv_probe(struct arm_smmu_device *smmu)
+{
+	struct arm_smmu_device *new_smmu;
+	struct resource *res = NULL;
+	int irq;
+
+	if (!smmu->dev->of_node)
+		res = tegra241_cmdqv_find_acpi_resource(smmu->impl_dev, &irq);
+	if (!res)
+		goto out_fallback;
+
+	new_smmu = __tegra241_cmdqv_probe(smmu, res, irq);
+	kfree(res);
+
+	if (new_smmu)
+		return new_smmu;
+
+out_fallback:
+	dev_info(smmu->impl_dev, "Falling back to standard SMMU CMDQ\n");
+	smmu->options &= ~ARM_SMMU_OPT_TEGRA241_CMDQV;
+	put_device(smmu->impl_dev);
+	return ERR_PTR(-ENODEV);
+}
-- 
2.43.0



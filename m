Return-Path: <linux-tegra+bounces-3026-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1F49337BB
	for <lists+linux-tegra@lfdr.de>; Wed, 17 Jul 2024 09:22:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3FC2B284EF8
	for <lists+linux-tegra@lfdr.de>; Wed, 17 Jul 2024 07:22:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E33BF182B5;
	Wed, 17 Jul 2024 07:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ONkiOMiZ"
X-Original-To: linux-tegra@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2058.outbound.protection.outlook.com [40.107.243.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D697494;
	Wed, 17 Jul 2024 07:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721200929; cv=fail; b=E+gekPWTw5aX9iMInkt6GZJwTMsbCeFdrwaw5S3X2B1zm7rjMK9V2iMVIeU6KYOj7y41s40l86I+RkLZ1pqe591gpt/IqFgPr3QDTwyi8xFcwIbtYrqdgrT8LPWKc3Y2DHICsEQRVbh1CBZ8tX81Gx0BZwt5WOI5mnFbbGql6KA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721200929; c=relaxed/simple;
	bh=aJgVH1jvnQ0R4dMN9w7YrwtUNZkreB37BZOFeYrmDWs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=McnL3gTIayslnbILffauZZQ0DhoGw3TlrvntkJekLtISeWMDh+D20a+DxG3RV90mWeLVKhAcpqWhc/A+VqyUXU9X+qmRJwDBw3rnGUMAPPSkx/WvGVALNQYye+aAxx9qsIhV1qlBlCZPUJJ1gtSkPjMVtw82uNN2memlO2z6epE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ONkiOMiZ; arc=fail smtp.client-ip=40.107.243.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KRIIf3iY0cVDx8Syi9pMu0iEcA9+S+NcU+sG8L2rKLWlbcNx/J+WVkKkg9x8mZ3qaNTmsPTOBX6SgdrsAtbvpz2TOS8HLSAeEoSUyXcONDft5TnWdg99I6uLTvir0V2sQydoRRa4rsBxd42VFWO1QfjHkg7XG/B8U7aklgiUrDT8dCYfxcGATtFdyU6WU0HE06U5q+xIY3hc4OwZ45ZRtoonswoozzTqgeUOvHn2lNqlm4CNvHT5DnPJsPQfivla+ZmMt5AF9cpsZXTh1Dl8Y1tOi9yfZHwzxTmnKhxm+hc+7jOjrNNsFucWFLCxpG0PrIonHyYE5ikkC54XKSXAmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8mgcM3Qzwfiwh/GA6/B1iWbjy/MUx6bjw2ySnU7/iWQ=;
 b=kkMJajalUCfWpvY6fAEQLMsU182OAgRdbZL9+04MgfG/O7dhmNKb576ca0jgWs3FSLh+bOHzqmVrFnDug1LI88ATLXoADFVmIzEVv4n+ZxAP3R/ezZN4l4nF12xDwJq4UsEw/388fajNLH1QOVcSc2QjR4VkG/OlGMHBmibeb/q7/TVSJwnzTO1u1+YomtKQPxda0TW2k7skUQSKgmOq2Qa4zYT/Ql7I+ftQcG3qjQ0bQOCmj0geWZZn+VnIDo7UKBvK9NOPnDbSEuCaOLomySx2zajjDvJsXyyoeFN6lT5xu+Plm8s81xRvu3+AotxZxwqXBxKKm31gsxjy4PJG/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8mgcM3Qzwfiwh/GA6/B1iWbjy/MUx6bjw2ySnU7/iWQ=;
 b=ONkiOMiZsv3bp42czNsb9vttv5kG6UowcXR358rZ6pFu+W6NyvLgWbmsA/u71W6Mu17DL3NKFmj1nxyd844jOA05H48RmYWQBfAcWNNu5X5JvwHZXrQfQh5WvJTo5/TS9/Vtwnk/8t+B1VF8k3SuFPba+9GyxFlTLHosPoPBED14v1c2FSz7kUyhqqdBMikWRWHX9y3cVX9sNfK9L7V/1+J5UTv+qkYp76GejSffDHadGYnWEjuXeZT+/SWIU5Q+baAh9OP4tcmYZ4OMOwxNJyDZA0Sy5c/nU9m/F/Z2/lJT3Vykmw5klep4H7J8mJ45xG98Q3SHlv8tuCAB1qjNVQ==
Received: from MN2PR10CA0001.namprd10.prod.outlook.com (2603:10b6:208:120::14)
 by IA1PR12MB6281.namprd12.prod.outlook.com (2603:10b6:208:3e7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Wed, 17 Jul
 2024 07:22:04 +0000
Received: from BL6PEPF0001AB52.namprd02.prod.outlook.com
 (2603:10b6:208:120:cafe::7b) by MN2PR10CA0001.outlook.office365.com
 (2603:10b6:208:120::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28 via Frontend
 Transport; Wed, 17 Jul 2024 07:22:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BL6PEPF0001AB52.mail.protection.outlook.com (10.167.241.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.11 via Frontend Transport; Wed, 17 Jul 2024 07:22:04 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 17 Jul
 2024 00:21:54 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Wed, 17 Jul 2024 00:21:54 -0700
Received: from build-amhetre-20240716T042216611.internal (10.127.8.10) by
 mail.nvidia.com (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.4
 via Frontend Transport; Wed, 17 Jul 2024 00:21:54 -0700
From: Ashish Mhetre <amhetre@nvidia.com>
To: <thierry.reding@gmail.com>, <vdumpa@nvidia.com>, <will@kernel.org>,
	<robin.murphy@arm.com>, <joro@8bytes.org>
CC: <linux-tegra@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>, Ashish Mhetre
	<amhetre@nvidia.com>
Subject: [PATCH] iommu: arm-smmu: Fix Tegra workaround for PAGE_SIZE mappings
Date: Wed, 17 Jul 2024 07:21:45 +0000
Message-ID: <20240717072145.107412-1-amhetre@nvidia.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB52:EE_|IA1PR12MB6281:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b52c4cd-ad5e-4a0c-135d-08dca63128a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yxrxKiR7psD86A9GElHpMiBHHtJwAr6YQShujKc6U6YOjYonfPVnqztzzQ5d?=
 =?us-ascii?Q?SDp5faLDkmrn0Y/AxAum6YlZOCU5/ztMnCI6ZruIRFu5WVtg1icmgD9PKmLJ?=
 =?us-ascii?Q?k0L5ef6tmzhWRdVofKIGzY1hzk8zki0/YNiYEvReWj5KCuXlMF3ObTgmDcXV?=
 =?us-ascii?Q?W1XLXYSh3xVdrvnfDfq6WFqJZaLd6AHQpZBrBQqt2fMETsyrZWkk0rziXhf6?=
 =?us-ascii?Q?ohS7qUaGKqoWnj+M5OV1BVXpW0mogg+X8prTGxvoemtPlyz5hJekzeIWkRub?=
 =?us-ascii?Q?4RRRumXo+tBJ6KT0MxRP+/WJwYXNyES4dltrbnIbjzyFL+8Rxo2nlmQVZbZr?=
 =?us-ascii?Q?tmVrM3DqdJg9pId6oIWLBCcPPYAX68EIvDdrjrv0b9fqPzCrNJHILTbvca8r?=
 =?us-ascii?Q?vuoIQaN/vqgzX9NUd1o8RYmUHNgpvQAGKuYDC9+zX3gTfxPcEBalK6DS79Cq?=
 =?us-ascii?Q?ADUVxF3Kaka8tMjTiqM9kdFffj59Ezp3c38nxtnR6JDucj5GGYLW7jCGxW7W?=
 =?us-ascii?Q?7LGDwAmSWkHj9KbKovqxTue+PhvzdCo3xWEMQ+AhUuEhVzmdBRUWcWuufjij?=
 =?us-ascii?Q?I3WGV3M9E7bHjTzSvJ4ekAhM+xCVsBphonwXuKBri3HORvo7iQdHyuNvB8Ly?=
 =?us-ascii?Q?CVk9Fhxb0p8NTZv0FZdm2RvDNJm8Vkq6d5MPuTrxsUS3XB/WFkBZSm0vOozH?=
 =?us-ascii?Q?X0JPIq/ZbDhYaL8vG6rtqatUIzruQrXH83FNQ8SaRYub4/j1W8ymrXlq0o5N?=
 =?us-ascii?Q?a3wjSWtur/2FxcQJ7fvcBvpcSE6e4kGgdYJOwwKPKxs/mE5AHiIUQ1o1kA/X?=
 =?us-ascii?Q?bNeO5j/dB+FNtwnqE601dMWntxedb5crksTAaNufszsbIZjpS1dJ7lBcC5Jq?=
 =?us-ascii?Q?Dhutox/ZMDH6SD00XJgQNyUT+R51XU9db7mZ6stZL04SPnYHnjbKE8BBpv++?=
 =?us-ascii?Q?ZyVk7YqKlrSBG0ZH5UVWLGeHgd1WD5QjVRYAuyD0YW8TqERkhAnstHJnJe+1?=
 =?us-ascii?Q?pcvOI5tvVf5PHhUGc79FL2ICSR3KD1FFGVCtWb3Z8eXq8pfzT26GVBeehDBu?=
 =?us-ascii?Q?StaS+OLImpAt5v62cLOeJ6k6lyxfdQr/jgaz5/BNjX+/Vujrv8tdIsP3FUHo?=
 =?us-ascii?Q?vUumYbjxDyfmcZRa/lKvH1ZSHEwChiImD3toH/sp23gGYXBhMXoxKvh0Y3NY?=
 =?us-ascii?Q?Qxq75sp/rQc8it9odJsQLNjKlGBQqa6l8X90NfxT467mdBwEEf/9ryqCSPmw?=
 =?us-ascii?Q?eYiDtHe66wsn7zyZUbcNpJbX7sWtrPpFKukVFQuMugCJRIudnc9i6x/UcGcY?=
 =?us-ascii?Q?bL5z1dmlFqLngUoAKU9cFBYcna9e3TfCepkl1qjO9pxSlwnHb1N3udutEEA8?=
 =?us-ascii?Q?2hpC7qjBj19/ApI+PX+9/E5q9VZHR7lW0h+CLXQgDCvGBnyoHibKT6y6KYhW?=
 =?us-ascii?Q?9qMAH15sN/ufmB6KT2C4aD+GRDgXX03W?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2024 07:22:04.3539
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b52c4cd-ad5e-4a0c-135d-08dca63128a7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB52.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6281

PAGE_SIZE can be 16KB for Tegra which is not supported by MMU-500 on
both Tegra194 and Tegra234. So, use 4KB mappings when PAGE_SIZE is 16KB.

Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c b/drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c
index 4b2994b6126d..bb621a94f6fe 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c
@@ -273,11 +273,12 @@ static int nvidia_smmu_init_context(struct arm_smmu_domain *smmu_domain,
 	 * release of PMD entry and avoid translations seeing stale PMD entry in
 	 * walk cache.
 	 * Fix this by limiting the page mappings to PAGE_SIZE on Tegra194 and
-	 * Tegra234.
+	 * Tegra234. Use 4K page mappings if PAGE_SIZE is 16K as MMU500 doesn't
+	 * support it.
 	 */
 	if (of_device_is_compatible(np, "nvidia,tegra234-smmu") ||
 	    of_device_is_compatible(np, "nvidia,tegra194-smmu")) {
-		smmu->pgsize_bitmap = PAGE_SIZE;
+		smmu->pgsize_bitmap = (PAGE_SIZE == SZ_16K) ? SZ_4K : PAGE_SIZE;
 		pgtbl_cfg->pgsize_bitmap = smmu->pgsize_bitmap;
 	}
 
-- 
2.25.1



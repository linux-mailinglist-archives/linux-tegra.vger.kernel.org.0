Return-Path: <linux-tegra+bounces-3428-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CF795DA1F
	for <lists+linux-tegra@lfdr.de>; Sat, 24 Aug 2024 02:11:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D861D1C21656
	for <lists+linux-tegra@lfdr.de>; Sat, 24 Aug 2024 00:11:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11BCDCA62;
	Sat, 24 Aug 2024 00:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YSbix237"
X-Original-To: linux-tegra@vger.kernel.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2076.outbound.protection.outlook.com [40.107.101.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6193C8BEC;
	Sat, 24 Aug 2024 00:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724458274; cv=fail; b=ZJhtva3c1+jIzmt85g5wVUlEuHYHjXFTenT9+5JL3/FU5mGOVua33BPK5hstvpm6YxZ2Po+zMq5pacliWuWfw4hD5EfBG2vSBcPIifPPjPQr4CvTBZ8sdXrkjoiJ3Cj4x3hmdkJ447KBv/ukSqdNU0gwcRM85P+LtvijPkfabkg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724458274; c=relaxed/simple;
	bh=QOeIOMCWK5lBnLsFWDIRzEqpisGBjYxAJDZHrolz2KU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j6zPKdfc/w8mSeoKECDad5KJrXMGdFXTQb3yCkhYUD19XIUjsu1tf9NUfkr0BlkRtKQtw+ADa/uXQYaOYXnTd782lPEEysr0uq2DZNM5iGSSIy4bQMFC5njyPl6dLVTpmigjwdO7N59adR3zCbO1aQETapJn1aS3Lj7L9PFVMAc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YSbix237; arc=fail smtp.client-ip=40.107.101.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l1bKQAaLo4nUDLdA6CRUmTwsyVUXjJtdSgXOQ2uKFHqDOjRcd8fV1Goz6/+xaiZ8jD1H5xeJnMM7+wf+mVobP+Qdj3G/Mf3eZ7tRT1OE/6epDnrjNyRReqtva4bPMOqJtn/ognC39zY1LCb7ggUWIv9DbKhF6Er3YsSSMEfY4hNS+FY7Qa3mbSKQmqTq8Imvm7b51MpuqMNOAhW4vCABHg681dHuFLwWlORtEa54ilmUrHYZ1wJ2UIadbIchVyAesO2Syj9mFjkY6JnZSzwfpytBDosbrYtpdD6S8KahDFwjY/tXjRtEQ3ndrDG+bKPvmc6xEiU1iIBidAEfykR6/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8USrG6RMqRVUyJL1J9lU5cwgg850SHApaKcAFvG3I/A=;
 b=FVu+WyKuEvIIbM1mlBCN4XZZ5mRIOWSSQvIZQQEDiLYAmhmSsv4aI9IYoOvnelhqaEqHhe4n/7cTnDyx0ryFdZHWQfJEU2p20mZ2ThVdvFTTIBQTcLw31dsnB1nxwst2zsr8QgxmWlNZIsNOCnQuy1Gt7v+qfHdk3xonwVIxamsrYd6Y49Q6VESPBJEShHhrRNBWbq1LQ2CX4klbHV3uP3NqsTdOI4fS27fi2mBNcQ+OKEf645U67YR3o28z6HinCH4dUpXcrun4qfzBL4Hnw09nBLIVCNyImxowwCq6YCZ+Io1DvdjziTvWxJyiAM/XjITtylO5cBPA3f+S9txoAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8USrG6RMqRVUyJL1J9lU5cwgg850SHApaKcAFvG3I/A=;
 b=YSbix237JvgwVuV52vhNwUU8QUSmMeezjAezQ1q7lxWpLFRvXO4QAhOMFyLRHLAskDNRH1Rb9Q6eH+iTOJzBkCn10PIWgP8I4ibIqH/uGrYUfuVyl7KJX+Y8EchBQxQRIwSpK10Y63BEMBU1yTGRKb/I4IjFNvTaigOrKD1yn0QTE7vrIBLV+qRy0XKKs7vhfBhyCE1+nBQd001J8jWDKHBb9YEzbRkruiQgj5U/MBu8S74QwCOKS3xqviWXmbcrM5mbTmStCIc9W63zHUrhFoSNPXoPQKMaDtOiNz/+MINMtZNExfSwfQAkAw9lUmjhRCHwF/2s0BUfS/hO7HQxzQ==
Received: from CH2PR18CA0052.namprd18.prod.outlook.com (2603:10b6:610:55::32)
 by SJ1PR12MB6049.namprd12.prod.outlook.com (2603:10b6:a03:48c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Sat, 24 Aug
 2024 00:11:07 +0000
Received: from CH1PEPF0000AD76.namprd04.prod.outlook.com
 (2603:10b6:610:55:cafe::2d) by CH2PR18CA0052.outlook.office365.com
 (2603:10b6:610:55::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19 via Frontend
 Transport; Sat, 24 Aug 2024 00:11:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH1PEPF0000AD76.mail.protection.outlook.com (10.167.244.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7897.11 via Frontend Transport; Sat, 24 Aug 2024 00:11:06 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 23 Aug
 2024 17:10:52 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 23 Aug
 2024 17:10:52 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.12) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Fri, 23 Aug 2024 17:10:51 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>
CC: <robin.murphy@arm.com>, <joro@8bytes.org>, <jgg@nvidia.com>,
	<thierry.reding@gmail.com>, <vdumpa@nvidia.com>, <jonathanh@nvidia.com>,
	<linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-tegra@vger.kernel.org>
Subject: [PATCH v13 04/10] iommu/arm-smmu-v3: Make symbols public for CONFIG_TEGRA241_CMDQV
Date: Fri, 23 Aug 2024 17:10:38 -0700
Message-ID: <b940476b4366dcf5249d74874ffdb849ab76d947.1724453781.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1724453781.git.nicolinc@nvidia.com>
References: <cover.1724453781.git.nicolinc@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD76:EE_|SJ1PR12MB6049:EE_
X-MS-Office365-Filtering-Correlation-Id: a2e46326-12cd-40ef-9b34-08dcc3d13ffe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kBs6B5PnU0GYzROncmg7WkQC0JJh97oELQfm+0WjHpCgLiUkLksHPMseoNI3?=
 =?us-ascii?Q?6auJQ3FTGTFg+0pzitrHEuKX+e+GkBrCnww+S7Fl39r2G3mhte46UZWEpJvn?=
 =?us-ascii?Q?t65gtpaCrdBaVIvwXyhSYWPmo+56ZNaYJpRwzn4fTBsyp0x6rSB5Mg37pT1N?=
 =?us-ascii?Q?q8C7j3EFis/naARkfb7a5hdtW2wlpcoAZu9OQGQqHkImcbl7eVOBJkDOuiOx?=
 =?us-ascii?Q?WjZ2/hlrZqTG7W5JBkRMTRrnRWTVpPonT+BPSu65+GfpFaPk1tvqwKfkoCcV?=
 =?us-ascii?Q?M7a3rxJymo4E2aRH/nDBju3VWsT0+1mGFiSg+vIFNmmnr2e38YRGeLs6ne8v?=
 =?us-ascii?Q?id+qFUtD6rzyxB7QIkz1Fd4ppL7UzmCJhfow4L/MSNrSYtbl/EH8U/qYeaVu?=
 =?us-ascii?Q?B2NapI03MTDpImeEChYYPy6jdaADnc+Lu4dayUA0eoj79yzaT4G/QgCYIqtw?=
 =?us-ascii?Q?WdgDoxADTrpKraJ5j/JG9RtGQ5mqW0cCK9NHeyUjN0a/njTFQA9i0yU1bF95?=
 =?us-ascii?Q?hQHUNMjOFRjb1zxg1u308uSqni7NjS/pw6BV39EGCI7JEuulKiMiVGXzSuWx?=
 =?us-ascii?Q?8N9DIaZeUy6wmxPuWJZz5RW2XubBJKEVvR/s3eW+gljmNrj7ZnMK6SvgPjEg?=
 =?us-ascii?Q?4k7aybhv5yPrRYdlDhKu8Na9ixyRq/v6VlpF7wGQm/KSTp34DCWHtikDDCHd?=
 =?us-ascii?Q?OcekIa7vPwXkt15ln8TED1jQQjR/ROxkXwVyFDTUwf18Gt6TYm8PC5Caoz3L?=
 =?us-ascii?Q?kjFYj/Xc+WCCjieQeVt/Fv8GDZZOdabl2HDSSusnXLYdb9kKuD+Qv5IjAgcb?=
 =?us-ascii?Q?iz3aoB3FogtleCJ8cp3d4wfdG9SqX7LmgtH/P1k6RwTRnTLBvdNsoPNe+Nbv?=
 =?us-ascii?Q?9tn1mdpQszy080yUXvZovTDG11XOJ+Pfu8fF8dyGzAyZhHTSrStwl4exFXaQ?=
 =?us-ascii?Q?Uv6kcUEwTVak1qzUp6OVco8F6gxNEquwCl71BkQaGpLMY5yH9ZrHJa2q7uLE?=
 =?us-ascii?Q?XGQx3kV9CUYLsUQ1Dbrk7dRR/YMrYhvwxk0EZcUXXATyDZYFUziVyG624wEO?=
 =?us-ascii?Q?lwsO3Q+NprK34R6mQuTplaUbRK+z9to0WQE1WWqiGpxQLR9fYceDNpcFNkrc?=
 =?us-ascii?Q?rcXE2KxSslnZykT/Wy/HXTblSv1/lud2yt6Z8YgHh010LwGMum/hP9wZ8hcp?=
 =?us-ascii?Q?X7Yi49XIM/n756Bq1cP0fcZlJ2VW7YlKLIdOlZi9BbnrqiEUu85yPQkKy9tU?=
 =?us-ascii?Q?m9CBkOKmwtbZwpVDjG+5ChOVN0yRr3M4q+hXsh+5zIQZVG3DRC+jyJ24HHN7?=
 =?us-ascii?Q?aY3KkWXCLCJRGJhOFvegVV0V3z0XNies572LvUBU9GbhSv9GLrB962R3npcM?=
 =?us-ascii?Q?Ymp7J+58+MumeQhibc9Bs22GGLpDBEMMFnSDdYRoIP5+4bzo+DilazkC5fxH?=
 =?us-ascii?Q?TysISl9vEFaYU8tniCpWonN1JlqP4QPj?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2024 00:11:06.7437
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2e46326-12cd-40ef-9b34-08dcc3d13ffe
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD76.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6049

The symbols __arm_smmu_cmdq_skip_err(), arm_smmu_init_one_queue(), and
arm_smmu_cmdq_init() need to be used by the tegra241-cmdqv compilation
unit in a following patch.

Remove the static and put prototypes in the header.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 18 ++++++++----------
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |  9 +++++++++
 2 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 803789bb4cff..214b2bce28fa 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -371,8 +371,8 @@ static void arm_smmu_cmdq_build_sync_cmd(u64 *cmd, struct arm_smmu_device *smmu,
 	arm_smmu_cmdq_build_cmd(cmd, &ent);
 }
 
-static void __arm_smmu_cmdq_skip_err(struct arm_smmu_device *smmu,
-				     struct arm_smmu_cmdq *cmdq)
+void __arm_smmu_cmdq_skip_err(struct arm_smmu_device *smmu,
+			      struct arm_smmu_cmdq *cmdq)
 {
 	static const char * const cerror_str[] = {
 		[CMDQ_ERR_CERROR_NONE_IDX]	= "No error",
@@ -3521,12 +3521,10 @@ static struct iommu_dirty_ops arm_smmu_dirty_ops = {
 };
 
 /* Probing and initialisation functions */
-static int arm_smmu_init_one_queue(struct arm_smmu_device *smmu,
-				   struct arm_smmu_queue *q,
-				   void __iomem *page,
-				   unsigned long prod_off,
-				   unsigned long cons_off,
-				   size_t dwords, const char *name)
+int arm_smmu_init_one_queue(struct arm_smmu_device *smmu,
+			    struct arm_smmu_queue *q, void __iomem *page,
+			    unsigned long prod_off, unsigned long cons_off,
+			    size_t dwords, const char *name)
 {
 	size_t qsz;
 
@@ -3564,8 +3562,8 @@ static int arm_smmu_init_one_queue(struct arm_smmu_device *smmu,
 	return 0;
 }
 
-static int arm_smmu_cmdq_init(struct arm_smmu_device *smmu,
-			      struct arm_smmu_cmdq *cmdq)
+int arm_smmu_cmdq_init(struct arm_smmu_device *smmu,
+		       struct arm_smmu_cmdq *cmdq)
 {
 	unsigned int nents = 1 << cmdq->q.llq.max_n_shift;
 
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index c1454e9758c4..ce76357b6fc2 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -816,6 +816,15 @@ void arm_smmu_tlb_inv_range_asid(unsigned long iova, size_t size, int asid,
 int arm_smmu_atc_inv_domain(struct arm_smmu_domain *smmu_domain,
 			    unsigned long iova, size_t size);
 
+void __arm_smmu_cmdq_skip_err(struct arm_smmu_device *smmu,
+			      struct arm_smmu_cmdq *cmdq);
+int arm_smmu_init_one_queue(struct arm_smmu_device *smmu,
+			    struct arm_smmu_queue *q, void __iomem *page,
+			    unsigned long prod_off, unsigned long cons_off,
+			    size_t dwords, const char *name);
+int arm_smmu_cmdq_init(struct arm_smmu_device *smmu,
+		       struct arm_smmu_cmdq *cmdq);
+
 #ifdef CONFIG_ARM_SMMU_V3_SVA
 bool arm_smmu_sva_supported(struct arm_smmu_device *smmu);
 bool arm_smmu_master_sva_supported(struct arm_smmu_master *master);
-- 
2.43.0



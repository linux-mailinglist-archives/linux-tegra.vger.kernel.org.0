Return-Path: <linux-tegra+bounces-189-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9C7804AC3
	for <lists+linux-tegra@lfdr.de>; Tue,  5 Dec 2023 07:57:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64788281749
	for <lists+linux-tegra@lfdr.de>; Tue,  5 Dec 2023 06:57:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0400D14F6F;
	Tue,  5 Dec 2023 06:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="eEp4TAr5"
X-Original-To: linux-tegra@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2077.outbound.protection.outlook.com [40.107.237.77])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C4EA116;
	Mon,  4 Dec 2023 22:57:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qd24jGCLMinPe6+xNz7xaUEvBfg9/FPYTxlCQZP3L17rQGEr5ACDku/pXr66fvPjmmObOtu8UMKeeo2rKZB+B1YL3RiAQp2KshgMj0Ol4IHGs5RdCdSmoPHEdjOOIlc6Kctha2MbUHEkx+bTN8kTKNeXaXmVSmkmB+CdYu4Y+TjD1l9FGRw2SxdGvPZIKi3oC6z/YOfvxh9/Q7SGBGFtYM9iEubOR6PpT3YqY+ghpXCH9XZlDiKcpJOueZcCJt46bFQtgVBWQAIacphFGY1uCO/vLQS5TmqPsSJySJe4fp+ML18kJYBBdpHCsoyNER67ff9rWMFdT3QIQvHBm1azEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bDbSnnf3tIRlvDp7dymPcDiow8LWqXZunD7VwfiA2QU=;
 b=N0HWIZRAOEDfDzCsw4gFZD0nem4d9CfE6+jrDzv8SvLyJ0TFW83VkfxKXjFOfk4+uxsGBpZGd/8pNsyxa3f0zSh9lMSFPFyM1ek8P6mHzcrw1LWgKCSxA1hMI6ErTK7Ek9gKdcTlO1SlX+D2zq98khwXDrwwGTI1Dk8cmiUP5Dws/9XLiSlSaoOlyDxzRppGpH08UPEcLy2GynEimne/7naci7xWuc0hKGjFHYguiBVvmsFcSZrfmMQ3SnC3gkuex1401u7h/Z7R7Kg6Pj8UYg3GmXcaPu2otky1CJUtLDwpNoLCKQum0q5G+ddg9D3+4uXD3Aqw15I5qbu2Fqdleg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=8bytes.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bDbSnnf3tIRlvDp7dymPcDiow8LWqXZunD7VwfiA2QU=;
 b=eEp4TAr5WBLR0um6n7AjLmpjhe052zSGMfdAMN/Ak1qBZXejb2Pf9OFkobacAvxpFsma+JXZ6OMDz38hfo043UGlH6Ax0oB3sKi2OHTNrWSTF1IRPiDKP5yskUlXE11n9MiZV0x8xnnN/HA287OQGFD0jwE+IX0kIauqjAisMUea05tLSOhBoRBBQ7x1ev5pf7VSexrFiyLvSpJn350NXai5klj54Jm94KAwyjUvh9wAFmz9PuvddguyVuSD2tmjm09uBbWsbT5HP478dNfCH3SbzHI8kO2GFa1HZKJZXIexKlJ7LzMLTt2GeGjM93GnoTMMMpMhuOWOtihtBb3HHg==
Received: from MN2PR16CA0023.namprd16.prod.outlook.com (2603:10b6:208:134::36)
 by IA0PR12MB7650.namprd12.prod.outlook.com (2603:10b6:208:436::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Tue, 5 Dec
 2023 06:57:21 +0000
Received: from BL02EPF0001A103.namprd05.prod.outlook.com
 (2603:10b6:208:134:cafe::8d) by MN2PR16CA0023.outlook.office365.com
 (2603:10b6:208:134::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33 via Frontend
 Transport; Tue, 5 Dec 2023 06:57:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF0001A103.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.20 via Frontend Transport; Tue, 5 Dec 2023 06:57:21 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Mon, 4 Dec 2023
 22:57:06 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Mon, 4 Dec 2023
 22:57:05 -0800
Received: from amhetre.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.986.41 via Frontend
 Transport; Mon, 4 Dec 2023 22:57:03 -0800
From: Ashish Mhetre <amhetre@nvidia.com>
To: <joro@8bytes.org>, <will@kernel.org>, <robin.murphy@arm.com>,
	<treding@nvidia.com>
CC: <iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, Ashish Mhetre <amhetre@nvidia.com>
Subject: [PATCH V2] iommu: Don't reserve 0-length IOVA region
Date: Tue, 5 Dec 2023 12:26:56 +0530
Message-ID: <20231205065656.9544-1-amhetre@nvidia.com>
X-Mailer: git-send-email 2.17.1
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A103:EE_|IA0PR12MB7650:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a15fa8f-823f-4453-acba-08dbf55f6dbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	m5aoWU61VxCtHSoEgCDY1j9Y/uCb+/V2p7paTLMHrVKN4DNpPJQLCYNVw26qgm8f0y6w6A8rEAOcmfvCBMOWW9dZjKjpurV28bUhCUP1reJOoEMD8jtZuqFNSKhAhE/ZrLn3CR1sY1NQCRa5AEv/aS488Lv3lltS8qEK0h12IstlV+LlEy2nEK6rGd3r8T9z/vmiDK1OW1p4syXJjobDF9+S0j493RvtywoeGbPZ07jd3+UviE/yFImqixikPA0sbeTGYEln2Wu2iWyPS4jvKXvAWhxnsZME59kBlpj7XIbGuZavbdaxFgNk91CbhT578zIKWkeUG4repTZ+euneyWFofcd+0ToucFto8Z7bWcL/JwXsxLCOCJ+dcsSK2sGmdBgzWjLQ9xuIPSWVdQzfOS1OWjJkZgLHB2MzHnHHCgjjFJLkORW+xBbg1Zs2lf+gC8eHT2yhV5x+hUx7flEcwXmovYeRtxEDyPaz+EapJ5W7AY2604Y5e7iU2lcTs4bdMZndGTGNWlfAzKXKGDBaGMKdr3Tn7ezsRBEu9FkYAAeQ3MaZvouWpAMLvYylDOFVvM4sPXKzv8KBd+uMfgYU/jd27thxll+Wxhiost3YCGfcv4HO7JwHlzQeNe+WC1VmswJnjV9LLkgWGQIZfa09XI8MymAxdNvRy6+aHRDyeGMmkruNDSQmMsbaCwm4Ly1kXYvtc5/vaSs0Vg3cm8I/ySDHi36Nv5NpvILF3EVLeF4tSKJSdOm5wilHIHObDlqdRh20LzEmdli9UZjd29Zp0IQKx/i16xDau4ILL2y1baM=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(346002)(376002)(39860400002)(230273577357003)(230173577357003)(230922051799003)(82310400011)(186009)(451199024)(64100799003)(1800799012)(46966006)(40470700004)(36840700001)(2616005)(40460700003)(66899024)(316002)(4326008)(86362001)(6636002)(54906003)(8936002)(8676002)(70586007)(110136005)(478600001)(70206006)(41300700001)(36756003)(2906002)(5660300002)(36860700001)(47076005)(7636003)(356005)(1076003)(26005)(7696005)(107886003)(6666004)(83380400001)(82740400003)(426003)(336012)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2023 06:57:21.2936
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a15fa8f-823f-4453-acba-08dbf55f6dbe
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A103.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7650

When the bootloader/firmware doesn't setup the framebuffers, their
address and size are 0 in "iommu-addresses" property. If IOVA region is
reserved with 0 length, then it ends up corrupting the IOVA rbtree with
an entry which has pfn_hi < pfn_lo.
If we intend to use display driver in kernel without framebuffer then
it's causing the display IOMMU mappings to fail as entire valid IOVA
space is reserved when address and length are passed as 0.
An ideal solution would be firmware removing the "iommu-addresses"
property and corresponding "memory-region" if display is not present.
But the kernel should be able to handle this by checking for size of
IOVA region and skipping the IOVA reservation if size is 0. Also, add
a warning if firmware is requesting 0-length IOVA region reservation.

Fixes: a5bf3cfce8cb ("iommu: Implement of_iommu_get_resv_regions()")
Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
---
 drivers/iommu/of_iommu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
index 47302b637cc0..42cffb0ee5e2 100644
--- a/drivers/iommu/of_iommu.c
+++ b/drivers/iommu/of_iommu.c
@@ -264,6 +264,10 @@ void of_iommu_get_resv_regions(struct device *dev, struct list_head *list)
 					prot |= IOMMU_CACHE;
 
 				maps = of_translate_dma_region(np, maps, &iova, &length);
+				if (length == 0) {
+					dev_warn(dev, "Cannot reserve IOVA region of 0 size\n");
+					continue;
+				}
 				type = iommu_resv_region_get_type(dev, &phys, iova, length);
 
 				region = iommu_alloc_resv_region(iova, length, prot, type,
-- 
2.17.1



Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FCB33D40D5
	for <lists+linux-tegra@lfdr.de>; Fri, 23 Jul 2021 21:32:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231163AbhGWSvy (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 23 Jul 2021 14:51:54 -0400
Received: from mail-bn8nam12on2052.outbound.protection.outlook.com ([40.107.237.52]:9280
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230490AbhGWSvy (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 23 Jul 2021 14:51:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I9JLZ8tiONWf7O99BVGk4orK6PWeFdtCKp5+h8G2Q+t3nszvyxhX4Z3teVzVGstDskrugpVOlG+oIOCeBWJVWUkBy4gcvWWTzNbf6LG1Q10VVcHQafaK5uXZfhiXytkxTsrsU5pXR1Ri4WeMPoK4Y9ogBM0jQ8S5KkpPUUjEhS6nzNjW9eEkWSraqj6KV9NsZhkLt2aHboKs1xSLoZWZ+fFzF0k1uBMJA/6nfVVi0CZpxl7ImuHtjnNXut/jSys3Bv8YLcJWC+1P4lunvLYIw/Ed481DUbju+XNJr+1T8iF25eQ/ZjqJ6y1SPDGFr8sqzy0/4vjmFtSxAxKltkF6BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CBeoysCfJUKGAGZUktQBlX464uwfFvxKYQMFsO009a4=;
 b=DstOsl5Ycg+CAXJPSmkAP+XGBYOXCpakjWadvTfQfEN8/92ijjTz1tO1l/JmIgLiMc2HiovySscOBIxmoHBqf15lp17fCgqeG4wo9R4V6iEbLf2vDI2Oh0U3Hajo/JbQPPG/bRE2YLZKWxgXC6lz6gBEIx5eIqE7u4eqr7n0turiu/lyzEXqayBFVU23Dq6LngFUfBoYEwKF4iAvKU4eaCehEP3K3m/9TjJZJjAmf5VIBecDkpWGcaWa6fOy5i6WItQRoYeA8y4He+9sa9cTn/eQd5TvhjkCCguxHZx7r2/JeH2UQCEuLZ+ECTH7eYp1HlOuFRWnYRSZE0m6EW9nXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CBeoysCfJUKGAGZUktQBlX464uwfFvxKYQMFsO009a4=;
 b=McZYgQJZd2ZiEeV6YOXSyMBcg8H7h0jpVbQMvfvzhDsCw4w2hjiGuBnPc+Ju+NSdPHY3J+t/RMnKT8Tmc7Dal5nd+A1VCpoVVtFhK1B4rUrKLfXoDsoqYPeP9H72Z+c/oxISf7Mj3ssYUn95iNwzHLb/jVbLHBte1hlKk1RDZ3GQJS/CaWkN1il8iNmnOgiWAUB2++l6jpcbwgxarU8uq/woq6JjiaEIx9GeoAhAguligc9ku5p3DS215VMWwUwQm6XnffRuiloph66X1lnd2hpG4+Upd1g5i+2aJMXt4wybRwp8E/qMWpY8lQxojYvPVKPYy2wO8szOyUPF4YQMnA==
Received: from DM3PR03CA0003.namprd03.prod.outlook.com (2603:10b6:0:50::13) by
 DM4PR12MB5229.namprd12.prod.outlook.com (2603:10b6:5:398::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.26; Fri, 23 Jul 2021 19:32:24 +0000
Received: from DM6NAM11FT065.eop-nam11.prod.protection.outlook.com
 (2603:10b6:0:50:cafe::54) by DM3PR03CA0003.outlook.office365.com
 (2603:10b6:0:50::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25 via Frontend
 Transport; Fri, 23 Jul 2021 19:32:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT065.mail.protection.outlook.com (10.13.172.109) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4352.24 via Frontend Transport; Fri, 23 Jul 2021 19:32:24 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 23 Jul
 2021 19:32:24 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 23 Jul
 2021 19:32:23 +0000
Received: from Asurada-Nvidia.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 23 Jul 2021 12:32:23 -0700
From:   Nicolin Chen <nicolinc@nvidia.com>
To:     <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>
CC:     <nicoleotsuka@gmail.com>, <vdumpa@nvidia.com>,
        <thierry.reding@gmail.com>, <linux-tegra@vger.kernel.org>,
        <nwatterson@nvidia.com>, <Jonathan.Cameron@huawei.com>,
        <jean-philippe@linaro.org>, <song.bao.hua@hisilicon.com>,
        <eric.auger@redhat.com>, <thunder.leizhen@huawei.com>,
        <yuzenghui@huawei.com>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <iommu@lists.linux-foundation.org>
Subject: [RFC][Patch v1 0/2] iommu/arm-smmu-v3: Add NVIDIA implementation
Date:   Fri, 23 Jul 2021 12:31:38 -0700
Message-ID: <20210723193140.9690-1-nicolinc@nvidia.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c252ea11-9b8a-4399-a818-08d94e109957
X-MS-TrafficTypeDiagnostic: DM4PR12MB5229:
X-Microsoft-Antispam-PRVS: <DM4PR12MB52298F9755C7A5C7D4FB097BABE59@DM4PR12MB5229.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y4l6Hr90Hh6a1j0np9RcKF3w4Js9cMGzID0f2af3D6iMeW3NbUKJLp1nHzA4yRksEJt6Bg9vmB1a3UmMeSAmgIhfzbWv0BKOD2yY8X9HVtCLwCGy/eDsSBmmMlwhn/EGr/AVaEmuGbHQ6qK/ew0oq1NKbyYoXdj+0kasftWcN5r0Z3SDBnnkicpQgLJMi1i5/zOLgexpXXAp0p5DqoNm5tucqarq1toZOf0Jcbipt/UG576TVOOs//GdGbO1iupPpCbxjuVTvMPLdSVKZJZgn6oHSWF+ojdT3Ras1jSJ/PccbbTZRc6wjXsMn+IgSNeWFtKtoDQ5faceUbZ8FSuWKWqGc7V5S51lIcL5qqHtqBOJHCNJuf2MjKt2Xq07DQ6RpChzZ2kVHIN9e57lRxzot0mtba2UxbZ7Mp0aYrBlSNAj1yTJjFeEbjrzkfxPkix2Ap/9i9OIzajH6vZvboLDDMX1o1skelZbFqfctaPcnn8QLLWHiOT0oXfnvr2d5i/8DMZHuh1gJllFnW6Add9SS36G4uO6NoCxq+fwjJZbWC+N+/hKjHQ8zo6p5QbhZ01ff65XVJolyDX6MJ3/A6omzWJgXVXlv8F0SChUzTbxtwF4Zwp7zhT+GgBOMtv1G2I/VAGl8cEU+NYzVv+hu0Ght2jpYGOxXdiPBVr94A1Hvfwu7jk0IM0KJXxvpSchgGLf1sqj5f1ozcplkXFWWJXvLQ==
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(396003)(136003)(39860400002)(376002)(346002)(36840700001)(46966006)(426003)(36860700001)(110136005)(36756003)(47076005)(336012)(2906002)(4326008)(186003)(7416002)(478600001)(82310400003)(82740400003)(7636003)(5660300002)(1076003)(86362001)(54906003)(70206006)(316002)(8936002)(6666004)(26005)(36906005)(83380400001)(2616005)(70586007)(356005)(8676002)(7696005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2021 19:32:24.7648
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c252ea11-9b8a-4399-a818-08d94e109957
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT065.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5229
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Nicolin Chen <nicoleotsuka@gmail.com>

The SMMUv3 devices implemented in the Grace SoC support NVIDIA's custom
CMDQ-Virtualization (CMDQV) hardware. Like the new ECMDQ feature first
introduced in the ARM SMMUv3.3 specification, CMDQV adds multiple VCMDQ
interfaces to supplement the single architected SMMU_CMDQ in an effort
to reduce contention.

This patch series adds CMDQV support to the arm-smmu-v3 driver by first
borrowing the implementation infrastructure from the arm-smmu driver.
The NVIDIA implementation is then introduced along with hooks allowing
implmentations to specify custom issue_cmdlist methods. Additionally,
the original issue_cmdlist and supporting methods in the arm-smmu-v3
driver are reworked to support alternative CMDQs. 

[ nicolinc: this v1 is more of base changes for CMDQV driver; while I
  am still integrating incremental features based on VFIO mdev, I sent
  these two out in order to collect comments and suggestions to see if
  the overall structure is promising. I will add more changes in v2 or
  later versions for more detailed implementations. Thank you! ]

Nate Watterson (2):
  iommu/arm-smmu-v3: Add implementation infrastructure
  iommu/arm-smmu-v3: Add support for NVIDIA CMDQ-Virtualization hw

 MAINTAINERS                                   |   2 +
 drivers/iommu/arm/arm-smmu-v3/Makefile        |   2 +-
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-impl.c  |  15 +
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   |  71 +--
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  15 +
 .../iommu/arm/arm-smmu-v3/nvidia-smmu-v3.c    | 425 ++++++++++++++++++
 6 files changed, 503 insertions(+), 27 deletions(-)
 create mode 100644 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-impl.c
 create mode 100644 drivers/iommu/arm/arm-smmu-v3/nvidia-smmu-v3.c

-- 
2.17.1


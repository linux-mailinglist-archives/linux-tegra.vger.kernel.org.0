Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E42463D40D6
	for <lists+linux-tegra@lfdr.de>; Fri, 23 Jul 2021 21:32:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231236AbhGWSvy (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 23 Jul 2021 14:51:54 -0400
Received: from mail-bn8nam12on2082.outbound.protection.outlook.com ([40.107.237.82]:52275
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231146AbhGWSvy (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 23 Jul 2021 14:51:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mmXsVsY7Ysm5S2qpqDsGzu4hhSK2hjgYY181AZn5e26BKOtVTPgjm48GIfmI3RQUzUMx3Y/0mk3OOWuQtYcxvGuXv2m4lUJD7RExRj3VM/e908nxYpCczIxMhG3VIo0pcoQ66QcNqff10bvyjuA+nPe7l0IdVAicT7KoBKeSyLZ+G6hUA2HMFWu4iHysi6Pn5zaHaZD+tXOgpMBH6Sa5k0lPovCpVx1AtuwwHfwLbOxp4LzZ8m9gArmreanoofaiXcQZmYxFZJqC8Kx30/MF6ANU4QhX3NEhSSrXzVszLUXXfTrM2Uv/oyO/6Kky+QBTSooaSQE/DxwlqXoVI0LVcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6feyi/LDX6fYZTdjhcHsU47f42gkWFJ58Gh/3SqW/rw=;
 b=UH0eSCQhqJoJTB8jdR2GOFtwnjCrxTKgkEC42AEF93etBaupyybEsnhEY5CmqliAio0T6LrqWCB1OZY1yKIYPrOElL0dta81CAI/mSdbLDrMQqM0rUA0MWtJ+OS5aYRuhl9hub5Wiibaz8EQXFir4CIzOrQRKMopZ9NIitfBHnSbLpvOsT7oJq96xQ3iyJoQbrw871xtl7WzzYgWIQYJ8hvgHAOQPNTw3Vtt7iuLsCbIeyfL0D9nI+OlkqG0rRU4b3bFQGeIZJV8Bhk5A+UslV5aIVvoO/lgT5qXt1WgcrBHGPP4Q+spyc600gosM4UUkOWWVGnZmEe/Bm4ADvXB4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.36) smtp.rcpttodomain=huawei.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6feyi/LDX6fYZTdjhcHsU47f42gkWFJ58Gh/3SqW/rw=;
 b=Lo92Oun6NFAUQQHNgEAwZak3opO0Gv4/sKDCAMhLnWANLwm77MXSybZFnbhqzvFg0vXkquwVN0CZeFya2F4WFkCIXBOlL+AsPkLVAw0xDJURe+8skUqRBE52exYQObeZcrXPDsIRPDMy6GzUkTWP3zZbaDkeKF+ewdhC5cJNmaxaIOI6bfGtK2/ikLIu/hPO5wg+ysoBt483I2dtoyg/9Zrz6g0jpQfY9coYrnHQTR3+ckiVhdv8DMg25OO5BDWMR48F1TRWI8b/g5PBHzIE+OURvmdgzfLUzMDY2pwRjCF0eVwC8rxawlSBi3hcxVIaFyz4EjDXO6XxeQ1jyZXlcg==
Received: from DM6PR17CA0035.namprd17.prod.outlook.com (2603:10b6:5:1b3::48)
 by BN6PR1201MB2467.namprd12.prod.outlook.com (2603:10b6:404:a7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24; Fri, 23 Jul
 2021 19:32:26 +0000
Received: from DM6NAM11FT059.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1b3:cafe::20) by DM6PR17CA0035.outlook.office365.com
 (2603:10b6:5:1b3::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25 via Frontend
 Transport; Fri, 23 Jul 2021 19:32:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.36)
 smtp.mailfrom=nvidia.com; huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.36 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.36; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.36) by
 DM6NAM11FT059.mail.protection.outlook.com (10.13.172.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4352.24 via Frontend Transport; Fri, 23 Jul 2021 19:32:25 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 23 Jul
 2021 19:32:24 +0000
Received: from Asurada-Nvidia.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 23 Jul 2021 12:32:24 -0700
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
Subject: [RFC][Patch v1 1/2] iommu/arm-smmu-v3: Add implementation infrastructure
Date:   Fri, 23 Jul 2021 12:31:39 -0700
Message-ID: <20210723193140.9690-2-nicolinc@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210723193140.9690-1-nicolinc@nvidia.com>
References: <20210723193140.9690-1-nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ba9b1b49-1b21-43d5-6ab6-08d94e1099ec
X-MS-TrafficTypeDiagnostic: BN6PR1201MB2467:
X-Microsoft-Antispam-PRVS: <BN6PR1201MB246786573C482961FBD34B73ABE59@BN6PR1201MB2467.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8wrFg2cmPwUtHOs/dFV3X67UB3CgbvgpQWCarA/IdFFbedMEYYH3/qi11h8T6fbumTD+6I3NmbaE+VvYDk1UHQ3N+qYneGgAluAVw5qARlNDIXYRz1nW94tKKQYoWljBshgjdMRHYMp1gkDR644hp1Pchdt06Ov5lmgRyLJHa33pPM4OjPaAaO04cJrUfPaEwNAziWiFbrea/BV3Zpp4mmwmZJCsYZ240TwBgMMZwvg98QE0qnwV7mDxdnzBANsgesRZ1HrSDEHJrqJZOMjSq+4j+q23KpvCyfsLJmjcwr72V8w35K5Leh9KVX8HfovCQweDjjkh7xCJceMwcJvD/92eLQF4Ls218/iTjdAJGckz+2cJVgUYcQ5M7KHbgXbsleVG3ojBXphPK7TojKCQaWiWFN59edrE72VbcyVzoqipFB91f8/XN8RhvL0Q4Y7mghgElAWZPYEc6KyV1oIMAu/p4KdcxxHAGHOfDFKZPRhM/Plxp/NQB0ledql1+X8whgmQ+aHf/Bvl1/3JNAhrJ4Gfhg2XOtXgDDgo+JZI8ERWNSADqeNmuDaAtywqkuifBKfRJgfj5oSYGAPv4DJFqOJDaG9Gg0utHTBHqQXe+Ei8H6N0MDn3t3OK5hjbvI7hgIW4bFZKV6leoy+X+2HsxfbdCMEx/q+GGAI7QZnkozIz/lE4fARXy5FzWxE2lHi35UHZ67/Zb5VNudlOUSPTcMAZK1Gn08lf48ZAyp6//Ro=
X-Forefront-Antispam-Report: CIP:216.228.112.36;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid05.nvidia.com;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(396003)(39860400002)(36840700001)(46966006)(6666004)(8936002)(8676002)(36906005)(4326008)(86362001)(26005)(82310400003)(70586007)(70206006)(186003)(336012)(83380400001)(478600001)(426003)(36860700001)(7416002)(82740400003)(2906002)(36756003)(7636003)(316002)(356005)(5660300002)(7696005)(1076003)(47076005)(54906003)(110136005)(2616005)(309714004);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2021 19:32:25.7387
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba9b1b49-1b21-43d5-6ab6-08d94e1099ec
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.36];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT059.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB2467
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Nate Watterson <nwatterson@nvidia.com>

Copy the arm-smmu driver's infrastructure for handling implementation
specific details outside the flow of architectural code.

Signed-off-by: Nate Watterson <nwatterson@nvidia.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/Makefile           | 2 +-
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-impl.c | 8 ++++++++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c      | 4 ++++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h      | 4 ++++
 4 files changed, 17 insertions(+), 1 deletion(-)
 create mode 100644 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-impl.c

diff --git a/drivers/iommu/arm/arm-smmu-v3/Makefile b/drivers/iommu/arm/arm-smmu-v3/Makefile
index 54feb1ecccad..1f5838d3351b 100644
--- a/drivers/iommu/arm/arm-smmu-v3/Makefile
+++ b/drivers/iommu/arm/arm-smmu-v3/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_ARM_SMMU_V3) += arm_smmu_v3.o
-arm_smmu_v3-objs-y += arm-smmu-v3.o
+arm_smmu_v3-objs-y += arm-smmu-v3.o arm-smmu-v3-impl.o
 arm_smmu_v3-objs-$(CONFIG_ARM_SMMU_V3_SVA) += arm-smmu-v3-sva.o
 arm_smmu_v3-objs := $(arm_smmu_v3-objs-y)
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-impl.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-impl.c
new file mode 100644
index 000000000000..6947d28067a8
--- /dev/null
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-impl.c
@@ -0,0 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include "arm-smmu-v3.h"
+
+struct arm_smmu_device *arm_smmu_v3_impl_init(struct arm_smmu_device *smmu)
+{
+	return smmu;
+}
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 235f9bdaeaf2..b2d23de2b207 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -3771,6 +3771,10 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 			return ret;
 	}
 
+	smmu = arm_smmu_v3_impl_init(smmu);
+	if (IS_ERR(smmu))
+		return PTR_ERR(smmu);
+
 	/* Set bypass mode according to firmware probing result */
 	bypass = !!ret;
 
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index 4cb136f07914..4c60ba14221b 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -806,4 +806,8 @@ static inline u32 arm_smmu_sva_get_pasid(struct iommu_sva *handle)
 
 static inline void arm_smmu_sva_notifier_synchronize(void) {}
 #endif /* CONFIG_ARM_SMMU_V3_SVA */
+
+/* Implementation details */
+struct arm_smmu_device *arm_smmu_v3_impl_init(struct arm_smmu_device *smmu);
+
 #endif /* _ARM_SMMU_V3_H */
-- 
2.17.1


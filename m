Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F75B4525F0
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Nov 2021 02:57:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358426AbhKPCAc (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 15 Nov 2021 21:00:32 -0500
Received: from mail-sgaapc01on2124.outbound.protection.outlook.com ([40.107.215.124]:49089
        "EHLO APC01-SG2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1382680AbhKPB61 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 15 Nov 2021 20:58:27 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W7Yv+KpyYJmOU50U8ShUXK9yJZbY4Ziw8oJYyscYS1+SYkqT2RMdeauAj3kvqnhgtthYGeFt0+VIIghyFHb+EWTZHC0yX0BQXW7nKeBIJFD9P9e+o1B/Hmw8XoSHubANdm3iJ7ffsYwj5O4QsDFNgC7FaMJ8EHUEHY/ogp7JKSziYj8GyiZeTSQqZXbjjpsREG/Ns+IHS8Wkq3f9aZqMZrELSWGb3etIHFv61EtfWw26HFfIdZ/uP4nRPhwjmKIemT9uGY4zn45FOp+uYHWISCl3OWWZcAVvcMe/cbr7uKgsbFCxH8JwKRHu2kRZx/lcqakGlGoJqTW3M/lHA/c5GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fCCORRfyUQK+tA/oPdxucZ916NMMqLoViQ4/A35buvw=;
 b=W+o/qDGY63kp5PbbvyohnTqVJR5Ig4p1V6ZEBgM0qToGxc3Y3dCCXpYSwk2mOZR/5rjiZZ3gK3jVxLO47tIHx4705ozctEhCUUtFYFO7wV4m93cal7HnaU9eDY9dCYYuF4vGBqM5iGkmrNDwebwccSdBkhgYnqvXn0HtRpwayi4CXBxe7IejiW/YIN/PAX4Ib+tkpS8vrArZ6REDW4B/9w5ujxMWJWps7VgzGrNhtVSYU0Vavtw8ijzFQsdUXPDQ9M+p6dBJsFV06V6sVSczuLes9egXoZLT/pw7tivmh7dTuQcyVdDPkBLgGaDHC6DFqHG3KeV1e2iqN5k8NO8KFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com;
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fCCORRfyUQK+tA/oPdxucZ916NMMqLoViQ4/A35buvw=;
 b=VwTKUkGudmbRGLCS0P7IsTQqVE98aZ51++PI8lKGpZvi5fN2siZKmolY78Gq+Hv4jQ3NBDekutFE/m8HQVddkn6/WiYePqtyjm53tLQaaYHEAyXZ1wb/NEi+mmDQfiVhtULWWVfWhY/8znRrPnn7T68R5KdTU35mu1fCHMGJrFA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PSAPR06MB4021.apcprd06.prod.outlook.com (2603:1096:301:37::11)
 by PU1PR06MB2117.apcprd06.prod.outlook.com (2603:1096:803:36::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Tue, 16 Nov
 2021 01:55:25 +0000
Received: from PSAPR06MB4021.apcprd06.prod.outlook.com
 ([fe80::395a:f2d7:d67f:b385]) by PSAPR06MB4021.apcprd06.prod.outlook.com
 ([fe80::395a:f2d7:d67f:b385%5]) with mapi id 15.20.4690.027; Tue, 16 Nov 2021
 01:55:25 +0000
From:   Bernard Zhao <bernard@vivo.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Bernard Zhao <bernard@vivo.com>
Subject: [PATCH] drm/tegra: remove no need NULL check before kfree
Date:   Mon, 15 Nov 2021 17:55:13 -0800
Message-Id: <20211116015513.27147-1-bernard@vivo.com>
X-Mailer: git-send-email 2.33.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR0302CA0010.apcprd03.prod.outlook.com
 (2603:1096:3:2::20) To PSAPR06MB4021.apcprd06.prod.outlook.com
 (2603:1096:301:37::11)
MIME-Version: 1.0
Received: from ubuntu.localdomain (203.90.234.87) by SG2PR0302CA0010.apcprd03.prod.outlook.com (2603:1096:3:2::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.15 via Frontend Transport; Tue, 16 Nov 2021 01:55:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ae98262-3383-4b60-a810-08d9a8a42864
X-MS-TrafficTypeDiagnostic: PU1PR06MB2117:
X-Microsoft-Antispam-PRVS: <PU1PR06MB21177CD8AD17E641E8C28614DF999@PU1PR06MB2117.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kLkLvlGrsOfVFgdgUc2NYK9kDoYF4n/tEj/Ri5ZBnfe7D34ubB660NpVCU6vtCubqIBuENS1uxaN8Pai02i1LkHlC6iUAIaOIHEMuFg7Mnm0IkLnTajM42aKkIENTIeVcmU7e7ZW0r952FLvP+OOWWBlsTHKsBSaC5lF7Rnd8UIfPRtxTZV+tWCiQBZ8MIWNEHgZsk4VfHC5ekOVp5EX7Ib4Rp1mzxNDX9buzUsxb9h1zqANxnZo1kcKcmeQqksGEeAg6DIfhJFngMppBPXEWDebgR7PV4bMNCXbhK+i9Pyv99+AbSr+vvrElY/eJOGSD08gUnDtS8bLWvvNux4O9UL5rFc7Mir5Gsvi05i03tSe9Sv1nz4DLIjqbS+33RIX4h4XCn8EZ4sArOrQW/e/Wm53xM6gs2oUIcVA9dxOSvFQ1ReJoRokxlZANHA+NjefOzfJZYBO+v8NqcqCs9UTTCb3A1TlgcD2QeJzydvCzr/NURto2on9UKE4zn4XDT+b1QJrGqqtfuiUYrW4NVQq1u9ZCLw+fPzgSWnCB919kRpC5QdrjyjxRwR2CRDLTbOZU3hE78TBBn/dXsVgAMYQA7CIWqbxFk9ddI3BO7zssL274P/PRJZ6/tcPkIcUjiKRtBm1hnU/rT4eGHGGS56HtoSQF31gkP9J0U3/axz3y8GOBUjRhQlxRcCgUwZFhsLh+oA1LbHsO+PgzgBhBU8Bmg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR06MB4021.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(107886003)(1076003)(508600001)(52116002)(83380400001)(186003)(2616005)(66476007)(66556008)(86362001)(5660300002)(2906002)(8936002)(8676002)(316002)(6666004)(6486002)(956004)(66946007)(110136005)(26005)(6506007)(4326008)(36756003)(6512007)(38350700002)(4744005)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?valL/Bjl1AIOUhzvVoCWKXeIdvEVgxRIh0HZYWa8DYHFVU1J2AHk7/q/w/6e?=
 =?us-ascii?Q?SI3YdRRl+dT/DKJTJwnoAxiZBgTB2TBw2MThQxst7+K3qkUqjo2lSi8KNqOi?=
 =?us-ascii?Q?A5w2Xa/h+R41A8d5U7yOD+ejGhg+y3yjX+ZJepw8fxp5FHkaZk9l/tBhWjwI?=
 =?us-ascii?Q?YitPfiqfbyeH6WxQsDQ9dQWy4QdX9WpNnp7bZ5nvFeunvv/foWTnnXgr6/5r?=
 =?us-ascii?Q?noif4hhKYTYgnTcFnEghm4gYet2vekLimtoT3O/AdLt2CLuW6vgM/m8izeJy?=
 =?us-ascii?Q?aBU56vKIX+Z58HJBKK7orH6FeflNxEaMrDZma7NgwdzzrF5JFi2v55qJPC1Y?=
 =?us-ascii?Q?bHNqDBe4fYBuGojLJ+/4iVnrasICIe1TO8jKUY584OLBUVWj5nKYA/hF6TxT?=
 =?us-ascii?Q?Qo3uTqIVKLOJf0eLZKc9OpE2hHz1LuCzLh80LCAaV6c4fy7OlrcFd2vHZHKn?=
 =?us-ascii?Q?KTj1dKHpNYIHbgRwnxdyJG1vGJvyjxT49ydsMRfaGgzYapRhk8s6zQ4zdRt8?=
 =?us-ascii?Q?gJkLu3Ypt9tFjyhcPtOw7J2t0CIDdqru3+FTagd6TBNw0adCCHILxU8RGLKS?=
 =?us-ascii?Q?JBxPxerCgpZKlfFbCqxtSQxc6bszT0xwn+JmnW7UKdFDDZQLfsRRQJ+KG1TL?=
 =?us-ascii?Q?E+19H5pA47tBRz9AiJPuenwn9FLRf1HRh9zWNrLC9JwN6OipYevE7HE2WlUC?=
 =?us-ascii?Q?bsXmcs/XPcHQQq84CyqyeOw28VGpR2YVL+0nNn25vsrc1KA4jf/YjRdNCYUW?=
 =?us-ascii?Q?J4iRdeO8OdwIRwzbDcoIzORAFHIjQmypSnAgviRnJciwlpMMLWntyFUTcPWJ?=
 =?us-ascii?Q?enNszGeC+0AoAJgULgh0vCXui83hA6/vHcwDwn/MSTSnp7JgF5KY8ZBu9BvS?=
 =?us-ascii?Q?Hk6ndb7thpXWmA+EyLn+bc/CUdCqE4gvFDNWBYwh/LNv4PDHY94kqaHAmb8S?=
 =?us-ascii?Q?CJqPjV5y7CWc1ZupI1dyo0dnW4Jn3TM71UsrUYTbC+UhVu4jLp+D3gbOOF4G?=
 =?us-ascii?Q?Cp8B5junJkp96W/aO5ZS5y1Zho7wURt5pQFGK0vkHbJDMG0R4EccsCIiF9QE?=
 =?us-ascii?Q?eMZuoGgtRg0c701MJAchciaoRc9kiHlNsr4McXqFY/uHI6jsW5Z1ozVnA+nZ?=
 =?us-ascii?Q?f3RnrU+fOGh9IbkYWeDUuXMEE/kE/h9W0mlvpPVZygQ86DcCH95jjtDM6yda?=
 =?us-ascii?Q?zDUVNJG3guuuqTSzijjB5vpOuYvDMGTx/MkWyjBDR4Lbb7jDMoXA0DjW8s4j?=
 =?us-ascii?Q?tM5jgIrnP6xZJSwkal+tJsO50ITGhBpbuRuMWlOdVaDURwciP8f97BWFlmN6?=
 =?us-ascii?Q?g/Hju05fuPbV3KvvOwtolSaiGTblwa7dilZjjo2PPIUykgjqF+HD2/LO46b+?=
 =?us-ascii?Q?ey/lnwRw4RCsGgLTpxIsI4S9n1F8+Kfj7dYw3tsWFfIKiZ+9HrNuU7icd+iG?=
 =?us-ascii?Q?k0i+2zwMrvORNnzNjsSJhX/YiSPY/C3TYBPYztx5IiRiaSIB9GH+I2Lrg6Q3?=
 =?us-ascii?Q?+g1oqgYVR84dSXI5p2Adkxf3QRgd2UsYVmJWozmwAMJ5YgJ6vUFq5MFbRO09?=
 =?us-ascii?Q?ZlrZBOyspi/jIZn2xrB2L5Qd+A5RQNd0xK8nJvi1nW93R+TRL3n9r3h77EjY?=
 =?us-ascii?Q?L2JGB8G2ebHflwTlRzoN3Os=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ae98262-3383-4b60-a810-08d9a8a42864
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4021.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 01:55:25.7335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RAp0469j2LO3s54MIhzQKO9p+kVO7IljvjeX+5WLfkk2jAP5PeqKv++tBHK5e7qzrDN5GPxl9JAZRrL+qj1YPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU1PR06MB2117
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This change is to cleanup the code a bit.

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/tegra/submit.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tegra/submit.c b/drivers/gpu/drm/tegra/submit.c
index 776f825df52f..c2fc9677742e 100644
--- a/drivers/gpu/drm/tegra/submit.c
+++ b/drivers/gpu/drm/tegra/submit.c
@@ -608,12 +608,10 @@ int tegra_drm_ioctl_channel_submit(struct drm_device *drm, void *data,
 	if (job_data && job_data->used_mappings) {
 		for (i = 0; i < job_data->num_used_mappings; i++)
 			tegra_drm_mapping_put(job_data->used_mappings[i].mapping);
-
-		kfree(job_data->used_mappings);
 	}
 
-	if (job_data)
-		kfree(job_data);
+	kfree(job_data->used_mappings);
+	kfree(job_data);
 put_bo:
 	gather_bo_put(&bo->base);
 unlock:
-- 
2.33.1


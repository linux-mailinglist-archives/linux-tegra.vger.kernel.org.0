Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73569455514
	for <lists+linux-tegra@lfdr.de>; Thu, 18 Nov 2021 08:07:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243545AbhKRHKb (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 18 Nov 2021 02:10:31 -0500
Received: from mail-dm6nam10on2082.outbound.protection.outlook.com ([40.107.93.82]:47040
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231443AbhKRHK3 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 18 Nov 2021 02:10:29 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mV09UQ5gwwy9Aff1LKDZKNFqrZbwOWzXwovEno5tMXEhSy+Y5bwIh0sGPTSp/RTtDsQHYwjSc354bdhZCkM9/6kPnr0JrVfEPFjw03fCgB6cv2cORcoIoChDcn+IORSi01kDtJcZAlCdt+ZBLdc52xMuWN/GeKvc/DOVw0EYZcslMQWkxUnEtZHkpUsQWxLJVRRagoo2yb2XvzOm9YmIDb/bssdchvCGXL4LtOAZXip8KKgsu03Xfs0VURejUmRUOwg8FgTi2GpuPf3q5us1SpLaPxPdvixlc+YxExxzxz+AWxdMS8KQhljAm7QTuCsyInduoQO5vXsgojAPGtHylg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kw3WGDiN6C5GEm48Zh9wz4VUJhjoF5GHIss6atSxtQc=;
 b=BUWj/LktWL3U7Z3taQRgY52yP/fddLa91xJ7r2ixYbi5hvPhDTa7MC63sMltyE/tvFDRfeuyAEs6CipAplNc+LOOJhyJcMSa5fJc+gFEfR+JxT+JfwO/y+slPp175rqIahhzasjHwVwQYYQ0oKfw2YpmegsgUXycOsRVWy29GT+EpC0TmzM3xWctWacle3EUhZ1z3ua2GTg11FR2t1hWepKEZCiDEczc35WwJ8awD/LeK6+11f7dkR2VywzvQz/i1wb7u7EhJEvRiasOZcV5MrisO4+U8sxEmTPS+24L7KmRPlqUvhrue3E7UC/xU6w65HqV6u/1FMxioizJSilCsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kw3WGDiN6C5GEm48Zh9wz4VUJhjoF5GHIss6atSxtQc=;
 b=PIQbCXKAsf25ZImrPjXj6Vax9rRSe5TU3SeQFrqqef9rL/tSbkkhfXAtKVXGgBTtiB1ANhXENk5VFO3w0AChLoSMgbsJ0gFTCqd/uulhApEL0wjW0Apytu7A2vCV6JKBYgMJfDjrv8jvI8g38F2R08JrGXah7/w61ILYkQeQP7cXNbHmVO87+HLaQ89JZCgc7v5LNN2oHGkeEdV6JIYx5lvTnplFfBd98dMvC0+o1EdctjHJQb9pfzcbou0jzqC33ZAoZi5JTxVvZCy6nkjbS7DzZHF0D997bseS3xlv+bcbgt13bn3c+QnuBzQwCoeFERzC2CJbl+/i1ZvzT1Ov9A==
Received: from BN9PR03CA0809.namprd03.prod.outlook.com (2603:10b6:408:13f::34)
 by CH2PR12MB3734.namprd12.prod.outlook.com (2603:10b6:610:2a::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Thu, 18 Nov
 2021 07:07:26 +0000
Received: from BN8NAM11FT046.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13f:cafe::c5) by BN9PR03CA0809.outlook.office365.com
 (2603:10b6:408:13f::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27 via Frontend
 Transport; Thu, 18 Nov 2021 07:07:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 BN8NAM11FT046.mail.protection.outlook.com (10.13.177.127) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4713.20 via Frontend Transport; Thu, 18 Nov 2021 07:07:25 +0000
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 17 Nov
 2021 23:07:24 -0800
Received: from audio.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Thu, 18 Nov 2021 07:07:22 +0000
From:   Sameer Pujar <spujar@nvidia.com>
To:     <broonie@kernel.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
        <tiwai@suse.com>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <alsa-devel@alsa-project.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH v3 00/16] Kcontrol get/put cleanup in Tegra drivers
Date:   Thu, 18 Nov 2021 12:36:55 +0530
Message-ID: <1637219231-406-1-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ffd469ee-dc3e-49db-3f20-08d9aa621326
X-MS-TrafficTypeDiagnostic: CH2PR12MB3734:
X-Microsoft-Antispam-PRVS: <CH2PR12MB3734197C95EC9BDD26136171A79B9@CH2PR12MB3734.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PRXjhyXTuA9+eRAcbPTNH/pm2h8aIqsVqBhp/5eqSXeJT0GaxtCBQR+GmJK6iOXpqqwSyMsQtVEENf1mJhd47AYaTouevI3WxKkU0IJr4u//PNkJX8fAwIQO7xbMU1xPjJuXbni2wpMC3J0YFS6UVCj7Z0Nij7jvC5sS7eYXbraow0QjiPZQ6qZriMYWYvXO43fC0eHSgSzaZOVdo42YR7hrQqOgaeeO2EZLVrB9oNvDYz62ASnyZb8IfqDLaNmGUcwNC8ODEgqlv1c6ibYkJ2aq/+0Lq7FOdKkK/uIDDGOqNIQc1c+yiSkou4mMlkAmMUNinKiQmPm2WSPjv7Rv6h6TiIZpd0MNpUcZNHzC24MBZlD6KF8C0b+KHDx5GcdEUWNvZ2ozbaAyWYk/SXZ4hnCIAfn7BlxVwiZAV1pYPUTwdnHFMZ7gCZLpoGTmI0gs03jEO47uvHifNMWHffZt+aTitVBpowazifRE0mtgSQTJbqlhTP6Vej46AyxZHG9eOPFpuk/TK3CsL28YhjeGnXnpUswkUCKmY8mWhsdYyGfas+zlJKR6FhEtc1RhlunTjYwEOII5ifxW+iGxB+9tgZLnJlqLU2HofKwXxtcPJ8T4DnZTnHtN2buYbf79f0Gy2OolfKw7svBiR/4LMPFfGyc05+kzdsa6n093yFiumb1xCJJ81Xiqvc4mzIGKi2CyGOzKkCeJAFjhR83Gs8Gi5nmD2rqPlq1751OMKLCiJ1NThDUYGLOLVmjc7gd/XZ6pMNUW/hPKIqxdltmhubdgcFp65SL2e4eyX6Oq67Lec3A=
X-Forefront-Antispam-Report: CIP:216.228.112.32;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid01.nvidia.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(26005)(5660300002)(8676002)(2906002)(107886003)(6666004)(8936002)(36756003)(2616005)(82310400003)(426003)(7696005)(4326008)(316002)(186003)(336012)(86362001)(356005)(47076005)(7636003)(110136005)(508600001)(70586007)(54906003)(966005)(83380400001)(36860700001)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 07:07:25.2807
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ffd469ee-dc3e-49db-3f20-08d9aa621326
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.32];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT046.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3734
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

There are two cleanups in the series:
 1. Use correct value type for enum controls. This is suggested by
    Takashi during review of v2.

 2. This series fixes kcontrol put callback in some of the Tegra drivers
    which are used on platforms based on Tegra210 and later. The callback
    is expected to return 1 whenever the HW update is done.

    This idea is suggested by Jaroslav. Similar suggestion came from
    Mark during review of series [0] and drivers under this were updated
    to return 1, but missed to take care of duplicate updates. This series
    updates all concerned drivers to return proper values and duplicate
    updates are filtered out.

I have added 'Suggested-by" tags accordingly.

[0] https://lore.kernel.org/linux-arm-kernel/20210913142307.GF4283@sirena.org.uk/

Changelog
=========
 v2->v3:
 -------
   * Add fixes related to wrong value type as suggested by Takashi.
     Relevant drivers are updated as part of it.

   * Use separate get/put callbacks for each mixer control. The common
     part is pushed to separate function wherever applicable, thus
     removing usage of strstr() calls. The return values are fixed
     as suggested.


 v1->v2:
 -------
   * ADMAIF, I2S, DMIC and DSPK drivers updated to take care of
     duplicate updates.
   * Similarly new patches are added for AHUB, MVC, SFC, AMX, ADX
     and Mixer drivers.

Sameer Pujar (16):
  ASoC: tegra: Fix wrong value type in ADMAIF
  ASoC: tegra: Fix wrong value type in I2S
  ASoC: tegra: Fix wrong value type in DMIC
  ASoC: tegra: Fix wrong value type in DSPK
  ASoC: tegra: Fix wrong value type in SFC
  ASoC: tegra: Fix wrong value type in MVC
  ASoC: tegra: Fix kcontrol put callback in ADMAIF
  ASoC: tegra: Fix kcontrol put callback in I2S
  ASoC: tegra: Fix kcontrol put callback in DMIC
  ASoC: tegra: Fix kcontrol put callback in DSPK
  ASoC: tegra: Fix kcontrol put callback in AHUB
  ASoC: tegra: Fix kcontrol put callback in MVC
  ASoC: tegra: Fix kcontrol put callback in SFC
  ASoC: tegra: Fix kcontrol put callback in AMX
  ASoC: tegra: Fix kcontrol put callback in ADX
  ASoC: tegra: Fix kcontrol put callback in Mixer

 sound/soc/tegra/tegra186_dspk.c   | 181 ++++++++++++++++++-----
 sound/soc/tegra/tegra210_admaif.c | 140 ++++++++++++++----
 sound/soc/tegra/tegra210_adx.c    |   3 +
 sound/soc/tegra/tegra210_ahub.c   |  11 +-
 sound/soc/tegra/tegra210_amx.c    |   3 +
 sound/soc/tegra/tegra210_dmic.c   | 184 +++++++++++++++++++-----
 sound/soc/tegra/tegra210_i2s.c    | 296 +++++++++++++++++++++++++++++---------
 sound/soc/tegra/tegra210_mixer.c  |  26 +++-
 sound/soc/tegra/tegra210_mvc.c    |  30 ++--
 sound/soc/tegra/tegra210_sfc.c    | 123 ++++++++++++----
 10 files changed, 780 insertions(+), 217 deletions(-)

-- 
2.7.4


Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1DCDD7EC84
	for <lists+linux-tegra@lfdr.de>; Fri,  2 Aug 2019 08:17:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726818AbfHBGRf (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 2 Aug 2019 02:17:35 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:2019 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726667AbfHBGRf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 2 Aug 2019 02:17:35 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d43d57e0000>; Thu, 01 Aug 2019 23:17:35 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 01 Aug 2019 23:17:34 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 01 Aug 2019 23:17:34 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 2 Aug
 2019 06:17:34 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 2 Aug
 2019 06:17:34 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 2 Aug 2019 06:17:34 +0000
Received: from vidyas-desktop.nvidia.com (Not Verified[10.24.37.38]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5d43d57b0000>; Thu, 01 Aug 2019 23:17:33 -0700
From:   Vidya Sagar <vidyas@nvidia.com>
To:     <talho@nvidia.com>, <sivaramn@nvidia.com>, <stefank@nvidia.com>,
        <treding@nvidia.com>, <jonathanh@nvidia.com>
CC:     <lorenzo.pieralisi@arm.com>, <linux-tegra@vger.kernel.org>,
        <kthota@nvidia.com>, <mmaddireddy@nvidia.com>, <vidyas@nvidia.com>,
        <sagar.tv@gmail.com>
Subject: [PATCH] firmware: tegra: Move BPMP resume to noirq phase
Date:   Fri, 2 Aug 2019 11:47:27 +0530
Message-ID: <20190802061727.18177-1-vidyas@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1564726655; bh=gH464XhNyJxAr3+NNzQYuM4b+OIK1l8vDzoRTZrKRAg=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         X-NVConfidentiality:MIME-Version:Content-Type;
        b=njN6OoyP0qMUduWUis2PggOpFsbRlPL+tNeVd+cqAZHg88AD+xf+rANP2ZkLXawft
         r/WwMKqd4PW7LgGmToDKvXqLlgZ6Y41e0t71sbv6MN0x4tWhWYA1ZSq/+rXDkHKqGe
         kv7jrXZ218X8k0cMVZzSFUEJ9u6hGKTvV3jV0bNtjYK5hW0Dgzf7eApYylMaFOncQk
         gWcpE3idJt6SG638GVrIbcf6g/VwPgZ591GV3sstHkueTgZMpNKwWVAsNWwJxxBgQ6
         lbNyzFUYR0LQD1laFAfAiHB8hQhA7gPzUs2/ePQwWbxvfquSu4zIclcm9T/lbhrrck
         iAlc8eOIo4RiQ==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Modules like PCIe in Tegra194 need BPMP firmware services in noirq phase
and hence move BPMP resume to noirq phase.
This patch is verified on Tegra210, Tegra186 and Tegra194.

Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
---
 drivers/firmware/tegra/bpmp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/tegra/bpmp.c b/drivers/firmware/tegra/bpmp.c
index 19c56133234b..6741fcda0c37 100644
--- a/drivers/firmware/tegra/bpmp.c
+++ b/drivers/firmware/tegra/bpmp.c
@@ -804,7 +804,7 @@ static int __maybe_unused tegra_bpmp_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops tegra_bpmp_pm_ops = {
-	.resume_early = tegra_bpmp_resume,
+	.resume_noirq = tegra_bpmp_resume,
 };
 
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_186_SOC) || \
-- 
2.17.1


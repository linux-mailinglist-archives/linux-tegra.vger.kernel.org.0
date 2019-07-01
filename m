Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D98745CEC
	for <lists+linux-tegra@lfdr.de>; Fri, 14 Jun 2019 14:35:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727792AbfFNMfk (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 14 Jun 2019 08:35:40 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:4943 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727544AbfFNMfk (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 14 Jun 2019 08:35:40 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d03949b0000>; Fri, 14 Jun 2019 05:35:39 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Fri, 14 Jun 2019 05:35:39 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Fri, 14 Jun 2019 05:35:39 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL103.nvidia.com
 (172.20.187.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 14 Jun
 2019 12:35:39 +0000
Received: from HQMAIL104.nvidia.com (172.18.146.11) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 14 Jun
 2019 12:35:39 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL104.nvidia.com
 (172.18.146.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 14 Jun 2019 12:35:39 +0000
Received: from dhcp-10-19-65-14.client.nvidia.com (Not Verified[10.19.65.14]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5d0394990006>; Fri, 14 Jun 2019 05:35:38 -0700
From:   Bitan Biswas <bbiswas@nvidia.com>
To:     Jassi Brar <jassisinghbrar@gmail.com>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>
CC:     Bitan Biswas <bbiswas@nvidia.com>
Subject: [PATCH V1 1/2] mailbox: tegra: hsp: add noirq resume
Date:   Fri, 14 Jun 2019 05:35:33 -0700
Message-ID: <1560515734-2085-1-git-send-email-bbiswas@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1560515739; bh=zRoMbYIjQMmWezSesd1EA4lPB5v1UP2P6lqtet08dSs=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         X-NVConfidentiality:MIME-Version:Content-Type;
        b=sOpvIi5g1waVD9YgMnJF5KE/n/9oQrqG4wrDRrHY5VhrC0S/IEIo+L0bMlipzKfB2
         N2vWy3S2bfO0jXk+bUmiznz2IT20hzYtDNcc0ch+TkX6+AJJ7MNT52e9fmg9+T7XvN
         OdBrhQ0a5Ek65uAVAGlLCHRJ09d9Sb66DUHrBVwlbMMZuw3vqWChKHa2KHPHlmBrC8
         2VIIevwq27VEyXvfpiJ2NoGRIjhQbblTIR4boCe85ucnL77hrNnZa7oVySxroAF3+x
         9VpAcd/1JyC5oAYX2TO0FKXxSWBA5b4w0gcLsojbbqh+wqISHo72bxrOr4EGXy+0+q
         Xg7mxLeGmqkEQ==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add noirq resume instead of resume callback for Tegra HSP. Tegra HSP
resume needs tegra_hsp_doorbell_startup() call to fix timeout error for
tegra_bpmp_transfer() during genpd resume noirq on jetson-tx2.

Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
---
 drivers/mailbox/tegra-hsp.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/mailbox/tegra-hsp.c b/drivers/mailbox/tegra-hsp.c
index 91f1a0c..f147374 100644
--- a/drivers/mailbox/tegra-hsp.c
+++ b/drivers/mailbox/tegra-hsp.c
@@ -771,10 +771,16 @@ static int tegra_hsp_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int __maybe_unused tegra_hsp_resume(struct device *dev)
+static int __maybe_unused tegra_hsp_noirq_resume(struct device *dev)
 {
 	struct tegra_hsp *hsp = dev_get_drvdata(dev);
 	unsigned int i;
+	struct tegra_hsp_doorbell *db;
+
+	list_for_each_entry(db, &hsp->doorbells, list) {
+		if (db && db->channel.chan)
+			tegra_hsp_doorbell_startup(db->channel.chan);
+	}
 
 	for (i = 0; i < hsp->num_sm; i++) {
 		struct tegra_hsp_mailbox *mb = &hsp->mailboxes[i];
@@ -786,7 +792,9 @@ static int __maybe_unused tegra_hsp_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(tegra_hsp_pm_ops, NULL, tegra_hsp_resume);
+static const struct dev_pm_ops tegra_hsp_pm_ops = {
+	.resume_noirq   = tegra_hsp_noirq_resume,
+};
 
 static const struct tegra_hsp_db_map tegra186_hsp_db_map[] = {
 	{ "ccplex", TEGRA_HSP_DB_MASTER_CCPLEX, HSP_DB_CCPLEX, },
-- 
2.7.4


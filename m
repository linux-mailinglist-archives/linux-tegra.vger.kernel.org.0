Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2613A123677
	for <lists+linux-tegra@lfdr.de>; Tue, 17 Dec 2019 21:05:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728309AbfLQUFn (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 17 Dec 2019 15:05:43 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:15578 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727587AbfLQUEO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 17 Dec 2019 15:04:14 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5df934b40000>; Tue, 17 Dec 2019 12:04:04 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 17 Dec 2019 12:04:13 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 17 Dec 2019 12:04:13 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 17 Dec
 2019 20:04:12 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 17 Dec
 2019 20:04:12 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 17 Dec 2019 20:04:12 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.174.101]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5df934bb0003>; Tue, 17 Dec 2019 12:04:12 -0800
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <digetx@gmail.com>,
        <mperttunen@nvidia.com>, <gregkh@linuxfoundation.org>,
        <sboyd@kernel.org>, <robh+dt@kernel.org>, <mark.rutland@arm.com>
CC:     <pdeschrijver@nvidia.com>, <pgaikwad@nvidia.com>,
        <spujar@nvidia.com>, <josephl@nvidia.com>,
        <daniel.lezcano@linaro.org>, <mmaddireddy@nvidia.com>,
        <markz@nvidia.com>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 03/19] clk: tegra: Fix Tegra PMC clock out parents
Date:   Tue, 17 Dec 2019 12:03:50 -0800
Message-ID: <1576613046-17159-4-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576613046-17159-1-git-send-email-skomatineni@nvidia.com>
References: <1576613046-17159-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1576613044; bh=jX1cHxQTxMoGEsw+O/JuXtnczaKSZYeLGNN+1j++LWw=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=IlzyvjgspuI/BU5JYb2/qZDJsuwGO4cN6eU4lJCx7tKZEo9uKzWxTsxUYbGDKkTzv
         JuWUdVObU/8rcrMgJfoEVQnuada0Q4Oo49iJLiUmJ4LMtREQCoXzjT0xrbNIV3MU/N
         1F3O1dfZtkr5vCYWg6dQ7VvWrhi2h8hNVjjCItfo49NqqHJRLw4v0OXSnjNfDbs4EN
         KGB0LIu4xcdVHoZQpW9yDrT8ctCHYl2lXbydsr7iokq7bt2rsyMbDjNOkrN0MqHwKT
         LSffKAOg1w/1QxensP4jihy/rTuoGINsiEAg6A5AqKqnZRJKlOYaEnY6wFltd3Kh2k
         OCF40kZyVDHoA==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Tegra PMC clock out parents are osc, osc_div2, osc_div4 and extern
clock.

Clock driver is using incorrect parents clk_m, clk_m_div2, clk_m_div4
for PMC clocks.

This patch fixes this.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/clk/tegra/clk-tegra-pmc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra-pmc.c b/drivers/clk/tegra/clk-tegra-pmc.c
index bec3e008335f..5e044ba1ae36 100644
--- a/drivers/clk/tegra/clk-tegra-pmc.c
+++ b/drivers/clk/tegra/clk-tegra-pmc.c
@@ -49,16 +49,16 @@ struct pmc_clk_init_data {
 
 static DEFINE_SPINLOCK(clk_out_lock);
 
-static const char *clk_out1_parents[] = { "clk_m", "clk_m_div2",
-	"clk_m_div4", "extern1",
+static const char *clk_out1_parents[] = { "osc", "osc_div2",
+	"osc_div4", "extern1",
 };
 
-static const char *clk_out2_parents[] = { "clk_m", "clk_m_div2",
-	"clk_m_div4", "extern2",
+static const char *clk_out2_parents[] = { "osc", "osc_div2",
+	"osc_div4", "extern2",
 };
 
-static const char *clk_out3_parents[] = { "clk_m", "clk_m_div2",
-	"clk_m_div4", "extern3",
+static const char *clk_out3_parents[] = { "osc", "osc_div2",
+	"osc_div4", "extern3",
 };
 
 static struct pmc_clk_init_data pmc_clks[] = {
-- 
2.7.4


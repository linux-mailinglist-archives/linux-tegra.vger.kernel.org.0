Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8452C20AF87
	for <lists+linux-tegra@lfdr.de>; Fri, 26 Jun 2020 12:20:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727806AbgFZKUH (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 26 Jun 2020 06:20:07 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:1617 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727770AbgFZKT7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 26 Jun 2020 06:19:59 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ef5cbbf0000>; Fri, 26 Jun 2020 03:19:43 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 26 Jun 2020 03:19:56 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 26 Jun 2020 03:19:56 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 26 Jun
 2020 10:19:47 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 26 Jun 2020 10:19:47 +0000
Received: from nkristam-ubuntu.nvidia.com (Not Verified[10.19.67.128]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5ef5cbc10000>; Fri, 26 Jun 2020 03:19:47 -0700
From:   Nagarjuna Kristam <nkristam@nvidia.com>
To:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <mark.rutland@arm.com>, <robh+dt@kernel.org>, <kishon@ti.com>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Nagarjuna Kristam <nkristam@nvidia.com>
Subject: [PATCH V4 7/7] phy: tegra: xusb: Enable charger detect for Tegra210
Date:   Fri, 26 Jun 2020 15:49:02 +0530
Message-ID: <1593166742-23592-8-git-send-email-nkristam@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593166742-23592-1-git-send-email-nkristam@nvidia.com>
References: <1593166742-23592-1-git-send-email-nkristam@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1593166783; bh=GRhzw9TyqLGQ0PZOKcmC8abRlHduvVYfs8w/BQnimu0=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=dQ9go5fDdGgI45+JmgARDFcmA9ETwH57JoREqwiGRvuIUDcasXXTF1QkrNlqLuAG7
         iq5HdOME2fBC2ECiExBskeRywGq+aj/OU4IZ84rTz90WyrO142iioOrlq+No/2JWzX
         ic3Pbsh8mRE9XIYoQ8iwWr1HLBTf//rk6kHfUNVEAEScCaTAcuvoFXm5bU2FK3szmO
         0xGdLV2zgJbfYQdNJTBrlN9YgQhK1Ghs7X6q9oTeqMZSxK9iRLB02iBVNvSOgibu0k
         figymfIZOlg98cYfmplP8LNRbiZ+MKwwTpG/4Z60KFFnMKDS2hV4UG6wa1xp1A/WH9
         uIsPfq3z4CCOg==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Tegra210 SoC supports charger detect, set corresponding soc flag.

Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
Acked-by: Thierry Reding <treding@nvidia.com>
---
V4:
 - No changes
---
V3:
 - Used supports_charger_detect name instead of charger_detect.
 - Added Acked-by updates to commit message.
---
V2:
 - Patch re-based.
---
 drivers/phy/tegra/xusb-tegra210.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/tegra/xusb-tegra210.c b/drivers/phy/tegra/xusb-tegra210.c
index 80c4349..db2a1ab 100644
--- a/drivers/phy/tegra/xusb-tegra210.c
+++ b/drivers/phy/tegra/xusb-tegra210.c
@@ -2353,6 +2353,7 @@ const struct tegra_xusb_padctl_soc tegra210_xusb_padctl_soc = {
 	.supply_names = tegra210_xusb_padctl_supply_names,
 	.num_supplies = ARRAY_SIZE(tegra210_xusb_padctl_supply_names),
 	.need_fake_usb3_port = true,
+	.supports_charger_detect = true,
 };
 EXPORT_SYMBOL_GPL(tegra210_xusb_padctl_soc);
 
-- 
2.7.4


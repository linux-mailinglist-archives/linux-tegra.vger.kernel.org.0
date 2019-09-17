Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D042B47C7
	for <lists+linux-tegra@lfdr.de>; Tue, 17 Sep 2019 08:57:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403834AbfIQG5Q (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 17 Sep 2019 02:57:16 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:13326 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403830AbfIQG5P (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 17 Sep 2019 02:57:15 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d8083cf0000>; Mon, 16 Sep 2019 23:57:19 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 16 Sep 2019 23:57:14 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 16 Sep 2019 23:57:14 -0700
Received: from HQMAIL110.nvidia.com (172.18.146.15) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 17 Sep
 2019 06:57:14 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by hqmail110.nvidia.com
 (172.18.146.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 17 Sep
 2019 06:57:14 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 17 Sep 2019 06:57:14 +0000
Received: from nkristam-ubuntu.nvidia.com (Not Verified[10.19.65.118]) by hqnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5d8083c80001>; Mon, 16 Sep 2019 23:57:14 -0700
From:   Nagarjuna Kristam <nkristam@nvidia.com>
To:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <mark.rutland@arm.com>, <robh+dt@kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        "Nagarjuna Kristam" <nkristam@nvidia.com>
Subject: [PATCH 1/3] arm64: tegra: Enable padctl driver for Jetson-TX2
Date:   Tue, 17 Sep 2019 12:26:43 +0530
Message-ID: <1568703406-20183-2-git-send-email-nkristam@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568703406-20183-1-git-send-email-nkristam@nvidia.com>
References: <1568703406-20183-1-git-send-email-nkristam@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1568703439; bh=37X7E+lyNQDoxQxtNg3zSKRe2DuQ73FzYGINqBSYcaI=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=Zagd6mVPqy011+oWJtd+p/pXrSpTsU4TMiqxJ9Pu+ZLntHgfXknhwTfRyxEfUo8jH
         BEH7MIKJRAs+/M7AMX0MTNb+/fRzuHLO53lbA3cN2SZ5Gbvoced2AggjqyUbGjWjwj
         yBhPLdkBtROmnUuldnL1xY9KbcSGPTN1FF5qd/XgP/Es31/Gb9rJA6k7rKnPg7RIsG
         DA+jQHlttW2Fw+atQ7hrC/+3+johpl/Xv6RYQVT5vlIBFXOhFILCuvLh3et9IRQxmE
         ld7svNvO9tZ8OsHd/xed6VCb0s9U038HKwlKE0AlasbWVyceIZDksdUnXEg/fMnObG
         J89n94jxyD+dg==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Enable padctl driver for Jetson-TX2 platform

Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
index 966bcb9..d65caa1 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
@@ -115,7 +115,7 @@
 	};
 
 	padctl@3520000 {
-		status = "disabled";
+		status = "okay";
 
 		avdd-pll-erefeut-supply = <&vdd_1v8_pll>;
 		avdd-usb-supply = <&vdd_3v3_sys>;
-- 
2.7.4


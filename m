Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 411A3B47C9
	for <lists+linux-tegra@lfdr.de>; Tue, 17 Sep 2019 08:57:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403838AbfIQG5S (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 17 Sep 2019 02:57:18 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:16396 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403830AbfIQG5R (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 17 Sep 2019 02:57:17 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d8083d20000>; Mon, 16 Sep 2019 23:57:22 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 16 Sep 2019 23:57:17 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 16 Sep 2019 23:57:17 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 17 Sep
 2019 06:57:16 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 17 Sep 2019 06:57:16 +0000
Received: from nkristam-ubuntu.nvidia.com (Not Verified[10.19.65.118]) by hqnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5d8083ca0002>; Mon, 16 Sep 2019 23:57:16 -0700
From:   Nagarjuna Kristam <nkristam@nvidia.com>
To:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <mark.rutland@arm.com>, <robh+dt@kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        Nagarjuna Kristam <nkristam@nvidia.com>
Subject: [PATCH 2/3] arm64: tegra: Add SMMU for USB host on Tegra186
Date:   Tue, 17 Sep 2019 12:26:44 +0530
Message-ID: <1568703406-20183-3-git-send-email-nkristam@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568703406-20183-1-git-send-email-nkristam@nvidia.com>
References: <1568703406-20183-1-git-send-email-nkristam@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1568703442; bh=OWYCuZwoQrnPTWi8veFoE0/3ttkImGDH/uLGnUjA0Gw=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=dqEkh09bt9cJaSVaP2aToMu1FS9dxySmNh+72fns1tmc0X7qtdvCWN4IF6QupTLgP
         KxegfDAO25g5gBVUmciV2c0SKp88Gmzyu1hxEsUAkcICERfPWvOypFAKRdjObCsaCu
         wwT70NCZdiSTSFxWamsRI/qdsicTn671gE2LalNetCZWppUoPXRi0wG7SEi1S9s2oU
         1sjJgZKKe0t+Qo/8dn+KGhWC4txwc69Q6/KKp1FX84jnmFjC6I29z3CJPnM2Idz1cH
         bPAgTtLhbG0t95EPCuVeJoFg6zcrzeb4EE8Tf9neWXg4+NCyu9qLlYc0k6Ziz64CJa
         roK2aD2ZFK/zQ==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add SMMU for USB host driver on Tegra186

Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index 47cd831..abdc81f 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -525,6 +525,7 @@
 		      <0x0 0x03538000 0x0 0x1000>;
 		reg-names = "hcd", "fpci";
 
+		iommus = <&smmu TEGRA186_SID_XUSB_HOST>;
 		interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.7.4


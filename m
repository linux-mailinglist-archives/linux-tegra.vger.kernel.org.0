Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C996025AC9
	for <lists+linux-tegra@lfdr.de>; Wed, 22 May 2019 01:31:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727946AbfEUXbU (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 21 May 2019 19:31:20 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:1183 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727790AbfEUXbU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 21 May 2019 19:31:20 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ce48a480001>; Tue, 21 May 2019 16:31:20 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 21 May 2019 16:31:19 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 21 May 2019 16:31:19 -0700
Received: from HQMAIL106.nvidia.com (172.18.146.12) by HQMAIL104.nvidia.com
 (172.18.146.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 21 May
 2019 23:31:18 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL106.nvidia.com
 (172.18.146.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 21 May 2019 23:31:18 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.110.102.174]) by hqnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5ce48a460005>; Tue, 21 May 2019 16:31:18 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>
CC:     <jckuo@nvidia.com>, <talho@nvidia.com>, <josephl@nvidia.com>,
        <skomatineni@nvidia.com>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH V1 12/12] arm64: tegra: enable wake from deep sleep on RTC alarm.
Date:   Tue, 21 May 2019 16:31:23 -0700
Message-ID: <1558481483-22254-13-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558481483-22254-1-git-send-email-skomatineni@nvidia.com>
References: <1558481483-22254-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1558481480; bh=0l4gC+Qj0JmgYVzpD51BKCVjV4o0qtIe+OiFzC2IyHA=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=pdt5MZBns4+ceXvILOGcVnbdVCbXXruvt8Ivg02qDNzL3ohJttqjXz9PSUadVtnYu
         RtysGhBViJw/q/9DFqZIzNZXUFC0Fm/f5qZnoBiYkimLa2Hb/5d+4XPBsevvjwdHZg
         mo3VMzUnzyFN/VhoEW9WrbqYOAh0Z0XMU/BMjNCPM7zZJpE2m2T6EdnpCQZ2hoMIFV
         Ma7SwSfaGtKO/OkaCnMDce4PEtj7FOyxH8pnSx5KwmRgODLINjcB7nQXtko8mU0ONI
         h49YWOkx0085rPlDk+HtmB8SDt1lY4+VYXHflPz5A4vWRZLhagkvLq+guxAIng5v3K
         T5nM7976tebHA==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This patch updates device tree for RTC and PMC to allow system wake
from deep sleep on RTC alarm.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index a550c0a4d572..cf5c215efb04 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -763,7 +763,8 @@
 	rtc@7000e000 {
 		compatible = "nvidia,tegra210-rtc", "nvidia,tegra20-rtc";
 		reg = <0x0 0x7000e000 0x0 0x100>;
-		interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts = <16 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-parent = <&pmc>;
 		clocks = <&tegra_car TEGRA210_CLK_RTC>;
 		clock-names = "rtc";
 	};
@@ -773,6 +774,8 @@
 		reg = <0x0 0x7000e400 0x0 0x400>;
 		clocks = <&tegra_car TEGRA210_CLK_PCLK>, <&clk32k_in>;
 		clock-names = "pclk", "clk32k_in";
+		#interrupt-cells = <2>;
+		interrupt-controller;
 
 		powergates {
 			pd_audio: aud {
-- 
2.7.4


Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8AC651019C1
	for <lists+linux-tegra@lfdr.de>; Tue, 19 Nov 2019 07:52:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727983AbfKSGvf (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 19 Nov 2019 01:51:35 -0500
Received: from hqemgate16.nvidia.com ([216.228.121.65]:8392 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727569AbfKSGvR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 19 Nov 2019 01:51:17 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5dd390e40001>; Mon, 18 Nov 2019 22:51:16 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 18 Nov 2019 22:51:15 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 18 Nov 2019 22:51:15 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 19 Nov
 2019 06:51:15 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 19 Nov
 2019 06:51:15 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 19 Nov 2019 06:51:15 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.175.254]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5dd390e00002>; Mon, 18 Nov 2019 22:51:14 -0800
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <digetx@gmail.com>,
        <mperttunen@nvidia.com>, <gregkh@linuxfoundation.org>,
        <sboyd@kernel.org>, <tglx@linutronix.de>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>
CC:     <allison@lohutok.net>, <pdeschrijver@nvidia.com>,
        <pgaikwad@nvidia.com>, <mturquette@baylibre.com>,
        <horms+renesas@verge.net.au>, <Jisheng.Zhang@synaptics.com>,
        <krzk@kernel.org>, <arnd@arndb.de>, <spujar@nvidia.com>,
        <josephl@nvidia.com>, <vidyas@nvidia.com>,
        <daniel.lezcano@linaro.org>, <mmaddireddy@nvidia.com>,
        <markz@nvidia.com>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 14/17] dt-bindings: Add Tegra PMC clock configuration bindings
Date:   Mon, 18 Nov 2019 22:50:31 -0800
Message-ID: <1574146234-3871-15-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574146234-3871-1-git-send-email-skomatineni@nvidia.com>
References: <1574146234-3871-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1574146276; bh=8xZY11tbp+usm/Nb6Z9xjnnoWn2JHFMyJbgWjmLOHXY=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=RQGyHB1XOJXfSAWza0wiwB5OonczD++hm/D7Rafd59D3ZWA9Li5QBPjYqAvqVewP4
         QF7eXYrb7XZ6e/EU+9FMkc/7u9CWOeWcmgDdjNj6nyj+MjasoG1smDbr2UcfYFhfIS
         LfdCEmjGf2azi561IMXMXRcz0Um0VnV3/E2xGXT4mIv6qxS3+wEHSSw415kJMq6Vy/
         wL9uilxf2mj0lkJ2xEbxBn/JVZdtTr/KSaTxWYw/25646jCQu2YdAcwNm96hd1OWVq
         5p97gRP+YKxhaOVa5SgEtd2ZEnJByFuNJ6z2VM1uAfdLzTZ72N7yfxMEGC7ejgzTWt
         mQ4HYQugsDn1g==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Document clock bindings for pmc clocks clk_out_1, clk_out_2 and clk_out_3.
These clocks are part of Tegra PMC block and pmc node is the provider for
these clocks.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 .../bindings/arm/tegra/nvidia,tegra20-pmc.txt      | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.txt b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.txt
index cb12f33a247f..602a1ac5c0b6 100644
--- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.txt
+++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.txt
@@ -21,6 +21,10 @@ Required properties:
 - clock-names : Must include the following entries:
   "pclk" (The Tegra clock of that name),
   "clk32k_in" (The 32KHz clock input to Tegra).
+- #clock-cells : Should be 1 for Tegra30 and higher.
+  In clock consumers, this cell represents the PMC clock ID.
+  The assignments may be found in header file
+  <dt-bindings/soc/tegra-pmc.h>.
 
 Optional properties:
 - nvidia,invert-interrupt : If present, inverts the PMU interrupt signal.
@@ -171,6 +175,7 @@ Example:
 		reg = <0x0 0x7000e400 0x0 0x400>;
 		clocks = <&tegra_car TEGRA210_CLK_PCLK>, <&clk32k_in>;
 		clock-names = "pclk", "clk32k_in";
+		#clock-cells = <1>;
 
 		powergates {
 			pd_audio: aud {
@@ -260,6 +265,7 @@ Pad configuration state example:
 		reg = <0x0 0x7000e400 0x0 0x400>;
 		clocks = <&tegra_car TEGRA210_CLK_PCLK>, <&clk32k_in>;
 		clock-names = "pclk", "clk32k_in";
+		#clock-cells = <1>;
 
 		...
 
@@ -298,3 +304,39 @@ Pinctrl client example:
 		pinctrl-1 = <&hdmi_on>;
 		pinctrl-names = "hdmi-on", "hdmi-off";
 	};
+
+== Clock Control ==
+
+Tegra PMC has 3 clocks clk_1, clk_2 and clk_3. Each of these clocks has
+source selection and enable/disable gate.
+Parent/source for these clocks can be either of clk_m, clk_m_div2, clk_m_div4,
+or extern clock from Tegra CAR module.
+
+Clock configuration example:
+	pmc: pmc@7000e400 {
+		compatible = "nvidia,tegra210-pmc";
+		reg = <0x0 0x7000e400 0x0 0x400>;
+		clocks = <&tegra_car TEGRA210_CLK_PCLK>, <&clk32k_in>;
+		clock-names = "pclk", "clk32k_in";
+		#clock-cells = <1>;
+	};
+
+Clock consumer example:
+	host1x@50000000 {
+		...
+		vi@54080000 {
+		...
+		assigned-clocks = <&pmc TEGRA_PMC_CLK_OUT_3_MUX>;
+		assigned-clock-parents = <&tegra_car TEGRA210_CLK_EXTERN3>;
+		};
+		...
+	};
+	...
+	i2c@7000c500 {
+		cam_sensor {
+		...
+		clocks = <&pmc TEGRA_PMC_CLK_OUT_3>;
+		clock-names = "mclk";
+		...
+		};
+	};
-- 
2.7.4


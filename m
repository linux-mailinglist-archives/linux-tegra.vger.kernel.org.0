Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFAA51019BD
	for <lists+linux-tegra@lfdr.de>; Tue, 19 Nov 2019 07:52:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727991AbfKSGvf (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 19 Nov 2019 01:51:35 -0500
Received: from hqemgate16.nvidia.com ([216.228.121.65]:8374 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727841AbfKSGvP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 19 Nov 2019 01:51:15 -0500
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5dd390e10001>; Mon, 18 Nov 2019 22:51:13 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Mon, 18 Nov 2019 22:51:12 -0800
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Mon, 18 Nov 2019 22:51:12 -0800
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 19 Nov
 2019 06:51:12 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 19 Nov 2019 06:51:12 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.175.254]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5dd390dd0000>; Mon, 18 Nov 2019 22:51:11 -0800
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
Subject: [PATCH v1 13/17] arm64: tegra: Add clock-cells property to Tegra pmc
Date:   Mon, 18 Nov 2019 22:50:30 -0800
Message-ID: <1574146234-3871-14-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574146234-3871-1-git-send-email-skomatineni@nvidia.com>
References: <1574146234-3871-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1574146273; bh=lo8blzopjAGi5SogoYjGohehp7NJzTCYM1OW+wmKKo4=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=qu+9olqDWWubtYiSYmquNJ9hXD6d/NBYNIN8ETseyYl2MrSHwSwvMmTzZ8kVwQkz1
         VOvxX2CLknF91rqWPj2c2deFdzsMKvxqYbpVi3VeJIUBtBis7NbGQApi/JilcK0mrv
         nLrI4s8ns8ZMh4EdoZZluqy/nLKdldjgKE3e+1GDLPWlUz56ulIlsduNS8e7N58OnT
         zAXpoAa2jbfoU9mnMCA4cOTVqt1lcXKOKXW91MEf8EX3gMciSM21oZMd81r52sakP2
         nuPhVvYk4xKOgiP0JN1XtLKMFZ0m3wCnbZmR5FLWBpfNLdqh6iVXEJqYysQvRISvGK
         lvHycRZw/jbww==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Tegra pmc has 3 clocks clk_out_1, clk_out_2, clk_out_3 with mux and gate
for each of these clocks as part of pmc and Tegra pmc is the clock provider
for these clocks.

These clock ids are part of pmc dt-bindings.

This patch includes pmc dt-bindings and adds #clock-cells propert
 with 1 clock specifier to Tegra pmc node.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra132.dtsi | 4 +++-
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 2 ++
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 2 ++
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 2 ++
 4 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra132.dtsi b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
index 631a7f77c386..5bdb4a6a6b90 100644
--- a/arch/arm64/boot/dts/nvidia/tegra132.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/pinctrl/pinctrl-tegra-xusb.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/thermal/tegra124-soctherm.h>
+#include <dt-bindings/soc/tegra-pmc.h>
 
 / {
 	compatible = "nvidia,tegra132", "nvidia,tegra124";
@@ -577,11 +578,12 @@
 		clock-names = "rtc";
 	};
 
-	pmc@7000e400 {
+	pmc: pmc@7000e400 {
 		compatible = "nvidia,tegra124-pmc";
 		reg = <0x0 0x7000e400 0x0 0x400>;
 		clocks = <&tegra_car TEGRA124_CLK_PCLK>, <&clk32k_in>;
 		clock-names = "pclk", "clk32k_in";
+		#clock-cells = <1>;
 	};
 
 	fuse@7000f800 {
diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index 7893d78a0fb6..627108ce2f56 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/power/tegra186-powergate.h>
 #include <dt-bindings/reset/tegra186-reset.h>
 #include <dt-bindings/thermal/tegra186-bpmp-thermal.h>
+#include <dt-bindings/soc/tegra-pmc.h>
 
 / {
 	compatible = "nvidia,tegra186";
@@ -670,6 +671,7 @@
 		      <0 0x0c390000 0 0x10000>;
 		reg-names = "pmc", "wake", "aotag", "scratch";
 
+		#clock-cells = <1>;
 		#interrupt-cells = <2>;
 		interrupt-controller;
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 11220d97adb8..37dc19f49e4f 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/power/tegra194-powergate.h>
 #include <dt-bindings/reset/tegra194-reset.h>
 #include <dt-bindings/thermal/tegra194-bpmp-thermal.h>
+#include <dt-bindings/soc/tegra-pmc.h>
 
 / {
 	compatible = "nvidia,tegra194";
@@ -799,6 +800,7 @@
 			      <0x0c3a0000 0x10000>;
 			reg-names = "pmc", "wake", "aotag", "scratch", "misc";
 
+			#clock-cells = <1>;
 			#interrupt-cells = <2>;
 			interrupt-controller;
 		};
diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 48c63256ba7f..0d0432d3b37a 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/reset/tegra210-car.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/thermal/tegra124-soctherm.h>
+#include <dt-bindings/soc/tegra-pmc.h>
 
 / {
 	compatible = "nvidia,tegra210";
@@ -780,6 +781,7 @@
 		reg = <0x0 0x7000e400 0x0 0x400>;
 		clocks = <&tegra_car TEGRA210_CLK_PCLK>, <&clk32k_in>;
 		clock-names = "pclk", "clk32k_in";
+		#clock-cells = <1>;
 		#interrupt-cells = <2>;
 		interrupt-controller;
 
-- 
2.7.4


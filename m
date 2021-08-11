Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73F3B3E8EFF
	for <lists+linux-tegra@lfdr.de>; Wed, 11 Aug 2021 12:50:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237148AbhHKKvM (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 11 Aug 2021 06:51:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236951AbhHKKvL (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 11 Aug 2021 06:51:11 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4208FC0613D5;
        Wed, 11 Aug 2021 03:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=wFpzmF9Yw11S9umm3aZn2YSP2/5+gv40J9EukPzX4A8=; b=Tkbp2YcjDrnDXC0mPcEhzJ+sK8
        KqvpebBmEA3mJxsqoDzRFkLKammIiO1MT8a7kGoXyP26m/dKkJtA1SubgPycFmlY5xCU3l9HMORV0
        6vQPv1zLs/2fibY4B90HDozxsArqPORN0pMsrxPn/tNB2Yt064/x7rsbcWCaOrkradu6xsKAfB2VV
        ZSMMB2rmGPPaFpGzui0obL34NAVQA8oJOS2Y5Tom/tLBssNZbX3VWR8xoIXkFv99Ug0GWy2GNWlzx
        rZhYT3vZCfAPerGmTDTYRfG43enZ4ndtflrvrpCHvuV4WX64dpi+UoideZWrtdit66GNM3uMTbyUc
        mi/gLBrw==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <mperttunen@nvidia.com>)
        id 1mDloh-0007SJ-UV; Wed, 11 Aug 2021 13:50:35 +0300
From:   Mikko Perttunen <mperttunen@nvidia.com>
To:     thierry.reding@gmail.com, jonathanh@nvidia.com, airlied@linux.ie,
        daniel@ffwll.ch, robh+dt@kernel.org
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH v3 2/3] arm64: tegra: Add NVDEC to Tegra186/194 device trees
Date:   Wed, 11 Aug 2021 13:50:29 +0300
Message-Id: <20210811105030.3458521-3-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210811105030.3458521-1-mperttunen@nvidia.com>
References: <20210811105030.3458521-1-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: mperttunen@nvidia.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add a device tree node for NVDEC on Tegra186, and
device tree nodes for NVDEC and NVDEC1 on Tegra194.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
v3:
* Change read2 to read-1
v2:
* Add NVDECSRD1 memory client
* Add also to T194 (both NVDEC0/1)
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 16 +++++++++++
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 36 ++++++++++++++++++++++++
 2 files changed, 52 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index d02f6bf3e2ca..4f2f21242b2c 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -1342,6 +1342,22 @@ dsib: dsi@15400000 {
 			power-domains = <&bpmp TEGRA186_POWER_DOMAIN_DISP>;
 		};
 
+		nvdec@15480000 {
+			compatible = "nvidia,tegra186-nvdec";
+			reg = <0x15480000 0x40000>;
+			clocks = <&bpmp TEGRA186_CLK_NVDEC>;
+			clock-names = "nvdec";
+			resets = <&bpmp TEGRA186_RESET_NVDEC>;
+			reset-names = "nvdec";
+
+			power-domains = <&bpmp TEGRA186_POWER_DOMAIN_NVDEC>;
+			interconnects = <&mc TEGRA186_MEMORY_CLIENT_NVDECSRD &emc>,
+					<&mc TEGRA186_MEMORY_CLIENT_NVDECSRD1 &emc>,
+					<&mc TEGRA186_MEMORY_CLIENT_NVDECSWR &emc>;
+			interconnect-names = "dma-mem", "read-1", "write";
+			iommus = <&smmu TEGRA186_SID_NVDEC>;
+		};
+
 		sor0: sor@15540000 {
 			compatible = "nvidia,tegra186-sor";
 			reg = <0x15540000 0x10000>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 5ba7a4519b95..9119aa4f28c1 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -1412,6 +1412,24 @@ host1x@13e00000 {
 			interconnect-names = "dma-mem";
 			iommus = <&smmu TEGRA194_SID_HOST1X>;
 
+			nvdec@15140000 {
+				compatible = "nvidia,tegra194-nvdec";
+				reg = <0x15140000 0x00040000>;
+				clocks = <&bpmp TEGRA194_CLK_NVDEC1>;
+				clock-names = "nvdec";
+				resets = <&bpmp TEGRA194_RESET_NVDEC1>;
+				reset-names = "nvdec";
+
+				power-domains = <&bpmp TEGRA194_POWER_DOMAIN_NVDECB>;
+				interconnects = <&mc TEGRA194_MEMORY_CLIENT_NVDEC1SRD &emc>,
+						<&mc TEGRA194_MEMORY_CLIENT_NVDEC1SRD1 &emc>,
+						<&mc TEGRA194_MEMORY_CLIENT_NVDEC1SWR &emc>;
+				interconnect-names = "dma-mem", "read-1", "write";
+				iommus = <&smmu TEGRA194_SID_NVDEC1>;
+
+				nvidia,instance = <1>;
+			};
+
 			display-hub@15200000 {
 				compatible = "nvidia,tegra194-display";
 				reg = <0x15200000 0x00040000>;
@@ -1525,6 +1543,24 @@ vic@15340000 {
 				iommus = <&smmu TEGRA194_SID_VIC>;
 			};
 
+			nvdec@15480000 {
+				compatible = "nvidia,tegra194-nvdec";
+				reg = <0x15480000 0x00040000>;
+				clocks = <&bpmp TEGRA194_CLK_NVDEC>;
+				clock-names = "nvdec";
+				resets = <&bpmp TEGRA194_RESET_NVDEC>;
+				reset-names = "nvdec";
+
+				power-domains = <&bpmp TEGRA194_POWER_DOMAIN_NVDECA>;
+				interconnects = <&mc TEGRA194_MEMORY_CLIENT_NVDECSRD &emc>,
+						<&mc TEGRA194_MEMORY_CLIENT_NVDECSRD1 &emc>,
+						<&mc TEGRA194_MEMORY_CLIENT_NVDECSWR &emc>;
+				interconnect-names = "dma-mem", "read-1", "write";
+				iommus = <&smmu TEGRA194_SID_NVDEC>;
+
+				nvidia,instance = <0>;
+			};
+
 			dpaux0: dpaux@155c0000 {
 				compatible = "nvidia,tegra194-dpaux";
 				reg = <0x155c0000 0x10000>;
-- 
2.32.0


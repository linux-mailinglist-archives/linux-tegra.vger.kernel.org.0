Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA1AE3FFC07
	for <lists+linux-tegra@lfdr.de>; Fri,  3 Sep 2021 10:33:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348374AbhICIdf (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 3 Sep 2021 04:33:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348367AbhICIde (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 3 Sep 2021 04:33:34 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15676C0613C1;
        Fri,  3 Sep 2021 01:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=xumpG5bdJ6JHyeqDg54dzOohzCoOB77KJvu1LpdRNRE=; b=ZRJ+/xs5HJ+DjeWFbDS4e2/lmT
        UsfZrRLyTApuCP527YY36+o5EZ5BkT5q+8cX72fuBYd2XYM0Jw54YRa+OXv1tAKKDtSn6I5JWr06Y
        JkvJU9hjLMKT3brJBKE2NmaweIfOqEOUN/H/UeBctMWfEHibwfQ+pSCxQuf38A0L5gC26dRBSU4M3
        SSENrJaK9ZwOoIpGEFfnU2yp946w8i2xm9aAAP8f/K7CxiYWQ7FuGfA4Gq73KDeIMyOURVkNA01gl
        U0lblITE/d1pPLZV4h9d2TGp07N8ZWwnVYr2ksKB11FfYrvUZ41Oi+Bb57SDdDxd7B688Gn0AcMiJ
        c5CWBBCg==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <mperttunen@nvidia.com>)
        id 1mM4cI-0004xK-TM; Fri, 03 Sep 2021 11:32:06 +0300
From:   Mikko Perttunen <mperttunen@nvidia.com>
To:     thierry.reding@gmail.com, jonathanh@nvidia.com, airlied@linux.ie,
        daniel@ffwll.ch, robh+dt@kernel.org
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH v4 2/3] arm64: tegra: Add NVDEC to Tegra186/194 device trees
Date:   Fri,  3 Sep 2021 11:31:54 +0300
Message-Id: <20210903083155.690022-3-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210903083155.690022-1-mperttunen@nvidia.com>
References: <20210903083155.690022-1-mperttunen@nvidia.com>
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
v4:
* Add dma-coherent markers
v3:
* Change read2 to read-1
v2:
* Add NVDECSRD1 memory client
* Add also to T194 (both NVDEC0/1)
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 16 ++++++++++
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 38 ++++++++++++++++++++++++
 2 files changed, 54 insertions(+)

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
index 5ba7a4519b95..0e9713814583 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -1412,6 +1412,25 @@ host1x@13e00000 {
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
+				dma-coherent;
+
+				nvidia,instance = <1>;
+			};
+
 			display-hub@15200000 {
 				compatible = "nvidia,tegra194-display";
 				reg = <0x15200000 0x00040000>;
@@ -1525,6 +1544,25 @@ vic@15340000 {
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
+				dma-coherent;
+
+				nvidia,instance = <0>;
+			};
+
 			dpaux0: dpaux@155c0000 {
 				compatible = "nvidia,tegra194-dpaux";
 				reg = <0x155c0000 0x10000>;
-- 
2.32.0


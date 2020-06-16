Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC1601FB2BB
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Jun 2020 15:54:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728931AbgFPNye (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 Jun 2020 09:54:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728815AbgFPNyc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Jun 2020 09:54:32 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 343B5C061573
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:54:32 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id x13so20859230wrv.4
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VOcdMMZrGYbV7r0liMHg/Cd4sDwnHh7W9OOWxhq6hoI=;
        b=liOO0ZpV2HvGK1n56fuZBz9zqWvbwFATxbBmflqIUImYUpHC4nu8H5AaINWX0H2boz
         RD/dwjNfBQuNGd5ZNkyWytD8ytwHAeZY+rZQaWDj1Abt6eyhOnmfrsRT2jFANEXDj9hP
         S+DxXb7uDAixIc4GAqA8/IhF2W6dO/scCekZ5luQhbL62oFT0I5v9tOawSXkPNjDhB+Q
         aUt4JgZdlkHj+tPQYmKfpoE5k+mZQRA7b1MYA80YVbcJ3WUMxbNPt1c+tMYAB9LE5e7h
         fMFj4XG9bp8EU6iKTB3mUVRno6raeRLJCaPRWiNaVhXMpDr+9j2w5l+pDH9MTk3JcraK
         yXWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VOcdMMZrGYbV7r0liMHg/Cd4sDwnHh7W9OOWxhq6hoI=;
        b=dfjvOaU5kXXqAxT9O9076ZxHnbGlt68Ic/eRuW7wKrSFCpAVYF5+K4N3ZN+eK5HaXB
         gSFn29cuavpWqD42zs+cUj+KgIgnHZ5qykq+D6W3hwJctn/dJCfjGoQBWCq9YExcm8DC
         WL1//iG9BSomv/KashUsIIPKAaxUIIVBrUuZFqghaA3pf7Da7gDf2FGLeaipu2xbwzOh
         wmmrv/Q8ce5zUMK1qh3m3jiNB+IoQB7HRtBSEEt74vzdZoq5Wvj+ptdbBrlCuaTIsa9U
         yAiNg4ukDQZU1dEXEXM+IrmpWYwWIJjVu60maSFYT6ftvJUj34zXO/tC0H0HwP8kE0O/
         4fzg==
X-Gm-Message-State: AOAM5307HcBPyWmhP6QGBSN3caEtwVJr8PpaSyVvLJP9H48sBANnVfTI
        ApYffT+xdQ3S5HZqoPAwUxA=
X-Google-Smtp-Source: ABdhPJyMScU2HUgQFxttuyWNABdqQiZyu93DkPqFrbsOA4GHTVT3e2RUTV3pAB8NOwyrMVvZrztksQ==
X-Received: by 2002:adf:f207:: with SMTP id p7mr3244928wro.206.1592315670815;
        Tue, 16 Jun 2020 06:54:30 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id f9sm28542345wre.65.2020.06.16.06.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 06:54:29 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 42/73] arm64: tegra: Describe interconnect paths on Tegra194
Date:   Tue, 16 Jun 2020 15:52:07 +0200
Message-Id: <20200616135238.3001888-43-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200616135238.3001888-1-thierry.reding@gmail.com>
References: <20200616135238.3001888-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

On Tegra194, all clients of the memory subsystem can generally address
40 bits of system memory. However, bit 39 has special meaning and will
cause the memory controller to reorder sectors for block-linear buffer
formats. This is primarily useful for graphics-related devices.

Use of bit 39 must be controlled on a case-by-case basis. Buffers that
are used with bit 39 set by one device may be used with bit 39 cleared
by other devices.

Care must be taken to allocate buffers at addresses that do not require
bit 39 to be set. This is normally not an issue for system memory since
there are no Tegra-based systems with enough RAM to exhaust the 39-bit
physical address space. However, when a device is behind an IOMMU, such
as the ARM SMMU on Tegra194, the IOMMUs input address space can cause
IOVA allocations to happen in this region. This is for example the case
when an operating system implements a top-down allocation policy for IO
virtual addresses.

To account for this, describe the path that memory accesses take through
the system. Memory clients will send requests to the memory controller,
which forwards bits [38:0] of the address either to the external memory
controller or the SMMU, depending on the stream ID of the access. A good
way to describe this is using the interconnects bindings, see:

    Documentation/devicetree/bindings/interconnect/interconnect.txt

The standard "dma-mem" path is used to describe the path towards system
memory via the memory controller. A dma-ranges property in the memory
controller's device tree node limits the range of DMA addresses that the
memory clients can use to bits [38:0], ensuring that bit 39 is not used.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v4:
- add additional entries for interconnect-names to match interconnects
- add EMC as destination for interconnect paths

Changes in v3:
- add missing interconnect properties for VIC

Changes in v2:
- use memory client IDs instead of stream IDs (Mikko Perttunen)

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 70 ++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index ae438b2c4dd9..a50504a317d7 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -59,6 +59,9 @@ ethernet@2490000 {
 			clock-names = "master_bus", "slave_bus", "rx", "tx", "ptp_ref";
 			resets = <&bpmp TEGRA194_RESET_EQOS>;
 			reset-names = "eqos";
+			interconnects = <&mc TEGRA194_MEMORY_CLIENT_EQOSR &emc>,
+					<&mc TEGRA194_MEMORY_CLIENT_EQOSW &emc>;
+			interconnect-names = "dma-mem", "write";
 			status = "disabled";
 
 			snps,write-requests = <1>;
@@ -176,6 +179,7 @@ mc: memory-controller@2c00000 {
 			reg = <0x02c00000 0x100000>,
 			      <0x02b80000 0x040000>,
 			      <0x01700000 0x100000>;
+			#interconnect-cells = <1>;
 			status = "disabled";
 
 			#address-cells = <2>;
@@ -209,6 +213,8 @@ emc: external-memory-controller@2c60000 {
 				clocks = <&bpmp TEGRA194_CLK_EMC>;
 				clock-names = "emc";
 
+				#interconnect-cells = <0>;
+
 				nvidia,bpmp = <&bpmp>;
 			};
 		};
@@ -457,6 +463,9 @@ sdmmc1: sdhci@3400000 {
 			clock-names = "sdhci";
 			resets = <&bpmp TEGRA194_RESET_SDMMC1>;
 			reset-names = "sdhci";
+			interconnects = <&mc TEGRA194_MEMORY_CLIENT_SDMMCRA &emc>,
+					<&mc TEGRA194_MEMORY_CLIENT_SDMMCWA &emc>;
+			interconnect-names = "dma-mem", "write";
 			nvidia,pad-autocal-pull-up-offset-3v3-timeout =
 									<0x07>;
 			nvidia,pad-autocal-pull-down-offset-3v3-timeout =
@@ -479,6 +488,9 @@ sdmmc3: sdhci@3440000 {
 			clock-names = "sdhci";
 			resets = <&bpmp TEGRA194_RESET_SDMMC3>;
 			reset-names = "sdhci";
+			interconnects = <&mc TEGRA194_MEMORY_CLIENT_SDMMCR &emc>,
+					<&mc TEGRA194_MEMORY_CLIENT_SDMMCW &emc>;
+			interconnect-names = "dma-mem", "write";
 			nvidia,pad-autocal-pull-up-offset-1v8 = <0x00>;
 			nvidia,pad-autocal-pull-down-offset-1v8 = <0x7a>;
 			nvidia,pad-autocal-pull-up-offset-3v3-timeout = <0x07>;
@@ -506,6 +518,9 @@ sdmmc4: sdhci@3460000 {
 					  <&bpmp TEGRA194_CLK_PLLC4>;
 			resets = <&bpmp TEGRA194_RESET_SDMMC4>;
 			reset-names = "sdhci";
+			interconnects = <&mc TEGRA194_MEMORY_CLIENT_SDMMCRAB &emc>,
+					<&mc TEGRA194_MEMORY_CLIENT_SDMMCWAB &emc>;
+			interconnect-names = "dma-mem", "write";
 			nvidia,pad-autocal-pull-up-offset-hs400 = <0x00>;
 			nvidia,pad-autocal-pull-down-offset-hs400 = <0x00>;
 			nvidia,pad-autocal-pull-up-offset-1v8-timeout = <0x0a>;
@@ -534,6 +549,9 @@ hda@3510000 {
 				 <&bpmp TEGRA194_RESET_HDA2HDMICODEC>;
 			reset-names = "hda", "hda2codec_2x", "hda2hdmi";
 			power-domains = <&bpmp TEGRA194_POWER_DOMAIN_DISP>;
+			interconnects = <&mc TEGRA194_MEMORY_CLIENT_HDAR &emc>,
+					<&mc TEGRA194_MEMORY_CLIENT_HDAW &emc>;
+			interconnect-names = "dma-mem", "write";
 			status = "disabled";
 		};
 
@@ -1032,6 +1050,8 @@ host1x@13e00000 {
 			#size-cells = <1>;
 
 			ranges = <0x15000000 0x15000000 0x01000000>;
+			interconnects = <&mc TEGRA194_MEMORY_CLIENT_HOST1XDMAR &emc>;
+			interconnect-names = "dma-mem";
 
 			display-hub@15200000 {
 				compatible = "nvidia,tegra194-display", "simple-bus";
@@ -1067,6 +1087,9 @@ display@15200000 {
 					reset-names = "dc";
 
 					power-domains = <&bpmp TEGRA194_POWER_DOMAIN_DISP>;
+					interconnects = <&mc TEGRA194_MEMORY_CLIENT_NVDISPLAYR &emc>,
+							<&mc TEGRA194_MEMORY_CLIENT_NVDISPLAYR1 &emc>;
+					interconnect-names = "dma-mem", "read-1";
 
 					nvidia,outputs = <&sor0 &sor1 &sor2 &sor3>;
 					nvidia,head = <0>;
@@ -1082,6 +1105,9 @@ display@15210000 {
 					reset-names = "dc";
 
 					power-domains = <&bpmp TEGRA194_POWER_DOMAIN_DISPB>;
+					interconnects = <&mc TEGRA194_MEMORY_CLIENT_NVDISPLAYR &emc>,
+							<&mc TEGRA194_MEMORY_CLIENT_NVDISPLAYR1 &emc>;
+					interconnect-names = "dma-mem", "read-1";
 
 					nvidia,outputs = <&sor0 &sor1 &sor2 &sor3>;
 					nvidia,head = <1>;
@@ -1097,6 +1123,9 @@ display@15220000 {
 					reset-names = "dc";
 
 					power-domains = <&bpmp TEGRA194_POWER_DOMAIN_DISPC>;
+					interconnects = <&mc TEGRA194_MEMORY_CLIENT_NVDISPLAYR &emc>,
+							<&mc TEGRA194_MEMORY_CLIENT_NVDISPLAYR1 &emc>;
+					interconnect-names = "dma-mem", "read-1";
 
 					nvidia,outputs = <&sor0 &sor1 &sor2 &sor3>;
 					nvidia,head = <2>;
@@ -1112,6 +1141,9 @@ display@15230000 {
 					reset-names = "dc";
 
 					power-domains = <&bpmp TEGRA194_POWER_DOMAIN_DISPC>;
+					interconnects = <&mc TEGRA194_MEMORY_CLIENT_NVDISPLAYR &emc>,
+							<&mc TEGRA194_MEMORY_CLIENT_NVDISPLAYR1 &emc>;
+					interconnect-names = "dma-mem", "read-1";
 
 					nvidia,outputs = <&sor0 &sor1 &sor2 &sor3>;
 					nvidia,head = <3>;
@@ -1128,6 +1160,9 @@ vic@15340000 {
 				reset-names = "vic";
 
 				power-domains = <&bpmp TEGRA194_POWER_DOMAIN_VIC>;
+				interconnects = <&mc TEGRA194_MEMORY_CLIENT_VICSRD &emc>,
+						<&mc TEGRA194_MEMORY_CLIENT_VICSWR &emc>;
+				interconnect-names = "dma-mem", "write";
 			};
 
 			dpaux0: dpaux@155c0000 {
@@ -1404,9 +1439,14 @@ pcie@14100000 {
 		nvidia,aspm-l0s-entrance-latency-us = <3>;
 
 		bus-range = <0x0 0xff>;
+
 		ranges = <0x81000000 0x0  0x30100000 0x0  0x30100000 0x0 0x00100000   /* downstream I/O (1MB) */
 			  0xc3000000 0x12 0x00000000 0x12 0x00000000 0x0 0x30000000   /* prefetchable memory (768MB) */
 			  0x82000000 0x0  0x40000000 0x12 0x30000000 0x0 0x10000000>; /* non-prefetchable memory (256MB) */
+
+		interconnects = <&mc TEGRA194_MEMORY_CLIENT_PCIE1R &emc>,
+				<&mc TEGRA194_MEMORY_CLIENT_PCIE1W &emc>;
+		interconnect-names = "read", "write";
 	};
 
 	pcie@14120000 {
@@ -1449,9 +1489,14 @@ pcie@14120000 {
 		nvidia,aspm-l0s-entrance-latency-us = <3>;
 
 		bus-range = <0x0 0xff>;
+
 		ranges = <0x81000000 0x0  0x32100000 0x0  0x32100000 0x0 0x00100000   /* downstream I/O (1MB) */
 			  0xc3000000 0x12 0x40000000 0x12 0x40000000 0x0 0x30000000   /* prefetchable memory (768MB) */
 			  0x82000000 0x0  0x40000000 0x12 0x70000000 0x0 0x10000000>; /* non-prefetchable memory (256MB) */
+
+		interconnects = <&mc TEGRA194_MEMORY_CLIENT_PCIE2AR &emc>,
+				<&mc TEGRA194_MEMORY_CLIENT_PCIE2AW &emc>;
+		interconnect-names = "read", "write";
 	};
 
 	pcie@14140000 {
@@ -1494,9 +1539,14 @@ pcie@14140000 {
 		nvidia,aspm-l0s-entrance-latency-us = <3>;
 
 		bus-range = <0x0 0xff>;
+
 		ranges = <0x81000000 0x0  0x34100000 0x0  0x34100000 0x0 0x00100000   /* downstream I/O (1MB) */
 			  0xc3000000 0x12 0x80000000 0x12 0x80000000 0x0 0x30000000   /* prefetchable memory (768MB) */
 			  0x82000000 0x0  0x40000000 0x12 0xb0000000 0x0 0x10000000>; /* non-prefetchable memory (256MB) */
+
+		interconnects = <&mc TEGRA194_MEMORY_CLIENT_PCIE3R &emc>,
+				<&mc TEGRA194_MEMORY_CLIENT_PCIE3W &emc>;
+		interconnect-names = "read", "write";
 	};
 
 	pcie@14160000 {
@@ -1539,9 +1589,14 @@ pcie@14160000 {
 		nvidia,aspm-l0s-entrance-latency-us = <3>;
 
 		bus-range = <0x0 0xff>;
+
 		ranges = <0x81000000 0x0  0x36100000 0x0  0x36100000 0x0 0x00100000   /* downstream I/O (1MB) */
 			  0xc3000000 0x14 0x00000000 0x14 0x00000000 0x3 0x40000000   /* prefetchable memory (13GB) */
 			  0x82000000 0x0  0x40000000 0x17 0x40000000 0x0 0xc0000000>; /* non-prefetchable memory (3GB) */
+
+		interconnects = <&mc TEGRA194_MEMORY_CLIENT_PCIE4R &emc>,
+				<&mc TEGRA194_MEMORY_CLIENT_PCIE4W &emc>;
+		interconnect-names = "read", "write";
 	};
 
 	pcie@14180000 {
@@ -1584,9 +1639,14 @@ pcie@14180000 {
 		nvidia,aspm-l0s-entrance-latency-us = <3>;
 
 		bus-range = <0x0 0xff>;
+
 		ranges = <0x81000000 0x0  0x38100000 0x0  0x38100000 0x0 0x00100000   /* downstream I/O (1MB) */
 			  0xc3000000 0x18 0x00000000 0x18 0x00000000 0x3 0x40000000   /* prefetchable memory (13GB) */
 			  0x82000000 0x0  0x40000000 0x1b 0x40000000 0x0 0xc0000000>; /* non-prefetchable memory (3GB) */
+
+		interconnects = <&mc TEGRA194_MEMORY_CLIENT_PCIE0R &emc>,
+				<&mc TEGRA194_MEMORY_CLIENT_PCIE0W &emc>;
+		interconnect-names = "read", "write";
 	};
 
 	pcie@141a0000 {
@@ -1633,9 +1693,14 @@ pcie@141a0000 {
 		nvidia,aspm-l0s-entrance-latency-us = <3>;
 
 		bus-range = <0x0 0xff>;
+
 		ranges = <0x81000000 0x0  0x3a100000 0x0  0x3a100000 0x0 0x00100000   /* downstream I/O (1MB) */
 			  0xc3000000 0x1c 0x00000000 0x1c 0x00000000 0x3 0x40000000   /* prefetchable memory (13GB) */
 			  0x82000000 0x0  0x40000000 0x1f 0x40000000 0x0 0xc0000000>; /* non-prefetchable memory (3GB) */
+
+		interconnects = <&mc TEGRA194_MEMORY_CLIENT_PCIE5R &emc>,
+				<&mc TEGRA194_MEMORY_CLIENT_PCIE5W &emc>;
+		interconnect-names = "read", "write";
 	};
 
 	pcie_ep@14160000 {
@@ -1767,6 +1832,11 @@ bpmp: bpmp {
 		#clock-cells = <1>;
 		#reset-cells = <1>;
 		#power-domain-cells = <1>;
+		interconnects = <&mc TEGRA194_MEMORY_CLIENT_BPMPR &emc>,
+				<&mc TEGRA194_MEMORY_CLIENT_BPMPW &emc>,
+				<&mc TEGRA194_MEMORY_CLIENT_BPMPDMAR &emc>,
+				<&mc TEGRA194_MEMORY_CLIENT_BPMPDMAW &emc>;
+		interconnect-names = "read", "write", "dma-mem", "dma-write";
 
 		bpmp_i2c: i2c {
 			compatible = "nvidia,tegra186-bpmp-i2c";
-- 
2.24.1


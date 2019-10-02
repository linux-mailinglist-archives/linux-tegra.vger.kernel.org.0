Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2A75C8D3D
	for <lists+linux-tegra@lfdr.de>; Wed,  2 Oct 2019 17:47:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728960AbfJBPrA (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 2 Oct 2019 11:47:00 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:38377 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726179AbfJBPrA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 2 Oct 2019 11:47:00 -0400
Received: by mail-wm1-f68.google.com with SMTP id 3so7524679wmi.3;
        Wed, 02 Oct 2019 08:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+LYOZk9Cu1LdKvnOUETqrZC1sIRQQIpMTwdm16fDYI8=;
        b=a9ffV22gCe3Z3aOeTovecLxfmPUJSosXs8DvrQUbI+20ZP+eF6g6a2hTT9O0xmXlCh
         pgTQ7UD9cO+4KfRTQyBAVgvVKTilRTfiekvFRndEnvI5I/J21jiT69Sn6nlLJwxZfMYu
         xmgXccKyUkC5gQffYVt7pc0xyAJWetpwy8hK7hbhIuL/bW21yKg6OqNqAGSyLdVYDVO9
         W/E7j07K7QNiJs7uWmGJVq+Ssr0wSalbIeTpw7Y3e/78gn+it4O8djnBVx952iWowZWo
         +SnOcog6OLhDI7Fm3j4jK2dCrDLPHkGJdoF2mdbCPdn2O7NjbJDHMH3oe0ctLFKku/yZ
         dzjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+LYOZk9Cu1LdKvnOUETqrZC1sIRQQIpMTwdm16fDYI8=;
        b=qyqZ2cWc25hWv6us5oI2miYV0yYdiSUHaohgnt3VZZ7A6PaAUi9s2HiZoei8oiTtdU
         SXuaLXTgApdsUQHqhaysMporeWHdZK8q8z7pr3zvkhtr6th4xVLIco+Gy02PoeFmu9Zp
         7hEXGjas/Xeyzpw91MQjxnDW/BpOTsK8YpfSe2C/2kNCk/i0svqs9VOoX1+RjMsYLz7B
         AVDuzGlpKQ29gx7mLnKVy5U0R/iNHkkWvaDi1o3K7iFvopDNnAsVgoQzJ1DmeKYixkDc
         qiV6yF1VHb+KM1EGIKCIwmbKqSA8e72Zvh1Q3JYxk2VENcwTcr3NNDTtLzVy/6Gn/QaO
         FJEg==
X-Gm-Message-State: APjAAAUG+rFGPvQJKGZksRnWkgRLVz40YzqnugFzWkunJL6thPVWayPw
        R0ZIxPd2pM/T0cSPUlId+IE=
X-Google-Smtp-Source: APXvYqx+ZOVjC+z9HRKbY7dvEWEHCuYdJmY6gI4tiAhh4HywZumdahOq6rwi9fTxGteKXy1dSeRb0A==
X-Received: by 2002:a1c:1a4b:: with SMTP id a72mr3428932wma.44.1570031216627;
        Wed, 02 Oct 2019 08:46:56 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id o22sm50102365wra.96.2019.10.02.08.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 08:46:55 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>
Subject: [PATCH] arm64: tegra: Set dma-ranges for memory subsystem
Date:   Wed,  2 Oct 2019 17:46:54 +0200
Message-Id: <20191002154654.225690-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
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
Arnd, Rob, Robin,

This is what I came up with after our discussion on this thread:

	[PATCH 00/11] of: dma-ranges fixes and improvements

Please take a look and see if that sounds reasonable. I'm slightly
unsure about the interconnects bindings as I used them here. According
to the bindings there's always supposed to be a pair of interconnect
paths, so this patch is not exactly compliant. It does work fine with
the __of_get_dma_parent() code that Maxime introduced a couple of months
ago and really very neatly describes the hardware. Interestingly this
will come in handy very soon now since we're starting work on a proper
interconnect provider (the memory controller driver is the natural fit
for this because it has additional knobs to configure latency and
priorities, etc.) to implement external memory frequency scaling based
on bandwidth requests from memory clients. So this all fits together
very nicely. But as I said, I'm not exactly sure what to add as a second
entry in "interconnects" to make this compliant with the bindings.

Adding Georgi and Maxime, perhaps they can help clarify.

Thierry

 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 32 +++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 6900e8bdf24d..f50150217806 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -53,6 +53,8 @@
 			clock-names = "master_bus", "slave_bus", "rx", "tx", "ptp_ref";
 			resets = <&bpmp TEGRA194_RESET_EQOS>;
 			reset-names = "eqos";
+			interconnects = <&mc TEGRA194_SID_EQOS>;
+			interconnect-names = "dma-mem";
 			iommus = <&smmu TEGRA194_SID_EQOS>;
 			status = "disabled";
 
@@ -166,10 +168,16 @@
 			};
 		};
 
-		memory-controller@2c00000 {
+		mc: memory-controller@2c00000 {
 			compatible = "nvidia,tegra194-mc";
 			reg = <0x02c00000 0xb0000>;
+			#interconnect-cells = <1>;
 			status = "disabled";
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+
+			dma-ranges = <0x0 0x0 0x0 0x80 0x0>;
 		};
 
 		uarta: serial@3100000 {
@@ -416,6 +424,8 @@
 			clock-names = "sdhci";
 			resets = <&bpmp TEGRA194_RESET_SDMMC1>;
 			reset-names = "sdhci";
+			interconnects = <&mc TEGRA194_SID_SDMMC1>;
+			interconnect-names = "dma-mem";
 			iommus = <&smmu TEGRA194_SID_SDMMC1>;
 			nvidia,pad-autocal-pull-up-offset-3v3-timeout =
 									<0x07>;
@@ -439,6 +449,8 @@
 			clock-names = "sdhci";
 			resets = <&bpmp TEGRA194_RESET_SDMMC3>;
 			reset-names = "sdhci";
+			interconnects = <&mc TEGRA194_SID_SDMMC3>;
+			interconnect-names = "dma-mem";
 			iommus = <&smmu TEGRA194_SID_SDMMC3>;
 			nvidia,pad-autocal-pull-up-offset-1v8 = <0x00>;
 			nvidia,pad-autocal-pull-down-offset-1v8 = <0x7a>;
@@ -467,6 +479,8 @@
 					  <&bpmp TEGRA194_CLK_PLLC4>;
 			resets = <&bpmp TEGRA194_RESET_SDMMC4>;
 			reset-names = "sdhci";
+			interconnects = <&mc TEGRA194_SID_SDMMC4>;
+			interconnect-names = "dma-mem";
 			iommus = <&smmu TEGRA194_SID_SDMMC4>;
 			nvidia,pad-autocal-pull-up-offset-hs400 = <0x00>;
 			nvidia,pad-autocal-pull-down-offset-hs400 = <0x00>;
@@ -496,6 +510,8 @@
 				 <&bpmp TEGRA194_RESET_HDA2HDMICODEC>;
 			reset-names = "hda", "hda2codec_2x", "hda2hdmi";
 			power-domains = <&bpmp TEGRA194_POWER_DOMAIN_DISP>;
+			interconnects = <&mc TEGRA194_SID_HDA>;
+			interconnect-names = "dma-mem";
 			iommus = <&smmu TEGRA194_SID_HDA>;
 			status = "disabled";
 		};
@@ -831,6 +847,8 @@
 			#size-cells = <1>;
 
 			ranges = <0x15000000 0x15000000 0x01000000>;
+			interconnects = <&mc TEGRA194_SID_HOST1X>;
+			interconnect-names = "dma-mem";
 			iommus = <&smmu TEGRA194_SID_HOST1X>;
 
 			display-hub@15200000 {
@@ -867,6 +885,8 @@
 					reset-names = "dc";
 
 					power-domains = <&bpmp TEGRA194_POWER_DOMAIN_DISP>;
+					interconnects = <&mc TEGRA194_SID_NVDISPLAY>;
+					interconnect-names = "dma-mem";
 					iommus = <&smmu TEGRA194_SID_NVDISPLAY>;
 
 					nvidia,outputs = <&sor0 &sor1 &sor2 &sor3>;
@@ -883,6 +903,8 @@
 					reset-names = "dc";
 
 					power-domains = <&bpmp TEGRA194_POWER_DOMAIN_DISPB>;
+					interconnects = <&mc TEGRA194_SID_NVDISPLAY>;
+					interconnect-names = "dma-mem";
 					iommus = <&smmu TEGRA194_SID_NVDISPLAY>;
 
 					nvidia,outputs = <&sor0 &sor1 &sor2 &sor3>;
@@ -899,6 +921,8 @@
 					reset-names = "dc";
 
 					power-domains = <&bpmp TEGRA194_POWER_DOMAIN_DISPC>;
+					interconnects = <&mc TEGRA194_SID_NVDISPLAY>;
+					interconnect-names = "dma-mem";
 					iommus = <&smmu TEGRA194_SID_NVDISPLAY>;
 
 					nvidia,outputs = <&sor0 &sor1 &sor2 &sor3>;
@@ -915,6 +939,8 @@
 					reset-names = "dc";
 
 					power-domains = <&bpmp TEGRA194_POWER_DOMAIN_DISPC>;
+					interconnects = <&mc TEGRA194_SID_NVDISPLAY>;
+					interconnect-names = "dma-mem";
 					iommus = <&smmu TEGRA194_SID_NVDISPLAY>;
 
 					nvidia,outputs = <&sor0 &sor1 &sor2 &sor3>;
@@ -1182,6 +1208,8 @@
 			status = "disabled";
 
 			power-domains = <&bpmp TEGRA194_POWER_DOMAIN_GPU>;
+			interconnects = <&mc TEGRA194_SID_GPU>;
+			interconnect-names = "dma-mem";
 			iommus = <&smmu TEGRA194_SID_GPU>;
 		};
 	};
@@ -1573,6 +1601,8 @@
 		#clock-cells = <1>;
 		#reset-cells = <1>;
 		#power-domain-cells = <1>;
+		interconnects = <&mc TEGRA194_SID_BPMP>;
+		interconnect-names = "dma-mem";
 		iommus = <&smmu TEGRA194_SID_BPMP>;
 
 		bpmp_i2c: i2c {
-- 
2.23.0


Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97AFD13A1F2
	for <lists+linux-tegra@lfdr.de>; Tue, 14 Jan 2020 08:26:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728969AbgANHYg (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 14 Jan 2020 02:24:36 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:6437 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729015AbgANHYf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 14 Jan 2020 02:24:35 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e1d6c9d0000>; Mon, 13 Jan 2020 23:24:13 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 13 Jan 2020 23:24:33 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 13 Jan 2020 23:24:33 -0800
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 14 Jan
 2020 07:24:33 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 14 Jan 2020 07:24:33 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.169.242]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5e1d6cb00000>; Mon, 13 Jan 2020 23:24:32 -0800
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <broonie@kernel.org>,
        <lgirdwood@gmail.com>, <perex@perex.cz>, <tiwai@suse.com>,
        <digetx@gmail.com>, <mperttunen@nvidia.com>,
        <gregkh@linuxfoundation.org>, <sboyd@kernel.org>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>
CC:     <pdeschrijver@nvidia.com>, <pgaikwad@nvidia.com>,
        <spujar@nvidia.com>, <josephl@nvidia.com>,
        <daniel.lezcano@linaro.org>, <mmaddireddy@nvidia.com>,
        <markz@nvidia.com>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v8 06/22] dt-bindings: tegra: Convert Tegra PMC bindings to YAML
Date:   Mon, 13 Jan 2020 23:24:11 -0800
Message-ID: <1578986667-16041-7-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1578986667-16041-1-git-send-email-skomatineni@nvidia.com>
References: <1578986667-16041-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1578986653; bh=XK4ZT8Ns8IKwdFoqF3Qdo7lZPPbmovhzeduBTSnnLt0=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=ZnwY9KmyaONsdUmwy4RSXPCoUDIKuczSKfrWaYvtGM6M70kPSIE8F/tEobzKRVaN8
         +ZEeLmUrNFD+B967SKLqD4xrZ2X6dSv/hBYTqWrcc7qsC1jzpWc9+3WAOSsUAT8/c8
         KE/GgvMUMiCd9+ZY8EJ7UzRgAqvmtVI9um2cy73TQ6E84qqr66+9A9bmYhtkLAXw+Y
         hvEqA7mD/sbo5FZzPhDh0UTL05XxZz6r6VyiOGbT7NNr3QCZjWGzf/cvg4eW9NqEmu
         1NH8jd1CnWcbZNq0CP0Y0Flz6p1vknXuLTeimLW2wnjh9rARSfhleOSuTPTv90tM7N
         uowtfQ4gnTI+g==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This patch converts text based Tegra PMC bindings document to YAML
schema for performing dt validation.

Tested-by: Dmitry Osipenko <digetx@gmail.com>
Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 .../bindings/arm/tegra/nvidia,tegra20-pmc.txt      | 300 ------------------
 .../bindings/arm/tegra/nvidia,tegra20-pmc.yaml     | 340 +++++++++++++++++++++
 2 files changed, 340 insertions(+), 300 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.txt
 create mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml

diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.txt b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.txt
deleted file mode 100644
index cb12f33a247f..000000000000
--- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.txt
+++ /dev/null
@@ -1,300 +0,0 @@
-NVIDIA Tegra Power Management Controller (PMC)
-
-== Power Management Controller Node ==
-
-The PMC block interacts with an external Power Management Unit. The PMC
-mostly controls the entry and exit of the system from different sleep
-modes. It provides power-gating controllers for SoC and CPU power-islands.
-
-Required properties:
-- name : Should be pmc
-- compatible : Should contain one of the following:
-	For Tegra20 must contain "nvidia,tegra20-pmc".
-	For Tegra30 must contain "nvidia,tegra30-pmc".
-	For Tegra114 must contain "nvidia,tegra114-pmc"
-	For Tegra124 must contain "nvidia,tegra124-pmc"
-	For Tegra132 must contain "nvidia,tegra124-pmc"
-	For Tegra210 must contain "nvidia,tegra210-pmc"
-- reg : Offset and length of the register set for the device
-- clocks : Must contain an entry for each entry in clock-names.
-  See ../clocks/clock-bindings.txt for details.
-- clock-names : Must include the following entries:
-  "pclk" (The Tegra clock of that name),
-  "clk32k_in" (The 32KHz clock input to Tegra).
-
-Optional properties:
-- nvidia,invert-interrupt : If present, inverts the PMU interrupt signal.
-  The PMU is an external Power Management Unit, whose interrupt output
-  signal is fed into the PMC. This signal is optionally inverted, and then
-  fed into the ARM GIC. The PMC is not involved in the detection or
-  handling of this interrupt signal, merely its inversion.
-- nvidia,suspend-mode : The suspend mode that the platform should use.
-  Valid values are 0, 1 and 2:
-  0 (LP0): CPU + Core voltage off and DRAM in self-refresh
-  1 (LP1): CPU voltage off and DRAM in self-refresh
-  2 (LP2): CPU voltage off
-- nvidia,core-power-req-active-high : Boolean, core power request active-high
-- nvidia,sys-clock-req-active-high : Boolean, system clock request active-high
-- nvidia,combined-power-req : Boolean, combined power request for CPU & Core
-- nvidia,cpu-pwr-good-en : Boolean, CPU power good signal (from PMIC to PMC)
-			   is enabled.
-
-Required properties when nvidia,suspend-mode is specified:
-- nvidia,cpu-pwr-good-time : CPU power good time in uS.
-- nvidia,cpu-pwr-off-time : CPU power off time in uS.
-- nvidia,core-pwr-good-time : <Oscillator-stable-time Power-stable-time>
-			      Core power good time in uS.
-- nvidia,core-pwr-off-time : Core power off time in uS.
-
-Required properties when nvidia,suspend-mode=<0>:
-- nvidia,lp0-vec : <start length> Starting address and length of LP0 vector
-  The LP0 vector contains the warm boot code that is executed by AVP when
-  resuming from the LP0 state. The AVP (Audio-Video Processor) is an ARM7
-  processor and always being the first boot processor when chip is power on
-  or resume from deep sleep mode. When the system is resumed from the deep
-  sleep mode, the warm boot code will restore some PLLs, clocks and then
-  bring up CPU0 for resuming the system.
-
-Hardware-triggered thermal reset:
-On Tegra30, Tegra114 and Tegra124, if the 'i2c-thermtrip' subnode exists,
-hardware-triggered thermal reset will be enabled.
-
-Required properties for hardware-triggered thermal reset (inside 'i2c-thermtrip'):
-- nvidia,i2c-controller-id : ID of I2C controller to send poweroff command to. Valid values are
-                             described in section 9.2.148 "APBDEV_PMC_SCRATCH53_0" of the
-                             Tegra K1 Technical Reference Manual.
-- nvidia,bus-addr : Bus address of the PMU on the I2C bus
-- nvidia,reg-addr : I2C register address to write poweroff command to
-- nvidia,reg-data : Poweroff command to write to PMU
-
-Optional properties for hardware-triggered thermal reset (inside 'i2c-thermtrip'):
-- nvidia,pinmux-id : Pinmux used by the hardware when issuing poweroff command.
-                     Defaults to 0. Valid values are described in section 12.5.2
-                     "Pinmux Support" of the Tegra4 Technical Reference Manual.
-
-Optional nodes:
-- powergates : This node contains a hierarchy of power domain nodes, which
-	       should match the powergates on the Tegra SoC. See "Powergate
-	       Nodes" below.
-
-Example:
-
-/ SoC dts including file
-pmc@7000f400 {
-	compatible = "nvidia,tegra20-pmc";
-	reg = <0x7000e400 0x400>;
-	clocks = <&tegra_car 110>, <&clk32k_in>;
-	clock-names = "pclk", "clk32k_in";
-	nvidia,invert-interrupt;
-	nvidia,suspend-mode = <1>;
-	nvidia,cpu-pwr-good-time = <2000>;
-	nvidia,cpu-pwr-off-time = <100>;
-	nvidia,core-pwr-good-time = <3845 3845>;
-	nvidia,core-pwr-off-time = <458>;
-	nvidia,core-power-req-active-high;
-	nvidia,sys-clock-req-active-high;
-	nvidia,lp0-vec = <0xbdffd000 0x2000>;
-};
-
-/ Tegra board dts file
-{
-	...
-	pmc@7000f400 {
-		i2c-thermtrip {
-			nvidia,i2c-controller-id = <4>;
-			nvidia,bus-addr = <0x40>;
-			nvidia,reg-addr = <0x36>;
-			nvidia,reg-data = <0x2>;
-		};
-	};
-	...
-	clocks {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		clk32k_in: clock {
-			compatible = "fixed-clock";
-			reg=<0>;
-			#clock-cells = <0>;
-			clock-frequency = <32768>;
-		};
-	};
-	...
-};
-
-
-== Powergate Nodes ==
-
-Each of the powergate nodes represents a power-domain on the Tegra SoC
-that can be power-gated by the Tegra PMC. The name of the powergate node
-should be one of the below. Note that not every powergate is applicable
-to all Tegra devices and the following list shows which powergates are
-applicable to which devices. Please refer to the Tegra TRM for more
-details on the various powergates.
-
- Name		Description			Devices Applicable
- 3d		3D Graphics			Tegra20/114/124/210
- 3d0		3D Graphics 0			Tegra30
- 3d1		3D Graphics 1			Tegra30
- aud		Audio				Tegra210
- dfd		Debug				Tegra210
- dis		Display A			Tegra114/124/210
- disb		Display B			Tegra114/124/210
- heg		2D Graphics			Tegra30/114/124/210
- iram		Internal RAM			Tegra124/210
- mpe		MPEG Encode			All
- nvdec		NVIDIA Video Decode Engine	Tegra210
- nvjpg		NVIDIA JPEG Engine		Tegra210
- pcie		PCIE				Tegra20/30/124/210
- sata		SATA				Tegra30/124/210
- sor		Display interfaces		Tegra124/210
- ve2		Video Encode Engine 2		Tegra210
- venc		Video Encode Engine		All
- vdec		Video Decode Engine		Tegra20/30/114/124
- vic		Video Imaging Compositor	Tegra124/210
- xusba		USB Partition A			Tegra114/124/210
- xusbb		USB Partition B 		Tegra114/124/210
- xusbc		USB Partition C			Tegra114/124/210
-
-Required properties:
-  - clocks: Must contain an entry for each clock required by the PMC for
-    controlling a power-gate. See ../clocks/clock-bindings.txt for details.
-  - resets: Must contain an entry for each reset required by the PMC for
-    controlling a power-gate. See ../reset/reset.txt for details.
-  - #power-domain-cells: Must be 0.
-
-Example:
-
-	pmc: pmc@7000e400 {
-		compatible = "nvidia,tegra210-pmc";
-		reg = <0x0 0x7000e400 0x0 0x400>;
-		clocks = <&tegra_car TEGRA210_CLK_PCLK>, <&clk32k_in>;
-		clock-names = "pclk", "clk32k_in";
-
-		powergates {
-			pd_audio: aud {
-				clocks = <&tegra_car TEGRA210_CLK_APE>,
-					 <&tegra_car TEGRA210_CLK_APB2APE>;
-				resets = <&tegra_car 198>;
-				#power-domain-cells = <0>;
-			};
-		};
-	};
-
-
-== Powergate Clients ==
-
-Hardware blocks belonging to a power domain should contain a "power-domains"
-property that is a phandle pointing to the corresponding powergate node.
-
-Example:
-
-	adma: adma@702e2000 {
-		...
-		power-domains = <&pd_audio>;
-		...
-	};
-
-== Pad Control ==
-
-On Tegra SoCs a pad is a set of pins which are configured as a group.
-The pin grouping is a fixed attribute of the hardware. The PMC can be
-used to set pad power state and signaling voltage. A pad can be either
-in active or power down mode. The support for power state and signaling
-voltage configuration varies depending on the pad in question. 3.3 V and
-1.8 V signaling voltages are supported on pins where software
-controllable signaling voltage switching is available.
-
-The pad configuration state nodes are placed under the pmc node and they
-are referred to by the pinctrl client properties. For more information
-see Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt.
-The pad name should be used as the value of the pins property in pin
-configuration nodes.
-
-The following pads are present on Tegra124 and Tegra132:
-audio		bb		cam		comp
-csia		csb		cse		dsi
-dsib		dsic		dsid		hdmi
-hsic		hv		lvds		mipi-bias
-nand		pex-bias	pex-clk1	pex-clk2
-pex-cntrl	sdmmc1		sdmmc3		sdmmc4
-sys_ddc		uart		usb0		usb1
-usb2		usb_bias
-
-The following pads are present on Tegra210:
-audio		audio-hv	cam		csia
-csib		csic		csid		csie
-csif		dbg		debug-nonao	dmic
-dp		dsi		dsib		dsic
-dsid		emmc		emmc2		gpio
-hdmi		hsic		lvds		mipi-bias
-pex-bias	pex-clk1	pex-clk2	pex-cntrl
-sdmmc1		sdmmc3		spi		spi-hv
-uart		usb0		usb1		usb2
-usb3		usb-bias
-
-Required pin configuration properties:
-  - pins: Must contain name of the pad(s) to be configured.
-
-Optional pin configuration properties:
-  - low-power-enable: Configure the pad into power down mode
-  - low-power-disable: Configure the pad into active mode
-  - power-source: Must contain either TEGRA_IO_PAD_VOLTAGE_1V8
-    or TEGRA_IO_PAD_VOLTAGE_3V3 to select between signaling voltages.
-    The values are defined in
-    include/dt-bindings/pinctrl/pinctrl-tegra-io-pad.h.
-
-Note: The power state can be configured on all of the Tegra124 and
-      Tegra132 pads. None of the Tegra124 or Tegra132 pads support
-      signaling voltage switching.
-
-Note: All of the listed Tegra210 pads except pex-cntrl support power
-      state configuration. Signaling voltage switching is supported on
-      following Tegra210 pads: audio, audio-hv, cam, dbg, dmic, gpio,
-      pex-cntrl, sdmmc1, sdmmc3, spi, spi-hv, and uart.
-
-Pad configuration state example:
-	pmc: pmc@7000e400 {
-		compatible = "nvidia,tegra210-pmc";
-		reg = <0x0 0x7000e400 0x0 0x400>;
-		clocks = <&tegra_car TEGRA210_CLK_PCLK>, <&clk32k_in>;
-		clock-names = "pclk", "clk32k_in";
-
-		...
-
-		sdmmc1_3v3: sdmmc1-3v3 {
-			pins = "sdmmc1";
-			power-source = <TEGRA_IO_PAD_VOLTAGE_3V3>;
-		};
-
-		sdmmc1_1v8: sdmmc1-1v8 {
-			pins = "sdmmc1";
-			power-source = <TEGRA_IO_PAD_VOLTAGE_1V8>;
-		};
-
-		hdmi_off: hdmi-off {
-			pins = "hdmi";
-			low-power-enable;
-		}
-
-		hdmi_on: hdmi-on {
-			pins = "hdmi";
-			low-power-disable;
-		}
-	};
-
-Pinctrl client example:
-	sdmmc1: sdhci@700b0000 {
-		...
-		pinctrl-names = "sdmmc-3v3", "sdmmc-1v8";
-		pinctrl-0 = <&sdmmc1_3v3>;
-		pinctrl-1 = <&sdmmc1_1v8>;
-	};
-	...
-	sor@54540000 {
-		...
-		pinctrl-0 = <&hdmi_off>;
-		pinctrl-1 = <&hdmi_on>;
-		pinctrl-names = "hdmi-on", "hdmi-off";
-	};
diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
new file mode 100644
index 000000000000..3ff34b348141
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
@@ -0,0 +1,340 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/tegra/nvidia,tegra20-pmc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Tegra Power Management Controller (PMC)
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jonathan Hunter <jonathanh@nvidia.com>
+
+properties:
+  compatible:
+    enum:
+      - nvidia,tegra20-pmc
+      - nvidia,tegra20-pmc
+      - nvidia,tegra30-pmc
+      - nvidia,tegra114-pmc
+      - nvidia,tegra124-pmc
+      - nvidia,tegra210-pmc
+
+  reg:
+    maxItems: 1
+    description:
+      Offset and length of the register set for the device.
+
+  clock-names:
+    items:
+      - const: pclk
+      - const: clk32k_in
+    description:
+      Must includes entries pclk and clk32k_in.
+      pclk is the Tegra clock of that name and clk32k_in is 32KHz clock
+      input to Tegra.
+
+  clocks:
+    maxItems: 2
+    description:
+      Must contain an entry for each entry in clock-names.
+      See ../clocks/clocks-bindings.txt for details.
+
+  '#interrupt-cells':
+    const: 2
+    description:
+      Specifies number of cells needed to encode an interrupt source.
+      The value must be 2.
+
+  interrupt-controller: true
+
+  nvidia,invert-interrupt:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: Inverts the PMU interrupt signal.
+      The PMU is an external Power Management Unit, whose interrupt output
+      signal is fed into the PMC. This signal is optionally inverted, and
+      then fed into the ARM GIC. The PMC is not involved in the detection
+      or handling of this interrupt signal, merely its inversion.
+
+  nvidia,core-power-req-active-high:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: Core power request active-high.
+
+  nvidia,sys-clock-req-active-high:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: System clock request active-high.
+
+  nvidia,combined-power-req:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: combined power request for CPU and Core.
+
+  nvidia,cpu-pwr-good-en:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      CPU power good signal from external PMIC to PMC is enabled.
+
+  nvidia,suspend-mode:
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - enum: [0, 1, 2]
+    description:
+      The suspend mode that the platform should use.
+      Mode 0 is for LP0, CPU + Core voltage off and DRAM in self-refresh
+      Mode 1 is for LP1, CPU voltage off and DRAM in self-refresh
+      Mode 2 is for LP2, CPU voltage off
+
+  nvidia,cpu-pwr-good-time:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: CPU power good time in uSec.
+
+  nvidia,cpu-pwr-off-time:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: CPU power off time in uSec.
+
+  nvidia,core-pwr-good-time:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description:
+      <Oscillator-stable-time Power-stable-time>
+      Core power good time in uSec.
+
+  nvidia,core-pwr-off-time:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Core power off time in uSec.
+
+  nvidia,lp0-vec:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description:
+      <start length> Starting address and length of LP0 vector.
+      The LP0 vector contains the warm boot code that is executed
+      by AVP when resuming from the LP0 state.
+      The AVP (Audio-Video Processor) is an ARM7 processor and
+      always being the first boot processor when chip is power on
+      or resume from deep sleep mode. When the system is resumed
+      from the deep sleep mode, the warm boot code will restore
+      some PLLs, clocks and then brings up CPU0 for resuming the
+      system.
+
+  i2c-thermtrip:
+    type: object
+    description:
+      On Tegra30, Tegra114 and Tegra124 if i2c-thermtrip subnode exists,
+      hardware-triggered thermal reset will be enabled.
+
+    properties:
+      nvidia,i2c-controller-id:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          ID of I2C controller to send poweroff command to PMU.
+          Valid values are described in section 9.2.148
+          "APBDEV_PMC_SCRATCH53_0" of the Tegra K1 Technical Reference
+          Manual.
+
+      nvidia,bus-addr:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: Bus address of the PMU on the I2C bus.
+
+      nvidia,reg-addr:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: PMU I2C register address to issue poweroff command.
+
+      nvidia,reg-data:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: Poweroff command to write to PMU.
+
+      nvidia,pinmux-id:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Pinmux used by the hardware when issuing Poweroff command.
+          Defaults to 0. Valid values are described in section 12.5.2
+          "Pinmux Support" of the Tegra4 Technical Reference Manual.
+
+    required:
+      - nvidia,i2c-controller-id
+      - nvidia,bus-addr
+      - nvidia,reg-addr
+      - nvidia,reg-data
+
+    additionalProperties: false
+
+  powergates:
+    type: object
+    description: |
+      This node contains a hierarchy of power domain nodes, which should
+      match the powergates on the Tegra SoC. Each powergate node
+      represents a power-domain on the Tegra SoC that can be power-gated
+      by the Tegra PMC.
+      Hardware blocks belonging to a power domain should contain
+      "power-domains" property that is a phandle pointing to corresponding
+      powergate node.
+      The name of the powergate node should be one of the below. Note that
+      not every powergate is applicable to all Tegra devices and the following
+      list shows which powergates are applicable to which devices.
+      Please refer to Tegra TRM for mode details on the powergate nodes to
+      use for each power-gate block inside Tegra.
+      Name		Description			            Devices Applicable
+      3d		  3D Graphics			            Tegra20/114/124/210
+      3d0		  3D Graphics 0		            Tegra30
+      3d1		  3D Graphics 1		            Tegra30
+      aud		  Audio				                Tegra210
+      dfd		  Debug				                Tegra210
+      dis		  Display A			              Tegra114/124/210
+      disb		Display B			              Tegra114/124/210
+      heg		  2D Graphics		            	Tegra30/114/124/210
+      iram		Internal RAM		            Tegra124/210
+      mpe		  MPEG Encode			            All
+      nvdec		NVIDIA Video Decode Engine	Tegra210
+      nvjpg		NVIDIA JPEG Engine		      Tegra210
+      pcie		PCIE				                Tegra20/30/124/210
+      sata		SATA				                Tegra30/124/210
+      sor		  Display interfaces       		Tegra124/210
+      ve2		  Video Encode Engine 2		    Tegra210
+      venc		Video Encode Engine		      All
+      vdec		Video Decode Engine		      Tegra20/30/114/124
+      vic		  Video Imaging Compositor	  Tegra124/210
+      xusba		USB Partition A			        Tegra114/124/210
+      xusbb		USB Partition B 		        Tegra114/124/210
+      xusbc		USB Partition C			        Tegra114/124/210
+
+    patternProperties:
+      "^[a-z0-9]+$":
+        type: object
+
+        patternProperties:
+          clocks:
+            minItems: 1
+            maxItems: 8
+            description:
+              Must contain an entry for each clock required by the PMC
+              for controlling a power-gate.
+              See ../clocks/clock-bindings.txt document for more details.
+
+          resets:
+            minItems: 1
+            maxItems: 8
+            description:
+              Must contain an entry for each reset required by the PMC
+              for controlling a power-gate.
+              See ../reset/reset.txt for more details.
+
+          '#power-domain-cells':
+            const: 0
+            description: Must be 0.
+
+        required:
+          - clocks
+          - resets
+          - '#power-domain-cells'
+
+    additionalProperties: false
+
+patternProperties:
+  "^[a-f0-9]+-[a-f0-9]+$":
+    type: object
+    description:
+      This is a Pad configuration node. On Tegra SOCs a pad is a set of
+      pins which are configured as a group. The pin grouping is a fixed
+      attribute of the hardware. The PMC can be used to set pad power state
+      and signaling voltage. A pad can be either in active or power down mode.
+      The support for power state and signaling voltage configuration varies
+      depending on the pad in question. 3.3V and 1.8V signaling voltages
+      are supported on pins where software controllable signaling voltage
+      switching is available.
+
+      The pad configuration state nodes are placed under the pmc node and they
+      are referred to by the pinctrl client properties. For more information
+      see Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt.
+      The pad name should be used as the value of the pins property in pin
+      configuration nodes.
+
+      The following pads are present on Tegra124 and Tegra132
+      audio, bb, cam, comp, csia, csb, cse, dsi, dsib, dsic, dsid, hdmi, hsic,
+      hv, lvds, mipi-bias, nand, pex-bias, pex-clk1, pex-clk2, pex-cntrl,
+      sdmmc1, sdmmc3, sdmmc4, sys_ddc, uart, usb0, usb1, usb2, usb_bias.
+
+      The following pads are present on Tegra210
+      audio, audio-hv, cam, csia, csib, csic, csid, csie, csif, dbg,
+      debug-nonao, dmic, dp, dsi, dsib, dsic, dsid, emmc, emmc2, gpio, hdmi,
+      hsic, lvds, mipi-bias, pex-bias, pex-clk1, pex-clk2, pex-cntrl, sdmmc1,
+      sdmmc3, spi, spi-hv, uart, usb0, usb1, usb2, usb3, usb-bias.
+
+    properties:
+      pins:
+        $ref: /schemas/types.yaml#/definitions/string
+        description: Must contain name of the pad(s) to be configured.
+
+      low-power-enable:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description: Configure the pad into power down mode.
+
+      low-power-disable:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description: Configure the pad into active mode.
+
+      power-source:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Must contain either TEGRA_IO_PAD_VOLTAGE_1V8 or
+          TEGRA_IO_PAD_VOLTAGE_3V3 to select between signaling voltages.
+          The values are defined in
+          include/dt-bindings/pinctrl/pinctrl-tegra-io-pad.h.
+          Power state can be configured on all Tegra124 and Tegra132
+          pads. None of the Tegra124 or Tegra132 pads support signaling
+          voltage switching.
+          All of the listed Tegra210 pads except pex-cntrl support power
+          state configuration. Signaling voltage switching is supported
+          on below Tegra210 pads.
+          audio, audio-hv, cam, dbg, dmic, gpio, pex-cntrl, sdmmc1,
+          sdmmc3, spi, spi-hv, and uart.
+
+    required:
+      - pins
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - clock-names
+  - clocks
+
+dependencies:
+  "nvidia,suspend-mode": ["nvidia,core-pwr-off-time", "nvidia,cpu-pwr-off-time"]
+  "nvidia,core-pwr-off-time": ["nvidia,core-pwr-good-time"]
+  "nvidia,cpu-pwr-off-time": ["nvidia,cpu-pwr-good-time"]
+
+examples:
+  - |
+
+    #include <dt-bindings/clock/tegra210-car.h>
+    #include <dt-bindings/pinctrl/pinctrl-tegra-io-pad.h>
+
+    tegra_pmc: pmc@7000e400 {
+              compatible = "nvidia,tegra210-pmc";
+              reg = <0x0 0x7000e400 0x0 0x400>;
+              clocks = <&tegra_car TEGRA210_CLK_PCLK>, <&clk32k_in>;
+              clock-names = "pclk", "clk32k_in";
+
+              nvidia,invert-interrupt;
+              nvidia,suspend-mode = <0>;
+              nvidia,cpu-pwr-good-time = <0>;
+              nvidia,cpu-pwr-off-time = <0>;
+              nvidia,core-pwr-good-time = <4587 3876>;
+              nvidia,core-pwr-off-time = <39065>;
+              nvidia,core-power-req-active-high;
+              nvidia,sys-clock-req-active-high;
+
+              powergates {
+                    pd_audio: aud {
+                            clocks = <&tegra_car TEGRA210_CLK_APE>,
+                                     <&tegra_car TEGRA210_CLK_APB2APE>;
+                            resets = <&tegra_car 198>;
+                            #power-domain-cells = <0>;
+                    };
+
+                    pd_xusbss: xusba {
+                            clocks = <&tegra_car TEGRA210_CLK_XUSB_SS>;
+                            resets = <&tegra_car TEGRA210_CLK_XUSB_SS>;
+                            #power-domain-cells = <0>;
+                    };
+              };
+    };
-- 
2.7.4


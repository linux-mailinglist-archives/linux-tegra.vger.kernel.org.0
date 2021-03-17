Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEFF633F94F
	for <lists+linux-tegra@lfdr.de>; Wed, 17 Mar 2021 20:32:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233352AbhCQTbr (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 17 Mar 2021 15:31:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233238AbhCQTba (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 17 Mar 2021 15:31:30 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56F94C06174A;
        Wed, 17 Mar 2021 12:31:30 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id j11so680806lfg.12;
        Wed, 17 Mar 2021 12:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6BjVf6mmkdH28dC5oAJq3RSs3Ve18Luz/JLmmmZH9wc=;
        b=BVC4aJu0ajcM61PTlSjaOjLI4bIb3YYncEXmEi+HyL19fsqxYTaLmg8y88KI+iM6NY
         dCkeRbySBdfTB8RLK4SVqbYLUypYZxYItZZHak680NPUzh6JFzVnlBbmhIF0ljxKZYHK
         /WLfHLjnjNxw24wIrHDSEVkwQY9kenInQhr9+CSIngO/QmOSXmT2Zg2USExwS6YHOFUA
         J+YZFo4A2GNIccYwtEWmXzGC/q1BIRqw9I9oG8tnMJoVKEJDXCVVEaZjIhsVvjH6p04u
         o/vHWmFHpA4/Ep3BiLdu/c7fVB1htBhS0de3NOXAXBWChvx/u9n8DHY4lIuBldHU6qVZ
         ZVGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6BjVf6mmkdH28dC5oAJq3RSs3Ve18Luz/JLmmmZH9wc=;
        b=VHkNG174X6X+7Wclmpet+YizORrsZzb6/XBperWA2iliApK42ptCG6CvLFgG+UQdQM
         Hef2NG0LbcTPDG5gEs8wZQnVD55Ql5aFK0rAdADHBmtEhiQeduWnjBmvT/eCER6uhtL4
         AUN/NCr/MhWamebD8sEUS3DcUx2xzeFR7WaVCsJimOGcnespZUVS0c56bsfD5hmBlHCn
         1HukmV9zd/CNXbu2uRrQoE0tJK7pxjAtXGzABQTHtvm3vrSmUhGBNxq60moHfiLoO3Az
         YMwBC5TOnJWM2NBYSaUXC0+FiBHc/SEopMrFAONKZfUo2I6ludO4AOgp1mwdkGWJ790K
         4Wjg==
X-Gm-Message-State: AOAM5330648PiW0+2bgay3OlOqZrCGXYvnDQ+zGh7PgcfAHWWKxUuLHg
        bwK+aaGSq2+gv4knxB8h+mA=
X-Google-Smtp-Source: ABdhPJyrFTjQaCZoYfMXMbuXRkyMWESAG/sILn5I8Iccp2HuF32UoCHhwlvok6a1RfW0EgpyaDQv4w==
X-Received: by 2002:a05:6512:3a86:: with SMTP id q6mr3383559lfu.286.1616009488797;
        Wed, 17 Mar 2021 12:31:28 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.gmail.com with ESMTPSA id q24sm3623098lji.40.2021.03.17.12.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 12:31:28 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v5 7/7] dt-bindings: clock: tegra: Convert to schema
Date:   Wed, 17 Mar 2021 22:30:06 +0300
Message-Id: <20210317193006.29633-8-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210317193006.29633-1-digetx@gmail.com>
References: <20210317193006.29633-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Convert NVIDIA Tegra clock bindings to schema.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../bindings/clock/nvidia,tegra114-car.txt    |  63 ----------
 .../bindings/clock/nvidia,tegra124-car.txt    | 107 ----------------
 .../bindings/clock/nvidia,tegra124-car.yaml   | 115 ++++++++++++++++++
 .../bindings/clock/nvidia,tegra20-car.txt     |  63 ----------
 .../bindings/clock/nvidia,tegra20-car.yaml    |  69 +++++++++++
 .../bindings/clock/nvidia,tegra210-car.txt    |  56 ---------
 .../bindings/clock/nvidia,tegra30-car.txt     |  63 ----------
 7 files changed, 184 insertions(+), 352 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra114-car.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra124-car.txt
 create mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra124-car.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra20-car.txt
 create mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra210-car.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra30-car.txt

diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra114-car.txt b/Documentation/devicetree/bindings/clock/nvidia,tegra114-car.txt
deleted file mode 100644
index 9acea9d93160..000000000000
--- a/Documentation/devicetree/bindings/clock/nvidia,tegra114-car.txt
+++ /dev/null
@@ -1,63 +0,0 @@
-NVIDIA Tegra114 Clock And Reset Controller
-
-This binding uses the common clock binding:
-Documentation/devicetree/bindings/clock/clock-bindings.txt
-
-The CAR (Clock And Reset) Controller on Tegra is the HW module responsible
-for muxing and gating Tegra's clocks, and setting their rates.
-
-Required properties :
-- compatible : Should be "nvidia,tegra114-car"
-- reg : Should contain CAR registers location and length
-- clocks : Should contain phandle and clock specifiers for two clocks:
-  the 32 KHz "32k_in", and the board-specific oscillator "osc".
-- #clock-cells : Should be 1.
-  In clock consumers, this cell represents the clock ID exposed by the
-  CAR. The assignments may be found in header file
-  <dt-bindings/clock/tegra114-car.h>.
-- #reset-cells : Should be 1.
-  In clock consumers, this cell represents the bit number in the CAR's
-  array of CLK_RST_CONTROLLER_RST_DEVICES_* registers.
-
-Example SoC include file:
-
-/ {
-	tegra_car: clock {
-		compatible = "nvidia,tegra114-car";
-		reg = <0x60006000 0x1000>;
-		#clock-cells = <1>;
-		#reset-cells = <1>;
-	};
-
-	usb@c5004000 {
-		clocks = <&tegra_car TEGRA114_CLK_USB2>;
-	};
-};
-
-Example board file:
-
-/ {
-	clocks {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		osc: clock@0 {
-			compatible = "fixed-clock";
-			reg = <0>;
-			#clock-cells = <0>;
-			clock-frequency = <12000000>;
-		};
-
-		clk_32k: clock@1 {
-			compatible = "fixed-clock";
-			reg = <1>;
-			#clock-cells = <0>;
-			clock-frequency = <32768>;
-		};
-	};
-
-	&tegra_car {
-		clocks = <&clk_32k> <&osc>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra124-car.txt b/Documentation/devicetree/bindings/clock/nvidia,tegra124-car.txt
deleted file mode 100644
index 7f02fb4ca4ad..000000000000
--- a/Documentation/devicetree/bindings/clock/nvidia,tegra124-car.txt
+++ /dev/null
@@ -1,107 +0,0 @@
-NVIDIA Tegra124 and Tegra132 Clock And Reset Controller
-
-This binding uses the common clock binding:
-Documentation/devicetree/bindings/clock/clock-bindings.txt
-
-The CAR (Clock And Reset) Controller on Tegra is the HW module responsible
-for muxing and gating Tegra's clocks, and setting their rates.
-
-Required properties :
-- compatible : Should be "nvidia,tegra124-car" or "nvidia,tegra132-car"
-- reg : Should contain CAR registers location and length
-- clocks : Should contain phandle and clock specifiers for two clocks:
-  the 32 KHz "32k_in", and the board-specific oscillator "osc".
-- #clock-cells : Should be 1.
-  In clock consumers, this cell represents the clock ID exposed by the
-  CAR. The assignments may be found in the header files
-  <dt-bindings/clock/tegra124-car-common.h> (which covers IDs common
-  to Tegra124 and Tegra132) and <dt-bindings/clock/tegra124-car.h>
-  (for Tegra124-specific clocks).
-- #reset-cells : Should be 1.
-  In clock consumers, this cell represents the bit number in the CAR's
-  array of CLK_RST_CONTROLLER_RST_DEVICES_* registers.
-- nvidia,external-memory-controller : phandle of the EMC driver.
-
-The node should contain a "emc-timings" subnode for each supported RAM type (see
-field RAM_CODE in register PMC_STRAPPING_OPT_A).
-
-Required properties for "emc-timings" nodes :
-- nvidia,ram-code : Should contain the value of RAM_CODE this timing set
-  is used for.
-
-Each "emc-timings" node should contain a "timing" subnode for every supported
-EMC clock rate.
-
-Required properties for "timing" nodes :
-- clock-frequency : Should contain the memory clock rate to which this timing
-relates.
-- nvidia,parent-clock-frequency : Should contain the rate at which the current
-parent of the EMC clock should be running at this timing.
-- clocks : Must contain an entry for each entry in clock-names.
-  See ../clocks/clock-bindings.txt for details.
-- clock-names : Must include the following entries:
-  - emc-parent : the clock that should be the parent of the EMC clock at this
-timing.
-
-Example SoC include file:
-
-/ {
-	tegra_car: clock@60006000 {
-		compatible = "nvidia,tegra124-car";
-		reg = <0x60006000 0x1000>;
-		#clock-cells = <1>;
-		#reset-cells = <1>;
-		nvidia,external-memory-controller = <&emc>;
-	};
-
-	usb@c5004000 {
-		clocks = <&tegra_car TEGRA124_CLK_USB2>;
-	};
-};
-
-Example board file:
-
-/ {
-	clocks {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		osc: clock@0 {
-			compatible = "fixed-clock";
-			reg = <0>;
-			#clock-cells = <0>;
-			clock-frequency = <112400000>;
-		};
-
-		clk_32k: clock@1 {
-			compatible = "fixed-clock";
-			reg = <1>;
-			#clock-cells = <0>;
-			clock-frequency = <32768>;
-		};
-	};
-
-	&tegra_car {
-		clocks = <&clk_32k> <&osc>;
-	};
-
-	clock@60006000 {
-		emc-timings-3 {
-			nvidia,ram-code = <3>;
-
-			timing-12750000 {
-				clock-frequency = <12750000>;
-				nvidia,parent-clock-frequency = <408000000>;
-				clocks = <&tegra_car TEGRA124_CLK_PLL_P>;
-				clock-names = "emc-parent";
-			};
-			timing-20400000 {
-				clock-frequency = <20400000>;
-				nvidia,parent-clock-frequency = <408000000>;
-				clocks = <&tegra_car TEGRA124_CLK_PLL_P>;
-				clock-names = "emc-parent";
-			};
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra124-car.yaml b/Documentation/devicetree/bindings/clock/nvidia,tegra124-car.yaml
new file mode 100644
index 000000000000..ec7ab1483652
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/nvidia,tegra124-car.yaml
@@ -0,0 +1,115 @@
+# SPDX-License-Identifier: (GPL-2.0+ OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/nvidia,tegra124-car.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra Clock and Reset Controller
+
+maintainers:
+  - Jon Hunter <jonathanh@nvidia.com>
+  - Thierry Reding <thierry.reding@gmail.com>
+
+description: |
+  The Clock and Reset (CAR) is the HW module responsible for muxing and gating
+  Tegra's clocks, and setting their rates. It comprises CLKGEN and RSTGEN units.
+
+  CLKGEN provides the registers to program the PLLs. It controls most of
+  the clock source programming and most of the clock dividers.
+
+  CLKGEN input signals include the external clock for the reference frequency
+  (12 MHz, 26 MHz) and the external clock for the Real Time Clock (32.768 KHz).
+
+  Outputs from CLKGEN are inputs clock of the h/w blocks in the Tegra system.
+
+  RSTGEN provides the registers needed to control resetting of each block in
+  the Tegra system.
+
+properties:
+  compatible:
+    const: nvidia,tegra124-car
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  "#reset-cells":
+    const: 1
+
+  nvidia,external-memory-controller:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      phandle of the external memory controller node
+
+patternProperties:
+  "^emc-timings-[0-9]+$":
+    type: object
+    properties:
+      nvidia,ram-code:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          value of the RAM_CODE field in the PMC_STRAPPING_OPT_A register that
+          this timing set is used for
+
+    patternProperties:
+      "^timing-[0-9]+$":
+        type: object
+        properties:
+          clock-frequency:
+            description:
+              external memory clock rate in Hz
+            minimum: 1000000
+            maximum: 1000000000
+
+          nvidia,parent-clock-frequency:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description:
+              rate of parent clock in Hz
+            minimum: 1000000
+            maximum: 1000000000
+
+          clocks:
+            items:
+              - description: parent clock of EMC
+
+          clock-names:
+            items:
+              - const: emc-parent
+
+        required:
+          - clock-frequency
+          - nvidia,parent-clock-frequency
+          - clocks
+          - clock-names
+
+        additionalProperties: false
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+  - "#reset-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/tegra124-car.h>
+
+    car: clock-controller@60006000 {
+        compatible = "nvidia,tegra124-car";
+        reg = <0x60006000 0x1000>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
+
+    usb-controller@c5004000 {
+        compatible = "nvidia,tegra20-ehci";
+        reg = <0xc5004000 0x4000>;
+        clocks = <&car TEGRA124_CLK_USB2>;
+        resets = <&car TEGRA124_CLK_USB2>;
+    };
diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.txt b/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.txt
deleted file mode 100644
index 6c5901b503d0..000000000000
--- a/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.txt
+++ /dev/null
@@ -1,63 +0,0 @@
-NVIDIA Tegra20 Clock And Reset Controller
-
-This binding uses the common clock binding:
-Documentation/devicetree/bindings/clock/clock-bindings.txt
-
-The CAR (Clock And Reset) Controller on Tegra is the HW module responsible
-for muxing and gating Tegra's clocks, and setting their rates.
-
-Required properties :
-- compatible : Should be "nvidia,tegra20-car"
-- reg : Should contain CAR registers location and length
-- clocks : Should contain phandle and clock specifiers for two clocks:
-  the 32 KHz "32k_in", and the board-specific oscillator "osc".
-- #clock-cells : Should be 1.
-  In clock consumers, this cell represents the clock ID exposed by the
-  CAR. The assignments may be found in header file
-  <dt-bindings/clock/tegra20-car.h>.
-- #reset-cells : Should be 1.
-  In clock consumers, this cell represents the bit number in the CAR's
-  array of CLK_RST_CONTROLLER_RST_DEVICES_* registers.
-
-Example SoC include file:
-
-/ {
-	tegra_car: clock {
-		compatible = "nvidia,tegra20-car";
-		reg = <0x60006000 0x1000>;
-		#clock-cells = <1>;
-		#reset-cells = <1>;
-	};
-
-	usb@c5004000 {
-		clocks = <&tegra_car TEGRA20_CLK_USB2>;
-	};
-};
-
-Example board file:
-
-/ {
-	clocks {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		osc: clock@0 {
-			compatible = "fixed-clock";
-			reg = <0>;
-			#clock-cells = <0>;
-			clock-frequency = <12000000>;
-		};
-
-		clk_32k: clock@1 {
-			compatible = "fixed-clock";
-			reg = <1>;
-			#clock-cells = <0>;
-			clock-frequency = <32768>;
-		};
-	};
-
-	&tegra_car {
-		clocks = <&clk_32k> <&osc>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml b/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml
new file mode 100644
index 000000000000..459d2a525393
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0+ OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/nvidia,tegra20-car.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra Clock and Reset Controller
+
+maintainers:
+  - Jon Hunter <jonathanh@nvidia.com>
+  - Thierry Reding <thierry.reding@gmail.com>
+
+description: |
+  The Clock and Reset (CAR) is the HW module responsible for muxing and gating
+  Tegra's clocks, and setting their rates. It comprises CLKGEN and RSTGEN units.
+
+  CLKGEN provides the registers to program the PLLs. It controls most of
+  the clock source programming and most of the clock dividers.
+
+  CLKGEN input signals include the external clock for the reference frequency
+  (12 MHz, 26 MHz) and the external clock for the Real Time Clock (32.768 KHz).
+
+  Outputs from CLKGEN are inputs clock of the h/w blocks in the Tegra system.
+
+  RSTGEN provides the registers needed to control resetting of each block in
+  the Tegra system.
+
+properties:
+  compatible:
+    enum:
+      - nvidia,tegra20-car
+      - nvidia,tegra30-car
+      - nvidia,tegra114-car
+      - nvidia,tegra210-car
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  "#reset-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+  - "#reset-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/tegra20-car.h>
+
+    car: clock-controller@60006000 {
+        compatible = "nvidia,tegra20-car";
+        reg = <0x60006000 0x1000>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
+
+    usb-controller@c5004000 {
+        compatible = "nvidia,tegra20-ehci";
+        reg = <0xc5004000 0x4000>;
+        clocks = <&car TEGRA20_CLK_USB2>;
+        resets = <&car TEGRA20_CLK_USB2>;
+    };
diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra210-car.txt b/Documentation/devicetree/bindings/clock/nvidia,tegra210-car.txt
deleted file mode 100644
index 26f237f641b7..000000000000
--- a/Documentation/devicetree/bindings/clock/nvidia,tegra210-car.txt
+++ /dev/null
@@ -1,56 +0,0 @@
-NVIDIA Tegra210 Clock And Reset Controller
-
-This binding uses the common clock binding:
-Documentation/devicetree/bindings/clock/clock-bindings.txt
-
-The CAR (Clock And Reset) Controller on Tegra is the HW module responsible
-for muxing and gating Tegra's clocks, and setting their rates.
-
-Required properties :
-- compatible : Should be "nvidia,tegra210-car"
-- reg : Should contain CAR registers location and length
-- clocks : Should contain phandle and clock specifiers for two clocks:
-  the 32 KHz "32k_in".
-- #clock-cells : Should be 1.
-  In clock consumers, this cell represents the clock ID exposed by the
-  CAR. The assignments may be found in header file
-  <dt-bindings/clock/tegra210-car.h>.
-- #reset-cells : Should be 1.
-  In clock consumers, this cell represents the bit number in the CAR's
-  array of CLK_RST_CONTROLLER_RST_DEVICES_* registers.
-
-Example SoC include file:
-
-/ {
-	tegra_car: clock {
-		compatible = "nvidia,tegra210-car";
-		reg = <0x60006000 0x1000>;
-		#clock-cells = <1>;
-		#reset-cells = <1>;
-	};
-
-	usb@c5004000 {
-		clocks = <&tegra_car TEGRA210_CLK_USB2>;
-	};
-};
-
-Example board file:
-
-/ {
-	clocks {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		clk_32k: clock@1 {
-			compatible = "fixed-clock";
-			reg = <1>;
-			#clock-cells = <0>;
-			clock-frequency = <32768>;
-		};
-	};
-
-	&tegra_car {
-		clocks = <&clk_32k>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra30-car.txt b/Documentation/devicetree/bindings/clock/nvidia,tegra30-car.txt
deleted file mode 100644
index 63618cde12df..000000000000
--- a/Documentation/devicetree/bindings/clock/nvidia,tegra30-car.txt
+++ /dev/null
@@ -1,63 +0,0 @@
-NVIDIA Tegra30 Clock And Reset Controller
-
-This binding uses the common clock binding:
-Documentation/devicetree/bindings/clock/clock-bindings.txt
-
-The CAR (Clock And Reset) Controller on Tegra is the HW module responsible
-for muxing and gating Tegra's clocks, and setting their rates.
-
-Required properties :
-- compatible : Should be "nvidia,tegra30-car"
-- reg : Should contain CAR registers location and length
-- clocks : Should contain phandle and clock specifiers for two clocks:
-  the 32 KHz "32k_in", and the board-specific oscillator "osc".
-- #clock-cells : Should be 1.
-  In clock consumers, this cell represents the clock ID exposed by the
-  CAR. The assignments may be found in header file
-  <dt-bindings/clock/tegra30-car.h>.
-- #reset-cells : Should be 1.
-  In clock consumers, this cell represents the bit number in the CAR's
-  array of CLK_RST_CONTROLLER_RST_DEVICES_* registers.
-
-Example SoC include file:
-
-/ {
-	tegra_car: clock {
-		compatible = "nvidia,tegra30-car";
-		reg = <0x60006000 0x1000>;
-		#clock-cells = <1>;
-		#reset-cells = <1>;
-	};
-
-	usb@c5004000 {
-		clocks = <&tegra_car TEGRA30_CLK_USB2>;
-	};
-};
-
-Example board file:
-
-/ {
-	clocks {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		osc: clock@0 {
-			compatible = "fixed-clock";
-			reg = <0>;
-			#clock-cells = <0>;
-			clock-frequency = <12000000>;
-		};
-
-		clk_32k: clock@1 {
-			compatible = "fixed-clock";
-			reg = <1>;
-			#clock-cells = <0>;
-			clock-frequency = <32768>;
-		};
-	};
-
-	&tegra_car {
-		clocks = <&clk_32k> <&osc>;
-	};
-};
-- 
2.30.2


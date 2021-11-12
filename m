Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AECB44E5EB
	for <lists+linux-tegra@lfdr.de>; Fri, 12 Nov 2021 13:05:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234749AbhKLMIX (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 12 Nov 2021 07:08:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231416AbhKLMIW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Nov 2021 07:08:22 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E9BCC061766;
        Fri, 12 Nov 2021 04:05:31 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id y84-20020a1c7d57000000b00330cb84834fso9651896wmc.2;
        Fri, 12 Nov 2021 04:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S3sjksDIQ9MKliIa1LJLuy02teNrCGoXHUHhRkTM9zo=;
        b=hMLMQ5Lf1c6UpwptU/CHkPRHPsYVeKk8h4iiZJO59nNGo0iYpxPP/Z5p0nyMtwOKdV
         Mq4nRrpvWm18eAAlUA3fPC1WAlfV5hfDE2ewsvdnFrtRut1PpLBRMQlbSUJ/yE2QBSlR
         evjppDdsRUJrwvKVcue4NgTrbvT/5kaQayBsoExLcQ2E0vewWahBCXF4t2FKXhs3AvPg
         /W8+lTva8h3leJYbsruTjzAvcDYNNBuU8G1yO1CnBfVbKVe2A/AinyI/7Q/Pi+3hCaFS
         PkR5n7Hw0ldXStlrYXuhv4tlHG6ar/t5gKHzvYV4Ult+X/P0QvB9qY+thwQ+FuAV6WBw
         AZqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S3sjksDIQ9MKliIa1LJLuy02teNrCGoXHUHhRkTM9zo=;
        b=Y8K6aEQ0ka6f9k2ftdRnQngVDPVSexGfU7JzpVehXg6PgzmE9pTMqJ3sDjmIl23MZB
         5eW5CiHHkjkUvvJ6jP0MS0pbxgNVh2YFpjrBc+1QkpQPEq5WBd3KWnvzfzQndg8iSDC+
         lsTVi3XgiNddZP6yOuf3PmGDECRjin+wVNVxA7wtWAoHcxoI6PE+/wkxOwifqoBWgd4c
         CJWoDqs1tSb552Gjscf5YgldfaQHc6FSclqIaMEEKu9PfQX/MyPLykYqk23mGlAUh51f
         RJn2nuo2RE9LHeX4UHjTdYiFn72SWLMZf3ZahyKM5u+08YeFUU3usUgVXhCL3UAzz0XB
         mWkQ==
X-Gm-Message-State: AOAM533QAq0wC1fs2eFYHSnTPRuJ/H4++l4cl26D3KlBeTmHmGk+mgod
        4QnmBdrjR2bRuiPNdxJi750=
X-Google-Smtp-Source: ABdhPJwB/3eLr4MQbwDcicOSovY665iElrgpJKeY5hlma105kE5Yo9yh3zxqqIlcm1kGGCtjAj3N0g==
X-Received: by 2002:a05:600c:1ca4:: with SMTP id k36mr16614998wms.169.1636718730072;
        Fri, 12 Nov 2021 04:05:30 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id l5sm11834431wms.16.2021.11.12.04.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 04:05:29 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 02/15] dt-bindings: mmc: tegra: Convert to json-schema
Date:   Fri, 12 Nov 2021 13:05:05 +0100
Message-Id: <20211112120518.3679793-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211112120518.3679793-1-thierry.reding@gmail.com>
References: <20211112120518.3679793-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Convert the NVIDIA Tegra SDHCI bindings from the free-form text format
to json-schema.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v2:
- drop redundant $ref properties, add missing maxItems

 .../bindings/mmc/nvidia,tegra20-sdhci.txt     | 143 ---------
 .../bindings/mmc/nvidia,tegra20-sdhci.yaml    | 294 ++++++++++++++++++
 2 files changed, 294 insertions(+), 143 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mmc/nvidia,tegra20-sdhci.txt
 create mode 100644 Documentation/devicetree/bindings/mmc/nvidia,tegra20-sdhci.yaml

diff --git a/Documentation/devicetree/bindings/mmc/nvidia,tegra20-sdhci.txt b/Documentation/devicetree/bindings/mmc/nvidia,tegra20-sdhci.txt
deleted file mode 100644
index 96c0b1440c9c..000000000000
--- a/Documentation/devicetree/bindings/mmc/nvidia,tegra20-sdhci.txt
+++ /dev/null
@@ -1,143 +0,0 @@
-* NVIDIA Tegra Secure Digital Host Controller
-
-This controller on Tegra family SoCs provides an interface for MMC, SD,
-and SDIO types of memory cards.
-
-This file documents differences between the core properties described
-by mmc.txt and the properties used by the sdhci-tegra driver.
-
-Required properties:
-- compatible : should be one of:
-  - "nvidia,tegra20-sdhci": for Tegra20
-  - "nvidia,tegra30-sdhci": for Tegra30
-  - "nvidia,tegra114-sdhci": for Tegra114
-  - "nvidia,tegra124-sdhci": for Tegra124 and Tegra132
-  - "nvidia,tegra210-sdhci": for Tegra210
-  - "nvidia,tegra186-sdhci": for Tegra186
-  - "nvidia,tegra194-sdhci": for Tegra194
-- clocks: For Tegra210, Tegra186 and Tegra194 must contain two entries.
-	  One for the module clock and one for the timeout clock.
-	  For all other Tegra devices, must contain a single entry for
-	  the module clock. See ../clocks/clock-bindings.txt for details.
-- clock-names: For Tegra210, Tegra186 and Tegra194 must contain the
-	       strings 'sdhci' and 'tmclk' to represent the module and
-	       the timeout clocks, respectively.
-	       For all other Tegra devices must contain the string 'sdhci'
-	       to represent the module clock.
-- resets : Must contain an entry for each entry in reset-names.
-  See ../reset/reset.txt for details.
-- reset-names : Must include the following entries:
-  - sdhci
-
-Optional properties:
-- power-gpios : Specify GPIOs for power control
-
-Example:
-
-sdhci@c8000200 {
-	compatible = "nvidia,tegra20-sdhci";
-	reg = <0xc8000200 0x200>;
-	interrupts = <47>;
-	clocks = <&tegra_car 14>;
-	resets = <&tegra_car 14>;
-	reset-names = "sdhci";
-	cd-gpios = <&gpio 69 0>; /* gpio PI5 */
-	wp-gpios = <&gpio 57 0>; /* gpio PH1 */
-	power-gpios = <&gpio 155 0>; /* gpio PT3 */
-	bus-width = <8>;
-};
-
-Optional properties for Tegra210, Tegra186 and Tegra194:
-- pinctrl-names, pinctrl-0, pinctrl-1 : Specify pad voltage
-  configurations. Valid pinctrl-names are "sdmmc-3v3" and "sdmmc-1v8"
-  for controllers supporting multiple voltage levels. The order of names
-  should correspond to the pin configuration states in pinctrl-0 and
-  pinctrl-1.
-- pinctrl-names : "sdmmc-3v3-drv" and "sdmmc-1v8-drv" are applicable for
-  Tegra210 where pad config registers are in the pinmux register domain
-  for pull-up-strength and pull-down-strength values configuration when
-  using pads at 3V3 and 1V8 levels.
-- nvidia,only-1-8-v : The presence of this property indicates that the
-  controller operates at a 1.8 V fixed I/O voltage.
-- nvidia,pad-autocal-pull-up-offset-3v3,
-  nvidia,pad-autocal-pull-down-offset-3v3 : Specify drive strength
-  calibration offsets for 3.3 V signaling modes.
-- nvidia,pad-autocal-pull-up-offset-1v8,
-  nvidia,pad-autocal-pull-down-offset-1v8 : Specify drive strength
-  calibration offsets for 1.8 V signaling modes.
-- nvidia,pad-autocal-pull-up-offset-3v3-timeout,
-  nvidia,pad-autocal-pull-down-offset-3v3-timeout : Specify drive
-  strength used as a fallback in case the automatic calibration times
-  out on a 3.3 V signaling mode.
-- nvidia,pad-autocal-pull-up-offset-1v8-timeout,
-  nvidia,pad-autocal-pull-down-offset-1v8-timeout : Specify drive
-  strength used as a fallback in case the automatic calibration times
-  out on a 1.8 V signaling mode.
-- nvidia,pad-autocal-pull-up-offset-sdr104,
-  nvidia,pad-autocal-pull-down-offset-sdr104 : Specify drive strength
-  calibration offsets for SDR104 mode.
-- nvidia,pad-autocal-pull-up-offset-hs400,
-  nvidia,pad-autocal-pull-down-offset-hs400 : Specify drive strength
-  calibration offsets for HS400 mode.
-- nvidia,default-tap : Specify the default inbound sampling clock
-  trimmer value for non-tunable modes.
-- nvidia,default-trim : Specify the default outbound clock trimmer
-  value.
-- nvidia,dqs-trim : Specify DQS trim value for HS400 timing
-
-  Notes on the pad calibration pull up and pulldown offset values:
-    - The property values are drive codes which are programmed into the
-      PD_OFFSET and PU_OFFSET sections of the
-      SDHCI_TEGRA_AUTO_CAL_CONFIG register.
-    - A higher value corresponds to higher drive strength. Please refer
-      to the reference manual of the SoC for correct values.
-    - The SDR104 and HS400 timing specific values are used in
-      corresponding modes if specified.
-
-  Notes on tap and trim values:
-    - The values are used for compensating trace length differences
-      by adjusting the sampling point.
-    - The values are programmed to the Vendor Clock Control Register.
-      Please refer to the reference manual of the SoC for correct
-      values.
-    - The DQS trim values are only used on controllers which support
-      HS400 timing. Only SDMMC4 on Tegra210 and Tegra 186 supports
-      HS400.
-
-Example:
-sdhci@700b0000 {
-	compatible = "nvidia,tegra124-sdhci";
-	reg = <0x0 0x700b0000 0x0 0x200>;
-	interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
-	clocks = <&tegra_car TEGRA210_CLK_SDMMC1>;
-	clock-names = "sdhci";
-	resets = <&tegra_car 14>;
-	reset-names = "sdhci";
-	pinctrl-names = "sdmmc-3v3", "sdmmc-1v8";
-	pinctrl-0 = <&sdmmc1_3v3>;
-	pinctrl-1 = <&sdmmc1_1v8>;
-	nvidia,pad-autocal-pull-up-offset-3v3 = <0x00>;
-	nvidia,pad-autocal-pull-down-offset-3v3 = <0x7d>;
-	nvidia,pad-autocal-pull-up-offset-1v8 = <0x7b>;
-	nvidia,pad-autocal-pull-down-offset-1v8 = <0x7b>;
-	status = "disabled";
-};
-
-sdhci@700b0000 {
-	compatible = "nvidia,tegra210-sdhci";
-	reg = <0x0 0x700b0000 0x0 0x200>;
-	interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
-	clocks = <&tegra_car TEGRA210_CLK_SDMMC1>,
-		 <&tegra_car TEGRA210_CLK_SDMMC_LEGACY>;
-	clock-names = "sdhci", "tmclk";
-	resets = <&tegra_car 14>;
-	reset-names = "sdhci";
-	pinctrl-names = "sdmmc-3v3", "sdmmc-1v8";
-	pinctrl-0 = <&sdmmc1_3v3>;
-	pinctrl-1 = <&sdmmc1_1v8>;
-	nvidia,pad-autocal-pull-up-offset-3v3 = <0x00>;
-	nvidia,pad-autocal-pull-down-offset-3v3 = <0x7d>;
-	nvidia,pad-autocal-pull-up-offset-1v8 = <0x7b>;
-	nvidia,pad-autocal-pull-down-offset-1v8 = <0x7b>;
-	status = "disabled";
-};
diff --git a/Documentation/devicetree/bindings/mmc/nvidia,tegra20-sdhci.yaml b/Documentation/devicetree/bindings/mmc/nvidia,tegra20-sdhci.yaml
new file mode 100644
index 000000000000..1c3b9bbea6b4
--- /dev/null
+++ b/Documentation/devicetree/bindings/mmc/nvidia,tegra20-sdhci.yaml
@@ -0,0 +1,294 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mmc/nvidia,tegra20-sdhci.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra Secure Digital Host Controller
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+description: |
+  This controller on Tegra family SoCs provides an interface for MMC, SD, and
+  SDIO types of memory cards.
+
+  This file documents differences between the core properties described by
+  mmc-controller.yaml and the properties for the Tegra SDHCI controller.
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - nvidia,tegra20-sdhci
+          - nvidia,tegra30-sdhci
+          - nvidia,tegra114-sdhci
+          - nvidia,tegra124-sdhci
+          - nvidia,tegra210-sdhci
+          - nvidia,tegra186-sdhci
+          - nvidia,tegra194-sdhci
+
+      - items:
+          - const: nvidia,tegra132-sdhci
+          - const: nvidia,tegra124-sdhci
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  assigned-clocks: true
+  assigned-clock-parents: true
+  assigned-clock-rates: true
+
+  clocks:
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    minItems: 1
+    maxItems: 2
+
+  resets:
+    items:
+      - description: module reset
+
+  reset-names:
+    items:
+      - const: sdhci
+
+  power-gpios:
+    description: specify GPIOs for power control
+    maxItems: 1
+
+  iommus:
+    maxItems: 1
+
+  nvidia,default-tap:
+    description: Specify the default inbound sampling clock trimmer value for
+      non-tunable modes.
+
+      The values are used for compensating trace length differences by
+      adjusting the sampling point. The values are programmed to the Vendor
+      Clock Control Register. Please refer to the reference manual of the SoC
+      for correct values.
+
+      The DQS trim values are only used on controllers which support HS400
+      timing. Only SDMMC4 on Tegra210 and Tegra186 supports HS400.
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+
+  nvidia,default-trim:
+    description: Specify the default outbound clock trimmer value.
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+
+  nvidia,dqs-trim:
+    description: Specify DQS trim value for HS400 timing.
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+
+  nvidia,pad-autocal-pull-down-offset-1v8:
+    description: Specify drive strength calibration offsets for 1.8 V
+      signaling modes.
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+
+  nvidia,pad-autocal-pull-down-offset-1v8-timeout:
+    description: Specify drive strength used as a fallback in case the
+      automatic calibration times out on a 1.8 V signaling mode.
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+
+  nvidia,pad-autocal-pull-down-offset-3v3:
+    description: Specify drive strength calibration offsets for 3.3 V
+      signaling modes.
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+
+  nvidia,pad-autocal-pull-down-offset-3v3-timeout:
+    description: Specify drive strength used as a fallback in case the
+      automatic calibration times out on a 3.3 V signaling mode.
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+
+  nvidia,pad-autocal-pull-down-offset-sdr104:
+    description: Specify drive strength calibration offsets for SDR104 mode.
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+
+  nvidia,pad-autocal-pull-down-offset-hs400:
+    description: Specify drive strength calibration offsets for HS400 mode.
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+
+  nvidia,pad-autocal-pull-up-offset-1v8:
+    description: Specify drive strength calibration offsets for 1.8 V
+      signaling modes.
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+
+  nvidia,pad-autocal-pull-up-offset-1v8-timeout:
+    description: Specify drive strength used as a fallback in case the
+      automatic calibration times out on a 1.8 V signaling mode.
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+
+  nvidia,pad-autocal-pull-up-offset-3v3:
+    description: Specify drive strength calibration offsets for 3.3 V
+      signaling modes.
+
+      The property values are drive codes which are programmed into the
+      PD_OFFSET and PU_OFFSET sections of the SDHCI_TEGRA_AUTO_CAL_CONFIG
+      register. A higher value corresponds to higher drive strength. Please
+      refer to the reference manual of the SoC for correct values. The SDR104
+      and HS400 timing specific values are used in corresponding modes if
+      specified.
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+
+  nvidia,pad-autocal-pull-up-offset-3v3-timeout:
+    description: Specify drive strength used as a fallback in case the
+      automatic calibration times out on a 3.3 V signaling mode.
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+
+  nvidia,pad-autocal-pull-up-offset-sdr104:
+    description: Specify drive strength calibration offsets for SDR104 mode.
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+
+  nvidia,pad-autocal-pull-up-offset-hs400:
+    description: Specify drive strength calibration offsets for HS400 mode.
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+
+  nvidia,only-1-8v:
+    description: The presence of this property indicates that the controller
+      operates at a 1.8 V fixed I/O voltage.
+    $ref: "/schemas/types.yaml#/definitions/flag"
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - resets
+  - reset-names
+
+allOf:
+  - $ref: "mmc-controller.yaml"
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra20-sdhci
+              - nvidia,tegra30-sdhci
+              - nvidia,tegra114-sdhci
+              - nvidia,tegra124-sdhci
+        clocks:
+          items:
+            - description: module clock
+          minItems: 1
+          maxItems: 1
+    else:
+      properties:
+        clocks:
+          items:
+            - description: module clock
+            - description: timeout clock
+          minItems: 2
+          maxItems: 2
+        clock-names:
+          items:
+            - const: sdhci
+            - const: tmclk
+          minItems: 2
+          maxItems: 2
+      required:
+        - clock-names
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: nvidia,tegra210-sdhci
+    then:
+      properties:
+        pinctrl-names:
+          oneOf:
+            - items:
+                - const: sdmmc-3v3
+                  description: pad configuration for 3.3 V
+                - const: sdmmc-1v8
+                  description: pad configuration for 1.8 V
+                - const: sdmmc-3v3-drv
+                  description: pull-up/down configuration for 3.3 V
+                - const: sdmmc-1v8-drv
+                  description: pull-up/down configuration for 1.8 V
+            - items:
+                - const: sdmmc-3v3-drv
+                  description: pull-up/down configuration for 3.3 V
+                - const: sdmmc-1v8-drv
+                  description: pull-up/down configuration for 1.8 V
+            - items:
+                - const: sdmmc-1v8-drv
+                  description: pull-up/down configuration for 1.8 V
+      required:
+        - clock-names
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra186-sdhci
+              - nvidia,tegra194-sdhci
+    then:
+      properties:
+        pinctrl-names:
+          items:
+            - const: sdmmc-3v3
+              description: pad configuration for 3.3 V
+            - const: sdmmc-1v8
+              description: pad configuration for 1.8 V
+      required:
+        - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    mmc@c8000200 {
+        compatible = "nvidia,tegra20-sdhci";
+        reg = <0xc8000200 0x200>;
+        interrupts = <47>;
+        clocks = <&tegra_car 14>;
+        resets = <&tegra_car 14>;
+        reset-names = "sdhci";
+        cd-gpios = <&gpio 69 0>; /* gpio PI5 */
+        wp-gpios = <&gpio 57 0>; /* gpio PH1 */
+        power-gpios = <&gpio 155 0>; /* gpio PT3 */
+        bus-width = <8>;
+    };
+
+  - |
+    #include <dt-bindings/clock/tegra210-car.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    mmc@700b0000 {
+        compatible = "nvidia,tegra210-sdhci";
+        reg = <0x700b0000 0x200>;
+        interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&tegra_car TEGRA210_CLK_SDMMC1>,
+                 <&tegra_car TEGRA210_CLK_SDMMC_LEGACY>;
+        clock-names = "sdhci", "tmclk";
+        resets = <&tegra_car 14>;
+        reset-names = "sdhci";
+        pinctrl-names = "sdmmc-3v3", "sdmmc-1v8",
+                        "sdmmc-3v3-drv", "sdmmc-1v8-drv";
+        pinctrl-0 = <&sdmmc1_3v3>;
+        pinctrl-1 = <&sdmmc1_1v8>;
+        pinctrl-2 = <&sdmmc1_3v3_drv>;
+        pinctrl-3 = <&sdmmc1_1v8_drv>;
+        nvidia,pad-autocal-pull-up-offset-3v3 = <0x00>;
+        nvidia,pad-autocal-pull-down-offset-3v3 = <0x7d>;
+        nvidia,pad-autocal-pull-up-offset-1v8 = <0x7b>;
+        nvidia,pad-autocal-pull-down-offset-1v8 = <0x7b>;
+        nvidia,default-tap = <0x2>;
+        nvidia,default-trim = <0x4>;
+        assigned-clocks = <&tegra_car TEGRA210_CLK_SDMMC4>,
+                          <&tegra_car TEGRA210_CLK_PLL_C4_OUT0>,
+                          <&tegra_car TEGRA210_CLK_PLL_C4>;
+        assigned-clock-parents = <&tegra_car TEGRA210_CLK_PLL_C4_OUT0>;
+        assigned-clock-rates = <200000000>, <1000000000>, <1000000000>;
+    };
-- 
2.33.1


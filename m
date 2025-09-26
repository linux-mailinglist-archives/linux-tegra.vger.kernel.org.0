Return-Path: <linux-tegra+bounces-9510-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C5141BA2C61
	for <lists+linux-tegra@lfdr.de>; Fri, 26 Sep 2025 09:30:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 477EC7AE2FE
	for <lists+linux-tegra@lfdr.de>; Fri, 26 Sep 2025 07:28:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA6252877FC;
	Fri, 26 Sep 2025 07:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YLnFdgv1"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B652C21D3CA
	for <linux-tegra@vger.kernel.org>; Fri, 26 Sep 2025 07:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758871777; cv=none; b=YbHt2W/fUtnGC/i2QKQfU9/hRacNfigGgQyVx150EKHaylHQZSgrhKmtUot4FEilP3bSamuUWbZKLv9PLYDv6DOr8wv0wOCdOKQaaCOCNLGByNKrd2fv+M81gXBw+q1/5wppZsrlT2l5J37nYyduLDhyw82zh6b7Ob7BisINJ5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758871777; c=relaxed/simple;
	bh=udswmcl5tlKT1ybUPose2ujT6Z4s19wfZrYcC3enGCQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N8D5RgKJjfrQPFI9VMJWQNdW6gFhpjWaR/Iap3UNITa79DxWsFdIDj+f/bVA9cK4TTdaD9nPal4xHu7vLUSE/Zc5UD7Llvtjr4xT8eunYohfc0IsRt7xYSL2t1iZ4P9kekmBwtqxqO74yc63Zpi2OQ165TQTNf86iSCyU/CgrEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YLnFdgv1; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b523fb676efso1869011a12.3
        for <linux-tegra@vger.kernel.org>; Fri, 26 Sep 2025 00:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758871773; x=1759476573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+S1tVnrjQGjvmHN7WXvEJERIL5lhCFGmJh47sxwHJ0I=;
        b=YLnFdgv1UmzQj6k+3kpvhxldT6bhgzh9WLdXiokJZ7A4+9kjJCTQ+raZjqrxPB9v8m
         UEkkYzMphB/zcESP0MU8KEtFcDQKZv3I60RCNd3S6NVsjQo5feQOxrBQ1sGhcaeN5r2d
         eWFpBEhvLyskzMASgmHxGlnCM8Sj3N5c4LM5iSp+4SVciPqLDShIJBv42iPw6iKE+Iik
         /TqdaNhx/OdxhOBMM9cbrTMSlkPoVtf8RlqO1l8OUqTYIm141O685xVzs92ICiVWGdtG
         HGR8RiaBIfWBaXLfOI6KUJLMo3Z053Zgxzh6N9xHAzOguiSmok0pOOyEqhxNWFrpd0nr
         lhWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758871773; x=1759476573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+S1tVnrjQGjvmHN7WXvEJERIL5lhCFGmJh47sxwHJ0I=;
        b=vH0n6hz+7QXehAW9YHKZlcWhA8NlxQeo6NnqtKQjrY2jfPlefoPNnSkAf87fPf68ni
         D70+qoKsYozQOH5bpkSMdI8M3IH+mrG1EimpUq7j2wOnqlPH44Af1IzZ6iW68UO/pd/5
         6k5ooFiVN5DdJHBuo8AzywkeDb7P/6kLfUwPdnOBNBnxkGLBmMZXPkTywg/nTeKOeeY+
         oLXirQG6zGbuc+/PbDs0IMkcmElyPTgE/OM9vuq0LrXYqADDMSukr91HxTxMv4y9HP8B
         QF4HD6aA7hO7/SVNEbjetcoSj+AuJx1NAR4pxHYECrpraf3Umz3m1qyCoeRes1zmMv1/
         hThw==
X-Forwarded-Encrypted: i=1; AJvYcCWGjqQ/2HxXDOHgd26WU4aUyQj5LzYGH9MoVdjXqld4X0ByQPOTHN6yTyfxeN+WEHLQ5/a712WXEZ8Jmg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNOV20flgT6NuDICPIhkSAsghp2ZuPX41mOwa8RsELBl4UlaDf
	LMpdsXq52vPRZa7tC2OFbDr6GtBafSbgtNf4W2GWSQfJViz/LWe4dmjh
X-Gm-Gg: ASbGncsyq97aWWbG1kpMzf5pyrMa8VzzXfpwjdACihoJ/LC87fM4Q/DybciOt6NOhm0
	eTCUYmx+7057/inCqTy+lesS3A9WOaZqyzxXqIOyXEuKHi9yOfkPSfjZdYtKNicDq61gtAnF33e
	HsmBNkhK0AfbZ+jylQuuZunl7MPv8iZxMp3Oqb9iDKv2Db5OAS0S7jm5HBXst00Zg4XwDiT8HnA
	m+aBYiYcF8sWiQhAUC3MSzSMlAIOqB1Yac0+Sqpg1CXqWFPTvHqmGnsGCEu/p6MM/DXIpy3Sbty
	p6s/EleFJ0FS8S3M5EPBJfvpQAGr7eqFBJbn6IsApjQWiqLt7Kt1MQG+4vSSqtMg7nBoed5pWgW
	J1DlklgRroDi/KBlQ8fpD
X-Google-Smtp-Source: AGHT+IGu/jDdtSj6fFMEUX10+8iX50MrPHapa+8VHpOuCF6oqB1rgKRawXp7Iwp3A+hC4t/Sm5YxCA==
X-Received: by 2002:a17:902:e810:b0:251:2d4d:bdfa with SMTP id d9443c01a7336-27ed49d0d66mr90985625ad.20.1758871772689;
        Fri, 26 Sep 2025 00:29:32 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.216])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed69a98b9sm44083065ad.111.2025.09.26.00.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 00:29:31 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-pci@vger.kernel.org (open list:PCI NATIVE HOST BRIDGE AND ENDPOINT DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v1 1/5] dt-bindings: PCI: Convert the existing nvidia,tegra-pcie.txt bindings documentation into a YAML schema
Date: Fri, 26 Sep 2025 12:57:42 +0530
Message-ID: <20250926072905.126737-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250926072905.126737-1-linux.amoon@gmail.com>
References: <20250926072905.126737-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the legacy text-based binding documentation for
nvidia,tegra-pcie into a nvidia,tegra-pcie.yaml YAML schema, following
the Devicetree Schema format. This improves validation coverage and enables
dtbs_check compliance for Tegra PCIe nodes.

Cc: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v1: new patch in this series.
---
 .../bindings/pci/nvidia,tegra-pcie.yaml       | 651 +++++++++++++++++
 .../bindings/pci/nvidia,tegra20-pcie.txt      | 670 ------------------
 2 files changed, 651 insertions(+), 670 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/nvidia,tegra-pcie.yaml
 delete mode 100644 Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt

diff --git a/Documentation/devicetree/bindings/pci/nvidia,tegra-pcie.yaml b/Documentation/devicetree/bindings/pci/nvidia,tegra-pcie.yaml
new file mode 100644
index 000000000000..dd8cba125b53
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/nvidia,tegra-pcie.yaml
@@ -0,0 +1,651 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra PCIe Controller
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+description: |
+  PCIe controller found on NVIDIA Tegra SoCs including Tegra20, Tegra30,
+  Tegra124, Tegra210, and Tegra186. Supports multiple root ports and
+  platform-specific clock, reset, and power supply configurations.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - nvidia,tegra20-pcie
+              - nvidia,tegra30-pcie
+              - nvidia,tegra124-pcie
+              - nvidia,tegra210-pcie
+              - nvidia,tegra186-pcie
+
+  reg:
+    items:
+      - description: PADS registers
+      - description: AFI registers
+      - description: Configuration space region
+
+  reg-names:
+    items:
+      - const: pads
+      - const: afi
+      - const: cs
+
+  device_type:
+    const: pci
+
+  interrupts:
+    items:
+      - description: Controller interrupt
+      - description: MSI interrupt
+
+  interrupt-names:
+    items:
+      - const: intr
+      - const: msi
+
+  clocks:
+    oneOf:
+      - items:
+          - description: PCIe clock
+          - description: AFI clock
+          - description: PLL_E clock
+      - items:
+          - description: PCIe clock
+          - description: AFI clock
+          - description: PLL_E clock
+          - description: CML clock
+
+  clock-names:
+    oneOf:
+      - items:
+          - const: pex
+          - const: afi
+          - const: pll_e
+      - items:
+          - const: pex
+          - const: afi
+          - const: pll_e
+          - const: cml
+
+  resets:
+    items:
+      - description: PCIe reset
+      - description: AFI reset
+      - description: PCIe X reset
+
+  reset-names:
+    items:
+      - const: pex
+      - const: afi
+      - const: pcie_x
+
+  power-domains:
+    maxItems: 1
+    description: |
+      A phandle to the node that controls power to the respective PCIe
+      controller and a specifier name for the PCIe controller.
+
+  interconnects:
+    minItems: 1
+    maxItems: 2
+
+  interconnect-names:
+    minItems: 1
+    maxItems: 2
+    description:
+      Should include name of the interconnect path for each interconnect
+      entry. Consult TRM documentation for information about available
+      memory clients, see DMA CONTROLLER and MEMORY WRITE sections.
+
+  pinctrl-names:
+    items:
+      - const: default
+      - const: idle
+
+  pinctrl-0:
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+  pinctrl-1:
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+  nvidia,num-lanes:
+    description: Number of PCIe lanes used
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+allOf:
+  - $ref: /schemas/pci/pci-host-bridge.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra20-pcie
+              - nvidia,tegra186-pcie
+    then:
+      properties:
+        clocks:
+          minItems: 3
+          maxItems: 3
+        clock-names:
+          items:
+            - const: pex
+            - const: afi
+            - const: pll_e
+        resets:
+          minItems: 3
+          maxItems: 3
+        reset-names:
+          items:
+            - const: pex
+            - const: afi
+            - const: pcie_x
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra30-pcie
+              - nvidia,tegra124-pcie
+              - nvidia,tegra210-pcie
+    then:
+      properties:
+        clocks:
+          minItems: 4
+          maxItems: 4
+        clock-names:
+          items:
+            - const: pex
+            - const: afi
+            - const: pll_e
+            - const: cml
+        resets:
+          minItems: 3
+          maxItems: 3
+        reset-names:
+          items:
+            - const: pex
+            - const: afi
+            - const: pcie_x
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra20-pcie
+              - nvidia,tegra30-pcie
+              - nvidia,tegra186-pcie
+    then:
+      required:
+        - power-domains
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra186-pcie
+    then:
+      required:
+        - interconnects
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra210-pcie
+    then:
+      required:
+        - pinctrl-names
+        - pinctrl-0
+        - pinctrl-1
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - interrupts
+  - interrupt-map
+  - interrupt-map-mask
+  - ranges
+  - bus-range
+  - device_type
+  - interconnects
+  - pinctrl-names
+  - nvidia,num-lanes
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    bus {
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        pcie@80003000 {
+            compatible = "nvidia,tegra20-pcie";
+            device_type = "pci";
+            reg = <0x80003000 0x00000800>,
+                  <0x80003800 0x00000200>,
+                  <0x90000000 0x10000000>;
+            reg-names = "pads", "afi", "cs";
+            interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "intr", "msi";
+            interrupt-parent = <&intc>;
+
+            #interrupt-cells = <1>;
+            interrupt-map-mask = <0 0 0 0>;
+            interrupt-map = <0 0 0 0 &intc GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
+
+            bus-range = <0x00 0xff>;
+            #address-cells = <3>;
+            #size-cells = <2>;
+
+            ranges = <0x02000000 0 0x80000000 0x80000000 0 0x00001000>,
+                     <0x02000000 0 0x80001000 0x80001000 0 0x00001000>,
+                     <0x01000000 0 0          0x82000000 0 0x00010000>,
+                     <0x02000000 0 0xa0000000 0xa0000000 0 0x08000000>,
+                     <0x42000000 0 0xa8000000 0xa8000000 0 0x18000000>;
+
+            clocks = <&tegra_car 70>,
+                     <&tegra_car 72>,
+                     <&tegra_car 118>;
+            clock-names = "pex", "afi", "pll_e";
+            resets = <&tegra_car 70>,
+                     <&tegra_car 72>,
+                     <&tegra_car 74>;
+            reset-names = "pex", "afi", "pcie_x";
+            power-domains = <&pd_core>;
+            operating-points-v2 = <&pcie_dvfs_opp_table>;
+
+            status = "disabled";
+
+            pci@1,0 {
+                device_type = "pci";
+                assigned-addresses = <0x82000800 0 0x80000000 0 0x1000>;
+                reg = <0x000800 0 0 0 0>;
+                bus-range = <0x00 0xff>;
+                status = "disabled";
+
+                #address-cells = <3>;
+                #size-cells = <2>;
+                ranges;
+
+                nvidia,num-lanes = <2>;
+            };
+
+            pci@2,0 {
+                device_type = "pci";
+                assigned-addresses = <0x82001000 0 0x80001000 0 0x1000>;
+                reg = <0x001000 0 0 0 0>;
+                bus-range = <0x00 0xff>;
+                status = "disabled";
+
+                #address-cells = <3>;
+                #size-cells = <2>;
+                ranges;
+
+                nvidia,num-lanes = <2>;
+            };
+        };
+    };
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    bus {
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        pcie@3000 {
+            compatible = "nvidia,tegra30-pcie";
+            device_type = "pci";
+            reg = <0x00003000 0x00000800>,
+                  <0x00003800 0x00000200>,
+                  <0x10000000 0x10000000>;
+            reg-names = "pads", "afi", "cs";
+            interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "intr", "msi";
+            interrupt-parent = <&intc>;
+
+            #interrupt-cells = <1>;
+            interrupt-map-mask = <0 0 0 0>;
+            interrupt-map = <0 0 0 0 &intc GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
+
+            bus-range = <0x00 0xff>;
+            #address-cells = <3>;
+            #size-cells = <2>;
+
+            ranges = <0x02000000 0 0x00000000 0x00000000 0 0x00001000>,
+                     <0x02000000 0 0x00001000 0x00001000 0 0x00001000>,
+                     <0x02000000 0 0x00004000 0x00004000 0 0x00001000>,
+                     <0x01000000 0 0          0x02000000 0 0x00010000>,
+                     <0x02000000 0 0x20000000 0x20000000 0 0x08000000>,
+                     <0x42000000 0 0x28000000 0x28000000 0 0x18000000>;
+
+            clocks = <&tegra_car 70>,
+                     <&tegra_car 72>,
+                     <&tegra_car 193>,
+                     <&tegra_car 215>;
+            clock-names = "pex", "afi", "pll_e", "cml";
+            resets = <&tegra_car 70>,
+                     <&tegra_car 72>,
+                     <&tegra_car 74>;
+            reset-names = "pex", "afi", "pcie_x";
+            power-domains = <&pd_core>;
+            operating-points-v2 = <&pcie_dvfs_opp_table>;
+            status = "disabled";
+
+            pci@1,0 {
+                device_type = "pci";
+                assigned-addresses = <0x82000800 0 0x00000000 0 0x1000>;
+                reg = <0x000800 0 0 0 0>;
+                bus-range = <0x00 0xff>;
+                status = "disabled";
+
+                #address-cells = <3>;
+                #size-cells = <2>;
+                ranges;
+
+                nvidia,num-lanes = <2>;
+            };
+
+            pci@2,0 {
+                device_type = "pci";
+                assigned-addresses = <0x82001000 0 0x00001000 0 0x1000>;
+                reg = <0x001000 0 0 0 0>;
+                bus-range = <0x00 0xff>;
+                status = "disabled";
+
+                #address-cells = <3>;
+                #size-cells = <2>;
+                ranges;
+
+                nvidia,num-lanes = <2>;
+            };
+
+            pci@3,0 {
+                device_type = "pci";
+                assigned-addresses = <0x82001800 0 0x00004000 0 0x1000>;
+                reg = <0x001800 0 0 0 0>;
+                bus-range = <0x00 0xff>;
+                status = "disabled";
+
+                #address-cells = <3>;
+                #size-cells = <2>;
+                ranges;
+
+                nvidia,num-lanes = <2>;
+            };
+        };
+    };
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    bus {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        pcie@1003000 {
+            compatible = "nvidia,tegra124-pcie";
+            device_type = "pci";
+            reg = <0x0 0x01003000 0x0 0x00000800>,
+                  <0x0 0x01003800 0x0 0x00000800>,
+                  <0x0 0x02000000 0x0 0x10000000>;
+            reg-names = "pads", "afi", "cs";
+            interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "intr", "msi";
+            interrupt-parent = <&gic>;
+
+            #interrupt-cells = <1>;
+            interrupt-map-mask = <0 0 0 0>;
+            interrupt-map = <0 0 0 0 &gic GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
+
+            bus-range = <0x00 0xff>;
+            #address-cells = <3>;
+            #size-cells = <2>;
+
+            ranges = <0x02000000 0 0x01000000 0x0 0x01000000 0 0x00001000>,
+                     <0x02000000 0 0x01001000 0x0 0x01001000 0 0x00001000>,
+                     <0x01000000 0 0x0        0x0 0x12000000 0 0x00010000>,
+                     <0x02000000 0 0x13000000 0x0 0x13000000 0 0x0d000000>,
+                     <0x42000000 0 0x20000000 0x0 0x20000000 0 0x20000000>;
+
+            clocks = <&tegra_car 70>,
+                     <&tegra_car 72>,
+                     <&tegra_car 231>,
+                     <&tegra_car 268>;
+            clock-names = "pex", "afi", "pll_e", "cml";
+            resets = <&tegra_car 70>,
+                     <&tegra_car 72>,
+                     <&tegra_car 74>;
+            reset-names = "pex", "afi", "pcie_x";
+            status = "disabled";
+
+            pci@1,0 {
+                device_type = "pci";
+                assigned-addresses = <0x82000800 0 0x01000000 0 0x1000>;
+                reg = <0x000800 0 0 0 0>;
+                bus-range = <0x00 0xff>;
+                status = "disabled";
+
+                #address-cells = <3>;
+                #size-cells = <2>;
+                ranges;
+
+                nvidia,num-lanes = <2>;
+            };
+
+            pci@2,0 {
+                device_type = "pci";
+                assigned-addresses = <0x82001000 0 0x01001000 0 0x1000>;
+                reg = <0x001000 0 0 0 0>;
+                bus-range = <0x00 0xff>;
+                status = "disabled";
+
+                #address-cells = <3>;
+                #size-cells = <2>;
+                ranges;
+
+                nvidia,num-lanes = <1>;
+            };
+        };
+    };
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    bus {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        pcie@1003000 {
+            compatible = "nvidia,tegra210-pcie";
+            device_type = "pci";
+            reg = <0x0 0x01003000 0x0 0x00000800>,
+                  <0x0 0x01003800 0x0 0x00000800>,
+                  <0x0 0x02000000 0x0 0x10000000>;
+            reg-names = "pads", "afi", "cs";
+            interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "intr", "msi";
+            interrupt-parent = <&gic>;
+
+            #interrupt-cells = <1>;
+            interrupt-map-mask = <0 0 0 0>;
+            interrupt-map = <0 0 0 0 &gic GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
+
+
+            bus-range = <0x00 0xff>;
+            #address-cells = <3>;
+            #size-cells = <2>;
+
+            ranges = <0x02000000 0 0x01000000 0x0 0x01000000 0 0x00001000>,
+                     <0x02000000 0 0x01001000 0x0 0x01001000 0 0x00001000>,
+                     <0x01000000 0 0x0        0x0 0x12000000 0 0x00010000>,
+                     <0x02000000 0 0x13000000 0x0 0x13000000 0 0x0d000000>,
+                     <0x42000000 0 0x20000000 0x0 0x20000000 0 0x20000000>;
+
+            clocks = <&tegra_car 70>,
+                     <&tegra_car 72>,
+                     <&tegra_car 263>,
+                     <&tegra_car 300>;
+            clock-names = "pex", "afi", "pll_e", "cml";
+            resets = <&tegra_car 70>,
+                     <&tegra_car 72>,
+                     <&tegra_car 74>;
+            reset-names = "pex", "afi", "pcie_x";
+
+            pinctrl-names = "default", "idle";
+            pinctrl-0 = <&pex_dpd_disable>;
+            pinctrl-1 = <&pex_dpd_enable>;
+
+            status = "disabled";
+
+            pci@1,0 {
+                device_type = "pci";
+                assigned-addresses = <0x82000800 0 0x01000000 0 0x1000>;
+                reg = <0x000800 0 0 0 0>;
+                bus-range = <0x00 0xff>;
+                status = "disabled";
+
+                #address-cells = <3>;
+                #size-cells = <2>;
+                ranges;
+
+                nvidia,num-lanes = <4>;
+            };
+
+            pci@2,0 {
+                device_type = "pci";
+                assigned-addresses = <0x82001000 0 0x01001000 0 0x1000>;
+                reg = <0x001000 0 0 0 0>;
+                bus-range = <0x00 0xff>;
+                status = "disabled";
+
+                #address-cells = <3>;
+                #size-cells = <2>;
+                ranges;
+
+                nvidia,num-lanes = <1>;
+            };
+        };
+    };
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/power/tegra186-powergate.h>
+    #include <dt-bindings/memory/tegra186-mc.h>
+
+    bus {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        pcie@10003000 {
+            compatible = "nvidia,tegra186-pcie";
+            power-domains = <&bpmp TEGRA186_POWER_DOMAIN_PCX>;
+            device_type = "pci";
+            reg = <0x0 0x10003000 0x0 0x00000800>,
+                  <0x0 0x10003800 0x0 0x00000800>,
+                  <0x0 0x40000000 0x0 0x10000000>;
+            reg-names = "pads", "afi", "cs";
+
+            interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "intr", "msi";
+            interrupt-parent = <&gic>;
+
+            #interrupt-cells = <1>;
+            interrupt-map-mask = <0 0 0 0>;
+            interrupt-map = <0 0 0 0 &gic GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
+
+            bus-range = <0x00 0xff>;
+            #address-cells = <3>;
+            #size-cells = <2>;
+
+            ranges = <0x02000000 0 0x10000000 0x0 0x10000000 0 0x00001000>,
+                     <0x02000000 0 0x10001000 0x0 0x10001000 0 0x00001000>,
+                     <0x02000000 0 0x10004000 0x0 0x10004000 0 0x00001000>,
+                     <0x01000000 0 0x0        0x0 0x50000000 0 0x00010000>,
+                     <0x02000000 0 0x50100000 0x0 0x50100000 0 0x07f00000>,
+                     <0x42000000 0 0x58000000 0x0 0x58000000 0 0x28000000>;
+
+            clocks = <&bpmp 3>,
+                     <&bpmp 4>,
+                     <&bpmp 512>;
+            clock-names = "pex", "afi", "pll_e";
+
+            resets = <&bpmp 29>,
+                     <&bpmp 1>,
+                     <&bpmp 30>;
+            reset-names = "pex", "afi", "pcie_x";
+
+            interconnects = <&mc TEGRA186_MEMORY_CLIENT_AFIR &emc>,
+                            <&mc TEGRA186_MEMORY_CLIENT_AFIW &emc>;
+            interconnect-names = "dma-mem", "write";
+
+            iommus = <&smmu TEGRA186_SID_AFI>;
+            iommu-map = <0x0 &smmu TEGRA186_SID_AFI 0x1000>;
+            iommu-map-mask = <0x0>;
+
+            status = "disabled";
+
+            pci@1,0 {
+                device_type = "pci";
+                assigned-addresses = <0x82000800 0 0x10000000 0 0x1000>;
+                reg = <0x000800 0 0 0 0>;
+                status = "disabled";
+
+                #address-cells = <3>;
+                #size-cells = <2>;
+                ranges;
+
+                nvidia,num-lanes = <2>;
+            };
+
+            pci@2,0 {
+                device_type = "pci";
+                assigned-addresses = <0x82001000 0 0x10001000 0 0x1000>;
+                reg = <0x001000 0 0 0 0>;
+                status = "disabled";
+
+                #address-cells = <3>;
+                #size-cells = <2>;
+                ranges;
+
+                nvidia,num-lanes = <1>;
+            };
+
+            pci@3,0 {
+                device_type = "pci";
+                assigned-addresses = <0x82001800 0 0x10004000 0 0x1000>;
+                reg = <0x001800 0 0 0 0>;
+                status = "disabled";
+
+                #address-cells = <3>;
+                #size-cells = <2>;
+                ranges;
+
+                nvidia,num-lanes = <1>;
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt b/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
deleted file mode 100644
index d099f3476ccc..000000000000
--- a/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
+++ /dev/null
@@ -1,670 +0,0 @@
-NVIDIA Tegra PCIe controller
-
-Required properties:
-- compatible: Must be:
-  - "nvidia,tegra20-pcie": for Tegra20
-  - "nvidia,tegra30-pcie": for Tegra30
-  - "nvidia,tegra124-pcie": for Tegra124 and Tegra132
-  - "nvidia,tegra210-pcie": for Tegra210
-  - "nvidia,tegra186-pcie": for Tegra186
-- power-domains: To ungate power partition by BPMP powergate driver. Must
-  contain BPMP phandle and PCIe power partition ID. This is required only
-  for Tegra186.
-- device_type: Must be "pci"
-- reg: A list of physical base address and length for each set of controller
-  registers. Must contain an entry for each entry in the reg-names property.
-- reg-names: Must include the following entries:
-  "pads": PADS registers
-  "afi": AFI registers
-  "cs": configuration space region
-- interrupts: A list of interrupt outputs of the controller. Must contain an
-  entry for each entry in the interrupt-names property.
-- interrupt-names: Must include the following entries:
-  "intr": The Tegra interrupt that is asserted for controller interrupts
-  "msi": The Tegra interrupt that is asserted when an MSI is received
-- bus-range: Range of bus numbers associated with this controller
-- #address-cells: Address representation for root ports (must be 3)
-  - cell 0 specifies the bus and device numbers of the root port:
-    [23:16]: bus number
-    [15:11]: device number
-  - cell 1 denotes the upper 32 address bits and should be 0
-  - cell 2 contains the lower 32 address bits and is used to translate to the
-    CPU address space
-- #size-cells: Size representation for root ports (must be 2)
-- ranges: Describes the translation of addresses for root ports and standard
-  PCI regions. The entries must be 6 cells each, where the first three cells
-  correspond to the address as described for the #address-cells property
-  above, the fourth cell is the physical CPU address to translate to and the
-  fifth and six cells are as described for the #size-cells property above.
-  - The first two entries are expected to translate the addresses for the root
-    port registers, which are referenced by the assigned-addresses property of
-    the root port nodes (see below).
-  - The remaining entries setup the mapping for the standard I/O, memory and
-    prefetchable PCI regions. The first cell determines the type of region
-    that is setup:
-    - 0x81000000: I/O memory region
-    - 0x82000000: non-prefetchable memory region
-    - 0xc2000000: prefetchable memory region
-  Please refer to the standard PCI bus binding document for a more detailed
-  explanation.
-- #interrupt-cells: Size representation for interrupts (must be 1)
-- interrupt-map-mask and interrupt-map: Standard PCI IRQ mapping properties
-  Please refer to the standard PCI bus binding document for a more detailed
-  explanation.
-- clocks: Must contain an entry for each entry in clock-names.
-  See ../clocks/clock-bindings.txt for details.
-- clock-names: Must include the following entries:
-  - pex
-  - afi
-  - pll_e
-  - cml (not required for Tegra20)
-- resets: Must contain an entry for each entry in reset-names.
-  See ../reset/reset.txt for details.
-- reset-names: Must include the following entries:
-  - pex
-  - afi
-  - pcie_x
-
-Optional properties:
-- pinctrl-names: A list of pinctrl state names. Must contain the following
-  entries:
-  - "default": active state, puts PCIe I/O out of deep power down state
-  - "idle": puts PCIe I/O into deep power down state
-- pinctrl-0: phandle for the default/active state of pin configurations.
-- pinctrl-1: phandle for the idle state of pin configurations.
-
-Required properties on Tegra124 and later (deprecated):
-- phys: Must contain an entry for each entry in phy-names.
-- phy-names: Must include the following entries:
-  - pcie
-
-These properties are deprecated in favour of per-lane PHYs define in each of
-the root ports (see below).
-
-Power supplies for Tegra20:
-- avdd-pex-supply: Power supply for analog PCIe logic. Must supply 1.05 V.
-- vdd-pex-supply: Power supply for digital PCIe I/O. Must supply 1.05 V.
-- avdd-pex-pll-supply: Power supply for dedicated (internal) PCIe PLL. Must
-  supply 1.05 V.
-- avdd-plle-supply: Power supply for PLLE, which is shared with SATA. Must
-  supply 1.05 V.
-- vddio-pex-clk-supply: Power supply for PCIe clock. Must supply 3.3 V.
-
-Power supplies for Tegra30:
-- Required:
-  - avdd-pex-pll-supply: Power supply for dedicated (internal) PCIe PLL. Must
-    supply 1.05 V.
-  - avdd-plle-supply: Power supply for PLLE, which is shared with SATA. Must
-    supply 1.05 V.
-  - vddio-pex-ctl-supply: Power supply for PCIe control I/O partition. Must
-    supply 1.8 V.
-  - hvdd-pex-supply: High-voltage supply for PCIe I/O and PCIe output clocks.
-    Must supply 3.3 V.
-- Optional:
-  - If lanes 0 to 3 are used:
-    - avdd-pexa-supply: Power supply for analog PCIe logic. Must supply 1.05 V.
-    - vdd-pexa-supply: Power supply for digital PCIe I/O. Must supply 1.05 V.
-  - If lanes 4 or 5 are used:
-    - avdd-pexb-supply: Power supply for analog PCIe logic. Must supply 1.05 V.
-    - vdd-pexb-supply: Power supply for digital PCIe I/O. Must supply 1.05 V.
-
-Power supplies for Tegra124:
-- Required:
-  - avddio-pex-supply: Power supply for analog PCIe logic. Must supply 1.05 V.
-  - dvddio-pex-supply: Power supply for digital PCIe I/O. Must supply 1.05 V.
-  - hvdd-pex-supply: High-voltage supply for PCIe I/O and PCIe output clocks.
-    Must supply 3.3 V.
-  - vddio-pex-ctl-supply: Power supply for PCIe control I/O partition. Must
-    supply 2.8-3.3 V.
-
-Power supplies for Tegra210:
-- Required:
-  - hvddio-pex-supply: High-voltage supply for PCIe I/O and PCIe output
-    clocks. Must supply 1.8 V.
-  - dvddio-pex-supply: Power supply for digital PCIe I/O. Must supply 1.05 V.
-  - vddio-pex-ctl-supply: Power supply for PCIe control I/O partition. Must
-    supply 1.8 V.
-
-Power supplies for Tegra186:
-- Required:
-  - dvdd-pex-supply: Power supply for digital PCIe I/O. Must supply 1.05 V.
-  - hvdd-pex-pll-supply: High-voltage supply for PLLE (shared with USB3). Must
-    supply 1.8 V.
-  - hvdd-pex-supply: High-voltage supply for PCIe I/O and PCIe output clocks.
-    Must supply 1.8 V.
-  - vddio-pexctl-aud-supply: Power supply for PCIe side band signals. Must
-    supply 1.8 V.
-
-Root ports are defined as subnodes of the PCIe controller node.
-
-Required properties:
-- device_type: Must be "pci"
-- assigned-addresses: Address and size of the port configuration registers
-- reg: PCI bus address of the root port
-- #address-cells: Must be 3
-- #size-cells: Must be 2
-- ranges: Sub-ranges distributed from the PCIe controller node. An empty
-  property is sufficient.
-- nvidia,num-lanes: Number of lanes to use for this port. Valid combinations
-  are:
-  - Root port 0 uses 4 lanes, root port 1 is unused.
-  - Both root ports use 2 lanes.
-
-Required properties for Tegra124 and later:
-- phys: Must contain an phandle to a PHY for each entry in phy-names.
-- phy-names: Must include an entry for each active lane. Note that the number
-  of entries does not have to (though usually will) be equal to the specified
-  number of lanes in the nvidia,num-lanes property. Entries are of the form
-  "pcie-N": where N ranges from 0 to the value specified in nvidia,num-lanes.
-
-Examples:
-=========
-
-Tegra20:
---------
-
-SoC DTSI:
-
-	pcie-controller@80003000 {
-		compatible = "nvidia,tegra20-pcie";
-		device_type = "pci";
-		reg = <0x80003000 0x00000800   /* PADS registers */
-		       0x80003800 0x00000200   /* AFI registers */
-		       0x90000000 0x10000000>; /* configuration space */
-		reg-names = "pads", "afi", "cs";
-		interrupts = <0 98 0x04   /* controller interrupt */
-		              0 99 0x04>; /* MSI interrupt */
-		interrupt-names = "intr", "msi";
-
-		#interrupt-cells = <1>;
-		interrupt-map-mask = <0 0 0 0>;
-		interrupt-map = <0 0 0 0 &intc GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
-
-		bus-range = <0x00 0xff>;
-		#address-cells = <3>;
-		#size-cells = <2>;
-
-		ranges = <0x82000000 0 0x80000000 0x80000000 0 0x00001000   /* port 0 registers */
-			  0x82000000 0 0x80001000 0x80001000 0 0x00001000   /* port 1 registers */
-			  0x81000000 0 0          0x82000000 0 0x00010000   /* downstream I/O */
-			  0x82000000 0 0xa0000000 0xa0000000 0 0x10000000   /* non-prefetchable memory */
-			  0xc2000000 0 0xb0000000 0xb0000000 0 0x10000000>; /* prefetchable memory */
-
-		clocks = <&tegra_car 70>, <&tegra_car 72>, <&tegra_car 118>;
-		clock-names = "pex", "afi", "pll_e";
-		resets = <&tegra_car 70>, <&tegra_car 72>, <&tegra_car 74>;
-		reset-names = "pex", "afi", "pcie_x";
-		status = "disabled";
-
-		pci@1,0 {
-			device_type = "pci";
-			assigned-addresses = <0x82000800 0 0x80000000 0 0x1000>;
-			reg = <0x000800 0 0 0 0>;
-			status = "disabled";
-
-			#address-cells = <3>;
-			#size-cells = <2>;
-
-			ranges;
-
-			nvidia,num-lanes = <2>;
-		};
-
-		pci@2,0 {
-			device_type = "pci";
-			assigned-addresses = <0x82001000 0 0x80001000 0 0x1000>;
-			reg = <0x001000 0 0 0 0>;
-			status = "disabled";
-
-			#address-cells = <3>;
-			#size-cells = <2>;
-
-			ranges;
-
-			nvidia,num-lanes = <2>;
-		};
-	};
-
-Board DTS:
-
-	pcie-controller@80003000 {
-		status = "okay";
-
-		vdd-supply = <&pci_vdd_reg>;
-		pex-clk-supply = <&pci_clk_reg>;
-
-		/* root port 00:01.0 */
-		pci@1,0 {
-			status = "okay";
-
-			/* bridge 01:00.0 (optional) */
-			pci@0,0 {
-				reg = <0x010000 0 0 0 0>;
-
-				#address-cells = <3>;
-				#size-cells = <2>;
-
-				device_type = "pci";
-
-				/* endpoint 02:00.0 */
-				pci@0,0 {
-					reg = <0x020000 0 0 0 0>;
-				};
-			};
-		};
-	};
-
-Note that devices on the PCI bus are dynamically discovered using PCI's bus
-enumeration and therefore don't need corresponding device nodes in DT. However
-if a device on the PCI bus provides a non-probeable bus such as I2C or SPI,
-device nodes need to be added in order to allow the bus' children to be
-instantiated at the proper location in the operating system's device tree (as
-illustrated by the optional nodes in the example above).
-
-Tegra30:
---------
-
-SoC DTSI:
-
-	pcie-controller@3000 {
-		compatible = "nvidia,tegra30-pcie";
-		device_type = "pci";
-		reg = <0x00003000 0x00000800   /* PADS registers */
-		       0x00003800 0x00000200   /* AFI registers */
-		       0x10000000 0x10000000>; /* configuration space */
-		reg-names = "pads", "afi", "cs";
-		interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH   /* controller interrupt */
-			      GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>; /* MSI interrupt */
-		interrupt-names = "intr", "msi";
-
-		#interrupt-cells = <1>;
-		interrupt-map-mask = <0 0 0 0>;
-		interrupt-map = <0 0 0 0 &intc GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
-
-		bus-range = <0x00 0xff>;
-		#address-cells = <3>;
-		#size-cells = <2>;
-
-		ranges = <0x82000000 0 0x00000000 0x00000000 0 0x00001000   /* port 0 configuration space */
-			  0x82000000 0 0x00001000 0x00001000 0 0x00001000   /* port 1 configuration space */
-			  0x82000000 0 0x00004000 0x00004000 0 0x00001000   /* port 2 configuration space */
-			  0x81000000 0 0          0x02000000 0 0x00010000   /* downstream I/O */
-			  0x82000000 0 0x20000000 0x20000000 0 0x08000000   /* non-prefetchable memory */
-			  0xc2000000 0 0x28000000 0x28000000 0 0x18000000>; /* prefetchable memory */
-
-		clocks = <&tegra_car TEGRA30_CLK_PCIE>,
-			 <&tegra_car TEGRA30_CLK_AFI>,
-			 <&tegra_car TEGRA30_CLK_PLL_E>,
-			 <&tegra_car TEGRA30_CLK_CML0>;
-		clock-names = "pex", "afi", "pll_e", "cml";
-		resets = <&tegra_car 70>,
-			 <&tegra_car 72>,
-			 <&tegra_car 74>;
-		reset-names = "pex", "afi", "pcie_x";
-		status = "disabled";
-
-		pci@1,0 {
-			device_type = "pci";
-			assigned-addresses = <0x82000800 0 0x00000000 0 0x1000>;
-			reg = <0x000800 0 0 0 0>;
-			status = "disabled";
-
-			#address-cells = <3>;
-			#size-cells = <2>;
-			ranges;
-
-			nvidia,num-lanes = <2>;
-		};
-
-		pci@2,0 {
-			device_type = "pci";
-			assigned-addresses = <0x82001000 0 0x00001000 0 0x1000>;
-			reg = <0x001000 0 0 0 0>;
-			status = "disabled";
-
-			#address-cells = <3>;
-			#size-cells = <2>;
-			ranges;
-
-			nvidia,num-lanes = <2>;
-		};
-
-		pci@3,0 {
-			device_type = "pci";
-			assigned-addresses = <0x82001800 0 0x00004000 0 0x1000>;
-			reg = <0x001800 0 0 0 0>;
-			status = "disabled";
-
-			#address-cells = <3>;
-			#size-cells = <2>;
-			ranges;
-
-			nvidia,num-lanes = <2>;
-		};
-	};
-
-Board DTS:
-
-	pcie-controller@3000 {
-		status = "okay";
-
-		avdd-pexa-supply = <&ldo1_reg>;
-		vdd-pexa-supply = <&ldo1_reg>;
-		avdd-pexb-supply = <&ldo1_reg>;
-		vdd-pexb-supply = <&ldo1_reg>;
-		avdd-pex-pll-supply = <&ldo1_reg>;
-		avdd-plle-supply = <&ldo1_reg>;
-		vddio-pex-ctl-supply = <&sys_3v3_reg>;
-		hvdd-pex-supply = <&sys_3v3_pexs_reg>;
-
-		pci@1,0 {
-			status = "okay";
-		};
-
-		pci@3,0 {
-			status = "okay";
-		};
-	};
-
-Tegra124:
----------
-
-SoC DTSI:
-
-	pcie-controller@1003000 {
-		compatible = "nvidia,tegra124-pcie";
-		device_type = "pci";
-		reg = <0x0 0x01003000 0x0 0x00000800   /* PADS registers */
-		       0x0 0x01003800 0x0 0x00000800   /* AFI registers */
-		       0x0 0x02000000 0x0 0x10000000>; /* configuration space */
-		reg-names = "pads", "afi", "cs";
-		interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>, /* controller interrupt */
-			     <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>; /* MSI interrupt */
-		interrupt-names = "intr", "msi";
-
-		#interrupt-cells = <1>;
-		interrupt-map-mask = <0 0 0 0>;
-		interrupt-map = <0 0 0 0 &gic GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
-
-		bus-range = <0x00 0xff>;
-		#address-cells = <3>;
-		#size-cells = <2>;
-
-		ranges = <0x82000000 0 0x01000000 0x0 0x01000000 0 0x00001000   /* port 0 configuration space */
-			  0x82000000 0 0x01001000 0x0 0x01001000 0 0x00001000   /* port 1 configuration space */
-			  0x81000000 0 0x0        0x0 0x12000000 0 0x00010000   /* downstream I/O (64 KiB) */
-			  0x82000000 0 0x13000000 0x0 0x13000000 0 0x0d000000   /* non-prefetchable memory (208 MiB) */
-			  0xc2000000 0 0x20000000 0x0 0x20000000 0 0x20000000>; /* prefetchable memory (512 MiB) */
-
-		clocks = <&tegra_car TEGRA124_CLK_PCIE>,
-			 <&tegra_car TEGRA124_CLK_AFI>,
-			 <&tegra_car TEGRA124_CLK_PLL_E>,
-			 <&tegra_car TEGRA124_CLK_CML0>;
-		clock-names = "pex", "afi", "pll_e", "cml";
-		resets = <&tegra_car 70>,
-			 <&tegra_car 72>,
-			 <&tegra_car 74>;
-		reset-names = "pex", "afi", "pcie_x";
-		status = "disabled";
-
-		pci@1,0 {
-			device_type = "pci";
-			assigned-addresses = <0x82000800 0 0x01000000 0 0x1000>;
-			reg = <0x000800 0 0 0 0>;
-			status = "disabled";
-
-			#address-cells = <3>;
-			#size-cells = <2>;
-			ranges;
-
-			nvidia,num-lanes = <2>;
-		};
-
-		pci@2,0 {
-			device_type = "pci";
-			assigned-addresses = <0x82001000 0 0x01001000 0 0x1000>;
-			reg = <0x001000 0 0 0 0>;
-			status = "disabled";
-
-			#address-cells = <3>;
-			#size-cells = <2>;
-			ranges;
-
-			nvidia,num-lanes = <1>;
-		};
-	};
-
-Board DTS:
-
-	pcie-controller@1003000 {
-		status = "okay";
-
-		avddio-pex-supply = <&vdd_1v05_run>;
-		dvddio-pex-supply = <&vdd_1v05_run>;
-		avdd-pex-pll-supply = <&vdd_1v05_run>;
-		hvdd-pex-supply = <&vdd_3v3_lp0>;
-		hvdd-pex-pll-e-supply = <&vdd_3v3_lp0>;
-		vddio-pex-ctl-supply = <&vdd_3v3_lp0>;
-		avdd-pll-erefe-supply = <&avdd_1v05_run>;
-
-		/* Mini PCIe */
-		pci@1,0 {
-			phys = <&{/padctl@7009f000/pads/pcie/lanes/pcie-4}>;
-			phy-names = "pcie-0";
-			status = "okay";
-		};
-
-		/* Gigabit Ethernet */
-		pci@2,0 {
-			phys = <&{/padctl@7009f000/pads/pcie/lanes/pcie-2}>;
-			phy-names = "pcie-0";
-			status = "okay";
-		};
-	};
-
-Tegra210:
----------
-
-SoC DTSI:
-
-	pcie-controller@1003000 {
-		compatible = "nvidia,tegra210-pcie";
-		device_type = "pci";
-		reg = <0x0 0x01003000 0x0 0x00000800   /* PADS registers */
-		       0x0 0x01003800 0x0 0x00000800   /* AFI registers */
-		       0x0 0x02000000 0x0 0x10000000>; /* configuration space */
-		reg-names = "pads", "afi", "cs";
-		interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>, /* controller interrupt */
-			     <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>; /* MSI interrupt */
-		interrupt-names = "intr", "msi";
-
-		#interrupt-cells = <1>;
-		interrupt-map-mask = <0 0 0 0>;
-		interrupt-map = <0 0 0 0 &gic GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
-
-		bus-range = <0x00 0xff>;
-		#address-cells = <3>;
-		#size-cells = <2>;
-
-		ranges = <0x82000000 0 0x01000000 0x0 0x01000000 0 0x00001000   /* port 0 configuration space */
-			  0x82000000 0 0x01001000 0x0 0x01001000 0 0x00001000   /* port 1 configuration space */
-			  0x81000000 0 0x0        0x0 0x12000000 0 0x00010000   /* downstream I/O (64 KiB) */
-			  0x82000000 0 0x13000000 0x0 0x13000000 0 0x0d000000   /* non-prefetchable memory (208 MiB) */
-			  0xc2000000 0 0x20000000 0x0 0x20000000 0 0x20000000>; /* prefetchable memory (512 MiB) */
-
-		clocks = <&tegra_car TEGRA210_CLK_PCIE>,
-			 <&tegra_car TEGRA210_CLK_AFI>,
-			 <&tegra_car TEGRA210_CLK_PLL_E>,
-			 <&tegra_car TEGRA210_CLK_CML0>;
-		clock-names = "pex", "afi", "pll_e", "cml";
-		resets = <&tegra_car 70>,
-			 <&tegra_car 72>,
-			 <&tegra_car 74>;
-		reset-names = "pex", "afi", "pcie_x";
-		status = "disabled";
-
-		pci@1,0 {
-			device_type = "pci";
-			assigned-addresses = <0x82000800 0 0x01000000 0 0x1000>;
-			reg = <0x000800 0 0 0 0>;
-			status = "disabled";
-
-			#address-cells = <3>;
-			#size-cells = <2>;
-			ranges;
-
-			nvidia,num-lanes = <4>;
-		};
-
-		pci@2,0 {
-			device_type = "pci";
-			assigned-addresses = <0x82001000 0 0x01001000 0 0x1000>;
-			reg = <0x001000 0 0 0 0>;
-			status = "disabled";
-
-			#address-cells = <3>;
-			#size-cells = <2>;
-			ranges;
-
-			nvidia,num-lanes = <1>;
-		};
-	};
-
-Board DTS:
-
-	pcie-controller@1003000 {
-		status = "okay";
-
-		avdd-pll-uerefe-supply = <&avdd_1v05_pll>;
-		hvddio-pex-supply = <&vdd_1v8>;
-		dvddio-pex-supply = <&vdd_pex_1v05>;
-		dvdd-pex-pll-supply = <&vdd_pex_1v05>;
-		hvdd-pex-pll-e-supply = <&vdd_1v8>;
-		vddio-pex-ctl-supply = <&vdd_1v8>;
-
-		pci@1,0 {
-			phys = <&{/padctl@7009f000/pads/pcie/lanes/pcie-0}>,
-			       <&{/padctl@7009f000/pads/pcie/lanes/pcie-1}>,
-			       <&{/padctl@7009f000/pads/pcie/lanes/pcie-2}>,
-			       <&{/padctl@7009f000/pads/pcie/lanes/pcie-3}>;
-			phy-names = "pcie-0", "pcie-1", "pcie-2", "pcie-3";
-			status = "okay";
-		};
-
-		pci@2,0 {
-			phys = <&{/padctl@7009f000/pads/pcie/lanes/pcie-4}>;
-			phy-names = "pcie-0";
-			status = "okay";
-		};
-	};
-
-Tegra186:
----------
-
-SoC DTSI:
-
-	pcie@10003000 {
-		compatible = "nvidia,tegra186-pcie";
-		power-domains = <&bpmp TEGRA186_POWER_DOMAIN_PCX>;
-		device_type = "pci";
-		reg = <0x0 0x10003000 0x0 0x00000800   /* PADS registers */
-		       0x0 0x10003800 0x0 0x00000800   /* AFI registers */
-		       0x0 0x40000000 0x0 0x10000000>; /* configuration space */
-		reg-names = "pads", "afi", "cs";
-
-		interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>, /* controller interrupt */
-			     <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>; /* MSI interrupt */
-		interrupt-names = "intr", "msi";
-
-		#interrupt-cells = <1>;
-		interrupt-map-mask = <0 0 0 0>;
-		interrupt-map = <0 0 0 0 &gic GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
-
-		bus-range = <0x00 0xff>;
-		#address-cells = <3>;
-		#size-cells = <2>;
-
-		ranges = <0x82000000 0 0x10000000 0x0 0x10000000 0 0x00001000   /* port 0 configuration space */
-			  0x82000000 0 0x10001000 0x0 0x10001000 0 0x00001000   /* port 1 configuration space */
-			  0x82000000 0 0x10004000 0x0 0x10004000 0 0x00001000   /* port 2 configuration space */
-			  0x81000000 0 0x0        0x0 0x50000000 0 0x00010000   /* downstream I/O (64 KiB) */
-			  0x82000000 0 0x50100000 0x0 0x50100000 0 0x07F00000   /* non-prefetchable memory (127 MiB) */
-			  0xc2000000 0 0x58000000 0x0 0x58000000 0 0x28000000>; /* prefetchable memory (640 MiB) */
-
-		clocks = <&bpmp TEGRA186_CLK_AFI>,
-			 <&bpmp TEGRA186_CLK_PCIE>,
-			 <&bpmp TEGRA186_CLK_PLLE>;
-		clock-names = "afi", "pex", "pll_e";
-
-		resets = <&bpmp TEGRA186_RESET_AFI>,
-			 <&bpmp TEGRA186_RESET_PCIE>,
-			 <&bpmp TEGRA186_RESET_PCIEXCLK>;
-		reset-names = "afi", "pex", "pcie_x";
-
-		status = "disabled";
-
-		pci@1,0 {
-			device_type = "pci";
-			assigned-addresses = <0x82000800 0 0x10000000 0 0x1000>;
-			reg = <0x000800 0 0 0 0>;
-			status = "disabled";
-
-			#address-cells = <3>;
-			#size-cells = <2>;
-			ranges;
-
-			nvidia,num-lanes = <2>;
-		};
-
-		pci@2,0 {
-			device_type = "pci";
-			assigned-addresses = <0x82001000 0 0x10001000 0 0x1000>;
-			reg = <0x001000 0 0 0 0>;
-			status = "disabled";
-
-			#address-cells = <3>;
-			#size-cells = <2>;
-			ranges;
-
-			nvidia,num-lanes = <1>;
-		};
-
-		pci@3,0 {
-			device_type = "pci";
-			assigned-addresses = <0x82001800 0 0x10004000 0 0x1000>;
-			reg = <0x001800 0 0 0 0>;
-			status = "disabled";
-
-			#address-cells = <3>;
-			#size-cells = <2>;
-			ranges;
-
-			nvidia,num-lanes = <1>;
-		};
-	};
-
-Board DTS:
-
-	pcie@10003000 {
-		status = "okay";
-
-		dvdd-pex-supply = <&vdd_pex>;
-		hvdd-pex-pll-supply = <&vdd_1v8>;
-		hvdd-pex-supply = <&vdd_1v8>;
-		vddio-pexctl-aud-supply = <&vdd_1v8>;
-
-		pci@1,0 {
-			nvidia,num-lanes = <4>;
-			status = "okay";
-		};
-
-		pci@2,0 {
-			nvidia,num-lanes = <0>;
-			status = "disabled";
-		};
-
-		pci@3,0 {
-			nvidia,num-lanes = <1>;
-			status = "disabled";
-		};
-	};
-- 
2.50.1



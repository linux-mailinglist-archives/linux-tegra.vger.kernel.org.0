Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABBEE2C5B72
	for <lists+linux-tegra@lfdr.de>; Thu, 26 Nov 2020 19:06:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404691AbgKZSD6 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 26 Nov 2020 13:03:58 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:6246 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404611AbgKZSD5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 26 Nov 2020 13:03:57 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fbfee100000>; Thu, 26 Nov 2020 10:04:00 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 26 Nov
 2020 18:03:57 +0000
Received: from audio.nvidia.com (172.20.13.39) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Thu, 26 Nov 2020 18:03:53 +0000
From:   Sameer Pujar <spujar@nvidia.com>
To:     <broonie@kernel.org>, <robh+dt@kernel.org>,
        <thierry.reding@gmail.com>
CC:     <jonathanh@nvidia.com>, <kuninori.morimoto.gx@renesas.com>,
        <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sharadg@nvidia.com>, Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH v6 2/6] ASoC: dt-bindings: tegra: Add json-schema for Tegra audio graph card
Date:   Thu, 26 Nov 2020 23:33:39 +0530
Message-ID: <1606413823-19885-3-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606413823-19885-1-git-send-email-spujar@nvidia.com>
References: <1606413823-19885-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1606413840; bh=yj6PiAVqxhNZ/wClBAXh8IgIUW3+3I9GHb8QAg2m2BM=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Type;
        b=ImuczdrRwUhLuEeXe9GPg81w8LmzMlCJQymUevy6IqB2XBGhRI9IjbE4qZowjgMoP
         m5N3wEUmUBsYnQ5rO4A8q70DWREPNnoCdQXpmWBZECeaCbgq12uSM1s9Ifx+hkx1hk
         jQ9u+TcOnIELlKddI7oy0eb4C+k86ec6zVR3Q+pim2l00VdLk77YfKGeiyAg7uaT/P
         2RfNonTmlbbJTC2jgamZGWyXXpNsl/xJi5A9Q5r7ZTWDjdg66HDugUUH2bDTvfJ8Up
         /Tp64njBh/aAwG0UjtnUwzS0TNfO0av3wmfNTJPvFlQQ8RP+89pRV9aGXnFlxZ8+d1
         tM0q0SNcrEZJQ==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add YAML schema for Tegra audio graph sound card DT bindings. It uses the
same DT bindings provided by generic audio graph driver. Along with this
few standard clock DT bindings are added which are specifically required
for Tegra audio.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
---
 .../sound/nvidia,tegra-audio-graph-card.yaml       | 187 +++++++++++++++++++++
 1 file changed, 187 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-graph-card.yaml

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-graph-card.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-graph-card.yaml
new file mode 100644
index 0000000..fc271f6
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-graph-card.yaml
@@ -0,0 +1,187 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/nvidia,tegra-audio-graph-card.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Audio Graph based Tegra sound card driver
+
+description: |
+  This is based on generic audio graph card driver along with additional
+  customizations for Tegra platforms. It uses the same bindings with
+  additional standard clock DT bindings required for Tegra.
+
+maintainers:
+  - Jon Hunter <jonathanh@nvidia.com>
+  - Sameer Pujar <spujar@nvidia.com>
+
+allOf:
+  - $ref: audio-graph.yaml#
+
+properties:
+  compatible:
+    enum:
+      - nvidia,tegra210-audio-graph-card
+      - nvidia,tegra186-audio-graph-card
+
+  clocks:
+    minItems: 2
+
+  clock-names:
+    minItems: 2
+    items:
+      - const: pll_a
+      - const: plla_out0
+
+  assigned-clocks:
+    minItems: 1
+    maxItems: 3
+
+  assigned-clock-parents:
+    minItems: 1
+    maxItems: 3
+
+  assigned-clock-rates:
+    minItems: 1
+    maxItems: 3
+
+required:
+  - clocks
+  - clock-names
+  - assigned-clocks
+  - assigned-clock-parents
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include<dt-bindings/clock/tegra210-car.h>
+
+    tegra_sound {
+        compatible = "nvidia,tegra210-audio-graph-card";
+
+        clocks = <&tegra_car TEGRA210_CLK_PLL_A>,
+                 <&tegra_car TEGRA210_CLK_PLL_A_OUT0>;
+        clock-names = "pll_a", "plla_out0";
+
+        assigned-clocks = <&tegra_car TEGRA210_CLK_PLL_A>,
+                          <&tegra_car TEGRA210_CLK_PLL_A_OUT0>,
+                          <&tegra_car TEGRA210_CLK_EXTERN1>;
+        assigned-clock-parents = <0>, <0>, <&tegra_car TEGRA210_CLK_PLL_A_OUT0>;
+        assigned-clock-rates = <368640000>, <49152000>, <12288000>;
+
+        dais = /* FE */
+               <&admaif1_port>,
+               /* Router */
+               <&xbar_i2s1_port>,
+               /* I/O DAP Ports */
+               <&i2s1_port>;
+
+        label = "jetson-tx1-ape";
+    };
+
+    // The ports are defined for AHUB and its child devices.
+    ahub@702d0800 {
+        compatible = "nvidia,tegra210-ahub";
+        reg = <0x702d0800 0x800>;
+        clocks = <&tegra_car TEGRA210_CLK_D_AUDIO>;
+        clock-names = "ahub";
+        assigned-clocks = <&tegra_car TEGRA210_CLK_D_AUDIO>;
+        assigned-clock-parents = <&tegra_car TEGRA210_CLK_PLL_A_OUT0>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges = <0x702d0000 0x702d0000 0x0000e400>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0x0>;
+                xbar_admaif1_ep: endpoint {
+                    remote-endpoint = <&admaif1_ep>;
+                };
+            };
+
+            // ...
+
+            xbar_i2s1_port: port@a {
+                reg = <0xa>;
+                xbar_i2s1_ep: endpoint {
+                    remote-endpoint = <&i2s1_cif_ep>;
+                };
+            };
+        };
+
+        admaif@702d0000 {
+            compatible = "nvidia,tegra210-admaif";
+            reg = <0x702d0000 0x800>;
+            dmas = <&adma 1>,  <&adma 1>,
+                   <&adma 2>,  <&adma 2>,
+                   <&adma 3>,  <&adma 3>,
+                   <&adma 4>,  <&adma 4>,
+                   <&adma 5>,  <&adma 5>,
+                   <&adma 6>,  <&adma 6>,
+                   <&adma 7>,  <&adma 7>,
+                   <&adma 8>,  <&adma 8>,
+                   <&adma 9>,  <&adma 9>,
+                   <&adma 10>, <&adma 10>;
+            dma-names = "rx1",  "tx1",
+                        "rx2",  "tx2",
+                        "rx3",  "tx3",
+                        "rx4",  "tx4",
+                        "rx5",  "tx5",
+                        "rx6",  "tx6",
+                        "rx7",  "tx7",
+                        "rx8",  "tx8",
+                        "rx9",  "tx9",
+                        "rx10", "tx10";
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                admaif1_port: port@0 {
+                    reg = <0x0>;
+                    admaif1_ep: endpoint {
+                        remote-endpoint = <&xbar_admaif1_ep>;
+                    };
+                };
+
+                // More ADMAIF ports to follow
+            };
+        };
+
+        i2s@702d1000 {
+            compatible = "nvidia,tegra210-i2s";
+            clocks = <&tegra_car TEGRA210_CLK_I2S0>;
+            clock-names = "i2s";
+            assigned-clocks = <&tegra_car TEGRA210_CLK_I2S0>;
+            assigned-clock-parents = <&tegra_car TEGRA210_CLK_PLL_A_OUT0>;
+            assigned-clock-rates = <1536000>;
+            reg = <0x702d1000 0x100>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0x0>;
+
+                    i2s1_cif_ep: endpoint {
+                        remote-endpoint = <&xbar_i2s1_ep>;
+                    };
+                };
+
+                i2s1_port: port@1 {
+                    reg = <0x1>;
+
+                    i2s1_dap: endpoint {
+                        dai-format = "i2s";
+                    };
+                };
+            };
+        };
+    };
+
+...
-- 
2.7.4


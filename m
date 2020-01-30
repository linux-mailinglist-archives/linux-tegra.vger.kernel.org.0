Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B9BD14D8FA
	for <lists+linux-tegra@lfdr.de>; Thu, 30 Jan 2020 11:34:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726893AbgA3KeN (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 30 Jan 2020 05:34:13 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:11446 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726885AbgA3KeM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 30 Jan 2020 05:34:12 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e32b10d0000>; Thu, 30 Jan 2020 02:33:49 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 30 Jan 2020 02:34:09 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 30 Jan 2020 02:34:09 -0800
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 30 Jan
 2020 10:34:09 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 30 Jan 2020 10:34:09 +0000
Received: from audio.nvidia.com (Not Verified[10.24.34.185]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5e32b11c0003>; Thu, 30 Jan 2020 02:34:09 -0800
From:   Sameer Pujar <spujar@nvidia.com>
To:     <perex@perex.cz>, <tiwai@suse.com>, <robh+dt@kernel.org>
CC:     <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <digetx@gmail.com>, <alsa-devel@alsa-project.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <sharadg@nvidia.com>,
        <mkumard@nvidia.com>, <viswanathl@nvidia.com>,
        <rlokhande@nvidia.com>, <dramesh@nvidia.com>,
        <atalambedu@nvidia.com>, Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH v2 1/9] dt-bindings: sound: tegra: add DT binding for AHUB
Date:   Thu, 30 Jan 2020 16:03:34 +0530
Message-ID: <1580380422-3431-2-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1580380422-3431-1-git-send-email-spujar@nvidia.com>
References: <1580380422-3431-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1580380429; bh=vl38yAqOtDagkElNkNFlWMvTXwXZs6XEe+VBVPR0Yl0=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:Content-Type;
        b=hsEnAq+wJhxXP7PGyJTjazxwqe57zcZBZV1BUQw6iJPzsBO184eCdyQiU4gmA+3Pi
         bwEuSv497Kz1gQrVO5hK/gDqNzpriOqtebVgRkflVcTJ3hnYeINxgc98mkwxgxZvjQ
         w9YEalcg21nwoCoFUVdYUJ2QfvRFRnkEcuUuqKkToA7C9neM7AegsriTs7aIZpPJ3J
         nQCNIUC6chCOQfa9vCqQFW86CC2iejew0Dqwz4r4vof9uvIOkvosKYKmi1qXcXKaw1
         seEsLX5R0Mmx7mTjiwK8sjvoq7tVwoG3oAV2FR+uFTaII4rQShK00IBitqCPoxYHGv
         Q08EoLTqBvmPg==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Audio Hub (AHUB) comprises a collection of hardware accelerators for audio
pre-processing and post-processing and a programmable full crossbar for
audio routing across these accelerators. This patch adds YAML schema for DT
binding of AHUB and few of its following components. These devices will be
registered as ASoC components.
 * ADMAIF
 * I2S
 * DMIC
 * DSPK

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 .../bindings/sound/nvidia,tegra186-dspk.yaml       | 105 +++++++++++++
 .../bindings/sound/nvidia,tegra210-admaif.yaml     | 165 +++++++++++++++++++++
 .../bindings/sound/nvidia,tegra210-ahub.yaml       | 130 ++++++++++++++++
 .../bindings/sound/nvidia,tegra210-dmic.yaml       | 105 +++++++++++++
 .../bindings/sound/nvidia,tegra210-i2s.yaml        | 112 ++++++++++++++
 5 files changed, 617 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
new file mode 100644
index 0000000..dc9fef3
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
@@ -0,0 +1,105 @@
+# SPDX-License-Identifier: (GPL-2.0)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/nvidia,tegra186-dspk.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Tegra186 DSPK Controller Device Tree Bindings
+
+description: |
+  The Digital Speaker Controller (DSPK) can be viewed as a Pulse
+  Density Modulation (PDM) transmitter that up-samples the input to
+  the desired sampling rate by interpolation and then converts the
+  over sampled Pulse Code Modulation (PCM) input to the desired 1-bit
+  output via Delta Sigma Modulation (DSM).
+
+maintainers:
+  - Jon Hunter <jonathanh@nvidia.com>
+  - Sameer Pujar <spujar@nvidia.com>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          const: nvidia,tegra186-dspk
+      - items:
+          - enum:
+              - nvidia,tegra194-dspk
+          - enum:
+              - nvidia,tegra186-dspk
+
+  reg:
+    description: offset and length of the register set for the device.
+    maxItems: 1
+
+  clocks:
+    description: must contain an entry for each entry in clock-names.
+      See ../clocks/clocks-bindings.txt for details.
+    minItems: 1
+    items:
+      - description: Module clock
+
+  clock-names:
+    description: must contain clock names for each corresponding entry in clocks.
+      See ../clocks/clocks-bindings.txt for details.
+    minItems: 1
+    items:
+      - const: dspk
+
+  assigned-clocks:
+    description: list of input clocks and dividers for the audio system.
+      See ../clocks/clock-bindings.txt for details.
+    minItems: 1
+    items:
+      - description: Module clock
+
+  assigned-clock-parents:
+    description: parent clock for each entry in assigned-clocks
+      See ../clocks/clock-bindings.txt for details.
+    minItems: 1
+    items:
+      - description: Parent for module clock
+
+  assigned-clock-rates:
+    description: clock rate for each entry in assigned-clocks
+      See ../clocks/clock-bindings.txt for details.
+    items:
+      - description: initial module clock rate
+
+  "#sound-dai-cells":
+    const: 1
+
+  sound-name-prefix:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      Used as prefix for sink/source names of the component. Must be a
+      unique string among multiple instances of the same component.
+      The name can be "DSPK1" or "DSPKx", where x depends on the maximum
+      available instances on a Tegra SoC.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - assigned-clocks
+  - assigned-clock-parents
+  - "#sound-dai-cells"
+
+examples:
+  - |
+    #include<dt-bindings/clock/tegra186-clock.h>
+
+    tegra_dspk1: dspk@2905000 {
+        compatible = "nvidia,tegra186-dspk";
+        reg = <0x2905000 0x100>;
+        clocks = <&bpmp TEGRA186_CLK_DSPK1>;
+        clock-names = "dspk";
+        assigned-clocks = <&bpmp TEGRA186_CLK_DSPK1>;
+        assigned-clock-parents = <&bpmp TEGRA186_CLK_PLL_A_OUT0>;
+        assigned-clock-rates = <12288000>;
+        #sound-dai-cells = <1>;
+        sound-name-prefix = "DSPK1";
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
new file mode 100644
index 0000000..a8a41ba
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
@@ -0,0 +1,165 @@
+# SPAT-License-Identifier: (GPL-2.0)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/nvidia,tegra210-admaif.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Tegra210 ADMAIF Device Tree Bindings
+
+description: |
+  ADMAIF is the interface between ADMA and AHUB. Each ADMA channel
+  that sends/receives data to/from AHUB must interface through an
+  ADMAIF channel. ADMA channel sending data to AHUB pairs with ADMAIF
+  Tx channel and ADMA channel receiving data from AHUB pairs with
+  ADMAIF Rx channel.
+
+maintainers:
+  - Jon Hunter <jonathanh@nvidia.com>
+  - Sameer Pujar <spujar@nvidia.com>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          const: nvidia,tegra210-admaif
+      - items:
+          const: nvidia,tegra186-admaif
+      - items:
+          - enum:
+             - nvidia,tegra194-admaif
+          - enum:
+             - nvidia,tegra186-admaif
+
+  reg:
+    maxItems: 1
+
+  dmas: true
+
+  dma-names: true
+
+  "#sound-dai-cells":
+    const: 1
+
+if:
+  properties:
+    compatible:
+      contains:
+        const: nvidia,tegra210-admaif
+
+then:
+  properties:
+    dmas:
+      $ref: /schemas/types.yaml#/definitions/phandle-array
+      description:
+        Two or more DMA channel specifiers, equally divided for Tx and Rx.
+      minItems: 2
+      maxItems: 20
+    dma-names:
+      $ref: /schemas/types.yaml#/definitions/string-array
+      description:
+        There must be at least one channel named "tx1" for transmit and "rx1"
+        for receive. If more channels need to be specified then "tx1",
+        "tx2" ... "tx10" can be used. Similarly for Rx channels as well.
+      minItems: 2
+      maxItems: 20
+
+else:
+  properties:
+    dmas:
+      $ref: /schemas/types.yaml#/definitions/phandle-array
+      description:
+        Two or more DMA channel specifiers, equally divided for Tx and Rx.
+      minItems: 2
+      maxItems: 40
+    dma-names:
+      $ref: /schemas/types.yaml#/definitions/string-array
+      description:
+        There must be at least one channel named "tx1" for transmit and "x1"
+        for receive. If more channels need to be specified then "tx1",
+        "tx2" ... "tx20" can be used. Similarly for Rx channels as well.
+      minItems: 2
+      maxItems: 40
+
+required:
+  - compatible
+  - reg
+  - dmas
+  - dma-names
+  - "#sound-dai-cells"
+
+examples:
+  - |
+    admaif@702d0000 {
+        compatible = "nvidia,tegra210-admaif";
+        reg = <0x702d0000 0x800>;
+        dmas = <&adma 1>,  <&adma 1>,
+               <&adma 2>,  <&adma 2>,
+               <&adma 3>,  <&adma 3>,
+               <&adma 4>,  <&adma 4>,
+               <&adma 5>,  <&adma 5>,
+               <&adma 6>,  <&adma 6>,
+               <&adma 7>,  <&adma 7>,
+               <&adma 8>,  <&adma 8>,
+               <&adma 9>,  <&adma 9>,
+               <&adma 10>, <&adma 10>;
+        dma-names = "rx1",  "tx1",
+                    "rx2",  "tx2",
+                    "rx3",  "tx3",
+                    "rx4",  "tx4",
+                    "rx5",  "tx5",
+                    "rx6",  "tx6",
+                    "rx7",  "tx7",
+                    "rx8",  "tx8",
+                    "rx9",  "tx9",
+                    "rx10", "tx10";
+        #sound-dai-cells = <1>;
+    };
+
+  - |
+    admaif@290f000 {
+        compatible = "nvidia,tegra186-admaif";
+        reg = <0x0290f000 0x1000>;
+        dmas = <&adma 1>, <&adma 1>,
+               <&adma 2>, <&adma 2>,
+               <&adma 3>, <&adma 3>,
+               <&adma 4>, <&adma 4>,
+               <&adma 5>, <&adma 5>,
+               <&adma 6>, <&adma 6>,
+               <&adma 7>, <&adma 7>,
+               <&adma 8>, <&adma 8>,
+               <&adma 9>, <&adma 9>,
+               <&adma 10>, <&adma 10>,
+               <&adma 11>, <&adma 11>,
+               <&adma 12>, <&adma 12>,
+               <&adma 13>, <&adma 13>,
+               <&adma 14>, <&adma 14>,
+               <&adma 15>, <&adma 15>,
+               <&adma 16>, <&adma 16>,
+               <&adma 17>, <&adma 17>,
+               <&adma 18>, <&adma 18>,
+               <&adma 19>, <&adma 19>,
+               <&adma 20>, <&adma 20>;
+        dma-names = "rx1", "tx1",
+                    "rx2", "tx2",
+                    "rx3", "tx3",
+                    "rx4", "tx4",
+                    "rx5", "tx5",
+                    "rx6", "tx6",
+                    "rx7", "tx7",
+                    "rx8", "tx8",
+                    "rx9", "tx9",
+                    "rx10", "tx10",
+                    "rx11", "tx11",
+                    "rx12", "tx12",
+                    "rx13", "tx13",
+                    "rx14", "tx14",
+                    "rx15", "tx15",
+                    "rx16", "tx16",
+                    "rx17", "tx17",
+                    "rx18", "tx18",
+                    "rx19", "tx19",
+                    "rx20", "tx20";
+        #sound-dai-cells = <1>;
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
new file mode 100644
index 0000000..5221d01
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
@@ -0,0 +1,130 @@
+# SPDX-License-Identifier: (GPL-2.0)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/nvidia,tegra210-ahub.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Tegra210 AHUB Device Tree Bindings
+
+description: |
+  The Audio Hub (AHUB) comprises a collection of hardware accelerators
+  for audio pre-processing, post-processing and a programmable full
+  crossbar for routing audio data across these accelerators. It has
+  external interfaces such as I2S, DMIC, DSPK. It interfaces with ADMA
+  engine through ADMAIF.
+
+maintainers:
+  - Jon Hunter <jonathanh@nvidia.com>
+  - Sameer Pujar <spujar@nvidia.com>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: nvidia,tegra210-ahub
+      - items:
+          - const: nvidia,tegra186-ahub
+      - items:
+          - enum:
+              - nvidia,tegra194-ahub
+          - enum:
+              - nvidia,tegra186-ahub
+
+  reg:
+    description: offset and length of the register set for the device.
+    maxItems: 1
+
+  clocks:
+    description: must contain an entry for each entry in clock-names.
+      See ../clocks/clocks-bindings.txt for details.
+    minItems: 1
+    items:
+      - description: AHUB module clock
+
+  clock-names:
+    description: must contain clock names for each corresponding entry in clocks.
+      See ../clocks/clocks-bindings.txt for details.
+    minItems: 1
+    items:
+      - const: ahub
+
+  assigned-clocks:
+    description: list of input clocks and dividers for the audio system.
+      See ../clocks/clock-bindings.txt for details.
+    minItems: 1
+    items:
+      - description: AHUB module clock
+
+  assigned-clock-parents:
+    description: parent clock for each entry in assigned-clocks
+      See ../clocks/clock-bindings.txt for details.
+    minItems: 1
+    items:
+      - description: parent for AHUB module clock
+
+  assigned-clock-rates:
+    description: clock rate for each entry in assigned-clocks
+      See ../clocks/clock-bindings.txt for details.
+    items:
+      - description: AHUB module clock rate
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  ranges:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description: Specify address range for the node and its children
+    minItems: 1
+
+  "#sound-dai-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - assigned-clocks
+  - assigned-clock-parents
+  - "#address-cells"
+  - "#size-cells"
+  - ranges
+  - "#sound-dai-cells"
+
+examples:
+  - |
+    #include<dt-bindings/clock/tegra210-car.h>
+
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
+        #sound-dai-cells = <1>;
+    };
+
+  - |
+    #include<dt-bindings/clock/tegra186-clock.h>
+
+    ahub@2900800 {
+        compatible = "nvidia,tegra186-ahub";
+        reg = <0x02900800 0x800>;
+        clocks = <&bpmp TEGRA186_CLK_AHUB>;
+        clock-names = "ahub";
+        assigned-clocks = <&bpmp TEGRA186_CLK_AHUB>;
+        assigned-clock-parents = <&bpmp TEGRA186_CLK_PLL_A_OUT0>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges = <0x02900800 0x02900800 0x11800>;
+        #sound-dai-cells = <1>;
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml
new file mode 100644
index 0000000..dc02ce4
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml
@@ -0,0 +1,105 @@
+# SPDX-License-Identifier: (GPL-2.0)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/nvidia,tegra210-dmic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Tegra210 DMIC Controller Device Tree Bindings
+
+description: |
+  The Digital MIC (DMIC) Controller is used to interface with Pulse
+  Density Modulation (PDM) input devices. It converts PDM signals to
+  Pulse Coded Modulation (PCM) signals. DMIC can be viewed as a PDM
+  receiver.
+
+maintainers:
+  - Jon Hunter <jonathanh@nvidia.com>
+  - Sameer Pujar <spujar@nvidia.com>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          const: nvidia,tegra210-dmic
+      - items:
+          - enum:
+              - nvidia,tegra194-dmic
+              - nvidia,tegra186-dmic
+          - enum:
+              - nvidia,tegra210-dmic
+
+  reg:
+    description: offset and length of the register set for the device.
+    maxItems: 1
+
+  clocks:
+    description: must contain an entry for each entry in clock-names.
+      See ../clocks/clocks-bindings.txt for details.
+    minItems: 1
+    items:
+      - description: DMIC interface clock (also goes to codec).
+
+  clock-names:
+    description: must contain clock names for each corresponding entry in clocks.
+      See ../clocks/clocks-bindings.txt for details.
+    minItems: 1
+    items:
+      - const: dmic
+
+  assigned-clocks:
+    description: list of input clocks and dividers for the audio system.
+      See ../clocks/clock-bindings.txt for details.
+    minItems: 1
+    items:
+      - description: DMIC interface clock.
+
+  assigned-clock-parents:
+    description: parent clock for each entry in assigned-clocks
+      See ../clocks/clock-bindings.txt for details.
+    minItems: 1
+    items:
+      - description: parent for DMIC interface clock.
+
+  assigned-clock-rates:
+    description: clock rate for each entry in assigned-clocks
+      See ../clocks/clock-bindings.txt for details.
+    items:
+      - description: rate for DMIC interface clock.
+
+  "#sound-dai-cells":
+    const: 1
+
+  sound-name-prefix:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      used as prefix for sink/source names of the component. Must be a
+      unique string among multiple instances of the same component.
+      The name can be "DMIC1" or "DMIC2" ... "DMICx", where x depends
+      on the maximum available instances on a Tegra SoC.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - assigned-clocks
+  - assigned-clock-parents
+  - "#sound-dai-cells"
+
+examples:
+  - |
+    #include<dt-bindings/clock/tegra210-car.h>
+
+    tegra_dmic1: dmic@702d4000 {
+        compatible = "nvidia,tegra210-dmic";
+        reg = <0x702d4000 0x100>;
+        clocks = <&tegra_car TEGRA210_CLK_DMIC1>;
+        clock-names = "dmic";
+        assigned-clocks = <&tegra_car TEGRA210_CLK_DMIC1>;
+        assigned-clock-parents = <&tegra_car TEGRA210_CLK_PLL_A_OUT0>;
+        assigned-clock-rates = <3072000>;
+        #sound-dai-cells = <1>;
+        sound-name-prefix = "DMIC1";
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml
new file mode 100644
index 0000000..f6f2f2d
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml
@@ -0,0 +1,112 @@
+# SPDX-License-Identifier: (GPL-2.0)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/nvidia,tegra210-i2s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Tegra210 I2S Controller Device Tree Bindings
+
+description: |
+  The Inter-IC Sound (I2S) controller implements full-duplex,
+  bi-directional and single direction point-to-point serial
+  interfaces. It can interface with I2S compatible devices.
+  I2S controller can operate both in master and slave mode.
+
+maintainers:
+  - Jon Hunter <jonathanh@nvidia.com>
+  - Sameer Pujar <spujar@nvidia.com>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          const: nvidia,tegra210-i2s
+      - items:
+          - enum:
+              - nvidia,tegra194-i2s
+              - nvidia,tegra186-i2s
+          - enum:
+              - nvidia,tegra210-i2s
+
+  reg:
+    description: offset and length of the register set for the device.
+    maxItems: 1
+
+  clocks:
+    description: must contain an entry for each entry in clock-names.
+      See ../clocks/clocks-bindings.txt for details.
+    minItems: 1
+    items:
+      - description: I2S bit clock
+      - description:
+          Sync input clock, which can act as clock source to other I/O
+          modules in AHUB. The Tegra I2S driver sets this clock rate as
+          per bit clock rate. I/O module which wants to use this clock
+          as source, can mention this clock as parent in the DT bindings.
+          This is an optional clock entry, since it is only required when
+          some other I/O wants to reference from a particular I2Sx
+          instance.
+
+  clock-names:
+    description: must contain clock names for each corresponding entry in clocks.
+      See ../clocks/clocks-bindings.txt for details.
+    minItems: 1
+    items:
+      - const: i2s
+      - const: sync_input
+
+  assigned-clocks:
+    description: list of input clocks and dividers for the audio system.
+      See ../clocks/clock-bindings.txt for details.
+    minItems: 1
+    items:
+      - description: Bit clock
+
+  assigned-clock-parents:
+    description: parent clock for each entry in assigned-clocks
+    minItems: 1
+    items:
+      - description: Parent for bit clock
+
+  assigned-clock-rates:
+    description: clock rate for each entry in assigned-clocks
+    items:
+      - description: Initial bit clock rate
+
+  "#sound-dai-cells":
+    const: 1
+
+  sound-name-prefix:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      Used as prefix for sink/source names of the component. Must be a
+      unique string among multiple instances of the same component.
+      The name can be "I2S1" or "I2S2" ... "I2Sx", where x depends
+      on the maximum available instances on a Tegra SoC.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - assigned-clocks
+  - assigned-clock-parents
+  - "#sound-dai-cells"
+
+examples:
+  - |
+    #include<dt-bindings/clock/tegra210-car.h>
+
+    tegra_i2s1: i2s@702d1000 {
+        compatible = "nvidia,tegra210-i2s";
+        reg = <0x702d1000 0x100>;
+        clocks = <&tegra_car TEGRA210_CLK_I2S0>;
+        clock-names = "i2s";
+        assigned-clocks = <&tegra_car TEGRA210_CLK_I2S0>;
+        assigned-clock-parents = <&tegra_car TEGRA210_CLK_PLL_A_OUT0>;
+        assigned-clock-rates = <1536000>;
+        #sound-dai-cells = <1>;
+        sound-name-prefix = "I2S1";
+    };
+
+...
-- 
2.7.4


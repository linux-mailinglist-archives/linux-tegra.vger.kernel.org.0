Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52BDE2CD958
	for <lists+linux-tegra@lfdr.de>; Thu,  3 Dec 2020 15:40:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389252AbgLCOhv (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 3 Dec 2020 09:37:51 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:8686 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389202AbgLCOhu (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 3 Dec 2020 09:37:50 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fc8f8150000>; Thu, 03 Dec 2020 06:37:09 -0800
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 3 Dec
 2020 14:37:09 +0000
Received: from audio.nvidia.com (10.124.1.5) by mail.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Thu, 3 Dec 2020 14:37:06 +0000
From:   Sameer Pujar <spujar@nvidia.com>
To:     <robh+dt@kernel.org>, <thierry.reding@gmail.com>,
        <broonie@kernel.org>
CC:     <jonathanh@nvidia.com>, <sharadg@nvidia.com>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        Sameer Pujar <spujar@nvidia.com>
Subject: [RESEND PATCH 1/2] dt-bindings: tegra: Convert HDA doc to json-schema
Date:   Thu, 3 Dec 2020 20:06:41 +0530
Message-ID: <1607006202-4078-2-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607006202-4078-1-git-send-email-spujar@nvidia.com>
References: <1607006202-4078-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1607006229; bh=aoJcYwi5/UenP9bLitxom4hRAg/DI2I1tYEOVWyMeuY=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Type;
        b=QVroGmx1hArPlRKm5dWeLlTXwTcrXk8c8VIeOaiyHXtWfZ9c3Z3gIW9RAX7GMOOcD
         wSiUDJp9OmlCaskDyxcu6GPg0x1i9c25sPJ88ItKnEuO/rpW7J9Bs9WcNnXSBgewAx
         dlBFgyR25yVnK8PN49Duk9r6UlSvGJWgQnCLyFLFSpRbMASykVNBU4xlLXv6uY6BtE
         4bhwlYLM3NXqTBdlZzds3xUVKnXH4Cpre/kUoZxkMFtUUTNbMiRbJAbPlzPJkz5OFc
         bN9a+FKkWe4fLmBsniarAcAylvVhi9qRKs2/8YBQ/xKNJdlJU89RlVE3WR+Q/klqNZ
         CuJNMsXzU/2AQ==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Convert Tegra HDA doc to YAML format.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 .../bindings/sound/nvidia,tegra30-hda.txt          | 35 --------
 .../bindings/sound/nvidia,tegra30-hda.yaml         | 98 ++++++++++++++++++++++
 2 files changed, 98 insertions(+), 35 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.txt
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.txt b/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.txt
deleted file mode 100644
index 21cd310..0000000
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.txt
+++ /dev/null
@@ -1,35 +0,0 @@
-NVIDIA Tegra30 HDA controller
-
-Required properties:
-- compatible : For Tegra30, must contain "nvidia,tegra30-hda".  Otherwise,
-  must contain '"nvidia,<chip>-hda", "nvidia,tegra30-hda"', where <chip> is
-  tegra114, tegra124, or tegra132.
-- reg : Should contain the HDA registers location and length.
-- interrupts : The interrupt from the HDA controller.
-- clocks : Must contain an entry for each required entry in clock-names.
-  See ../clocks/clock-bindings.txt for details.
-- clock-names : Must include the following entries: hda, hda2hdmi, hda2codec_2x
-- resets : Must contain an entry for each entry in reset-names.
-  See ../reset/reset.txt for details.
-- reset-names : Must include the following entries: hda, hda2hdmi, hda2codec_2x
-
-Optional properties:
-- nvidia,model : The user-visible name of this sound complex. Since the property
-  is optional, legacy boards can use default name provided in hda driver.
-
-Example:
-
-hda@70030000 {
-	compatible = "nvidia,tegra124-hda", "nvidia,tegra30-hda";
-	reg = <0x0 0x70030000 0x0 0x10000>;
-	interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
-	clocks = <&tegra_car TEGRA124_CLK_HDA>,
-		 <&tegra_car TEGRA124_CLK_HDA2HDMI>,
-		 <&tegra_car TEGRA124_CLK_HDA2CODEC_2X>;
-	clock-names = "hda", "hda2hdmi", "hda2codec_2x";
-	resets = <&tegra_car 125>, /* hda */
-		 <&tegra_car 128>, /* hda2hdmi */
-		 <&tegra_car 111>; /* hda2codec_2x */
-	reset-names = "hda", "hda2hdmi", "hda2codec_2x";
-	nvidia,model = "jetson-tk1-hda";
-};
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml
new file mode 100644
index 0000000..3059bc3
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml
@@ -0,0 +1,98 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/nvidia,tegra30-hda.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra HDA controller
+
+description: |
+  The High Definition Audio (HDA) block provides a serial interface to
+  audio codec. It supports multiple input and output streams.
+
+maintainers:
+  - Thierry Reding <treding@nvidia.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+properties:
+  $nodename:
+    pattern: "^hda@[0-9a-f]*$"
+
+  compatible:
+    oneOf:
+      - const: nvidia,tegra30-hda
+      - items:
+          - enum:
+              - nvidia,tegra194-hda
+              - nvidia,tegra186-hda
+              - nvidia,tegra210-hda
+              - nvidia,tegra124-hda
+          - const: nvidia,tegra30-hda
+      - items:
+          - const: nvidia,tegra132-hda
+          - const: nvidia,tegra124-hda
+          - const: nvidia,tegra30-hda
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    description: The interrupt from the HDA controller
+    maxItems: 1
+
+  clocks:
+    maxItems: 3
+
+  clock-names:
+    maxItems: 3
+    items:
+      - const: hda
+      - const: hda2hdmi
+      - const: hda2codec_2x
+
+  resets:
+    maxItems: 3
+
+  reset-names:
+    maxItems: 3
+    items:
+      - const: hda
+      - const: hda2hdmi
+      - const: hda2codec_2x
+
+  nvidia,model:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: |
+      The user-visible name of this sound complex. If this property is
+      not specified then boards can use default name provided in hda driver.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include<dt-bindings/clock/tegra124-car-common.h>
+    #include<dt-bindings/interrupt-controller/arm-gic.h>
+
+    hda@70030000 {
+        compatible = "nvidia,tegra124-hda", "nvidia,tegra30-hda";
+        reg = <0x70030000 0x10000>;
+        interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&tegra_car TEGRA124_CLK_HDA>,
+                 <&tegra_car TEGRA124_CLK_HDA2HDMI>,
+                 <&tegra_car TEGRA124_CLK_HDA2CODEC_2X>;
+        clock-names = "hda", "hda2hdmi", "hda2codec_2x";
+        resets = <&tegra_car 125>, /* hda */
+                 <&tegra_car 128>, /* hda2hdmi */
+                 <&tegra_car 111>; /* hda2codec_2x */
+        reset-names = "hda", "hda2hdmi", "hda2codec_2x";
+        nvidia,model = "jetson-tk1-hda";
+    };
+
+...
-- 
2.7.4


Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50E0D5EFB84
	for <lists+linux-tegra@lfdr.de>; Thu, 29 Sep 2022 19:05:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236021AbiI2RFL (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 29 Sep 2022 13:05:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235091AbiI2RFJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 29 Sep 2022 13:05:09 -0400
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10581543E3;
        Thu, 29 Sep 2022 10:05:02 -0700 (PDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id D36626003C1A;
        Thu, 29 Sep 2022 18:05:00 +0100 (WEST)
X-Virus-Scanned: by amavisd-new-2.11.0 (20160426) (Debian) at
        tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
        by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavisd-new, port 10025)
        with LMTP id e9jcLLVYttq7; Thu, 29 Sep 2022 18:04:56 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id C4C766005C23;
        Thu, 29 Sep 2022 18:04:56 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tecnico.ulisboa.pt;
        s=mail; t=1664471096;
        bh=ll+g2rDaCObbl1dD5PlnPH9uSgkTwBiWKYOxd79ugPQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=Ebc3vckAN90poPYjw2FSZ1NeG1WOJp9sjt2lTbAF2tYLcf206YosCmZNOTDTYkebG
         s+V8bJmug71aDHJcFX0vW69OdEWcHuKJkxBWc9jTYF9J5ce8oxxpj86sNNhfsZ26Xc
         xVdiWf2yEU5gKq4iR8onxQ2Vz+NTfcyvRkodWAdQ=
Received: from wslaptop.lan (unknown [IPv6:2001:818:dcb5:dc00:7a88:7f12:8ed8:518d])
        (Authenticated sender: ist187313)
        by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 81AD7360086;
        Thu, 29 Sep 2022 18:04:56 +0100 (WEST)
From:   Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc:     Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, thierry.reding@gmail.com,
        sam@ravnborg.org, airlied@linux.ie, daniel@ffwll.ch,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jonathanh@nvidia.com, arnd@arndb.de,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: display: Add bindings for JDI LPM102A188A
Date:   Thu, 29 Sep 2022 18:04:59 +0100
Message-Id: <20220929170502.1034040-2-diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220929170502.1034040-1-diogo.ivo@tecnico.ulisboa.pt>
References: <20220929170502.1034040-1-diogo.ivo@tecnico.ulisboa.pt>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The LPM102A188A is a 10.2" 2560x1800 IPS panel found in
the Google Pixel C.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
 .../display/panel/jdi,lpm102a188a.yaml        | 100 ++++++++++++++++++
 1 file changed, 100 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/jdi,lpm102a188a.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/jdi,lpm102a188a.yaml b/Documentation/devicetree/bindings/display/panel/jdi,lpm102a188a.yaml
new file mode 100644
index 000000000000..97f9db7152da
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/jdi,lpm102a188a.yaml
@@ -0,0 +1,100 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/jdi,lpm102a188a.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: JDI LPM102A188A 2560x1800 10.2" DSI Panel
+
+maintainers:
+  - Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
+
+description: |
+  This panel requires a dual-channel DSI host to operate. It supports two modes:
+  - left-right: each channel drives the left or right half of the screen
+  - even-odd: each channel drives the even or odd lines of the screen
+
+  Each of the DSI channels controls a separate DSI peripheral. The peripheral
+  driven by the first link (DSI-LINK1) is considered the primary peripheral
+  and controls the device. The 'link2' property contains a phandle to the
+  peripheral driven by the second link (DSI-LINK2).
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: jdi,lpm102a188a
+
+  reg: true
+  enable-gpios: true
+  reset-gpios: true
+  power-supply: true
+  backlight: true
+
+  ts-reset-gpios:
+    maxItems: 1
+    description: |
+      Specifier for a GPIO connected to the touchscreen reset control signal.
+      The reset signal is active low.
+
+  ddi-supply:
+    description: The regulator that provides IOVCC (1.8V).
+
+  link2:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      phandle to the DSI peripheral on the secondary link. Note that the
+      presence of this property marks the containing node as DSI-LINK1.
+
+required:
+  - compatible
+  - reg
+
+if:
+  required:
+    - link2
+then:
+  required:
+    - power-supply
+    - ddi-supply
+    - enable-gpios
+    - reset-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/gpio/tegra-gpio.h>
+
+    dsia: dsi@54300000 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        reg = <0x0 0x54300000 0x0 0x00040000>;
+
+        link2: panel@0 {
+            compatible = "jdi,lpm102a188a";
+            reg = <0>;
+        };
+    };
+
+    dsib: dsi@54400000{
+        #address-cells = <1>;
+        #size-cells = <0>;
+        reg = <0x0 0x54400000 0x0 0x00040000>;
+        nvidia,ganged-mode = <&dsia>;
+
+        link1: panel@0 {
+            compatible = "jdi,lpm102a188a";
+            reg = <0>;
+            power-supply = <&pplcd_vdd>;
+            ddi-supply = <&pp1800_lcdio>;
+            enable-gpios = <&gpio TEGRA_GPIO(V, 1) GPIO_ACTIVE_HIGH>;
+            reset-gpios = <&gpio TEGRA_GPIO(V, 2) GPIO_ACTIVE_LOW>;
+            link2 = <&link2>;
+            backlight = <&backlight>;
+        };
+    };
+
+...
-- 
2.37.3


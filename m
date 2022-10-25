Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D555F60D0CE
	for <lists+linux-tegra@lfdr.de>; Tue, 25 Oct 2022 17:38:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232319AbiJYPij (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 25 Oct 2022 11:38:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232152AbiJYPii (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 25 Oct 2022 11:38:38 -0400
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E280185410;
        Tue, 25 Oct 2022 08:38:37 -0700 (PDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 45FBA6008777;
        Tue, 25 Oct 2022 16:38:36 +0100 (WEST)
X-Virus-Scanned: by amavisd-new-2.11.0 (20160426) (Debian) at
        tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
        by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavisd-new, port 10025)
        with LMTP id E-UtSeaQ8SqG; Tue, 25 Oct 2022 16:38:31 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id BCFB36008763;
        Tue, 25 Oct 2022 16:38:31 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tecnico.ulisboa.pt;
        s=mail; t=1666712311;
        bh=mOfuX1v6w2LK1O2hWFLzbZ86Qnb8CAZ7MrjT98fuOTU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=GViLoP3XavVcSCe4Bh5eRxFAdoK/oT8OkGKG1ahNLuL7Ixis1CS0QhtmriO2eJUHH
         U7dzow6t8JYKGvAweJz5Pv8xUCP7u47dkVCTFjmB+o7W5SsA0YdVQ7ibw2SP2s3SLu
         UOys7kLQwyWBxui/2qoFOiHxPvkELwcsB7v6hx4k=
Received: from localhost.localdomain (unknown [89.207.171.77])
        (Authenticated sender: ist187313)
        by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 249A636007E;
        Tue, 25 Oct 2022 16:38:17 +0100 (WEST)
From:   Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc:     Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, thierry.reding@gmail.com,
        sam@ravnborg.org, airlied@linux.ie, daniel@ffwll.ch,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jonathanh@nvidia.com, arnd@arndb.de,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v2 1/4] dt-bindings: display: Add bindings for JDI LPM102A188A
Date:   Tue, 25 Oct 2022 16:37:45 +0100
Message-Id: <20221025153746.101278-2-diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221025153746.101278-1-diogo.ivo@tecnico.ulisboa.pt>
References: <20221025153746.101278-1-diogo.ivo@tecnico.ulisboa.pt>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
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
Changes in v2:
 - removed the touch screen property

 .../display/panel/jdi,lpm102a188a.yaml        | 94 +++++++++++++++++++
 1 file changed, 94 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/jdi,lpm102a188a.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/jdi,lpm102a188a.yaml b/Documentation/devicetree/bindings/display/panel/jdi,lpm102a188a.yaml
new file mode 100644
index 000000000000..2f4d27a309a7
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/jdi,lpm102a188a.yaml
@@ -0,0 +1,94 @@
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
2.38.1


Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5AE563AC45
	for <lists+linux-tegra@lfdr.de>; Mon, 28 Nov 2022 16:24:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232048AbiK1PYz (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 28 Nov 2022 10:24:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232056AbiK1PYc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 28 Nov 2022 10:24:32 -0500
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [IPv6:2001:4b98:dc4:8::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 921E223BDE;
        Mon, 28 Nov 2022 07:24:02 -0800 (PST)
Received: from booty.fritz.box (unknown [77.244.183.192])
        (Authenticated sender: luca.ceresoli@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPA id CD248100004;
        Mon, 28 Nov 2022 15:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1669649041;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xyo/FmBThIW23NziE2w8WS8gyVQzTbmEFzYd5s8d+Vs=;
        b=VfmhFJx4tj0FHpwNIu1sXRL0zxnfhpXFFMKmdYkyVUisG4JjvSRapvWfmkxtPvSEN41fM/
        UFprOsV0J+7Tiv9lYHxDn/5/iJqsJ92c74U7gYZj6yTd5nHS5vY3Kx8fM9TXcUYP5JnuGj
        Tu6IVyjSJJX0Qna8QrWJb4C6pgUeAuIqxYUlRKklf3+7DXDQIeRhJjI4gjYG/CMZxc1gzc
        47QbYNURSsQogl4YBg+d/DumyLAzjQs/KliwZEKX9RUWlMmUMgf0D4bldByEazzBIPbBPT
        nOLkhJ6i+ss3mLC8wlenZbH0lam30NeaiO1fdyo+yBO9u0tbClNUoCkS76kJwg==
From:   Luca Ceresoli <luca.ceresoli@bootlin.com>
To:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Osipenko <digetx@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Luca Ceresoli <luca.ceresoli@bootlin.com>,
        linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Richard Leitner <richard.leitner@skidata.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 02/21] dt-bindings: display: tegra: vi: add 'vip' property and example
Date:   Mon, 28 Nov 2022 16:23:17 +0100
Message-Id: <20221128152336.133953-3-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221128152336.133953-1-luca.ceresoli@bootlin.com>
References: <20221128152336.133953-1-luca.ceresoli@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The Tegra20 VI peripheral can receive parallel input from the VIP parallel
input module. Add it to the allowed properties and augment the existing
nvidia,tegra20-vi example to show a 'vip' property.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changed in v2 (suggested by Krzysztof Kozlowski):
- rename "i2c3" -> "ic2"
- add review tag
---
 .../display/tegra/nvidia,tegra20-vi.yaml      | 68 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 69 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
index 782a4b10150a..5b5583c2b562 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
@@ -74,6 +74,22 @@ properties:
   avdd-dsi-csi-supply:
     description: DSI/CSI power supply. Must supply 1.2 V.
 
+  vip:
+    $ref: /schemas/display/tegra/nvidia,tegra20-vip.yaml
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Input from the VIP (parallel input capture) module
+
+        properties:
+          endpoint:
+            $ref: /schemas/graph.yaml#/properties/endpoint
+
 patternProperties:
   "^csi@[0-9a-f]+$":
     type: object
@@ -109,6 +125,22 @@ examples:
     #include <dt-bindings/clock/tegra20-car.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
 
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        camera@48 {
+            compatible = "aptina,mt9v111";
+            reg = <0x48>;
+            clocks = <&camera_clk>;
+
+            port {
+                mt9v111_out: endpoint {
+                    remote-endpoint = <&vi_vip_in>;
+                };
+            };
+        };
+    };
+
     vi@54080000 {
         compatible = "nvidia,tegra20-vi";
         reg = <0x54080000 0x00040000>;
@@ -116,6 +148,42 @@ examples:
         clocks = <&tegra_car TEGRA20_CLK_VI>;
         resets = <&tegra_car 100>;
         reset-names = "vi";
+
+        vip {
+            compatible = "nvidia,tegra20-vip";
+            #address-cells = <1>;
+            #size-cells = <0>;
+            channel@0 {
+                reg = <0>;
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+                    port@0 {
+                        reg = <0>;
+                        vi_vip_in: endpoint {
+                            remote-endpoint = <&mt9v111_out>;
+                        };
+                    };
+                    port@1 {
+                        reg = <1>;
+                        vi_vip_out: endpoint {
+                            remote-endpoint = <&vi_in>;
+                        };
+                    };
+                };
+            };
+        };
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            port@0 {
+                reg = <0>;
+                vi_in: endpoint {
+                    remote-endpoint = <&vi_vip_out>;
+                };
+            };
+        };
     };
 
   - |
diff --git a/MAINTAINERS b/MAINTAINERS
index 92c762f85f17..0c97ce22735d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20320,6 +20320,7 @@ M:	Luca Ceresoli <luca.ceresoli@bootlin.com>
 L:	linux-media@vger.kernel.org
 L:	linux-tegra@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
 F:	Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
 
 TEGRA XUSB PADCTL DRIVER
-- 
2.34.1


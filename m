Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 403B16811CC
	for <lists+linux-tegra@lfdr.de>; Mon, 30 Jan 2023 15:16:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237423AbjA3OQp (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 30 Jan 2023 09:16:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237395AbjA3OQi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 30 Jan 2023 09:16:38 -0500
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47EDB3C2B0;
        Mon, 30 Jan 2023 06:16:34 -0800 (PST)
Received: from booty.fritz.box (unknown [77.244.183.192])
        (Authenticated sender: luca.ceresoli@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPA id CF1AA100019;
        Mon, 30 Jan 2023 14:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1675088193;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zDvPDvBijMdwFM3Lmv8VKu9XfwgvP8ii2qMmmjJHYtM=;
        b=ZCQM4EU9x78ynxcvhU6DC4/sMFB/t/50HeqPygDD869edC3CxITYcmCqHYuNgft/gPiaYx
        BZGZoO6FRWQIWYCSW2Ny2wJpXm8/fnqardaiV2xBAKey5vnH02TU0lSevpwd7VgiCPpt6u
        Es1LXunVG0fbXHRWazuCWi/udUJxUw7JbVoyDZ8p9eY031HHGw/9AxiiMelT2sz7CD7shx
        VxmYbe+0KUGyk1Jpomfykyqui/ruI9aszO1tBMl5OMFXztTxdSiOh6WJSYpF7MrxV4Ldrb
        bWIpJBF/C5S7J/rSuOI0eoIFcdzKS2GIPM7sCUrH7n0IJ+2PVUe5NbMZqryWRg==
From:   Luca Ceresoli <luca.ceresoli@bootlin.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
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
        Richard Leitner <richard.leitner@skidata.com>
Subject: [PATCH v4 02/21] dt-bindings: display: tegra: vi: add 'vip' property and example
Date:   Mon, 30 Jan 2023 15:15:44 +0100
Message-Id: <20230130141603.323221-3-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130141603.323221-1-luca.ceresoli@bootlin.com>
References: <20230130141603.323221-1-luca.ceresoli@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The Tegra20 VI peripheral can receive parallel input from the VIP parallel
input module. Add it to the allowed properties and augment the existing
nvidia,tegra20-vi example to show a 'vip' property.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changed in v4:
 - complete the removal of 'channel@0'

Changed in v3 (suggested by Rob Herring):
 - drop 'endpoint', unneeded as there's no extra properties in the
   endpoints

Changed in v2 (suggested by Krzysztof Kozlowski):
 - rename "i2c3" -> "ic2"
 - add review tag
---
 .../display/tegra/nvidia,tegra20-vi.yaml      | 59 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 60 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
index 782a4b10150a..46c5e00595bd 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
@@ -74,6 +74,18 @@ properties:
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
 patternProperties:
   "^csi@[0-9a-f]+$":
     type: object
@@ -109,6 +121,22 @@ examples:
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
@@ -116,6 +144,37 @@ examples:
         clocks = <&tegra_car TEGRA20_CLK_VI>;
         resets = <&tegra_car 100>;
         reset-names = "vi";
+
+        vip {
+            compatible = "nvidia,tegra20-vip";
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                port@0 {
+                    reg = <0>;
+                    vi_vip_in: endpoint {
+                        remote-endpoint = <&mt9v111_out>;
+                    };
+                };
+                port@1 {
+                    reg = <1>;
+                    vi_vip_out: endpoint {
+                        remote-endpoint = <&vi_in>;
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
index 5dc335adee46..b62a51052797 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20593,6 +20593,7 @@ L:	linux-media@vger.kernel.org
 L:	linux-tegra@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
+F:	Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
 F:	Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
 F:	drivers/staging/media/tegra-video/
 
-- 
2.34.1


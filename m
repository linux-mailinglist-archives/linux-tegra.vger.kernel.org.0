Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AC3244E5EE
	for <lists+linux-tegra@lfdr.de>; Fri, 12 Nov 2021 13:05:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234881AbhKLMI0 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 12 Nov 2021 07:08:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234776AbhKLMIY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Nov 2021 07:08:24 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A96FC061767;
        Fri, 12 Nov 2021 04:05:34 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id d24so15175402wra.0;
        Fri, 12 Nov 2021 04:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=boain6r562dV+hfdk2j6oqVAlVIdg5+kTc7R2RYSOnA=;
        b=QiT+CVVebK1NQc+TUp2vq/6Qcz1+Ku2lzdBjdoQ1bK4fj/LsfBtVaQlcnlWbM9Jtnp
         VmxW1TV06LKfVmmoPwthW3dAY8LVXHhdetI5BGBZoNpjELKC4/Y2BLBVJ0mwf7+rmnCz
         dlqJRtjziVI4xOR7s1BM/OF4w7klI3eQ+zLTukzAT9NwsSH6VQ5vMt/vMwQ5n9RPHdHg
         P6CU557uf3CyscS85N+59beGgZEYfUtPtwaxLj/ST5e3gLj6oa0RPXiRMVEj9rpmZpRE
         JHuP68Wj3HoJ/r8UservlZYTBrO2rG3ChZPLZFx7xChsi08izOkuhNHs8diUSAmwmppa
         geMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=boain6r562dV+hfdk2j6oqVAlVIdg5+kTc7R2RYSOnA=;
        b=AvTVOAkeRXlRL162DXZFZQOftJb/NQ2YeTRNxsZ1MqhzAYTW+lkDnbYhp0m2ZP1eh6
         DDgprG0jkab7lZQoN78hR27kA1ITVO1qFypTH4B+m/EIqscIQVRzHwpb/F40nGJM4uYK
         glkgJZxLsSihLXBtG7KSdvVgWjGeVgbIRglncZqm56NnULnK+PKXdwn+DnKeRpZXXCZz
         Xe99NsmojdePJG9diE2fbwa8aTDp9QrrtOGGjxJJDEjix7i6hqhv1oxAovhaXDf+I7tk
         CTcNEvzY4vav/hZaBn2ij4mL1aZAbt4t9B/fUcNBEM7xLTgs4B3SDSV6XEhaykNc5c01
         vDcA==
X-Gm-Message-State: AOAM530Fs9dmzOdSIBkPMpWhmpMsiqafTp34QOfUxc0lfW1kxjuJoxD7
        xQS7dmaoYmQDzFgUoOM9vWpzq6ljqVLlQg==
X-Google-Smtp-Source: ABdhPJyszaYG35fB7cRuTkPbvF7YyKhjMyG7QXOWBRpSpfhIWC9PRh7ICMgkaOqWSGZysSCqTuNWiA==
X-Received: by 2002:adf:f88c:: with SMTP id u12mr18453733wrp.29.1636718732590;
        Fri, 12 Nov 2021 04:05:32 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id l124sm11542851wml.8.2021.11.12.04.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 04:05:31 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 03/15] dt-bindings: mailbox: tegra: Convert to json-schema
Date:   Fri, 12 Nov 2021 13:05:06 +0100
Message-Id: <20211112120518.3679793-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211112120518.3679793-1-thierry.reding@gmail.com>
References: <20211112120518.3679793-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Convert the NVIDIA Tegra HSP bindings from the free-form text format to
json-schema.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../bindings/mailbox/nvidia,tegra186-hsp.txt  |  72 ------------
 .../bindings/mailbox/nvidia,tegra186-hsp.yaml | 109 ++++++++++++++++++
 2 files changed, 109 insertions(+), 72 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.txt
 create mode 100644 Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.txt b/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.txt
deleted file mode 100644
index ff3eafc5a882..000000000000
--- a/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.txt
+++ /dev/null
@@ -1,72 +0,0 @@
-NVIDIA Tegra Hardware Synchronization Primitives (HSP)
-
-The HSP modules are used for the processors to share resources and communicate
-together. It provides a set of hardware synchronization primitives for
-interprocessor communication. So the interprocessor communication (IPC)
-protocols can use hardware synchronization primitives, when operating between
-two processors not in an SMP relationship.
-
-The features that HSP supported are shared mailboxes, shared semaphores,
-arbitrated semaphores and doorbells.
-
-Required properties:
-- name : Should be hsp
-- compatible
-    Array of strings.
-    one of:
-    - "nvidia,tegra186-hsp"
-    - "nvidia,tegra194-hsp", "nvidia,tegra186-hsp"
-- reg : Offset and length of the register set for the device.
-- interrupt-names
-    Array of strings.
-    Contains a list of names for the interrupts described by the interrupt
-    property. May contain the following entries, in any order:
-    - "doorbell"
-    - "sharedN", where 'N' is a number from zero up to the number of
-      external interrupts supported by the HSP instance minus one.
-    Users of this binding MUST look up entries in the interrupt property
-    by name, using this interrupt-names property to do so.
-- interrupts
-    Array of interrupt specifiers.
-    Must contain one entry per entry in the interrupt-names property,
-    in a matching order.
-- #mbox-cells : Should be 2.
-
-The mbox specifier of the "mboxes" property in the client node should contain
-two cells. The first cell determines the HSP type and the second cell is used
-to identify the mailbox that the client is going to use.
-
-For doorbells, the second cell specifies the index of the doorbell to use.
-
-For shared mailboxes, the second cell is composed of two fields:
-- bits 31..24:
-    A bit mask of flags that further specify how the shared mailbox will be
-    used. Valid flags are:
-    - bit 31:
-        Defines the direction of the mailbox. If set, the mailbox will be used
-        as a producer (i.e. used to send data). If cleared, the mailbox is the
-        consumer of data sent by a producer.
-
-- bits 23.. 0:
-    The index of the shared mailbox to use. The number of available mailboxes
-    may vary by instance of the HSP block and SoC generation.
-
-The following file contains definitions that can be used to construct mailbox
-specifiers:
-
-    <dt-bindings/mailbox/tegra186-hsp.h>
-
-Example:
-
-hsp_top0: hsp@3c00000 {
-	compatible = "nvidia,tegra186-hsp";
-	reg = <0x0 0x03c00000 0x0 0xa0000>;
-	interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;
-	interrupt-names = "doorbell";
-	#mbox-cells = <2>;
-};
-
-client {
-	...
-	mboxes = <&hsp_top0 TEGRA_HSP_MBOX_TYPE_DB TEGRA_HSP_DB_MASTER_XXX>;
-};
diff --git a/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml b/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml
new file mode 100644
index 000000000000..f5319f4e4393
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml
@@ -0,0 +1,109 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/nvidia,tegra186-hsp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra Hardware Synchronization Primitives (HSP)
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+description: |
+  The HSP modules are used for the processors to share resources and
+  communicate together. It provides a set of hardware synchronization
+  primitives for interprocessor communication. So the interprocessor
+  communication (IPC) protocols can use hardware synchronization
+  primitives, when operating between two processors not in an SMP
+  relationship.
+
+  The features that HSP supported are shared mailboxes, shared
+  semaphores, arbitrated semaphores and doorbells.
+
+  The mbox specifier of the "mboxes" property in the client node should
+  contain two cells. The first cell determines the HSP type and the
+  second cell is used to identify the mailbox that the client is going
+  to use.
+
+  For doorbells, the second cell specifies the index of the doorbell to
+  use.
+
+  For shared mailboxes, the second cell is composed of two fields:
+    - bits 31..24:
+        A bit mask of flags that further specify how the shared mailbox
+        will be used. Valid flags are:
+          - bit 31:
+              Defines the direction of the mailbox. If set, the mailbox
+              will be used as a producer (i.e. used to send data). If
+              cleared, the mailbox is the consumer of data sent by a
+              producer.
+
+    - bits 23..0:
+        The index of the shared mailbox to use. The number of available
+        mailboxes may vary by instance of the HSP block and SoC
+        generation.
+
+    The following file contains definitions that can be used to
+    construct mailbox specifiers:
+
+        <dt-bindings/mailbox/tegra186-hsp.h>
+
+properties:
+  $nodename:
+    pattern: "^hsp@[0-9a-f]+$"
+
+  compatible:
+    oneOf:
+      - const: nvidia,tegra186-hsp
+      - const: nvidia,tegra194-hsp
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 1
+    maxItems: 9
+
+  interrupt-names:
+    oneOf:
+      # shared interrupts are optional
+      - items:
+          - const: doorbell
+
+      - items:
+          - const: doorbell
+          - pattern: "^shared[0-7]$"
+          - pattern: "^shared[0-7]$"
+          - pattern: "^shared[0-7]$"
+          - pattern: "^shared[0-7]$"
+          - pattern: "^shared[0-7]$"
+          - pattern: "^shared[0-7]$"
+          - pattern: "^shared[0-7]$"
+          - pattern: "^shared[0-7]$"
+
+      - items:
+          - pattern: "^shared[0-7]$"
+          - pattern: "^shared[0-7]$"
+          - pattern: "^shared[0-7]$"
+          - pattern: "^shared[0-7]$"
+
+  "#mbox-cells":
+    const: 2
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/mailbox/tegra186-hsp.h>
+
+    hsp_top0: hsp@3c00000 {
+        compatible = "nvidia,tegra186-hsp";
+        reg = <0x03c00000 0xa0000>;
+        interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "doorbell";
+        #mbox-cells = <2>;
+    };
+
+    client {
+        mboxes = <&hsp_top0 TEGRA_HSP_MBOX_TYPE_DB TEGRA_HSP_DB_MASTER_CCPLEX>;
+    };
-- 
2.33.1


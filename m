Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED13A468562
	for <lists+linux-tegra@lfdr.de>; Sat,  4 Dec 2021 15:37:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238389AbhLDOlB (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sat, 4 Dec 2021 09:41:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236675AbhLDOlA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 4 Dec 2021 09:41:00 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AB2BC061751;
        Sat,  4 Dec 2021 06:37:34 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id u22so11926058lju.7;
        Sat, 04 Dec 2021 06:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vxGUSMvrOv7nlYjHA3TMjrIWjar7r9+1jQfmAuKVGRM=;
        b=JQs79NdQE/jgin55cuJTRlAzgXKoL2Rzo1eZGFcOAJ9GNWYR4mgSHfzWkebUPDlbU5
         gHPIoHbjwwqhPgXYaOsMndinfAtk7NgNptIAPiBWBgtUtw6r3ktFruT1l4T98KqZggmE
         Zuj0kD78lJl73voZWokKVN18wsZl3kbOIy/qHzuCjvYqmdfQOIWFdoJzyFdOnS3RU+5I
         mxp09MHuLMdXN+90tFxc7rOgMmxU5wXXV356apb0CSse9m2rCGnUYlGUAie0+8EFy5i/
         sofAwgg8TuXMyq8pJyg0pqcgg1xA0zPeN/HtuxVHMP+D1BNlVoXInOPQYzO1vnbe3ZVf
         /WGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vxGUSMvrOv7nlYjHA3TMjrIWjar7r9+1jQfmAuKVGRM=;
        b=tN6p2+B3jOsY3tzJJYNrM3ZEUMkwoecC4RwAue4PDgxDQJucj3E/skNnPJkT63fb/u
         Z0zHwDpHRji1ykQojh/2tX/Sm2ZgtqOfzn6K3Z/Mm+stFwY53W05Bu6kmZZ1itwiUds0
         kuInPxxIIkazLdv8YsrJcEv8pWoYNKyeFGjMv5el2SvGTjX/L6iS0KpNFso4YCDHbAuH
         huZnuRX0Iwh/qXbfL9yEmIMnlmYVJhqiKrfxeCJFUGiwCv++CntctEfYR65yTgkIKsBe
         OVdn59vZEvqbH/HHeHFkbpWazDkBYrEWHF+hMMZSl9sxkjRM2w3HqOIeUnQ8IcPhTA4Q
         5SYQ==
X-Gm-Message-State: AOAM530HLtcDzAwVrJfKq8vUShVQjs3CgkaTinrtrC56s6hVl6Ol6ZAS
        PShm/msdXM8k4ybvRDgH4pk=
X-Google-Smtp-Source: ABdhPJwFKSY6gXiGJCMXPDEpLLxkCIqqB4WLBSM5beC7Ci2xUaQbEQqWA290kHeRtDe6PC0JM0YUDw==
X-Received: by 2002:a2e:93c4:: with SMTP id p4mr25085599ljh.367.1638628652818;
        Sat, 04 Dec 2021 06:37:32 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru. [94.29.46.111])
        by smtp.gmail.com with ESMTPSA id g36sm782934lfv.16.2021.12.04.06.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Dec 2021 06:37:32 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Agneli <poczt@protonmail.ch>
Cc:     linux-tegra@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: [PATCH v4 02/22] ASoC: dt-bindings: tegra20-i2s: Convert to schema
Date:   Sat,  4 Dec 2021 17:37:05 +0300
Message-Id: <20211204143725.31646-3-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211204143725.31646-1-digetx@gmail.com>
References: <20211204143725.31646-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Convert NVIDIA Tegra20 I2S binding to schema.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../bindings/sound/nvidia,tegra20-i2s.txt     | 30 --------
 .../bindings/sound/nvidia,tegra20-i2s.yaml    | 70 +++++++++++++++++++
 2 files changed, 70 insertions(+), 30 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.txt
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.yaml

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.txt b/Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.txt
deleted file mode 100644
index dc30c6bfbe95..000000000000
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.txt
+++ /dev/null
@@ -1,30 +0,0 @@
-NVIDIA Tegra 20 I2S controller
-
-Required properties:
-- compatible : "nvidia,tegra20-i2s"
-- reg : Should contain I2S registers location and length
-- interrupts : Should contain I2S interrupt
-- resets : Must contain an entry for each entry in reset-names.
-  See ../reset/reset.txt for details.
-- reset-names : Must include the following entries:
-  - i2s
-- dmas : Must contain an entry for each entry in clock-names.
-  See ../dma/dma.txt for details.
-- dma-names : Must include the following entries:
-  - rx
-  - tx
-- clocks : Must contain one entry, for the module clock.
-  See ../clocks/clock-bindings.txt for details.
-
-Example:
-
-i2s@70002800 {
-	compatible = "nvidia,tegra20-i2s";
-	reg = <0x70002800 0x200>;
-	interrupts = < 45 >;
-	clocks = <&tegra_car 11>;
-	resets = <&tegra_car 11>;
-	reset-names = "i2s";
-	dmas = <&apbdma 21>, <&apbdma 21>;
-	dma-names = "rx", "tx";
-};
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.yaml
new file mode 100644
index 000000000000..ad43b237d9af
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/nvidia,tegra20-i2s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra20 I2S Controller
+
+description: |
+  The I2S Controller streams synchronous serial audio data between system
+  memory and an external audio device. The controller supports the I2S Left
+  Justified Mode, Right Justified Mode, and DSP mode formats.
+
+maintainers:
+  - Thierry Reding <treding@nvidia.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+properties:
+  compatible:
+    const: nvidia,tegra20-i2s
+
+  reg:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    const: i2s
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+
+  dmas:
+    minItems: 2
+
+  dma-names:
+    items:
+      - const: rx
+      - const: tx
+
+required:
+  - compatible
+  - reg
+  - resets
+  - reset-names
+  - interrupts
+  - clocks
+  - dmas
+  - dma-names
+
+additionalProperties: false
+
+examples:
+  - |
+    i2s@70002800 {
+        compatible = "nvidia,tegra20-i2s";
+        reg = <0x70002800 0x200>;
+        interrupts = <45>;
+        clocks = <&tegra_car 11>;
+        resets = <&tegra_car 11>;
+        reset-names = "i2s";
+        dmas = <&apbdma 21>, <&apbdma 21>;
+        dma-names = "rx", "tx";
+    };
+
+...
-- 
2.33.1


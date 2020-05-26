Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74C121A3943
	for <lists+linux-tegra@lfdr.de>; Thu,  9 Apr 2020 19:53:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726687AbgDIRxE (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 9 Apr 2020 13:53:04 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:52441 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725970AbgDIRxE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Apr 2020 13:53:04 -0400
Received: by mail-wm1-f65.google.com with SMTP id t203so655870wmt.2;
        Thu, 09 Apr 2020 10:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NN2DE1IQqithFVfAuIcLmUoSi2j0XpDIzngv49/FOaM=;
        b=RIOFFPFwI9Ot8tRhufRlRXzgP7+UloJtReRxwPCrcE2SfVdnVm/0kXNtn6tQMOycPp
         qP+1or+oa72fBM2HoJ8HLmAH8327CO/4DKLY1bzIdUVqVA8/tJJw+pfbbYeM6r2MkDGz
         Ba5NIWJQCXWnBA8lhHy2WYPD1uflo5B7j3ERWFlGRqlAIfqOJg/VFCAzfUGs4IUgRqKK
         gHEey4WziBU+Q8x1NMetw5ahaUE6EblVPB7/0Zuy99TAEOlWSf/LgX4UJWwowil5UOFn
         GqLMrxspYi5EdEDG61bgKY27ErR6UJBfPWKalTTDPKce0Kdol40VmsQ7bqjTMAN89z+w
         U02g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NN2DE1IQqithFVfAuIcLmUoSi2j0XpDIzngv49/FOaM=;
        b=bMGJTd4e3BGBvL/0ZfppfhYq9f5KjQMpKai432J1JoghsvIv7dmqXh9pBfjJI3K2Cf
         fDNGZktEmMBT/JooD8n7zveGLZ3E9JHVGhQ/tuFyPxwWdyCdMZ4twBZM3Z3gFn4qb0v0
         K+X1mN8dmRdNEvEhYtxKSxJr8Jr9Z6j7bXFD3bS3zFirvMDK807bCnG0r5+IITMbnV4p
         o9nxlXbkLXjT2keJo8Ct2qAIgdUeXWU+jEOLaVW5OLBwpOn2X+A8bER1qECAZwfRQ+lv
         ySg3L1T3UdIpfC+L8fSymwlb3t/KBOmJnz2iGmjJGS9k29zDsOf9T7T8vvxaFtygoeDx
         Ee1w==
X-Gm-Message-State: AGi0PuaMf4f3FLywuBZKzmQb/k94I/hI5SHPqYvGAxQor+oEoYdv37Gi
        pHr5cCy9ZBhbShNtgSXk7WM=
X-Google-Smtp-Source: APiQypJ/n7KDGZlCPrmJHOYzihbyHvhBwf46IleE36Su/NLOvqUYObCFgmqSmbRl6N+bZHLPxzCMEA==
X-Received: by 2002:a1c:e203:: with SMTP id z3mr1042725wmg.71.1586454780040;
        Thu, 09 Apr 2020 10:53:00 -0700 (PDT)
Received: from localhost (pD9E51D62.dip0.t-ipconnect.de. [217.229.29.98])
        by smtp.gmail.com with ESMTPSA id h6sm4753508wmf.31.2020.04.09.10.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2020 10:52:59 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Joseph Lo <josephl@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 08/14] dt-bindings: memory: tegra: Add external memory controller binding for Tegra210
Date:   Thu,  9 Apr 2020 19:52:32 +0200
Message-Id: <20200409175238.3586487-9-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200409175238.3586487-1-thierry.reding@gmail.com>
References: <20200409175238.3586487-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Joseph Lo <josephl@nvidia.com>

Add the binding document for the external memory controller (EMC) which
communicates with external LPDDR4 devices. It includes the bindings of
the EMC node and a sub-node of EMC table which under the reserved memory
node. The EMC table contains the data of the rates that EMC supported.

Signed-off-by: Joseph Lo <josephl@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v6:
- fix example by changing #address-cells and #size-cells
- remove status property from example

Changes in v5:
- convert to dt-schema

 .../nvidia,tegra210-emc.yaml                  | 82 +++++++++++++++++++
 1 file changed, 82 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.yaml

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.yaml
new file mode 100644
index 000000000000..49ab09252e52
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.yaml
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/memory-controllers/nvidia,tegra210-emc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra210 SoC External Memory Controller
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+description: |
+  The EMC interfaces with the off-chip SDRAM to service the request stream
+  sent from the memory controller.
+
+properties:
+  compatible:
+    const: nvidia,tegra210-emc
+
+  reg:
+    maxItems: 3
+
+  clocks:
+    items:
+      - description: external memory clock
+
+  clock-names:
+    items:
+      - const: emc
+
+  interrupts:
+    items:
+      - description: EMC general interrupt
+
+  memory-region:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      phandle to a reserved memory region describing the table of EMC
+      frequencies trained by the firmware
+
+  nvidia,memory-controller:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      phandle of the memory controller node
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - nvidia,memory-controller
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/tegra210-car.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    reserved-memory {
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        emc_table: emc-table@83400000 {
+            compatible = "nvidia,tegra210-emc-table";
+            reg = <0x83400000 0x10000>;
+        };
+    };
+
+    external-memory-controller@7001b000 {
+        compatible = "nvidia,tegra210-emc";
+        reg = <0x7001b000 0x1000>,
+              <0x7001e000 0x1000>,
+              <0x7001f000 0x1000>;
+        clocks = <&tegra_car TEGRA210_CLK_EMC>;
+        clock-names = "emc";
+        interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
+        memory-region = <&emc_table>;
+        nvidia,memory-controller = <&mc>;
+    };
-- 
2.24.1


Return-Path: <linux-tegra+bounces-6639-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0DDAAF35E
	for <lists+linux-tegra@lfdr.de>; Thu,  8 May 2025 08:08:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5C423AFC3E
	for <lists+linux-tegra@lfdr.de>; Thu,  8 May 2025 06:07:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1054E217723;
	Thu,  8 May 2025 06:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DfuakBYT"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF65921638E;
	Thu,  8 May 2025 06:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746684465; cv=none; b=lt1tj/RA9Yvc/q10DzRgkSucawlx82uQWkf0YFTj2NrlgH7Jv+PvMtuaATqoi0tuU9BVLjWLXd6xbuRHKt5xT5fpmoCs253979d4MK9M7mIzVeidV3iour6/N+7kNBSN+qW80At78d8zFJYeu3mjOWIgF1YT7RdofEcf1YsnELY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746684465; c=relaxed/simple;
	bh=8y2G354csqvkJSkxQ7antEKFho7KNP6a7ihx+8nQbQs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oa66JoYm9bH8cG7sLomzQIb7NbEASgBRpAOEGoJqkhTqPqJOjOZdn7+w6Gtp5GzVYOmgiiexGWrWz7Yb1PGXR5oRsMFwy81HKB50vym/xSK391tNCmQUML7cb7BkFeqtBOSx3gP0HNV3+P9LqXFCm8Z2VdK3ibqcDglX8LJMnHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DfuakBYT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4C4BFC4CEEB;
	Thu,  8 May 2025 06:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746684465;
	bh=8y2G354csqvkJSkxQ7antEKFho7KNP6a7ihx+8nQbQs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=DfuakBYTbdlGm3VMxtrYD0Sfd9bHVUOTdoNZNNrU4VYTflLs0lhw3/DMWgpTkQOU5
	 NLvSjy/dnlGMiGpVpSdn3xJXyGnDBCXwJtjHrKtCjlKdMnEom6O2hClWqrvpSLVtAu
	 E/pXsQVZZu7gwEWZs8/a4WUS48g1pFmyK8KkBSVf+51cToGLeBdirZIRG3w0nuP8lu
	 afEGgAXQOzmZ0+Yh7c8CcsvotmEwWGQxmGFMm1ywE7RGjU2inhasUO2ymDI5qKQcEE
	 FUO8dX2ruTions7+37B9QZpxjdTlW8/VgaDinbRhp+DIdXYBJJ39b0KqUIUtsqoego
	 FVzXyE2LIk0qQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CC2CC3ABC9;
	Thu,  8 May 2025 06:07:45 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Thu, 08 May 2025 01:07:38 -0500
Subject: [PATCH v2 1/4] dt-bindings: memory-controllers: Describe Tegra210
 EMC Tables
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250508-tegra210-emc-dt-v2-1-d33dc20a1123@gmail.com>
References: <20250508-tegra210-emc-dt-v2-0-d33dc20a1123@gmail.com>
In-Reply-To: <20250508-tegra210-emc-dt-v2-0-d33dc20a1123@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
 devicetree@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746684461; l=58307;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=Y4hnNQH227BQCOPuYMWQxMQWP9qYWWdlGwGODAxV/Ag=;
 b=3qfwPLhQ1wbfju5CrRrPPk/p2eAa89MAHR/6uXurqk0b0MtohbxRPMeqk9ER6Vlk5VoG3VTHk
 F8OCZVOxMVoC7SeDSPBxWHcNVF1NNpvfAy+0dqr+a/Qn1AwnlvR6u1f
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

Add device tree bindings for Tegra210 EMC tables as used by the Nvidia
Android bootloader.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 .../nvidia,tegra21-emc-table.yaml                  | 1692 ++++++++++++++++++++
 .../memory-controllers/nvidia,tegra210-emc.yaml    |   38 +
 2 files changed, 1730 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra21-emc-table.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra21-emc-table.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..df371c835b95ad75deb74ad1d8711ed40a9b2361
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra21-emc-table.yaml
@@ -0,0 +1,1692 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/memory-controllers/nvidia,tegra21-emc-table.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra210 SoC EMC Table
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+description: |
+  EMC training data used by the emc driver to do periodic training
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - nvidia,tegra21-emc-table
+          - nvidia,tegra21-emc-table-derated
+
+  reg:
+    maxItems: 1
+    description:
+      Clock rate for this table
+
+  clock-frequency:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      external memory clock rate in KHz
+    minimum: 40800
+    maximum: 1600000
+
+  nvidia,revision:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The revision of this table
+
+  nvidia,dvfs-version:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      The dvfs version of this table
+
+  nvidia,emc-min-mv:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The minimum emc voltage allowed for this table
+
+  nvidia,gk20a-min-mv:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The minimum gpu voltage allowed for this table
+
+  nvidia,source:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      The clock source for this table
+
+  nvidia,src-sel-reg:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Value of the source selection register
+
+  nvidia,needs-training:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      If this table needs training
+
+  nvidia,training_pattern:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Which training pattern to use for this table
+
+  nvidia,trained:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      If this table has been trained
+
+  nvidia,periodic_training:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      If this table should be periodically trained
+
+  nvidia,trained_dram_clktree_c0d0u0:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Trained value of c0d0u0 in the dram clock tree
+
+  nvidia,trained_dram_clktree_c0d0u1:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Trained value of c0d0u1 in the dram clock tree
+
+  nvidia,trained_dram_clktree_c0d1u0:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Trained value of c0d1u0 in the dram clock tree
+
+  nvidia,trained_dram_clktree_c0d1u1:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Trained value of c0d1u1 in the dram clock tree
+
+  nvidia,trained_dram_clktree_c1d0u0:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Trained value of c1d0u0 in the dram clock tree
+
+  nvidia,trained_dram_clktree_c1d0u1:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Trained value of c1d0u1 in the dram clock tree
+
+  nvidia,trained_dram_clktree_c1d1u0:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Trained value of c1d1u0 in the dram clock tree
+
+  nvidia,trained_dram_clktree_c1d1u1:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Trained value of c1d1u1 in the dram clock tree
+
+  nvidia,current_dram_clktree_c0d0u0:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Current value of c0d0u0 in the dram clock tree
+
+  nvidia,current_dram_clktree_c0d0u1:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Current value of c0d0u1 in the dram clock tree
+
+  nvidia,current_dram_clktree_c0d1u0:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Current value of c0d1u0 in the dram clock tree
+
+  nvidia,current_dram_clktree_c0d1u1:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Current value of c0d1u1 in the dram clock tree
+
+  nvidia,current_dram_clktree_c1d0u0:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Current value of c1d0u0 in the dram clock tree
+
+  nvidia,current_dram_clktree_c1d0u1:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Current value of c1d0u1 in the dram clock tree
+
+  nvidia,current_dram_clktree_c1d1u0:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Current value of c1d1u0 in the dram clock tree
+
+  nvidia,current_dram_clktree_c1d1u1:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Current value of c1d1u1 in the dram clock tree
+
+  nvidia,run_clocks:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Clocks to run
+
+  nvidia,tree_margin:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Tree margin
+
+  nvidia,burst-regs-num:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Number of burst registers
+
+  nvidia,burst-regs-per-ch-num:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Number of burst registers per channel
+
+  nvidia,trim-regs-num:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Number of trim registers
+
+  nvidia,trim-regs-per-ch-num:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Number of trim registers per channel
+
+  nvidia,burst-mc-regs-num:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Number of burst mc registers
+
+  nvidia,la-scale-regs-num:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Number of la scale registers
+
+  nvidia,vref-regs-num:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Number of voltage reference registers
+
+  nvidia,training-mod-regs-num:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Number of training mod registers
+
+  nvidia,dram-timing-regs-num:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Number of dram timing registers
+
+  nvidia,min-mrs-wait:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Value of the MIN_MRS_WAIT register
+
+  nvidia,emc-mrw:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Value of the EMC_MRW register
+
+  nvidia,emc-mrw2:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Value of the EMC_MRW2 register
+
+  nvidia,emc-mrw3:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Value of the EMC_MRW3 register
+
+  nvidia,emc-mrw4:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Value of the EMC_MRW4 register
+
+  nvidia,emc-mrw9:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Value of the EMC_MRW9 register
+
+  nvidia,emc-mrs:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Value of the EMC_MRS register
+
+  nvidia,emc-emrs:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Value of the EMC_EMRS register
+
+  nvidia,emc-emrs2:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Value of the EMC_EMRS2 register
+
+  nvidia,emc-auto-cal-config:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Value of the EMC_AUTO_CAL_CONFIG register
+
+  nvidia,emc-auto-cal-config2:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Value of the EMC_AUTO_CAL_CONFIG2 register
+
+  nvidia,emc-auto-cal-config3:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Value of the EMC_AUTO_CAL_CONFIG3 register
+
+  nvidia,emc-auto-cal-config4:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Value of the EMC_AUTO_CAL_CONFIG4 register
+
+  nvidia,emc-auto-cal-config5:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Value of the EMC_AUTO_CAL_CONFIG5 register
+
+  nvidia,emc-auto-cal-config6:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Value of the EMC_AUTO_CAL_CONFIG6 register
+
+  nvidia,emc-auto-cal-config7:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Value of the EMC_AUTO_CAL_CONFIG7 register
+
+  nvidia,emc-auto-cal-config8:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Value of the EMC_AUTO_CAL_CONFIG8 register
+
+  nvidia,emc-cfg-2:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Value of the EMC_CFG_2 register
+
+  nvidia,emc-sel-dpd-ctrl:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Value of the EMC_SEL_DPD_CTRL register
+
+  nvidia,emc-fdpd-ctrl-cmd-no-ramp:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Value of the EMC_FDPD_SEL_DPD_CTRL_NO_RAMP register
+
+  nvidia,dll-clk-src:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      VALUE of the DLL_CLK_SRC register
+
+  nvidia,clk-out-enb-x-0-clk-enb-emc-dll:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      If the dll clock should be enabled for this table
+
+  nvidia,emc-clock-latency-change:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Clock latency change
+
+  nvidia,ptfv:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description:
+      Ptfv list values
+
+  nvidia,emc-registers:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description:
+      Burst register values, size is determined by
+      nvidia,burst-regs-num
+
+  nvidia,emc-burst-regs-per-ch:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description:
+      Per channel EMC burst register values, size is determined by
+      nvidia,burst-regs-per-ch-num
+
+  nvidia,emc-shadow-regs-ca-train:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description:
+      Shadow registers ca train, size is determined by
+      nvidia,burst-regs-num
+
+  nvidia,emc-shadow-regs-quse-train:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description:
+      Shadow registers quse train, size is determined by
+      nvidia,burst-regs-num
+
+  nvidia,emc-shadow-regs-rdwr-train:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description:
+      Shadow registers rdwr train, size is determined by
+      nvidia,burst-regs-num
+
+  nvidia,emc-trim-regs:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description:
+      Trim register values, size is determined by
+      nvidia,trim-regs-num
+
+  nvidia,emc-trim-regs-per-ch:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description:
+      Per channel trim register values, size is determined by
+      nvidia,trim-regs-per-channel-num
+
+  nvidia,emc-vref-regs:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description:
+      Voltage reference register values, size is determined by
+      nvidia,vref-regs-num
+
+  nvidia,emc-dram-timing-regs:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description:
+      Dram timing register values, size is determined by
+      nvidia,dram-timing-regs-num
+
+  nvidia,emc-training-mod-regs:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description:
+      Training mod register values, size is determined by
+      nvidia,training-mod-regs-num
+
+  nvidia,emc-save-restore-mod-regs:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description:
+      Save restore mod register values
+
+  nvidia,emc-burst-mc-regs:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description:
+      Burst mc register values, size is determined by
+      nvidia,burst-mc-regs-num
+
+  nvidia,emc-la-scale-regs:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description:
+      La scale register values, size is determined by
+      nvidia,burst-mc-regs-num
+
+required:
+  - compatible
+  - clock-frequency
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/tegra210-car.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    external-memory-controller@7001b000 {
+        reg = <0x7001b000 0x1000>,
+              <0x7001e000 0x1000>,
+              <0x7001f000 0x1000>;
+        clocks = <&tegra_car TEGRA210_CLK_EMC>;
+        clock-names = "emc";
+        interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
+        nvidia,memory-controller = <&mc>;
+        nvidia,use-ram-code;
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        emc-table@0 {
+            reg = <0>;
+            nvidia,ram-code = <0x0>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            emc-table@40800 {
+                reg = <40800>;
+                compatible = "nvidia,tegra21-emc-table";
+                nvidia,revision = <0x07>;
+                nvidia,dvfs-version = "04_40800_03_V9.8.7_V1.6";
+                clock-frequency = <40800>;
+                nvidia,emc-min-mv = <800>;
+                nvidia,gk20a-min-mv = <1100>;
+                nvidia,source = "pllp_out0";
+                nvidia,src-sel-reg = <0x40188012>;
+                nvidia,needs-training = <0x00000000>;
+                nvidia,training_pattern = <0x00000000>;
+                nvidia,trained = <0x00000000>;
+                nvidia,periodic_training = <0x00000000>;
+                nvidia,trained_dram_clktree_c0d0u0 = <0x00000000>;
+                nvidia,trained_dram_clktree_c0d0u1 = <0x00000000>;
+                nvidia,trained_dram_clktree_c0d1u0 = <0x00000000>;
+                nvidia,trained_dram_clktree_c0d1u1 = <0x00000000>;
+                nvidia,trained_dram_clktree_c1d0u0 = <0x00000000>;
+                nvidia,trained_dram_clktree_c1d0u1 = <0x00000000>;
+                nvidia,trained_dram_clktree_c1d1u0 = <0x00000000>;
+                nvidia,trained_dram_clktree_c1d1u1 = <0x00000000>;
+                nvidia,current_dram_clktree_c0d0u0 = <0x00000000>;
+                nvidia,current_dram_clktree_c0d0u1 = <0x00000000>;
+                nvidia,current_dram_clktree_c0d1u0 = <0x00000000>;
+                nvidia,current_dram_clktree_c0d1u1 = <0x00000000>;
+                nvidia,current_dram_clktree_c1d0u0 = <0x00000000>;
+                nvidia,current_dram_clktree_c1d0u1 = <0x00000000>;
+                nvidia,current_dram_clktree_c1d1u0 = <0x00000000>;
+                nvidia,current_dram_clktree_c1d1u1 = <0x00000000>;
+                nvidia,run_clocks = <0x00000003>;
+                nvidia,tree_margin = <0x00000001>;
+                nvidia,burst-regs-num = <221>;
+                nvidia,burst-regs-per-ch-num = <8>;
+                nvidia,trim-regs-num = <138>;
+                nvidia,trim-regs-per-ch-num = <10>;
+                nvidia,burst-mc-regs-num = <33>;
+                nvidia,la-scale-regs-num = <24>;
+                nvidia,vref-regs-num = <4>;
+                nvidia,training-mod-regs-num = <20>;
+                nvidia,dram-timing-regs-num = <5>;
+                nvidia,min-mrs-wait = <0x00000015>;
+                nvidia,emc-mrw = <0x08010004>;
+                nvidia,emc-mrw2 = <0x08020000>;
+                nvidia,emc-mrw3 = <0x080d0000>;
+                nvidia,emc-mrw4 = <0xc0000000>;
+                nvidia,emc-mrw9 = <0x0c0e7272>;
+                nvidia,emc-mrs = <0x00000000>;
+                nvidia,emc-emrs = <0x00000000>;
+                nvidia,emc-emrs2 = <0x00000000>;
+                nvidia,emc-auto-cal-config = <0xa01a51d8>;
+                nvidia,emc-auto-cal-config2 = <0x05500000>;
+                nvidia,emc-auto-cal-config3 = <0x00770000>;
+                nvidia,emc-auto-cal-config4 = <0x00770000>;
+                nvidia,emc-auto-cal-config5 = <0x00770000>;
+                nvidia,emc-auto-cal-config6 = <0x00770000>;
+                nvidia,emc-auto-cal-config7 = <0x00770000>;
+                nvidia,emc-auto-cal-config8 = <0x00770000>;
+                nvidia,emc-cfg-2 = <0x00110805>;
+                nvidia,emc-sel-dpd-ctrl = <0x00040008>;
+                nvidia,emc-fdpd-ctrl-cmd-no-ramp = <0x00000001>;
+                nvidia,dll-clk-src = <0x40188012>;
+                nvidia,clk-out-enb-x-0-clk-enb-emc-dll = <0x00000001>;
+                nvidia,emc-clock-latency-change = <0x00005172>;
+                nvidia,ptfv = <
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x0000000a
+                    0x0000000a
+                    0x0000000a
+                    0x00000001
+                >;
+                nvidia,emc-registers = <
+                    0x0000000c
+                    0x00000008
+                    0x00000004
+                    0x00000000
+                    0x00000000
+                    0x00000008
+                    0x00000004
+                    0x0000000a
+                    0x0000000d
+                    0x00000008
+                    0x0000000b
+                    0x00000000
+                    0x00000004
+                    0x00000020
+                    0x00000006
+                    0x00000006
+                    0x00000006
+                    0x00000003
+                    0x00000000
+                    0x00000006
+                    0x00000004
+                    0x00000002
+                    0x00000000
+                    0x00000004
+                    0x00000008
+                    0x0000000d
+                    0x00000005
+                    0x00000005
+                    0x00000000
+                    0x00000000
+                    0x00000004
+                    0x08037171
+                    0x0000000a
+                    0x00000000
+                    0x0000000a
+                    0x00010001
+                    0x00000011
+                    0x00000013
+                    0x00000015
+                    0x00000011
+                    0x00000013
+                    0x0000009a
+                    0x00000000
+                    0x00000026
+                    0x00000008
+                    0x00000008
+                    0x00000003
+                    0x00000003
+                    0x00000003
+                    0x00000014
+                    0x00000005
+                    0x00000002
+                    0x0000000d
+                    0x00000008
+                    0x00000008
+                    0x00000005
+                    0x00000005
+                    0x00000004
+                    0x00000008
+                    0x00000004
+                    0x00000004
+                    0x00000009
+                    0x48037171
+                    0x000000a0
+                    0x00000000
+                    0x9160a00d
+                    0x00003bbf
+                    0x002c00a0
+                    0x00008000
+                    0x000000be
+                    0x0fff0fff
+                    0x0fff0fff
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x080b0000
+                    0x00120010
+                    0x00120011
+                    0x00280027
+                    0x0025002a
+                    0x002a002a
+                    0x00260026
+                    0x00000000
+                    0x00000000
+                    0x00280027
+                    0x0025002a
+                    0x002a002a
+                    0x00260026
+                    0x00000000
+                    0x00000000
+                    0x00100010
+                    0x00120012
+                    0x00110011
+                    0x00120012
+                    0x00000010
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x8020221f
+                    0x0220f40f
+                    0x00000012
+                    0x00064000
+                    0x00090029
+                    0x00290015
+                    0x000b000a
+                    0xc1e00302
+                    0x1f13412f
+                    0x00010014
+                    0x00000804
+                    0x00000550
+                    0xf3200000
+                    0x0fff0fff
+                    0x0000023a
+                    0x00000009
+                    0x00000000
+                    0x00000000
+                    0x00000012
+                    0x00000012
+                    0x00020000
+                    0x00050037
+                    0x00000000
+                    0x00000010
+                    0x00003000
+                    0x0a000000
+                    0x02000111
+                    0x00000008
+                    0x00030808
+                    0x00015c00
+                    0x00100404
+                    0x00001600
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000034
+                    0x00000040
+                    0x10000000
+                    0x08000000
+                    0x10000000
+                    0x08000000
+                    0x00000000
+                    0x00000000
+                    0x00000020
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0xefffefff
+                    0xc0c0c0c0
+                    0xc0c0c0c0
+                    0xdcdcdcdc
+                    0x0a0a0a0a
+                    0x0a0a0a0a
+                    0x0a0a0a0a
+                    0x0118600b
+                    0x00000000
+                    0x00000000
+                    0x00000013
+                    0x00000009
+                    0x00000015
+                    0x08161414
+                    0x00000011
+                    0x00010001
+                    0x00009080
+                    0x07070404
+                    0x00040014
+                    0x0513801f
+                    0x1f101100
+                    0x00000014
+                    0x00107240
+                    0x01124000
+                    0x01125b6a
+                    0x0f081000
+                    0x00105800
+                    0x1110fc00
+                    0x0f081300
+                    0x00105800
+                    0x1114fc00
+                    0x07000300
+                    0x00107240
+                    0x55553c5a
+                    0x48161414
+                >;
+                nvidia,emc-burst-regs-per-ch = <
+                    0x880c7272
+                    0x880c7272
+                    0x480c7272
+                    0x480c7272
+                    0x8c0e7272
+                    0x8c0e7272
+                    0x4c0e7272
+                    0x4c0e7272
+                >;
+                nvidia,emc-shadow-regs-ca-train = <
+                    0x0000000c
+                    0x00000008
+                    0x00000004
+                    0x00000000
+                    0x00000000
+                    0x00000008
+                    0x00000004
+                    0x0000000a
+                    0x0000000d
+                    0x00000008
+                    0x0000000b
+                    0x00000000
+                    0x00000004
+                    0x00000020
+                    0x00000006
+                    0x00000006
+                    0x00000006
+                    0x00000003
+                    0x00000000
+                    0x00000006
+                    0x00000004
+                    0x00000002
+                    0x00000000
+                    0x00000004
+                    0x00000008
+                    0x0000000d
+                    0x00000005
+                    0x00000005
+                    0x00000000
+                    0x00000000
+                    0x00000004
+                    0x08037171
+                    0x0000000a
+                    0x00000000
+                    0x0000000a
+                    0x00010001
+                    0x00000011
+                    0x00000013
+                    0x00000015
+                    0x00000011
+                    0x00000013
+                    0x0000009a
+                    0x00000000
+                    0x00000026
+                    0x00000008
+                    0x00000008
+                    0x00000003
+                    0x00000003
+                    0x00000003
+                    0x00000014
+                    0x00000005
+                    0x00000002
+                    0x0000000d
+                    0x00000008
+                    0x00000008
+                    0x00000005
+                    0x00000005
+                    0x00000004
+                    0x00000008
+                    0x00000004
+                    0x00000004
+                    0x00000009
+                    0x48037171
+                    0x000000a0
+                    0x00000000
+                    0x9960a00d
+                    0x00003bbf
+                    0x002c00a0
+                    0x00008000
+                    0x00000055
+                    0x0fff0fff
+                    0x0fff0fff
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x080b0000
+                    0x00120010
+                    0x00120011
+                    0x00280027
+                    0x0025002a
+                    0x002a002a
+                    0x00260026
+                    0x00000000
+                    0x00000000
+                    0x00280027
+                    0x0025002a
+                    0x002a002a
+                    0x00260026
+                    0x00000000
+                    0x00000000
+                    0x00100010
+                    0x00120012
+                    0x00110011
+                    0x00120012
+                    0x00000010
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x8020221f
+                    0x0220f40f
+                    0x00000012
+                    0x00064000
+                    0x00090029
+                    0x00290015
+                    0x000b000a
+                    0xc1e00302
+                    0x1f13412f
+                    0x00010014
+                    0x00000804
+                    0x00000550
+                    0xf3200000
+                    0x0fff0fff
+                    0x0000023a
+                    0x00000009
+                    0x00000000
+                    0x00000000
+                    0x00000012
+                    0x00000012
+                    0x00020000
+                    0x05058033
+                    0x05050000
+                    0x00000000
+                    0x00003000
+                    0x0a000000
+                    0x02000111
+                    0x00000008
+                    0x00030808
+                    0x00015c00
+                    0x00100404
+                    0x00001600
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000034
+                    0x00000040
+                    0x10000000
+                    0x08000000
+                    0x10000000
+                    0x08000000
+                    0x00000000
+                    0x00000000
+                    0x00000020
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0xefffefff
+                    0xc0c0c0c0
+                    0xc0c0c0c0
+                    0xdcdcdcdc
+                    0x0a0a0a0a
+                    0x0a0a0a0a
+                    0x0a0a0a0a
+                    0x0118600b
+                    0x00000001
+                    0x0000001f
+                    0x00000013
+                    0x00000003
+                    0x00000015
+                    0x08161414
+                    0x0000000b
+                    0x00010001
+                    0x00019080
+                    0x07070404
+                    0x00040014
+                    0x0513801f
+                    0x1f101100
+                    0x00000014
+                    0x00107240
+                    0x01124000
+                    0x01125b6a
+                    0x0f081000
+                    0x00105800
+                    0x1110fc00
+                    0x0f081300
+                    0x00105800
+                    0x1114fc00
+                    0x07000300
+                    0x00107240
+                    0x55553c5a
+                    0x48161414
+                >;
+                nvidia,emc-shadow-regs-quse-train = <
+                    0x0000000c
+                    0x00000008
+                    0x00000004
+                    0x00000000
+                    0x00000000
+                    0x00000008
+                    0x00000004
+                    0x00000009
+                    0x0000000d
+                    0x00000008
+                    0x0000000b
+                    0x00000000
+                    0x00000004
+                    0x00000020
+                    0x00000006
+                    0x00000006
+                    0x00000006
+                    0x00000003
+                    0x00000000
+                    0x00000006
+                    0x00000004
+                    0x00000002
+                    0x00000000
+                    0x00000004
+                    0x00000008
+                    0x0000000d
+                    0x00000002
+                    0x00000002
+                    0x00000000
+                    0x00000000
+                    0x00000005
+                    0x08037171
+                    0x00000008
+                    0x00000001
+                    0x80000000
+                    0x00010002
+                    0x00000011
+                    0x00000013
+                    0x00000015
+                    0x00000011
+                    0x00000013
+                    0x0000009a
+                    0x00000000
+                    0x00000026
+                    0x00000008
+                    0x00000008
+                    0x00000003
+                    0x00000003
+                    0x00000003
+                    0x00000014
+                    0x00000005
+                    0x00000002
+                    0x0000000d
+                    0x00000008
+                    0x00000008
+                    0x00000005
+                    0x00000005
+                    0x00000004
+                    0x00000008
+                    0x00000004
+                    0x00000004
+                    0x00000009
+                    0x48037171
+                    0x000000a0
+                    0x00000000
+                    0x9160400d
+                    0x00003bbf
+                    0x002c00a0
+                    0x00008000
+                    0x000000be
+                    0x0fff0fff
+                    0x0fff0fff
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x080b0000
+                    0x00120010
+                    0x00120011
+                    0x00280027
+                    0x0025002a
+                    0x002a002a
+                    0x00260026
+                    0x00000000
+                    0x00000000
+                    0x00280027
+                    0x0025002a
+                    0x002a002a
+                    0x00260026
+                    0x00000000
+                    0x00000000
+                    0x00100010
+                    0x00120012
+                    0x00110011
+                    0x00120012
+                    0x00000010
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x8020221f
+                    0x0220f40f
+                    0x00000012
+                    0x00064000
+                    0x00090029
+                    0x00290015
+                    0x000b000a
+                    0xc1e00302
+                    0x1f13412f
+                    0x00010014
+                    0x00000804
+                    0x00000550
+                    0xf3200000
+                    0x0fff0fff
+                    0x0000023a
+                    0x00000009
+                    0x00000000
+                    0x00000000
+                    0x00000012
+                    0x00000012
+                    0x30020000
+                    0x00058037
+                    0x00000000
+                    0x00000010
+                    0x00003000
+                    0x0a000000
+                    0x02000111
+                    0x00000008
+                    0x00030808
+                    0x00015c00
+                    0x00100404
+                    0x00001600
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000034
+                    0x00000040
+                    0x10000000
+                    0x08000000
+                    0x10000000
+                    0x08000000
+                    0x00000000
+                    0x00000000
+                    0x00000020
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0xefffefff
+                    0xc0c0c0c0
+                    0xc0c0c0c0
+                    0xdcdcdcdc
+                    0x0a0a0a0a
+                    0x0a0a0a0a
+                    0x0a0a0a0a
+                    0x0118600b
+                    0x00000001
+                    0x0000001f
+                    0x0000001d
+                    0x00000013
+                    0x0000001f
+                    0x08161414
+                    0x0000001b
+                    0x00010002
+                    0x00009080
+                    0x07070404
+                    0x00040014
+                    0x0513801f
+                    0x1f101100
+                    0x00000014
+                    0x00107240
+                    0x01124000
+                    0x01125b6a
+                    0x0f081000
+                    0x00105800
+                    0x1110fc00
+                    0x0f081300
+                    0x00105800
+                    0x1114fc00
+                    0x07000300
+                    0x00107240
+                    0x55553c5a
+                    0x48161414
+                >;
+                nvidia,emc-shadow-regs-rdwr-train = <
+                    0x0000000c
+                    0x00000008
+                    0x00000004
+                    0x00000000
+                    0x00000000
+                    0x00000008
+                    0x00000004
+                    0x0000000d
+                    0x0000000d
+                    0x00000008
+                    0x0000000b
+                    0x00000000
+                    0x00000004
+                    0x00000020
+                    0x00000006
+                    0x00000006
+                    0x00000006
+                    0x00000003
+                    0x00000013
+                    0x00000006
+                    0x00000004
+                    0x00000002
+                    0x00000000
+                    0x00000004
+                    0x00000008
+                    0x0000000d
+                    0x00000005
+                    0x00000005
+                    0x00000000
+                    0x30000002
+                    0x00000004
+                    0x08037171
+                    0x0000000a
+                    0x00000000
+                    0x0000000a
+                    0x00010001
+                    0x00000011
+                    0x00000013
+                    0x00000015
+                    0x00000011
+                    0x00000013
+                    0x0000009a
+                    0x00000000
+                    0x00000026
+                    0x00000008
+                    0x00000008
+                    0x00000003
+                    0x00000003
+                    0x00000003
+                    0x00000014
+                    0x00000005
+                    0x00000002
+                    0x0000000d
+                    0x00000008
+                    0x00000008
+                    0x00000005
+                    0x00000005
+                    0x00000004
+                    0x00000008
+                    0x00000004
+                    0x00000004
+                    0x00000009
+                    0x48037171
+                    0x000000a0
+                    0x00000000
+                    0x9160a00d
+                    0x00003bbf
+                    0x002c00a0
+                    0x00008000
+                    0x000000be
+                    0x0fff0fff
+                    0x0fff0fff
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x080b0000
+                    0x00120010
+                    0x00120011
+                    0x00280027
+                    0x0025002a
+                    0x002a002a
+                    0x00260026
+                    0x00000000
+                    0x00000000
+                    0x00280027
+                    0x0025002a
+                    0x002a002a
+                    0x00260026
+                    0x00000000
+                    0x00000000
+                    0x00100010
+                    0x00120012
+                    0x00110011
+                    0x00120012
+                    0x00000010
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x8020221f
+                    0x0220f40f
+                    0x00000012
+                    0x00064000
+                    0x00090029
+                    0x00290015
+                    0x000b000a
+                    0xc1e00302
+                    0x1f13412f
+                    0x00010014
+                    0x00000804
+                    0x00000550
+                    0xf3200000
+                    0x0fff0fff
+                    0x0000023a
+                    0x00000009
+                    0x00000000
+                    0x00000000
+                    0x00000012
+                    0x00000012
+                    0x00020000
+                    0x00050037
+                    0x00000000
+                    0x00000010
+                    0x00003000
+                    0x0a000000
+                    0x02000111
+                    0x00000008
+                    0x00030808
+                    0x00015c00
+                    0x00100404
+                    0x00001600
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000034
+                    0x00000040
+                    0x10000000
+                    0x08000000
+                    0x10000000
+                    0x08000000
+                    0x00000000
+                    0x00000000
+                    0x00000020
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0xefffefff
+                    0xc0c0c0c0
+                    0xc0c0c0c0
+                    0xdcdcdcdc
+                    0x0a0a0a0a
+                    0x0a0a0a0a
+                    0x0a0a0a0a
+                    0x0118600b
+                    0x00000001
+                    0x00000000
+                    0x00000013
+                    0x00000009
+                    0x00000015
+                    0x08161414
+                    0x00000011
+                    0x00010001
+                    0x0000b080
+                    0x07070404
+                    0x00040014
+                    0x0513801f
+                    0x1f101100
+                    0x00000014
+                    0x00107240
+                    0x01124000
+                    0x01125b6a
+                    0x0f081000
+                    0x00105800
+                    0x1110fc00
+                    0x0f081300
+                    0x00105800
+                    0x1114fc00
+                    0x07000300
+                    0x00107240
+                    0x55553c5a
+                    0x48161414
+                >;
+                nvidia,emc-trim-regs = <
+                    0x00280028
+                    0x00280028
+                    0x00280028
+                    0x00280028
+                    0x00280028
+                    0x00280028
+                    0x00280028
+                    0x00280028
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x11111111
+                    0x11111111
+                    0x28282828
+                    0x28282828
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00120010
+                    0x00120011
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                >;
+                nvidia,emc-trim-regs-per-ch = <
+                    0x00000000
+                    0x00000000
+                    0x00249249
+                    0x00249249
+                    0x00249249
+                    0x00249249
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                >;
+                nvidia,emc-vref-regs = <
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                >;
+                nvidia,emc-dram-timing-regs = <
+                    0x00000049
+                    0x00000104
+                    0x000000b4
+                    0x0000007a
+                    0x00000006
+                >;
+                nvidia,emc-training-mod-regs = <
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                >;
+                nvidia,emc-save-restore-mod-regs = <
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                    0x00000000
+                >;
+                nvidia,emc-burst-mc-regs = <
+                    0x40020001
+                    0x80000013
+                    0x000a1020
+                    0x80001028
+                    0x00000001
+                    0x00000000
+                    0x00000002
+                    0x00000000
+                    0x00000001
+                    0x00000001
+                    0x00000002
+                    0x00000005
+                    0x00000002
+                    0x00000001
+                    0x00000004
+                    0x00000008
+                    0x00000005
+                    0x00000000
+                    0x02020001
+                    0x00030201
+                    0x72c30303
+                    0x70000f0f
+                    0x00000000
+                    0x001f0000
+                    0x0080001a
+                    0x0080001a
+                    0x0080001a
+                    0x0080001a
+                    0x0080001a
+                    0x0080001a
+                    0x0080001a
+                    0x0080001a
+                    0x0080001a
+                >;
+                nvidia,emc-la-scale-regs = <
+                    0x00000006
+                    0x0080001a
+                    0x00000076
+                    0x00ff00ff
+                    0x00ff00ff
+                    0x00ff00ff
+                    0x00ff00ff
+                    0x00ff003d
+                    0x00ff00ff
+                    0x00ff003d
+                    0x00ff0049
+                    0x00ff0080
+                    0x00ff0004
+                    0x000800ff
+                    0x000000ff
+                    0x00ff0004
+                    0x00ff00ff
+                    0x00ff00ff
+                    0x00ff00ff
+                    0x00ff00ff
+                    0x00ff00ff
+                    0x000000ff
+                    0x000000ff
+                    0x00ff00ff
+                    >;
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.yaml
index bc8477e7ab193b7880bb681037985f3fccebf02f..78e3417d273a329b77bf2f61de41b29017be56d3 100644
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.yaml
@@ -44,6 +44,44 @@ properties:
     description:
       phandle of the memory controller node
 
+  nvidia,use-ram-code:
+    description:
+      If set, timings are split per ram code and expected to be in
+      subnodes per ram-code
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^emc-table@[0-9]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      reg:
+        maxItems: 1
+        description:
+          Ram code for this timing set
+
+      nvidia,ram-code:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          value of the RAM_CODE field in the PMC_STRAPPING_OPT_A register that
+          this timing set is used for
+
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+    required:
+      - reg
+      - nvidia,ram-code
+
+
 required:
   - compatible
   - reg

-- 
2.48.1




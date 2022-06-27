Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5276D55D418
	for <lists+linux-tegra@lfdr.de>; Tue, 28 Jun 2022 15:13:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237100AbiF0OVG (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 27 Jun 2022 10:21:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237007AbiF0OUo (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 27 Jun 2022 10:20:44 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B5521117C;
        Mon, 27 Jun 2022 07:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
        s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=NHTxT9CAiJj2gbRGVeeqrWMrGzmcW4tqRGY+AMcH9+4=; b=m7HUDgbHBC6MMxNSs17c7OIzoC
        l2Q3Zy+T8LZ6sN6Uy4vzx6hMtEYDKjWcTgSmd4Z4t/HJPHLUVaOOc0lDxIZk0pHSEm3CZVm93SMfO
        a1sIud2+Z4qulbt5TOVSv93zmwtu6YlWnReksGy+/wWiYvHaLgmL7gHPeW89ma2KdyHQVQzdNB9XB
        q2AjZ3BMFQVorSSct1PTLm1lP5HNydUQE3QqK0Cdw1FH4rfCwPJ7iXd1xsxws4ckVwHCwN81a2d+2
        PoR8n4rzyNyx42Samt70GUwNFnY9GM321o9m2ct/mrTR9HTVWk5FGlpAH6NrutUdNKCeY3Z7mZqb8
        MUvUxFCg==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <cyndis@kapsi.fi>)
        id 1o5pbN-003N2J-2D; Mon, 27 Jun 2022 17:20:31 +0300
From:   Mikko Perttunen <cyndis@kapsi.fi>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>
Cc:     Mikko Perttunen <mperttunen@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Robin Murphy <robin.murphy@arm.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7/v3 11/22] dt-bindings: Add headers for Host1x and VIC on Tegra234
Date:   Mon, 27 Jun 2022 17:19:57 +0300
Message-Id: <20220627142008.2072474-12-cyndis@kapsi.fi>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627142008.2072474-1-cyndis@kapsi.fi>
References: <20220627142008.2072474-1-cyndis@kapsi.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Mikko Perttunen <mperttunen@nvidia.com>

Add clock, memory controller, powergate and reset dt-binding headers
for Host1x and VIC on Tegra234.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 include/dt-bindings/clock/tegra234-clock.h     | 4 ++++
 include/dt-bindings/memory/tegra234-mc.h       | 5 +++++
 include/dt-bindings/power/tegra234-powergate.h | 1 +
 include/dt-bindings/reset/tegra234-reset.h     | 1 +
 4 files changed, 11 insertions(+)

diff --git a/include/dt-bindings/clock/tegra234-clock.h b/include/dt-bindings/clock/tegra234-clock.h
index bd4c3086a2da..6e4e5cc75631 100644
--- a/include/dt-bindings/clock/tegra234-clock.h
+++ b/include/dt-bindings/clock/tegra234-clock.h
@@ -38,6 +38,8 @@
  * throughput and memory controller power.
  */
 #define TEGRA234_CLK_EMC			31U
+/** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_HOST1X */
+#define TEGRA234_CLK_HOST1X                     46U
 /** @brief output of gate CLK_ENB_FUSE */
 #define TEGRA234_CLK_FUSE			40U
 /** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_I2C1 */
@@ -132,6 +134,8 @@
 #define TEGRA234_CLK_UARTA			155U
 /** @brief output of gate CLK_ENB_PEX1_CORE_6 */
 #define TEGRA234_CLK_PEX1_C6_CORE		161U
+/** @brief output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_VIC */
+#define TEGRA234_CLK_VIC                        167U
 /** @brief output of gate CLK_ENB_PEX2_CORE_7 */
 #define TEGRA234_CLK_PEX2_C7_CORE		171U
 /** @brief output of gate CLK_ENB_PEX2_CORE_8 */
diff --git a/include/dt-bindings/memory/tegra234-mc.h b/include/dt-bindings/memory/tegra234-mc.h
index e3b0e9da295d..73fdd18523a9 100644
--- a/include/dt-bindings/memory/tegra234-mc.h
+++ b/include/dt-bindings/memory/tegra234-mc.h
@@ -26,6 +26,8 @@
 #define TEGRA234_SID_PCIE8	0x09
 #define TEGRA234_SID_PCIE10	0x0b
 #define TEGRA234_SID_BPMP	0x10
+#define TEGRA234_SID_HOST1X	0x27
+#define TEGRA234_SID_VIC	0x34
 
 /*
  * memory client IDs
@@ -33,6 +35,7 @@
 
 /* High-definition audio (HDA) read clients */
 #define TEGRA234_MEMORY_CLIENT_HDAR 0x15
+#define TEGRA234_MEMORY_CLIENT_HOST1XDMAR 0x16
 /* PCIE6 read clients */
 #define TEGRA234_MEMORY_CLIENT_PCIE6AR 0x28
 /* PCIE6 write clients */
@@ -65,6 +68,8 @@
 #define TEGRA234_MEMORY_CLIENT_SDMMCRAB 0x63
 /* sdmmcd memory write client */
 #define TEGRA234_MEMORY_CLIENT_SDMMCWAB 0x67
+#define TEGRA234_MEMORY_CLIENT_VICSRD 0x6c
+#define TEGRA234_MEMORY_CLIENT_VICSWR 0x6d
 /* BPMP read client */
 #define TEGRA234_MEMORY_CLIENT_BPMPR 0x93
 /* BPMP write client */
diff --git a/include/dt-bindings/power/tegra234-powergate.h b/include/dt-bindings/power/tegra234-powergate.h
index f610eee9bce8..c3f7e380d2c6 100644
--- a/include/dt-bindings/power/tegra234-powergate.h
+++ b/include/dt-bindings/power/tegra234-powergate.h
@@ -18,5 +18,6 @@
 #define TEGRA234_POWER_DOMAIN_MGBEA	17U
 #define TEGRA234_POWER_DOMAIN_MGBEB	18U
 #define TEGRA234_POWER_DOMAIN_MGBEC	19U
+#define TEGRA234_POWER_DOMAIN_VIC       29U
 
 #endif
diff --git a/include/dt-bindings/reset/tegra234-reset.h b/include/dt-bindings/reset/tegra234-reset.h
index 547ca3b60caa..1971400bf360 100644
--- a/include/dt-bindings/reset/tegra234-reset.h
+++ b/include/dt-bindings/reset/tegra234-reset.h
@@ -44,6 +44,7 @@
 #define TEGRA234_RESET_QSPI1			77U
 #define TEGRA234_RESET_SDMMC4			85U
 #define TEGRA234_RESET_UARTA			100U
+#define TEGRA234_RESET_VIC                      113U
 #define TEGRA234_RESET_PEX0_CORE_0		116U
 #define TEGRA234_RESET_PEX0_CORE_1		117U
 #define TEGRA234_RESET_PEX0_CORE_2		118U
-- 
2.36.1


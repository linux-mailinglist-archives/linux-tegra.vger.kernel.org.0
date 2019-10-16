Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41D83D91CD
	for <lists+linux-tegra@lfdr.de>; Wed, 16 Oct 2019 14:59:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393385AbfJPM7g (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 16 Oct 2019 08:59:36 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:34298 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391299AbfJPM7f (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 16 Oct 2019 08:59:35 -0400
Received: by mail-wr1-f67.google.com with SMTP id j11so27969109wrp.1;
        Wed, 16 Oct 2019 05:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GiGVlT3amUluWFhV5mgXhFbiuGIjTDqdR+S/p6Vc5yg=;
        b=ukiaQEu0d3ygaSoUACTY+wIVVPm7IBS2wB00kP8lhkJhk74+b7bJ2BTiZIrZC9ELBA
         RNhweyb1lXHZt4nOjRkv5PvjPjy8r9sz1PNMGmNTpDOzWU4WAcd0ISSxkLuekjfqrMKh
         P5nGV45Zu9wfwqe8EzP9dt30310E/4CwwI+uFnZiKsn02rJY0jqRii4uiEu5pDJncEdp
         840yGTWt3WOhYT7zdsRLPR6dgJ5UA8XoszW5SII4I1vERdCMvgmtnVHXLF84hSZl6N7q
         jGIkP03QXUErKj1/F+2ZWInIAAT1UFTFTSb2sStlvdr5Q/kbnDFQYkyAxjL40co+mfjD
         CDmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GiGVlT3amUluWFhV5mgXhFbiuGIjTDqdR+S/p6Vc5yg=;
        b=Jk/x/wZIIsv1EPbjx4PqeVPZlU0JVJL0XipiDH6BmwN8FLljZgPc/t/5WmHpnJ35dD
         W+w1xSoR7ZdNGc4WGznt4ulbQFXARVkCYTGQU3EU0yyGHlQ1QyMcoasgzYjwRN6lGUGn
         NN8gL/knRMESvTeXNfY4skorjUvVs7aV0Ebf1BgUQ6dicg/cgTzsohFn5hegRrifXMqV
         dXQNpvBDnJ9fgu0NE0SPGJDREI3djtvjNm2nmbZy+svVcPLVAx6UpvJxdj9nY86hUx8d
         7y42+ShgSyVTQFiJwih/6Qf7LBlwPi+ABeDRD5rzpYOST7EIrUM/s4BacYIGClaAKH0W
         SXfg==
X-Gm-Message-State: APjAAAVfI2Y7cqKCFJtai0lMQZc3ecoCEAAqllybR917PQIfhHs4QsYx
        RXMy1QEiQYpk99G9AN5ay4g=
X-Google-Smtp-Source: APXvYqzM+KaAZ4Yd5YYXEfe30CDtx86KuAifJcpbaDqwpZCg//FMrO8vwAc6EuUx2CVl0KeshIuJgQ==
X-Received: by 2002:a5d:52c4:: with SMTP id r4mr2499708wrv.168.1571230772563;
        Wed, 16 Oct 2019 05:59:32 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id z1sm7210859wrn.57.2019.10.16.05.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2019 05:59:31 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 5/5] clk: tegra: Reimplement SOR clocks on Tegra210
Date:   Wed, 16 Oct 2019 14:59:19 +0200
Message-Id: <20191016125919.1773898-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191016125919.1773898-1-thierry.reding@gmail.com>
References: <20191016125919.1773898-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

In order to allow the display driver to deal uniformly with all SOR
generations, implement the SOR clocks in a way that is compatible with
Tegra186 and later.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/clk/tegra/clk-tegra210.c         | 71 ++++++++++++++++++------
 include/dt-bindings/clock/tegra210-car.h |  4 +-
 2 files changed, 57 insertions(+), 18 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index 0f0f14781b43..d55f3da4287a 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -33,6 +33,7 @@
 #define CLK_SOURCE_CSITE 0x1d4
 #define CLK_SOURCE_EMC 0x19c
 #define CLK_SOURCE_SOR1 0x410
+#define CLK_SOURCE_SOR0 0x414
 #define CLK_SOURCE_LA 0x1f8
 #define CLK_SOURCE_SDMMC2 0x154
 #define CLK_SOURCE_SDMMC4 0x164
@@ -298,6 +299,7 @@ static DEFINE_SPINLOCK(pll_d_lock);
 static DEFINE_SPINLOCK(pll_e_lock);
 static DEFINE_SPINLOCK(pll_re_lock);
 static DEFINE_SPINLOCK(pll_u_lock);
+static DEFINE_SPINLOCK(sor0_lock);
 static DEFINE_SPINLOCK(sor1_lock);
 static DEFINE_SPINLOCK(emc_lock);
 static DEFINE_MUTEX(lvl2_ovr_lock);
@@ -2551,7 +2553,6 @@ static struct tegra_devclk devclks[] __initdata = {
 	{ .con_id = "pll_c4_out2", .dt_id = TEGRA210_CLK_PLL_C4_OUT2 },
 	{ .con_id = "pll_c4_out3", .dt_id = TEGRA210_CLK_PLL_C4_OUT3 },
 	{ .con_id = "dpaux", .dt_id = TEGRA210_CLK_DPAUX },
-	{ .con_id = "sor0", .dt_id = TEGRA210_CLK_SOR0 },
 };
 
 static struct tegra_audio_clk_info tegra210_audio_plls[] = {
@@ -2915,6 +2916,39 @@ static int tegra210_init_pllu(void)
 	return 0;
 }
 
+/*
+ * The SOR hardware blocks are driven by two clocks: a module clock that is
+ * used to access registers and a pixel clock that is sourced from the same
+ * pixel clock that also drives the head attached to the SOR. The module
+ * clock is typically called sorX (with X being the SOR instance) and the
+ * pixel clock is called sorX_out. The source for the SOR pixel clock is
+ * referred to as the "parent" clock.
+ *
+ * On Tegra186 and newer, clocks are provided by the BPMP. Unfortunately the
+ * BPMP implementation for the SOR clocks doesn't exactly match the above in
+ * some aspects. For example, the SOR module is really clocked by the pad or
+ * sor_safe clocks, but BPMP models the sorX clock as being sourced by the
+ * pixel clocks. Conversely the sorX_out clock is sourced by the sor_safe or
+ * pad clocks on BPMP.
+ *
+ * In order to allow the display driver to deal with all SoC generations in
+ * a unified way, implement the BPMP semantics in this driver.
+ */
+
+static const char * const sor0_parents[] = {
+	"pll_d_out0",
+};
+
+static const char * const sor0_out_parents[] = {
+	"sor_safe", "sor0_pad_clkout",
+};
+
+static const char * const sor1_parents[] = {
+	"pll_p", "pll_d_out0", "pll_d2_out0", "clk_m",
+};
+
+static u32 sor1_parents_idx[] = { 0, 2, 5, 6 };
+
 static const char * const sor1_out_parents[] = {
 	/*
 	 * Bit 0 of the mux selects sor1_pad_clkout, irrespective of bit 1, so
@@ -2923,20 +2957,31 @@ static const char * const sor1_out_parents[] = {
 	 * these bits to 0b11. While not an invalid setting, code should
 	 * always set the bits to 0b01 to select sor1_pad_clkout.
 	 */
-	"sor_safe", "sor1_pad_clkout", "sor1", "sor1_pad_clkout",
-};
-
-static const char * const sor1_parents[] = {
-	"pll_p", "pll_d_out0", "pll_d2_out0", "clk_m",
+	"sor_safe", "sor1_pad_clkout", "sor1_out", "sor1_pad_clkout",
 };
 
-static u32 sor1_parents_idx[] = { 0, 2, 5, 6 };
-
 static struct tegra_periph_init_data tegra210_periph[] = {
+	/*
+	 * On Tegra210, the sor0 clock doesn't have a mux it bitfield 31:29,
+	 * but it is hardwired to the pll_d_out0 clock.
+	 */
+	TEGRA_INIT_DATA_TABLE("sor0", NULL, NULL, sor0_parents,
+			      CLK_SOURCE_SOR0, 29, 0x0, 0, 0, 0, 0,
+			      0, 182, 0, tegra_clk_sor0, NULL, 0,
+			      &sor0_lock),
+	TEGRA_INIT_DATA_TABLE("sor0_out", NULL, NULL, sor0_out_parents,
+			      CLK_SOURCE_SOR0, 14, 0x1, 0, 0, 0, 0,
+			      0, 0, TEGRA_PERIPH_NO_GATE, tegra_clk_sor0_out,
+			      NULL, 0, &sor0_lock),
 	TEGRA_INIT_DATA_TABLE("sor1", NULL, NULL, sor1_parents,
 			      CLK_SOURCE_SOR1, 29, 0x7, 0, 0, 8, 1,
-			      TEGRA_DIVIDER_ROUND_UP, 183, 0, tegra_clk_sor1,
-			      sor1_parents_idx, 0, &sor1_lock),
+			      TEGRA_DIVIDER_ROUND_UP, 183, 0,
+			      tegra_clk_sor1, sor1_parents_idx, 0,
+			      &sor1_lock),
+	TEGRA_INIT_DATA_TABLE("sor1_out", NULL, NULL, sor1_out_parents,
+			      CLK_SOURCE_SOR1, 14, 0x3, 0, 0, 0, 0,
+			      0, 0, TEGRA_PERIPH_NO_GATE,
+			      tegra_clk_sor1_out, NULL, 0, &sor1_lock),
 };
 
 static const char * const la_parents[] = {
@@ -2969,12 +3014,6 @@ static __init void tegra210_periph_clk_init(void __iomem *clk_base,
 					      1, 17, 207);
 	clks[TEGRA210_CLK_DPAUX1] = clk;
 
-	clk = clk_register_mux_table(NULL, "sor1_out", sor1_out_parents,
-				     ARRAY_SIZE(sor1_out_parents), 0,
-				     clk_base + CLK_SOURCE_SOR1, 14, 0x3,
-				     0, NULL, &sor1_lock);
-	clks[TEGRA210_CLK_SOR1_OUT] = clk;
-
 	/* pll_d_dsi_out */
 	clk = clk_register_gate(NULL, "pll_d_dsi_out", "pll_d_out0", 0,
 				clk_base + PLLD_MISC0, 21, 0, &pll_d_lock);
diff --git a/include/dt-bindings/clock/tegra210-car.h b/include/dt-bindings/clock/tegra210-car.h
index 70308a568c6c..be9e649c1e90 100644
--- a/include/dt-bindings/clock/tegra210-car.h
+++ b/include/dt-bindings/clock/tegra210-car.h
@@ -308,7 +308,7 @@
 #define TEGRA210_CLK_CLK_OUT_2 278
 #define TEGRA210_CLK_CLK_OUT_3 279
 #define TEGRA210_CLK_BLINK 280
-/* 281 */
+#define TEGRA210_CLK_SOR0_OUT 281
 #define TEGRA210_CLK_SOR1_OUT 282
 /* 283 */
 #define TEGRA210_CLK_XUSB_HOST_SRC 284
@@ -390,7 +390,7 @@
 #define TEGRA210_CLK_CLK_OUT_3_MUX 358
 #define TEGRA210_CLK_DSIA_MUX 359
 #define TEGRA210_CLK_DSIB_MUX 360
-#define TEGRA210_CLK_SOR0_OUT 361
+/* 361 */
 #define TEGRA210_CLK_XUSB_SS_DIV2 362
 
 #define TEGRA210_CLK_PLL_M_UD 363
-- 
2.23.0


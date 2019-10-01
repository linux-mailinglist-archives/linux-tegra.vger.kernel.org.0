Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C542C4260
	for <lists+linux-tegra@lfdr.de>; Tue,  1 Oct 2019 23:14:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727546AbfJAVOF (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 1 Oct 2019 17:14:05 -0400
Received: from avon.wwwdotorg.org ([104.237.132.123]:40738 "EHLO
        avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725941AbfJAVOF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 1 Oct 2019 17:14:05 -0400
Received: from swarren-lx1.nvidia.com (unknown [216.228.112.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by avon.wwwdotorg.org (Postfix) with ESMTPSA id 554FC1C0CBE;
        Tue,  1 Oct 2019 15:14:04 -0600 (MDT)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.100.3 at avon.wwwdotorg.org
From:   Stephen Warren <swarren@wwwdotorg.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH 3/4] ARM: tegra: modify reshift divider during LP1
Date:   Tue,  1 Oct 2019 15:13:45 -0600
Message-Id: <20191001211346.104400-3-swarren@wwwdotorg.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191001211346.104400-1-swarren@wwwdotorg.org>
References: <20191001211346.104400-1-swarren@wwwdotorg.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren@nvidia.com>

The reshift hardware module implements the RAM re-repair process. This
module uses PLLP as an input clock during LP1 resume. The input divider
for this clock is typically set for PLLP's normal rate. During LP1
resume, PLLP is bypassed and so runs at the crystal rate, which is much
slower. Consequently, decrease the divider so that the reshift module
runs at a reasonable rate during LP1 resume.

NVIDIA's downstream kernel code only does this if not compiled for
Tegra30, so the added code is made conditional upon the chip ID.

Signed-off-by: Stephen Warren <swarren@nvidia.com>
---
 arch/arm/mach-tegra/sleep-tegra30.S | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/mach-tegra/sleep-tegra30.S b/arch/arm/mach-tegra/sleep-tegra30.S
index 6922dd8d3e2d..6191f9456288 100644
--- a/arch/arm/mach-tegra/sleep-tegra30.S
+++ b/arch/arm/mach-tegra/sleep-tegra30.S
@@ -59,6 +59,9 @@
 #define CLK_RESET_PLLX_MISC3_IDDQ	3
 #define CLK_RESET_PLLM_MISC_IDDQ	5
 #define CLK_RESET_PLLC_MISC_IDDQ	26
+#define CLK_RESET_PLLP_RESHIFT		0x528
+#define CLK_RESET_PLLP_RESHIFT_DEFAULT	0x3b
+#define CLK_RESET_PLLP_RESHIFT_ENABLE	0x3
 
 #define CLK_RESET_CLK_SOURCE_MSELECT	0x3b4
 
@@ -373,9 +376,13 @@ _pll_m_c_x_done:
 	tegra_get_soc_id TEGRA_APB_MISC_BASE, r1
 	cmp	r1, #TEGRA30
 	beq	1f
+
 	ldr	r1, [r0, #CLK_RESET_PLLP_BASE]
 	bic	r1, r1, #(1<<31)	@ disable PllP bypass
 	str	r1, [r0, #CLK_RESET_PLLP_BASE]
+
+	mov	r1, #CLK_RESET_PLLP_RESHIFT_DEFAULT
+	str	r1, [r0, #CLK_RESET_PLLP_RESHIFT]
 1:
 
 	mov32	r7, TEGRA_TMRUS_BASE
@@ -644,6 +651,10 @@ tegra30_switch_cpu_to_clk32k:
 	orrne	r0, r0, #(1 << 31)	@ enable PllP bypass on fast cluster
 	bic	r0, r0, #(1 << 30)
 	str	r0, [r5, #CLK_RESET_PLLP_BASE]
+	beq	1f
+	mov	r0, #CLK_RESET_PLLP_RESHIFT_ENABLE
+	str	r0, [r5, #CLK_RESET_PLLP_RESHIFT]
+1:
 	ldr	r0, [r5, #CLK_RESET_PLLA_BASE]
 	bic	r0, r0, #(1 << 30)
 	str	r0, [r5, #CLK_RESET_PLLA_BASE]
-- 
2.23.0


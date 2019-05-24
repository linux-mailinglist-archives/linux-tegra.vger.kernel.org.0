Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EFFB229AF1
	for <lists+linux-tegra@lfdr.de>; Fri, 24 May 2019 17:24:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389292AbfEXPYk (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 24 May 2019 11:24:40 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:41175 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389079AbfEXPYk (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 24 May 2019 11:24:40 -0400
Received: by mail-lf1-f67.google.com with SMTP id d8so7449639lfb.8;
        Fri, 24 May 2019 08:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GN9nuHtiTFnfZPIZDBZSG3kB03wYqWWyvFoSaQwH3UY=;
        b=MXGnnJ2DKwFyr8QRx9KLmVNvfv8aCcdXRVuI8G3ScRFRAOpSUcCtbJowiM7sFtJKPX
         FvmFV7wQefjLLwK6AGdS1ESL+IRb5WK0TMXVdrXrWl80SjrVTBQI+Zo4LizKLOhPJv0h
         3CsO+FcLix2Da6p5ZWvvLH2h6gw/H43Mn1xVmMy45zZNJvBJE+8r6rzd+sXRdUcQHQX4
         m8gIj/07Dsg46/5UNBPkOD7PS+Mta+bCZtZ3qWmQnAfu38q3HGEDELypvD1RQof9i+ko
         PLWNhd0xZIMiScIvw0W4IlmtRtOs/pOeC6XiOIEHFrDtwkSYNvaVuM5OQk463XRkZBTk
         A5rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GN9nuHtiTFnfZPIZDBZSG3kB03wYqWWyvFoSaQwH3UY=;
        b=r+g25uhnxLNuWmXiKhAcygAKflPGNfuI+xNYXc4DhOzbomm8cGf4u2C8aWpyfRGW3S
         qFZHAZgnDYd8GaWcgWf5+/Drq6I3j3Hm0FSHOP5a4tebpzptgMywsSbRLQGP0dvnIMU0
         dvXVhP9VmYhU8TlQ9OPzMEjWk7gtntSkhC1WPiluBrJQJumf4RwUYsREyB4+QJgfaXM2
         IRd8ljgPP3xzdhGs4CH7uUvPsn6JSfFVq0kzWEdbFRuVluGLTf1TS3Re4xyra6McOvom
         Y2pG60wZECRIRJGKYQbXVdzfRqUW3Ocj9ydXj1T4UnuLwr145+BEBXHy41YGJEgT5pCB
         7LNQ==
X-Gm-Message-State: APjAAAUlTJZy53DpEeWDq+mNcjyNjJ/v1ur/cP4PEIgkbmHJQIBs0njQ
        YUJvqGFGGaMj4hpwMcaNFTs=
X-Google-Smtp-Source: APXvYqyWf6Rj6v3RA35W6xThBHKEM7X7i+gsy1Q/5lbmOpJkU77SM5fmNtfYonG/99VCQeEh8FvO0w==
X-Received: by 2002:ac2:599b:: with SMTP id w27mr315914lfn.184.1558711457469;
        Fri, 24 May 2019 08:24:17 -0700 (PDT)
Received: from localhost.localdomain ([94.29.35.141])
        by smtp.gmail.com with ESMTPSA id i187sm683522lfe.64.2019.05.24.08.24.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 24 May 2019 08:24:16 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 RE-SEND] ARM: dts: tegra124: nyan-big: Add timings for ram codes 4 and 6
Date:   Fri, 24 May 2019 18:23:14 +0300
Message-Id: <20190524152314.27411-1-digetx@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add timings for ram codes 4 and 6 and timing for 528mHz of ram code 1,
which appears to be missed due to the clock driver bug that is fixed now.

Tested-by: Steev Klimaszewski <steev@kali.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---

Please note that the prerequisite patch that fixed the PLLM bug causing
hang on switching to 528MHz is already propagated to all stable kernels
and the support for multiple RAM-codes is already in v5.2 too. Hence it
is fine to apply this patch now, hope to see it in v5.3.

 arch/arm/boot/dts/tegra124-nyan-big-emc.dtsi | 7917 ++++++++++++++----
 1 file changed, 6272 insertions(+), 1645 deletions(-)

diff --git a/arch/arm/boot/dts/tegra124-nyan-big-emc.dtsi b/arch/arm/boot/dts/tegra124-nyan-big-emc.dtsi
index 9af21fe93a5c..fb6b3e1a0b1f 100644
--- a/arch/arm/boot/dts/tegra124-nyan-big-emc.dtsi
+++ b/arch/arm/boot/dts/tegra124-nyan-big-emc.dtsi
@@ -1,5 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
 / {
+	apbmisc@70000800 {
+		nvidia,long-ram-code;
+	};
+
 	clock@60006000 {
 		emc-timings-1 {
 			nvidia,ram-code = <1>;
@@ -52,7 +56,154 @@
 				clocks = <&tegra_car TEGRA124_CLK_PLL_M>;
 				clock-names = "emc-parent";
 			};
-			/* TODO: Add 528MHz frequency */
+			timing-528000000 {
+				clock-frequency = <528000000>;
+				nvidia,parent-clock-frequency = <528000000>;
+				clocks = <&tegra_car TEGRA124_CLK_PLL_M_UD>;
+				clock-names = "emc-parent";
+			};
+			timing-600000000 {
+				clock-frequency = <600000000>;
+				nvidia,parent-clock-frequency = <600000000>;
+				clocks = <&tegra_car TEGRA124_CLK_PLL_C_UD>;
+				clock-names = "emc-parent";
+			};
+			timing-792000000 {
+				clock-frequency = <792000000>;
+				nvidia,parent-clock-frequency = <792000000>;
+				clocks = <&tegra_car TEGRA124_CLK_PLL_M_UD>;
+				clock-names = "emc-parent";
+			};
+		};
+
+		emc-timings-4 {
+			nvidia,ram-code = <4>;
+
+			timing-12750000 {
+				clock-frequency = <12750000>;
+				nvidia,parent-clock-frequency = <408000000>;
+				clocks = <&tegra_car TEGRA124_CLK_PLL_P>;
+				clock-names = "emc-parent";
+			};
+			timing-20400000 {
+				clock-frequency = <20400000>;
+				nvidia,parent-clock-frequency = <408000000>;
+				clocks = <&tegra_car TEGRA124_CLK_PLL_P>;
+				clock-names = "emc-parent";
+			};
+			timing-40800000 {
+				clock-frequency = <40800000>;
+				nvidia,parent-clock-frequency = <408000000>;
+				clocks = <&tegra_car TEGRA124_CLK_PLL_P>;
+				clock-names = "emc-parent";
+			};
+			timing-68000000 {
+				clock-frequency = <68000000>;
+				nvidia,parent-clock-frequency = <408000000>;
+				clocks = <&tegra_car TEGRA124_CLK_PLL_P>;
+				clock-names = "emc-parent";
+			};
+			timing-102000000 {
+				clock-frequency = <102000000>;
+				nvidia,parent-clock-frequency = <408000000>;
+				clocks = <&tegra_car TEGRA124_CLK_PLL_P>;
+				clock-names = "emc-parent";
+			};
+			timing-204000000 {
+				clock-frequency = <204000000>;
+				nvidia,parent-clock-frequency = <408000000>;
+				clocks = <&tegra_car TEGRA124_CLK_PLL_P>;
+				clock-names = "emc-parent";
+			};
+			timing-300000000 {
+				clock-frequency = <300000000>;
+				nvidia,parent-clock-frequency = <600000000>;
+				clocks = <&tegra_car TEGRA124_CLK_PLL_C>;
+				clock-names = "emc-parent";
+			};
+			timing-396000000 {
+				clock-frequency = <396000000>;
+				nvidia,parent-clock-frequency = <792000000>;
+				clocks = <&tegra_car TEGRA124_CLK_PLL_M>;
+				clock-names = "emc-parent";
+			};
+			timing-528000000 {
+				clock-frequency = <528000000>;
+				nvidia,parent-clock-frequency = <528000000>;
+				clocks = <&tegra_car TEGRA124_CLK_PLL_M_UD>;
+				clock-names = "emc-parent";
+			};
+			timing-600000000 {
+				clock-frequency = <600000000>;
+				nvidia,parent-clock-frequency = <600000000>;
+				clocks = <&tegra_car TEGRA124_CLK_PLL_C_UD>;
+				clock-names = "emc-parent";
+			};
+			timing-792000000 {
+				clock-frequency = <792000000>;
+				nvidia,parent-clock-frequency = <792000000>;
+				clocks = <&tegra_car TEGRA124_CLK_PLL_M_UD>;
+				clock-names = "emc-parent";
+			};
+		};
+
+		emc-timings-6 {
+			nvidia,ram-code = <6>;
+
+			timing-12750000 {
+				clock-frequency = <12750000>;
+				nvidia,parent-clock-frequency = <408000000>;
+				clocks = <&tegra_car TEGRA124_CLK_PLL_P>;
+				clock-names = "emc-parent";
+			};
+			timing-20400000 {
+				clock-frequency = <20400000>;
+				nvidia,parent-clock-frequency = <408000000>;
+				clocks = <&tegra_car TEGRA124_CLK_PLL_P>;
+				clock-names = "emc-parent";
+			};
+			timing-40800000 {
+				clock-frequency = <40800000>;
+				nvidia,parent-clock-frequency = <408000000>;
+				clocks = <&tegra_car TEGRA124_CLK_PLL_P>;
+				clock-names = "emc-parent";
+			};
+			timing-68000000 {
+				clock-frequency = <68000000>;
+				nvidia,parent-clock-frequency = <408000000>;
+				clocks = <&tegra_car TEGRA124_CLK_PLL_P>;
+				clock-names = "emc-parent";
+			};
+			timing-102000000 {
+				clock-frequency = <102000000>;
+				nvidia,parent-clock-frequency = <408000000>;
+				clocks = <&tegra_car TEGRA124_CLK_PLL_P>;
+				clock-names = "emc-parent";
+			};
+			timing-204000000 {
+				clock-frequency = <204000000>;
+				nvidia,parent-clock-frequency = <408000000>;
+				clocks = <&tegra_car TEGRA124_CLK_PLL_P>;
+				clock-names = "emc-parent";
+			};
+			timing-300000000 {
+				clock-frequency = <300000000>;
+				nvidia,parent-clock-frequency = <600000000>;
+				clocks = <&tegra_car TEGRA124_CLK_PLL_C>;
+				clock-names = "emc-parent";
+			};
+			timing-396000000 {
+				clock-frequency = <396000000>;
+				nvidia,parent-clock-frequency = <792000000>;
+				clocks = <&tegra_car TEGRA124_CLK_PLL_M>;
+				clock-names = "emc-parent";
+			};
+			timing-528000000 {
+				clock-frequency = <528000000>;
+				nvidia,parent-clock-frequency = <528000000>;
+				clocks = <&tegra_car TEGRA124_CLK_PLL_M_UD>;
+				clock-names = "emc-parent";
+			};
 			timing-600000000 {
 				clock-frequency = <600000000>;
 				nvidia,parent-clock-frequency = <600000000>;
@@ -94,149 +245,149 @@
 				nvidia,emc-zcal-interval = <0x00000000>;
 
 				nvidia,emc-configuration = <
-					0x00000000
-					0x00000003
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000004
-					0x0000000a
-					0x00000003
-					0x0000000b
-					0x00000000
-					0x00000000
-					0x00000003
-					0x00000003
-					0x00000000
-					0x00000006
-					0x00000006
-					0x00000006
-					0x00000002
-					0x00000000
-					0x00000005
-					0x00000005
-					0x00010000
-					0x00000003
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000004
-					0x0000000c
-					0x0000000d
-					0x0000000f
-					0x00000060
-					0x00000000
-					0x00000018
-					0x00000002
-					0x00000002
-					0x00000001
-					0x00000000
-					0x00000007
-					0x0000000f
-					0x00000005
-					0x00000005
-					0x00000004
-					0x00000005
-					0x00000004
-					0x00000000
-					0x00000000
-					0x00000005
-					0x00000005
-					0x00000064
-					0x00000000
-					0x00000000
-					0x00000000
-					0x106aa298
-					0x002c00a0
-					0x00008000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00004000
-					0x00000000
-					0x00000000
-					0x00004000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x000fc000
-					0x000fc000
-					0x000fc000
-					0x000fc000
-					0x0000fc00
-					0x0000fc00
-					0x0000fc00
-					0x0000fc00
-					0x10000280
-					0x00000000
-					0x00111111
-					0x00000000
-					0x00000000
-					0x77ffc081
-					0x00000303
-					0x81f1f108
-					0x07070004
-					0x0000003f
-					0x016eeeee
-					0x51451400
-					0x00514514
-					0x00514514
-					0x51451400
-					0x0000003f
-					0x00000007
-					0x00000000
-					0x00000042
-					0x000c000c
-					0x00000000
-					0x00000003
-					0x0000f2f3
-					0x800001c5
-					0x0000000a
+					0x00000000 /* EMC_RC */
+					0x00000003 /* EMC_RFC */
+					0x00000000 /* EMC_RFC_SLR */
+					0x00000000 /* EMC_RAS */
+					0x00000000 /* EMC_RP */
+					0x00000004 /* EMC_R2W */
+					0x0000000a /* EMC_W2R */
+					0x00000003 /* EMC_R2P */
+					0x0000000b /* EMC_W2P */
+					0x00000000 /* EMC_RD_RCD */
+					0x00000000 /* EMC_WR_RCD */
+					0x00000003 /* EMC_RRD */
+					0x00000003 /* EMC_REXT */
+					0x00000000 /* EMC_WEXT */
+					0x00000006 /* EMC_WDV */
+					0x00000006 /* EMC_WDV_MASK */
+					0x00000006 /* EMC_QUSE */
+					0x00000002 /* EMC_QUSE_WIDTH */
+					0x00000000 /* EMC_IBDLY */
+					0x00000005 /* EMC_EINPUT */
+					0x00000005 /* EMC_EINPUT_DURATION */
+					0x00010000 /* EMC_PUTERM_EXTRA */
+					0x00000003 /* EMC_PUTERM_WIDTH */
+					0x00000000 /* EMC_PUTERM_ADJ */
+					0x00000000 /* EMC_CDB_CNTL_1 */
+					0x00000000 /* EMC_CDB_CNTL_2 */
+					0x00000000 /* EMC_CDB_CNTL_3 */
+					0x00000004 /* EMC_QRST */
+					0x0000000c /* EMC_QSAFE */
+					0x0000000d /* EMC_RDV */
+					0x0000000f /* EMC_RDV_MASK */
+					0x00000060 /* EMC_REFRESH */
+					0x00000000 /* EMC_BURST_REFRESH_NUM */
+					0x00000018 /* EMC_PRE_REFRESH_REQ_CNT */
+					0x00000002 /* EMC_PDEX2WR */
+					0x00000002 /* EMC_PDEX2RD */
+					0x00000001 /* EMC_PCHG2PDEN */
+					0x00000000 /* EMC_ACT2PDEN */
+					0x00000007 /* EMC_AR2PDEN */
+					0x0000000f /* EMC_RW2PDEN */
+					0x00000005 /* EMC_TXSR */
+					0x00000005 /* EMC_TXSRDLL */
+					0x00000004 /* EMC_TCKE */
+					0x00000005 /* EMC_TCKESR */
+					0x00000004 /* EMC_TPD */
+					0x00000000 /* EMC_TFAW */
+					0x00000000 /* EMC_TRPAB */
+					0x00000005 /* EMC_TCLKSTABLE */
+					0x00000005 /* EMC_TCLKSTOP */
+					0x00000064 /* EMC_TREFBW */
+					0x00000000 /* EMC_FBIO_CFG6 */
+					0x00000000 /* EMC_ODT_WRITE */
+					0x00000000 /* EMC_ODT_READ */
+					0x106aa298 /* EMC_FBIO_CFG5 */
+					0x002c00a0 /* EMC_CFG_DIG_DLL */
+					0x00008000 /* EMC_CFG_DIG_DLL_PERIOD */
+					0x00064000 /* EMC_DLL_XFORM_DQS0 */
+					0x00064000 /* EMC_DLL_XFORM_DQS1 */
+					0x00064000 /* EMC_DLL_XFORM_DQS2 */
+					0x00064000 /* EMC_DLL_XFORM_DQS3 */
+					0x00064000 /* EMC_DLL_XFORM_DQS4 */
+					0x00064000 /* EMC_DLL_XFORM_DQS5 */
+					0x00064000 /* EMC_DLL_XFORM_DQS6 */
+					0x00064000 /* EMC_DLL_XFORM_DQS7 */
+					0x00064000 /* EMC_DLL_XFORM_DQS8 */
+					0x00064000 /* EMC_DLL_XFORM_DQS9 */
+					0x00064000 /* EMC_DLL_XFORM_DQS10 */
+					0x00064000 /* EMC_DLL_XFORM_DQS11 */
+					0x00064000 /* EMC_DLL_XFORM_DQS12 */
+					0x00064000 /* EMC_DLL_XFORM_DQS13 */
+					0x00064000 /* EMC_DLL_XFORM_DQS14 */
+					0x00064000 /* EMC_DLL_XFORM_DQS15 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE0 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE1 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE2 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE3 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE4 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE6 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE7 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR0 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR1 */
+					0x00004000 /* EMC_DLL_XFORM_ADDR2 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR3 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR4 */
+					0x00004000 /* EMC_DLL_XFORM_ADDR5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE8 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE9 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE10 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE11 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE12 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE13 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE14 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE15 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS0 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS1 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS2 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS3 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS4 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS5 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS6 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS7 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS8 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS9 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS10 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS11 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS12 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS13 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS14 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS15 */
+					0x000fc000 /* EMC_DLL_XFORM_DQ0 */
+					0x000fc000 /* EMC_DLL_XFORM_DQ1 */
+					0x000fc000 /* EMC_DLL_XFORM_DQ2 */
+					0x000fc000 /* EMC_DLL_XFORM_DQ3 */
+					0x0000fc00 /* EMC_DLL_XFORM_DQ4 */
+					0x0000fc00 /* EMC_DLL_XFORM_DQ5 */
+					0x0000fc00 /* EMC_DLL_XFORM_DQ6 */
+					0x0000fc00 /* EMC_DLL_XFORM_DQ7 */
+					0x10000280 /* EMC_XM2CMDPADCTRL */
+					0x00000000 /* EMC_XM2CMDPADCTRL4 */
+					0x00111111 /* EMC_XM2CMDPADCTRL5 */
+					0x00000000 /* EMC_XM2DQPADCTRL2 */
+					0x00000000 /* EMC_XM2DQPADCTRL3 */
+					0x77ffc081 /* EMC_XM2CLKPADCTRL */
+					0x00000303 /* EMC_XM2CLKPADCTRL2 */
+					0x81f1f108 /* EMC_XM2COMPPADCTRL */
+					0x07070004 /* EMC_XM2VTTGENPADCTRL */
+					0x0000003f /* EMC_XM2VTTGENPADCTRL2 */
+					0x016eeeee /* EMC_XM2VTTGENPADCTRL3 */
+					0x51451400 /* EMC_XM2DQSPADCTRL3 */
+					0x00514514 /* EMC_XM2DQSPADCTRL4 */
+					0x00514514 /* EMC_XM2DQSPADCTRL5 */
+					0x51451400 /* EMC_XM2DQSPADCTRL6 */
+					0x0000003f /* EMC_DSR_VTTGEN_DRV */
+					0x00000007 /* EMC_TXDSRVTTGEN */
+					0x00000000 /* EMC_FBIO_SPARE */
+					0x00000042 /* EMC_ZCAL_WAIT_CNT */
+					0x000c000c /* EMC_MRS_WAIT_CNT2 */
+					0x00000000 /* EMC_CTT */
+					0x00000003 /* EMC_CTT_DURATION */
+					0x0000f2f3 /* EMC_CFG_PIPE */
+					0x800001c5 /* EMC_DYN_SELF_REF_CONTROL */
+					0x0000000a /* EMC_QPOP */
 				>;
 			};
 
@@ -262,149 +413,149 @@
 				nvidia,emc-zcal-interval = <0x00000000>;
 
 				nvidia,emc-configuration = <
-					0x00000000
-					0x00000005
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000004
-					0x0000000a
-					0x00000003
-					0x0000000b
-					0x00000000
-					0x00000000
-					0x00000003
-					0x00000003
-					0x00000000
-					0x00000006
-					0x00000006
-					0x00000006
-					0x00000002
-					0x00000000
-					0x00000005
-					0x00000005
-					0x00010000
-					0x00000003
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000004
-					0x0000000c
-					0x0000000d
-					0x0000000f
-					0x0000009a
-					0x00000000
-					0x00000026
-					0x00000002
-					0x00000002
-					0x00000001
-					0x00000000
-					0x00000007
-					0x0000000f
-					0x00000006
-					0x00000006
-					0x00000004
-					0x00000005
-					0x00000004
-					0x00000000
-					0x00000000
-					0x00000005
-					0x00000005
-					0x000000a0
-					0x00000000
-					0x00000000
-					0x00000000
-					0x106aa298
-					0x002c00a0
-					0x00008000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00004000
-					0x00000000
-					0x00000000
-					0x00004000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x000fc000
-					0x000fc000
-					0x000fc000
-					0x000fc000
-					0x0000fc00
-					0x0000fc00
-					0x0000fc00
-					0x0000fc00
-					0x10000280
-					0x00000000
-					0x00111111
-					0x00000000
-					0x00000000
-					0x77ffc081
-					0x00000303
-					0x81f1f108
-					0x07070004
-					0x0000003f
-					0x016eeeee
-					0x51451400
-					0x00514514
-					0x00514514
-					0x51451400
-					0x0000003f
-					0x0000000b
-					0x00000000
-					0x00000042
-					0x000c000c
-					0x00000000
-					0x00000003
-					0x0000f2f3
-					0x8000023a
-					0x0000000a
+					0x00000000 /* EMC_RC */
+					0x00000005 /* EMC_RFC */
+					0x00000000 /* EMC_RFC_SLR */
+					0x00000000 /* EMC_RAS */
+					0x00000000 /* EMC_RP */
+					0x00000004 /* EMC_R2W */
+					0x0000000a /* EMC_W2R */
+					0x00000003 /* EMC_R2P */
+					0x0000000b /* EMC_W2P */
+					0x00000000 /* EMC_RD_RCD */
+					0x00000000 /* EMC_WR_RCD */
+					0x00000003 /* EMC_RRD */
+					0x00000003 /* EMC_REXT */
+					0x00000000 /* EMC_WEXT */
+					0x00000006 /* EMC_WDV */
+					0x00000006 /* EMC_WDV_MASK */
+					0x00000006 /* EMC_QUSE */
+					0x00000002 /* EMC_QUSE_WIDTH */
+					0x00000000 /* EMC_IBDLY */
+					0x00000005 /* EMC_EINPUT */
+					0x00000005 /* EMC_EINPUT_DURATION */
+					0x00010000 /* EMC_PUTERM_EXTRA */
+					0x00000003 /* EMC_PUTERM_WIDTH */
+					0x00000000 /* EMC_PUTERM_ADJ */
+					0x00000000 /* EMC_CDB_CNTL_1 */
+					0x00000000 /* EMC_CDB_CNTL_2 */
+					0x00000000 /* EMC_CDB_CNTL_3 */
+					0x00000004 /* EMC_QRST */
+					0x0000000c /* EMC_QSAFE */
+					0x0000000d /* EMC_RDV */
+					0x0000000f /* EMC_RDV_MASK */
+					0x0000009a /* EMC_REFRESH */
+					0x00000000 /* EMC_BURST_REFRESH_NUM */
+					0x00000026 /* EMC_PRE_REFRESH_REQ_CNT */
+					0x00000002 /* EMC_PDEX2WR */
+					0x00000002 /* EMC_PDEX2RD */
+					0x00000001 /* EMC_PCHG2PDEN */
+					0x00000000 /* EMC_ACT2PDEN */
+					0x00000007 /* EMC_AR2PDEN */
+					0x0000000f /* EMC_RW2PDEN */
+					0x00000006 /* EMC_TXSR */
+					0x00000006 /* EMC_TXSRDLL */
+					0x00000004 /* EMC_TCKE */
+					0x00000005 /* EMC_TCKESR */
+					0x00000004 /* EMC_TPD */
+					0x00000000 /* EMC_TFAW */
+					0x00000000 /* EMC_TRPAB */
+					0x00000005 /* EMC_TCLKSTABLE */
+					0x00000005 /* EMC_TCLKSTOP */
+					0x000000a0 /* EMC_TREFBW */
+					0x00000000 /* EMC_FBIO_CFG6 */
+					0x00000000 /* EMC_ODT_WRITE */
+					0x00000000 /* EMC_ODT_READ */
+					0x106aa298 /* EMC_FBIO_CFG5 */
+					0x002c00a0 /* EMC_CFG_DIG_DLL */
+					0x00008000 /* EMC_CFG_DIG_DLL_PERIOD */
+					0x00064000 /* EMC_DLL_XFORM_DQS0 */
+					0x00064000 /* EMC_DLL_XFORM_DQS1 */
+					0x00064000 /* EMC_DLL_XFORM_DQS2 */
+					0x00064000 /* EMC_DLL_XFORM_DQS3 */
+					0x00064000 /* EMC_DLL_XFORM_DQS4 */
+					0x00064000 /* EMC_DLL_XFORM_DQS5 */
+					0x00064000 /* EMC_DLL_XFORM_DQS6 */
+					0x00064000 /* EMC_DLL_XFORM_DQS7 */
+					0x00064000 /* EMC_DLL_XFORM_DQS8 */
+					0x00064000 /* EMC_DLL_XFORM_DQS9 */
+					0x00064000 /* EMC_DLL_XFORM_DQS10 */
+					0x00064000 /* EMC_DLL_XFORM_DQS11 */
+					0x00064000 /* EMC_DLL_XFORM_DQS12 */
+					0x00064000 /* EMC_DLL_XFORM_DQS13 */
+					0x00064000 /* EMC_DLL_XFORM_DQS14 */
+					0x00064000 /* EMC_DLL_XFORM_DQS15 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE0 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE1 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE2 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE3 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE4 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE6 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE7 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR0 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR1 */
+					0x00004000 /* EMC_DLL_XFORM_ADDR2 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR3 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR4 */
+					0x00004000 /* EMC_DLL_XFORM_ADDR5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE8 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE9 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE10 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE11 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE12 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE13 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE14 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE15 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS0 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS1 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS2 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS3 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS4 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS5 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS6 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS7 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS8 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS9 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS10 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS11 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS12 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS13 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS14 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS15 */
+					0x000fc000 /* EMC_DLL_XFORM_DQ0 */
+					0x000fc000 /* EMC_DLL_XFORM_DQ1 */
+					0x000fc000 /* EMC_DLL_XFORM_DQ2 */
+					0x000fc000 /* EMC_DLL_XFORM_DQ3 */
+					0x0000fc00 /* EMC_DLL_XFORM_DQ4 */
+					0x0000fc00 /* EMC_DLL_XFORM_DQ5 */
+					0x0000fc00 /* EMC_DLL_XFORM_DQ6 */
+					0x0000fc00 /* EMC_DLL_XFORM_DQ7 */
+					0x10000280 /* EMC_XM2CMDPADCTRL */
+					0x00000000 /* EMC_XM2CMDPADCTRL4 */
+					0x00111111 /* EMC_XM2CMDPADCTRL5 */
+					0x00000000 /* EMC_XM2DQPADCTRL2 */
+					0x00000000 /* EMC_XM2DQPADCTRL3 */
+					0x77ffc081 /* EMC_XM2CLKPADCTRL */
+					0x00000303 /* EMC_XM2CLKPADCTRL2 */
+					0x81f1f108 /* EMC_XM2COMPPADCTRL */
+					0x07070004 /* EMC_XM2VTTGENPADCTRL */
+					0x0000003f /* EMC_XM2VTTGENPADCTRL2 */
+					0x016eeeee /* EMC_XM2VTTGENPADCTRL3 */
+					0x51451400 /* EMC_XM2DQSPADCTRL3 */
+					0x00514514 /* EMC_XM2DQSPADCTRL4 */
+					0x00514514 /* EMC_XM2DQSPADCTRL5 */
+					0x51451400 /* EMC_XM2DQSPADCTRL6 */
+					0x0000003f /* EMC_DSR_VTTGEN_DRV */
+					0x0000000b /* EMC_TXDSRVTTGEN */
+					0x00000000 /* EMC_FBIO_SPARE */
+					0x00000042 /* EMC_ZCAL_WAIT_CNT */
+					0x000c000c /* EMC_MRS_WAIT_CNT2 */
+					0x00000000 /* EMC_CTT */
+					0x00000003 /* EMC_CTT_DURATION */
+					0x0000f2f3 /* EMC_CFG_PIPE */
+					0x8000023a /* EMC_DYN_SELF_REF_CONTROL */
+					0x0000000a /* EMC_QPOP */
 				>;
 			};
 
@@ -430,149 +581,149 @@
 				nvidia,emc-zcal-interval = <0x00000000>;
 
 				nvidia,emc-configuration = <
-					0x00000001
-					0x0000000a
-					0x00000000
-					0x00000001
-					0x00000000
-					0x00000004
-					0x0000000a
-					0x00000003
-					0x0000000b
-					0x00000000
-					0x00000000
-					0x00000003
-					0x00000003
-					0x00000000
-					0x00000006
-					0x00000006
-					0x00000006
-					0x00000002
-					0x00000000
-					0x00000005
-					0x00000005
-					0x00010000
-					0x00000003
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000004
-					0x0000000c
-					0x0000000d
-					0x0000000f
-					0x00000134
-					0x00000000
-					0x0000004d
-					0x00000002
-					0x00000002
-					0x00000001
-					0x00000000
-					0x00000008
-					0x0000000f
-					0x0000000c
-					0x0000000c
-					0x00000004
-					0x00000005
-					0x00000004
-					0x00000000
-					0x00000000
-					0x00000005
-					0x00000005
-					0x0000013f
-					0x00000000
-					0x00000000
-					0x00000000
-					0x106aa298
-					0x002c00a0
-					0x00008000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00004000
-					0x00000000
-					0x00000000
-					0x00004000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x000fc000
-					0x000fc000
-					0x000fc000
-					0x000fc000
-					0x0000fc00
-					0x0000fc00
-					0x0000fc00
-					0x0000fc00
-					0x10000280
-					0x00000000
-					0x00111111
-					0x00000000
-					0x00000000
-					0x77ffc081
-					0x00000303
-					0x81f1f108
-					0x07070004
-					0x0000003f
-					0x016eeeee
-					0x51451400
-					0x00514514
-					0x00514514
-					0x51451400
-					0x0000003f
-					0x00000015
-					0x00000000
-					0x00000042
-					0x000c000c
-					0x00000000
-					0x00000003
-					0x0000f2f3
-					0x80000370
-					0x0000000a
+					0x00000001 /* EMC_RC */
+					0x0000000a /* EMC_RFC */
+					0x00000000 /* EMC_RFC_SLR */
+					0x00000001 /* EMC_RAS */
+					0x00000000 /* EMC_RP */
+					0x00000004 /* EMC_R2W */
+					0x0000000a /* EMC_W2R */
+					0x00000003 /* EMC_R2P */
+					0x0000000b /* EMC_W2P */
+					0x00000000 /* EMC_RD_RCD */
+					0x00000000 /* EMC_WR_RCD */
+					0x00000003 /* EMC_RRD */
+					0x00000003 /* EMC_REXT */
+					0x00000000 /* EMC_WEXT */
+					0x00000006 /* EMC_WDV */
+					0x00000006 /* EMC_WDV_MASK */
+					0x00000006 /* EMC_QUSE */
+					0x00000002 /* EMC_QUSE_WIDTH */
+					0x00000000 /* EMC_IBDLY */
+					0x00000005 /* EMC_EINPUT */
+					0x00000005 /* EMC_EINPUT_DURATION */
+					0x00010000 /* EMC_PUTERM_EXTRA */
+					0x00000003 /* EMC_PUTERM_WIDTH */
+					0x00000000 /* EMC_PUTERM_ADJ */
+					0x00000000 /* EMC_CDB_CNTL_1 */
+					0x00000000 /* EMC_CDB_CNTL_2 */
+					0x00000000 /* EMC_CDB_CNTL_3 */
+					0x00000004 /* EMC_QRST */
+					0x0000000c /* EMC_QSAFE */
+					0x0000000d /* EMC_RDV */
+					0x0000000f /* EMC_RDV_MASK */
+					0x00000134 /* EMC_REFRESH */
+					0x00000000 /* EMC_BURST_REFRESH_NUM */
+					0x0000004d /* EMC_PRE_REFRESH_REQ_CNT */
+					0x00000002 /* EMC_PDEX2WR */
+					0x00000002 /* EMC_PDEX2RD */
+					0x00000001 /* EMC_PCHG2PDEN */
+					0x00000000 /* EMC_ACT2PDEN */
+					0x00000008 /* EMC_AR2PDEN */
+					0x0000000f /* EMC_RW2PDEN */
+					0x0000000c /* EMC_TXSR */
+					0x0000000c /* EMC_TXSRDLL */
+					0x00000004 /* EMC_TCKE */
+					0x00000005 /* EMC_TCKESR */
+					0x00000004 /* EMC_TPD */
+					0x00000000 /* EMC_TFAW */
+					0x00000000 /* EMC_TRPAB */
+					0x00000005 /* EMC_TCLKSTABLE */
+					0x00000005 /* EMC_TCLKSTOP */
+					0x0000013f /* EMC_TREFBW */
+					0x00000000 /* EMC_FBIO_CFG6 */
+					0x00000000 /* EMC_ODT_WRITE */
+					0x00000000 /* EMC_ODT_READ */
+					0x106aa298 /* EMC_FBIO_CFG5 */
+					0x002c00a0 /* EMC_CFG_DIG_DLL */
+					0x00008000 /* EMC_CFG_DIG_DLL_PERIOD */
+					0x00064000 /* EMC_DLL_XFORM_DQS0 */
+					0x00064000 /* EMC_DLL_XFORM_DQS1 */
+					0x00064000 /* EMC_DLL_XFORM_DQS2 */
+					0x00064000 /* EMC_DLL_XFORM_DQS3 */
+					0x00064000 /* EMC_DLL_XFORM_DQS4 */
+					0x00064000 /* EMC_DLL_XFORM_DQS5 */
+					0x00064000 /* EMC_DLL_XFORM_DQS6 */
+					0x00064000 /* EMC_DLL_XFORM_DQS7 */
+					0x00064000 /* EMC_DLL_XFORM_DQS8 */
+					0x00064000 /* EMC_DLL_XFORM_DQS9 */
+					0x00064000 /* EMC_DLL_XFORM_DQS10 */
+					0x00064000 /* EMC_DLL_XFORM_DQS11 */
+					0x00064000 /* EMC_DLL_XFORM_DQS12 */
+					0x00064000 /* EMC_DLL_XFORM_DQS13 */
+					0x00064000 /* EMC_DLL_XFORM_DQS14 */
+					0x00064000 /* EMC_DLL_XFORM_DQS15 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE0 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE1 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE2 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE3 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE4 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE6 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE7 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR0 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR1 */
+					0x00004000 /* EMC_DLL_XFORM_ADDR2 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR3 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR4 */
+					0x00004000 /* EMC_DLL_XFORM_ADDR5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE8 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE9 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE10 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE11 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE12 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE13 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE14 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE15 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS0 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS1 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS2 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS3 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS4 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS5 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS6 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS7 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS8 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS9 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS10 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS11 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS12 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS13 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS14 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS15 */
+					0x000fc000 /* EMC_DLL_XFORM_DQ0 */
+					0x000fc000 /* EMC_DLL_XFORM_DQ1 */
+					0x000fc000 /* EMC_DLL_XFORM_DQ2 */
+					0x000fc000 /* EMC_DLL_XFORM_DQ3 */
+					0x0000fc00 /* EMC_DLL_XFORM_DQ4 */
+					0x0000fc00 /* EMC_DLL_XFORM_DQ5 */
+					0x0000fc00 /* EMC_DLL_XFORM_DQ6 */
+					0x0000fc00 /* EMC_DLL_XFORM_DQ7 */
+					0x10000280 /* EMC_XM2CMDPADCTRL */
+					0x00000000 /* EMC_XM2CMDPADCTRL4 */
+					0x00111111 /* EMC_XM2CMDPADCTRL5 */
+					0x00000000 /* EMC_XM2DQPADCTRL2 */
+					0x00000000 /* EMC_XM2DQPADCTRL3 */
+					0x77ffc081 /* EMC_XM2CLKPADCTRL */
+					0x00000303 /* EMC_XM2CLKPADCTRL2 */
+					0x81f1f108 /* EMC_XM2COMPPADCTRL */
+					0x07070004 /* EMC_XM2VTTGENPADCTRL */
+					0x0000003f /* EMC_XM2VTTGENPADCTRL2 */
+					0x016eeeee /* EMC_XM2VTTGENPADCTRL3 */
+					0x51451400 /* EMC_XM2DQSPADCTRL3 */
+					0x00514514 /* EMC_XM2DQSPADCTRL4 */
+					0x00514514 /* EMC_XM2DQSPADCTRL5 */
+					0x51451400 /* EMC_XM2DQSPADCTRL6 */
+					0x0000003f /* EMC_DSR_VTTGEN_DRV */
+					0x00000015 /* EMC_TXDSRVTTGEN */
+					0x00000000 /* EMC_FBIO_SPARE */
+					0x00000042 /* EMC_ZCAL_WAIT_CNT */
+					0x000c000c /* EMC_MRS_WAIT_CNT2 */
+					0x00000000 /* EMC_CTT */
+					0x00000003 /* EMC_CTT_DURATION */
+					0x0000f2f3 /* EMC_CFG_PIPE */
+					0x80000370 /* EMC_DYN_SELF_REF_CONTROL */
+					0x0000000a /* EMC_QPOP */
 				>;
 			};
 
@@ -598,149 +749,149 @@
 				nvidia,emc-zcal-interval = <0x00000000>;
 
 				nvidia,emc-configuration = <
-					0x00000003
-					0x00000011
-					0x00000000
-					0x00000002
-					0x00000000
-					0x00000004
-					0x0000000a
-					0x00000003
-					0x0000000b
-					0x00000000
-					0x00000000
-					0x00000003
-					0x00000003
-					0x00000000
-					0x00000006
-					0x00000006
-					0x00000006
-					0x00000002
-					0x00000000
-					0x00000005
-					0x00000005
-					0x00010000
-					0x00000003
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000004
-					0x0000000c
-					0x0000000d
-					0x0000000f
-					0x00000202
-					0x00000000
-					0x00000080
-					0x00000002
-					0x00000002
-					0x00000001
-					0x00000000
-					0x0000000f
-					0x0000000f
-					0x00000013
-					0x00000013
-					0x00000004
-					0x00000005
-					0x00000004
-					0x00000001
-					0x00000000
-					0x00000005
-					0x00000005
-					0x00000213
-					0x00000000
-					0x00000000
-					0x00000000
-					0x106aa298
-					0x002c00a0
-					0x00008000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00004000
-					0x00000000
-					0x00000000
-					0x00004000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x000fc000
-					0x000fc000
-					0x000fc000
-					0x000fc000
-					0x0000fc00
-					0x0000fc00
-					0x0000fc00
-					0x0000fc00
-					0x10000280
-					0x00000000
-					0x00111111
-					0x00000000
-					0x00000000
-					0x77ffc081
-					0x00000303
-					0x81f1f108
-					0x07070004
-					0x0000003f
-					0x016eeeee
-					0x51451400
-					0x00514514
-					0x00514514
-					0x51451400
-					0x0000003f
-					0x00000022
-					0x00000000
-					0x00000042
-					0x000c000c
-					0x00000000
-					0x00000003
-					0x0000f2f3
-					0x8000050e
-					0x0000000a
+					0x00000003 /* EMC_RC */
+					0x00000011 /* EMC_RFC */
+					0x00000000 /* EMC_RFC_SLR */
+					0x00000002 /* EMC_RAS */
+					0x00000000 /* EMC_RP */
+					0x00000004 /* EMC_R2W */
+					0x0000000a /* EMC_W2R */
+					0x00000003 /* EMC_R2P */
+					0x0000000b /* EMC_W2P */
+					0x00000000 /* EMC_RD_RCD */
+					0x00000000 /* EMC_WR_RCD */
+					0x00000003 /* EMC_RRD */
+					0x00000003 /* EMC_REXT */
+					0x00000000 /* EMC_WEXT */
+					0x00000006 /* EMC_WDV */
+					0x00000006 /* EMC_WDV_MASK */
+					0x00000006 /* EMC_QUSE */
+					0x00000002 /* EMC_QUSE_WIDTH */
+					0x00000000 /* EMC_IBDLY */
+					0x00000005 /* EMC_EINPUT */
+					0x00000005 /* EMC_EINPUT_DURATION */
+					0x00010000 /* EMC_PUTERM_EXTRA */
+					0x00000003 /* EMC_PUTERM_WIDTH */
+					0x00000000 /* EMC_PUTERM_ADJ */
+					0x00000000 /* EMC_CDB_CNTL_1 */
+					0x00000000 /* EMC_CDB_CNTL_2 */
+					0x00000000 /* EMC_CDB_CNTL_3 */
+					0x00000004 /* EMC_QRST */
+					0x0000000c /* EMC_QSAFE */
+					0x0000000d /* EMC_RDV */
+					0x0000000f /* EMC_RDV_MASK */
+					0x00000202 /* EMC_REFRESH */
+					0x00000000 /* EMC_BURST_REFRESH_NUM */
+					0x00000080 /* EMC_PRE_REFRESH_REQ_CNT */
+					0x00000002 /* EMC_PDEX2WR */
+					0x00000002 /* EMC_PDEX2RD */
+					0x00000001 /* EMC_PCHG2PDEN */
+					0x00000000 /* EMC_ACT2PDEN */
+					0x0000000f /* EMC_AR2PDEN */
+					0x0000000f /* EMC_RW2PDEN */
+					0x00000013 /* EMC_TXSR */
+					0x00000013 /* EMC_TXSRDLL */
+					0x00000004 /* EMC_TCKE */
+					0x00000005 /* EMC_TCKESR */
+					0x00000004 /* EMC_TPD */
+					0x00000001 /* EMC_TFAW */
+					0x00000000 /* EMC_TRPAB */
+					0x00000005 /* EMC_TCLKSTABLE */
+					0x00000005 /* EMC_TCLKSTOP */
+					0x00000213 /* EMC_TREFBW */
+					0x00000000 /* EMC_FBIO_CFG6 */
+					0x00000000 /* EMC_ODT_WRITE */
+					0x00000000 /* EMC_ODT_READ */
+					0x106aa298 /* EMC_FBIO_CFG5 */
+					0x002c00a0 /* EMC_CFG_DIG_DLL */
+					0x00008000 /* EMC_CFG_DIG_DLL_PERIOD */
+					0x00064000 /* EMC_DLL_XFORM_DQS0 */
+					0x00064000 /* EMC_DLL_XFORM_DQS1 */
+					0x00064000 /* EMC_DLL_XFORM_DQS2 */
+					0x00064000 /* EMC_DLL_XFORM_DQS3 */
+					0x00064000 /* EMC_DLL_XFORM_DQS4 */
+					0x00064000 /* EMC_DLL_XFORM_DQS5 */
+					0x00064000 /* EMC_DLL_XFORM_DQS6 */
+					0x00064000 /* EMC_DLL_XFORM_DQS7 */
+					0x00064000 /* EMC_DLL_XFORM_DQS8 */
+					0x00064000 /* EMC_DLL_XFORM_DQS9 */
+					0x00064000 /* EMC_DLL_XFORM_DQS10 */
+					0x00064000 /* EMC_DLL_XFORM_DQS11 */
+					0x00064000 /* EMC_DLL_XFORM_DQS12 */
+					0x00064000 /* EMC_DLL_XFORM_DQS13 */
+					0x00064000 /* EMC_DLL_XFORM_DQS14 */
+					0x00064000 /* EMC_DLL_XFORM_DQS15 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE0 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE1 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE2 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE3 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE4 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE6 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE7 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR0 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR1 */
+					0x00004000 /* EMC_DLL_XFORM_ADDR2 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR3 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR4 */
+					0x00004000 /* EMC_DLL_XFORM_ADDR5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE8 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE9 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE10 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE11 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE12 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE13 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE14 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE15 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS0 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS1 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS2 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS3 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS4 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS5 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS6 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS7 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS8 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS9 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS10 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS11 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS12 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS13 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS14 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS15 */
+					0x000fc000 /* EMC_DLL_XFORM_DQ0 */
+					0x000fc000 /* EMC_DLL_XFORM_DQ1 */
+					0x000fc000 /* EMC_DLL_XFORM_DQ2 */
+					0x000fc000 /* EMC_DLL_XFORM_DQ3 */
+					0x0000fc00 /* EMC_DLL_XFORM_DQ4 */
+					0x0000fc00 /* EMC_DLL_XFORM_DQ5 */
+					0x0000fc00 /* EMC_DLL_XFORM_DQ6 */
+					0x0000fc00 /* EMC_DLL_XFORM_DQ7 */
+					0x10000280 /* EMC_XM2CMDPADCTRL */
+					0x00000000 /* EMC_XM2CMDPADCTRL4 */
+					0x00111111 /* EMC_XM2CMDPADCTRL5 */
+					0x00000000 /* EMC_XM2DQPADCTRL2 */
+					0x00000000 /* EMC_XM2DQPADCTRL3 */
+					0x77ffc081 /* EMC_XM2CLKPADCTRL */
+					0x00000303 /* EMC_XM2CLKPADCTRL2 */
+					0x81f1f108 /* EMC_XM2COMPPADCTRL */
+					0x07070004 /* EMC_XM2VTTGENPADCTRL */
+					0x0000003f /* EMC_XM2VTTGENPADCTRL2 */
+					0x016eeeee /* EMC_XM2VTTGENPADCTRL3 */
+					0x51451400 /* EMC_XM2DQSPADCTRL3 */
+					0x00514514 /* EMC_XM2DQSPADCTRL4 */
+					0x00514514 /* EMC_XM2DQSPADCTRL5 */
+					0x51451400 /* EMC_XM2DQSPADCTRL6 */
+					0x0000003f /* EMC_DSR_VTTGEN_DRV */
+					0x00000022 /* EMC_TXDSRVTTGEN */
+					0x00000000 /* EMC_FBIO_SPARE */
+					0x00000042 /* EMC_ZCAL_WAIT_CNT */
+					0x000c000c /* EMC_MRS_WAIT_CNT2 */
+					0x00000000 /* EMC_CTT */
+					0x00000003 /* EMC_CTT_DURATION */
+					0x0000f2f3 /* EMC_CFG_PIPE */
+					0x8000050e /* EMC_DYN_SELF_REF_CONTROL */
+					0x0000000a /* EMC_QPOP */
 				>;
 			};
 
@@ -766,149 +917,149 @@
 				nvidia,emc-zcal-interval = <0x00000000>;
 
 				nvidia,emc-configuration = <
-					0x00000004
-					0x0000001a
-					0x00000000
-					0x00000003
-					0x00000001
-					0x00000004
-					0x0000000a
-					0x00000003
-					0x0000000b
-					0x00000001
-					0x00000001
-					0x00000003
-					0x00000003
-					0x00000000
-					0x00000006
-					0x00000006
-					0x00000006
-					0x00000002
-					0x00000000
-					0x00000005
-					0x00000005
-					0x00010000
-					0x00000003
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000004
-					0x0000000c
-					0x0000000d
-					0x0000000f
-					0x00000304
-					0x00000000
-					0x000000c1
-					0x00000002
-					0x00000002
-					0x00000001
-					0x00000000
-					0x00000018
-					0x0000000f
-					0x0000001c
-					0x0000001c
-					0x00000004
-					0x00000005
-					0x00000004
-					0x00000003
-					0x00000000
-					0x00000005
-					0x00000005
-					0x0000031c
-					0x00000000
-					0x00000000
-					0x00000000
-					0x106aa298
-					0x002c00a0
-					0x00008000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00004000
-					0x00000000
-					0x00000000
-					0x00004000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x000fc000
-					0x000fc000
-					0x000fc000
-					0x000fc000
-					0x0000fc00
-					0x0000fc00
-					0x0000fc00
-					0x0000fc00
-					0x10000280
-					0x00000000
-					0x00111111
-					0x00000000
-					0x00000000
-					0x77ffc081
-					0x00000303
-					0x81f1f108
-					0x07070004
-					0x0000003f
-					0x016eeeee
-					0x51451400
-					0x00514514
-					0x00514514
-					0x51451400
-					0x0000003f
-					0x00000033
-					0x00000000
-					0x00000042
-					0x000c000c
-					0x00000000
-					0x00000003
-					0x0000f2f3
-					0x80000713
-					0x0000000a
+					0x00000004 /* EMC_RC */
+					0x0000001a /* EMC_RFC */
+					0x00000000 /* EMC_RFC_SLR */
+					0x00000003 /* EMC_RAS */
+					0x00000001 /* EMC_RP */
+					0x00000004 /* EMC_R2W */
+					0x0000000a /* EMC_W2R */
+					0x00000003 /* EMC_R2P */
+					0x0000000b /* EMC_W2P */
+					0x00000001 /* EMC_RD_RCD */
+					0x00000001 /* EMC_WR_RCD */
+					0x00000003 /* EMC_RRD */
+					0x00000003 /* EMC_REXT */
+					0x00000000 /* EMC_WEXT */
+					0x00000006 /* EMC_WDV */
+					0x00000006 /* EMC_WDV_MASK */
+					0x00000006 /* EMC_QUSE */
+					0x00000002 /* EMC_QUSE_WIDTH */
+					0x00000000 /* EMC_IBDLY */
+					0x00000005 /* EMC_EINPUT */
+					0x00000005 /* EMC_EINPUT_DURATION */
+					0x00010000 /* EMC_PUTERM_EXTRA */
+					0x00000003 /* EMC_PUTERM_WIDTH */
+					0x00000000 /* EMC_PUTERM_ADJ */
+					0x00000000 /* EMC_CDB_CNTL_1 */
+					0x00000000 /* EMC_CDB_CNTL_2 */
+					0x00000000 /* EMC_CDB_CNTL_3 */
+					0x00000004 /* EMC_QRST */
+					0x0000000c /* EMC_QSAFE */
+					0x0000000d /* EMC_RDV */
+					0x0000000f /* EMC_RDV_MASK */
+					0x00000304 /* EMC_REFRESH */
+					0x00000000 /* EMC_BURST_REFRESH_NUM */
+					0x000000c1 /* EMC_PRE_REFRESH_REQ_CNT */
+					0x00000002 /* EMC_PDEX2WR */
+					0x00000002 /* EMC_PDEX2RD */
+					0x00000001 /* EMC_PCHG2PDEN */
+					0x00000000 /* EMC_ACT2PDEN */
+					0x00000018 /* EMC_AR2PDEN */
+					0x0000000f /* EMC_RW2PDEN */
+					0x0000001c /* EMC_TXSR */
+					0x0000001c /* EMC_TXSRDLL */
+					0x00000004 /* EMC_TCKE */
+					0x00000005 /* EMC_TCKESR */
+					0x00000004 /* EMC_TPD */
+					0x00000003 /* EMC_TFAW */
+					0x00000000 /* EMC_TRPAB */
+					0x00000005 /* EMC_TCLKSTABLE */
+					0x00000005 /* EMC_TCLKSTOP */
+					0x0000031c /* EMC_TREFBW */
+					0x00000000 /* EMC_FBIO_CFG6 */
+					0x00000000 /* EMC_ODT_WRITE */
+					0x00000000 /* EMC_ODT_READ */
+					0x106aa298 /* EMC_FBIO_CFG5 */
+					0x002c00a0 /* EMC_CFG_DIG_DLL */
+					0x00008000 /* EMC_CFG_DIG_DLL_PERIOD */
+					0x00064000 /* EMC_DLL_XFORM_DQS0 */
+					0x00064000 /* EMC_DLL_XFORM_DQS1 */
+					0x00064000 /* EMC_DLL_XFORM_DQS2 */
+					0x00064000 /* EMC_DLL_XFORM_DQS3 */
+					0x00064000 /* EMC_DLL_XFORM_DQS4 */
+					0x00064000 /* EMC_DLL_XFORM_DQS5 */
+					0x00064000 /* EMC_DLL_XFORM_DQS6 */
+					0x00064000 /* EMC_DLL_XFORM_DQS7 */
+					0x00064000 /* EMC_DLL_XFORM_DQS8 */
+					0x00064000 /* EMC_DLL_XFORM_DQS9 */
+					0x00064000 /* EMC_DLL_XFORM_DQS10 */
+					0x00064000 /* EMC_DLL_XFORM_DQS11 */
+					0x00064000 /* EMC_DLL_XFORM_DQS12 */
+					0x00064000 /* EMC_DLL_XFORM_DQS13 */
+					0x00064000 /* EMC_DLL_XFORM_DQS14 */
+					0x00064000 /* EMC_DLL_XFORM_DQS15 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE0 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE1 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE2 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE3 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE4 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE6 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE7 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR0 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR1 */
+					0x00004000 /* EMC_DLL_XFORM_ADDR2 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR3 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR4 */
+					0x00004000 /* EMC_DLL_XFORM_ADDR5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE8 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE9 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE10 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE11 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE12 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE13 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE14 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE15 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS0 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS1 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS2 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS3 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS4 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS5 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS6 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS7 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS8 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS9 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS10 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS11 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS12 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS13 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS14 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS15 */
+					0x000fc000 /* EMC_DLL_XFORM_DQ0 */
+					0x000fc000 /* EMC_DLL_XFORM_DQ1 */
+					0x000fc000 /* EMC_DLL_XFORM_DQ2 */
+					0x000fc000 /* EMC_DLL_XFORM_DQ3 */
+					0x0000fc00 /* EMC_DLL_XFORM_DQ4 */
+					0x0000fc00 /* EMC_DLL_XFORM_DQ5 */
+					0x0000fc00 /* EMC_DLL_XFORM_DQ6 */
+					0x0000fc00 /* EMC_DLL_XFORM_DQ7 */
+					0x10000280 /* EMC_XM2CMDPADCTRL */
+					0x00000000 /* EMC_XM2CMDPADCTRL4 */
+					0x00111111 /* EMC_XM2CMDPADCTRL5 */
+					0x00000000 /* EMC_XM2DQPADCTRL2 */
+					0x00000000 /* EMC_XM2DQPADCTRL3 */
+					0x77ffc081 /* EMC_XM2CLKPADCTRL */
+					0x00000303 /* EMC_XM2CLKPADCTRL2 */
+					0x81f1f108 /* EMC_XM2COMPPADCTRL */
+					0x07070004 /* EMC_XM2VTTGENPADCTRL */
+					0x0000003f /* EMC_XM2VTTGENPADCTRL2 */
+					0x016eeeee /* EMC_XM2VTTGENPADCTRL3 */
+					0x51451400 /* EMC_XM2DQSPADCTRL3 */
+					0x00514514 /* EMC_XM2DQSPADCTRL4 */
+					0x00514514 /* EMC_XM2DQSPADCTRL5 */
+					0x51451400 /* EMC_XM2DQSPADCTRL6 */
+					0x0000003f /* EMC_DSR_VTTGEN_DRV */
+					0x00000033 /* EMC_TXDSRVTTGEN */
+					0x00000000 /* EMC_FBIO_SPARE */
+					0x00000042 /* EMC_ZCAL_WAIT_CNT */
+					0x000c000c /* EMC_MRS_WAIT_CNT2 */
+					0x00000000 /* EMC_CTT */
+					0x00000003 /* EMC_CTT_DURATION */
+					0x0000f2f3 /* EMC_CFG_PIPE */
+					0x80000713 /* EMC_DYN_SELF_REF_CONTROL */
+					0x0000000a /* EMC_QPOP */
 				>;
 			};
 
@@ -934,149 +1085,149 @@
 				nvidia,emc-zcal-interval = <0x00020000>;
 
 				nvidia,emc-configuration = <
-					0x00000009
-					0x00000035
-					0x00000000
-					0x00000007
-					0x00000002
-					0x00000005
-					0x0000000a
-					0x00000003
-					0x0000000b
-					0x00000002
-					0x00000002
-					0x00000003
-					0x00000003
-					0x00000000
-					0x00000005
-					0x00000005
-					0x00000006
-					0x00000002
-					0x00000000
-					0x00000004
-					0x00000006
-					0x00010000
-					0x00000003
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000003
-					0x0000000d
-					0x0000000f
-					0x00000011
-					0x00000607
-					0x00000000
-					0x00000181
-					0x00000002
-					0x00000002
-					0x00000001
-					0x00000000
-					0x00000032
-					0x0000000f
-					0x00000038
-					0x00000038
-					0x00000004
-					0x00000005
-					0x00000004
-					0x00000007
-					0x00000000
-					0x00000005
-					0x00000005
-					0x00000638
-					0x00000000
-					0x00000000
-					0x00000000
-					0x106aa298
-					0x002c00a0
-					0x00008000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00064000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00004000
-					0x00000000
-					0x00000000
-					0x00004000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00090000
-					0x00090000
-					0x00094000
-					0x00094000
-					0x00009400
-					0x00009000
-					0x00009000
-					0x00009000
-					0x10000280
-					0x00000000
-					0x00111111
-					0x00000000
-					0x00000000
-					0x77ffc081
-					0x00000303
-					0x81f1f108
-					0x07070004
-					0x0000003f
-					0x016eeeee
-					0x51451400
-					0x00514514
-					0x00514514
-					0x51451400
-					0x0000003f
-					0x00000066
-					0x00000000
-					0x00000100
-					0x000c000c
-					0x00000000
-					0x00000003
-					0x0000d2b3
-					0x80000d22
-					0x0000000a
+					0x00000009 /* EMC_RC */
+					0x00000035 /* EMC_RFC */
+					0x00000000 /* EMC_RFC_SLR */
+					0x00000007 /* EMC_RAS */
+					0x00000002 /* EMC_RP */
+					0x00000005 /* EMC_R2W */
+					0x0000000a /* EMC_W2R */
+					0x00000003 /* EMC_R2P */
+					0x0000000b /* EMC_W2P */
+					0x00000002 /* EMC_RD_RCD */
+					0x00000002 /* EMC_WR_RCD */
+					0x00000003 /* EMC_RRD */
+					0x00000003 /* EMC_REXT */
+					0x00000000 /* EMC_WEXT */
+					0x00000005 /* EMC_WDV */
+					0x00000005 /* EMC_WDV_MASK */
+					0x00000006 /* EMC_QUSE */
+					0x00000002 /* EMC_QUSE_WIDTH */
+					0x00000000 /* EMC_IBDLY */
+					0x00000004 /* EMC_EINPUT */
+					0x00000006 /* EMC_EINPUT_DURATION */
+					0x00010000 /* EMC_PUTERM_EXTRA */
+					0x00000003 /* EMC_PUTERM_WIDTH */
+					0x00000000 /* EMC_PUTERM_ADJ */
+					0x00000000 /* EMC_CDB_CNTL_1 */
+					0x00000000 /* EMC_CDB_CNTL_2 */
+					0x00000000 /* EMC_CDB_CNTL_3 */
+					0x00000003 /* EMC_QRST */
+					0x0000000d /* EMC_QSAFE */
+					0x0000000f /* EMC_RDV */
+					0x00000011 /* EMC_RDV_MASK */
+					0x00000607 /* EMC_REFRESH */
+					0x00000000 /* EMC_BURST_REFRESH_NUM */
+					0x00000181 /* EMC_PRE_REFRESH_REQ_CNT */
+					0x00000002 /* EMC_PDEX2WR */
+					0x00000002 /* EMC_PDEX2RD */
+					0x00000001 /* EMC_PCHG2PDEN */
+					0x00000000 /* EMC_ACT2PDEN */
+					0x00000032 /* EMC_AR2PDEN */
+					0x0000000f /* EMC_RW2PDEN */
+					0x00000038 /* EMC_TXSR */
+					0x00000038 /* EMC_TXSRDLL */
+					0x00000004 /* EMC_TCKE */
+					0x00000005 /* EMC_TCKESR */
+					0x00000004 /* EMC_TPD */
+					0x00000007 /* EMC_TFAW */
+					0x00000000 /* EMC_TRPAB */
+					0x00000005 /* EMC_TCLKSTABLE */
+					0x00000005 /* EMC_TCLKSTOP */
+					0x00000638 /* EMC_TREFBW */
+					0x00000000 /* EMC_FBIO_CFG6 */
+					0x00000000 /* EMC_ODT_WRITE */
+					0x00000000 /* EMC_ODT_READ */
+					0x106aa298 /* EMC_FBIO_CFG5 */
+					0x002c00a0 /* EMC_CFG_DIG_DLL */
+					0x00008000 /* EMC_CFG_DIG_DLL_PERIOD */
+					0x00064000 /* EMC_DLL_XFORM_DQS0 */
+					0x00064000 /* EMC_DLL_XFORM_DQS1 */
+					0x00064000 /* EMC_DLL_XFORM_DQS2 */
+					0x00064000 /* EMC_DLL_XFORM_DQS3 */
+					0x00064000 /* EMC_DLL_XFORM_DQS4 */
+					0x00064000 /* EMC_DLL_XFORM_DQS5 */
+					0x00064000 /* EMC_DLL_XFORM_DQS6 */
+					0x00064000 /* EMC_DLL_XFORM_DQS7 */
+					0x00064000 /* EMC_DLL_XFORM_DQS8 */
+					0x00064000 /* EMC_DLL_XFORM_DQS9 */
+					0x00064000 /* EMC_DLL_XFORM_DQS10 */
+					0x00064000 /* EMC_DLL_XFORM_DQS11 */
+					0x00064000 /* EMC_DLL_XFORM_DQS12 */
+					0x00064000 /* EMC_DLL_XFORM_DQS13 */
+					0x00064000 /* EMC_DLL_XFORM_DQS14 */
+					0x00064000 /* EMC_DLL_XFORM_DQS15 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE0 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE1 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE2 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE3 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE4 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE6 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE7 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR0 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR1 */
+					0x00004000 /* EMC_DLL_XFORM_ADDR2 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR3 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR4 */
+					0x00004000 /* EMC_DLL_XFORM_ADDR5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE8 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE9 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE10 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE11 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE12 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE13 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE14 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE15 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS0 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS1 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS2 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS3 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS4 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS5 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS6 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS7 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS8 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS9 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS10 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS11 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS12 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS13 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS14 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS15 */
+					0x00090000 /* EMC_DLL_XFORM_DQ0 */
+					0x00090000 /* EMC_DLL_XFORM_DQ1 */
+					0x00094000 /* EMC_DLL_XFORM_DQ2 */
+					0x00094000 /* EMC_DLL_XFORM_DQ3 */
+					0x00009400 /* EMC_DLL_XFORM_DQ4 */
+					0x00009000 /* EMC_DLL_XFORM_DQ5 */
+					0x00009000 /* EMC_DLL_XFORM_DQ6 */
+					0x00009000 /* EMC_DLL_XFORM_DQ7 */
+					0x10000280 /* EMC_XM2CMDPADCTRL */
+					0x00000000 /* EMC_XM2CMDPADCTRL4 */
+					0x00111111 /* EMC_XM2CMDPADCTRL5 */
+					0x00000000 /* EMC_XM2DQPADCTRL2 */
+					0x00000000 /* EMC_XM2DQPADCTRL3 */
+					0x77ffc081 /* EMC_XM2CLKPADCTRL */
+					0x00000303 /* EMC_XM2CLKPADCTRL2 */
+					0x81f1f108 /* EMC_XM2COMPPADCTRL */
+					0x07070004 /* EMC_XM2VTTGENPADCTRL */
+					0x0000003f /* EMC_XM2VTTGENPADCTRL2 */
+					0x016eeeee /* EMC_XM2VTTGENPADCTRL3 */
+					0x51451400 /* EMC_XM2DQSPADCTRL3 */
+					0x00514514 /* EMC_XM2DQSPADCTRL4 */
+					0x00514514 /* EMC_XM2DQSPADCTRL5 */
+					0x51451400 /* EMC_XM2DQSPADCTRL6 */
+					0x0000003f /* EMC_DSR_VTTGEN_DRV */
+					0x00000066 /* EMC_TXDSRVTTGEN */
+					0x00000000 /* EMC_FBIO_SPARE */
+					0x00000100 /* EMC_ZCAL_WAIT_CNT */
+					0x000c000c /* EMC_MRS_WAIT_CNT2 */
+					0x00000000 /* EMC_CTT */
+					0x00000003 /* EMC_CTT_DURATION */
+					0x0000d2b3 /* EMC_CFG_PIPE */
+					0x80000d22 /* EMC_DYN_SELF_REF_CONTROL */
+					0x0000000a /* EMC_QPOP */
 				>;
 			};
 
@@ -1102,149 +1253,149 @@
 				nvidia,emc-zcal-interval = <0x00020000>;
 
 				nvidia,emc-configuration = <
-					0x0000000d
-					0x0000004c
-					0x00000000
-					0x00000009
-					0x00000003
-					0x00000004
-					0x00000008
-					0x00000002
-					0x00000009
-					0x00000003
-					0x00000003
-					0x00000002
-					0x00000002
-					0x00000000
-					0x00000003
-					0x00000003
-					0x00000005
-					0x00000002
-					0x00000000
-					0x00000002
-					0x00000007
-					0x00020000
-					0x00000003
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000001
-					0x0000000e
-					0x00000010
-					0x00000012
-					0x000008e4
-					0x00000000
-					0x00000239
-					0x00000001
-					0x00000008
-					0x00000001
-					0x00000000
-					0x0000004a
-					0x0000000e
-					0x00000051
-					0x00000200
-					0x00000004
-					0x00000005
-					0x00000004
-					0x00000009
-					0x00000000
-					0x00000005
-					0x00000005
-					0x00000924
-					0x00000000
-					0x00000000
-					0x00000000
-					0x104ab098
-					0x002c00a0
-					0x00008000
-					0x00030000
-					0x00030000
-					0x00030000
-					0x00030000
-					0x00030000
-					0x00030000
-					0x00030000
-					0x00030000
-					0x00030000
-					0x00030000
-					0x00030000
-					0x00030000
-					0x00030000
-					0x00030000
-					0x00030000
-					0x00030000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00098000
-					0x00098000
-					0x00000000
-					0x00098000
-					0x00098000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00060000
-					0x00060000
-					0x00060000
-					0x00060000
-					0x00006000
-					0x00006000
-					0x00006000
-					0x00006000
-					0x10000280
-					0x00000000
-					0x00111111
-					0x00000000
-					0x00000000
-					0x77ffc081
-					0x00000101
-					0x81f1f108
-					0x07070004
-					0x00000000
-					0x016eeeee
-					0x51451420
-					0x00514514
-					0x00514514
-					0x51451400
-					0x0000003f
-					0x00000096
-					0x00000000
-					0x00000100
-					0x0174000c
-					0x00000000
-					0x00000003
-					0x000052a3
-					0x800012d7
-					0x00000009
+					0x0000000d /* EMC_RC */
+					0x0000004c /* EMC_RFC */
+					0x00000000 /* EMC_RFC_SLR */
+					0x00000009 /* EMC_RAS */
+					0x00000003 /* EMC_RP */
+					0x00000004 /* EMC_R2W */
+					0x00000008 /* EMC_W2R */
+					0x00000002 /* EMC_R2P */
+					0x00000009 /* EMC_W2P */
+					0x00000003 /* EMC_RD_RCD */
+					0x00000003 /* EMC_WR_RCD */
+					0x00000002 /* EMC_RRD */
+					0x00000002 /* EMC_REXT */
+					0x00000000 /* EMC_WEXT */
+					0x00000003 /* EMC_WDV */
+					0x00000003 /* EMC_WDV_MASK */
+					0x00000005 /* EMC_QUSE */
+					0x00000002 /* EMC_QUSE_WIDTH */
+					0x00000000 /* EMC_IBDLY */
+					0x00000002 /* EMC_EINPUT */
+					0x00000007 /* EMC_EINPUT_DURATION */
+					0x00020000 /* EMC_PUTERM_EXTRA */
+					0x00000003 /* EMC_PUTERM_WIDTH */
+					0x00000000 /* EMC_PUTERM_ADJ */
+					0x00000000 /* EMC_CDB_CNTL_1 */
+					0x00000000 /* EMC_CDB_CNTL_2 */
+					0x00000000 /* EMC_CDB_CNTL_3 */
+					0x00000001 /* EMC_QRST */
+					0x0000000e /* EMC_QSAFE */
+					0x00000010 /* EMC_RDV */
+					0x00000012 /* EMC_RDV_MASK */
+					0x000008e4 /* EMC_REFRESH */
+					0x00000000 /* EMC_BURST_REFRESH_NUM */
+					0x00000239 /* EMC_PRE_REFRESH_REQ_CNT */
+					0x00000001 /* EMC_PDEX2WR */
+					0x00000008 /* EMC_PDEX2RD */
+					0x00000001 /* EMC_PCHG2PDEN */
+					0x00000000 /* EMC_ACT2PDEN */
+					0x0000004a /* EMC_AR2PDEN */
+					0x0000000e /* EMC_RW2PDEN */
+					0x00000051 /* EMC_TXSR */
+					0x00000200 /* EMC_TXSRDLL */
+					0x00000004 /* EMC_TCKE */
+					0x00000005 /* EMC_TCKESR */
+					0x00000004 /* EMC_TPD */
+					0x00000009 /* EMC_TFAW */
+					0x00000000 /* EMC_TRPAB */
+					0x00000005 /* EMC_TCLKSTABLE */
+					0x00000005 /* EMC_TCLKSTOP */
+					0x00000924 /* EMC_TREFBW */
+					0x00000000 /* EMC_FBIO_CFG6 */
+					0x00000000 /* EMC_ODT_WRITE */
+					0x00000000 /* EMC_ODT_READ */
+					0x104ab098 /* EMC_FBIO_CFG5 */
+					0x002c00a0 /* EMC_CFG_DIG_DLL */
+					0x00008000 /* EMC_CFG_DIG_DLL_PERIOD */
+					0x00030000 /* EMC_DLL_XFORM_DQS0 */
+					0x00030000 /* EMC_DLL_XFORM_DQS1 */
+					0x00030000 /* EMC_DLL_XFORM_DQS2 */
+					0x00030000 /* EMC_DLL_XFORM_DQS3 */
+					0x00030000 /* EMC_DLL_XFORM_DQS4 */
+					0x00030000 /* EMC_DLL_XFORM_DQS5 */
+					0x00030000 /* EMC_DLL_XFORM_DQS6 */
+					0x00030000 /* EMC_DLL_XFORM_DQS7 */
+					0x00030000 /* EMC_DLL_XFORM_DQS8 */
+					0x00030000 /* EMC_DLL_XFORM_DQS9 */
+					0x00030000 /* EMC_DLL_XFORM_DQS10 */
+					0x00030000 /* EMC_DLL_XFORM_DQS11 */
+					0x00030000 /* EMC_DLL_XFORM_DQS12 */
+					0x00030000 /* EMC_DLL_XFORM_DQS13 */
+					0x00030000 /* EMC_DLL_XFORM_DQS14 */
+					0x00030000 /* EMC_DLL_XFORM_DQS15 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE0 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE1 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE2 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE3 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE4 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE6 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE7 */
+					0x00098000 /* EMC_DLL_XFORM_ADDR0 */
+					0x00098000 /* EMC_DLL_XFORM_ADDR1 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR2 */
+					0x00098000 /* EMC_DLL_XFORM_ADDR3 */
+					0x00098000 /* EMC_DLL_XFORM_ADDR4 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE8 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE9 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE10 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE11 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE12 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE13 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE14 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE15 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS0 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS1 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS2 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS3 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS4 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS5 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS6 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS7 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS8 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS9 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS10 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS11 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS12 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS13 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS14 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS15 */
+					0x00060000 /* EMC_DLL_XFORM_DQ0 */
+					0x00060000 /* EMC_DLL_XFORM_DQ1 */
+					0x00060000 /* EMC_DLL_XFORM_DQ2 */
+					0x00060000 /* EMC_DLL_XFORM_DQ3 */
+					0x00006000 /* EMC_DLL_XFORM_DQ4 */
+					0x00006000 /* EMC_DLL_XFORM_DQ5 */
+					0x00006000 /* EMC_DLL_XFORM_DQ6 */
+					0x00006000 /* EMC_DLL_XFORM_DQ7 */
+					0x10000280 /* EMC_XM2CMDPADCTRL */
+					0x00000000 /* EMC_XM2CMDPADCTRL4 */
+					0x00111111 /* EMC_XM2CMDPADCTRL5 */
+					0x00000000 /* EMC_XM2DQPADCTRL2 */
+					0x00000000 /* EMC_XM2DQPADCTRL3 */
+					0x77ffc081 /* EMC_XM2CLKPADCTRL */
+					0x00000101 /* EMC_XM2CLKPADCTRL2 */
+					0x81f1f108 /* EMC_XM2COMPPADCTRL */
+					0x07070004 /* EMC_XM2VTTGENPADCTRL */
+					0x00000000 /* EMC_XM2VTTGENPADCTRL2 */
+					0x016eeeee /* EMC_XM2VTTGENPADCTRL3 */
+					0x51451420 /* EMC_XM2DQSPADCTRL3 */
+					0x00514514 /* EMC_XM2DQSPADCTRL4 */
+					0x00514514 /* EMC_XM2DQSPADCTRL5 */
+					0x51451400 /* EMC_XM2DQSPADCTRL6 */
+					0x0000003f /* EMC_DSR_VTTGEN_DRV */
+					0x00000096 /* EMC_TXDSRVTTGEN */
+					0x00000000 /* EMC_FBIO_SPARE */
+					0x00000100 /* EMC_ZCAL_WAIT_CNT */
+					0x0174000c /* EMC_MRS_WAIT_CNT2 */
+					0x00000000 /* EMC_CTT */
+					0x00000003 /* EMC_CTT_DURATION */
+					0x000052a3 /* EMC_CFG_PIPE */
+					0x800012d7 /* EMC_DYN_SELF_REF_CONTROL */
+					0x00000009 /* EMC_QPOP */
 				>;
 			};
 
@@ -1270,149 +1421,317 @@
 				nvidia,emc-zcal-interval = <0x00020000>;
 
 				nvidia,emc-configuration = <
-					0x00000012
-					0x00000065
-					0x00000000
-					0x0000000c
-					0x00000004
-					0x00000005
-					0x00000008
-					0x00000002
-					0x0000000a
-					0x00000004
-					0x00000004
-					0x00000002
-					0x00000002
-					0x00000000
-					0x00000003
-					0x00000003
-					0x00000005
-					0x00000002
-					0x00000000
-					0x00000001
-					0x00000008
-					0x00020000
-					0x00000003
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x0000000f
-					0x00000010
-					0x00000012
-					0x00000bd1
-					0x00000000
-					0x000002f4
-					0x00000001
-					0x00000008
-					0x00000001
-					0x00000000
-					0x00000063
-					0x0000000f
-					0x0000006b
-					0x00000200
-					0x00000004
-					0x00000005
-					0x00000004
-					0x0000000d
-					0x00000000
-					0x00000005
-					0x00000005
-					0x00000c11
-					0x00000000
-					0x00000000
-					0x00000000
-					0x104ab098
-					0x002c00a0
-					0x00008000
-					0x00030000
-					0x00030000
-					0x00030000
-					0x00030000
-					0x00030000
-					0x00030000
-					0x00030000
-					0x00030000
-					0x00030000
-					0x00030000
-					0x00030000
-					0x00030000
-					0x00030000
-					0x00030000
-					0x00030000
-					0x00030000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00070000
-					0x00070000
-					0x00000000
-					0x00070000
-					0x00070000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00048000
-					0x00048000
-					0x00048000
-					0x00048000
-					0x00004800
-					0x00004800
-					0x00004800
-					0x00004800
-					0x10000280
-					0x00000000
-					0x00111111
-					0x00000000
-					0x00000000
-					0x77ffc081
-					0x00000101
-					0x81f1f108
-					0x07070004
-					0x00000000
-					0x016eeeee
-					0x51451420
-					0x00514514
-					0x00514514
-					0x51451400
-					0x0000003f
-					0x000000c6
-					0x00000000
-					0x00000100
-					0x015b000c
-					0x00000000
-					0x00000003
-					0x000052a3
-					0x8000188b
-					0x00000009
+					0x00000012 /* EMC_RC */
+					0x00000065 /* EMC_RFC */
+					0x00000000 /* EMC_RFC_SLR */
+					0x0000000c /* EMC_RAS */
+					0x00000004 /* EMC_RP */
+					0x00000005 /* EMC_R2W */
+					0x00000008 /* EMC_W2R */
+					0x00000002 /* EMC_R2P */
+					0x0000000a /* EMC_W2P */
+					0x00000004 /* EMC_RD_RCD */
+					0x00000004 /* EMC_WR_RCD */
+					0x00000002 /* EMC_RRD */
+					0x00000002 /* EMC_REXT */
+					0x00000000 /* EMC_WEXT */
+					0x00000003 /* EMC_WDV */
+					0x00000003 /* EMC_WDV_MASK */
+					0x00000005 /* EMC_QUSE */
+					0x00000002 /* EMC_QUSE_WIDTH */
+					0x00000000 /* EMC_IBDLY */
+					0x00000001 /* EMC_EINPUT */
+					0x00000008 /* EMC_EINPUT_DURATION */
+					0x00020000 /* EMC_PUTERM_EXTRA */
+					0x00000003 /* EMC_PUTERM_WIDTH */
+					0x00000000 /* EMC_PUTERM_ADJ */
+					0x00000000 /* EMC_CDB_CNTL_1 */
+					0x00000000 /* EMC_CDB_CNTL_2 */
+					0x00000000 /* EMC_CDB_CNTL_3 */
+					0x00000000 /* EMC_QRST */
+					0x0000000f /* EMC_QSAFE */
+					0x00000010 /* EMC_RDV */
+					0x00000012 /* EMC_RDV_MASK */
+					0x00000bd1 /* EMC_REFRESH */
+					0x00000000 /* EMC_BURST_REFRESH_NUM */
+					0x000002f4 /* EMC_PRE_REFRESH_REQ_CNT */
+					0x00000001 /* EMC_PDEX2WR */
+					0x00000008 /* EMC_PDEX2RD */
+					0x00000001 /* EMC_PCHG2PDEN */
+					0x00000000 /* EMC_ACT2PDEN */
+					0x00000063 /* EMC_AR2PDEN */
+					0x0000000f /* EMC_RW2PDEN */
+					0x0000006b /* EMC_TXSR */
+					0x00000200 /* EMC_TXSRDLL */
+					0x00000004 /* EMC_TCKE */
+					0x00000005 /* EMC_TCKESR */
+					0x00000004 /* EMC_TPD */
+					0x0000000d /* EMC_TFAW */
+					0x00000000 /* EMC_TRPAB */
+					0x00000005 /* EMC_TCLKSTABLE */
+					0x00000005 /* EMC_TCLKSTOP */
+					0x00000c11 /* EMC_TREFBW */
+					0x00000000 /* EMC_FBIO_CFG6 */
+					0x00000000 /* EMC_ODT_WRITE */
+					0x00000000 /* EMC_ODT_READ */
+					0x104ab098 /* EMC_FBIO_CFG5 */
+					0x002c00a0 /* EMC_CFG_DIG_DLL */
+					0x00008000 /* EMC_CFG_DIG_DLL_PERIOD */
+					0x00030000 /* EMC_DLL_XFORM_DQS0 */
+					0x00030000 /* EMC_DLL_XFORM_DQS1 */
+					0x00030000 /* EMC_DLL_XFORM_DQS2 */
+					0x00030000 /* EMC_DLL_XFORM_DQS3 */
+					0x00030000 /* EMC_DLL_XFORM_DQS4 */
+					0x00030000 /* EMC_DLL_XFORM_DQS5 */
+					0x00030000 /* EMC_DLL_XFORM_DQS6 */
+					0x00030000 /* EMC_DLL_XFORM_DQS7 */
+					0x00030000 /* EMC_DLL_XFORM_DQS8 */
+					0x00030000 /* EMC_DLL_XFORM_DQS9 */
+					0x00030000 /* EMC_DLL_XFORM_DQS10 */
+					0x00030000 /* EMC_DLL_XFORM_DQS11 */
+					0x00030000 /* EMC_DLL_XFORM_DQS12 */
+					0x00030000 /* EMC_DLL_XFORM_DQS13 */
+					0x00030000 /* EMC_DLL_XFORM_DQS14 */
+					0x00030000 /* EMC_DLL_XFORM_DQS15 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE0 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE1 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE2 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE3 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE4 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE6 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE7 */
+					0x00070000 /* EMC_DLL_XFORM_ADDR0 */
+					0x00070000 /* EMC_DLL_XFORM_ADDR1 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR2 */
+					0x00070000 /* EMC_DLL_XFORM_ADDR3 */
+					0x00070000 /* EMC_DLL_XFORM_ADDR4 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE8 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE9 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE10 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE11 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE12 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE13 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE14 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE15 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS0 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS1 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS2 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS3 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS4 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS5 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS6 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS7 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS8 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS9 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS10 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS11 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS12 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS13 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS14 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS15 */
+					0x00048000 /* EMC_DLL_XFORM_DQ0 */
+					0x00048000 /* EMC_DLL_XFORM_DQ1 */
+					0x00048000 /* EMC_DLL_XFORM_DQ2 */
+					0x00048000 /* EMC_DLL_XFORM_DQ3 */
+					0x00004800 /* EMC_DLL_XFORM_DQ4 */
+					0x00004800 /* EMC_DLL_XFORM_DQ5 */
+					0x00004800 /* EMC_DLL_XFORM_DQ6 */
+					0x00004800 /* EMC_DLL_XFORM_DQ7 */
+					0x10000280 /* EMC_XM2CMDPADCTRL */
+					0x00000000 /* EMC_XM2CMDPADCTRL4 */
+					0x00111111 /* EMC_XM2CMDPADCTRL5 */
+					0x00000000 /* EMC_XM2DQPADCTRL2 */
+					0x00000000 /* EMC_XM2DQPADCTRL3 */
+					0x77ffc081 /* EMC_XM2CLKPADCTRL */
+					0x00000101 /* EMC_XM2CLKPADCTRL2 */
+					0x81f1f108 /* EMC_XM2COMPPADCTRL */
+					0x07070004 /* EMC_XM2VTTGENPADCTRL */
+					0x00000000 /* EMC_XM2VTTGENPADCTRL2 */
+					0x016eeeee /* EMC_XM2VTTGENPADCTRL3 */
+					0x51451420 /* EMC_XM2DQSPADCTRL3 */
+					0x00514514 /* EMC_XM2DQSPADCTRL4 */
+					0x00514514 /* EMC_XM2DQSPADCTRL5 */
+					0x51451400 /* EMC_XM2DQSPADCTRL6 */
+					0x0000003f /* EMC_DSR_VTTGEN_DRV */
+					0x000000c6 /* EMC_TXDSRVTTGEN */
+					0x00000000 /* EMC_FBIO_SPARE */
+					0x00000100 /* EMC_ZCAL_WAIT_CNT */
+					0x015b000c /* EMC_MRS_WAIT_CNT2 */
+					0x00000000 /* EMC_CTT */
+					0x00000003 /* EMC_CTT_DURATION */
+					0x000052a3 /* EMC_CFG_PIPE */
+					0x8000188b /* EMC_DYN_SELF_REF_CONTROL */
+					0x00000009 /* EMC_QPOP */
+				>;
+			};
+
+			timing-528000000 {
+				clock-frequency = <528000000>;
+
+				nvidia,emc-auto-cal-config = <0xa1430000>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-bgbias-ctl0 = <0x00000000>;
+				nvidia,emc-cfg = <0x73300000>;
+				nvidia,emc-cfg-2 = <0x0000089d>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mode-1 = <0x80100002>;
+				nvidia,emc-mode-2 = <0x80200008>;
+				nvidia,emc-mode-4 = <0x00000000>;
+				nvidia,emc-mode-reset = <0x80000941>;
+				nvidia,emc-mrs-wait-cnt = <0x013a000c>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040008>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0123133d>;
+				nvidia,emc-zcal-cnt-long = <0x00000042>;
+				nvidia,emc-zcal-interval = <0x00020000>;
+
+				nvidia,emc-configuration = <
+					0x00000018 /* EMC_RC */
+					0x00000088 /* EMC_RFC */
+					0x00000000 /* EMC_RFC_SLR */
+					0x00000011 /* EMC_RAS */
+					0x00000006 /* EMC_RP */
+					0x00000006 /* EMC_R2W */
+					0x00000009 /* EMC_W2R */
+					0x00000002 /* EMC_R2P */
+					0x0000000d /* EMC_W2P */
+					0x00000006 /* EMC_RD_RCD */
+					0x00000006 /* EMC_WR_RCD */
+					0x00000002 /* EMC_RRD */
+					0x00000002 /* EMC_REXT */
+					0x00000000 /* EMC_WEXT */
+					0x00000003 /* EMC_WDV */
+					0x00000003 /* EMC_WDV_MASK */
+					0x00000007 /* EMC_QUSE */
+					0x00000002 /* EMC_QUSE_WIDTH */
+					0x00000000 /* EMC_IBDLY */
+					0x00000002 /* EMC_EINPUT */
+					0x00000009 /* EMC_EINPUT_DURATION */
+					0x00040000 /* EMC_PUTERM_EXTRA */
+					0x00000003 /* EMC_PUTERM_WIDTH */
+					0x00000000 /* EMC_PUTERM_ADJ */
+					0x00000000 /* EMC_CDB_CNTL_1 */
+					0x00000000 /* EMC_CDB_CNTL_2 */
+					0x00000000 /* EMC_CDB_CNTL_3 */
+					0x00000001 /* EMC_QRST */
+					0x00000010 /* EMC_QSAFE */
+					0x00000013 /* EMC_RDV */
+					0x00000015 /* EMC_RDV_MASK */
+					0x00000fd6 /* EMC_REFRESH */
+					0x00000000 /* EMC_BURST_REFRESH_NUM */
+					0x000003f5 /* EMC_PRE_REFRESH_REQ_CNT */
+					0x00000002 /* EMC_PDEX2WR */
+					0x0000000b /* EMC_PDEX2RD */
+					0x00000001 /* EMC_PCHG2PDEN */
+					0x00000000 /* EMC_ACT2PDEN */
+					0x00000084 /* EMC_AR2PDEN */
+					0x00000012 /* EMC_RW2PDEN */
+					0x0000008f /* EMC_TXSR */
+					0x00000200 /* EMC_TXSRDLL */
+					0x00000004 /* EMC_TCKE */
+					0x00000005 /* EMC_TCKESR */
+					0x00000004 /* EMC_TPD */
+					0x00000013 /* EMC_TFAW */
+					0x00000000 /* EMC_TRPAB */
+					0x00000006 /* EMC_TCLKSTABLE */
+					0x00000006 /* EMC_TCLKSTOP */
+					0x00001017 /* EMC_TREFBW */
+					0x00000000 /* EMC_FBIO_CFG6 */
+					0x00000000 /* EMC_ODT_WRITE */
+					0x00000000 /* EMC_ODT_READ */
+					0x104ab098 /* EMC_FBIO_CFG5 */
+					0xe01200b1 /* EMC_CFG_DIG_DLL */
+					0x00008000 /* EMC_CFG_DIG_DLL_PERIOD */
+					0x0000000a /* EMC_DLL_XFORM_DQS0 */
+					0x0000000a /* EMC_DLL_XFORM_DQS1 */
+					0x0000000a /* EMC_DLL_XFORM_DQS2 */
+					0x0000000a /* EMC_DLL_XFORM_DQS3 */
+					0x0000000a /* EMC_DLL_XFORM_DQS4 */
+					0x0000000a /* EMC_DLL_XFORM_DQS5 */
+					0x0000000a /* EMC_DLL_XFORM_DQS6 */
+					0x0000000a /* EMC_DLL_XFORM_DQS7 */
+					0x0000000a /* EMC_DLL_XFORM_DQS8 */
+					0x0000000a /* EMC_DLL_XFORM_DQS9 */
+					0x0000000a /* EMC_DLL_XFORM_DQS10 */
+					0x0000000a /* EMC_DLL_XFORM_DQS11 */
+					0x0000000a /* EMC_DLL_XFORM_DQS12 */
+					0x0000000a /* EMC_DLL_XFORM_DQS13 */
+					0x0000000a /* EMC_DLL_XFORM_DQS14 */
+					0x0000000a /* EMC_DLL_XFORM_DQS15 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE0 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE1 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE2 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE3 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE4 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE6 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE7 */
+					0x00050000 /* EMC_DLL_XFORM_ADDR0 */
+					0x00050000 /* EMC_DLL_XFORM_ADDR1 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR2 */
+					0x00050000 /* EMC_DLL_XFORM_ADDR3 */
+					0x00050000 /* EMC_DLL_XFORM_ADDR4 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE8 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE9 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE10 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE11 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE12 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE13 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE14 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE15 */
+					0x00000002 /* EMC_DLI_TRIM_TXDQS0 */
+					0x00000002 /* EMC_DLI_TRIM_TXDQS1 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS2 */
+					0x00000003 /* EMC_DLI_TRIM_TXDQS3 */
+					0x00000004 /* EMC_DLI_TRIM_TXDQS4 */
+					0x00000001 /* EMC_DLI_TRIM_TXDQS5 */
+					0x00000004 /* EMC_DLI_TRIM_TXDQS6 */
+					0x00000003 /* EMC_DLI_TRIM_TXDQS7 */
+					0x00000002 /* EMC_DLI_TRIM_TXDQS8 */
+					0x00000002 /* EMC_DLI_TRIM_TXDQS9 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS10 */
+					0x00000003 /* EMC_DLI_TRIM_TXDQS11 */
+					0x00000004 /* EMC_DLI_TRIM_TXDQS12 */
+					0x00000001 /* EMC_DLI_TRIM_TXDQS13 */
+					0x00000004 /* EMC_DLI_TRIM_TXDQS14 */
+					0x00000003 /* EMC_DLI_TRIM_TXDQS15 */
+					0x0000000e /* EMC_DLL_XFORM_DQ0 */
+					0x0000000e /* EMC_DLL_XFORM_DQ1 */
+					0x0000000e /* EMC_DLL_XFORM_DQ2 */
+					0x0000000e /* EMC_DLL_XFORM_DQ3 */
+					0x0000000e /* EMC_DLL_XFORM_DQ4 */
+					0x0000000e /* EMC_DLL_XFORM_DQ5 */
+					0x0000000e /* EMC_DLL_XFORM_DQ6 */
+					0x0000000e /* EMC_DLL_XFORM_DQ7 */
+					0x100002a0 /* EMC_XM2CMDPADCTRL */
+					0x00000000 /* EMC_XM2CMDPADCTRL4 */
+					0x00111111 /* EMC_XM2CMDPADCTRL5 */
+					0x00000000 /* EMC_XM2DQPADCTRL2 */
+					0x00000000 /* EMC_XM2DQPADCTRL3 */
+					0x77ffc085 /* EMC_XM2CLKPADCTRL */
+					0x00000101 /* EMC_XM2CLKPADCTRL2 */
+					0x81f1f108 /* EMC_XM2COMPPADCTRL */
+					0x07070004 /* EMC_XM2VTTGENPADCTRL */
+					0x00000000 /* EMC_XM2VTTGENPADCTRL2 */
+					0x016eeeee /* EMC_XM2VTTGENPADCTRL3 */
+					0x51451420 /* EMC_XM2DQSPADCTRL3 */
+					0x00514514 /* EMC_XM2DQSPADCTRL4 */
+					0x00514514 /* EMC_XM2DQSPADCTRL5 */
+					0x51451400 /* EMC_XM2DQSPADCTRL6 */
+					0x0606003f /* EMC_DSR_VTTGEN_DRV */
+					0x00000000 /* EMC_TXDSRVTTGEN */
+					0x00000000 /* EMC_FBIO_SPARE */
+					0x00000100 /* EMC_ZCAL_WAIT_CNT */
+					0x013a000c /* EMC_MRS_WAIT_CNT2 */
+					0x00000000 /* EMC_CTT */
+					0x00000003 /* EMC_CTT_DURATION */
+					0x000042a0 /* EMC_CFG_PIPE */
+					0x80002062 /* EMC_DYN_SELF_REF_CONTROL */
+					0x0000000b /* EMC_QPOP */
 				>;
 			};
 
@@ -1438,149 +1757,149 @@
 				nvidia,emc-zcal-interval = <0x00020000>;
 
 				nvidia,emc-configuration = <
-					0x0000001c
-					0x0000009a
-					0x00000000
-					0x00000013
-					0x00000007
-					0x00000007
-					0x0000000b
-					0x00000003
-					0x00000010
-					0x00000007
-					0x00000007
-					0x00000002
-					0x00000002
-					0x00000000
-					0x00000005
-					0x00000005
-					0x0000000a
-					0x00000002
-					0x00000000
-					0x00000003
-					0x0000000b
-					0x00070000
-					0x00000003
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000002
-					0x00000012
-					0x00000016
-					0x00000018
-					0x00001208
-					0x00000000
-					0x00000482
-					0x00000002
-					0x0000000d
-					0x00000001
-					0x00000000
-					0x00000096
-					0x00000015
-					0x000000a2
-					0x00000200
-					0x00000004
-					0x00000005
-					0x00000004
-					0x00000015
-					0x00000000
-					0x00000006
-					0x00000006
-					0x00001249
-					0x00000000
-					0x00000000
-					0x00000000
-					0x104ab098
-					0xe00e00b1
-					0x00008000
-					0x0000000a
-					0x0000000a
-					0x0000000a
-					0x0000000a
-					0x0000000a
-					0x0000000a
-					0x0000000a
-					0x0000000a
-					0x0000000a
-					0x0000000a
-					0x0000000a
-					0x0000000a
-					0x0000000a
-					0x0000000a
-					0x0000000a
-					0x0000000a
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00048000
-					0x00048000
-					0x00000000
-					0x00048000
-					0x00048000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000004
-					0x00000004
-					0x00000002
-					0x00000005
-					0x00000006
-					0x00000003
-					0x00000006
-					0x00000005
-					0x00000004
-					0x00000004
-					0x00000002
-					0x00000005
-					0x00000006
-					0x00000003
-					0x00000006
-					0x00000005
-					0x0000000e
-					0x0000000e
-					0x0000000e
-					0x0000000e
-					0x0000000e
-					0x0000000e
-					0x0000000e
-					0x0000000e
-					0x100002a0
-					0x00000000
-					0x00111111
-					0x00000000
-					0x00000000
-					0x77ffc085
-					0x00000101
-					0x81f1f108
-					0x07070004
-					0x00000000
-					0x016eeeee
-					0x51451420
-					0x00514514
-					0x00514514
-					0x51451400
-					0x0606003f
-					0x00000000
-					0x00000000
-					0x00000100
-					0x0128000c
-					0x00000000
-					0x00000003
-					0x000040a0
-					0x800024aa
-					0x0000000e
+					0x0000001c /* EMC_RC */
+					0x0000009a /* EMC_RFC */
+					0x00000000 /* EMC_RFC_SLR */
+					0x00000013 /* EMC_RAS */
+					0x00000007 /* EMC_RP */
+					0x00000007 /* EMC_R2W */
+					0x0000000b /* EMC_W2R */
+					0x00000003 /* EMC_R2P */
+					0x00000010 /* EMC_W2P */
+					0x00000007 /* EMC_RD_RCD */
+					0x00000007 /* EMC_WR_RCD */
+					0x00000002 /* EMC_RRD */
+					0x00000002 /* EMC_REXT */
+					0x00000000 /* EMC_WEXT */
+					0x00000005 /* EMC_WDV */
+					0x00000005 /* EMC_WDV_MASK */
+					0x0000000a /* EMC_QUSE */
+					0x00000002 /* EMC_QUSE_WIDTH */
+					0x00000000 /* EMC_IBDLY */
+					0x00000003 /* EMC_EINPUT */
+					0x0000000b /* EMC_EINPUT_DURATION */
+					0x00070000 /* EMC_PUTERM_EXTRA */
+					0x00000003 /* EMC_PUTERM_WIDTH */
+					0x00000000 /* EMC_PUTERM_ADJ */
+					0x00000000 /* EMC_CDB_CNTL_1 */
+					0x00000000 /* EMC_CDB_CNTL_2 */
+					0x00000000 /* EMC_CDB_CNTL_3 */
+					0x00000002 /* EMC_QRST */
+					0x00000012 /* EMC_QSAFE */
+					0x00000016 /* EMC_RDV */
+					0x00000018 /* EMC_RDV_MASK */
+					0x00001208 /* EMC_REFRESH */
+					0x00000000 /* EMC_BURST_REFRESH_NUM */
+					0x00000482 /* EMC_PRE_REFRESH_REQ_CNT */
+					0x00000002 /* EMC_PDEX2WR */
+					0x0000000d /* EMC_PDEX2RD */
+					0x00000001 /* EMC_PCHG2PDEN */
+					0x00000000 /* EMC_ACT2PDEN */
+					0x00000096 /* EMC_AR2PDEN */
+					0x00000015 /* EMC_RW2PDEN */
+					0x000000a2 /* EMC_TXSR */
+					0x00000200 /* EMC_TXSRDLL */
+					0x00000004 /* EMC_TCKE */
+					0x00000005 /* EMC_TCKESR */
+					0x00000004 /* EMC_TPD */
+					0x00000015 /* EMC_TFAW */
+					0x00000000 /* EMC_TRPAB */
+					0x00000006 /* EMC_TCLKSTABLE */
+					0x00000006 /* EMC_TCLKSTOP */
+					0x00001249 /* EMC_TREFBW */
+					0x00000000 /* EMC_FBIO_CFG6 */
+					0x00000000 /* EMC_ODT_WRITE */
+					0x00000000 /* EMC_ODT_READ */
+					0x104ab098 /* EMC_FBIO_CFG5 */
+					0xe00e00b1 /* EMC_CFG_DIG_DLL */
+					0x00008000 /* EMC_CFG_DIG_DLL_PERIOD */
+					0x0000000a /* EMC_DLL_XFORM_DQS0 */
+					0x0000000a /* EMC_DLL_XFORM_DQS1 */
+					0x0000000a /* EMC_DLL_XFORM_DQS2 */
+					0x0000000a /* EMC_DLL_XFORM_DQS3 */
+					0x0000000a /* EMC_DLL_XFORM_DQS4 */
+					0x0000000a /* EMC_DLL_XFORM_DQS5 */
+					0x0000000a /* EMC_DLL_XFORM_DQS6 */
+					0x0000000a /* EMC_DLL_XFORM_DQS7 */
+					0x0000000a /* EMC_DLL_XFORM_DQS8 */
+					0x0000000a /* EMC_DLL_XFORM_DQS9 */
+					0x0000000a /* EMC_DLL_XFORM_DQS10 */
+					0x0000000a /* EMC_DLL_XFORM_DQS11 */
+					0x0000000a /* EMC_DLL_XFORM_DQS12 */
+					0x0000000a /* EMC_DLL_XFORM_DQS13 */
+					0x0000000a /* EMC_DLL_XFORM_DQS14 */
+					0x0000000a /* EMC_DLL_XFORM_DQS15 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE0 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE1 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE2 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE3 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE4 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE6 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE7 */
+					0x00048000 /* EMC_DLL_XFORM_ADDR0 */
+					0x00048000 /* EMC_DLL_XFORM_ADDR1 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR2 */
+					0x00048000 /* EMC_DLL_XFORM_ADDR3 */
+					0x00048000 /* EMC_DLL_XFORM_ADDR4 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE8 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE9 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE10 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE11 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE12 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE13 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE14 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE15 */
+					0x00000004 /* EMC_DLI_TRIM_TXDQS0 */
+					0x00000004 /* EMC_DLI_TRIM_TXDQS1 */
+					0x00000002 /* EMC_DLI_TRIM_TXDQS2 */
+					0x00000005 /* EMC_DLI_TRIM_TXDQS3 */
+					0x00000006 /* EMC_DLI_TRIM_TXDQS4 */
+					0x00000003 /* EMC_DLI_TRIM_TXDQS5 */
+					0x00000006 /* EMC_DLI_TRIM_TXDQS6 */
+					0x00000005 /* EMC_DLI_TRIM_TXDQS7 */
+					0x00000004 /* EMC_DLI_TRIM_TXDQS8 */
+					0x00000004 /* EMC_DLI_TRIM_TXDQS9 */
+					0x00000002 /* EMC_DLI_TRIM_TXDQS10 */
+					0x00000005 /* EMC_DLI_TRIM_TXDQS11 */
+					0x00000006 /* EMC_DLI_TRIM_TXDQS12 */
+					0x00000003 /* EMC_DLI_TRIM_TXDQS13 */
+					0x00000006 /* EMC_DLI_TRIM_TXDQS14 */
+					0x00000005 /* EMC_DLI_TRIM_TXDQS15 */
+					0x0000000e /* EMC_DLL_XFORM_DQ0 */
+					0x0000000e /* EMC_DLL_XFORM_DQ1 */
+					0x0000000e /* EMC_DLL_XFORM_DQ2 */
+					0x0000000e /* EMC_DLL_XFORM_DQ3 */
+					0x0000000e /* EMC_DLL_XFORM_DQ4 */
+					0x0000000e /* EMC_DLL_XFORM_DQ5 */
+					0x0000000e /* EMC_DLL_XFORM_DQ6 */
+					0x0000000e /* EMC_DLL_XFORM_DQ7 */
+					0x100002a0 /* EMC_XM2CMDPADCTRL */
+					0x00000000 /* EMC_XM2CMDPADCTRL4 */
+					0x00111111 /* EMC_XM2CMDPADCTRL5 */
+					0x00000000 /* EMC_XM2DQPADCTRL2 */
+					0x00000000 /* EMC_XM2DQPADCTRL3 */
+					0x77ffc085 /* EMC_XM2CLKPADCTRL */
+					0x00000101 /* EMC_XM2CLKPADCTRL2 */
+					0x81f1f108 /* EMC_XM2COMPPADCTRL */
+					0x07070004 /* EMC_XM2VTTGENPADCTRL */
+					0x00000000 /* EMC_XM2VTTGENPADCTRL2 */
+					0x016eeeee /* EMC_XM2VTTGENPADCTRL3 */
+					0x51451420 /* EMC_XM2DQSPADCTRL3 */
+					0x00514514 /* EMC_XM2DQSPADCTRL4 */
+					0x00514514 /* EMC_XM2DQSPADCTRL5 */
+					0x51451400 /* EMC_XM2DQSPADCTRL6 */
+					0x0606003f /* EMC_DSR_VTTGEN_DRV */
+					0x00000000 /* EMC_TXDSRVTTGEN */
+					0x00000000 /* EMC_FBIO_SPARE */
+					0x00000100 /* EMC_ZCAL_WAIT_CNT */
+					0x0128000c /* EMC_MRS_WAIT_CNT2 */
+					0x00000000 /* EMC_CTT */
+					0x00000003 /* EMC_CTT_DURATION */
+					0x000040a0 /* EMC_CFG_PIPE */
+					0x800024aa /* EMC_DYN_SELF_REF_CONTROL */
+					0x0000000e /* EMC_QPOP */
 				>;
 			};
 
@@ -1606,365 +1925,4673 @@
 				nvidia,emc-zcal-interval = <0x00020000>;
 
 				nvidia,emc-configuration = <
-					0x00000025
-					0x000000cc
-					0x00000000
-					0x0000001a
-					0x00000009
-					0x00000008
-					0x0000000d
-					0x00000004
-					0x00000013
-					0x00000009
-					0x00000009
-					0x00000003
-					0x00000002
-					0x00000000
-					0x00000006
-					0x00000006
-					0x0000000b
-					0x00000002
-					0x00000000
-					0x00000002
-					0x0000000d
-					0x00080000
-					0x00000004
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000001
-					0x00000014
-					0x00000018
-					0x0000001a
-					0x000017e2
-					0x00000000
-					0x000005f8
-					0x00000003
-					0x00000011
-					0x00000001
-					0x00000000
-					0x000000c6
-					0x00000018
-					0x000000d6
-					0x00000200
-					0x00000005
-					0x00000006
-					0x00000005
-					0x0000001d
-					0x00000000
-					0x00000008
-					0x00000008
-					0x00001822
-					0x00000000
-					0x80000005
-					0x00000000
-					0x104ab198
-					0xe00700b1
-					0x00008000
-					0x00000005
-					0x00000005
-					0x00000005
-					0x00000005
-					0x00000005
-					0x00000005
-					0x00000005
-					0x00000005
-					0x00000005
-					0x00000005
-					0x00000005
-					0x00000005
-					0x00000005
-					0x00000005
-					0x00000005
-					0x00000005
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00034000
-					0x00034000
-					0x00000000
-					0x00034000
-					0x00034000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000000
-					0x00000008
-					0x00000008
-					0x00000005
-					0x00000009
-					0x00000009
-					0x00000007
-					0x00000009
-					0x00000008
-					0x00000008
-					0x00000008
-					0x00000005
-					0x00000009
-					0x00000009
-					0x00000007
-					0x00000009
-					0x00000008
-					0x0000000a
-					0x0000000a
-					0x0000000a
-					0x0000000a
-					0x0000000a
-					0x0000000a
-					0x0000000a
-					0x0000000a
-					0x100002a0
-					0x00000000
-					0x00111111
-					0x00000000
-					0x00000000
-					0x77ffc085
-					0x00000101
-					0x81f1f108
-					0x07070004
-					0x00000000
-					0x016eeeee
-					0x61861820
-					0x00514514
-					0x00514514
-					0x61861800
-					0x0606003f
-					0x00000000
-					0x00000000
-					0x00000100
-					0x00f8000c
-					0x00000007
-					0x00000004
-					0x00004080
-					0x80003012
-					0x0000000f
+					0x00000025 /* EMC_RC */
+					0x000000cc /* EMC_RFC */
+					0x00000000 /* EMC_RFC_SLR */
+					0x0000001a /* EMC_RAS */
+					0x00000009 /* EMC_RP */
+					0x00000008 /* EMC_R2W */
+					0x0000000d /* EMC_W2R */
+					0x00000004 /* EMC_R2P */
+					0x00000013 /* EMC_W2P */
+					0x00000009 /* EMC_RD_RCD */
+					0x00000009 /* EMC_WR_RCD */
+					0x00000003 /* EMC_RRD */
+					0x00000002 /* EMC_REXT */
+					0x00000000 /* EMC_WEXT */
+					0x00000006 /* EMC_WDV */
+					0x00000006 /* EMC_WDV_MASK */
+					0x0000000b /* EMC_QUSE */
+					0x00000002 /* EMC_QUSE_WIDTH */
+					0x00000000 /* EMC_IBDLY */
+					0x00000002 /* EMC_EINPUT */
+					0x0000000d /* EMC_EINPUT_DURATION */
+					0x00080000 /* EMC_PUTERM_EXTRA */
+					0x00000004 /* EMC_PUTERM_WIDTH */
+					0x00000000 /* EMC_PUTERM_ADJ */
+					0x00000000 /* EMC_CDB_CNTL_1 */
+					0x00000000 /* EMC_CDB_CNTL_2 */
+					0x00000000 /* EMC_CDB_CNTL_3 */
+					0x00000001 /* EMC_QRST */
+					0x00000014 /* EMC_QSAFE */
+					0x00000018 /* EMC_RDV */
+					0x0000001a /* EMC_RDV_MASK */
+					0x000017e2 /* EMC_REFRESH */
+					0x00000000 /* EMC_BURST_REFRESH_NUM */
+					0x000005f8 /* EMC_PRE_REFRESH_REQ_CNT */
+					0x00000003 /* EMC_PDEX2WR */
+					0x00000011 /* EMC_PDEX2RD */
+					0x00000001 /* EMC_PCHG2PDEN */
+					0x00000000 /* EMC_ACT2PDEN */
+					0x000000c6 /* EMC_AR2PDEN */
+					0x00000018 /* EMC_RW2PDEN */
+					0x000000d6 /* EMC_TXSR */
+					0x00000200 /* EMC_TXSRDLL */
+					0x00000005 /* EMC_TCKE */
+					0x00000006 /* EMC_TCKESR */
+					0x00000005 /* EMC_TPD */
+					0x0000001d /* EMC_TFAW */
+					0x00000000 /* EMC_TRPAB */
+					0x00000008 /* EMC_TCLKSTABLE */
+					0x00000008 /* EMC_TCLKSTOP */
+					0x00001822 /* EMC_TREFBW */
+					0x00000000 /* EMC_FBIO_CFG6 */
+					0x80000005 /* EMC_ODT_WRITE */
+					0x00000000 /* EMC_ODT_READ */
+					0x104ab198 /* EMC_FBIO_CFG5 */
+					0xe00700b1 /* EMC_CFG_DIG_DLL */
+					0x00008000 /* EMC_CFG_DIG_DLL_PERIOD */
+					0x00000005 /* EMC_DLL_XFORM_DQS0 */
+					0x00000005 /* EMC_DLL_XFORM_DQS1 */
+					0x00000005 /* EMC_DLL_XFORM_DQS2 */
+					0x00000005 /* EMC_DLL_XFORM_DQS3 */
+					0x00000005 /* EMC_DLL_XFORM_DQS4 */
+					0x00000005 /* EMC_DLL_XFORM_DQS5 */
+					0x00000005 /* EMC_DLL_XFORM_DQS6 */
+					0x00000005 /* EMC_DLL_XFORM_DQS7 */
+					0x00000005 /* EMC_DLL_XFORM_DQS8 */
+					0x00000005 /* EMC_DLL_XFORM_DQS9 */
+					0x00000005 /* EMC_DLL_XFORM_DQS10 */
+					0x00000005 /* EMC_DLL_XFORM_DQS11 */
+					0x00000005 /* EMC_DLL_XFORM_DQS12 */
+					0x00000005 /* EMC_DLL_XFORM_DQS13 */
+					0x00000005 /* EMC_DLL_XFORM_DQS14 */
+					0x00000005 /* EMC_DLL_XFORM_DQS15 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE0 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE1 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE2 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE3 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE4 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE6 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE7 */
+					0x00034000 /* EMC_DLL_XFORM_ADDR0 */
+					0x00034000 /* EMC_DLL_XFORM_ADDR1 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR2 */
+					0x00034000 /* EMC_DLL_XFORM_ADDR3 */
+					0x00034000 /* EMC_DLL_XFORM_ADDR4 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE8 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE9 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE10 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE11 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE12 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE13 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE14 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE15 */
+					0x00000008 /* EMC_DLI_TRIM_TXDQS0 */
+					0x00000008 /* EMC_DLI_TRIM_TXDQS1 */
+					0x00000005 /* EMC_DLI_TRIM_TXDQS2 */
+					0x00000009 /* EMC_DLI_TRIM_TXDQS3 */
+					0x00000009 /* EMC_DLI_TRIM_TXDQS4 */
+					0x00000007 /* EMC_DLI_TRIM_TXDQS5 */
+					0x00000009 /* EMC_DLI_TRIM_TXDQS6 */
+					0x00000008 /* EMC_DLI_TRIM_TXDQS7 */
+					0x00000008 /* EMC_DLI_TRIM_TXDQS8 */
+					0x00000008 /* EMC_DLI_TRIM_TXDQS9 */
+					0x00000005 /* EMC_DLI_TRIM_TXDQS10 */
+					0x00000009 /* EMC_DLI_TRIM_TXDQS11 */
+					0x00000009 /* EMC_DLI_TRIM_TXDQS12 */
+					0x00000007 /* EMC_DLI_TRIM_TXDQS13 */
+					0x00000009 /* EMC_DLI_TRIM_TXDQS14 */
+					0x00000008 /* EMC_DLI_TRIM_TXDQS15 */
+					0x0000000a /* EMC_DLL_XFORM_DQ0 */
+					0x0000000a /* EMC_DLL_XFORM_DQ1 */
+					0x0000000a /* EMC_DLL_XFORM_DQ2 */
+					0x0000000a /* EMC_DLL_XFORM_DQ3 */
+					0x0000000a /* EMC_DLL_XFORM_DQ4 */
+					0x0000000a /* EMC_DLL_XFORM_DQ5 */
+					0x0000000a /* EMC_DLL_XFORM_DQ6 */
+					0x0000000a /* EMC_DLL_XFORM_DQ7 */
+					0x100002a0 /* EMC_XM2CMDPADCTRL */
+					0x00000000 /* EMC_XM2CMDPADCTRL4 */
+					0x00111111 /* EMC_XM2CMDPADCTRL5 */
+					0x00000000 /* EMC_XM2DQPADCTRL2 */
+					0x00000000 /* EMC_XM2DQPADCTRL3 */
+					0x77ffc085 /* EMC_XM2CLKPADCTRL */
+					0x00000101 /* EMC_XM2CLKPADCTRL2 */
+					0x81f1f108 /* EMC_XM2COMPPADCTRL */
+					0x07070004 /* EMC_XM2VTTGENPADCTRL */
+					0x00000000 /* EMC_XM2VTTGENPADCTRL2 */
+					0x016eeeee /* EMC_XM2VTTGENPADCTRL3 */
+					0x61861820 /* EMC_XM2DQSPADCTRL3 */
+					0x00514514 /* EMC_XM2DQSPADCTRL4 */
+					0x00514514 /* EMC_XM2DQSPADCTRL5 */
+					0x61861800 /* EMC_XM2DQSPADCTRL6 */
+					0x0606003f /* EMC_DSR_VTTGEN_DRV */
+					0x00000000 /* EMC_TXDSRVTTGEN */
+					0x00000000 /* EMC_FBIO_SPARE */
+					0x00000100 /* EMC_ZCAL_WAIT_CNT */
+					0x00f8000c /* EMC_MRS_WAIT_CNT2 */
+					0x00000007 /* EMC_CTT */
+					0x00000004 /* EMC_CTT_DURATION */
+					0x00004080 /* EMC_CFG_PIPE */
+					0x80003012 /* EMC_DYN_SELF_REF_CONTROL */
+					0x0000000f /* EMC_QPOP */
 				>;
 			};
-
 		};
-	};
-
-	memory-controller@70019000 {
-		emc-timings-1 {
-			nvidia,ram-code = <1>;
 
+		emc-timings-4 {
+			nvidia,ram-code = <4>;
 
 			timing-12750000 {
 				clock-frequency = <12750000>;
 
-				nvidia,emem-configuration = <
-					0x40040001
-					0x8000000a
-					0x00000001
-					0x00000001
-					0x00000002
-					0x00000000
-					0x00000002
-					0x00000001
-					0x00000002
-					0x00000008
-					0x00000003
-					0x00000002
-					0x00000003
-					0x00000006
-					0x06030203
-					0x000a0402
-					0x77e30303
-					0x70000f03
-					0x001f0000
+				nvidia,emc-auto-cal-config = <0xa1430000>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-bgbias-ctl0 = <0x00000008>;
+				nvidia,emc-cfg = <0x73240000>;
+				nvidia,emc-cfg-2 = <0x000008c5>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mode-1 = <0x00100003>;
+				nvidia,emc-mode-2 = <0x00200008>;
+				nvidia,emc-mode-4 = <0x00000000>;
+				nvidia,emc-mode-reset = <0x00001221>;
+				nvidia,emc-mrs-wait-cnt = <0x000e000e>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040128>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0130b118>;
+				nvidia,emc-zcal-cnt-long = <0x00000042>;
+				nvidia,emc-zcal-interval = <0x00000000>;
+
+				nvidia,emc-configuration = <
+					0x00000000 /* EMC_RC */
+					0x00000004 /* EMC_RFC */
+					0x00000000 /* EMC_RFC_SLR */
+					0x00000000 /* EMC_RAS */
+					0x00000000 /* EMC_RP */
+					0x00000004 /* EMC_R2W */
+					0x0000000a /* EMC_W2R */
+					0x00000005 /* EMC_R2P */
+					0x0000000b /* EMC_W2P */
+					0x00000000 /* EMC_RD_RCD */
+					0x00000000 /* EMC_WR_RCD */
+					0x00000003 /* EMC_RRD */
+					0x00000003 /* EMC_REXT */
+					0x00000000 /* EMC_WEXT */
+					0x00000006 /* EMC_WDV */
+					0x00000006 /* EMC_WDV_MASK */
+					0x00000006 /* EMC_QUSE */
+					0x00000002 /* EMC_QUSE_WIDTH */
+					0x00000000 /* EMC_IBDLY */
+					0x00000005 /* EMC_EINPUT */
+					0x00000005 /* EMC_EINPUT_DURATION */
+					0x00010000 /* EMC_PUTERM_EXTRA */
+					0x00000003 /* EMC_PUTERM_WIDTH */
+					0x00000000 /* EMC_PUTERM_ADJ */
+					0x00000000 /* EMC_CDB_CNTL_1 */
+					0x00000000 /* EMC_CDB_CNTL_2 */
+					0x00000000 /* EMC_CDB_CNTL_3 */
+					0x00000004 /* EMC_QRST */
+					0x0000000c /* EMC_QSAFE */
+					0x0000000d /* EMC_RDV */
+					0x0000000f /* EMC_RDV_MASK */
+					0x00000060 /* EMC_REFRESH */
+					0x00000000 /* EMC_BURST_REFRESH_NUM */
+					0x00000018 /* EMC_PRE_REFRESH_REQ_CNT */
+					0x00000002 /* EMC_PDEX2WR */
+					0x00000002 /* EMC_PDEX2RD */
+					0x00000001 /* EMC_PCHG2PDEN */
+					0x00000000 /* EMC_ACT2PDEN */
+					0x00000007 /* EMC_AR2PDEN */
+					0x0000000f /* EMC_RW2PDEN */
+					0x00000005 /* EMC_TXSR */
+					0x00000005 /* EMC_TXSRDLL */
+					0x00000004 /* EMC_TCKE */
+					0x00000005 /* EMC_TCKESR */
+					0x00000004 /* EMC_TPD */
+					0x00000000 /* EMC_TFAW */
+					0x00000000 /* EMC_TRPAB */
+					0x00000005 /* EMC_TCLKSTABLE */
+					0x00000005 /* EMC_TCLKSTOP */
+					0x00000064 /* EMC_TREFBW */
+					0x00000000 /* EMC_FBIO_CFG6 */
+					0x00000000 /* EMC_ODT_WRITE */
+					0x00000000 /* EMC_ODT_READ */
+					0x106aa298 /* EMC_FBIO_CFG5 */
+					0x002c00a0 /* EMC_CFG_DIG_DLL */
+					0x00008000 /* EMC_CFG_DIG_DLL_PERIOD */
+					0x00064000 /* EMC_DLL_XFORM_DQS0 */
+					0x00064000 /* EMC_DLL_XFORM_DQS1 */
+					0x00064000 /* EMC_DLL_XFORM_DQS2 */
+					0x00064000 /* EMC_DLL_XFORM_DQS3 */
+					0x00064000 /* EMC_DLL_XFORM_DQS4 */
+					0x00064000 /* EMC_DLL_XFORM_DQS5 */
+					0x00064000 /* EMC_DLL_XFORM_DQS6 */
+					0x00064000 /* EMC_DLL_XFORM_DQS7 */
+					0x00064000 /* EMC_DLL_XFORM_DQS8 */
+					0x00064000 /* EMC_DLL_XFORM_DQS9 */
+					0x00064000 /* EMC_DLL_XFORM_DQS10 */
+					0x00064000 /* EMC_DLL_XFORM_DQS11 */
+					0x00064000 /* EMC_DLL_XFORM_DQS12 */
+					0x00064000 /* EMC_DLL_XFORM_DQS13 */
+					0x00064000 /* EMC_DLL_XFORM_DQS14 */
+					0x00064000 /* EMC_DLL_XFORM_DQS15 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE0 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE1 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE2 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE3 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE4 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE6 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE7 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR0 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR1 */
+					0x00004000 /* EMC_DLL_XFORM_ADDR2 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR3 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR4 */
+					0x00004000 /* EMC_DLL_XFORM_ADDR5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE8 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE9 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE10 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE11 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE12 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE13 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE14 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE15 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS0 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS1 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS2 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS3 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS4 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS5 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS6 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS7 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS8 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS9 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS10 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS11 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS12 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS13 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS14 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS15 */
+					0x00080000 /* EMC_DLL_XFORM_DQ0 */
+					0x00080000 /* EMC_DLL_XFORM_DQ1 */
+					0x00080000 /* EMC_DLL_XFORM_DQ2 */
+					0x00080000 /* EMC_DLL_XFORM_DQ3 */
+					0x00008000 /* EMC_DLL_XFORM_DQ4 */
+					0x00008000 /* EMC_DLL_XFORM_DQ5 */
+					0x00008000 /* EMC_DLL_XFORM_DQ6 */
+					0x00008000 /* EMC_DLL_XFORM_DQ7 */
+					0x10000280 /* EMC_XM2CMDPADCTRL */
+					0x00000000 /* EMC_XM2CMDPADCTRL4 */
+					0x00111111 /* EMC_XM2CMDPADCTRL5 */
+					0x00000000 /* EMC_XM2DQPADCTRL2 */
+					0x00000000 /* EMC_XM2DQPADCTRL3 */
+					0x77ffc081 /* EMC_XM2CLKPADCTRL */
+					0x00000303 /* EMC_XM2CLKPADCTRL2 */
+					0x81f1f108 /* EMC_XM2COMPPADCTRL */
+					0x07070004 /* EMC_XM2VTTGENPADCTRL */
+					0x0000003f /* EMC_XM2VTTGENPADCTRL2 */
+					0x016eeeee /* EMC_XM2VTTGENPADCTRL3 */
+					0x51451400 /* EMC_XM2DQSPADCTRL3 */
+					0x00514514 /* EMC_XM2DQSPADCTRL4 */
+					0x00514514 /* EMC_XM2DQSPADCTRL5 */
+					0x51451400 /* EMC_XM2DQSPADCTRL6 */
+					0x0000003f /* EMC_DSR_VTTGEN_DRV */
+					0x00000007 /* EMC_TXDSRVTTGEN */
+					0x00000000 /* EMC_FBIO_SPARE */
+					0x00000042 /* EMC_ZCAL_WAIT_CNT */
+					0x000e000e /* EMC_MRS_WAIT_CNT2 */
+					0x00000000 /* EMC_CTT */
+					0x00000003 /* EMC_CTT_DURATION */
+					0x0000f2f3 /* EMC_CFG_PIPE */
+					0x800001c5 /* EMC_DYN_SELF_REF_CONTROL */
+					0x0000000a /* EMC_QPOP */
 				>;
 			};
 
 			timing-20400000 {
 				clock-frequency = <20400000>;
 
-				nvidia,emem-configuration = <
-					0x40020001
-					0x80000012
-					0x00000001
-					0x00000001
-					0x00000002
-					0x00000000
-					0x00000002
-					0x00000001
-					0x00000002
-					0x00000008
-					0x00000003
-					0x00000002
-					0x00000003
-					0x00000006
-					0x06030203
-					0x000a0402
-					0x76230303
-					0x70000f03
-					0x001f0000
+				nvidia,emc-auto-cal-config = <0xa1430000>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-bgbias-ctl0 = <0x00000008>;
+				nvidia,emc-cfg = <0x73240000>;
+				nvidia,emc-cfg-2 = <0x000008c5>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mode-1 = <0x00100003>;
+				nvidia,emc-mode-2 = <0x00200008>;
+				nvidia,emc-mode-4 = <0x00000000>;
+				nvidia,emc-mode-reset = <0x00001221>;
+				nvidia,emc-mrs-wait-cnt = <0x000e000e>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040128>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0130b118>;
+				nvidia,emc-zcal-cnt-long = <0x00000042>;
+				nvidia,emc-zcal-interval = <0x00000000>;
+
+				nvidia,emc-configuration = <
+					0x00000000 /* EMC_RC */
+					0x00000007 /* EMC_RFC */
+					0x00000000 /* EMC_RFC_SLR */
+					0x00000000 /* EMC_RAS */
+					0x00000000 /* EMC_RP */
+					0x00000004 /* EMC_R2W */
+					0x0000000a /* EMC_W2R */
+					0x00000005 /* EMC_R2P */
+					0x0000000b /* EMC_W2P */
+					0x00000000 /* EMC_RD_RCD */
+					0x00000000 /* EMC_WR_RCD */
+					0x00000003 /* EMC_RRD */
+					0x00000003 /* EMC_REXT */
+					0x00000000 /* EMC_WEXT */
+					0x00000006 /* EMC_WDV */
+					0x00000006 /* EMC_WDV_MASK */
+					0x00000006 /* EMC_QUSE */
+					0x00000002 /* EMC_QUSE_WIDTH */
+					0x00000000 /* EMC_IBDLY */
+					0x00000005 /* EMC_EINPUT */
+					0x00000005 /* EMC_EINPUT_DURATION */
+					0x00010000 /* EMC_PUTERM_EXTRA */
+					0x00000003 /* EMC_PUTERM_WIDTH */
+					0x00000000 /* EMC_PUTERM_ADJ */
+					0x00000000 /* EMC_CDB_CNTL_1 */
+					0x00000000 /* EMC_CDB_CNTL_2 */
+					0x00000000 /* EMC_CDB_CNTL_3 */
+					0x00000004 /* EMC_QRST */
+					0x0000000c /* EMC_QSAFE */
+					0x0000000d /* EMC_RDV */
+					0x0000000f /* EMC_RDV_MASK */
+					0x0000009a /* EMC_REFRESH */
+					0x00000000 /* EMC_BURST_REFRESH_NUM */
+					0x00000026 /* EMC_PRE_REFRESH_REQ_CNT */
+					0x00000002 /* EMC_PDEX2WR */
+					0x00000002 /* EMC_PDEX2RD */
+					0x00000001 /* EMC_PCHG2PDEN */
+					0x00000000 /* EMC_ACT2PDEN */
+					0x00000007 /* EMC_AR2PDEN */
+					0x0000000f /* EMC_RW2PDEN */
+					0x00000008 /* EMC_TXSR */
+					0x00000008 /* EMC_TXSRDLL */
+					0x00000004 /* EMC_TCKE */
+					0x00000005 /* EMC_TCKESR */
+					0x00000004 /* EMC_TPD */
+					0x00000000 /* EMC_TFAW */
+					0x00000000 /* EMC_TRPAB */
+					0x00000005 /* EMC_TCLKSTABLE */
+					0x00000005 /* EMC_TCLKSTOP */
+					0x000000a0 /* EMC_TREFBW */
+					0x00000000 /* EMC_FBIO_CFG6 */
+					0x00000000 /* EMC_ODT_WRITE */
+					0x00000000 /* EMC_ODT_READ */
+					0x106aa298 /* EMC_FBIO_CFG5 */
+					0x002c00a0 /* EMC_CFG_DIG_DLL */
+					0x00008000 /* EMC_CFG_DIG_DLL_PERIOD */
+					0x00064000 /* EMC_DLL_XFORM_DQS0 */
+					0x00064000 /* EMC_DLL_XFORM_DQS1 */
+					0x00064000 /* EMC_DLL_XFORM_DQS2 */
+					0x00064000 /* EMC_DLL_XFORM_DQS3 */
+					0x00064000 /* EMC_DLL_XFORM_DQS4 */
+					0x00064000 /* EMC_DLL_XFORM_DQS5 */
+					0x00064000 /* EMC_DLL_XFORM_DQS6 */
+					0x00064000 /* EMC_DLL_XFORM_DQS7 */
+					0x00064000 /* EMC_DLL_XFORM_DQS8 */
+					0x00064000 /* EMC_DLL_XFORM_DQS9 */
+					0x00064000 /* EMC_DLL_XFORM_DQS10 */
+					0x00064000 /* EMC_DLL_XFORM_DQS11 */
+					0x00064000 /* EMC_DLL_XFORM_DQS12 */
+					0x00064000 /* EMC_DLL_XFORM_DQS13 */
+					0x00064000 /* EMC_DLL_XFORM_DQS14 */
+					0x00064000 /* EMC_DLL_XFORM_DQS15 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE0 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE1 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE2 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE3 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE4 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE6 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE7 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR0 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR1 */
+					0x00004000 /* EMC_DLL_XFORM_ADDR2 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR3 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR4 */
+					0x00004000 /* EMC_DLL_XFORM_ADDR5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE8 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE9 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE10 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE11 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE12 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE13 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE14 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE15 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS0 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS1 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS2 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS3 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS4 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS5 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS6 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS7 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS8 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS9 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS10 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS11 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS12 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS13 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS14 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS15 */
+					0x00080000 /* EMC_DLL_XFORM_DQ0 */
+					0x00080000 /* EMC_DLL_XFORM_DQ1 */
+					0x00080000 /* EMC_DLL_XFORM_DQ2 */
+					0x00080000 /* EMC_DLL_XFORM_DQ3 */
+					0x00008000 /* EMC_DLL_XFORM_DQ4 */
+					0x00008000 /* EMC_DLL_XFORM_DQ5 */
+					0x00008000 /* EMC_DLL_XFORM_DQ6 */
+					0x00008000 /* EMC_DLL_XFORM_DQ7 */
+					0x10000280 /* EMC_XM2CMDPADCTRL */
+					0x00000000 /* EMC_XM2CMDPADCTRL4 */
+					0x00111111 /* EMC_XM2CMDPADCTRL5 */
+					0x00000000 /* EMC_XM2DQPADCTRL2 */
+					0x00000000 /* EMC_XM2DQPADCTRL3 */
+					0x77ffc081 /* EMC_XM2CLKPADCTRL */
+					0x00000303 /* EMC_XM2CLKPADCTRL2 */
+					0x81f1f108 /* EMC_XM2COMPPADCTRL */
+					0x07070004 /* EMC_XM2VTTGENPADCTRL */
+					0x0000003f /* EMC_XM2VTTGENPADCTRL2 */
+					0x016eeeee /* EMC_XM2VTTGENPADCTRL3 */
+					0x51451400 /* EMC_XM2DQSPADCTRL3 */
+					0x00514514 /* EMC_XM2DQSPADCTRL4 */
+					0x00514514 /* EMC_XM2DQSPADCTRL5 */
+					0x51451400 /* EMC_XM2DQSPADCTRL6 */
+					0x0000003f /* EMC_DSR_VTTGEN_DRV */
+					0x0000000b /* EMC_TXDSRVTTGEN */
+					0x00000000 /* EMC_FBIO_SPARE */
+					0x00000042 /* EMC_ZCAL_WAIT_CNT */
+					0x000e000e /* EMC_MRS_WAIT_CNT2 */
+					0x00000000 /* EMC_CTT */
+					0x00000003 /* EMC_CTT_DURATION */
+					0x0000f2f3 /* EMC_CFG_PIPE */
+					0x8000023a /* EMC_DYN_SELF_REF_CONTROL */
+					0x0000000a /* EMC_QPOP */
 				>;
 			};
 
 			timing-40800000 {
 				clock-frequency = <40800000>;
 
-				nvidia,emem-configuration = <
-					0xa0000001
-					0x80000017
-					0x00000001
-					0x00000001
-					0x00000002
-					0x00000000
-					0x00000002
-					0x00000001
-					0x00000002
-					0x00000008
-					0x00000003
-					0x00000002
-					0x00000003
-					0x00000006
-					0x06030203
-					0x000a0402
-					0x74a30303
-					0x70000f03
-					0x001f0000
+				nvidia,emc-auto-cal-config = <0xa1430000>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-bgbias-ctl0 = <0x00000008>;
+				nvidia,emc-cfg = <0x73240000>;
+				nvidia,emc-cfg-2 = <0x000008c5>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mode-1 = <0x00100003>;
+				nvidia,emc-mode-2 = <0x00200008>;
+				nvidia,emc-mode-4 = <0x00000000>;
+				nvidia,emc-mode-reset = <0x00001221>;
+				nvidia,emc-mrs-wait-cnt = <0x000e000e>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040128>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0130b118>;
+				nvidia,emc-zcal-cnt-long = <0x00000042>;
+				nvidia,emc-zcal-interval = <0x00000000>;
+
+				nvidia,emc-configuration = <
+					0x00000001 /* EMC_RC */
+					0x0000000e /* EMC_RFC */
+					0x00000000 /* EMC_RFC_SLR */
+					0x00000001 /* EMC_RAS */
+					0x00000000 /* EMC_RP */
+					0x00000004 /* EMC_R2W */
+					0x0000000a /* EMC_W2R */
+					0x00000005 /* EMC_R2P */
+					0x0000000b /* EMC_W2P */
+					0x00000000 /* EMC_RD_RCD */
+					0x00000000 /* EMC_WR_RCD */
+					0x00000003 /* EMC_RRD */
+					0x00000003 /* EMC_REXT */
+					0x00000000 /* EMC_WEXT */
+					0x00000006 /* EMC_WDV */
+					0x00000006 /* EMC_WDV_MASK */
+					0x00000006 /* EMC_QUSE */
+					0x00000002 /* EMC_QUSE_WIDTH */
+					0x00000000 /* EMC_IBDLY */
+					0x00000005 /* EMC_EINPUT */
+					0x00000005 /* EMC_EINPUT_DURATION */
+					0x00010000 /* EMC_PUTERM_EXTRA */
+					0x00000003 /* EMC_PUTERM_WIDTH */
+					0x00000000 /* EMC_PUTERM_ADJ */
+					0x00000000 /* EMC_CDB_CNTL_1 */
+					0x00000000 /* EMC_CDB_CNTL_2 */
+					0x00000000 /* EMC_CDB_CNTL_3 */
+					0x00000004 /* EMC_QRST */
+					0x0000000c /* EMC_QSAFE */
+					0x0000000d /* EMC_RDV */
+					0x0000000f /* EMC_RDV_MASK */
+					0x00000134 /* EMC_REFRESH */
+					0x00000000 /* EMC_BURST_REFRESH_NUM */
+					0x0000004d /* EMC_PRE_REFRESH_REQ_CNT */
+					0x00000002 /* EMC_PDEX2WR */
+					0x00000002 /* EMC_PDEX2RD */
+					0x00000001 /* EMC_PCHG2PDEN */
+					0x00000000 /* EMC_ACT2PDEN */
+					0x0000000c /* EMC_AR2PDEN */
+					0x0000000f /* EMC_RW2PDEN */
+					0x0000000f /* EMC_TXSR */
+					0x0000000f /* EMC_TXSRDLL */
+					0x00000004 /* EMC_TCKE */
+					0x00000005 /* EMC_TCKESR */
+					0x00000004 /* EMC_TPD */
+					0x00000000 /* EMC_TFAW */
+					0x00000000 /* EMC_TRPAB */
+					0x00000005 /* EMC_TCLKSTABLE */
+					0x00000005 /* EMC_TCLKSTOP */
+					0x0000013f /* EMC_TREFBW */
+					0x00000000 /* EMC_FBIO_CFG6 */
+					0x00000000 /* EMC_ODT_WRITE */
+					0x00000000 /* EMC_ODT_READ */
+					0x106aa298 /* EMC_FBIO_CFG5 */
+					0x002c00a0 /* EMC_CFG_DIG_DLL */
+					0x00008000 /* EMC_CFG_DIG_DLL_PERIOD */
+					0x00064000 /* EMC_DLL_XFORM_DQS0 */
+					0x00064000 /* EMC_DLL_XFORM_DQS1 */
+					0x00064000 /* EMC_DLL_XFORM_DQS2 */
+					0x00064000 /* EMC_DLL_XFORM_DQS3 */
+					0x00064000 /* EMC_DLL_XFORM_DQS4 */
+					0x00064000 /* EMC_DLL_XFORM_DQS5 */
+					0x00064000 /* EMC_DLL_XFORM_DQS6 */
+					0x00064000 /* EMC_DLL_XFORM_DQS7 */
+					0x00064000 /* EMC_DLL_XFORM_DQS8 */
+					0x00064000 /* EMC_DLL_XFORM_DQS9 */
+					0x00064000 /* EMC_DLL_XFORM_DQS10 */
+					0x00064000 /* EMC_DLL_XFORM_DQS11 */
+					0x00064000 /* EMC_DLL_XFORM_DQS12 */
+					0x00064000 /* EMC_DLL_XFORM_DQS13 */
+					0x00064000 /* EMC_DLL_XFORM_DQS14 */
+					0x00064000 /* EMC_DLL_XFORM_DQS15 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE0 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE1 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE2 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE3 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE4 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE6 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE7 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR0 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR1 */
+					0x00004000 /* EMC_DLL_XFORM_ADDR2 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR3 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR4 */
+					0x00004000 /* EMC_DLL_XFORM_ADDR5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE8 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE9 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE10 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE11 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE12 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE13 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE14 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE15 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS0 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS1 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS2 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS3 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS4 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS5 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS6 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS7 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS8 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS9 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS10 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS11 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS12 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS13 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS14 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS15 */
+					0x00080000 /* EMC_DLL_XFORM_DQ0 */
+					0x00080000 /* EMC_DLL_XFORM_DQ1 */
+					0x00080000 /* EMC_DLL_XFORM_DQ2 */
+					0x00080000 /* EMC_DLL_XFORM_DQ3 */
+					0x00008000 /* EMC_DLL_XFORM_DQ4 */
+					0x00008000 /* EMC_DLL_XFORM_DQ5 */
+					0x00008000 /* EMC_DLL_XFORM_DQ6 */
+					0x00008000 /* EMC_DLL_XFORM_DQ7 */
+					0x10000280 /* EMC_XM2CMDPADCTRL */
+					0x00000000 /* EMC_XM2CMDPADCTRL4 */
+					0x00111111 /* EMC_XM2CMDPADCTRL5 */
+					0x00000000 /* EMC_XM2DQPADCTRL2 */
+					0x00000000 /* EMC_XM2DQPADCTRL3 */
+					0x77ffc081 /* EMC_XM2CLKPADCTRL */
+					0x00000303 /* EMC_XM2CLKPADCTRL2 */
+					0x81f1f108 /* EMC_XM2COMPPADCTRL */
+					0x07070004 /* EMC_XM2VTTGENPADCTRL */
+					0x0000003f /* EMC_XM2VTTGENPADCTRL2 */
+					0x016eeeee /* EMC_XM2VTTGENPADCTRL3 */
+					0x51451400 /* EMC_XM2DQSPADCTRL3 */
+					0x00514514 /* EMC_XM2DQSPADCTRL4 */
+					0x00514514 /* EMC_XM2DQSPADCTRL5 */
+					0x51451400 /* EMC_XM2DQSPADCTRL6 */
+					0x0000003f /* EMC_DSR_VTTGEN_DRV */
+					0x00000015 /* EMC_TXDSRVTTGEN */
+					0x00000000 /* EMC_FBIO_SPARE */
+					0x00000042 /* EMC_ZCAL_WAIT_CNT */
+					0x000e000e /* EMC_MRS_WAIT_CNT2 */
+					0x00000000 /* EMC_CTT */
+					0x00000003 /* EMC_CTT_DURATION */
+					0x0000f2f3 /* EMC_CFG_PIPE */
+					0x80000370 /* EMC_DYN_SELF_REF_CONTROL */
+					0x0000000a /* EMC_QPOP */
 				>;
 			};
 
 			timing-68000000 {
 				clock-frequency = <68000000>;
 
-				nvidia,emem-configuration = <
-					0x00000001
-					0x8000001e
-					0x00000001
-					0x00000001
-					0x00000002
-					0x00000000
-					0x00000002
-					0x00000001
-					0x00000002
-					0x00000008
-					0x00000003
-					0x00000002
-					0x00000003
-					0x00000006
-					0x06030203
-					0x000a0402
-					0x74230403
-					0x70000f03
-					0x001f0000
+				nvidia,emc-auto-cal-config = <0xa1430000>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-bgbias-ctl0 = <0x00000008>;
+				nvidia,emc-cfg = <0x73240000>;
+				nvidia,emc-cfg-2 = <0x000008c5>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mode-1 = <0x00100003>;
+				nvidia,emc-mode-2 = <0x00200008>;
+				nvidia,emc-mode-4 = <0x00000000>;
+				nvidia,emc-mode-reset = <0x00001221>;
+				nvidia,emc-mrs-wait-cnt = <0x000e000e>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040128>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0130b118>;
+				nvidia,emc-zcal-cnt-long = <0x00000042>;
+				nvidia,emc-zcal-interval = <0x00000000>;
+
+				nvidia,emc-configuration = <
+					0x00000003 /* EMC_RC */
+					0x00000017 /* EMC_RFC */
+					0x00000000 /* EMC_RFC_SLR */
+					0x00000002 /* EMC_RAS */
+					0x00000000 /* EMC_RP */
+					0x00000004 /* EMC_R2W */
+					0x0000000a /* EMC_W2R */
+					0x00000005 /* EMC_R2P */
+					0x0000000b /* EMC_W2P */
+					0x00000000 /* EMC_RD_RCD */
+					0x00000000 /* EMC_WR_RCD */
+					0x00000003 /* EMC_RRD */
+					0x00000003 /* EMC_REXT */
+					0x00000000 /* EMC_WEXT */
+					0x00000006 /* EMC_WDV */
+					0x00000006 /* EMC_WDV_MASK */
+					0x00000006 /* EMC_QUSE */
+					0x00000002 /* EMC_QUSE_WIDTH */
+					0x00000000 /* EMC_IBDLY */
+					0x00000005 /* EMC_EINPUT */
+					0x00000005 /* EMC_EINPUT_DURATION */
+					0x00010000 /* EMC_PUTERM_EXTRA */
+					0x00000003 /* EMC_PUTERM_WIDTH */
+					0x00000000 /* EMC_PUTERM_ADJ */
+					0x00000000 /* EMC_CDB_CNTL_1 */
+					0x00000000 /* EMC_CDB_CNTL_2 */
+					0x00000000 /* EMC_CDB_CNTL_3 */
+					0x00000004 /* EMC_QRST */
+					0x0000000c /* EMC_QSAFE */
+					0x0000000d /* EMC_RDV */
+					0x0000000f /* EMC_RDV_MASK */
+					0x00000202 /* EMC_REFRESH */
+					0x00000000 /* EMC_BURST_REFRESH_NUM */
+					0x00000080 /* EMC_PRE_REFRESH_REQ_CNT */
+					0x00000002 /* EMC_PDEX2WR */
+					0x00000002 /* EMC_PDEX2RD */
+					0x00000001 /* EMC_PCHG2PDEN */
+					0x00000000 /* EMC_ACT2PDEN */
+					0x00000015 /* EMC_AR2PDEN */
+					0x0000000f /* EMC_RW2PDEN */
+					0x00000019 /* EMC_TXSR */
+					0x00000019 /* EMC_TXSRDLL */
+					0x00000004 /* EMC_TCKE */
+					0x00000005 /* EMC_TCKESR */
+					0x00000004 /* EMC_TPD */
+					0x00000001 /* EMC_TFAW */
+					0x00000000 /* EMC_TRPAB */
+					0x00000005 /* EMC_TCLKSTABLE */
+					0x00000005 /* EMC_TCLKSTOP */
+					0x00000213 /* EMC_TREFBW */
+					0x00000000 /* EMC_FBIO_CFG6 */
+					0x00000000 /* EMC_ODT_WRITE */
+					0x00000000 /* EMC_ODT_READ */
+					0x106aa298 /* EMC_FBIO_CFG5 */
+					0x002c00a0 /* EMC_CFG_DIG_DLL */
+					0x00008000 /* EMC_CFG_DIG_DLL_PERIOD */
+					0x00064000 /* EMC_DLL_XFORM_DQS0 */
+					0x00064000 /* EMC_DLL_XFORM_DQS1 */
+					0x00064000 /* EMC_DLL_XFORM_DQS2 */
+					0x00064000 /* EMC_DLL_XFORM_DQS3 */
+					0x00064000 /* EMC_DLL_XFORM_DQS4 */
+					0x00064000 /* EMC_DLL_XFORM_DQS5 */
+					0x00064000 /* EMC_DLL_XFORM_DQS6 */
+					0x00064000 /* EMC_DLL_XFORM_DQS7 */
+					0x00064000 /* EMC_DLL_XFORM_DQS8 */
+					0x00064000 /* EMC_DLL_XFORM_DQS9 */
+					0x00064000 /* EMC_DLL_XFORM_DQS10 */
+					0x00064000 /* EMC_DLL_XFORM_DQS11 */
+					0x00064000 /* EMC_DLL_XFORM_DQS12 */
+					0x00064000 /* EMC_DLL_XFORM_DQS13 */
+					0x00064000 /* EMC_DLL_XFORM_DQS14 */
+					0x00064000 /* EMC_DLL_XFORM_DQS15 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE0 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE1 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE2 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE3 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE4 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE6 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE7 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR0 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR1 */
+					0x00004000 /* EMC_DLL_XFORM_ADDR2 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR3 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR4 */
+					0x00004000 /* EMC_DLL_XFORM_ADDR5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE8 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE9 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE10 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE11 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE12 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE13 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE14 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE15 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS0 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS1 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS2 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS3 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS4 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS5 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS6 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS7 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS8 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS9 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS10 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS11 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS12 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS13 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS14 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS15 */
+					0x00080000 /* EMC_DLL_XFORM_DQ0 */
+					0x00080000 /* EMC_DLL_XFORM_DQ1 */
+					0x00080000 /* EMC_DLL_XFORM_DQ2 */
+					0x00080000 /* EMC_DLL_XFORM_DQ3 */
+					0x00008000 /* EMC_DLL_XFORM_DQ4 */
+					0x00008000 /* EMC_DLL_XFORM_DQ5 */
+					0x00008000 /* EMC_DLL_XFORM_DQ6 */
+					0x00008000 /* EMC_DLL_XFORM_DQ7 */
+					0x10000280 /* EMC_XM2CMDPADCTRL */
+					0x00000000 /* EMC_XM2CMDPADCTRL4 */
+					0x00111111 /* EMC_XM2CMDPADCTRL5 */
+					0x00000000 /* EMC_XM2DQPADCTRL2 */
+					0x00000000 /* EMC_XM2DQPADCTRL3 */
+					0x77ffc081 /* EMC_XM2CLKPADCTRL */
+					0x00000303 /* EMC_XM2CLKPADCTRL2 */
+					0x81f1f108 /* EMC_XM2COMPPADCTRL */
+					0x07070004 /* EMC_XM2VTTGENPADCTRL */
+					0x0000003f /* EMC_XM2VTTGENPADCTRL2 */
+					0x016eeeee /* EMC_XM2VTTGENPADCTRL3 */
+					0x51451400 /* EMC_XM2DQSPADCTRL3 */
+					0x00514514 /* EMC_XM2DQSPADCTRL4 */
+					0x00514514 /* EMC_XM2DQSPADCTRL5 */
+					0x51451400 /* EMC_XM2DQSPADCTRL6 */
+					0x0000003f /* EMC_DSR_VTTGEN_DRV */
+					0x00000022 /* EMC_TXDSRVTTGEN */
+					0x00000000 /* EMC_FBIO_SPARE */
+					0x00000042 /* EMC_ZCAL_WAIT_CNT */
+					0x000e000e /* EMC_MRS_WAIT_CNT2 */
+					0x00000000 /* EMC_CTT */
+					0x00000003 /* EMC_CTT_DURATION */
+					0x0000f2f3 /* EMC_CFG_PIPE */
+					0x8000050e /* EMC_DYN_SELF_REF_CONTROL */
+					0x0000000a /* EMC_QPOP */
 				>;
 			};
 
 			timing-102000000 {
 				clock-frequency = <102000000>;
 
-				nvidia,emem-configuration = <
-					0x08000001
-					0x80000026
-					0x00000001
-					0x00000001
-					0x00000003
-					0x00000000
-					0x00000002
-					0x00000001
-					0x00000002
-					0x00000008
-					0x00000003
-					0x00000002
-					0x00000003
-					0x00000006
-					0x06030203
-					0x000a0403
-					0x73c30504
-					0x70000f03
-					0x001f0000
+				nvidia,emc-auto-cal-config = <0xa1430000>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-bgbias-ctl0 = <0x00000008>;
+				nvidia,emc-cfg = <0x73240000>;
+				nvidia,emc-cfg-2 = <0x000008c5>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mode-1 = <0x00100003>;
+				nvidia,emc-mode-2 = <0x00200008>;
+				nvidia,emc-mode-4 = <0x00000000>;
+				nvidia,emc-mode-reset = <0x00001221>;
+				nvidia,emc-mrs-wait-cnt = <0x000e000e>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040128>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0130b118>;
+				nvidia,emc-zcal-cnt-long = <0x00000042>;
+				nvidia,emc-zcal-interval = <0x00000000>;
+
+				nvidia,emc-configuration = <
+					0x00000004 /* EMC_RC */
+					0x00000023 /* EMC_RFC */
+					0x00000000 /* EMC_RFC_SLR */
+					0x00000003 /* EMC_RAS */
+					0x00000001 /* EMC_RP */
+					0x00000004 /* EMC_R2W */
+					0x0000000a /* EMC_W2R */
+					0x00000005 /* EMC_R2P */
+					0x0000000b /* EMC_W2P */
+					0x00000001 /* EMC_RD_RCD */
+					0x00000001 /* EMC_WR_RCD */
+					0x00000003 /* EMC_RRD */
+					0x00000003 /* EMC_REXT */
+					0x00000000 /* EMC_WEXT */
+					0x00000006 /* EMC_WDV */
+					0x00000006 /* EMC_WDV_MASK */
+					0x00000006 /* EMC_QUSE */
+					0x00000002 /* EMC_QUSE_WIDTH */
+					0x00000000 /* EMC_IBDLY */
+					0x00000005 /* EMC_EINPUT */
+					0x00000005 /* EMC_EINPUT_DURATION */
+					0x00010000 /* EMC_PUTERM_EXTRA */
+					0x00000003 /* EMC_PUTERM_WIDTH */
+					0x00000000 /* EMC_PUTERM_ADJ */
+					0x00000000 /* EMC_CDB_CNTL_1 */
+					0x00000000 /* EMC_CDB_CNTL_2 */
+					0x00000000 /* EMC_CDB_CNTL_3 */
+					0x00000004 /* EMC_QRST */
+					0x0000000c /* EMC_QSAFE */
+					0x0000000d /* EMC_RDV */
+					0x0000000f /* EMC_RDV_MASK */
+					0x00000304 /* EMC_REFRESH */
+					0x00000000 /* EMC_BURST_REFRESH_NUM */
+					0x000000c1 /* EMC_PRE_REFRESH_REQ_CNT */
+					0x00000002 /* EMC_PDEX2WR */
+					0x00000002 /* EMC_PDEX2RD */
+					0x00000001 /* EMC_PCHG2PDEN */
+					0x00000000 /* EMC_ACT2PDEN */
+					0x00000021 /* EMC_AR2PDEN */
+					0x0000000f /* EMC_RW2PDEN */
+					0x00000025 /* EMC_TXSR */
+					0x00000025 /* EMC_TXSRDLL */
+					0x00000004 /* EMC_TCKE */
+					0x00000005 /* EMC_TCKESR */
+					0x00000004 /* EMC_TPD */
+					0x00000003 /* EMC_TFAW */
+					0x00000000 /* EMC_TRPAB */
+					0x00000005 /* EMC_TCLKSTABLE */
+					0x00000005 /* EMC_TCLKSTOP */
+					0x0000031c /* EMC_TREFBW */
+					0x00000000 /* EMC_FBIO_CFG6 */
+					0x00000000 /* EMC_ODT_WRITE */
+					0x00000000 /* EMC_ODT_READ */
+					0x106aa298 /* EMC_FBIO_CFG5 */
+					0x002c00a0 /* EMC_CFG_DIG_DLL */
+					0x00008000 /* EMC_CFG_DIG_DLL_PERIOD */
+					0x00064000 /* EMC_DLL_XFORM_DQS0 */
+					0x00064000 /* EMC_DLL_XFORM_DQS1 */
+					0x00064000 /* EMC_DLL_XFORM_DQS2 */
+					0x00064000 /* EMC_DLL_XFORM_DQS3 */
+					0x00064000 /* EMC_DLL_XFORM_DQS4 */
+					0x00064000 /* EMC_DLL_XFORM_DQS5 */
+					0x00064000 /* EMC_DLL_XFORM_DQS6 */
+					0x00064000 /* EMC_DLL_XFORM_DQS7 */
+					0x00064000 /* EMC_DLL_XFORM_DQS8 */
+					0x00064000 /* EMC_DLL_XFORM_DQS9 */
+					0x00064000 /* EMC_DLL_XFORM_DQS10 */
+					0x00064000 /* EMC_DLL_XFORM_DQS11 */
+					0x00064000 /* EMC_DLL_XFORM_DQS12 */
+					0x00064000 /* EMC_DLL_XFORM_DQS13 */
+					0x00064000 /* EMC_DLL_XFORM_DQS14 */
+					0x00064000 /* EMC_DLL_XFORM_DQS15 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE0 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE1 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE2 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE3 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE4 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE6 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE7 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR0 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR1 */
+					0x00004000 /* EMC_DLL_XFORM_ADDR2 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR3 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR4 */
+					0x00004000 /* EMC_DLL_XFORM_ADDR5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE8 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE9 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE10 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE11 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE12 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE13 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE14 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE15 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS0 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS1 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS2 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS3 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS4 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS5 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS6 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS7 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS8 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS9 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS10 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS11 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS12 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS13 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS14 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS15 */
+					0x00080000 /* EMC_DLL_XFORM_DQ0 */
+					0x00080000 /* EMC_DLL_XFORM_DQ1 */
+					0x00080000 /* EMC_DLL_XFORM_DQ2 */
+					0x00080000 /* EMC_DLL_XFORM_DQ3 */
+					0x00008000 /* EMC_DLL_XFORM_DQ4 */
+					0x00008000 /* EMC_DLL_XFORM_DQ5 */
+					0x00008000 /* EMC_DLL_XFORM_DQ6 */
+					0x00008000 /* EMC_DLL_XFORM_DQ7 */
+					0x10000280 /* EMC_XM2CMDPADCTRL */
+					0x00000000 /* EMC_XM2CMDPADCTRL4 */
+					0x00111111 /* EMC_XM2CMDPADCTRL5 */
+					0x00000000 /* EMC_XM2DQPADCTRL2 */
+					0x00000000 /* EMC_XM2DQPADCTRL3 */
+					0x77ffc081 /* EMC_XM2CLKPADCTRL */
+					0x00000303 /* EMC_XM2CLKPADCTRL2 */
+					0x81f1f108 /* EMC_XM2COMPPADCTRL */
+					0x07070004 /* EMC_XM2VTTGENPADCTRL */
+					0x0000003f /* EMC_XM2VTTGENPADCTRL2 */
+					0x016eeeee /* EMC_XM2VTTGENPADCTRL3 */
+					0x51451400 /* EMC_XM2DQSPADCTRL3 */
+					0x00514514 /* EMC_XM2DQSPADCTRL4 */
+					0x00514514 /* EMC_XM2DQSPADCTRL5 */
+					0x51451400 /* EMC_XM2DQSPADCTRL6 */
+					0x0000003f /* EMC_DSR_VTTGEN_DRV */
+					0x00000033 /* EMC_TXDSRVTTGEN */
+					0x00000000 /* EMC_FBIO_SPARE */
+					0x00000042 /* EMC_ZCAL_WAIT_CNT */
+					0x000e000e /* EMC_MRS_WAIT_CNT2 */
+					0x00000000 /* EMC_CTT */
+					0x00000003 /* EMC_CTT_DURATION */
+					0x0000f2f3 /* EMC_CFG_PIPE */
+					0x80000713 /* EMC_DYN_SELF_REF_CONTROL */
+					0x0000000a /* EMC_QPOP */
 				>;
 			};
 
 			timing-204000000 {
 				clock-frequency = <204000000>;
 
-				nvidia,emem-configuration = <
-					0x01000003
-					0x80000040
-					0x00000001
-					0x00000001
-					0x00000005
-					0x00000002
-					0x00000004
-					0x00000001
-					0x00000002
-					0x00000008
-					0x00000003
-					0x00000002
-					0x00000004
-					0x00000006
-					0x06040203
-					0x000a0405
-					0x73840a06
-					0x70000f03
-					0x001f0000
-				>;
-			};
-
-			timing-300000000 {
-				clock-frequency = <300000000>;
-
-				nvidia,emem-configuration = <
-					0x08000004
-					0x80000040
-					0x00000001
-					0x00000002
-					0x00000007
-					0x00000004
-					0x00000005
-					0x00000001
-					0x00000002
-					0x00000007
-					0x00000002
-					0x00000002
-					0x00000004
-					0x00000006
-					0x06040202
-					0x000b0607
-					0x77450e08
-					0x70000f03
-					0x001f0000
-				>;
-			};
-
-			timing-396000000 {
-				clock-frequency = <396000000>;
+				nvidia,emc-auto-cal-config = <0xa1430000>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-bgbias-ctl0 = <0x00000008>;
+				nvidia,emc-cfg = <0x73240000>;
+				nvidia,emc-cfg-2 = <0x0000088d>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mode-1 = <0x00100003>;
+				nvidia,emc-mode-2 = <0x00200008>;
+				nvidia,emc-mode-4 = <0x00000000>;
+				nvidia,emc-mode-reset = <0x00001221>;
+				nvidia,emc-mrs-wait-cnt = <0x000e000e>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040008>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0130b118>;
+				nvidia,emc-zcal-cnt-long = <0x00000042>;
+				nvidia,emc-zcal-interval = <0x00020000>;
+
+				nvidia,emc-configuration = <
+					0x00000009 /* EMC_RC */
+					0x00000047 /* EMC_RFC */
+					0x00000000 /* EMC_RFC_SLR */
+					0x00000006 /* EMC_RAS */
+					0x00000002 /* EMC_RP */
+					0x00000005 /* EMC_R2W */
+					0x0000000a /* EMC_W2R */
+					0x00000005 /* EMC_R2P */
+					0x0000000b /* EMC_W2P */
+					0x00000002 /* EMC_RD_RCD */
+					0x00000002 /* EMC_WR_RCD */
+					0x00000003 /* EMC_RRD */
+					0x00000003 /* EMC_REXT */
+					0x00000000 /* EMC_WEXT */
+					0x00000005 /* EMC_WDV */
+					0x00000005 /* EMC_WDV_MASK */
+					0x00000006 /* EMC_QUSE */
+					0x00000002 /* EMC_QUSE_WIDTH */
+					0x00000000 /* EMC_IBDLY */
+					0x00000004 /* EMC_EINPUT */
+					0x00000006 /* EMC_EINPUT_DURATION */
+					0x00010000 /* EMC_PUTERM_EXTRA */
+					0x00000003 /* EMC_PUTERM_WIDTH */
+					0x00000000 /* EMC_PUTERM_ADJ */
+					0x00000000 /* EMC_CDB_CNTL_1 */
+					0x00000000 /* EMC_CDB_CNTL_2 */
+					0x00000000 /* EMC_CDB_CNTL_3 */
+					0x00000003 /* EMC_QRST */
+					0x0000000d /* EMC_QSAFE */
+					0x0000000f /* EMC_RDV */
+					0x00000011 /* EMC_RDV_MASK */
+					0x00000607 /* EMC_REFRESH */
+					0x00000000 /* EMC_BURST_REFRESH_NUM */
+					0x00000181 /* EMC_PRE_REFRESH_REQ_CNT */
+					0x00000002 /* EMC_PDEX2WR */
+					0x00000002 /* EMC_PDEX2RD */
+					0x00000001 /* EMC_PCHG2PDEN */
+					0x00000000 /* EMC_ACT2PDEN */
+					0x00000044 /* EMC_AR2PDEN */
+					0x0000000f /* EMC_RW2PDEN */
+					0x0000004a /* EMC_TXSR */
+					0x0000004a /* EMC_TXSRDLL */
+					0x00000004 /* EMC_TCKE */
+					0x00000005 /* EMC_TCKESR */
+					0x00000004 /* EMC_TPD */
+					0x00000007 /* EMC_TFAW */
+					0x00000000 /* EMC_TRPAB */
+					0x00000005 /* EMC_TCLKSTABLE */
+					0x00000005 /* EMC_TCLKSTOP */
+					0x00000638 /* EMC_TREFBW */
+					0x00000000 /* EMC_FBIO_CFG6 */
+					0x00000000 /* EMC_ODT_WRITE */
+					0x00000000 /* EMC_ODT_READ */
+					0x106aa298 /* EMC_FBIO_CFG5 */
+					0x002c00a0 /* EMC_CFG_DIG_DLL */
+					0x00008000 /* EMC_CFG_DIG_DLL_PERIOD */
+					0x00064000 /* EMC_DLL_XFORM_DQS0 */
+					0x00064000 /* EMC_DLL_XFORM_DQS1 */
+					0x00064000 /* EMC_DLL_XFORM_DQS2 */
+					0x00064000 /* EMC_DLL_XFORM_DQS3 */
+					0x00064000 /* EMC_DLL_XFORM_DQS4 */
+					0x00064000 /* EMC_DLL_XFORM_DQS5 */
+					0x00064000 /* EMC_DLL_XFORM_DQS6 */
+					0x00064000 /* EMC_DLL_XFORM_DQS7 */
+					0x00064000 /* EMC_DLL_XFORM_DQS8 */
+					0x00064000 /* EMC_DLL_XFORM_DQS9 */
+					0x00064000 /* EMC_DLL_XFORM_DQS10 */
+					0x00064000 /* EMC_DLL_XFORM_DQS11 */
+					0x00064000 /* EMC_DLL_XFORM_DQS12 */
+					0x00064000 /* EMC_DLL_XFORM_DQS13 */
+					0x00064000 /* EMC_DLL_XFORM_DQS14 */
+					0x00064000 /* EMC_DLL_XFORM_DQS15 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE0 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE1 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE2 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE3 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE4 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE6 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE7 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR0 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR1 */
+					0x00004000 /* EMC_DLL_XFORM_ADDR2 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR3 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR4 */
+					0x00004000 /* EMC_DLL_XFORM_ADDR5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE8 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE9 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE10 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE11 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE12 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE13 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE14 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE15 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS0 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS1 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS2 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS3 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS4 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS5 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS6 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS7 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS8 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS9 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS10 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS11 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS12 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS13 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS14 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS15 */
+					0x00090000 /* EMC_DLL_XFORM_DQ0 */
+					0x00090000 /* EMC_DLL_XFORM_DQ1 */
+					0x00094000 /* EMC_DLL_XFORM_DQ2 */
+					0x00094000 /* EMC_DLL_XFORM_DQ3 */
+					0x00009400 /* EMC_DLL_XFORM_DQ4 */
+					0x00009000 /* EMC_DLL_XFORM_DQ5 */
+					0x00009000 /* EMC_DLL_XFORM_DQ6 */
+					0x00009000 /* EMC_DLL_XFORM_DQ7 */
+					0x10000280 /* EMC_XM2CMDPADCTRL */
+					0x00000000 /* EMC_XM2CMDPADCTRL4 */
+					0x00111111 /* EMC_XM2CMDPADCTRL5 */
+					0x00000000 /* EMC_XM2DQPADCTRL2 */
+					0x00000000 /* EMC_XM2DQPADCTRL3 */
+					0x77ffc081 /* EMC_XM2CLKPADCTRL */
+					0x00000303 /* EMC_XM2CLKPADCTRL2 */
+					0x81f1f108 /* EMC_XM2COMPPADCTRL */
+					0x07070004 /* EMC_XM2VTTGENPADCTRL */
+					0x0000003f /* EMC_XM2VTTGENPADCTRL2 */
+					0x016eeeee /* EMC_XM2VTTGENPADCTRL3 */
+					0x51451400 /* EMC_XM2DQSPADCTRL3 */
+					0x00514514 /* EMC_XM2DQSPADCTRL4 */
+					0x00514514 /* EMC_XM2DQSPADCTRL5 */
+					0x51451400 /* EMC_XM2DQSPADCTRL6 */
+					0x0000003f /* EMC_DSR_VTTGEN_DRV */
+					0x00000066 /* EMC_TXDSRVTTGEN */
+					0x00000000 /* EMC_FBIO_SPARE */
+					0x00000100 /* EMC_ZCAL_WAIT_CNT */
+					0x000e000e /* EMC_MRS_WAIT_CNT2 */
+					0x00000000 /* EMC_CTT */
+					0x00000003 /* EMC_CTT_DURATION */
+					0x0000d2b3 /* EMC_CFG_PIPE */
+					0x80000d22 /* EMC_DYN_SELF_REF_CONTROL */
+					0x0000000a /* EMC_QPOP */
+				>;
+			};
+
+			timing-300000000 {
+				clock-frequency = <300000000>;
+
+				nvidia,emc-auto-cal-config = <0xa1430000>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-bgbias-ctl0 = <0x00000000>;
+				nvidia,emc-cfg = <0x73340000>;
+				nvidia,emc-cfg-2 = <0x000008d5>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mode-1 = <0x00100002>;
+				nvidia,emc-mode-2 = <0x00200000>;
+				nvidia,emc-mode-4 = <0x00000000>;
+				nvidia,emc-mode-reset = <0x00000321>;
+				nvidia,emc-mrs-wait-cnt = <0x0117000e>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040128>;
+				nvidia,emc-xm2dqspadctrl2 = <0x01231339>;
+				nvidia,emc-zcal-cnt-long = <0x00000042>;
+				nvidia,emc-zcal-interval = <0x00020000>;
+
+				nvidia,emc-configuration = <
+					0x0000000d /* EMC_RC */
+					0x00000067 /* EMC_RFC */
+					0x00000000 /* EMC_RFC_SLR */
+					0x00000009 /* EMC_RAS */
+					0x00000003 /* EMC_RP */
+					0x00000004 /* EMC_R2W */
+					0x00000008 /* EMC_W2R */
+					0x00000002 /* EMC_R2P */
+					0x00000009 /* EMC_W2P */
+					0x00000003 /* EMC_RD_RCD */
+					0x00000003 /* EMC_WR_RCD */
+					0x00000002 /* EMC_RRD */
+					0x00000002 /* EMC_REXT */
+					0x00000000 /* EMC_WEXT */
+					0x00000003 /* EMC_WDV */
+					0x00000003 /* EMC_WDV_MASK */
+					0x00000005 /* EMC_QUSE */
+					0x00000002 /* EMC_QUSE_WIDTH */
+					0x00000000 /* EMC_IBDLY */
+					0x00000002 /* EMC_EINPUT */
+					0x00000007 /* EMC_EINPUT_DURATION */
+					0x00020000 /* EMC_PUTERM_EXTRA */
+					0x00000003 /* EMC_PUTERM_WIDTH */
+					0x00000000 /* EMC_PUTERM_ADJ */
+					0x00000000 /* EMC_CDB_CNTL_1 */
+					0x00000000 /* EMC_CDB_CNTL_2 */
+					0x00000000 /* EMC_CDB_CNTL_3 */
+					0x00000001 /* EMC_QRST */
+					0x0000000e /* EMC_QSAFE */
+					0x00000010 /* EMC_RDV */
+					0x00000012 /* EMC_RDV_MASK */
+					0x000008e4 /* EMC_REFRESH */
+					0x00000000 /* EMC_BURST_REFRESH_NUM */
+					0x00000239 /* EMC_PRE_REFRESH_REQ_CNT */
+					0x00000001 /* EMC_PDEX2WR */
+					0x00000008 /* EMC_PDEX2RD */
+					0x00000001 /* EMC_PCHG2PDEN */
+					0x00000000 /* EMC_ACT2PDEN */
+					0x00000065 /* EMC_AR2PDEN */
+					0x0000000e /* EMC_RW2PDEN */
+					0x0000006c /* EMC_TXSR */
+					0x00000200 /* EMC_TXSRDLL */
+					0x00000004 /* EMC_TCKE */
+					0x00000005 /* EMC_TCKESR */
+					0x00000004 /* EMC_TPD */
+					0x00000009 /* EMC_TFAW */
+					0x00000000 /* EMC_TRPAB */
+					0x00000005 /* EMC_TCLKSTABLE */
+					0x00000005 /* EMC_TCLKSTOP */
+					0x00000924 /* EMC_TREFBW */
+					0x00000000 /* EMC_FBIO_CFG6 */
+					0x00000000 /* EMC_ODT_WRITE */
+					0x00000000 /* EMC_ODT_READ */
+					0x104ab098 /* EMC_FBIO_CFG5 */
+					0x002c00a0 /* EMC_CFG_DIG_DLL */
+					0x00008000 /* EMC_CFG_DIG_DLL_PERIOD */
+					0x00030000 /* EMC_DLL_XFORM_DQS0 */
+					0x00030000 /* EMC_DLL_XFORM_DQS1 */
+					0x00030000 /* EMC_DLL_XFORM_DQS2 */
+					0x00030000 /* EMC_DLL_XFORM_DQS3 */
+					0x00030000 /* EMC_DLL_XFORM_DQS4 */
+					0x00030000 /* EMC_DLL_XFORM_DQS5 */
+					0x00030000 /* EMC_DLL_XFORM_DQS6 */
+					0x00030000 /* EMC_DLL_XFORM_DQS7 */
+					0x00030000 /* EMC_DLL_XFORM_DQS8 */
+					0x00030000 /* EMC_DLL_XFORM_DQS9 */
+					0x00030000 /* EMC_DLL_XFORM_DQS10 */
+					0x00030000 /* EMC_DLL_XFORM_DQS11 */
+					0x00030000 /* EMC_DLL_XFORM_DQS12 */
+					0x00030000 /* EMC_DLL_XFORM_DQS13 */
+					0x00030000 /* EMC_DLL_XFORM_DQS14 */
+					0x00030000 /* EMC_DLL_XFORM_DQS15 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE0 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE1 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE2 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE3 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE4 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE6 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE7 */
+					0x00098000 /* EMC_DLL_XFORM_ADDR0 */
+					0x00098000 /* EMC_DLL_XFORM_ADDR1 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR2 */
+					0x00098000 /* EMC_DLL_XFORM_ADDR3 */
+					0x00098000 /* EMC_DLL_XFORM_ADDR4 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE8 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE9 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE10 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE11 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE12 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE13 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE14 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE15 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS0 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS1 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS2 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS3 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS4 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS5 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS6 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS7 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS8 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS9 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS10 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS11 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS12 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS13 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS14 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS15 */
+					0x00060000 /* EMC_DLL_XFORM_DQ0 */
+					0x00060000 /* EMC_DLL_XFORM_DQ1 */
+					0x00060000 /* EMC_DLL_XFORM_DQ2 */
+					0x00060000 /* EMC_DLL_XFORM_DQ3 */
+					0x00006000 /* EMC_DLL_XFORM_DQ4 */
+					0x00006000 /* EMC_DLL_XFORM_DQ5 */
+					0x00006000 /* EMC_DLL_XFORM_DQ6 */
+					0x00006000 /* EMC_DLL_XFORM_DQ7 */
+					0x10000280 /* EMC_XM2CMDPADCTRL */
+					0x00000000 /* EMC_XM2CMDPADCTRL4 */
+					0x00111111 /* EMC_XM2CMDPADCTRL5 */
+					0x00000000 /* EMC_XM2DQPADCTRL2 */
+					0x00000000 /* EMC_XM2DQPADCTRL3 */
+					0x77ffc081 /* EMC_XM2CLKPADCTRL */
+					0x00000101 /* EMC_XM2CLKPADCTRL2 */
+					0x81f1f108 /* EMC_XM2COMPPADCTRL */
+					0x07070004 /* EMC_XM2VTTGENPADCTRL */
+					0x00000000 /* EMC_XM2VTTGENPADCTRL2 */
+					0x016eeeee /* EMC_XM2VTTGENPADCTRL3 */
+					0x51451420 /* EMC_XM2DQSPADCTRL3 */
+					0x00514514 /* EMC_XM2DQSPADCTRL4 */
+					0x00514514 /* EMC_XM2DQSPADCTRL5 */
+					0x51451400 /* EMC_XM2DQSPADCTRL6 */
+					0x0000003f /* EMC_DSR_VTTGEN_DRV */
+					0x00000096 /* EMC_TXDSRVTTGEN */
+					0x00000000 /* EMC_FBIO_SPARE */
+					0x00000100 /* EMC_ZCAL_WAIT_CNT */
+					0x0117000e /* EMC_MRS_WAIT_CNT2 */
+					0x00000000 /* EMC_CTT */
+					0x00000003 /* EMC_CTT_DURATION */
+					0x000052a3 /* EMC_CFG_PIPE */
+					0x800012d7 /* EMC_DYN_SELF_REF_CONTROL */
+					0x00000009 /* EMC_QPOP */
+				>;
+			};
+
+			timing-396000000 {
+				clock-frequency = <396000000>;
+
+				nvidia,emc-auto-cal-config = <0xa1430000>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-bgbias-ctl0 = <0x00000000>;
+				nvidia,emc-cfg = <0x73340000>;
+				nvidia,emc-cfg-2 = <0x00000895>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mode-1 = <0x00100002>;
+				nvidia,emc-mode-2 = <0x00200000>;
+				nvidia,emc-mode-4 = <0x00000000>;
+				nvidia,emc-mode-reset = <0x00000521>;
+				nvidia,emc-mrs-wait-cnt = <0x00f5000e>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040008>;
+				nvidia,emc-xm2dqspadctrl2 = <0x01231339>;
+				nvidia,emc-zcal-cnt-long = <0x00000042>;
+				nvidia,emc-zcal-interval = <0x00020000>;
+
+				nvidia,emc-configuration = <
+					0x00000011 /* EMC_RC */
+					0x00000089 /* EMC_RFC */
+					0x00000000 /* EMC_RFC_SLR */
+					0x0000000c /* EMC_RAS */
+					0x00000004 /* EMC_RP */
+					0x00000005 /* EMC_R2W */
+					0x00000008 /* EMC_W2R */
+					0x00000002 /* EMC_R2P */
+					0x0000000a /* EMC_W2P */
+					0x00000004 /* EMC_RD_RCD */
+					0x00000004 /* EMC_WR_RCD */
+					0x00000002 /* EMC_RRD */
+					0x00000002 /* EMC_REXT */
+					0x00000000 /* EMC_WEXT */
+					0x00000003 /* EMC_WDV */
+					0x00000003 /* EMC_WDV_MASK */
+					0x00000005 /* EMC_QUSE */
+					0x00000002 /* EMC_QUSE_WIDTH */
+					0x00000000 /* EMC_IBDLY */
+					0x00000001 /* EMC_EINPUT */
+					0x00000008 /* EMC_EINPUT_DURATION */
+					0x00020000 /* EMC_PUTERM_EXTRA */
+					0x00000003 /* EMC_PUTERM_WIDTH */
+					0x00000000 /* EMC_PUTERM_ADJ */
+					0x00000000 /* EMC_CDB_CNTL_1 */
+					0x00000000 /* EMC_CDB_CNTL_2 */
+					0x00000000 /* EMC_CDB_CNTL_3 */
+					0x00000000 /* EMC_QRST */
+					0x0000000f /* EMC_QSAFE */
+					0x00000010 /* EMC_RDV */
+					0x00000012 /* EMC_RDV_MASK */
+					0x00000bd1 /* EMC_REFRESH */
+					0x00000000 /* EMC_BURST_REFRESH_NUM */
+					0x000002f4 /* EMC_PRE_REFRESH_REQ_CNT */
+					0x00000001 /* EMC_PDEX2WR */
+					0x00000008 /* EMC_PDEX2RD */
+					0x00000001 /* EMC_PCHG2PDEN */
+					0x00000000 /* EMC_ACT2PDEN */
+					0x00000087 /* EMC_AR2PDEN */
+					0x0000000f /* EMC_RW2PDEN */
+					0x0000008f /* EMC_TXSR */
+					0x00000200 /* EMC_TXSRDLL */
+					0x00000004 /* EMC_TCKE */
+					0x00000005 /* EMC_TCKESR */
+					0x00000004 /* EMC_TPD */
+					0x0000000d /* EMC_TFAW */
+					0x00000000 /* EMC_TRPAB */
+					0x00000005 /* EMC_TCLKSTABLE */
+					0x00000005 /* EMC_TCLKSTOP */
+					0x00000c11 /* EMC_TREFBW */
+					0x00000000 /* EMC_FBIO_CFG6 */
+					0x00000000 /* EMC_ODT_WRITE */
+					0x00000000 /* EMC_ODT_READ */
+					0x104ab098 /* EMC_FBIO_CFG5 */
+					0x002c00a0 /* EMC_CFG_DIG_DLL */
+					0x00008000 /* EMC_CFG_DIG_DLL_PERIOD */
+					0x00030000 /* EMC_DLL_XFORM_DQS0 */
+					0x00030000 /* EMC_DLL_XFORM_DQS1 */
+					0x00030000 /* EMC_DLL_XFORM_DQS2 */
+					0x00030000 /* EMC_DLL_XFORM_DQS3 */
+					0x00030000 /* EMC_DLL_XFORM_DQS4 */
+					0x00030000 /* EMC_DLL_XFORM_DQS5 */
+					0x00030000 /* EMC_DLL_XFORM_DQS6 */
+					0x00030000 /* EMC_DLL_XFORM_DQS7 */
+					0x00030000 /* EMC_DLL_XFORM_DQS8 */
+					0x00030000 /* EMC_DLL_XFORM_DQS9 */
+					0x00030000 /* EMC_DLL_XFORM_DQS10 */
+					0x00030000 /* EMC_DLL_XFORM_DQS11 */
+					0x00030000 /* EMC_DLL_XFORM_DQS12 */
+					0x00030000 /* EMC_DLL_XFORM_DQS13 */
+					0x00030000 /* EMC_DLL_XFORM_DQS14 */
+					0x00030000 /* EMC_DLL_XFORM_DQS15 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE0 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE1 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE2 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE3 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE4 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE6 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE7 */
+					0x00070000 /* EMC_DLL_XFORM_ADDR0 */
+					0x00070000 /* EMC_DLL_XFORM_ADDR1 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR2 */
+					0x00070000 /* EMC_DLL_XFORM_ADDR3 */
+					0x00070000 /* EMC_DLL_XFORM_ADDR4 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE8 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE9 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE10 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE11 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE12 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE13 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE14 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE15 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS0 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS1 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS2 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS3 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS4 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS5 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS6 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS7 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS8 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS9 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS10 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS11 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS12 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS13 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS14 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS15 */
+					0x00048000 /* EMC_DLL_XFORM_DQ0 */
+					0x00048000 /* EMC_DLL_XFORM_DQ1 */
+					0x00048000 /* EMC_DLL_XFORM_DQ2 */
+					0x00048000 /* EMC_DLL_XFORM_DQ3 */
+					0x00004800 /* EMC_DLL_XFORM_DQ4 */
+					0x00004800 /* EMC_DLL_XFORM_DQ5 */
+					0x00004800 /* EMC_DLL_XFORM_DQ6 */
+					0x00004800 /* EMC_DLL_XFORM_DQ7 */
+					0x10000280 /* EMC_XM2CMDPADCTRL */
+					0x00000000 /* EMC_XM2CMDPADCTRL4 */
+					0x00111111 /* EMC_XM2CMDPADCTRL5 */
+					0x00000000 /* EMC_XM2DQPADCTRL2 */
+					0x00000000 /* EMC_XM2DQPADCTRL3 */
+					0x77ffc081 /* EMC_XM2CLKPADCTRL */
+					0x00000101 /* EMC_XM2CLKPADCTRL2 */
+					0x81f1f108 /* EMC_XM2COMPPADCTRL */
+					0x07070004 /* EMC_XM2VTTGENPADCTRL */
+					0x00000000 /* EMC_XM2VTTGENPADCTRL2 */
+					0x016eeeee /* EMC_XM2VTTGENPADCTRL3 */
+					0x51451420 /* EMC_XM2DQSPADCTRL3 */
+					0x00514514 /* EMC_XM2DQSPADCTRL4 */
+					0x00514514 /* EMC_XM2DQSPADCTRL5 */
+					0x51451400 /* EMC_XM2DQSPADCTRL6 */
+					0x0000003f /* EMC_DSR_VTTGEN_DRV */
+					0x000000c6 /* EMC_TXDSRVTTGEN */
+					0x00000000 /* EMC_FBIO_SPARE */
+					0x00000100 /* EMC_ZCAL_WAIT_CNT */
+					0x00f5000e /* EMC_MRS_WAIT_CNT2 */
+					0x00000000 /* EMC_CTT */
+					0x00000003 /* EMC_CTT_DURATION */
+					0x000052a3 /* EMC_CFG_PIPE */
+					0x8000188b /* EMC_DYN_SELF_REF_CONTROL */
+					0x00000009 /* EMC_QPOP */
+				>;
+			};
+
+			timing-528000000 {
+				clock-frequency = <528000000>;
+
+				nvidia,emc-auto-cal-config = <0xa1430000>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-bgbias-ctl0 = <0x00000000>;
+				nvidia,emc-cfg = <0x73300000>;
+				nvidia,emc-cfg-2 = <0x0000089d>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mode-1 = <0x00100002>;
+				nvidia,emc-mode-2 = <0x00200008>;
+				nvidia,emc-mode-4 = <0x00000000>;
+				nvidia,emc-mode-reset = <0x00000941>;
+				nvidia,emc-mrs-wait-cnt = <0x00c8000e>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040008>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0123133d>;
+				nvidia,emc-zcal-cnt-long = <0x00000042>;
+				nvidia,emc-zcal-interval = <0x00020000>;
+
+				nvidia,emc-configuration = <
+					0x00000018 /* EMC_RC */
+					0x000000b7 /* EMC_RFC */
+					0x00000000 /* EMC_RFC_SLR */
+					0x00000010 /* EMC_RAS */
+					0x00000006 /* EMC_RP */
+					0x00000006 /* EMC_R2W */
+					0x00000009 /* EMC_W2R */
+					0x00000002 /* EMC_R2P */
+					0x0000000d /* EMC_W2P */
+					0x00000006 /* EMC_RD_RCD */
+					0x00000006 /* EMC_WR_RCD */
+					0x00000002 /* EMC_RRD */
+					0x00000002 /* EMC_REXT */
+					0x00000000 /* EMC_WEXT */
+					0x00000003 /* EMC_WDV */
+					0x00000003 /* EMC_WDV_MASK */
+					0x00000007 /* EMC_QUSE */
+					0x00000002 /* EMC_QUSE_WIDTH */
+					0x00000000 /* EMC_IBDLY */
+					0x00000002 /* EMC_EINPUT */
+					0x00000009 /* EMC_EINPUT_DURATION */
+					0x00040000 /* EMC_PUTERM_EXTRA */
+					0x00000003 /* EMC_PUTERM_WIDTH */
+					0x00000000 /* EMC_PUTERM_ADJ */
+					0x00000000 /* EMC_CDB_CNTL_1 */
+					0x00000000 /* EMC_CDB_CNTL_2 */
+					0x00000000 /* EMC_CDB_CNTL_3 */
+					0x00000001 /* EMC_QRST */
+					0x00000010 /* EMC_QSAFE */
+					0x00000013 /* EMC_RDV */
+					0x00000015 /* EMC_RDV_MASK */
+					0x00000fd6 /* EMC_REFRESH */
+					0x00000000 /* EMC_BURST_REFRESH_NUM */
+					0x000003f5 /* EMC_PRE_REFRESH_REQ_CNT */
+					0x00000002 /* EMC_PDEX2WR */
+					0x0000000b /* EMC_PDEX2RD */
+					0x00000001 /* EMC_PCHG2PDEN */
+					0x00000000 /* EMC_ACT2PDEN */
+					0x000000b4 /* EMC_AR2PDEN */
+					0x00000012 /* EMC_RW2PDEN */
+					0x000000bf /* EMC_TXSR */
+					0x00000200 /* EMC_TXSRDLL */
+					0x00000004 /* EMC_TCKE */
+					0x00000005 /* EMC_TCKESR */
+					0x00000004 /* EMC_TPD */
+					0x00000013 /* EMC_TFAW */
+					0x00000000 /* EMC_TRPAB */
+					0x00000006 /* EMC_TCLKSTABLE */
+					0x00000006 /* EMC_TCLKSTOP */
+					0x00001017 /* EMC_TREFBW */
+					0x00000000 /* EMC_FBIO_CFG6 */
+					0x00000000 /* EMC_ODT_WRITE */
+					0x00000000 /* EMC_ODT_READ */
+					0x104ab098 /* EMC_FBIO_CFG5 */
+					0xe01200b1 /* EMC_CFG_DIG_DLL */
+					0x00008000 /* EMC_CFG_DIG_DLL_PERIOD */
+					0x0000000a /* EMC_DLL_XFORM_DQS0 */
+					0x0000000a /* EMC_DLL_XFORM_DQS1 */
+					0x0000000a /* EMC_DLL_XFORM_DQS2 */
+					0x0000000a /* EMC_DLL_XFORM_DQS3 */
+					0x0000000a /* EMC_DLL_XFORM_DQS4 */
+					0x0000000a /* EMC_DLL_XFORM_DQS5 */
+					0x0000000a /* EMC_DLL_XFORM_DQS6 */
+					0x0000000a /* EMC_DLL_XFORM_DQS7 */
+					0x0000000a /* EMC_DLL_XFORM_DQS8 */
+					0x0000000a /* EMC_DLL_XFORM_DQS9 */
+					0x0000000a /* EMC_DLL_XFORM_DQS10 */
+					0x0000000a /* EMC_DLL_XFORM_DQS11 */
+					0x0000000a /* EMC_DLL_XFORM_DQS12 */
+					0x0000000a /* EMC_DLL_XFORM_DQS13 */
+					0x0000000a /* EMC_DLL_XFORM_DQS14 */
+					0x0000000a /* EMC_DLL_XFORM_DQS15 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE0 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE1 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE2 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE3 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE4 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE6 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE7 */
+					0x00050000 /* EMC_DLL_XFORM_ADDR0 */
+					0x00050000 /* EMC_DLL_XFORM_ADDR1 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR2 */
+					0x00050000 /* EMC_DLL_XFORM_ADDR3 */
+					0x00050000 /* EMC_DLL_XFORM_ADDR4 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE8 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE9 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE10 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE11 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE12 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE13 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE14 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE15 */
+					0x00000002 /* EMC_DLI_TRIM_TXDQS0 */
+					0x00000002 /* EMC_DLI_TRIM_TXDQS1 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS2 */
+					0x00000003 /* EMC_DLI_TRIM_TXDQS3 */
+					0x00000004 /* EMC_DLI_TRIM_TXDQS4 */
+					0x00000001 /* EMC_DLI_TRIM_TXDQS5 */
+					0x00000004 /* EMC_DLI_TRIM_TXDQS6 */
+					0x00000003 /* EMC_DLI_TRIM_TXDQS7 */
+					0x00000002 /* EMC_DLI_TRIM_TXDQS8 */
+					0x00000002 /* EMC_DLI_TRIM_TXDQS9 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS10 */
+					0x00000003 /* EMC_DLI_TRIM_TXDQS11 */
+					0x00000004 /* EMC_DLI_TRIM_TXDQS12 */
+					0x00000001 /* EMC_DLI_TRIM_TXDQS13 */
+					0x00000004 /* EMC_DLI_TRIM_TXDQS14 */
+					0x00000003 /* EMC_DLI_TRIM_TXDQS15 */
+					0x0000000e /* EMC_DLL_XFORM_DQ0 */
+					0x0000000e /* EMC_DLL_XFORM_DQ1 */
+					0x0000000e /* EMC_DLL_XFORM_DQ2 */
+					0x0000000e /* EMC_DLL_XFORM_DQ3 */
+					0x0000000e /* EMC_DLL_XFORM_DQ4 */
+					0x0000000e /* EMC_DLL_XFORM_DQ5 */
+					0x0000000e /* EMC_DLL_XFORM_DQ6 */
+					0x0000000e /* EMC_DLL_XFORM_DQ7 */
+					0x100002a0 /* EMC_XM2CMDPADCTRL */
+					0x00000000 /* EMC_XM2CMDPADCTRL4 */
+					0x00111111 /* EMC_XM2CMDPADCTRL5 */
+					0x00000000 /* EMC_XM2DQPADCTRL2 */
+					0x00000000 /* EMC_XM2DQPADCTRL3 */
+					0x77ffc085 /* EMC_XM2CLKPADCTRL */
+					0x00000101 /* EMC_XM2CLKPADCTRL2 */
+					0x81f1f108 /* EMC_XM2COMPPADCTRL */
+					0x07070004 /* EMC_XM2VTTGENPADCTRL */
+					0x00000000 /* EMC_XM2VTTGENPADCTRL2 */
+					0x016eeeee /* EMC_XM2VTTGENPADCTRL3 */
+					0x51451420 /* EMC_XM2DQSPADCTRL3 */
+					0x00514514 /* EMC_XM2DQSPADCTRL4 */
+					0x00514514 /* EMC_XM2DQSPADCTRL5 */
+					0x51451400 /* EMC_XM2DQSPADCTRL6 */
+					0x0606003f /* EMC_DSR_VTTGEN_DRV */
+					0x00000000 /* EMC_TXDSRVTTGEN */
+					0x00000000 /* EMC_FBIO_SPARE */
+					0x00000100 /* EMC_ZCAL_WAIT_CNT */
+					0x00c8000e /* EMC_MRS_WAIT_CNT2 */
+					0x00000000 /* EMC_CTT */
+					0x00000003 /* EMC_CTT_DURATION */
+					0x000042a0 /* EMC_CFG_PIPE */
+					0x80002062 /* EMC_DYN_SELF_REF_CONTROL */
+					0x0000000b /* EMC_QPOP */
+				>;
+			};
+
+			timing-600000000 {
+				clock-frequency = <600000000>;
+
+				nvidia,emc-auto-cal-config = <0xa1430000>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-bgbias-ctl0 = <0x00000000>;
+				nvidia,emc-cfg = <0x73300000>;
+				nvidia,emc-cfg-2 = <0x0000089d>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mode-1 = <0x00100002>;
+				nvidia,emc-mode-2 = <0x00200010>;
+				nvidia,emc-mode-4 = <0x00000000>;
+				nvidia,emc-mode-reset = <0x00000b61>;
+				nvidia,emc-mrs-wait-cnt = <0x00b0000e>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040008>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0121113d>;
+				nvidia,emc-zcal-cnt-long = <0x00000042>;
+				nvidia,emc-zcal-interval = <0x00020000>;
+
+				nvidia,emc-configuration = <
+					0x0000001b /* EMC_RC */
+					0x000000d0 /* EMC_RFC */
+					0x00000000 /* EMC_RFC_SLR */
+					0x00000013 /* EMC_RAS */
+					0x00000007 /* EMC_RP */
+					0x00000007 /* EMC_R2W */
+					0x0000000b /* EMC_W2R */
+					0x00000003 /* EMC_R2P */
+					0x00000010 /* EMC_W2P */
+					0x00000007 /* EMC_RD_RCD */
+					0x00000007 /* EMC_WR_RCD */
+					0x00000002 /* EMC_RRD */
+					0x00000002 /* EMC_REXT */
+					0x00000000 /* EMC_WEXT */
+					0x00000005 /* EMC_WDV */
+					0x00000005 /* EMC_WDV_MASK */
+					0x0000000a /* EMC_QUSE */
+					0x00000002 /* EMC_QUSE_WIDTH */
+					0x00000000 /* EMC_IBDLY */
+					0x00000003 /* EMC_EINPUT */
+					0x0000000b /* EMC_EINPUT_DURATION */
+					0x00070000 /* EMC_PUTERM_EXTRA */
+					0x00000003 /* EMC_PUTERM_WIDTH */
+					0x00000000 /* EMC_PUTERM_ADJ */
+					0x00000000 /* EMC_CDB_CNTL_1 */
+					0x00000000 /* EMC_CDB_CNTL_2 */
+					0x00000000 /* EMC_CDB_CNTL_3 */
+					0x00000002 /* EMC_QRST */
+					0x00000012 /* EMC_QSAFE */
+					0x00000016 /* EMC_RDV */
+					0x00000018 /* EMC_RDV_MASK */
+					0x00001208 /* EMC_REFRESH */
+					0x00000000 /* EMC_BURST_REFRESH_NUM */
+					0x00000482 /* EMC_PRE_REFRESH_REQ_CNT */
+					0x00000002 /* EMC_PDEX2WR */
+					0x0000000d /* EMC_PDEX2RD */
+					0x00000001 /* EMC_PCHG2PDEN */
+					0x00000000 /* EMC_ACT2PDEN */
+					0x000000cc /* EMC_AR2PDEN */
+					0x00000015 /* EMC_RW2PDEN */
+					0x000000d8 /* EMC_TXSR */
+					0x00000200 /* EMC_TXSRDLL */
+					0x00000004 /* EMC_TCKE */
+					0x00000005 /* EMC_TCKESR */
+					0x00000004 /* EMC_TPD */
+					0x00000015 /* EMC_TFAW */
+					0x00000000 /* EMC_TRPAB */
+					0x00000006 /* EMC_TCLKSTABLE */
+					0x00000006 /* EMC_TCLKSTOP */
+					0x00001249 /* EMC_TREFBW */
+					0x00000000 /* EMC_FBIO_CFG6 */
+					0x00000000 /* EMC_ODT_WRITE */
+					0x00000000 /* EMC_ODT_READ */
+					0x104ab098 /* EMC_FBIO_CFG5 */
+					0xe00e00b1 /* EMC_CFG_DIG_DLL */
+					0x00008000 /* EMC_CFG_DIG_DLL_PERIOD */
+					0x0000000a /* EMC_DLL_XFORM_DQS0 */
+					0x0000000a /* EMC_DLL_XFORM_DQS1 */
+					0x0000000a /* EMC_DLL_XFORM_DQS2 */
+					0x0000000a /* EMC_DLL_XFORM_DQS3 */
+					0x0000000a /* EMC_DLL_XFORM_DQS4 */
+					0x0000000a /* EMC_DLL_XFORM_DQS5 */
+					0x0000000a /* EMC_DLL_XFORM_DQS6 */
+					0x0000000a /* EMC_DLL_XFORM_DQS7 */
+					0x0000000a /* EMC_DLL_XFORM_DQS8 */
+					0x0000000a /* EMC_DLL_XFORM_DQS9 */
+					0x0000000a /* EMC_DLL_XFORM_DQS10 */
+					0x0000000a /* EMC_DLL_XFORM_DQS11 */
+					0x0000000a /* EMC_DLL_XFORM_DQS12 */
+					0x0000000a /* EMC_DLL_XFORM_DQS13 */
+					0x0000000a /* EMC_DLL_XFORM_DQS14 */
+					0x0000000a /* EMC_DLL_XFORM_DQS15 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE0 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE1 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE2 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE3 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE4 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE6 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE7 */
+					0x00048000 /* EMC_DLL_XFORM_ADDR0 */
+					0x00048000 /* EMC_DLL_XFORM_ADDR1 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR2 */
+					0x00048000 /* EMC_DLL_XFORM_ADDR3 */
+					0x00048000 /* EMC_DLL_XFORM_ADDR4 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE8 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE9 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE10 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE11 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE12 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE13 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE14 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE15 */
+					0x00000004 /* EMC_DLI_TRIM_TXDQS0 */
+					0x00000004 /* EMC_DLI_TRIM_TXDQS1 */
+					0x00000002 /* EMC_DLI_TRIM_TXDQS2 */
+					0x00000005 /* EMC_DLI_TRIM_TXDQS3 */
+					0x00000006 /* EMC_DLI_TRIM_TXDQS4 */
+					0x00000003 /* EMC_DLI_TRIM_TXDQS5 */
+					0x00000006 /* EMC_DLI_TRIM_TXDQS6 */
+					0x00000005 /* EMC_DLI_TRIM_TXDQS7 */
+					0x00000004 /* EMC_DLI_TRIM_TXDQS8 */
+					0x00000004 /* EMC_DLI_TRIM_TXDQS9 */
+					0x00000002 /* EMC_DLI_TRIM_TXDQS10 */
+					0x00000005 /* EMC_DLI_TRIM_TXDQS11 */
+					0x00000006 /* EMC_DLI_TRIM_TXDQS12 */
+					0x00000003 /* EMC_DLI_TRIM_TXDQS13 */
+					0x00000006 /* EMC_DLI_TRIM_TXDQS14 */
+					0x00000005 /* EMC_DLI_TRIM_TXDQS15 */
+					0x0000000e /* EMC_DLL_XFORM_DQ0 */
+					0x0000000e /* EMC_DLL_XFORM_DQ1 */
+					0x0000000e /* EMC_DLL_XFORM_DQ2 */
+					0x0000000e /* EMC_DLL_XFORM_DQ3 */
+					0x0000000e /* EMC_DLL_XFORM_DQ4 */
+					0x0000000e /* EMC_DLL_XFORM_DQ5 */
+					0x0000000e /* EMC_DLL_XFORM_DQ6 */
+					0x0000000e /* EMC_DLL_XFORM_DQ7 */
+					0x100002a0 /* EMC_XM2CMDPADCTRL */
+					0x00000000 /* EMC_XM2CMDPADCTRL4 */
+					0x00111111 /* EMC_XM2CMDPADCTRL5 */
+					0x00000000 /* EMC_XM2DQPADCTRL2 */
+					0x00000000 /* EMC_XM2DQPADCTRL3 */
+					0x77ffc085 /* EMC_XM2CLKPADCTRL */
+					0x00000101 /* EMC_XM2CLKPADCTRL2 */
+					0x81f1f108 /* EMC_XM2COMPPADCTRL */
+					0x07070004 /* EMC_XM2VTTGENPADCTRL */
+					0x00000000 /* EMC_XM2VTTGENPADCTRL2 */
+					0x016eeeee /* EMC_XM2VTTGENPADCTRL3 */
+					0x51451420 /* EMC_XM2DQSPADCTRL3 */
+					0x00514514 /* EMC_XM2DQSPADCTRL4 */
+					0x00514514 /* EMC_XM2DQSPADCTRL5 */
+					0x51451400 /* EMC_XM2DQSPADCTRL6 */
+					0x0606003f /* EMC_DSR_VTTGEN_DRV */
+					0x00000000 /* EMC_TXDSRVTTGEN */
+					0x00000000 /* EMC_FBIO_SPARE */
+					0x00000100 /* EMC_ZCAL_WAIT_CNT */
+					0x00b0000e /* EMC_MRS_WAIT_CNT2 */
+					0x00000000 /* EMC_CTT */
+					0x00000003 /* EMC_CTT_DURATION */
+					0x000040a0 /* EMC_CFG_PIPE */
+					0x800024aa /* EMC_DYN_SELF_REF_CONTROL */
+					0x0000000e /* EMC_QPOP */
+				>;
+			};
+
+			timing-792000000 {
+				clock-frequency = <792000000>;
+
+				nvidia,emc-auto-cal-config = <0xa1430000>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-bgbias-ctl0 = <0x00000000>;
+				nvidia,emc-cfg = <0x73300000>;
+				nvidia,emc-cfg-2 = <0x0080089d>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mode-1 = <0x00100002>;
+				nvidia,emc-mode-2 = <0x00200418>;
+				nvidia,emc-mode-4 = <0x00000000>;
+				nvidia,emc-mode-reset = <0x00000d71>;
+				nvidia,emc-mrs-wait-cnt = <0x006f000e>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040000>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0120113d>;
+				nvidia,emc-zcal-cnt-long = <0x00000042>;
+				nvidia,emc-zcal-interval = <0x00020000>;
+
+				nvidia,emc-configuration = <
+					0x00000024 /* EMC_RC */
+					0x00000114 /* EMC_RFC */
+					0x00000000 /* EMC_RFC_SLR */
+					0x00000019 /* EMC_RAS */
+					0x0000000a /* EMC_RP */
+					0x00000008 /* EMC_R2W */
+					0x0000000d /* EMC_W2R */
+					0x00000004 /* EMC_R2P */
+					0x00000013 /* EMC_W2P */
+					0x0000000a /* EMC_RD_RCD */
+					0x0000000a /* EMC_WR_RCD */
+					0x00000003 /* EMC_RRD */
+					0x00000002 /* EMC_REXT */
+					0x00000000 /* EMC_WEXT */
+					0x00000006 /* EMC_WDV */
+					0x00000006 /* EMC_WDV_MASK */
+					0x0000000b /* EMC_QUSE */
+					0x00000002 /* EMC_QUSE_WIDTH */
+					0x00000000 /* EMC_IBDLY */
+					0x00000002 /* EMC_EINPUT */
+					0x0000000d /* EMC_EINPUT_DURATION */
+					0x00080000 /* EMC_PUTERM_EXTRA */
+					0x00000004 /* EMC_PUTERM_WIDTH */
+					0x00000000 /* EMC_PUTERM_ADJ */
+					0x00000000 /* EMC_CDB_CNTL_1 */
+					0x00000000 /* EMC_CDB_CNTL_2 */
+					0x00000000 /* EMC_CDB_CNTL_3 */
+					0x00000001 /* EMC_QRST */
+					0x00000014 /* EMC_QSAFE */
+					0x00000018 /* EMC_RDV */
+					0x0000001a /* EMC_RDV_MASK */
+					0x000017e2 /* EMC_REFRESH */
+					0x00000000 /* EMC_BURST_REFRESH_NUM */
+					0x000005f8 /* EMC_PRE_REFRESH_REQ_CNT */
+					0x00000003 /* EMC_PDEX2WR */
+					0x00000011 /* EMC_PDEX2RD */
+					0x00000001 /* EMC_PCHG2PDEN */
+					0x00000000 /* EMC_ACT2PDEN */
+					0x0000010d /* EMC_AR2PDEN */
+					0x00000018 /* EMC_RW2PDEN */
+					0x0000011e /* EMC_TXSR */
+					0x00000200 /* EMC_TXSRDLL */
+					0x00000005 /* EMC_TCKE */
+					0x00000006 /* EMC_TCKESR */
+					0x00000005 /* EMC_TPD */
+					0x0000001d /* EMC_TFAW */
+					0x00000000 /* EMC_TRPAB */
+					0x00000008 /* EMC_TCLKSTABLE */
+					0x00000008 /* EMC_TCLKSTOP */
+					0x00001822 /* EMC_TREFBW */
+					0x00000000 /* EMC_FBIO_CFG6 */
+					0x80000005 /* EMC_ODT_WRITE */
+					0x00000000 /* EMC_ODT_READ */
+					0x104ab198 /* EMC_FBIO_CFG5 */
+					0xe00700b1 /* EMC_CFG_DIG_DLL */
+					0x00008000 /* EMC_CFG_DIG_DLL_PERIOD */
+					0x007fc007 /* EMC_DLL_XFORM_DQS0 */
+					0x007fc008 /* EMC_DLL_XFORM_DQS1 */
+					0x007f400c /* EMC_DLL_XFORM_DQS2 */
+					0x007fc007 /* EMC_DLL_XFORM_DQS3 */
+					0x007f4006 /* EMC_DLL_XFORM_DQS4 */
+					0x007f8004 /* EMC_DLL_XFORM_DQS5 */
+					0x007f8005 /* EMC_DLL_XFORM_DQS6 */
+					0x007f8004 /* EMC_DLL_XFORM_DQS7 */
+					0x007fc007 /* EMC_DLL_XFORM_DQS8 */
+					0x007fc008 /* EMC_DLL_XFORM_DQS9 */
+					0x007f400c /* EMC_DLL_XFORM_DQS10 */
+					0x007fc007 /* EMC_DLL_XFORM_DQS11 */
+					0x007f4006 /* EMC_DLL_XFORM_DQS12 */
+					0x007f8004 /* EMC_DLL_XFORM_DQS13 */
+					0x007f8005 /* EMC_DLL_XFORM_DQS14 */
+					0x007f8004 /* EMC_DLL_XFORM_DQS15 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE0 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE1 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE2 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE3 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE4 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE6 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE7 */
+					0x00034000 /* EMC_DLL_XFORM_ADDR0 */
+					0x00034000 /* EMC_DLL_XFORM_ADDR1 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR2 */
+					0x00034000 /* EMC_DLL_XFORM_ADDR3 */
+					0x00034000 /* EMC_DLL_XFORM_ADDR4 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE8 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE9 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE10 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE11 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE12 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE13 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE14 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE15 */
+					0x00000006 /* EMC_DLI_TRIM_TXDQS0 */
+					0x00000008 /* EMC_DLI_TRIM_TXDQS1 */
+					0x00000005 /* EMC_DLI_TRIM_TXDQS2 */
+					0x00000009 /* EMC_DLI_TRIM_TXDQS3 */
+					0x00000006 /* EMC_DLI_TRIM_TXDQS4 */
+					0x00000007 /* EMC_DLI_TRIM_TXDQS5 */
+					0x00000006 /* EMC_DLI_TRIM_TXDQS6 */
+					0x00000006 /* EMC_DLI_TRIM_TXDQS7 */
+					0x00000008 /* EMC_DLI_TRIM_TXDQS8 */
+					0x00000008 /* EMC_DLI_TRIM_TXDQS9 */
+					0x00000005 /* EMC_DLI_TRIM_TXDQS10 */
+					0x00000009 /* EMC_DLI_TRIM_TXDQS11 */
+					0x00000006 /* EMC_DLI_TRIM_TXDQS12 */
+					0x00000007 /* EMC_DLI_TRIM_TXDQS13 */
+					0x00000006 /* EMC_DLI_TRIM_TXDQS14 */
+					0x00000008 /* EMC_DLI_TRIM_TXDQS15 */
+					0x0000000e /* EMC_DLL_XFORM_DQ0 */
+					0x0000000e /* EMC_DLL_XFORM_DQ1 */
+					0x0000000e /* EMC_DLL_XFORM_DQ2 */
+					0x0000000e /* EMC_DLL_XFORM_DQ3 */
+					0x0000000e /* EMC_DLL_XFORM_DQ4 */
+					0x0000000e /* EMC_DLL_XFORM_DQ5 */
+					0x0000000e /* EMC_DLL_XFORM_DQ6 */
+					0x0000000e /* EMC_DLL_XFORM_DQ7 */
+					0x100002a0 /* EMC_XM2CMDPADCTRL */
+					0x00000000 /* EMC_XM2CMDPADCTRL4 */
+					0x00111111 /* EMC_XM2CMDPADCTRL5 */
+					0x00000000 /* EMC_XM2DQPADCTRL2 */
+					0x00000000 /* EMC_XM2DQPADCTRL3 */
+					0x77ffc085 /* EMC_XM2CLKPADCTRL */
+					0x00000101 /* EMC_XM2CLKPADCTRL2 */
+					0x81f1f108 /* EMC_XM2COMPPADCTRL */
+					0x07070004 /* EMC_XM2VTTGENPADCTRL */
+					0x00000000 /* EMC_XM2VTTGENPADCTRL2 */
+					0x016eeeee /* EMC_XM2VTTGENPADCTRL3 */
+					0x61861820 /* EMC_XM2DQSPADCTRL3 */
+					0x00492492 /* EMC_XM2DQSPADCTRL4 */
+					0x00492492 /* EMC_XM2DQSPADCTRL5 */
+					0x61861800 /* EMC_XM2DQSPADCTRL6 */
+					0x0606003f /* EMC_DSR_VTTGEN_DRV */
+					0x00000000 /* EMC_TXDSRVTTGEN */
+					0x00000000 /* EMC_FBIO_SPARE */
+					0x00000100 /* EMC_ZCAL_WAIT_CNT */
+					0x006f000e /* EMC_MRS_WAIT_CNT2 */
+					0x00000007 /* EMC_CTT */
+					0x00000004 /* EMC_CTT_DURATION */
+					0x00004080 /* EMC_CFG_PIPE */
+					0x80003012 /* EMC_DYN_SELF_REF_CONTROL */
+					0x0000000f /* EMC_QPOP */
+				>;
+			};
+		};
+
+		emc-timings-6 {
+			nvidia,ram-code = <6>;
+
+			timing-12750000 {
+				clock-frequency = <12750000>;
+
+				nvidia,emc-auto-cal-config = <0xa1430000>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-bgbias-ctl0 = <0x00000008>;
+				nvidia,emc-cfg = <0x73240000>;
+				nvidia,emc-cfg-2 = <0x000008c5>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mode-1 = <0x80100003>;
+				nvidia,emc-mode-2 = <0x80200008>;
+				nvidia,emc-mode-4 = <0x00000000>;
+				nvidia,emc-mode-reset = <0x80001221>;
+				nvidia,emc-mrs-wait-cnt = <0x000c000c>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040128>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0130b118>;
+				nvidia,emc-zcal-cnt-long = <0x00000042>;
+				nvidia,emc-zcal-interval = <0x00000000>;
+
+				nvidia,emc-configuration = <
+					0x00000000 /* EMC_RC */
+					0x00000003 /* EMC_RFC */
+					0x00000000 /* EMC_RFC_SLR */
+					0x00000000 /* EMC_RAS */
+					0x00000000 /* EMC_RP */
+					0x00000004 /* EMC_R2W */
+					0x0000000a /* EMC_W2R */
+					0x00000003 /* EMC_R2P */
+					0x0000000b /* EMC_W2P */
+					0x00000000 /* EMC_RD_RCD */
+					0x00000000 /* EMC_WR_RCD */
+					0x00000003 /* EMC_RRD */
+					0x00000003 /* EMC_REXT */
+					0x00000000 /* EMC_WEXT */
+					0x00000006 /* EMC_WDV */
+					0x00000006 /* EMC_WDV_MASK */
+					0x00000006 /* EMC_QUSE */
+					0x00000002 /* EMC_QUSE_WIDTH */
+					0x00000000 /* EMC_IBDLY */
+					0x00000005 /* EMC_EINPUT */
+					0x00000005 /* EMC_EINPUT_DURATION */
+					0x00010000 /* EMC_PUTERM_EXTRA */
+					0x00000003 /* EMC_PUTERM_WIDTH */
+					0x00000000 /* EMC_PUTERM_ADJ */
+					0x00000000 /* EMC_CDB_CNTL_1 */
+					0x00000000 /* EMC_CDB_CNTL_2 */
+					0x00000000 /* EMC_CDB_CNTL_3 */
+					0x00000004 /* EMC_QRST */
+					0x0000000c /* EMC_QSAFE */
+					0x0000000d /* EMC_RDV */
+					0x0000000f /* EMC_RDV_MASK */
+					0x00000060 /* EMC_REFRESH */
+					0x00000000 /* EMC_BURST_REFRESH_NUM */
+					0x00000018 /* EMC_PRE_REFRESH_REQ_CNT */
+					0x00000002 /* EMC_PDEX2WR */
+					0x00000002 /* EMC_PDEX2RD */
+					0x00000001 /* EMC_PCHG2PDEN */
+					0x00000000 /* EMC_ACT2PDEN */
+					0x00000007 /* EMC_AR2PDEN */
+					0x0000000f /* EMC_RW2PDEN */
+					0x00000005 /* EMC_TXSR */
+					0x00000005 /* EMC_TXSRDLL */
+					0x00000004 /* EMC_TCKE */
+					0x00000005 /* EMC_TCKESR */
+					0x00000004 /* EMC_TPD */
+					0x00000000 /* EMC_TFAW */
+					0x00000000 /* EMC_TRPAB */
+					0x00000005 /* EMC_TCLKSTABLE */
+					0x00000005 /* EMC_TCLKSTOP */
+					0x00000064 /* EMC_TREFBW */
+					0x00000000 /* EMC_FBIO_CFG6 */
+					0x00000000 /* EMC_ODT_WRITE */
+					0x00000000 /* EMC_ODT_READ */
+					0x106aa298 /* EMC_FBIO_CFG5 */
+					0x002c00a0 /* EMC_CFG_DIG_DLL */
+					0x00008000 /* EMC_CFG_DIG_DLL_PERIOD */
+					0x00064000 /* EMC_DLL_XFORM_DQS0 */
+					0x00064000 /* EMC_DLL_XFORM_DQS1 */
+					0x00064000 /* EMC_DLL_XFORM_DQS2 */
+					0x00064000 /* EMC_DLL_XFORM_DQS3 */
+					0x00064000 /* EMC_DLL_XFORM_DQS4 */
+					0x00064000 /* EMC_DLL_XFORM_DQS5 */
+					0x00064000 /* EMC_DLL_XFORM_DQS6 */
+					0x00064000 /* EMC_DLL_XFORM_DQS7 */
+					0x00064000 /* EMC_DLL_XFORM_DQS8 */
+					0x00064000 /* EMC_DLL_XFORM_DQS9 */
+					0x00064000 /* EMC_DLL_XFORM_DQS10 */
+					0x00064000 /* EMC_DLL_XFORM_DQS11 */
+					0x00064000 /* EMC_DLL_XFORM_DQS12 */
+					0x00064000 /* EMC_DLL_XFORM_DQS13 */
+					0x00064000 /* EMC_DLL_XFORM_DQS14 */
+					0x00064000 /* EMC_DLL_XFORM_DQS15 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE0 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE1 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE2 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE3 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE4 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE6 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE7 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR0 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR1 */
+					0x00004000 /* EMC_DLL_XFORM_ADDR2 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR3 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR4 */
+					0x00004000 /* EMC_DLL_XFORM_ADDR5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE8 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE9 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE10 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE11 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE12 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE13 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE14 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE15 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS0 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS1 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS2 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS3 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS4 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS5 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS6 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS7 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS8 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS9 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS10 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS11 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS12 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS13 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS14 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS15 */
+					0x000fc000 /* EMC_DLL_XFORM_DQ0 */
+					0x000fc000 /* EMC_DLL_XFORM_DQ1 */
+					0x000fc000 /* EMC_DLL_XFORM_DQ2 */
+					0x000fc000 /* EMC_DLL_XFORM_DQ3 */
+					0x0000fc00 /* EMC_DLL_XFORM_DQ4 */
+					0x0000fc00 /* EMC_DLL_XFORM_DQ5 */
+					0x0000fc00 /* EMC_DLL_XFORM_DQ6 */
+					0x0000fc00 /* EMC_DLL_XFORM_DQ7 */
+					0x10000280 /* EMC_XM2CMDPADCTRL */
+					0x00000000 /* EMC_XM2CMDPADCTRL4 */
+					0x00111111 /* EMC_XM2CMDPADCTRL5 */
+					0x00000000 /* EMC_XM2DQPADCTRL2 */
+					0x00000000 /* EMC_XM2DQPADCTRL3 */
+					0x77ffc081 /* EMC_XM2CLKPADCTRL */
+					0x00000303 /* EMC_XM2CLKPADCTRL2 */
+					0x81f1f108 /* EMC_XM2COMPPADCTRL */
+					0x07070004 /* EMC_XM2VTTGENPADCTRL */
+					0x0000003f /* EMC_XM2VTTGENPADCTRL2 */
+					0x016eeeee /* EMC_XM2VTTGENPADCTRL3 */
+					0x51451400 /* EMC_XM2DQSPADCTRL3 */
+					0x00514514 /* EMC_XM2DQSPADCTRL4 */
+					0x00514514 /* EMC_XM2DQSPADCTRL5 */
+					0x51451400 /* EMC_XM2DQSPADCTRL6 */
+					0x0000003f /* EMC_DSR_VTTGEN_DRV */
+					0x00000007 /* EMC_TXDSRVTTGEN */
+					0x00000000 /* EMC_FBIO_SPARE */
+					0x00000042 /* EMC_ZCAL_WAIT_CNT */
+					0x000c000c /* EMC_MRS_WAIT_CNT2 */
+					0x00000000 /* EMC_CTT */
+					0x00000003 /* EMC_CTT_DURATION */
+					0x0000f2f3 /* EMC_CFG_PIPE */
+					0x800001c5 /* EMC_DYN_SELF_REF_CONTROL */
+					0x0000000a /* EMC_QPOP */
+				>;
+			};
+
+			timing-20400000 {
+				clock-frequency = <20400000>;
+
+				nvidia,emc-auto-cal-config = <0xa1430000>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-bgbias-ctl0 = <0x00000008>;
+				nvidia,emc-cfg = <0x73240000>;
+				nvidia,emc-cfg-2 = <0x000008c5>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mode-1 = <0x80100003>;
+				nvidia,emc-mode-2 = <0x80200008>;
+				nvidia,emc-mode-4 = <0x00000000>;
+				nvidia,emc-mode-reset = <0x80001221>;
+				nvidia,emc-mrs-wait-cnt = <0x000c000c>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040128>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0130b118>;
+				nvidia,emc-zcal-cnt-long = <0x00000042>;
+				nvidia,emc-zcal-interval = <0x00000000>;
+
+				nvidia,emc-configuration = <
+					0x00000000 /* EMC_RC */
+					0x00000005 /* EMC_RFC */
+					0x00000000 /* EMC_RFC_SLR */
+					0x00000000 /* EMC_RAS */
+					0x00000000 /* EMC_RP */
+					0x00000004 /* EMC_R2W */
+					0x0000000a /* EMC_W2R */
+					0x00000003 /* EMC_R2P */
+					0x0000000b /* EMC_W2P */
+					0x00000000 /* EMC_RD_RCD */
+					0x00000000 /* EMC_WR_RCD */
+					0x00000003 /* EMC_RRD */
+					0x00000003 /* EMC_REXT */
+					0x00000000 /* EMC_WEXT */
+					0x00000006 /* EMC_WDV */
+					0x00000006 /* EMC_WDV_MASK */
+					0x00000006 /* EMC_QUSE */
+					0x00000002 /* EMC_QUSE_WIDTH */
+					0x00000000 /* EMC_IBDLY */
+					0x00000005 /* EMC_EINPUT */
+					0x00000005 /* EMC_EINPUT_DURATION */
+					0x00010000 /* EMC_PUTERM_EXTRA */
+					0x00000003 /* EMC_PUTERM_WIDTH */
+					0x00000000 /* EMC_PUTERM_ADJ */
+					0x00000000 /* EMC_CDB_CNTL_1 */
+					0x00000000 /* EMC_CDB_CNTL_2 */
+					0x00000000 /* EMC_CDB_CNTL_3 */
+					0x00000004 /* EMC_QRST */
+					0x0000000c /* EMC_QSAFE */
+					0x0000000d /* EMC_RDV */
+					0x0000000f /* EMC_RDV_MASK */
+					0x0000009a /* EMC_REFRESH */
+					0x00000000 /* EMC_BURST_REFRESH_NUM */
+					0x00000026 /* EMC_PRE_REFRESH_REQ_CNT */
+					0x00000002 /* EMC_PDEX2WR */
+					0x00000002 /* EMC_PDEX2RD */
+					0x00000001 /* EMC_PCHG2PDEN */
+					0x00000000 /* EMC_ACT2PDEN */
+					0x00000007 /* EMC_AR2PDEN */
+					0x0000000f /* EMC_RW2PDEN */
+					0x00000006 /* EMC_TXSR */
+					0x00000006 /* EMC_TXSRDLL */
+					0x00000004 /* EMC_TCKE */
+					0x00000005 /* EMC_TCKESR */
+					0x00000004 /* EMC_TPD */
+					0x00000000 /* EMC_TFAW */
+					0x00000000 /* EMC_TRPAB */
+					0x00000005 /* EMC_TCLKSTABLE */
+					0x00000005 /* EMC_TCLKSTOP */
+					0x000000a0 /* EMC_TREFBW */
+					0x00000000 /* EMC_FBIO_CFG6 */
+					0x00000000 /* EMC_ODT_WRITE */
+					0x00000000 /* EMC_ODT_READ */
+					0x106aa298 /* EMC_FBIO_CFG5 */
+					0x002c00a0 /* EMC_CFG_DIG_DLL */
+					0x00008000 /* EMC_CFG_DIG_DLL_PERIOD */
+					0x00064000 /* EMC_DLL_XFORM_DQS0 */
+					0x00064000 /* EMC_DLL_XFORM_DQS1 */
+					0x00064000 /* EMC_DLL_XFORM_DQS2 */
+					0x00064000 /* EMC_DLL_XFORM_DQS3 */
+					0x00064000 /* EMC_DLL_XFORM_DQS4 */
+					0x00064000 /* EMC_DLL_XFORM_DQS5 */
+					0x00064000 /* EMC_DLL_XFORM_DQS6 */
+					0x00064000 /* EMC_DLL_XFORM_DQS7 */
+					0x00064000 /* EMC_DLL_XFORM_DQS8 */
+					0x00064000 /* EMC_DLL_XFORM_DQS9 */
+					0x00064000 /* EMC_DLL_XFORM_DQS10 */
+					0x00064000 /* EMC_DLL_XFORM_DQS11 */
+					0x00064000 /* EMC_DLL_XFORM_DQS12 */
+					0x00064000 /* EMC_DLL_XFORM_DQS13 */
+					0x00064000 /* EMC_DLL_XFORM_DQS14 */
+					0x00064000 /* EMC_DLL_XFORM_DQS15 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE0 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE1 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE2 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE3 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE4 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE6 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE7 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR0 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR1 */
+					0x00004000 /* EMC_DLL_XFORM_ADDR2 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR3 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR4 */
+					0x00004000 /* EMC_DLL_XFORM_ADDR5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE8 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE9 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE10 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE11 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE12 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE13 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE14 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE15 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS0 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS1 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS2 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS3 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS4 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS5 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS6 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS7 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS8 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS9 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS10 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS11 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS12 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS13 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS14 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS15 */
+					0x000fc000 /* EMC_DLL_XFORM_DQ0 */
+					0x000fc000 /* EMC_DLL_XFORM_DQ1 */
+					0x000fc000 /* EMC_DLL_XFORM_DQ2 */
+					0x000fc000 /* EMC_DLL_XFORM_DQ3 */
+					0x0000fc00 /* EMC_DLL_XFORM_DQ4 */
+					0x0000fc00 /* EMC_DLL_XFORM_DQ5 */
+					0x0000fc00 /* EMC_DLL_XFORM_DQ6 */
+					0x0000fc00 /* EMC_DLL_XFORM_DQ7 */
+					0x10000280 /* EMC_XM2CMDPADCTRL */
+					0x00000000 /* EMC_XM2CMDPADCTRL4 */
+					0x00111111 /* EMC_XM2CMDPADCTRL5 */
+					0x00000000 /* EMC_XM2DQPADCTRL2 */
+					0x00000000 /* EMC_XM2DQPADCTRL3 */
+					0x77ffc081 /* EMC_XM2CLKPADCTRL */
+					0x00000303 /* EMC_XM2CLKPADCTRL2 */
+					0x81f1f108 /* EMC_XM2COMPPADCTRL */
+					0x07070004 /* EMC_XM2VTTGENPADCTRL */
+					0x0000003f /* EMC_XM2VTTGENPADCTRL2 */
+					0x016eeeee /* EMC_XM2VTTGENPADCTRL3 */
+					0x51451400 /* EMC_XM2DQSPADCTRL3 */
+					0x00514514 /* EMC_XM2DQSPADCTRL4 */
+					0x00514514 /* EMC_XM2DQSPADCTRL5 */
+					0x51451400 /* EMC_XM2DQSPADCTRL6 */
+					0x0000003f /* EMC_DSR_VTTGEN_DRV */
+					0x0000000b /* EMC_TXDSRVTTGEN */
+					0x00000000 /* EMC_FBIO_SPARE */
+					0x00000042 /* EMC_ZCAL_WAIT_CNT */
+					0x000c000c /* EMC_MRS_WAIT_CNT2 */
+					0x00000000 /* EMC_CTT */
+					0x00000003 /* EMC_CTT_DURATION */
+					0x0000f2f3 /* EMC_CFG_PIPE */
+					0x8000023a /* EMC_DYN_SELF_REF_CONTROL */
+					0x0000000a /* EMC_QPOP */
+				>;
+			};
+
+			timing-40800000 {
+				clock-frequency = <40800000>;
+
+				nvidia,emc-auto-cal-config = <0xa1430000>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-bgbias-ctl0 = <0x00000008>;
+				nvidia,emc-cfg = <0x73240000>;
+				nvidia,emc-cfg-2 = <0x000008c5>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mode-1 = <0x80100003>;
+				nvidia,emc-mode-2 = <0x80200008>;
+				nvidia,emc-mode-4 = <0x00000000>;
+				nvidia,emc-mode-reset = <0x80001221>;
+				nvidia,emc-mrs-wait-cnt = <0x000c000c>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040128>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0130b118>;
+				nvidia,emc-zcal-cnt-long = <0x00000042>;
+				nvidia,emc-zcal-interval = <0x00000000>;
+
+				nvidia,emc-configuration = <
+					0x00000001 /* EMC_RC */
+					0x0000000a /* EMC_RFC */
+					0x00000000 /* EMC_RFC_SLR */
+					0x00000001 /* EMC_RAS */
+					0x00000000 /* EMC_RP */
+					0x00000004 /* EMC_R2W */
+					0x0000000a /* EMC_W2R */
+					0x00000003 /* EMC_R2P */
+					0x0000000b /* EMC_W2P */
+					0x00000000 /* EMC_RD_RCD */
+					0x00000000 /* EMC_WR_RCD */
+					0x00000003 /* EMC_RRD */
+					0x00000003 /* EMC_REXT */
+					0x00000000 /* EMC_WEXT */
+					0x00000006 /* EMC_WDV */
+					0x00000006 /* EMC_WDV_MASK */
+					0x00000006 /* EMC_QUSE */
+					0x00000002 /* EMC_QUSE_WIDTH */
+					0x00000000 /* EMC_IBDLY */
+					0x00000005 /* EMC_EINPUT */
+					0x00000005 /* EMC_EINPUT_DURATION */
+					0x00010000 /* EMC_PUTERM_EXTRA */
+					0x00000003 /* EMC_PUTERM_WIDTH */
+					0x00000000 /* EMC_PUTERM_ADJ */
+					0x00000000 /* EMC_CDB_CNTL_1 */
+					0x00000000 /* EMC_CDB_CNTL_2 */
+					0x00000000 /* EMC_CDB_CNTL_3 */
+					0x00000004 /* EMC_QRST */
+					0x0000000c /* EMC_QSAFE */
+					0x0000000d /* EMC_RDV */
+					0x0000000f /* EMC_RDV_MASK */
+					0x00000134 /* EMC_REFRESH */
+					0x00000000 /* EMC_BURST_REFRESH_NUM */
+					0x0000004d /* EMC_PRE_REFRESH_REQ_CNT */
+					0x00000002 /* EMC_PDEX2WR */
+					0x00000002 /* EMC_PDEX2RD */
+					0x00000001 /* EMC_PCHG2PDEN */
+					0x00000000 /* EMC_ACT2PDEN */
+					0x00000008 /* EMC_AR2PDEN */
+					0x0000000f /* EMC_RW2PDEN */
+					0x0000000c /* EMC_TXSR */
+					0x0000000c /* EMC_TXSRDLL */
+					0x00000004 /* EMC_TCKE */
+					0x00000005 /* EMC_TCKESR */
+					0x00000004 /* EMC_TPD */
+					0x00000000 /* EMC_TFAW */
+					0x00000000 /* EMC_TRPAB */
+					0x00000005 /* EMC_TCLKSTABLE */
+					0x00000005 /* EMC_TCLKSTOP */
+					0x0000013f /* EMC_TREFBW */
+					0x00000000 /* EMC_FBIO_CFG6 */
+					0x00000000 /* EMC_ODT_WRITE */
+					0x00000000 /* EMC_ODT_READ */
+					0x106aa298 /* EMC_FBIO_CFG5 */
+					0x002c00a0 /* EMC_CFG_DIG_DLL */
+					0x00008000 /* EMC_CFG_DIG_DLL_PERIOD */
+					0x00064000 /* EMC_DLL_XFORM_DQS0 */
+					0x00064000 /* EMC_DLL_XFORM_DQS1 */
+					0x00064000 /* EMC_DLL_XFORM_DQS2 */
+					0x00064000 /* EMC_DLL_XFORM_DQS3 */
+					0x00064000 /* EMC_DLL_XFORM_DQS4 */
+					0x00064000 /* EMC_DLL_XFORM_DQS5 */
+					0x00064000 /* EMC_DLL_XFORM_DQS6 */
+					0x00064000 /* EMC_DLL_XFORM_DQS7 */
+					0x00064000 /* EMC_DLL_XFORM_DQS8 */
+					0x00064000 /* EMC_DLL_XFORM_DQS9 */
+					0x00064000 /* EMC_DLL_XFORM_DQS10 */
+					0x00064000 /* EMC_DLL_XFORM_DQS11 */
+					0x00064000 /* EMC_DLL_XFORM_DQS12 */
+					0x00064000 /* EMC_DLL_XFORM_DQS13 */
+					0x00064000 /* EMC_DLL_XFORM_DQS14 */
+					0x00064000 /* EMC_DLL_XFORM_DQS15 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE0 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE1 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE2 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE3 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE4 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE6 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE7 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR0 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR1 */
+					0x00004000 /* EMC_DLL_XFORM_ADDR2 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR3 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR4 */
+					0x00004000 /* EMC_DLL_XFORM_ADDR5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE8 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE9 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE10 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE11 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE12 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE13 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE14 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE15 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS0 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS1 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS2 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS3 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS4 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS5 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS6 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS7 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS8 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS9 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS10 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS11 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS12 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS13 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS14 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS15 */
+					0x000fc000 /* EMC_DLL_XFORM_DQ0 */
+					0x000fc000 /* EMC_DLL_XFORM_DQ1 */
+					0x000fc000 /* EMC_DLL_XFORM_DQ2 */
+					0x000fc000 /* EMC_DLL_XFORM_DQ3 */
+					0x0000fc00 /* EMC_DLL_XFORM_DQ4 */
+					0x0000fc00 /* EMC_DLL_XFORM_DQ5 */
+					0x0000fc00 /* EMC_DLL_XFORM_DQ6 */
+					0x0000fc00 /* EMC_DLL_XFORM_DQ7 */
+					0x10000280 /* EMC_XM2CMDPADCTRL */
+					0x00000000 /* EMC_XM2CMDPADCTRL4 */
+					0x00111111 /* EMC_XM2CMDPADCTRL5 */
+					0x00000000 /* EMC_XM2DQPADCTRL2 */
+					0x00000000 /* EMC_XM2DQPADCTRL3 */
+					0x77ffc081 /* EMC_XM2CLKPADCTRL */
+					0x00000303 /* EMC_XM2CLKPADCTRL2 */
+					0x81f1f108 /* EMC_XM2COMPPADCTRL */
+					0x07070004 /* EMC_XM2VTTGENPADCTRL */
+					0x0000003f /* EMC_XM2VTTGENPADCTRL2 */
+					0x016eeeee /* EMC_XM2VTTGENPADCTRL3 */
+					0x51451400 /* EMC_XM2DQSPADCTRL3 */
+					0x00514514 /* EMC_XM2DQSPADCTRL4 */
+					0x00514514 /* EMC_XM2DQSPADCTRL5 */
+					0x51451400 /* EMC_XM2DQSPADCTRL6 */
+					0x0000003f /* EMC_DSR_VTTGEN_DRV */
+					0x00000015 /* EMC_TXDSRVTTGEN */
+					0x00000000 /* EMC_FBIO_SPARE */
+					0x00000042 /* EMC_ZCAL_WAIT_CNT */
+					0x000c000c /* EMC_MRS_WAIT_CNT2 */
+					0x00000000 /* EMC_CTT */
+					0x00000003 /* EMC_CTT_DURATION */
+					0x0000f2f3 /* EMC_CFG_PIPE */
+					0x80000370 /* EMC_DYN_SELF_REF_CONTROL */
+					0x0000000a /* EMC_QPOP */
+				>;
+			};
+
+			timing-68000000 {
+				clock-frequency = <68000000>;
+
+				nvidia,emc-auto-cal-config = <0xa1430000>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-bgbias-ctl0 = <0x00000008>;
+				nvidia,emc-cfg = <0x73240000>;
+				nvidia,emc-cfg-2 = <0x000008c5>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mode-1 = <0x80100003>;
+				nvidia,emc-mode-2 = <0x80200008>;
+				nvidia,emc-mode-4 = <0x00000000>;
+				nvidia,emc-mode-reset = <0x80001221>;
+				nvidia,emc-mrs-wait-cnt = <0x000c000c>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040128>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0130b118>;
+				nvidia,emc-zcal-cnt-long = <0x00000042>;
+				nvidia,emc-zcal-interval = <0x00000000>;
+
+				nvidia,emc-configuration = <
+					0x00000003 /* EMC_RC */
+					0x00000011 /* EMC_RFC */
+					0x00000000 /* EMC_RFC_SLR */
+					0x00000002 /* EMC_RAS */
+					0x00000000 /* EMC_RP */
+					0x00000004 /* EMC_R2W */
+					0x0000000a /* EMC_W2R */
+					0x00000003 /* EMC_R2P */
+					0x0000000b /* EMC_W2P */
+					0x00000000 /* EMC_RD_RCD */
+					0x00000000 /* EMC_WR_RCD */
+					0x00000003 /* EMC_RRD */
+					0x00000003 /* EMC_REXT */
+					0x00000000 /* EMC_WEXT */
+					0x00000006 /* EMC_WDV */
+					0x00000006 /* EMC_WDV_MASK */
+					0x00000006 /* EMC_QUSE */
+					0x00000002 /* EMC_QUSE_WIDTH */
+					0x00000000 /* EMC_IBDLY */
+					0x00000005 /* EMC_EINPUT */
+					0x00000005 /* EMC_EINPUT_DURATION */
+					0x00010000 /* EMC_PUTERM_EXTRA */
+					0x00000003 /* EMC_PUTERM_WIDTH */
+					0x00000000 /* EMC_PUTERM_ADJ */
+					0x00000000 /* EMC_CDB_CNTL_1 */
+					0x00000000 /* EMC_CDB_CNTL_2 */
+					0x00000000 /* EMC_CDB_CNTL_3 */
+					0x00000004 /* EMC_QRST */
+					0x0000000c /* EMC_QSAFE */
+					0x0000000d /* EMC_RDV */
+					0x0000000f /* EMC_RDV_MASK */
+					0x00000202 /* EMC_REFRESH */
+					0x00000000 /* EMC_BURST_REFRESH_NUM */
+					0x00000080 /* EMC_PRE_REFRESH_REQ_CNT */
+					0x00000002 /* EMC_PDEX2WR */
+					0x00000002 /* EMC_PDEX2RD */
+					0x00000001 /* EMC_PCHG2PDEN */
+					0x00000000 /* EMC_ACT2PDEN */
+					0x0000000f /* EMC_AR2PDEN */
+					0x0000000f /* EMC_RW2PDEN */
+					0x00000013 /* EMC_TXSR */
+					0x00000013 /* EMC_TXSRDLL */
+					0x00000004 /* EMC_TCKE */
+					0x00000005 /* EMC_TCKESR */
+					0x00000004 /* EMC_TPD */
+					0x00000001 /* EMC_TFAW */
+					0x00000000 /* EMC_TRPAB */
+					0x00000005 /* EMC_TCLKSTABLE */
+					0x00000005 /* EMC_TCLKSTOP */
+					0x00000213 /* EMC_TREFBW */
+					0x00000000 /* EMC_FBIO_CFG6 */
+					0x00000000 /* EMC_ODT_WRITE */
+					0x00000000 /* EMC_ODT_READ */
+					0x106aa298 /* EMC_FBIO_CFG5 */
+					0x002c00a0 /* EMC_CFG_DIG_DLL */
+					0x00008000 /* EMC_CFG_DIG_DLL_PERIOD */
+					0x00064000 /* EMC_DLL_XFORM_DQS0 */
+					0x00064000 /* EMC_DLL_XFORM_DQS1 */
+					0x00064000 /* EMC_DLL_XFORM_DQS2 */
+					0x00064000 /* EMC_DLL_XFORM_DQS3 */
+					0x00064000 /* EMC_DLL_XFORM_DQS4 */
+					0x00064000 /* EMC_DLL_XFORM_DQS5 */
+					0x00064000 /* EMC_DLL_XFORM_DQS6 */
+					0x00064000 /* EMC_DLL_XFORM_DQS7 */
+					0x00064000 /* EMC_DLL_XFORM_DQS8 */
+					0x00064000 /* EMC_DLL_XFORM_DQS9 */
+					0x00064000 /* EMC_DLL_XFORM_DQS10 */
+					0x00064000 /* EMC_DLL_XFORM_DQS11 */
+					0x00064000 /* EMC_DLL_XFORM_DQS12 */
+					0x00064000 /* EMC_DLL_XFORM_DQS13 */
+					0x00064000 /* EMC_DLL_XFORM_DQS14 */
+					0x00064000 /* EMC_DLL_XFORM_DQS15 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE0 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE1 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE2 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE3 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE4 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE6 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE7 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR0 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR1 */
+					0x00004000 /* EMC_DLL_XFORM_ADDR2 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR3 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR4 */
+					0x00004000 /* EMC_DLL_XFORM_ADDR5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE8 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE9 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE10 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE11 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE12 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE13 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE14 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE15 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS0 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS1 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS2 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS3 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS4 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS5 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS6 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS7 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS8 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS9 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS10 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS11 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS12 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS13 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS14 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS15 */
+					0x000fc000 /* EMC_DLL_XFORM_DQ0 */
+					0x000fc000 /* EMC_DLL_XFORM_DQ1 */
+					0x000fc000 /* EMC_DLL_XFORM_DQ2 */
+					0x000fc000 /* EMC_DLL_XFORM_DQ3 */
+					0x0000fc00 /* EMC_DLL_XFORM_DQ4 */
+					0x0000fc00 /* EMC_DLL_XFORM_DQ5 */
+					0x0000fc00 /* EMC_DLL_XFORM_DQ6 */
+					0x0000fc00 /* EMC_DLL_XFORM_DQ7 */
+					0x10000280 /* EMC_XM2CMDPADCTRL */
+					0x00000000 /* EMC_XM2CMDPADCTRL4 */
+					0x00111111 /* EMC_XM2CMDPADCTRL5 */
+					0x00000000 /* EMC_XM2DQPADCTRL2 */
+					0x00000000 /* EMC_XM2DQPADCTRL3 */
+					0x77ffc081 /* EMC_XM2CLKPADCTRL */
+					0x00000303 /* EMC_XM2CLKPADCTRL2 */
+					0x81f1f108 /* EMC_XM2COMPPADCTRL */
+					0x07070004 /* EMC_XM2VTTGENPADCTRL */
+					0x0000003f /* EMC_XM2VTTGENPADCTRL2 */
+					0x016eeeee /* EMC_XM2VTTGENPADCTRL3 */
+					0x51451400 /* EMC_XM2DQSPADCTRL3 */
+					0x00514514 /* EMC_XM2DQSPADCTRL4 */
+					0x00514514 /* EMC_XM2DQSPADCTRL5 */
+					0x51451400 /* EMC_XM2DQSPADCTRL6 */
+					0x0000003f /* EMC_DSR_VTTGEN_DRV */
+					0x00000022 /* EMC_TXDSRVTTGEN */
+					0x00000000 /* EMC_FBIO_SPARE */
+					0x00000042 /* EMC_ZCAL_WAIT_CNT */
+					0x000c000c /* EMC_MRS_WAIT_CNT2 */
+					0x00000000 /* EMC_CTT */
+					0x00000003 /* EMC_CTT_DURATION */
+					0x0000f2f3 /* EMC_CFG_PIPE */
+					0x8000050e /* EMC_DYN_SELF_REF_CONTROL */
+					0x0000000a /* EMC_QPOP */
+				>;
+			};
+
+			timing-102000000 {
+				clock-frequency = <102000000>;
+
+				nvidia,emc-auto-cal-config = <0xa1430000>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-bgbias-ctl0 = <0x00000008>;
+				nvidia,emc-cfg = <0x73240000>;
+				nvidia,emc-cfg-2 = <0x000008c5>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mode-1 = <0x80100003>;
+				nvidia,emc-mode-2 = <0x80200008>;
+				nvidia,emc-mode-4 = <0x00000000>;
+				nvidia,emc-mode-reset = <0x80001221>;
+				nvidia,emc-mrs-wait-cnt = <0x000c000c>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040128>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0130b118>;
+				nvidia,emc-zcal-cnt-long = <0x00000042>;
+				nvidia,emc-zcal-interval = <0x00000000>;
+
+				nvidia,emc-configuration = <
+					0x00000004 /* EMC_RC */
+					0x0000001a /* EMC_RFC */
+					0x00000000 /* EMC_RFC_SLR */
+					0x00000003 /* EMC_RAS */
+					0x00000001 /* EMC_RP */
+					0x00000004 /* EMC_R2W */
+					0x0000000a /* EMC_W2R */
+					0x00000003 /* EMC_R2P */
+					0x0000000b /* EMC_W2P */
+					0x00000001 /* EMC_RD_RCD */
+					0x00000001 /* EMC_WR_RCD */
+					0x00000003 /* EMC_RRD */
+					0x00000003 /* EMC_REXT */
+					0x00000000 /* EMC_WEXT */
+					0x00000006 /* EMC_WDV */
+					0x00000006 /* EMC_WDV_MASK */
+					0x00000006 /* EMC_QUSE */
+					0x00000002 /* EMC_QUSE_WIDTH */
+					0x00000000 /* EMC_IBDLY */
+					0x00000005 /* EMC_EINPUT */
+					0x00000005 /* EMC_EINPUT_DURATION */
+					0x00010000 /* EMC_PUTERM_EXTRA */
+					0x00000003 /* EMC_PUTERM_WIDTH */
+					0x00000000 /* EMC_PUTERM_ADJ */
+					0x00000000 /* EMC_CDB_CNTL_1 */
+					0x00000000 /* EMC_CDB_CNTL_2 */
+					0x00000000 /* EMC_CDB_CNTL_3 */
+					0x00000004 /* EMC_QRST */
+					0x0000000c /* EMC_QSAFE */
+					0x0000000d /* EMC_RDV */
+					0x0000000f /* EMC_RDV_MASK */
+					0x00000304 /* EMC_REFRESH */
+					0x00000000 /* EMC_BURST_REFRESH_NUM */
+					0x000000c1 /* EMC_PRE_REFRESH_REQ_CNT */
+					0x00000002 /* EMC_PDEX2WR */
+					0x00000002 /* EMC_PDEX2RD */
+					0x00000001 /* EMC_PCHG2PDEN */
+					0x00000000 /* EMC_ACT2PDEN */
+					0x00000018 /* EMC_AR2PDEN */
+					0x0000000f /* EMC_RW2PDEN */
+					0x0000001c /* EMC_TXSR */
+					0x0000001c /* EMC_TXSRDLL */
+					0x00000004 /* EMC_TCKE */
+					0x00000005 /* EMC_TCKESR */
+					0x00000004 /* EMC_TPD */
+					0x00000003 /* EMC_TFAW */
+					0x00000000 /* EMC_TRPAB */
+					0x00000005 /* EMC_TCLKSTABLE */
+					0x00000005 /* EMC_TCLKSTOP */
+					0x0000031c /* EMC_TREFBW */
+					0x00000000 /* EMC_FBIO_CFG6 */
+					0x00000000 /* EMC_ODT_WRITE */
+					0x00000000 /* EMC_ODT_READ */
+					0x106aa298 /* EMC_FBIO_CFG5 */
+					0x002c00a0 /* EMC_CFG_DIG_DLL */
+					0x00008000 /* EMC_CFG_DIG_DLL_PERIOD */
+					0x00064000 /* EMC_DLL_XFORM_DQS0 */
+					0x00064000 /* EMC_DLL_XFORM_DQS1 */
+					0x00064000 /* EMC_DLL_XFORM_DQS2 */
+					0x00064000 /* EMC_DLL_XFORM_DQS3 */
+					0x00064000 /* EMC_DLL_XFORM_DQS4 */
+					0x00064000 /* EMC_DLL_XFORM_DQS5 */
+					0x00064000 /* EMC_DLL_XFORM_DQS6 */
+					0x00064000 /* EMC_DLL_XFORM_DQS7 */
+					0x00064000 /* EMC_DLL_XFORM_DQS8 */
+					0x00064000 /* EMC_DLL_XFORM_DQS9 */
+					0x00064000 /* EMC_DLL_XFORM_DQS10 */
+					0x00064000 /* EMC_DLL_XFORM_DQS11 */
+					0x00064000 /* EMC_DLL_XFORM_DQS12 */
+					0x00064000 /* EMC_DLL_XFORM_DQS13 */
+					0x00064000 /* EMC_DLL_XFORM_DQS14 */
+					0x00064000 /* EMC_DLL_XFORM_DQS15 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE0 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE1 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE2 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE3 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE4 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE6 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE7 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR0 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR1 */
+					0x00004000 /* EMC_DLL_XFORM_ADDR2 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR3 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR4 */
+					0x00004000 /* EMC_DLL_XFORM_ADDR5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE8 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE9 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE10 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE11 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE12 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE13 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE14 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE15 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS0 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS1 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS2 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS3 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS4 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS5 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS6 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS7 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS8 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS9 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS10 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS11 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS12 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS13 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS14 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS15 */
+					0x000fc000 /* EMC_DLL_XFORM_DQ0 */
+					0x000fc000 /* EMC_DLL_XFORM_DQ1 */
+					0x000fc000 /* EMC_DLL_XFORM_DQ2 */
+					0x000fc000 /* EMC_DLL_XFORM_DQ3 */
+					0x0000fc00 /* EMC_DLL_XFORM_DQ4 */
+					0x0000fc00 /* EMC_DLL_XFORM_DQ5 */
+					0x0000fc00 /* EMC_DLL_XFORM_DQ6 */
+					0x0000fc00 /* EMC_DLL_XFORM_DQ7 */
+					0x10000280 /* EMC_XM2CMDPADCTRL */
+					0x00000000 /* EMC_XM2CMDPADCTRL4 */
+					0x00111111 /* EMC_XM2CMDPADCTRL5 */
+					0x00000000 /* EMC_XM2DQPADCTRL2 */
+					0x00000000 /* EMC_XM2DQPADCTRL3 */
+					0x77ffc081 /* EMC_XM2CLKPADCTRL */
+					0x00000303 /* EMC_XM2CLKPADCTRL2 */
+					0x81f1f108 /* EMC_XM2COMPPADCTRL */
+					0x07070004 /* EMC_XM2VTTGENPADCTRL */
+					0x0000003f /* EMC_XM2VTTGENPADCTRL2 */
+					0x016eeeee /* EMC_XM2VTTGENPADCTRL3 */
+					0x51451400 /* EMC_XM2DQSPADCTRL3 */
+					0x00514514 /* EMC_XM2DQSPADCTRL4 */
+					0x00514514 /* EMC_XM2DQSPADCTRL5 */
+					0x51451400 /* EMC_XM2DQSPADCTRL6 */
+					0x0000003f /* EMC_DSR_VTTGEN_DRV */
+					0x00000033 /* EMC_TXDSRVTTGEN */
+					0x00000000 /* EMC_FBIO_SPARE */
+					0x00000042 /* EMC_ZCAL_WAIT_CNT */
+					0x000c000c /* EMC_MRS_WAIT_CNT2 */
+					0x00000000 /* EMC_CTT */
+					0x00000003 /* EMC_CTT_DURATION */
+					0x0000f2f3 /* EMC_CFG_PIPE */
+					0x80000713 /* EMC_DYN_SELF_REF_CONTROL */
+					0x0000000a /* EMC_QPOP */
+				>;
+			};
+
+			timing-204000000 {
+				clock-frequency = <204000000>;
+
+				nvidia,emc-auto-cal-config = <0xa1430000>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-bgbias-ctl0 = <0x00000008>;
+				nvidia,emc-cfg = <0x73240000>;
+				nvidia,emc-cfg-2 = <0x0000088d>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mode-1 = <0x80100003>;
+				nvidia,emc-mode-2 = <0x80200008>;
+				nvidia,emc-mode-4 = <0x00000000>;
+				nvidia,emc-mode-reset = <0x80001221>;
+				nvidia,emc-mrs-wait-cnt = <0x000c000c>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040008>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0130b118>;
+				nvidia,emc-zcal-cnt-long = <0x00000042>;
+				nvidia,emc-zcal-interval = <0x00020000>;
+
+				nvidia,emc-configuration = <
+					0x00000009 /* EMC_RC */
+					0x00000035 /* EMC_RFC */
+					0x00000000 /* EMC_RFC_SLR */
+					0x00000007 /* EMC_RAS */
+					0x00000002 /* EMC_RP */
+					0x00000005 /* EMC_R2W */
+					0x0000000a /* EMC_W2R */
+					0x00000003 /* EMC_R2P */
+					0x0000000b /* EMC_W2P */
+					0x00000002 /* EMC_RD_RCD */
+					0x00000002 /* EMC_WR_RCD */
+					0x00000003 /* EMC_RRD */
+					0x00000003 /* EMC_REXT */
+					0x00000000 /* EMC_WEXT */
+					0x00000005 /* EMC_WDV */
+					0x00000005 /* EMC_WDV_MASK */
+					0x00000006 /* EMC_QUSE */
+					0x00000002 /* EMC_QUSE_WIDTH */
+					0x00000000 /* EMC_IBDLY */
+					0x00000004 /* EMC_EINPUT */
+					0x00000006 /* EMC_EINPUT_DURATION */
+					0x00010000 /* EMC_PUTERM_EXTRA */
+					0x00000003 /* EMC_PUTERM_WIDTH */
+					0x00000000 /* EMC_PUTERM_ADJ */
+					0x00000000 /* EMC_CDB_CNTL_1 */
+					0x00000000 /* EMC_CDB_CNTL_2 */
+					0x00000000 /* EMC_CDB_CNTL_3 */
+					0x00000003 /* EMC_QRST */
+					0x0000000d /* EMC_QSAFE */
+					0x0000000f /* EMC_RDV */
+					0x00000011 /* EMC_RDV_MASK */
+					0x00000607 /* EMC_REFRESH */
+					0x00000000 /* EMC_BURST_REFRESH_NUM */
+					0x00000181 /* EMC_PRE_REFRESH_REQ_CNT */
+					0x00000002 /* EMC_PDEX2WR */
+					0x00000002 /* EMC_PDEX2RD */
+					0x00000001 /* EMC_PCHG2PDEN */
+					0x00000000 /* EMC_ACT2PDEN */
+					0x00000032 /* EMC_AR2PDEN */
+					0x0000000f /* EMC_RW2PDEN */
+					0x00000038 /* EMC_TXSR */
+					0x00000038 /* EMC_TXSRDLL */
+					0x00000004 /* EMC_TCKE */
+					0x00000005 /* EMC_TCKESR */
+					0x00000004 /* EMC_TPD */
+					0x00000007 /* EMC_TFAW */
+					0x00000000 /* EMC_TRPAB */
+					0x00000005 /* EMC_TCLKSTABLE */
+					0x00000005 /* EMC_TCLKSTOP */
+					0x00000638 /* EMC_TREFBW */
+					0x00000000 /* EMC_FBIO_CFG6 */
+					0x00000000 /* EMC_ODT_WRITE */
+					0x00000000 /* EMC_ODT_READ */
+					0x106aa298 /* EMC_FBIO_CFG5 */
+					0x002c00a0 /* EMC_CFG_DIG_DLL */
+					0x00008000 /* EMC_CFG_DIG_DLL_PERIOD */
+					0x00064000 /* EMC_DLL_XFORM_DQS0 */
+					0x00064000 /* EMC_DLL_XFORM_DQS1 */
+					0x00064000 /* EMC_DLL_XFORM_DQS2 */
+					0x00064000 /* EMC_DLL_XFORM_DQS3 */
+					0x00064000 /* EMC_DLL_XFORM_DQS4 */
+					0x00064000 /* EMC_DLL_XFORM_DQS5 */
+					0x00064000 /* EMC_DLL_XFORM_DQS6 */
+					0x00064000 /* EMC_DLL_XFORM_DQS7 */
+					0x00064000 /* EMC_DLL_XFORM_DQS8 */
+					0x00064000 /* EMC_DLL_XFORM_DQS9 */
+					0x00064000 /* EMC_DLL_XFORM_DQS10 */
+					0x00064000 /* EMC_DLL_XFORM_DQS11 */
+					0x00064000 /* EMC_DLL_XFORM_DQS12 */
+					0x00064000 /* EMC_DLL_XFORM_DQS13 */
+					0x00064000 /* EMC_DLL_XFORM_DQS14 */
+					0x00064000 /* EMC_DLL_XFORM_DQS15 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE0 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE1 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE2 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE3 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE4 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE6 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE7 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR0 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR1 */
+					0x00004000 /* EMC_DLL_XFORM_ADDR2 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR3 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR4 */
+					0x00004000 /* EMC_DLL_XFORM_ADDR5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE8 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE9 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE10 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE11 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE12 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE13 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE14 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE15 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS0 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS1 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS2 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS3 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS4 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS5 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS6 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS7 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS8 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS9 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS10 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS11 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS12 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS13 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS14 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS15 */
+					0x00090000 /* EMC_DLL_XFORM_DQ0 */
+					0x00090000 /* EMC_DLL_XFORM_DQ1 */
+					0x00094000 /* EMC_DLL_XFORM_DQ2 */
+					0x00094000 /* EMC_DLL_XFORM_DQ3 */
+					0x00009400 /* EMC_DLL_XFORM_DQ4 */
+					0x00009000 /* EMC_DLL_XFORM_DQ5 */
+					0x00009000 /* EMC_DLL_XFORM_DQ6 */
+					0x00009000 /* EMC_DLL_XFORM_DQ7 */
+					0x10000280 /* EMC_XM2CMDPADCTRL */
+					0x00000000 /* EMC_XM2CMDPADCTRL4 */
+					0x00111111 /* EMC_XM2CMDPADCTRL5 */
+					0x00000000 /* EMC_XM2DQPADCTRL2 */
+					0x00000000 /* EMC_XM2DQPADCTRL3 */
+					0x77ffc081 /* EMC_XM2CLKPADCTRL */
+					0x00000303 /* EMC_XM2CLKPADCTRL2 */
+					0x81f1f108 /* EMC_XM2COMPPADCTRL */
+					0x07070004 /* EMC_XM2VTTGENPADCTRL */
+					0x0000003f /* EMC_XM2VTTGENPADCTRL2 */
+					0x016eeeee /* EMC_XM2VTTGENPADCTRL3 */
+					0x51451400 /* EMC_XM2DQSPADCTRL3 */
+					0x00514514 /* EMC_XM2DQSPADCTRL4 */
+					0x00514514 /* EMC_XM2DQSPADCTRL5 */
+					0x51451400 /* EMC_XM2DQSPADCTRL6 */
+					0x0000003f /* EMC_DSR_VTTGEN_DRV */
+					0x00000066 /* EMC_TXDSRVTTGEN */
+					0x00000000 /* EMC_FBIO_SPARE */
+					0x00000100 /* EMC_ZCAL_WAIT_CNT */
+					0x000c000c /* EMC_MRS_WAIT_CNT2 */
+					0x00000000 /* EMC_CTT */
+					0x00000003 /* EMC_CTT_DURATION */
+					0x0000d2b3 /* EMC_CFG_PIPE */
+					0x80000d22 /* EMC_DYN_SELF_REF_CONTROL */
+					0x0000000a /* EMC_QPOP */
+				>;
+			};
+
+			timing-300000000 {
+				clock-frequency = <300000000>;
+
+				nvidia,emc-auto-cal-config = <0xa1430000>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-bgbias-ctl0 = <0x00000000>;
+				nvidia,emc-cfg = <0x73340000>;
+				nvidia,emc-cfg-2 = <0x000008d5>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mode-1 = <0x80100002>;
+				nvidia,emc-mode-2 = <0x80200000>;
+				nvidia,emc-mode-4 = <0x00000000>;
+				nvidia,emc-mode-reset = <0x80000321>;
+				nvidia,emc-mrs-wait-cnt = <0x0174000c>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040128>;
+				nvidia,emc-xm2dqspadctrl2 = <0x01231339>;
+				nvidia,emc-zcal-cnt-long = <0x00000042>;
+				nvidia,emc-zcal-interval = <0x00020000>;
+
+				nvidia,emc-configuration = <
+					0x0000000d /* EMC_RC */
+					0x0000004c /* EMC_RFC */
+					0x00000000 /* EMC_RFC_SLR */
+					0x00000009 /* EMC_RAS */
+					0x00000003 /* EMC_RP */
+					0x00000004 /* EMC_R2W */
+					0x00000008 /* EMC_W2R */
+					0x00000002 /* EMC_R2P */
+					0x00000009 /* EMC_W2P */
+					0x00000003 /* EMC_RD_RCD */
+					0x00000003 /* EMC_WR_RCD */
+					0x00000002 /* EMC_RRD */
+					0x00000002 /* EMC_REXT */
+					0x00000000 /* EMC_WEXT */
+					0x00000003 /* EMC_WDV */
+					0x00000003 /* EMC_WDV_MASK */
+					0x00000005 /* EMC_QUSE */
+					0x00000002 /* EMC_QUSE_WIDTH */
+					0x00000000 /* EMC_IBDLY */
+					0x00000002 /* EMC_EINPUT */
+					0x00000007 /* EMC_EINPUT_DURATION */
+					0x00020000 /* EMC_PUTERM_EXTRA */
+					0x00000003 /* EMC_PUTERM_WIDTH */
+					0x00000000 /* EMC_PUTERM_ADJ */
+					0x00000000 /* EMC_CDB_CNTL_1 */
+					0x00000000 /* EMC_CDB_CNTL_2 */
+					0x00000000 /* EMC_CDB_CNTL_3 */
+					0x00000001 /* EMC_QRST */
+					0x0000000e /* EMC_QSAFE */
+					0x00000010 /* EMC_RDV */
+					0x00000012 /* EMC_RDV_MASK */
+					0x000008e4 /* EMC_REFRESH */
+					0x00000000 /* EMC_BURST_REFRESH_NUM */
+					0x00000239 /* EMC_PRE_REFRESH_REQ_CNT */
+					0x00000001 /* EMC_PDEX2WR */
+					0x00000008 /* EMC_PDEX2RD */
+					0x00000001 /* EMC_PCHG2PDEN */
+					0x00000000 /* EMC_ACT2PDEN */
+					0x0000004a /* EMC_AR2PDEN */
+					0x0000000e /* EMC_RW2PDEN */
+					0x00000051 /* EMC_TXSR */
+					0x00000200 /* EMC_TXSRDLL */
+					0x00000004 /* EMC_TCKE */
+					0x00000005 /* EMC_TCKESR */
+					0x00000004 /* EMC_TPD */
+					0x00000009 /* EMC_TFAW */
+					0x00000000 /* EMC_TRPAB */
+					0x00000005 /* EMC_TCLKSTABLE */
+					0x00000005 /* EMC_TCLKSTOP */
+					0x00000924 /* EMC_TREFBW */
+					0x00000000 /* EMC_FBIO_CFG6 */
+					0x00000000 /* EMC_ODT_WRITE */
+					0x00000000 /* EMC_ODT_READ */
+					0x104ab098 /* EMC_FBIO_CFG5 */
+					0x002c00a0 /* EMC_CFG_DIG_DLL */
+					0x00008000 /* EMC_CFG_DIG_DLL_PERIOD */
+					0x00030000 /* EMC_DLL_XFORM_DQS0 */
+					0x00030000 /* EMC_DLL_XFORM_DQS1 */
+					0x00030000 /* EMC_DLL_XFORM_DQS2 */
+					0x00030000 /* EMC_DLL_XFORM_DQS3 */
+					0x00030000 /* EMC_DLL_XFORM_DQS4 */
+					0x00030000 /* EMC_DLL_XFORM_DQS5 */
+					0x00030000 /* EMC_DLL_XFORM_DQS6 */
+					0x00030000 /* EMC_DLL_XFORM_DQS7 */
+					0x00030000 /* EMC_DLL_XFORM_DQS8 */
+					0x00030000 /* EMC_DLL_XFORM_DQS9 */
+					0x00030000 /* EMC_DLL_XFORM_DQS10 */
+					0x00030000 /* EMC_DLL_XFORM_DQS11 */
+					0x00030000 /* EMC_DLL_XFORM_DQS12 */
+					0x00030000 /* EMC_DLL_XFORM_DQS13 */
+					0x00030000 /* EMC_DLL_XFORM_DQS14 */
+					0x00030000 /* EMC_DLL_XFORM_DQS15 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE0 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE1 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE2 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE3 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE4 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE6 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE7 */
+					0x00098000 /* EMC_DLL_XFORM_ADDR0 */
+					0x00098000 /* EMC_DLL_XFORM_ADDR1 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR2 */
+					0x00098000 /* EMC_DLL_XFORM_ADDR3 */
+					0x00098000 /* EMC_DLL_XFORM_ADDR4 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE8 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE9 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE10 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE11 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE12 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE13 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE14 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE15 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS0 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS1 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS2 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS3 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS4 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS5 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS6 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS7 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS8 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS9 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS10 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS11 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS12 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS13 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS14 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS15 */
+					0x00060000 /* EMC_DLL_XFORM_DQ0 */
+					0x00060000 /* EMC_DLL_XFORM_DQ1 */
+					0x00060000 /* EMC_DLL_XFORM_DQ2 */
+					0x00060000 /* EMC_DLL_XFORM_DQ3 */
+					0x00006000 /* EMC_DLL_XFORM_DQ4 */
+					0x00006000 /* EMC_DLL_XFORM_DQ5 */
+					0x00006000 /* EMC_DLL_XFORM_DQ6 */
+					0x00006000 /* EMC_DLL_XFORM_DQ7 */
+					0x10000280 /* EMC_XM2CMDPADCTRL */
+					0x00000000 /* EMC_XM2CMDPADCTRL4 */
+					0x00111111 /* EMC_XM2CMDPADCTRL5 */
+					0x00000000 /* EMC_XM2DQPADCTRL2 */
+					0x00000000 /* EMC_XM2DQPADCTRL3 */
+					0x77ffc081 /* EMC_XM2CLKPADCTRL */
+					0x00000101 /* EMC_XM2CLKPADCTRL2 */
+					0x81f1f108 /* EMC_XM2COMPPADCTRL */
+					0x07070004 /* EMC_XM2VTTGENPADCTRL */
+					0x00000000 /* EMC_XM2VTTGENPADCTRL2 */
+					0x016eeeee /* EMC_XM2VTTGENPADCTRL3 */
+					0x51451420 /* EMC_XM2DQSPADCTRL3 */
+					0x00514514 /* EMC_XM2DQSPADCTRL4 */
+					0x00514514 /* EMC_XM2DQSPADCTRL5 */
+					0x51451400 /* EMC_XM2DQSPADCTRL6 */
+					0x0000003f /* EMC_DSR_VTTGEN_DRV */
+					0x00000096 /* EMC_TXDSRVTTGEN */
+					0x00000000 /* EMC_FBIO_SPARE */
+					0x00000100 /* EMC_ZCAL_WAIT_CNT */
+					0x0174000c /* EMC_MRS_WAIT_CNT2 */
+					0x00000000 /* EMC_CTT */
+					0x00000003 /* EMC_CTT_DURATION */
+					0x000052a3 /* EMC_CFG_PIPE */
+					0x800012d7 /* EMC_DYN_SELF_REF_CONTROL */
+					0x00000009 /* EMC_QPOP */
+				>;
+			};
+
+			timing-396000000 {
+				clock-frequency = <396000000>;
+
+				nvidia,emc-auto-cal-config = <0xa1430000>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-bgbias-ctl0 = <0x00000000>;
+				nvidia,emc-cfg = <0x73340000>;
+				nvidia,emc-cfg-2 = <0x00000895>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mode-1 = <0x80100002>;
+				nvidia,emc-mode-2 = <0x80200000>;
+				nvidia,emc-mode-4 = <0x00000000>;
+				nvidia,emc-mode-reset = <0x80000521>;
+				nvidia,emc-mrs-wait-cnt = <0x015b000c>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040008>;
+				nvidia,emc-xm2dqspadctrl2 = <0x01231339>;
+				nvidia,emc-zcal-cnt-long = <0x00000042>;
+				nvidia,emc-zcal-interval = <0x00020000>;
+
+				nvidia,emc-configuration = <
+					0x00000012 /* EMC_RC */
+					0x00000065 /* EMC_RFC */
+					0x00000000 /* EMC_RFC_SLR */
+					0x0000000c /* EMC_RAS */
+					0x00000004 /* EMC_RP */
+					0x00000005 /* EMC_R2W */
+					0x00000008 /* EMC_W2R */
+					0x00000002 /* EMC_R2P */
+					0x0000000a /* EMC_W2P */
+					0x00000004 /* EMC_RD_RCD */
+					0x00000004 /* EMC_WR_RCD */
+					0x00000002 /* EMC_RRD */
+					0x00000002 /* EMC_REXT */
+					0x00000000 /* EMC_WEXT */
+					0x00000003 /* EMC_WDV */
+					0x00000003 /* EMC_WDV_MASK */
+					0x00000005 /* EMC_QUSE */
+					0x00000002 /* EMC_QUSE_WIDTH */
+					0x00000000 /* EMC_IBDLY */
+					0x00000001 /* EMC_EINPUT */
+					0x00000008 /* EMC_EINPUT_DURATION */
+					0x00020000 /* EMC_PUTERM_EXTRA */
+					0x00000003 /* EMC_PUTERM_WIDTH */
+					0x00000000 /* EMC_PUTERM_ADJ */
+					0x00000000 /* EMC_CDB_CNTL_1 */
+					0x00000000 /* EMC_CDB_CNTL_2 */
+					0x00000000 /* EMC_CDB_CNTL_3 */
+					0x00000000 /* EMC_QRST */
+					0x0000000f /* EMC_QSAFE */
+					0x00000010 /* EMC_RDV */
+					0x00000012 /* EMC_RDV_MASK */
+					0x00000bd1 /* EMC_REFRESH */
+					0x00000000 /* EMC_BURST_REFRESH_NUM */
+					0x000002f4 /* EMC_PRE_REFRESH_REQ_CNT */
+					0x00000001 /* EMC_PDEX2WR */
+					0x00000008 /* EMC_PDEX2RD */
+					0x00000001 /* EMC_PCHG2PDEN */
+					0x00000000 /* EMC_ACT2PDEN */
+					0x00000063 /* EMC_AR2PDEN */
+					0x0000000f /* EMC_RW2PDEN */
+					0x0000006b /* EMC_TXSR */
+					0x00000200 /* EMC_TXSRDLL */
+					0x00000004 /* EMC_TCKE */
+					0x00000005 /* EMC_TCKESR */
+					0x00000004 /* EMC_TPD */
+					0x0000000d /* EMC_TFAW */
+					0x00000000 /* EMC_TRPAB */
+					0x00000005 /* EMC_TCLKSTABLE */
+					0x00000005 /* EMC_TCLKSTOP */
+					0x00000c11 /* EMC_TREFBW */
+					0x00000000 /* EMC_FBIO_CFG6 */
+					0x00000000 /* EMC_ODT_WRITE */
+					0x00000000 /* EMC_ODT_READ */
+					0x104ab098 /* EMC_FBIO_CFG5 */
+					0x002c00a0 /* EMC_CFG_DIG_DLL */
+					0x00008000 /* EMC_CFG_DIG_DLL_PERIOD */
+					0x00030000 /* EMC_DLL_XFORM_DQS0 */
+					0x00030000 /* EMC_DLL_XFORM_DQS1 */
+					0x00030000 /* EMC_DLL_XFORM_DQS2 */
+					0x00030000 /* EMC_DLL_XFORM_DQS3 */
+					0x00030000 /* EMC_DLL_XFORM_DQS4 */
+					0x00030000 /* EMC_DLL_XFORM_DQS5 */
+					0x00030000 /* EMC_DLL_XFORM_DQS6 */
+					0x00030000 /* EMC_DLL_XFORM_DQS7 */
+					0x00030000 /* EMC_DLL_XFORM_DQS8 */
+					0x00030000 /* EMC_DLL_XFORM_DQS9 */
+					0x00030000 /* EMC_DLL_XFORM_DQS10 */
+					0x00030000 /* EMC_DLL_XFORM_DQS11 */
+					0x00030000 /* EMC_DLL_XFORM_DQS12 */
+					0x00030000 /* EMC_DLL_XFORM_DQS13 */
+					0x00030000 /* EMC_DLL_XFORM_DQS14 */
+					0x00030000 /* EMC_DLL_XFORM_DQS15 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE0 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE1 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE2 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE3 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE4 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE6 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE7 */
+					0x00070000 /* EMC_DLL_XFORM_ADDR0 */
+					0x00070000 /* EMC_DLL_XFORM_ADDR1 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR2 */
+					0x00070000 /* EMC_DLL_XFORM_ADDR3 */
+					0x00070000 /* EMC_DLL_XFORM_ADDR4 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE8 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE9 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE10 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE11 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE12 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE13 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE14 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE15 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS0 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS1 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS2 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS3 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS4 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS5 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS6 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS7 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS8 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS9 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS10 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS11 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS12 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS13 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS14 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS15 */
+					0x00048000 /* EMC_DLL_XFORM_DQ0 */
+					0x00048000 /* EMC_DLL_XFORM_DQ1 */
+					0x00048000 /* EMC_DLL_XFORM_DQ2 */
+					0x00048000 /* EMC_DLL_XFORM_DQ3 */
+					0x00004800 /* EMC_DLL_XFORM_DQ4 */
+					0x00004800 /* EMC_DLL_XFORM_DQ5 */
+					0x00004800 /* EMC_DLL_XFORM_DQ6 */
+					0x00004800 /* EMC_DLL_XFORM_DQ7 */
+					0x10000280 /* EMC_XM2CMDPADCTRL */
+					0x00000000 /* EMC_XM2CMDPADCTRL4 */
+					0x00111111 /* EMC_XM2CMDPADCTRL5 */
+					0x00000000 /* EMC_XM2DQPADCTRL2 */
+					0x00000000 /* EMC_XM2DQPADCTRL3 */
+					0x77ffc081 /* EMC_XM2CLKPADCTRL */
+					0x00000101 /* EMC_XM2CLKPADCTRL2 */
+					0x81f1f108 /* EMC_XM2COMPPADCTRL */
+					0x07070004 /* EMC_XM2VTTGENPADCTRL */
+					0x00000000 /* EMC_XM2VTTGENPADCTRL2 */
+					0x016eeeee /* EMC_XM2VTTGENPADCTRL3 */
+					0x51451420 /* EMC_XM2DQSPADCTRL3 */
+					0x00514514 /* EMC_XM2DQSPADCTRL4 */
+					0x00514514 /* EMC_XM2DQSPADCTRL5 */
+					0x51451400 /* EMC_XM2DQSPADCTRL6 */
+					0x0000003f /* EMC_DSR_VTTGEN_DRV */
+					0x000000c6 /* EMC_TXDSRVTTGEN */
+					0x00000000 /* EMC_FBIO_SPARE */
+					0x00000100 /* EMC_ZCAL_WAIT_CNT */
+					0x015b000c /* EMC_MRS_WAIT_CNT2 */
+					0x00000000 /* EMC_CTT */
+					0x00000003 /* EMC_CTT_DURATION */
+					0x000052a3 /* EMC_CFG_PIPE */
+					0x8000188b /* EMC_DYN_SELF_REF_CONTROL */
+					0x00000009 /* EMC_QPOP */
+				>;
+			};
+
+			timing-528000000 {
+				clock-frequency = <528000000>;
+
+				nvidia,emc-auto-cal-config = <0xa1430000>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-bgbias-ctl0 = <0x00000000>;
+				nvidia,emc-cfg = <0x73300000>;
+				nvidia,emc-cfg-2 = <0x0000089d>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mode-1 = <0x80100002>;
+				nvidia,emc-mode-2 = <0x80200008>;
+				nvidia,emc-mode-4 = <0x00000000>;
+				nvidia,emc-mode-reset = <0x80000941>;
+				nvidia,emc-mrs-wait-cnt = <0x013a000c>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040008>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0123133d>;
+				nvidia,emc-zcal-cnt-long = <0x00000042>;
+				nvidia,emc-zcal-interval = <0x00020000>;
+
+				nvidia,emc-configuration = <
+					0x00000018 /* EMC_RC */
+					0x00000088 /* EMC_RFC */
+					0x00000000 /* EMC_RFC_SLR */
+					0x00000011 /* EMC_RAS */
+					0x00000006 /* EMC_RP */
+					0x00000006 /* EMC_R2W */
+					0x00000009 /* EMC_W2R */
+					0x00000002 /* EMC_R2P */
+					0x0000000d /* EMC_W2P */
+					0x00000006 /* EMC_RD_RCD */
+					0x00000006 /* EMC_WR_RCD */
+					0x00000002 /* EMC_RRD */
+					0x00000002 /* EMC_REXT */
+					0x00000000 /* EMC_WEXT */
+					0x00000003 /* EMC_WDV */
+					0x00000003 /* EMC_WDV_MASK */
+					0x00000007 /* EMC_QUSE */
+					0x00000002 /* EMC_QUSE_WIDTH */
+					0x00000000 /* EMC_IBDLY */
+					0x00000002 /* EMC_EINPUT */
+					0x00000009 /* EMC_EINPUT_DURATION */
+					0x00040000 /* EMC_PUTERM_EXTRA */
+					0x00000003 /* EMC_PUTERM_WIDTH */
+					0x00000000 /* EMC_PUTERM_ADJ */
+					0x00000000 /* EMC_CDB_CNTL_1 */
+					0x00000000 /* EMC_CDB_CNTL_2 */
+					0x00000000 /* EMC_CDB_CNTL_3 */
+					0x00000001 /* EMC_QRST */
+					0x00000010 /* EMC_QSAFE */
+					0x00000013 /* EMC_RDV */
+					0x00000015 /* EMC_RDV_MASK */
+					0x00000fd6 /* EMC_REFRESH */
+					0x00000000 /* EMC_BURST_REFRESH_NUM */
+					0x000003f5 /* EMC_PRE_REFRESH_REQ_CNT */
+					0x00000002 /* EMC_PDEX2WR */
+					0x0000000b /* EMC_PDEX2RD */
+					0x00000001 /* EMC_PCHG2PDEN */
+					0x00000000 /* EMC_ACT2PDEN */
+					0x00000084 /* EMC_AR2PDEN */
+					0x00000012 /* EMC_RW2PDEN */
+					0x0000008f /* EMC_TXSR */
+					0x00000200 /* EMC_TXSRDLL */
+					0x00000004 /* EMC_TCKE */
+					0x00000005 /* EMC_TCKESR */
+					0x00000004 /* EMC_TPD */
+					0x00000013 /* EMC_TFAW */
+					0x00000000 /* EMC_TRPAB */
+					0x00000006 /* EMC_TCLKSTABLE */
+					0x00000006 /* EMC_TCLKSTOP */
+					0x00001017 /* EMC_TREFBW */
+					0x00000000 /* EMC_FBIO_CFG6 */
+					0x00000000 /* EMC_ODT_WRITE */
+					0x00000000 /* EMC_ODT_READ */
+					0x104ab098 /* EMC_FBIO_CFG5 */
+					0xe01200b1 /* EMC_CFG_DIG_DLL */
+					0x00008000 /* EMC_CFG_DIG_DLL_PERIOD */
+					0x0000000a /* EMC_DLL_XFORM_DQS0 */
+					0x0000000a /* EMC_DLL_XFORM_DQS1 */
+					0x0000000a /* EMC_DLL_XFORM_DQS2 */
+					0x0000000a /* EMC_DLL_XFORM_DQS3 */
+					0x0000000a /* EMC_DLL_XFORM_DQS4 */
+					0x0000000a /* EMC_DLL_XFORM_DQS5 */
+					0x0000000a /* EMC_DLL_XFORM_DQS6 */
+					0x0000000a /* EMC_DLL_XFORM_DQS7 */
+					0x0000000a /* EMC_DLL_XFORM_DQS8 */
+					0x0000000a /* EMC_DLL_XFORM_DQS9 */
+					0x0000000a /* EMC_DLL_XFORM_DQS10 */
+					0x0000000a /* EMC_DLL_XFORM_DQS11 */
+					0x0000000a /* EMC_DLL_XFORM_DQS12 */
+					0x0000000a /* EMC_DLL_XFORM_DQS13 */
+					0x0000000a /* EMC_DLL_XFORM_DQS14 */
+					0x0000000a /* EMC_DLL_XFORM_DQS15 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE0 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE1 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE2 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE3 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE4 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE6 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE7 */
+					0x00050000 /* EMC_DLL_XFORM_ADDR0 */
+					0x00050000 /* EMC_DLL_XFORM_ADDR1 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR2 */
+					0x00050000 /* EMC_DLL_XFORM_ADDR3 */
+					0x00050000 /* EMC_DLL_XFORM_ADDR4 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE8 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE9 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE10 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE11 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE12 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE13 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE14 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE15 */
+					0x00000002 /* EMC_DLI_TRIM_TXDQS0 */
+					0x00000002 /* EMC_DLI_TRIM_TXDQS1 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS2 */
+					0x00000003 /* EMC_DLI_TRIM_TXDQS3 */
+					0x00000004 /* EMC_DLI_TRIM_TXDQS4 */
+					0x00000001 /* EMC_DLI_TRIM_TXDQS5 */
+					0x00000004 /* EMC_DLI_TRIM_TXDQS6 */
+					0x00000003 /* EMC_DLI_TRIM_TXDQS7 */
+					0x00000002 /* EMC_DLI_TRIM_TXDQS8 */
+					0x00000002 /* EMC_DLI_TRIM_TXDQS9 */
+					0x00000000 /* EMC_DLI_TRIM_TXDQS10 */
+					0x00000003 /* EMC_DLI_TRIM_TXDQS11 */
+					0x00000004 /* EMC_DLI_TRIM_TXDQS12 */
+					0x00000001 /* EMC_DLI_TRIM_TXDQS13 */
+					0x00000004 /* EMC_DLI_TRIM_TXDQS14 */
+					0x00000003 /* EMC_DLI_TRIM_TXDQS15 */
+					0x0000000e /* EMC_DLL_XFORM_DQ0 */
+					0x0000000e /* EMC_DLL_XFORM_DQ1 */
+					0x0000000e /* EMC_DLL_XFORM_DQ2 */
+					0x0000000e /* EMC_DLL_XFORM_DQ3 */
+					0x0000000e /* EMC_DLL_XFORM_DQ4 */
+					0x0000000e /* EMC_DLL_XFORM_DQ5 */
+					0x0000000e /* EMC_DLL_XFORM_DQ6 */
+					0x0000000e /* EMC_DLL_XFORM_DQ7 */
+					0x100002a0 /* EMC_XM2CMDPADCTRL */
+					0x00000000 /* EMC_XM2CMDPADCTRL4 */
+					0x00111111 /* EMC_XM2CMDPADCTRL5 */
+					0x00000000 /* EMC_XM2DQPADCTRL2 */
+					0x00000000 /* EMC_XM2DQPADCTRL3 */
+					0x77ffc085 /* EMC_XM2CLKPADCTRL */
+					0x00000101 /* EMC_XM2CLKPADCTRL2 */
+					0x81f1f108 /* EMC_XM2COMPPADCTRL */
+					0x07070004 /* EMC_XM2VTTGENPADCTRL */
+					0x00000000 /* EMC_XM2VTTGENPADCTRL2 */
+					0x016eeeee /* EMC_XM2VTTGENPADCTRL3 */
+					0x51451420 /* EMC_XM2DQSPADCTRL3 */
+					0x00514514 /* EMC_XM2DQSPADCTRL4 */
+					0x00514514 /* EMC_XM2DQSPADCTRL5 */
+					0x51451400 /* EMC_XM2DQSPADCTRL6 */
+					0x0606003f /* EMC_DSR_VTTGEN_DRV */
+					0x00000000 /* EMC_TXDSRVTTGEN */
+					0x00000000 /* EMC_FBIO_SPARE */
+					0x00000100 /* EMC_ZCAL_WAIT_CNT */
+					0x013a000c /* EMC_MRS_WAIT_CNT2 */
+					0x00000000 /* EMC_CTT */
+					0x00000003 /* EMC_CTT_DURATION */
+					0x000042a0 /* EMC_CFG_PIPE */
+					0x80002062 /* EMC_DYN_SELF_REF_CONTROL */
+					0x0000000b /* EMC_QPOP */
+				>;
+			};
+
+			timing-600000000 {
+				clock-frequency = <600000000>;
+
+				nvidia,emc-auto-cal-config = <0xa1430000>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-bgbias-ctl0 = <0x00000000>;
+				nvidia,emc-cfg = <0x73300000>;
+				nvidia,emc-cfg-2 = <0x0000089d>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mode-1 = <0x80100002>;
+				nvidia,emc-mode-2 = <0x80200010>;
+				nvidia,emc-mode-4 = <0x00000000>;
+				nvidia,emc-mode-reset = <0x80000b61>;
+				nvidia,emc-mrs-wait-cnt = <0x0128000c>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040008>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0121113d>;
+				nvidia,emc-zcal-cnt-long = <0x00000042>;
+				nvidia,emc-zcal-interval = <0x00020000>;
+
+				nvidia,emc-configuration = <
+					0x0000001c /* EMC_RC */
+					0x0000009a /* EMC_RFC */
+					0x00000000 /* EMC_RFC_SLR */
+					0x00000013 /* EMC_RAS */
+					0x00000007 /* EMC_RP */
+					0x00000007 /* EMC_R2W */
+					0x0000000b /* EMC_W2R */
+					0x00000003 /* EMC_R2P */
+					0x00000010 /* EMC_W2P */
+					0x00000007 /* EMC_RD_RCD */
+					0x00000007 /* EMC_WR_RCD */
+					0x00000003 /* EMC_RRD */
+					0x00000002 /* EMC_REXT */
+					0x00000000 /* EMC_WEXT */
+					0x00000005 /* EMC_WDV */
+					0x00000005 /* EMC_WDV_MASK */
+					0x0000000a /* EMC_QUSE */
+					0x00000002 /* EMC_QUSE_WIDTH */
+					0x00000000 /* EMC_IBDLY */
+					0x00000003 /* EMC_EINPUT */
+					0x0000000b /* EMC_EINPUT_DURATION */
+					0x00070000 /* EMC_PUTERM_EXTRA */
+					0x00000003 /* EMC_PUTERM_WIDTH */
+					0x00000000 /* EMC_PUTERM_ADJ */
+					0x00000000 /* EMC_CDB_CNTL_1 */
+					0x00000000 /* EMC_CDB_CNTL_2 */
+					0x00000000 /* EMC_CDB_CNTL_3 */
+					0x00000002 /* EMC_QRST */
+					0x00000012 /* EMC_QSAFE */
+					0x00000016 /* EMC_RDV */
+					0x00000018 /* EMC_RDV_MASK */
+					0x00001208 /* EMC_REFRESH */
+					0x00000000 /* EMC_BURST_REFRESH_NUM */
+					0x00000482 /* EMC_PRE_REFRESH_REQ_CNT */
+					0x00000002 /* EMC_PDEX2WR */
+					0x0000000d /* EMC_PDEX2RD */
+					0x00000001 /* EMC_PCHG2PDEN */
+					0x00000000 /* EMC_ACT2PDEN */
+					0x00000096 /* EMC_AR2PDEN */
+					0x00000015 /* EMC_RW2PDEN */
+					0x000000a2 /* EMC_TXSR */
+					0x00000200 /* EMC_TXSRDLL */
+					0x00000004 /* EMC_TCKE */
+					0x00000005 /* EMC_TCKESR */
+					0x00000004 /* EMC_TPD */
+					0x00000015 /* EMC_TFAW */
+					0x00000000 /* EMC_TRPAB */
+					0x00000006 /* EMC_TCLKSTABLE */
+					0x00000006 /* EMC_TCLKSTOP */
+					0x00001249 /* EMC_TREFBW */
+					0x00000000 /* EMC_FBIO_CFG6 */
+					0x00000000 /* EMC_ODT_WRITE */
+					0x00000000 /* EMC_ODT_READ */
+					0x104ab098 /* EMC_FBIO_CFG5 */
+					0xe00e00b1 /* EMC_CFG_DIG_DLL */
+					0x00008000 /* EMC_CFG_DIG_DLL_PERIOD */
+					0x0000000a /* EMC_DLL_XFORM_DQS0 */
+					0x0000000a /* EMC_DLL_XFORM_DQS1 */
+					0x0000000a /* EMC_DLL_XFORM_DQS2 */
+					0x0000000a /* EMC_DLL_XFORM_DQS3 */
+					0x0000000a /* EMC_DLL_XFORM_DQS4 */
+					0x0000000a /* EMC_DLL_XFORM_DQS5 */
+					0x0000000a /* EMC_DLL_XFORM_DQS6 */
+					0x0000000a /* EMC_DLL_XFORM_DQS7 */
+					0x0000000a /* EMC_DLL_XFORM_DQS8 */
+					0x0000000a /* EMC_DLL_XFORM_DQS9 */
+					0x0000000a /* EMC_DLL_XFORM_DQS10 */
+					0x0000000a /* EMC_DLL_XFORM_DQS11 */
+					0x0000000a /* EMC_DLL_XFORM_DQS12 */
+					0x0000000a /* EMC_DLL_XFORM_DQS13 */
+					0x0000000a /* EMC_DLL_XFORM_DQS14 */
+					0x0000000a /* EMC_DLL_XFORM_DQS15 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE0 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE1 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE2 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE3 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE4 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE6 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE7 */
+					0x00048000 /* EMC_DLL_XFORM_ADDR0 */
+					0x00048000 /* EMC_DLL_XFORM_ADDR1 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR2 */
+					0x00048000 /* EMC_DLL_XFORM_ADDR3 */
+					0x00048000 /* EMC_DLL_XFORM_ADDR4 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE8 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE9 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE10 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE11 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE12 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE13 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE14 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE15 */
+					0x00000004 /* EMC_DLI_TRIM_TXDQS0 */
+					0x00000004 /* EMC_DLI_TRIM_TXDQS1 */
+					0x00000002 /* EMC_DLI_TRIM_TXDQS2 */
+					0x00000005 /* EMC_DLI_TRIM_TXDQS3 */
+					0x00000006 /* EMC_DLI_TRIM_TXDQS4 */
+					0x00000003 /* EMC_DLI_TRIM_TXDQS5 */
+					0x00000006 /* EMC_DLI_TRIM_TXDQS6 */
+					0x00000005 /* EMC_DLI_TRIM_TXDQS7 */
+					0x00000004 /* EMC_DLI_TRIM_TXDQS8 */
+					0x00000004 /* EMC_DLI_TRIM_TXDQS9 */
+					0x00000002 /* EMC_DLI_TRIM_TXDQS10 */
+					0x00000005 /* EMC_DLI_TRIM_TXDQS11 */
+					0x00000006 /* EMC_DLI_TRIM_TXDQS12 */
+					0x00000003 /* EMC_DLI_TRIM_TXDQS13 */
+					0x00000006 /* EMC_DLI_TRIM_TXDQS14 */
+					0x00000005 /* EMC_DLI_TRIM_TXDQS15 */
+					0x0000000e /* EMC_DLL_XFORM_DQ0 */
+					0x0000000e /* EMC_DLL_XFORM_DQ1 */
+					0x0000000e /* EMC_DLL_XFORM_DQ2 */
+					0x0000000e /* EMC_DLL_XFORM_DQ3 */
+					0x0000000e /* EMC_DLL_XFORM_DQ4 */
+					0x0000000e /* EMC_DLL_XFORM_DQ5 */
+					0x0000000e /* EMC_DLL_XFORM_DQ6 */
+					0x0000000e /* EMC_DLL_XFORM_DQ7 */
+					0x100002a0 /* EMC_XM2CMDPADCTRL */
+					0x00000000 /* EMC_XM2CMDPADCTRL4 */
+					0x00111111 /* EMC_XM2CMDPADCTRL5 */
+					0x00000000 /* EMC_XM2DQPADCTRL2 */
+					0x00000000 /* EMC_XM2DQPADCTRL3 */
+					0x77ffc085 /* EMC_XM2CLKPADCTRL */
+					0x00000101 /* EMC_XM2CLKPADCTRL2 */
+					0x81f1f108 /* EMC_XM2COMPPADCTRL */
+					0x07070004 /* EMC_XM2VTTGENPADCTRL */
+					0x00000000 /* EMC_XM2VTTGENPADCTRL2 */
+					0x016eeeee /* EMC_XM2VTTGENPADCTRL3 */
+					0x51451420 /* EMC_XM2DQSPADCTRL3 */
+					0x00514514 /* EMC_XM2DQSPADCTRL4 */
+					0x00514514 /* EMC_XM2DQSPADCTRL5 */
+					0x51451400 /* EMC_XM2DQSPADCTRL6 */
+					0x0606003f /* EMC_DSR_VTTGEN_DRV */
+					0x00000000 /* EMC_TXDSRVTTGEN */
+					0x00000000 /* EMC_FBIO_SPARE */
+					0x00000100 /* EMC_ZCAL_WAIT_CNT */
+					0x0128000c /* EMC_MRS_WAIT_CNT2 */
+					0x00000000 /* EMC_CTT */
+					0x00000003 /* EMC_CTT_DURATION */
+					0x000040a0 /* EMC_CFG_PIPE */
+					0x800024aa /* EMC_DYN_SELF_REF_CONTROL */
+					0x0000000e /* EMC_QPOP */
+				>;
+			};
+
+			timing-792000000 {
+				clock-frequency = <792000000>;
+
+				nvidia,emc-auto-cal-config = <0xa1430000>;
+				nvidia,emc-auto-cal-config2 = <0x00000000>;
+				nvidia,emc-auto-cal-config3 = <0x00000000>;
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-bgbias-ctl0 = <0x00000000>;
+				nvidia,emc-cfg = <0x73300000>;
+				nvidia,emc-cfg-2 = <0x0080089d>;
+				nvidia,emc-ctt-term-ctrl = <0x00000802>;
+				nvidia,emc-mode-1 = <0x80100002>;
+				nvidia,emc-mode-2 = <0x80200418>;
+				nvidia,emc-mode-4 = <0x00000000>;
+				nvidia,emc-mode-reset = <0x80000d71>;
+				nvidia,emc-mrs-wait-cnt = <0x00f8000c>;
+				nvidia,emc-sel-dpd-ctrl = <0x00040000>;
+				nvidia,emc-xm2dqspadctrl2 = <0x0120113d>;
+				nvidia,emc-zcal-cnt-long = <0x00000042>;
+				nvidia,emc-zcal-interval = <0x00020000>;
+
+				nvidia,emc-configuration = <
+					0x00000025 /* EMC_RC */
+					0x000000cc /* EMC_RFC */
+					0x00000000 /* EMC_RFC_SLR */
+					0x0000001a /* EMC_RAS */
+					0x00000009 /* EMC_RP */
+					0x00000008 /* EMC_R2W */
+					0x0000000d /* EMC_W2R */
+					0x00000004 /* EMC_R2P */
+					0x00000013 /* EMC_W2P */
+					0x00000009 /* EMC_RD_RCD */
+					0x00000009 /* EMC_WR_RCD */
+					0x00000004 /* EMC_RRD */
+					0x00000002 /* EMC_REXT */
+					0x00000000 /* EMC_WEXT */
+					0x00000006 /* EMC_WDV */
+					0x00000006 /* EMC_WDV_MASK */
+					0x0000000b /* EMC_QUSE */
+					0x00000002 /* EMC_QUSE_WIDTH */
+					0x00000000 /* EMC_IBDLY */
+					0x00000002 /* EMC_EINPUT */
+					0x0000000d /* EMC_EINPUT_DURATION */
+					0x00080000 /* EMC_PUTERM_EXTRA */
+					0x00000004 /* EMC_PUTERM_WIDTH */
+					0x00000000 /* EMC_PUTERM_ADJ */
+					0x00000000 /* EMC_CDB_CNTL_1 */
+					0x00000000 /* EMC_CDB_CNTL_2 */
+					0x00000000 /* EMC_CDB_CNTL_3 */
+					0x00000001 /* EMC_QRST */
+					0x00000014 /* EMC_QSAFE */
+					0x00000018 /* EMC_RDV */
+					0x0000001a /* EMC_RDV_MASK */
+					0x000017e2 /* EMC_REFRESH */
+					0x00000000 /* EMC_BURST_REFRESH_NUM */
+					0x000005f8 /* EMC_PRE_REFRESH_REQ_CNT */
+					0x00000003 /* EMC_PDEX2WR */
+					0x00000011 /* EMC_PDEX2RD */
+					0x00000001 /* EMC_PCHG2PDEN */
+					0x00000000 /* EMC_ACT2PDEN */
+					0x000000c6 /* EMC_AR2PDEN */
+					0x00000018 /* EMC_RW2PDEN */
+					0x000000d6 /* EMC_TXSR */
+					0x00000200 /* EMC_TXSRDLL */
+					0x00000005 /* EMC_TCKE */
+					0x00000006 /* EMC_TCKESR */
+					0x00000005 /* EMC_TPD */
+					0x0000001d /* EMC_TFAW */
+					0x00000000 /* EMC_TRPAB */
+					0x00000008 /* EMC_TCLKSTABLE */
+					0x00000008 /* EMC_TCLKSTOP */
+					0x00001822 /* EMC_TREFBW */
+					0x00000000 /* EMC_FBIO_CFG6 */
+					0x80000005 /* EMC_ODT_WRITE */
+					0x00000000 /* EMC_ODT_READ */
+					0x104ab198 /* EMC_FBIO_CFG5 */
+					0xe00700b1 /* EMC_CFG_DIG_DLL */
+					0x00008000 /* EMC_CFG_DIG_DLL_PERIOD */
+					0x00000009 /* EMC_DLL_XFORM_DQS0 */
+					0x00000009 /* EMC_DLL_XFORM_DQS1 */
+					0x00000009 /* EMC_DLL_XFORM_DQS2 */
+					0x00000007 /* EMC_DLL_XFORM_DQS3 */
+					0x00000006 /* EMC_DLL_XFORM_DQS4 */
+					0x00000006 /* EMC_DLL_XFORM_DQS5 */
+					0x007fc009 /* EMC_DLL_XFORM_DQS6 */
+					0x00000006 /* EMC_DLL_XFORM_DQS7 */
+					0x00000009 /* EMC_DLL_XFORM_DQS8 */
+					0x00000009 /* EMC_DLL_XFORM_DQS9 */
+					0x00000009 /* EMC_DLL_XFORM_DQS10 */
+					0x00000007 /* EMC_DLL_XFORM_DQS11 */
+					0x00000006 /* EMC_DLL_XFORM_DQS12 */
+					0x00000007 /* EMC_DLL_XFORM_DQS13 */
+					0x00000009 /* EMC_DLL_XFORM_DQS14 */
+					0x00000007 /* EMC_DLL_XFORM_DQS15 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE0 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE1 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE2 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE3 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE4 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE6 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE7 */
+					0x00034002 /* EMC_DLL_XFORM_ADDR0 */
+					0x00034002 /* EMC_DLL_XFORM_ADDR1 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR2 */
+					0x00034002 /* EMC_DLL_XFORM_ADDR3 */
+					0x00034002 /* EMC_DLL_XFORM_ADDR4 */
+					0x00000000 /* EMC_DLL_XFORM_ADDR5 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE8 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE9 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE10 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE11 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE12 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE13 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE14 */
+					0x00000000 /* EMC_DLL_XFORM_QUSE15 */
+					0x00000008 /* EMC_DLI_TRIM_TXDQS0 */
+					0x00000008 /* EMC_DLI_TRIM_TXDQS1 */
+					0x00000005 /* EMC_DLI_TRIM_TXDQS2 */
+					0x00000009 /* EMC_DLI_TRIM_TXDQS3 */
+					0x00000009 /* EMC_DLI_TRIM_TXDQS4 */
+					0x00000007 /* EMC_DLI_TRIM_TXDQS5 */
+					0x00000009 /* EMC_DLI_TRIM_TXDQS6 */
+					0x00000008 /* EMC_DLI_TRIM_TXDQS7 */
+					0x00000008 /* EMC_DLI_TRIM_TXDQS8 */
+					0x00000008 /* EMC_DLI_TRIM_TXDQS9 */
+					0x00000005 /* EMC_DLI_TRIM_TXDQS10 */
+					0x00000009 /* EMC_DLI_TRIM_TXDQS11 */
+					0x00000009 /* EMC_DLI_TRIM_TXDQS12 */
+					0x00000007 /* EMC_DLI_TRIM_TXDQS13 */
+					0x00000009 /* EMC_DLI_TRIM_TXDQS14 */
+					0x00000008 /* EMC_DLI_TRIM_TXDQS15 */
+					0x0000000e /* EMC_DLL_XFORM_DQ0 */
+					0x0000000e /* EMC_DLL_XFORM_DQ1 */
+					0x0000000e /* EMC_DLL_XFORM_DQ2 */
+					0x0000000e /* EMC_DLL_XFORM_DQ3 */
+					0x0000000e /* EMC_DLL_XFORM_DQ4 */
+					0x0000000e /* EMC_DLL_XFORM_DQ5 */
+					0x0000000e /* EMC_DLL_XFORM_DQ6 */
+					0x0000000e /* EMC_DLL_XFORM_DQ7 */
+					0x100002a0 /* EMC_XM2CMDPADCTRL */
+					0x00000000 /* EMC_XM2CMDPADCTRL4 */
+					0x00111111 /* EMC_XM2CMDPADCTRL5 */
+					0x00000000 /* EMC_XM2DQPADCTRL2 */
+					0x00000000 /* EMC_XM2DQPADCTRL3 */
+					0x77ffc085 /* EMC_XM2CLKPADCTRL */
+					0x00000101 /* EMC_XM2CLKPADCTRL2 */
+					0x81f1f108 /* EMC_XM2COMPPADCTRL */
+					0x07070004 /* EMC_XM2VTTGENPADCTRL */
+					0x00000000 /* EMC_XM2VTTGENPADCTRL2 */
+					0x016eeeee /* EMC_XM2VTTGENPADCTRL3 */
+					0x61861820 /* EMC_XM2DQSPADCTRL3 */
+					0x004d34d3 /* EMC_XM2DQSPADCTRL4 */
+					0x004d34d3 /* EMC_XM2DQSPADCTRL5 */
+					0x61861800 /* EMC_XM2DQSPADCTRL6 */
+					0x0606003f /* EMC_DSR_VTTGEN_DRV */
+					0x00000000 /* EMC_TXDSRVTTGEN */
+					0x00000000 /* EMC_FBIO_SPARE */
+					0x00000100 /* EMC_ZCAL_WAIT_CNT */
+					0x00f8000c /* EMC_MRS_WAIT_CNT2 */
+					0x00000007 /* EMC_CTT */
+					0x00000004 /* EMC_CTT_DURATION */
+					0x00004080 /* EMC_CFG_PIPE */
+					0x80003012 /* EMC_DYN_SELF_REF_CONTROL */
+					0x0000000f /* EMC_QPOP */
+				>;
+			};
+		};
+	};
+
+	memory-controller@70019000 {
+		emc-timings-1 {
+			nvidia,ram-code = <1>;
+
+			timing-12750000 {
+				clock-frequency = <12750000>;
+
+				nvidia,emem-configuration = <
+					0x40040001 /* MC_EMEM_ARB_CFG */
+					0x8000000a /* MC_EMEM_ARB_OUTSTANDING_REQ */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RP */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RC */
+					0x00000000 /* MC_EMEM_ARB_TIMING_RAS */
+					0x00000002 /* MC_EMEM_ARB_TIMING_FAW */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+					0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+					0x00000003 /* MC_EMEM_ARB_TIMING_R2R */
+					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
+					0x00000003 /* MC_EMEM_ARB_TIMING_R2W */
+					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+					0x06030203 /* MC_EMEM_ARB_DA_TURNS */
+					0x000a0402 /* MC_EMEM_ARB_DA_COVERS */
+					0x77e30303 /* MC_EMEM_ARB_MISC0 */
+					0x70000f03 /* MC_EMEM_ARB_MISC1 */
+					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+				>;
+			};
+
+			timing-20400000 {
+				clock-frequency = <20400000>;
+
+				nvidia,emem-configuration = <
+					0x40020001 /* MC_EMEM_ARB_CFG */
+					0x80000012 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RP */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RC */
+					0x00000000 /* MC_EMEM_ARB_TIMING_RAS */
+					0x00000002 /* MC_EMEM_ARB_TIMING_FAW */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+					0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+					0x00000003 /* MC_EMEM_ARB_TIMING_R2R */
+					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
+					0x00000003 /* MC_EMEM_ARB_TIMING_R2W */
+					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+					0x06030203 /* MC_EMEM_ARB_DA_TURNS */
+					0x000a0402 /* MC_EMEM_ARB_DA_COVERS */
+					0x76230303 /* MC_EMEM_ARB_MISC0 */
+					0x70000f03 /* MC_EMEM_ARB_MISC1 */
+					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+				>;
+			};
+
+			timing-40800000 {
+				clock-frequency = <40800000>;
+
+				nvidia,emem-configuration = <
+					0xa0000001 /* MC_EMEM_ARB_CFG */
+					0x80000017 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RP */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RC */
+					0x00000000 /* MC_EMEM_ARB_TIMING_RAS */
+					0x00000002 /* MC_EMEM_ARB_TIMING_FAW */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+					0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+					0x00000003 /* MC_EMEM_ARB_TIMING_R2R */
+					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
+					0x00000003 /* MC_EMEM_ARB_TIMING_R2W */
+					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+					0x06030203 /* MC_EMEM_ARB_DA_TURNS */
+					0x000a0402 /* MC_EMEM_ARB_DA_COVERS */
+					0x74a30303 /* MC_EMEM_ARB_MISC0 */
+					0x70000f03 /* MC_EMEM_ARB_MISC1 */
+					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+				>;
+			};
+
+			timing-68000000 {
+				clock-frequency = <68000000>;
+
+				nvidia,emem-configuration = <
+					0x00000001 /* MC_EMEM_ARB_CFG */
+					0x8000001e /* MC_EMEM_ARB_OUTSTANDING_REQ */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RP */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RC */
+					0x00000000 /* MC_EMEM_ARB_TIMING_RAS */
+					0x00000002 /* MC_EMEM_ARB_TIMING_FAW */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+					0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+					0x00000003 /* MC_EMEM_ARB_TIMING_R2R */
+					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
+					0x00000003 /* MC_EMEM_ARB_TIMING_R2W */
+					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+					0x06030203 /* MC_EMEM_ARB_DA_TURNS */
+					0x000a0402 /* MC_EMEM_ARB_DA_COVERS */
+					0x74230403 /* MC_EMEM_ARB_MISC0 */
+					0x70000f03 /* MC_EMEM_ARB_MISC1 */
+					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+				>;
+			};
+
+			timing-102000000 {
+				clock-frequency = <102000000>;
+
+				nvidia,emem-configuration = <
+					0x08000001 /* MC_EMEM_ARB_CFG */
+					0x80000026 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RP */
+					0x00000003 /* MC_EMEM_ARB_TIMING_RC */
+					0x00000000 /* MC_EMEM_ARB_TIMING_RAS */
+					0x00000002 /* MC_EMEM_ARB_TIMING_FAW */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+					0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+					0x00000003 /* MC_EMEM_ARB_TIMING_R2R */
+					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
+					0x00000003 /* MC_EMEM_ARB_TIMING_R2W */
+					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+					0x06030203 /* MC_EMEM_ARB_DA_TURNS */
+					0x000a0403 /* MC_EMEM_ARB_DA_COVERS */
+					0x73c30504 /* MC_EMEM_ARB_MISC0 */
+					0x70000f03 /* MC_EMEM_ARB_MISC1 */
+					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+				>;
+			};
+
+			timing-204000000 {
+				clock-frequency = <204000000>;
+
+				nvidia,emem-configuration = <
+					0x01000003 /* MC_EMEM_ARB_CFG */
+					0x80000040 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RP */
+					0x00000005 /* MC_EMEM_ARB_TIMING_RC */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RAS */
+					0x00000004 /* MC_EMEM_ARB_TIMING_FAW */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+					0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+					0x00000003 /* MC_EMEM_ARB_TIMING_R2R */
+					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
+					0x00000004 /* MC_EMEM_ARB_TIMING_R2W */
+					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+					0x06040203 /* MC_EMEM_ARB_DA_TURNS */
+					0x000a0405 /* MC_EMEM_ARB_DA_COVERS */
+					0x73840a06 /* MC_EMEM_ARB_MISC0 */
+					0x70000f03 /* MC_EMEM_ARB_MISC1 */
+					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+				>;
+			};
+
+			timing-300000000 {
+				clock-frequency = <300000000>;
+
+				nvidia,emem-configuration = <
+					0x08000004 /* MC_EMEM_ARB_CFG */
+					0x80000040 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RP */
+					0x00000007 /* MC_EMEM_ARB_TIMING_RC */
+					0x00000004 /* MC_EMEM_ARB_TIMING_RAS */
+					0x00000005 /* MC_EMEM_ARB_TIMING_FAW */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+					0x00000007 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+					0x00000002 /* MC_EMEM_ARB_TIMING_R2R */
+					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
+					0x00000004 /* MC_EMEM_ARB_TIMING_R2W */
+					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+					0x06040202 /* MC_EMEM_ARB_DA_TURNS */
+					0x000b0607 /* MC_EMEM_ARB_DA_COVERS */
+					0x77450e08 /* MC_EMEM_ARB_MISC0 */
+					0x70000f03 /* MC_EMEM_ARB_MISC1 */
+					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+				>;
+			};
+
+			timing-396000000 {
+				clock-frequency = <396000000>;
+
+				nvidia,emem-configuration = <
+					0x0f000005 /* MC_EMEM_ARB_CFG */
+					0x80000040 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RP */
+					0x00000009 /* MC_EMEM_ARB_TIMING_RC */
+					0x00000005 /* MC_EMEM_ARB_TIMING_RAS */
+					0x00000007 /* MC_EMEM_ARB_TIMING_FAW */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+					0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+					0x00000002 /* MC_EMEM_ARB_TIMING_R2R */
+					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
+					0x00000004 /* MC_EMEM_ARB_TIMING_R2W */
+					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+					0x06040202 /* MC_EMEM_ARB_DA_TURNS */
+					0x000d0709 /* MC_EMEM_ARB_DA_COVERS */
+					0x7586120a /* MC_EMEM_ARB_MISC0 */
+					0x70000f03 /* MC_EMEM_ARB_MISC1 */
+					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+				>;
+			};
+
+			timing-528000000 {
+				clock-frequency = <528000000>;
+
+				nvidia,emem-configuration = <
+					0x0f000007 /* MC_EMEM_ARB_CFG */
+					0x80000040 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RCD */
+					0x00000003 /* MC_EMEM_ARB_TIMING_RP */
+					0x0000000d /* MC_EMEM_ARB_TIMING_RC */
+					0x00000008 /* MC_EMEM_ARB_TIMING_RAS */
+					0x0000000a /* MC_EMEM_ARB_TIMING_FAW */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+					0x00000009 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+					0x00000002 /* MC_EMEM_ARB_TIMING_R2R */
+					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
+					0x00000005 /* MC_EMEM_ARB_TIMING_R2W */
+					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+					0x06050202 /* MC_EMEM_ARB_DA_TURNS */
+					0x0010090d /* MC_EMEM_ARB_DA_COVERS */
+					0x7428180e /* MC_EMEM_ARB_MISC0 */
+					0x70000f03 /* MC_EMEM_ARB_MISC1 */
+					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+				>;
+			};
+
+			timing-600000000 {
+				clock-frequency = <600000000>;
+
+				nvidia,emem-configuration = <
+					0x00000009 /* MC_EMEM_ARB_CFG */
+					0x80000040 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+					0x00000003 /* MC_EMEM_ARB_TIMING_RCD */
+					0x00000004 /* MC_EMEM_ARB_TIMING_RP */
+					0x0000000e /* MC_EMEM_ARB_TIMING_RC */
+					0x00000009 /* MC_EMEM_ARB_TIMING_RAS */
+					0x0000000b /* MC_EMEM_ARB_TIMING_FAW */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+					0x00000003 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+					0x0000000b /* MC_EMEM_ARB_TIMING_WAP2PRE */
+					0x00000002 /* MC_EMEM_ARB_TIMING_R2R */
+					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
+					0x00000005 /* MC_EMEM_ARB_TIMING_R2W */
+					0x00000007 /* MC_EMEM_ARB_TIMING_W2R */
+					0x07050202 /* MC_EMEM_ARB_DA_TURNS */
+					0x00130b0e /* MC_EMEM_ARB_DA_COVERS */
+					0x73a91b0f /* MC_EMEM_ARB_MISC0 */
+					0x70000f03 /* MC_EMEM_ARB_MISC1 */
+					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+				>;
+			};
+
+			timing-792000000 {
+				clock-frequency = <792000000>;
+
+				nvidia,emem-configuration = <
+					0x0e00000b /* MC_EMEM_ARB_CFG */
+					0x80000040 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+					0x00000004 /* MC_EMEM_ARB_TIMING_RCD */
+					0x00000005 /* MC_EMEM_ARB_TIMING_RP */
+					0x00000013 /* MC_EMEM_ARB_TIMING_RC */
+					0x0000000c /* MC_EMEM_ARB_TIMING_RAS */
+					0x0000000f /* MC_EMEM_ARB_TIMING_FAW */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RRD */
+					0x00000003 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+					0x0000000c /* MC_EMEM_ARB_TIMING_WAP2PRE */
+					0x00000002 /* MC_EMEM_ARB_TIMING_R2R */
+					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
+					0x00000006 /* MC_EMEM_ARB_TIMING_R2W */
+					0x00000008 /* MC_EMEM_ARB_TIMING_W2R */
+					0x08060202 /* MC_EMEM_ARB_DA_TURNS */
+					0x00160d13 /* MC_EMEM_ARB_DA_COVERS */
+					0x734c2414 /* MC_EMEM_ARB_MISC0 */
+					0x70000f02 /* MC_EMEM_ARB_MISC1 */
+					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+				>;
+			};
+		};
+
+		emc-timings-4 {
+			nvidia,ram-code = <4>;
+
+			timing-12750000 {
+				clock-frequency = <12750000>;
+
+				nvidia,emem-configuration = <
+					0x40040001 /* MC_EMEM_ARB_CFG */
+					0x8000000a /* MC_EMEM_ARB_OUTSTANDING_REQ */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RP */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RC */
+					0x00000000 /* MC_EMEM_ARB_TIMING_RAS */
+					0x00000002 /* MC_EMEM_ARB_TIMING_FAW */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+					0x00000003 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+					0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+					0x00000003 /* MC_EMEM_ARB_TIMING_R2R */
+					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
+					0x00000003 /* MC_EMEM_ARB_TIMING_R2W */
+					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+					0x06030203 /* MC_EMEM_ARB_DA_TURNS */
+					0x000a0502 /* MC_EMEM_ARB_DA_COVERS */
+					0x77e30303 /* MC_EMEM_ARB_MISC0 */
+					0x70000f03 /* MC_EMEM_ARB_MISC1 */
+					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+				>;
+			};
+
+			timing-20400000 {
+				clock-frequency = <20400000>;
+
+				nvidia,emem-configuration = <
+					0x40020001 /* MC_EMEM_ARB_CFG */
+					0x80000012 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RP */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RC */
+					0x00000000 /* MC_EMEM_ARB_TIMING_RAS */
+					0x00000002 /* MC_EMEM_ARB_TIMING_FAW */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+					0x00000003 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+					0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+					0x00000003 /* MC_EMEM_ARB_TIMING_R2R */
+					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
+					0x00000003 /* MC_EMEM_ARB_TIMING_R2W */
+					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+					0x06030203 /* MC_EMEM_ARB_DA_TURNS */
+					0x000a0502 /* MC_EMEM_ARB_DA_COVERS */
+					0x77430303 /* MC_EMEM_ARB_MISC0 */
+					0x70000f03 /* MC_EMEM_ARB_MISC1 */
+					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+				>;
+			};
+
+			timing-40800000 {
+				clock-frequency = <40800000>;
+
+				nvidia,emem-configuration = <
+					0xa0000001 /* MC_EMEM_ARB_CFG */
+					0x80000017 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RP */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RC */
+					0x00000000 /* MC_EMEM_ARB_TIMING_RAS */
+					0x00000002 /* MC_EMEM_ARB_TIMING_FAW */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+					0x00000003 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+					0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+					0x00000003 /* MC_EMEM_ARB_TIMING_R2R */
+					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
+					0x00000003 /* MC_EMEM_ARB_TIMING_R2W */
+					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+					0x06030203 /* MC_EMEM_ARB_DA_TURNS */
+					0x000a0502 /* MC_EMEM_ARB_DA_COVERS */
+					0x75e30303 /* MC_EMEM_ARB_MISC0 */
+					0x70000f03 /* MC_EMEM_ARB_MISC1 */
+					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+				>;
+			};
+
+			timing-68000000 {
+				clock-frequency = <68000000>;
+
+				nvidia,emem-configuration = <
+					0x00000001 /* MC_EMEM_ARB_CFG */
+					0x8000001e /* MC_EMEM_ARB_OUTSTANDING_REQ */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RP */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RC */
+					0x00000000 /* MC_EMEM_ARB_TIMING_RAS */
+					0x00000002 /* MC_EMEM_ARB_TIMING_FAW */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+					0x00000003 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+					0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+					0x00000003 /* MC_EMEM_ARB_TIMING_R2R */
+					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
+					0x00000003 /* MC_EMEM_ARB_TIMING_R2W */
+					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+					0x06030203 /* MC_EMEM_ARB_DA_TURNS */
+					0x000a0502 /* MC_EMEM_ARB_DA_COVERS */
+					0x75430403 /* MC_EMEM_ARB_MISC0 */
+					0x70000f03 /* MC_EMEM_ARB_MISC1 */
+					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+				>;
+			};
+
+			timing-102000000 {
+				clock-frequency = <102000000>;
+
+				nvidia,emem-configuration = <
+					0x08000001 /* MC_EMEM_ARB_CFG */
+					0x80000026 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RP */
+					0x00000003 /* MC_EMEM_ARB_TIMING_RC */
+					0x00000000 /* MC_EMEM_ARB_TIMING_RAS */
+					0x00000002 /* MC_EMEM_ARB_TIMING_FAW */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+					0x00000003 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+					0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+					0x00000003 /* MC_EMEM_ARB_TIMING_R2R */
+					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
+					0x00000003 /* MC_EMEM_ARB_TIMING_R2W */
+					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+					0x06030203 /* MC_EMEM_ARB_DA_TURNS */
+					0x000a0503 /* MC_EMEM_ARB_DA_COVERS */
+					0x74e30504 /* MC_EMEM_ARB_MISC0 */
+					0x70000f03 /* MC_EMEM_ARB_MISC1 */
+					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+				>;
+			};
+
+			timing-204000000 {
+				clock-frequency = <204000000>;
+
+				nvidia,emem-configuration = <
+					0x01000003 /* MC_EMEM_ARB_CFG */
+					0x80000040 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RP */
+					0x00000004 /* MC_EMEM_ARB_TIMING_RC */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RAS */
+					0x00000004 /* MC_EMEM_ARB_TIMING_FAW */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+					0x00000003 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+					0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+					0x00000003 /* MC_EMEM_ARB_TIMING_R2R */
+					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
+					0x00000004 /* MC_EMEM_ARB_TIMING_R2W */
+					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+					0x06040203 /* MC_EMEM_ARB_DA_TURNS */
+					0x000a0504 /* MC_EMEM_ARB_DA_COVERS */
+					0x74a40a05 /* MC_EMEM_ARB_MISC0 */
+					0x70000f03 /* MC_EMEM_ARB_MISC1 */
+					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+				>;
+			};
+
+			timing-300000000 {
+				clock-frequency = <300000000>;
+
+				nvidia,emem-configuration = <
+					0x08000004 /* MC_EMEM_ARB_CFG */
+					0x80000040 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RP */
+					0x00000007 /* MC_EMEM_ARB_TIMING_RC */
+					0x00000004 /* MC_EMEM_ARB_TIMING_RAS */
+					0x00000005 /* MC_EMEM_ARB_TIMING_FAW */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+					0x00000007 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+					0x00000002 /* MC_EMEM_ARB_TIMING_R2R */
+					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
+					0x00000004 /* MC_EMEM_ARB_TIMING_R2W */
+					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+					0x06040202 /* MC_EMEM_ARB_DA_TURNS */
+					0x000b0607 /* MC_EMEM_ARB_DA_COVERS */
+					0x77450e08 /* MC_EMEM_ARB_MISC0 */
+					0x70000f03 /* MC_EMEM_ARB_MISC1 */
+					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+				>;
+			};
+
+			timing-396000000 {
+				clock-frequency = <396000000>;
+
+				nvidia,emem-configuration = <
+					0x0f000005 /* MC_EMEM_ARB_CFG */
+					0x80000040 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RP */
+					0x00000009 /* MC_EMEM_ARB_TIMING_RC */
+					0x00000005 /* MC_EMEM_ARB_TIMING_RAS */
+					0x00000007 /* MC_EMEM_ARB_TIMING_FAW */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+					0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+					0x00000002 /* MC_EMEM_ARB_TIMING_R2R */
+					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
+					0x00000004 /* MC_EMEM_ARB_TIMING_R2W */
+					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+					0x06040202 /* MC_EMEM_ARB_DA_TURNS */
+					0x000d0709 /* MC_EMEM_ARB_DA_COVERS */
+					0x7586120a /* MC_EMEM_ARB_MISC0 */
+					0x70000f03 /* MC_EMEM_ARB_MISC1 */
+					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+				>;
+			};
+
+			timing-528000000 {
+				clock-frequency = <528000000>;
+
+				nvidia,emem-configuration = <
+					0x0f000007 /* MC_EMEM_ARB_CFG */
+					0x80000040 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RCD */
+					0x00000003 /* MC_EMEM_ARB_TIMING_RP */
+					0x0000000c /* MC_EMEM_ARB_TIMING_RC */
+					0x00000007 /* MC_EMEM_ARB_TIMING_RAS */
+					0x0000000a /* MC_EMEM_ARB_TIMING_FAW */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+					0x00000009 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+					0x00000002 /* MC_EMEM_ARB_TIMING_R2R */
+					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
+					0x00000005 /* MC_EMEM_ARB_TIMING_R2W */
+					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+					0x06050202 /* MC_EMEM_ARB_DA_TURNS */
+					0x0010090c /* MC_EMEM_ARB_DA_COVERS */
+					0x7488180d /* MC_EMEM_ARB_MISC0 */
+					0x70000f03 /* MC_EMEM_ARB_MISC1 */
+					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+				>;
+			};
+
+			timing-600000000 {
+				clock-frequency = <600000000>;
+
+				nvidia,emem-configuration = <
+					0x00000009 /* MC_EMEM_ARB_CFG */
+					0x80000040 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+					0x00000003 /* MC_EMEM_ARB_TIMING_RCD */
+					0x00000004 /* MC_EMEM_ARB_TIMING_RP */
+					0x0000000e /* MC_EMEM_ARB_TIMING_RC */
+					0x00000009 /* MC_EMEM_ARB_TIMING_RAS */
+					0x0000000b /* MC_EMEM_ARB_TIMING_FAW */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+					0x00000003 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+					0x0000000b /* MC_EMEM_ARB_TIMING_WAP2PRE */
+					0x00000002 /* MC_EMEM_ARB_TIMING_R2R */
+					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
+					0x00000005 /* MC_EMEM_ARB_TIMING_R2W */
+					0x00000007 /* MC_EMEM_ARB_TIMING_W2R */
+					0x07050202 /* MC_EMEM_ARB_DA_TURNS */
+					0x00130b0e /* MC_EMEM_ARB_DA_COVERS */
+					0x74691b0f /* MC_EMEM_ARB_MISC0 */
+					0x70000f03 /* MC_EMEM_ARB_MISC1 */
+					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+				>;
+			};
+
+			timing-792000000 {
+				clock-frequency = <792000000>;
+
+				nvidia,emem-configuration = <
+					0x0e00000b /* MC_EMEM_ARB_CFG */
+					0x80000040 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+					0x00000004 /* MC_EMEM_ARB_TIMING_RCD */
+					0x00000005 /* MC_EMEM_ARB_TIMING_RP */
+					0x00000013 /* MC_EMEM_ARB_TIMING_RC */
+					0x0000000c /* MC_EMEM_ARB_TIMING_RAS */
+					0x0000000f /* MC_EMEM_ARB_TIMING_FAW */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RRD */
+					0x00000003 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+					0x0000000c /* MC_EMEM_ARB_TIMING_WAP2PRE */
+					0x00000002 /* MC_EMEM_ARB_TIMING_R2R */
+					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
+					0x00000006 /* MC_EMEM_ARB_TIMING_R2W */
+					0x00000008 /* MC_EMEM_ARB_TIMING_W2R */
+					0x08060202 /* MC_EMEM_ARB_DA_TURNS */
+					0x00170e13 /* MC_EMEM_ARB_DA_COVERS */
+					0x746c2414 /* MC_EMEM_ARB_MISC0 */
+					0x70000f02 /* MC_EMEM_ARB_MISC1 */
+					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+				>;
+			};
+		};
+
+		emc-timings-6 {
+			nvidia,ram-code = <6>;
+
+			timing-12750000 {
+				clock-frequency = <12750000>;
+
+				nvidia,emem-configuration = <
+					0x40040001 /* MC_EMEM_ARB_CFG */
+					0x8000000a /* MC_EMEM_ARB_OUTSTANDING_REQ */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RP */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RC */
+					0x00000000 /* MC_EMEM_ARB_TIMING_RAS */
+					0x00000002 /* MC_EMEM_ARB_TIMING_FAW */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+					0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+					0x00000003 /* MC_EMEM_ARB_TIMING_R2R */
+					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
+					0x00000003 /* MC_EMEM_ARB_TIMING_R2W */
+					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+					0x06030203 /* MC_EMEM_ARB_DA_TURNS */
+					0x000a0402 /* MC_EMEM_ARB_DA_COVERS */
+					0x77e30303 /* MC_EMEM_ARB_MISC0 */
+					0x70000f03 /* MC_EMEM_ARB_MISC1 */
+					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+				>;
+			};
+
+			timing-20400000 {
+				clock-frequency = <20400000>;
+
+				nvidia,emem-configuration = <
+					0x40020001 /* MC_EMEM_ARB_CFG */
+					0x80000012 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RP */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RC */
+					0x00000000 /* MC_EMEM_ARB_TIMING_RAS */
+					0x00000002 /* MC_EMEM_ARB_TIMING_FAW */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+					0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+					0x00000003 /* MC_EMEM_ARB_TIMING_R2R */
+					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
+					0x00000003 /* MC_EMEM_ARB_TIMING_R2W */
+					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+					0x06030203 /* MC_EMEM_ARB_DA_TURNS */
+					0x000a0402 /* MC_EMEM_ARB_DA_COVERS */
+					0x76230303 /* MC_EMEM_ARB_MISC0 */
+					0x70000f03 /* MC_EMEM_ARB_MISC1 */
+					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+				>;
+			};
+
+			timing-40800000 {
+				clock-frequency = <40800000>;
+
+				nvidia,emem-configuration = <
+					0xa0000001 /* MC_EMEM_ARB_CFG */
+					0x80000017 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RP */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RC */
+					0x00000000 /* MC_EMEM_ARB_TIMING_RAS */
+					0x00000002 /* MC_EMEM_ARB_TIMING_FAW */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+					0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+					0x00000003 /* MC_EMEM_ARB_TIMING_R2R */
+					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
+					0x00000003 /* MC_EMEM_ARB_TIMING_R2W */
+					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+					0x06030203 /* MC_EMEM_ARB_DA_TURNS */
+					0x000a0402 /* MC_EMEM_ARB_DA_COVERS */
+					0x74a30303 /* MC_EMEM_ARB_MISC0 */
+					0x70000f03 /* MC_EMEM_ARB_MISC1 */
+					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+				>;
+			};
+
+			timing-68000000 {
+				clock-frequency = <68000000>;
+
+				nvidia,emem-configuration = <
+					0x00000001 /* MC_EMEM_ARB_CFG */
+					0x8000001e /* MC_EMEM_ARB_OUTSTANDING_REQ */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RP */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RC */
+					0x00000000 /* MC_EMEM_ARB_TIMING_RAS */
+					0x00000002 /* MC_EMEM_ARB_TIMING_FAW */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+					0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+					0x00000003 /* MC_EMEM_ARB_TIMING_R2R */
+					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
+					0x00000003 /* MC_EMEM_ARB_TIMING_R2W */
+					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+					0x06030203 /* MC_EMEM_ARB_DA_TURNS */
+					0x000a0402 /* MC_EMEM_ARB_DA_COVERS */
+					0x74230403 /* MC_EMEM_ARB_MISC0 */
+					0x70000f03 /* MC_EMEM_ARB_MISC1 */
+					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+				>;
+			};
+
+			timing-102000000 {
+				clock-frequency = <102000000>;
+
+				nvidia,emem-configuration = <
+					0x08000001 /* MC_EMEM_ARB_CFG */
+					0x80000026 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RP */
+					0x00000003 /* MC_EMEM_ARB_TIMING_RC */
+					0x00000000 /* MC_EMEM_ARB_TIMING_RAS */
+					0x00000002 /* MC_EMEM_ARB_TIMING_FAW */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+					0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+					0x00000003 /* MC_EMEM_ARB_TIMING_R2R */
+					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
+					0x00000003 /* MC_EMEM_ARB_TIMING_R2W */
+					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+					0x06030203 /* MC_EMEM_ARB_DA_TURNS */
+					0x000a0403 /* MC_EMEM_ARB_DA_COVERS */
+					0x73c30504 /* MC_EMEM_ARB_MISC0 */
+					0x70000f03 /* MC_EMEM_ARB_MISC1 */
+					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+				>;
+			};
+
+			timing-204000000 {
+				clock-frequency = <204000000>;
+
+				nvidia,emem-configuration = <
+					0x01000003 /* MC_EMEM_ARB_CFG */
+					0x80000040 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RP */
+					0x00000005 /* MC_EMEM_ARB_TIMING_RC */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RAS */
+					0x00000004 /* MC_EMEM_ARB_TIMING_FAW */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+					0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+					0x00000003 /* MC_EMEM_ARB_TIMING_R2R */
+					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
+					0x00000004 /* MC_EMEM_ARB_TIMING_R2W */
+					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+					0x06040203 /* MC_EMEM_ARB_DA_TURNS */
+					0x000a0405 /* MC_EMEM_ARB_DA_COVERS */
+					0x73840a06 /* MC_EMEM_ARB_MISC0 */
+					0x70000f03 /* MC_EMEM_ARB_MISC1 */
+					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+				>;
+			};
+
+			timing-300000000 {
+				clock-frequency = <300000000>;
+
+				nvidia,emem-configuration = <
+					0x08000004 /* MC_EMEM_ARB_CFG */
+					0x80000040 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RP */
+					0x00000007 /* MC_EMEM_ARB_TIMING_RC */
+					0x00000004 /* MC_EMEM_ARB_TIMING_RAS */
+					0x00000005 /* MC_EMEM_ARB_TIMING_FAW */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+					0x00000007 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+					0x00000002 /* MC_EMEM_ARB_TIMING_R2R */
+					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
+					0x00000004 /* MC_EMEM_ARB_TIMING_R2W */
+					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+					0x06040202 /* MC_EMEM_ARB_DA_TURNS */
+					0x000b0607 /* MC_EMEM_ARB_DA_COVERS */
+					0x77450e08 /* MC_EMEM_ARB_MISC0 */
+					0x70000f03 /* MC_EMEM_ARB_MISC1 */
+					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+				>;
+			};
+
+			timing-396000000 {
+				clock-frequency = <396000000>;
+
+				nvidia,emem-configuration = <
+					0x0f000005 /* MC_EMEM_ARB_CFG */
+					0x80000040 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RCD */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RP */
+					0x00000009 /* MC_EMEM_ARB_TIMING_RC */
+					0x00000005 /* MC_EMEM_ARB_TIMING_RAS */
+					0x00000007 /* MC_EMEM_ARB_TIMING_FAW */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+					0x00000008 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+					0x00000002 /* MC_EMEM_ARB_TIMING_R2R */
+					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
+					0x00000004 /* MC_EMEM_ARB_TIMING_R2W */
+					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+					0x06040202 /* MC_EMEM_ARB_DA_TURNS */
+					0x000d0709 /* MC_EMEM_ARB_DA_COVERS */
+					0x7586120a /* MC_EMEM_ARB_MISC0 */
+					0x70000f03 /* MC_EMEM_ARB_MISC1 */
+					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
+				>;
+			};
+
+			timing-528000000 {
+				clock-frequency = <528000000>;
 
 				nvidia,emem-configuration = <
-					0x0f000005
-					0x80000040
-					0x00000001
-					0x00000002
-					0x00000009
-					0x00000005
-					0x00000007
-					0x00000001
-					0x00000002
-					0x00000008
-					0x00000002
-					0x00000002
-					0x00000004
-					0x00000006
-					0x06040202
-					0x000d0709
-					0x7586120a
-					0x70000f03
-					0x001f0000
+					0x0f000007 /* MC_EMEM_ARB_CFG */
+					0x80000040 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RCD */
+					0x00000003 /* MC_EMEM_ARB_TIMING_RP */
+					0x0000000d /* MC_EMEM_ARB_TIMING_RC */
+					0x00000008 /* MC_EMEM_ARB_TIMING_RAS */
+					0x0000000a /* MC_EMEM_ARB_TIMING_FAW */
+					0x00000001 /* MC_EMEM_ARB_TIMING_RRD */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+					0x00000009 /* MC_EMEM_ARB_TIMING_WAP2PRE */
+					0x00000002 /* MC_EMEM_ARB_TIMING_R2R */
+					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
+					0x00000005 /* MC_EMEM_ARB_TIMING_R2W */
+					0x00000006 /* MC_EMEM_ARB_TIMING_W2R */
+					0x06050202 /* MC_EMEM_ARB_DA_TURNS */
+					0x0010090d /* MC_EMEM_ARB_DA_COVERS */
+					0x7428180e /* MC_EMEM_ARB_MISC0 */
+					0x70000f03 /* MC_EMEM_ARB_MISC1 */
+					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
 				>;
 			};
 
@@ -1972,25 +6599,25 @@
 				clock-frequency = <600000000>;
 
 				nvidia,emem-configuration = <
-					0x00000009
-					0x80000040
-					0x00000003
-					0x00000004
-					0x0000000e
-					0x00000009
-					0x0000000b
-					0x00000001
-					0x00000003
-					0x0000000b
-					0x00000002
-					0x00000002
-					0x00000005
-					0x00000007
-					0x07050202
-					0x00130b0e
-					0x73a91b0f
-					0x70000f03
-					0x001f0000
+					0x00000009 /* MC_EMEM_ARB_CFG */
+					0x80000040 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+					0x00000003 /* MC_EMEM_ARB_TIMING_RCD */
+					0x00000004 /* MC_EMEM_ARB_TIMING_RP */
+					0x0000000e /* MC_EMEM_ARB_TIMING_RC */
+					0x00000009 /* MC_EMEM_ARB_TIMING_RAS */
+					0x0000000b /* MC_EMEM_ARB_TIMING_FAW */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RRD */
+					0x00000003 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+					0x0000000b /* MC_EMEM_ARB_TIMING_WAP2PRE */
+					0x00000002 /* MC_EMEM_ARB_TIMING_R2R */
+					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
+					0x00000005 /* MC_EMEM_ARB_TIMING_R2W */
+					0x00000007 /* MC_EMEM_ARB_TIMING_W2R */
+					0x07050202 /* MC_EMEM_ARB_DA_TURNS */
+					0x00130b0e /* MC_EMEM_ARB_DA_COVERS */
+					0x73a91b0f /* MC_EMEM_ARB_MISC0 */
+					0x70000f03 /* MC_EMEM_ARB_MISC1 */
+					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
 				>;
 			};
 
@@ -1998,25 +6625,25 @@
 				clock-frequency = <792000000>;
 
 				nvidia,emem-configuration = <
-					0x0e00000b
-					0x80000040
-					0x00000004
-					0x00000005
-					0x00000013
-					0x0000000c
-					0x0000000f
-					0x00000002
-					0x00000003
-					0x0000000c
-					0x00000002
-					0x00000002
-					0x00000006
-					0x00000008
-					0x08060202
-					0x00160d13
-					0x734c2414
-					0x70000f02
-					0x001f0000
+					0x0e00000b /* MC_EMEM_ARB_CFG */
+					0x80000040 /* MC_EMEM_ARB_OUTSTANDING_REQ */
+					0x00000004 /* MC_EMEM_ARB_TIMING_RCD */
+					0x00000005 /* MC_EMEM_ARB_TIMING_RP */
+					0x00000013 /* MC_EMEM_ARB_TIMING_RC */
+					0x0000000c /* MC_EMEM_ARB_TIMING_RAS */
+					0x0000000f /* MC_EMEM_ARB_TIMING_FAW */
+					0x00000002 /* MC_EMEM_ARB_TIMING_RRD */
+					0x00000003 /* MC_EMEM_ARB_TIMING_RAP2PRE */
+					0x0000000c /* MC_EMEM_ARB_TIMING_WAP2PRE */
+					0x00000002 /* MC_EMEM_ARB_TIMING_R2R */
+					0x00000002 /* MC_EMEM_ARB_TIMING_W2W */
+					0x00000006 /* MC_EMEM_ARB_TIMING_R2W */
+					0x00000008 /* MC_EMEM_ARB_TIMING_W2R */
+					0x08060202 /* MC_EMEM_ARB_DA_TURNS */
+					0x00160d13 /* MC_EMEM_ARB_DA_COVERS */
+					0x734c2414 /* MC_EMEM_ARB_MISC0 */
+					0x70000f02 /* MC_EMEM_ARB_MISC1 */
+					0x001f0000 /* MC_EMEM_ARB_RING1_THROTTLE */
 				>;
 			};
 		};
-- 
2.21.0


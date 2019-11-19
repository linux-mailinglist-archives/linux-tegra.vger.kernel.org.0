Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EDAEF1019AB
	for <lists+linux-tegra@lfdr.de>; Tue, 19 Nov 2019 07:52:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727830AbfKSGvM (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 19 Nov 2019 01:51:12 -0500
Received: from hqemgate16.nvidia.com ([216.228.121.65]:8321 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727792AbfKSGvL (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 19 Nov 2019 01:51:11 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5dd390dd0000>; Mon, 18 Nov 2019 22:51:09 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 18 Nov 2019 22:51:08 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 18 Nov 2019 22:51:08 -0800
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 19 Nov
 2019 06:51:08 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 19 Nov 2019 06:51:08 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.175.254]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5dd390da0001>; Mon, 18 Nov 2019 22:51:07 -0800
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <digetx@gmail.com>,
        <mperttunen@nvidia.com>, <gregkh@linuxfoundation.org>,
        <sboyd@kernel.org>, <tglx@linutronix.de>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>
CC:     <allison@lohutok.net>, <pdeschrijver@nvidia.com>,
        <pgaikwad@nvidia.com>, <mturquette@baylibre.com>,
        <horms+renesas@verge.net.au>, <Jisheng.Zhang@synaptics.com>,
        <krzk@kernel.org>, <arnd@arndb.de>, <spujar@nvidia.com>,
        <josephl@nvidia.com>, <vidyas@nvidia.com>,
        <daniel.lezcano@linaro.org>, <mmaddireddy@nvidia.com>,
        <markz@nvidia.com>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 11/17] dt-bindings: clock: tegra: Remove pmc clock ids from clock dt-bindings
Date:   Mon, 18 Nov 2019 22:50:28 -0800
Message-ID: <1574146234-3871-12-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574146234-3871-1-git-send-email-skomatineni@nvidia.com>
References: <1574146234-3871-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1574146269; bh=k6+2YQdeTb5W9Ih8fGDwfsFTywHl5MmO6ZKZuuXrGAQ=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=kFQwHHzRj6xpk/itiLyZT0nrmES/Bt4TIglsOQL2rVoUR4UMMagvz/MESG0sST078
         7iOmAZJzmXc7QIf4c4ybFGTe2KI8S8djJ2RODkm7tgC6Dc7KWJ7h013bDlUUi/xqTl
         4fbjlBd1fgI9VnYEd/MGpEKRMGvnGbLO3TtyWKolsQeZrkIkfWrVSk0Ai9n61tBQGH
         5mhMZftdaNEqADBaLZ+F6BIpzZLNGZfuXbKxcTbpm4oyL62Yrf8ndCxdNPH/RbGX4R
         Xm3G1cAt5xf8VK8ex2TsxcMpWlLYHAkkjruDHv0zWDaWnLvEASCEMFx3eY/end2a3i
         Jwe9Zcd+MjGgg==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

clk_out_1, clk_out_2, clk_out_3, blink are part of Tegra pmc clocks.

This patch removes ids for these clocks from Tegra clock dt-bindings.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 include/dt-bindings/clock/tegra114-car.h        | 14 +++++++-------
 include/dt-bindings/clock/tegra124-car-common.h | 14 +++++++-------
 include/dt-bindings/clock/tegra20-car.h         |  2 +-
 include/dt-bindings/clock/tegra210-car.h        | 14 +++++++-------
 include/dt-bindings/clock/tegra30-car.h         | 14 +++++++-------
 5 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/include/dt-bindings/clock/tegra114-car.h b/include/dt-bindings/clock/tegra114-car.h
index bb5c2c999c05..9175cd0571b5 100644
--- a/include/dt-bindings/clock/tegra114-car.h
+++ b/include/dt-bindings/clock/tegra114-car.h
@@ -270,10 +270,10 @@
 #define TEGRA114_CLK_AUDIO3 242
 #define TEGRA114_CLK_AUDIO4 243
 #define TEGRA114_CLK_SPDIF 244
-#define TEGRA114_CLK_CLK_OUT_1 245
-#define TEGRA114_CLK_CLK_OUT_2 246
-#define TEGRA114_CLK_CLK_OUT_3 247
-#define TEGRA114_CLK_BLINK 248
+/* 245 */
+/* 246 */
+/* 247 */
+/* 248 */
 /* 249 */
 /* 250 */
 /* 251 */
@@ -333,9 +333,9 @@
 #define TEGRA114_CLK_AUDIO3_MUX 303
 #define TEGRA114_CLK_AUDIO4_MUX 304
 #define TEGRA114_CLK_SPDIF_MUX 305
-#define TEGRA114_CLK_CLK_OUT_1_MUX 306
-#define TEGRA114_CLK_CLK_OUT_2_MUX 307
-#define TEGRA114_CLK_CLK_OUT_3_MUX 308
+/* 306 */
+/* 307 */
+/* 308 */
 #define TEGRA114_CLK_DSIA_MUX 309
 #define TEGRA114_CLK_DSIB_MUX 310
 #define TEGRA114_CLK_XUSB_SS_DIV2 311
diff --git a/include/dt-bindings/clock/tegra124-car-common.h b/include/dt-bindings/clock/tegra124-car-common.h
index 0c4f5be0a742..90a0c5e7eb5f 100644
--- a/include/dt-bindings/clock/tegra124-car-common.h
+++ b/include/dt-bindings/clock/tegra124-car-common.h
@@ -269,10 +269,10 @@
 #define TEGRA124_CLK_AUDIO3 242
 #define TEGRA124_CLK_AUDIO4 243
 #define TEGRA124_CLK_SPDIF 244
-#define TEGRA124_CLK_CLK_OUT_1 245
-#define TEGRA124_CLK_CLK_OUT_2 246
-#define TEGRA124_CLK_CLK_OUT_3 247
-#define TEGRA124_CLK_BLINK 248
+/* 245 */
+/* 246 */
+/* 247 */
+/* 248 */
 /* 249 */
 /* 250 */
 /* 251 */
@@ -332,9 +332,9 @@
 #define TEGRA124_CLK_AUDIO3_MUX 303
 #define TEGRA124_CLK_AUDIO4_MUX 304
 #define TEGRA124_CLK_SPDIF_MUX 305
-#define TEGRA124_CLK_CLK_OUT_1_MUX 306
-#define TEGRA124_CLK_CLK_OUT_2_MUX 307
-#define TEGRA124_CLK_CLK_OUT_3_MUX 308
+/* 306 */
+/* 307 */
+/* 308 */
 /* 309 */
 /* 310 */
 #define TEGRA124_CLK_SOR0_LVDS 311 /* deprecated */
diff --git a/include/dt-bindings/clock/tegra20-car.h b/include/dt-bindings/clock/tegra20-car.h
index b21a0eb32921..fe541f627965 100644
--- a/include/dt-bindings/clock/tegra20-car.h
+++ b/include/dt-bindings/clock/tegra20-car.h
@@ -131,7 +131,7 @@
 #define TEGRA20_CLK_CCLK 108
 #define TEGRA20_CLK_HCLK 109
 #define TEGRA20_CLK_PCLK 110
-#define TEGRA20_CLK_BLINK 111
+/* 111 */
 #define TEGRA20_CLK_PLL_A 112
 #define TEGRA20_CLK_PLL_A_OUT0 113
 #define TEGRA20_CLK_PLL_C 114
diff --git a/include/dt-bindings/clock/tegra210-car.h b/include/dt-bindings/clock/tegra210-car.h
index 44f60623f99b..a3d8d3e75728 100644
--- a/include/dt-bindings/clock/tegra210-car.h
+++ b/include/dt-bindings/clock/tegra210-car.h
@@ -304,10 +304,10 @@
 #define TEGRA210_CLK_AUDIO3 274
 #define TEGRA210_CLK_AUDIO4 275
 #define TEGRA210_CLK_SPDIF 276
-#define TEGRA210_CLK_CLK_OUT_1 277
-#define TEGRA210_CLK_CLK_OUT_2 278
-#define TEGRA210_CLK_CLK_OUT_3 279
-#define TEGRA210_CLK_BLINK 280
+/* 277 */
+/* 278 */
+/* 279 */
+/* 280 */
 #define TEGRA210_CLK_SOR0_LVDS 281 /* deprecated */
 #define TEGRA210_CLK_SOR0_OUT 281
 #define TEGRA210_CLK_SOR1_OUT 282
@@ -386,9 +386,9 @@
 #define TEGRA210_CLK_AUDIO3_MUX 353
 #define TEGRA210_CLK_AUDIO4_MUX 354
 #define TEGRA210_CLK_SPDIF_MUX 355
-#define TEGRA210_CLK_CLK_OUT_1_MUX 356
-#define TEGRA210_CLK_CLK_OUT_2_MUX 357
-#define TEGRA210_CLK_CLK_OUT_3_MUX 358
+/* 356 */
+/* 357 */
+/* 358 */
 #define TEGRA210_CLK_DSIA_MUX 359
 #define TEGRA210_CLK_DSIB_MUX 360
 /* 361 */
diff --git a/include/dt-bindings/clock/tegra30-car.h b/include/dt-bindings/clock/tegra30-car.h
index 3c90f1535551..20ef2462d9e1 100644
--- a/include/dt-bindings/clock/tegra30-car.h
+++ b/include/dt-bindings/clock/tegra30-car.h
@@ -230,11 +230,11 @@
 #define TEGRA30_CLK_AUDIO3 204
 #define TEGRA30_CLK_AUDIO4 205
 #define TEGRA30_CLK_SPDIF 206
-#define TEGRA30_CLK_CLK_OUT_1 207 /* (extern1) */
-#define TEGRA30_CLK_CLK_OUT_2 208 /* (extern2) */
-#define TEGRA30_CLK_CLK_OUT_3 209 /* (extern3) */
+/* 207 */
+/* 208 */
+/* 209 */
 #define TEGRA30_CLK_SCLK 210
-#define TEGRA30_CLK_BLINK 211
+/* 211 */
 #define TEGRA30_CLK_CCLK_G 212
 #define TEGRA30_CLK_CCLK_LP 213
 #define TEGRA30_CLK_TWD 214
@@ -260,9 +260,9 @@
 /* 297 */
 /* 298 */
 /* 299 */
-#define TEGRA30_CLK_CLK_OUT_1_MUX 300
-#define TEGRA30_CLK_CLK_OUT_2_MUX 301
-#define TEGRA30_CLK_CLK_OUT_3_MUX 302
+/* 300 */
+/* 301 */
+/* 302 */
 #define TEGRA30_CLK_AUDIO0_MUX 303
 #define TEGRA30_CLK_AUDIO1_MUX 304
 #define TEGRA30_CLK_AUDIO2_MUX 305
-- 
2.7.4


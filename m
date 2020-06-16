Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91B611FB296
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Jun 2020 15:53:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728928AbgFPNxV (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 Jun 2020 09:53:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728869AbgFPNxR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Jun 2020 09:53:17 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03132C061573
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:53:16 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id r15so3155523wmh.5
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tpIq7vACm4SRxkjFZliC+FSY9hil6puRxlsauHDzKe8=;
        b=ryLdf2LXTxwgiV7DZWr7/VLXC2xIGtU0POGsbmLk+xrVeTszRvGXuy3BDIzboqpXE+
         r1KRxGTBTTxRGoFe9ZZ1i2s4hPEejXZ6LO6nvh0OKrkN351IVql1yUhXR0MQbdEnytup
         x1Lx16+Vm27p4+qolpdSosQcDD1eBOWhvh6Q63I8A9r3/iX+SK8UsC1qB3pIEkS8+TBL
         DxnXEv9F5tWTc+yTXvG2g6vTuhP5fvW+YvHj2syCLd3UNvpt8sn2i24KEftZsKpiNquz
         niogcl9am/UShqHR9vgd1Tr+y5FkmUiXjy7TIAJKDbDIvQQKpyh5FG8iVhKIY8CrTq21
         3gMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tpIq7vACm4SRxkjFZliC+FSY9hil6puRxlsauHDzKe8=;
        b=nxOLamtva2U18bMTbVOVxW6/bCdSr7bR87Xw1TviNQ2WYT9pfY1R4UQ7uNXJ+NijRN
         EYfVpQJ0m3qwjuKbsB4j8s06I6PjmCaahxPgqfT5NVqlvCCdgBRKCMMTEWxdwXkKm3jl
         ukRwHlF4zv9u5DX1VXGjGcHZ6XHS+Ek51UamTs+iELVp5ZwhcFExV+f6G/10qlRAURyy
         Mws/8gK/YdBcAToRnslRfMgnvCY1nX93F0WVObWylXFrNTyGfg8dnfaBtoSEJAU0DzDC
         9CM47+d88OeHprf45xYG9sCKX3E+Jf2H5JbzKiXN3tUmZCT0YeisQ7dP6LvUZzU3JKoT
         SyHw==
X-Gm-Message-State: AOAM5339ieLlR+CiGUOkQj6bHHzrN8jRIiYTtHQvipUXz8MdJY0y2hR7
        mGSxrB5r0XoLPyiiSbf/ncLbhrvc
X-Google-Smtp-Source: ABdhPJzipveQTxSMnAX+CCSmUY/8CMrXker9nYOnhziBKgxrErWzwb0f+Alxp/k8cVnTn0Fsbmy3/g==
X-Received: by 2002:a1c:c302:: with SMTP id t2mr3273849wmf.72.1592315594678;
        Tue, 16 Jun 2020 06:53:14 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id o9sm3983949wmh.37.2020.06.16.06.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 06:53:13 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 12/73] ARM: tegra: Drop display controller parent clocks on Tegra114
Date:   Tue, 16 Jun 2020 15:51:37 +0200
Message-Id: <20200616135238.3001888-13-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200616135238.3001888-1-thierry.reding@gmail.com>
References: <20200616135238.3001888-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The parent clocks are determined by the output that will be used, not by
the display controller that drives the output. Drop the parent clocks
from the display controller device tree nodes.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/tegra114.dtsi | 10 ++++------
 arch/arm/boot/dts/tegra124.dtsi | 10 ++++------
 arch/arm/boot/dts/tegra20.dtsi  | 10 ++++------
 arch/arm/boot/dts/tegra30.dtsi  | 10 ++++------
 4 files changed, 16 insertions(+), 24 deletions(-)

diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi
index a06b88b01ef3..23df7a5f37d3 100644
--- a/arch/arm/boot/dts/tegra114.dtsi
+++ b/arch/arm/boot/dts/tegra114.dtsi
@@ -59,9 +59,8 @@ dc@54200000 {
 			compatible = "nvidia,tegra114-dc";
 			reg = <0x54200000 0x00040000>;
 			interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&tegra_car TEGRA114_CLK_DISP1>,
-				 <&tegra_car TEGRA114_CLK_PLL_P>;
-			clock-names = "dc", "parent";
+			clocks = <&tegra_car TEGRA114_CLK_DISP1>;
+			clock-names = "dc";
 			resets = <&tegra_car 27>;
 			reset-names = "dc";
 
@@ -78,9 +77,8 @@ dc@54240000 {
 			compatible = "nvidia,tegra114-dc";
 			reg = <0x54240000 0x00040000>;
 			interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&tegra_car TEGRA114_CLK_DISP2>,
-				 <&tegra_car TEGRA114_CLK_PLL_P>;
-			clock-names = "dc", "parent";
+			clocks = <&tegra_car TEGRA114_CLK_DISP2>;
+			clock-names = "dc";
 			resets = <&tegra_car 26>;
 			reset-names = "dc";
 
diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
index 1afed8496c95..2c992e8e3594 100644
--- a/arch/arm/boot/dts/tegra124.dtsi
+++ b/arch/arm/boot/dts/tegra124.dtsi
@@ -105,9 +105,8 @@ dc@54200000 {
 			compatible = "nvidia,tegra124-dc";
 			reg = <0x0 0x54200000 0x0 0x00040000>;
 			interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&tegra_car TEGRA124_CLK_DISP1>,
-				 <&tegra_car TEGRA124_CLK_PLL_P>;
-			clock-names = "dc", "parent";
+			clocks = <&tegra_car TEGRA124_CLK_DISP1>;
+			clock-names = "dc";
 			resets = <&tegra_car 27>;
 			reset-names = "dc";
 
@@ -120,9 +119,8 @@ dc@54240000 {
 			compatible = "nvidia,tegra124-dc";
 			reg = <0x0 0x54240000 0x0 0x00040000>;
 			interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&tegra_car TEGRA124_CLK_DISP2>,
-				 <&tegra_car TEGRA124_CLK_PLL_P>;
-			clock-names = "dc", "parent";
+			clocks = <&tegra_car TEGRA124_CLK_DISP2>;
+			clock-names = "dc";
 			resets = <&tegra_car 26>;
 			reset-names = "dc";
 
diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index f0a172c61b26..8b6909839f59 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -103,9 +103,8 @@ dc@54200000 {
 			compatible = "nvidia,tegra20-dc";
 			reg = <0x54200000 0x00040000>;
 			interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&tegra_car TEGRA20_CLK_DISP1>,
-				 <&tegra_car TEGRA20_CLK_PLL_P>;
-			clock-names = "dc", "parent";
+			clocks = <&tegra_car TEGRA20_CLK_DISP1>;
+			clock-names = "dc";
 			resets = <&tegra_car 27>;
 			reset-names = "dc";
 
@@ -120,9 +119,8 @@ dc@54240000 {
 			compatible = "nvidia,tegra20-dc";
 			reg = <0x54240000 0x00040000>;
 			interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&tegra_car TEGRA20_CLK_DISP2>,
-				 <&tegra_car TEGRA20_CLK_PLL_P>;
-			clock-names = "dc", "parent";
+			clocks = <&tegra_car TEGRA20_CLK_DISP2>;
+			clock-names = "dc";
 			resets = <&tegra_car 26>;
 			reset-names = "dc";
 
diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index 27000f0ba35b..23fedb76e5ae 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -200,9 +200,8 @@ dc@54200000 {
 			compatible = "nvidia,tegra30-dc", "nvidia,tegra20-dc";
 			reg = <0x54200000 0x00040000>;
 			interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&tegra_car TEGRA30_CLK_DISP1>,
-				 <&tegra_car TEGRA30_CLK_PLL_P>;
-			clock-names = "dc", "parent";
+			clocks = <&tegra_car TEGRA30_CLK_DISP1>;
+			clock-names = "dc";
 			resets = <&tegra_car 27>;
 			reset-names = "dc";
 
@@ -219,9 +218,8 @@ dc@54240000 {
 			compatible = "nvidia,tegra30-dc";
 			reg = <0x54240000 0x00040000>;
 			interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&tegra_car TEGRA30_CLK_DISP2>,
-				 <&tegra_car TEGRA30_CLK_PLL_P>;
-			clock-names = "dc", "parent";
+			clocks = <&tegra_car TEGRA30_CLK_DISP2>;
+			clock-names = "dc";
 			resets = <&tegra_car 26>;
 			reset-names = "dc";
 
-- 
2.24.1


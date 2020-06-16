Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4595A1FB2E7
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Jun 2020 15:55:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728885AbgFPNzw (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 Jun 2020 09:55:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726261AbgFPNze (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Jun 2020 09:55:34 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88BDFC061755
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:55:33 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id r15so3163863wmh.5
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Uz0efW8iA6V8zBMtaBk0aU4WternaWXVod/MWBXLlPY=;
        b=EE4mfDSdA0ZrSOT8o19klgutHvWOj43dyB/DNktOgAqpYIkEbBubei5Njx8OxObiFr
         a9DG9BTgRhKiAr2c0ymuyC5V0LaiMOvJetTN2Vk3V72YrXSbhm5s70c58uCaPcHiVii8
         aMWcGsRlZDMEo1VrfdELoaUZz1Eo9YVQOxzE7f0Cjr8+2AaZYrJgmUwDuf9xTjWq37mx
         077IqHDL37AmL9yPEqCIxK61rNeggG9bVeklnoauV1XkNuy1vEpyIMdSj0zb0Lo/v5mV
         VgaMzY+rjlKa0Ae2DV4sukC6HYxEUEdTUsdG/u7ex0iU8Jd052PS+VAEwc405E/4zLvM
         0LIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Uz0efW8iA6V8zBMtaBk0aU4WternaWXVod/MWBXLlPY=;
        b=EmlzMwuHz8Rl/BoswTJmOOuVSEt2Lidg8B8G6KNXEXooeSQVgbm59H7F90/rBJAHRk
         TN2SZ5y2OW56w4u8+qaNeX4GoZe5M/FPVAVfUJDIVTBXTfWkXXxp1sC6HHksIggyf4a2
         RXpOx0fCpaNh/LCqmpbDvUR6zUcsyu26iZhPkuwKmfKMD1ZoLCRy0uTASy99QqEF2SF6
         ElkUuYiyRfueHxm5qyUCyYs+rzL9obIChxo+llsBLncTowotKqpjAU7c0mnSc8DiPxIp
         FuhUXTYxV7qbL5rcB4i+rXYos3ZRbTmrMS+6w+cEwxyNiwwihj36c7ssbwuumGk+eJSw
         bnVg==
X-Gm-Message-State: AOAM532ZhiGzKUHNADRs13etDGs/3ISWJlDQ5M9od6Ws5JOwQa1mxPFo
        /vbbx5s2u/XjHFzfDqKwx1aWjIfJ
X-Google-Smtp-Source: ABdhPJymcGJMOYoLq3eDy8kdaHoIf86nUxQ8Hmbzn8ciSNOiUXTeReikZFFVZyjWZVsfXxpE2EN3wA==
X-Received: by 2002:a1c:e40a:: with SMTP id b10mr3246953wmh.41.1592315732244;
        Tue, 16 Jun 2020 06:55:32 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id w10sm29435711wrp.16.2020.06.16.06.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 06:55:31 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 70/73] arm64: tegra: Various fixes for PMICs
Date:   Tue, 16 Jun 2020 15:52:35 +0200
Message-Id: <20200616135238.3001888-71-thierry.reding@gmail.com>
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

Standardize on "pmic" as the node name for the PMIC on Tegra210 systems
and use consistent names for pinmux and GPIO hog nodes.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../arm64/boot/dts/nvidia/tegra210-p2894.dtsi | 31 +++++++++----------
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 14 ++++-----
 2 files changed, 22 insertions(+), 23 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi
index 1acb9bb6c7df..41beab626d95 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi
@@ -1328,7 +1328,7 @@ i2c@7000d000 {
 		status = "okay";
 		clock-frequency = <400000>;
 
-		max77620: max77620@3c {
+		pmic: pmic@3c {
 			compatible = "maxim,max77620";
 			reg = <0x3c>;
 			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
@@ -1343,12 +1343,12 @@ max77620: max77620@3c {
 			pinctrl-0 = <&max77620_default>;
 
 			max77620_default: pinmux@0 {
-				pin_gpio0 {
+				gpio0 {
 					pins = "gpio0";
 					function = "gpio";
 				};
 
-				pin_gpio1 {
+				gpio1 {
 					pins = "gpio1";
 					function = "fps-out";
 					drive-push-pull = <1>;
@@ -1357,34 +1357,33 @@ pin_gpio1 {
 					maxim,active-fps-power-down-slot = <0>;
 				};
 
-				pin_gpio2_3 {
-					pins = "gpio2", "gpio3";
+				gpio2 {
+					pins = "gpio2";
 					function = "fps-out";
 					drive-open-drain = <1>;
 					maxim,active-fps-source = <MAX77620_FPS_SRC_0>;
 				};
 
-				pin_gpio4 {
+				gpio3 {
+					pins = "gpio3";
+					function = "fps-out";
+					drive-open-drain = <1>;
+					maxim,active-fps-source = <MAX77620_FPS_SRC_0>;
+				};
+
+				gpio4 {
 					pins = "gpio4";
 					function = "32k-out1";
 				};
 
-				pin_gpio5_6_7 {
+				gpio5_6_7 {
 					pins = "gpio5", "gpio6", "gpio7";
 					function = "gpio";
 					drive-push-pull = <1>;
 				};
-
-				pin_gpio2 {
-					maxim,active-fps-source = <MAX77620_FPS_SRC_0>;
-				};
-
-				pin_gpio3 {
-					maxim,active-fps-source = <MAX77620_FPS_SRC_0>;
-				};
 			};
 
-			spmic-default-output-high {
+			gpio@0 {
 				gpio-hog;
 				output-high;
 				gpios = <2 GPIO_ACTIVE_HIGH>,
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
index f7840e5e069a..a946c5c31102 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
@@ -1354,11 +1354,11 @@ max77621_cpu: max77621@1b {
 			maxim,enable-active-discharge;
 			maxim,enable-bias-control;
 			maxim,enable-etr;
-			maxim,enable-gpio = <&max77620 5 0>;
+			maxim,enable-gpio = <&pmic 5 0>;
 			maxim,externally-enable;
 		};
 
-		max77620: max77620@3c {
+		pmic: pmic@3c {
 			compatible = "maxim,max77620";
 			reg = <0x3c>;
 			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
@@ -1372,8 +1372,8 @@ max77620: max77620@3c {
 			pinctrl-names = "default";
 			pinctrl-0 = <&max77620_default>;
 
-			max77620_default: pinmux@0 {
-				pin_gpio {
+			max77620_default: pinmux {
+				gpio0_1_2_7 {
 					pins = "gpio0", "gpio1", "gpio2", "gpio7";
 					function = "gpio";
 				};
@@ -1383,7 +1383,7 @@ pin_gpio {
 				 * sequence, So it must be sequenced up (automatically
 				 * set by OTP) and down properly.
 				 */
-				pin_gpio3 {
+				gpio3 {
 					pins = "gpio3";
 					function = "fps-out";
 					drive-open-drain = <1>;
@@ -1392,13 +1392,13 @@ pin_gpio3 {
 					maxim,active-fps-power-down-slot = <2>;
 				};
 
-				pin_gpio5_6 {
+				gpio5_6 {
 					pins = "gpio5", "gpio6";
 					function = "gpio";
 					drive-push-pull = <1>;
 				};
 
-				pin_32k {
+				gpio4 {
 					pins = "gpio4";
 					function = "32k-out1";
 				};
-- 
2.24.1


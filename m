Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6414A1FB2CA
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Jun 2020 15:54:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728899AbgFPNy5 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 Jun 2020 09:54:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728815AbgFPNy4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Jun 2020 09:54:56 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B397C061755
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:54:55 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id p5so20849950wrw.9
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DOFznB5E/wdO9myo3nDsORYkzeuJ1ic/QUyt2XcRSJo=;
        b=isC2qMgE9O6/T+VUY1zSAoxzHfh/aajYltRdjdQ7blQSUqddB62j2JhVIA6Z7O3zyP
         FVi0xXPP6dFLvTaDrp+WJ9/uGdLyt8hZ7t0dQ4GkU66qtNlkK7WLvqaHWhzg06UqlXcY
         ZN0qRxI/NvV58z7mXIrtzdjRtiw9/OngGXKtb80/2w2LrB+0hRb0mg9GF9c9pL4MC4ni
         MAUVRDuMa63uqjlGQOhYfX7FD9N6e/edlFHFrnwSJCl5nYYeSp40RktCQAeqr3m/2t8d
         P8jIwKQ2xcQMK31l37JGf3Q90liolw9ygufnLH9mkjx9HcP6emCIpuvfVLjBffwbAS8r
         tl3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DOFznB5E/wdO9myo3nDsORYkzeuJ1ic/QUyt2XcRSJo=;
        b=mai4VBAF5R2YdZURpvzjtsAPotnGt/nmleC9f5527U/zwINMoMQyRGzD1A4E7DYdrU
         sVDHjU/X664ZbSYsKDiTXB+270kxss4/IibScw5vN2AhEKIGGcWvguC2A/Z2tcB9VzM/
         XIZOOfKQinFk9S8qW/59MGNeLjKbD0LVJMukY74YRN0RpgqyH7+GglHdw5caqbvtpfKv
         Z3xUNlWbF0JCFoxmvgzLjc/mkp5RS+mavgIwpfohPnZWmsz/rJYcX9seJ3Taasuognn9
         giK8QGDEP8f+C9OO4gHIh8bxadchBJ3HPbKlZaccXxYsKiDGFZLcVHRPsIUkOwzhZoyl
         brnA==
X-Gm-Message-State: AOAM531fClt3PpfKoScCkfcHxBCBx7g0G8MHWut3OioAn3w8dtSRvTKL
        k1QagY4hQnojHsLExKNPkMY=
X-Google-Smtp-Source: ABdhPJwo780ARtuG5wvTBo7C1WSiJ0w1ASIadyWwgCHXCUi/7JYtl6MsDfMbOGLDmXcfuxAWG17bgA==
X-Received: by 2002:a5d:6b81:: with SMTP id n1mr3155097wrx.411.1592315694381;
        Tue, 16 Jun 2020 06:54:54 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id b143sm4142690wme.20.2020.06.16.06.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 06:54:53 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 52/73] arm64: tegra: Remove simple clocks bus
Date:   Tue, 16 Jun 2020 15:52:17 +0200
Message-Id: <20200616135238.3001888-53-thierry.reding@gmail.com>
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

The standard way to do this is to list out the clocks at the top-level.
Adopt the standard way to fix validation.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra132-norrin.dts    | 15 ++++-----------
 arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi    | 15 ++++-----------
 arch/arm64/boot/dts/nvidia/tegra210-p2530.dtsi    | 15 ++++-----------
 arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi    | 15 ++++-----------
 .../arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 15 ++++-----------
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts     | 15 ++++-----------
 6 files changed, 24 insertions(+), 66 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts b/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
index bb45ca6a5cf2..278bef2d8810 100644
--- a/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
@@ -1022,17 +1022,10 @@ backlight: backlight {
 		backlight-boot-off;
 	};
 
-	clocks {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		clk32k_in: clock@0 {
-			compatible = "fixed-clock";
-			reg=<0>;
-			#clock-cells = <0>;
-			clock-frequency = <32768>;
-		};
+	clk32k_in: clock@0 {
+		compatible = "fixed-clock";
+		clock-frequency = <32768>;
+		#clock-cells = <0>;
 	};
 
 	gpio-keys {
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
index 251c6099482a..8a4ba371ff92 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
@@ -300,17 +300,10 @@ mmc@700b0600 {
 		vqmmc-supply = <&vdd_1v8>;
 	};
 
-	clocks {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		clk32k_in: clock@0 {
-			compatible = "fixed-clock";
-			reg = <0>;
-			#clock-cells = <0>;
-			clock-frequency = <32768>;
-		};
+	clk32k_in: clock@0 {
+		compatible = "fixed-clock";
+		clock-frequency = <32768>;
+		#clock-cells = <0>;
 	};
 
 	cpus {
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2530.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2530.dtsi
index f9158dc943f9..58aa0518965e 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2530.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2530.dtsi
@@ -40,17 +40,10 @@ mmc@700b0600 {
 		non-removable;
 	};
 
-	clocks {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		clk32k_in: clock@0 {
-			compatible = "fixed-clock";
-			reg = <0>;
-			#clock-cells = <0>;
-			clock-frequency = <32768>;
-		};
+	clk32k_in: clock@0 {
+		compatible = "fixed-clock";
+		clock-frequency = <32768>;
+		#clock-cells = <0>;
 	};
 
 	cpus {
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi
index 579d5b8a757d..9f81cabdcbb6 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi
@@ -1586,17 +1586,10 @@ mmc@700b0600 {
 		status = "okay";
 	};
 
-	clocks {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		clk32k_in: clock@0 {
-			compatible = "fixed-clock";
-			reg = <0>;
-			#clock-cells = <0>;
-			clock-frequency = <32768>;
-		};
+	clk32k_in: clock@0 {
+		compatible = "fixed-clock";
+		clock-frequency = <32768>;
+		#clock-cells = <0>;
 	};
 
 	gpio-keys {
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
index 4a354f5293fc..b888efcea86f 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
@@ -566,17 +566,10 @@ mmc@700b0400 {
 		wakeup-source;
 	};
 
-	clocks {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		clk32k_in: clock@0 {
-			compatible = "fixed-clock";
-			reg = <0>;
-			#clock-cells = <0>;
-			clock-frequency = <32768>;
-		};
+	clk32k_in: clock@0 {
+		compatible = "fixed-clock";
+		clock-frequency = <32768>;
+		#clock-cells = <0>;
 	};
 
 	cpus {
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
index 9f630ecc06bc..a28ca6620b86 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
@@ -1722,17 +1722,10 @@ agic@702f9000 {
 		};
 	};
 
-	clocks {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		clk32k_in: clock@0 {
-			compatible = "fixed-clock";
-			reg = <0>;
-			#clock-cells = <0>;
-			clock-frequency = <32768>;
-		};
+	clk32k_in: clock@0 {
+		compatible = "fixed-clock";
+		clock-frequency = <32768>;
+		#clock-cells = <0>;
 	};
 
 	cpus {
-- 
2.24.1


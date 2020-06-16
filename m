Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6348D1FB2E8
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Jun 2020 15:55:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726261AbgFPNzx (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 Jun 2020 09:55:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728899AbgFPNzj (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Jun 2020 09:55:39 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71975C061573
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:55:37 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id u26so2328208wmn.1
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bBKWHGHQksDjrw0nOPTNv9iHoiSsRb/lXyTILUGktv8=;
        b=cCFX8dTs4e2OCDPmdaO7ATK7QjqsNpALC6hVhD1+AU/0ntNvIsvB3H8zBZ/uFFc75w
         qku6UeryqhZ0l6m9vJkXYH6H8Fy3GFX9gYh4TAjjdpd8fYNi7wlleDC8G8mjSLwFHVTR
         RcDxQ0hUaJ2F3L/V9d0q+z76moAjBU1HAnd7079TI0jC4DVjjDChdfkutJrmmKdQArLv
         njiZT/Cp4pJqyuw7gqRVMCqaOXPVAQZ49AI7OZVqlvUfQ2gGDCXyNXlV6kxA+5gMm4cG
         1O7LD/3NheGbLDFIMgAaOBHGduRGCXIa60MkotZ8cUiDC+n0hJyRiWdlKB0RRJT0YSl6
         g6ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bBKWHGHQksDjrw0nOPTNv9iHoiSsRb/lXyTILUGktv8=;
        b=tz9Hb6G1CpygenypbKzwvmTJfiL8m3LjvxLXDwYZi/g2XJqni2RlqlbJPbyIml54rq
         tzSgAvt9cM9TBO3qFJA759+DhkhV2lTIZ5CNL93OA/T0ISdBlwCKhg0FPj53+Yb+wchg
         kfLJv6t8DO6w/hOdkmS91LXW9VELgOkxNwDFIsFtL1E7PhJAPpY7iBe23q7BxQN3CjpZ
         l+1C9hE+meuwgSB6Y5c/sbtwv8XYt3Zbw1nvlFpzcN7bRbKaMk1kUjEiylHgef+QT8VY
         L5Nd2yiq3CU5ubjkH0Ty6vshBUAafOmFEc3DbwZ7ogU24jT9GTSxKoa+uDz9y7XiKQIS
         FhFg==
X-Gm-Message-State: AOAM5305QUEimc632tM1KLYH86JZh5nZ7LqPvytaFPiz82/6QX4G+kaw
        sBOeGunwPOVt57/kGOqFWYu3KFRI
X-Google-Smtp-Source: ABdhPJxNJ47IpunG6CRgQ89e+Pj8DyyvCKQ2Nj/c0UfBNFXO4AWnir4DfjDN/nN5xA50sIfOEkE1DA==
X-Received: by 2002:a1c:4887:: with SMTP id v129mr3206229wma.184.1592315736176;
        Tue, 16 Jun 2020 06:55:36 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id 67sm30309379wrk.49.2020.06.16.06.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 06:55:35 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 72/73] arm64: tegra: Rename cbb@0 to bus@0 on Tegra194
Date:   Tue, 16 Jun 2020 15:52:37 +0200
Message-Id: <20200616135238.3001888-73-thierry.reding@gmail.com>
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

The control backbone is a simple-bus and hence its device tree node
should be named "bus@<unit-address>" according to the bindings.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../arm64/boot/dts/nvidia/tegra194-p2888.dtsi | 22 +++++++++----------
 .../boot/dts/nvidia/tegra194-p2972-0000.dts   | 10 ++++-----
 arch/arm64/boot/dts/nvidia/tegra194.dtsi      |  2 +-
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
index 6f2c0754c870..cefbd0000357 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
@@ -8,18 +8,18 @@ / {
 	compatible = "nvidia,p2888", "nvidia,tegra194";
 
 	aliases {
-		ethernet0 = "/cbb@0/ethernet@2490000";
-		mmc0 = "/cbb@0/mmc@3460000";
-		mmc1 = "/cbb@0/mmc@3400000";
+		ethernet0 = "/bus@0/ethernet@2490000";
+		mmc0 = "/bus@0/mmc@3460000";
+		mmc1 = "/bus@0/mmc@3400000";
 		serial0 = &tcu;
 		i2c0 = "/bpmp/i2c";
-		i2c1 = "/cbb@0/i2c@3160000";
-		i2c2 = "/cbb@0/i2c@c240000";
-		i2c3 = "/cbb@0/i2c@3180000";
-		i2c4 = "/cbb@0/i2c@3190000";
-		i2c5 = "/cbb@0/i2c@31c0000";
-		i2c6 = "/cbb@0/i2c@c250000";
-		i2c7 = "/cbb@0/i2c@31e0000";
+		i2c1 = "/bus@0/i2c@3160000";
+		i2c2 = "/bus@0/i2c@c240000";
+		i2c3 = "/bus@0/i2c@3180000";
+		i2c4 = "/bus@0/i2c@3190000";
+		i2c5 = "/bus@0/i2c@31c0000";
+		i2c6 = "/bus@0/i2c@c250000";
+		i2c7 = "/bus@0/i2c@31e0000";
 	};
 
 	chosen {
@@ -27,7 +27,7 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
-	cbb@0 {
+	bus@0 {
 		ethernet@2490000 {
 			status = "okay";
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
index 0f9868b6fd6b..90b6ea5467fa 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
@@ -10,7 +10,7 @@ / {
 	model = "NVIDIA Jetson AGX Xavier Developer Kit";
 	compatible = "nvidia,p2972-0000", "nvidia,tegra194";
 
-	cbb@0 {
+	bus@0 {
 		aconnect@2900000 {
 			status = "okay";
 
@@ -93,10 +93,10 @@ usb3-3 {
 		usb@3610000 {
 			status = "okay";
 
-			phys =	<&{/cbb@0/padctl@3520000/pads/usb2/lanes/usb2-1}>,
-				<&{/cbb@0/padctl@3520000/pads/usb2/lanes/usb2-3}>,
-				<&{/cbb@0/padctl@3520000/pads/usb3/lanes/usb3-0}>,
-				<&{/cbb@0/padctl@3520000/pads/usb3/lanes/usb3-3}>;
+			phys =	<&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-1}>,
+				<&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-3}>,
+				<&{/bus@0/padctl@3520000/pads/usb3/lanes/usb3-0}>,
+				<&{/bus@0/padctl@3520000/pads/usb3/lanes/usb3-3}>;
 			phy-names = "usb2-1", "usb2-3", "usb3-0", "usb3-3";
 		};
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 307f999edbf9..ea629dae6880 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -16,7 +16,7 @@ / {
 	#size-cells = <2>;
 
 	/* control backbone */
-	cbb@0 {
+	bus@0 {
 		compatible = "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
2.24.1


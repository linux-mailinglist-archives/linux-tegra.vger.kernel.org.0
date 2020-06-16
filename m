Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F16E1FB2DA
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Jun 2020 15:55:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728997AbgFPNzP (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 Jun 2020 09:55:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728553AbgFPNzO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Jun 2020 09:55:14 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05A7AC06174E
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:55:14 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id d128so3182187wmc.1
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5UaeiYULrewUtGThWV95Xt3+CgB3hdR6MxdVeCxs+eU=;
        b=BbG8JMK4tEiZ0a2HH5vQb9gMCG84W2N5EGnIixOTYaqZ/4yn/FDrGR5qKk7J+fJN2j
         l5MiPzMoKpgbxClG4i2DXZWTfkO6oSxKjfFGyC2yeVjzmwKJg+snkWRNDI9qn/LLNSEP
         q2yE1ZZNykudgaJinVIB2JrpMbOriHb/gES1qM2JTtzzbCLuBeDLmB6UZQXujYUJHXyS
         R+aNafBH9Y2iS0gQXNdwdUDW51MOQ0h8ylCQfAKECO4WVW2617VQQvrTbFOf5EaQ3AUy
         7bbld7Bwq/A+SbnVkvlhFLXXXBaYgRU08A7h0GOPUuDBv+KZz0P44WTjk3Y4pQPL5KUc
         DJxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5UaeiYULrewUtGThWV95Xt3+CgB3hdR6MxdVeCxs+eU=;
        b=kBdBJTIpZ85Dawfa6mTK9srIWiHS6079+hMzPMhRAzost6/pavUsm0qzz3lE7ayebd
         Mlie6WmZREH3/Valch1VuK64Licscx7GgLoMVKbbIMqp5W5me0NYdy40zbKiKmpoE32Z
         L64BlgIYXvoekQln/tqE69znakztIkjZC6qStK8ULaBAY0QmEbev+dvTRX0f4ge5GTKb
         PVFYuY2rdYBX9Qm6Y550DOKeeiGY1j2T/67rzKLk7FQHuJZbDMDcgW2PBrfRJOOkMPZ5
         bofvUCO9eOOgecpPHpItVrhL3S5SWQWXnlzqkRZP/SWV+p1pshE03G77REcbtGByKtTJ
         pckw==
X-Gm-Message-State: AOAM532odkIi1bqjDsxhwcv/zhd4hSqD3t0WrTl2czdEdDXR18tNbDPh
        o0JfwMk3rKhmrOD5l1z5Kdk=
X-Google-Smtp-Source: ABdhPJx0YWWE5EwMSLqluEDsr0Na6X/CXb8aWgF9NZ01YYq2d32S8wQk3UtDXGfxw0Z+zyfFUmAI8w==
X-Received: by 2002:a7b:c1c5:: with SMTP id a5mr3293085wmj.35.1592315712791;
        Tue, 16 Jun 2020 06:55:12 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id u130sm4293586wmg.32.2020.06.16.06.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 06:55:12 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 61/73] arm64: tegra: Update USB connector nodes
Date:   Tue, 16 Jun 2020 15:52:26 +0200
Message-Id: <20200616135238.3001888-62-thierry.reding@gmail.com>
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

Use the preferred {id,vbus}-gpios over the {id,vbus}-gpio properties and
fix the ordering of compatible strings (most-specific ones should come
first).

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 15 +++++++--------
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi    | 12 ++++++------
 .../arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 10 +++++-----
 3 files changed, 18 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
index 482ed7b0fcff..4a7a022acabb 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
@@ -171,19 +171,18 @@ usb2-0 {
 				status = "okay";
 				mode = "otg";
 				vbus-supply = <&vdd_usb0>;
-
 				usb-role-switch;
+
 				connector {
-					compatible = "usb-b-connector",
-						     "gpio-usb-b-connector";
+					compatible = "gpio-usb-b-connector",
+						     "usb-b-connector";
 					label = "micro-USB";
 					type = "micro";
-					vbus-gpio = <&gpio
-						     TEGRA186_MAIN_GPIO(X, 7)
-						     GPIO_ACTIVE_LOW>;
-					id-gpio = <&pmic 0 GPIO_ACTIVE_HIGH>;
+					vbus-gpios = <&gpio
+						      TEGRA186_MAIN_GPIO(X, 7)
+						      GPIO_ACTIVE_LOW>;
+					id-gpios = <&pmic 0 GPIO_ACTIVE_HIGH>;
 				};
-
 			};
 
 			usb2-1 {
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
index 4771c1668825..3ba36a52dc89 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
@@ -1456,17 +1456,17 @@ ports {
 			usb2-0 {
 				status = "okay";
 				vbus-supply = <&vdd_usb_vbus_otg>;
+				usb-role-switch;
 				mode = "otg";
 
-				usb-role-switch;
 				connector {
-					compatible = "usb-b-connector",
-						     "gpio-usb-b-connector";
+					compatible = "gpio-usb-b-connector",
+						     "usb-b-connector";
 					label = "micro-USB";
 					type = "micro";
-					vbus-gpio = <&gpio TEGRA_GPIO(Z, 0)
-						     GPIO_ACTIVE_LOW>;
-					id-gpio = <&pmic 0 0>;
+					vbus-gpios = <&gpio TEGRA_GPIO(Z, 0)
+						      GPIO_ACTIVE_LOW>;
+					id-gpios = <&pmic 0 GPIO_ACTIVE_HIGH>;
 				};
 			};
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
index d7a4eced0149..ac17f5485bf8 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
@@ -505,15 +505,15 @@ ports {
 			usb2-0 {
 				status = "okay";
 				mode = "peripheral";
-
 				usb-role-switch;
+
 				connector {
-					compatible = "usb-b-connector",
-						     "gpio-usb-b-connector";
+					compatible = "gpio-usb-b-connector",
+						     "usb-b-connector";
 					label = "micro-USB";
 					type = "micro";
-					vbus-gpio = <&gpio TEGRA_GPIO(CC, 4)
-						     GPIO_ACTIVE_LOW>;
+					vbus-gpios = <&gpio TEGRA_GPIO(CC, 4)
+						      GPIO_ACTIVE_LOW>;
 				};
 			};
 
-- 
2.24.1


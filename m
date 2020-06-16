Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3311E1FB2C8
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Jun 2020 15:54:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728803AbgFPNyz (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 Jun 2020 09:54:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728861AbgFPNyp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Jun 2020 09:54:45 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 987ABC06174E
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:54:43 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id y20so3176471wmi.2
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ytqTh+kTWlnZfJuxwwVWTJACCDgvempJvvH6tFFOXFU=;
        b=bXdMiZu03lvE9CltL5rSgPkeBoPYNH1oGzT5yOyLppp3YSHydBwL/oHK5sdi8rmhHX
         kAblZ+PC4o4iJYED9XUmlzwT3NpL/qIDml83AuR8xPXKzr4347NhMQGA8TcNp2V6sUwW
         R7gj6djhkiC1v3zs54D4PwTrWs4H4OYx8T67mOL9aOzxJIFkw9wGaCgy4YLNNQ80odP/
         mJUK5ejQ0UH8I8+vxaQAQoe9qK6uxpc3yWx5H8xGRed+lyLdXrLtpcrro9UQz+ZH80WQ
         T1fRixVLUGC5SsL6x4LFJ07w9AYTA0frLsCD1x9yybwES8bZm7v1SfDoQGBuSrcxrgwy
         QYBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ytqTh+kTWlnZfJuxwwVWTJACCDgvempJvvH6tFFOXFU=;
        b=MZTP62aCbAWxD6nRiLI4z0wmwAGXg1vDP3pc45/pAMzpEf9hzfLU0xWHEPS4V08S7L
         jII76CkTHWyxyD6dyqt3SgiNFoL6bdr+gx3Jvqgohz5U4JntGOZB8gnTnms4+itpDw2a
         OttFipeRJLw3ZvQkuzbzMhrGLXbdZybLDhDLMkv3EpIINg3O4n3OazAAr+QX+As3prUT
         /rX48jK1RdgORqe/UXs3rijwLO4+Ma5spPzLFMxQwu/wphFYhDnYgq3uVaNiwN1BcEn5
         IxUdxIMvXb5RePwmcJLdqbvab88/UXeEYS3OkxFXhsjwlGdsPf0RyVqPtssxfpSEjNIW
         Xm5Q==
X-Gm-Message-State: AOAM53279nx/tfJPBSW29Zo0wdt0E7jIhxu1TLOH/8SwqQ/6s/F3oCMs
        /cgc+f+la6evpmk5YcqAqU4=
X-Google-Smtp-Source: ABdhPJx5sy9FeRaCYCdCy87CmtWJBYzYrzYImO8BWe9FQBtUFDP1l/dI/aHIBKwsomhHi69hQxBHog==
X-Received: by 2002:a1c:a1c5:: with SMTP id k188mr3518096wme.41.1592315682262;
        Tue, 16 Jun 2020 06:54:42 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id r12sm30954918wrc.22.2020.06.16.06.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 06:54:41 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 47/73] arm64: tegra: Fixup I/O and PLL supply names for HDMI/DP
Date:   Tue, 16 Jun 2020 15:52:12 +0200
Message-Id: <20200616135238.3001888-48-thierry.reding@gmail.com>
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

The I/O and PLL supplies used for HDMI/DP have alternative names. Use
the names that are given in the hardware documentation for consistency.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 4 ++--
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts | 4 ++--
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     | 4 ++--
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
index 1af7f9ffb7b6..f35b0ba29cb5 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
@@ -286,8 +286,8 @@ sor@15540000 {
 		sor@15580000 {
 			status = "okay";
 
-			avdd-io-supply = <&vdd_hdmi_1v05>;
-			vdd-pll-supply = <&vdd_1v8_ap>;
+			avdd-io-hdmi-dp-supply = <&vdd_hdmi_1v05>;
+			vdd-hdmi-dp-pll-supply = <&vdd_1v8_ap>;
 			hdmi-supply = <&vdd_hdmi>;
 
 			nvidia,ddc-i2c-bus = <&ddc>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
index e15d1eac05f5..9a7d136b467f 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
@@ -145,8 +145,8 @@ sor@15b40000 {
 			sor@15b80000 {
 				status = "okay";
 
-				avdd-io-supply = <&vdd_1v0>;
-				vdd-pll-supply = <&vdd_1v8hs>;
+				avdd-io-hdmi-dp-supply = <&vdd_1v0>;
+				vdd-hdmi-dp-pll-supply = <&vdd_1v8hs>;
 				hdmi-supply = <&vdd_hdmi>;
 
 				nvidia,ddc-i2c-bus = <&ddc>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
index 5c3771e8d683..f72afdf547ee 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
@@ -27,8 +27,8 @@ csi@838 {
 		sor@54580000 {
 			status = "okay";
 
-			avdd-io-supply = <&avdd_1v05>;
-			vdd-pll-supply = <&vdd_1v8>;
+			avdd-io-hdmi-dp-supply = <&avdd_1v05>;
+			vdd-hdmi-dp-pll-supply = <&vdd_1v8>;
 			hdmi-supply = <&vdd_hdmi>;
 
 			nvidia,ddc-i2c-bus = <&hdmi_ddc>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
index ced01d15e457..e7ebf1afeb7a 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
@@ -74,8 +74,8 @@ sor@54540000 {
 		sor@54580000 {
 			status = "okay";
 
-			avdd-io-supply = <&avdd_1v05>;
-			vdd-pll-supply = <&vdd_1v8>;
+			avdd-io-hdmi-dp-supply = <&avdd_1v05>;
+			vdd-hdmi-dp-pll-supply = <&vdd_1v8>;
 			hdmi-supply = <&vdd_hdmi>;
 
 			nvidia,ddc-i2c-bus = <&hdmi_ddc>;
-- 
2.24.1


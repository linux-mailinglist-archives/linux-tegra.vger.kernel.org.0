Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C5A81FB29B
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Jun 2020 15:53:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728959AbgFPNxZ (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 Jun 2020 09:53:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728740AbgFPNxX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Jun 2020 09:53:23 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10F03C061755
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:53:22 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id b82so2978609wmb.1
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sltisSwSDb4vZTWSDf6iNnpKJG7q/Z1Zz8yhqClsgiw=;
        b=IQm8uHieQl4l0fZ9aX4OOFW9UhUTrAwDF4VPzVjuKMFTv9fFwcz5xTe/Qxk6Fm93GF
         4yDxWXtSBwlZ5Ur5n1VtHLy+xL3ibbPYg/Cnd4VyuqEc8F96SAs7pVlzkidvQI/XBpD6
         +QYpYOayvhJKvdAd54lD/+l36kyv21cdUe7TB8DEZvuqfAsYWPBJ5tLVJhYjjreFLRq6
         vWAm8mJDVtsEeQMywhuiBSBBbpJB2kBHmPlOhO8/QY8rETGlIQeXdt38/KA6czg5lwUW
         3TFqRGkDcGTs2EeQB4LP4usH2tcXIP8sXV6otU/2DpkB5b6bkw/Mve/7fNYfzLxPHnr6
         vh1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sltisSwSDb4vZTWSDf6iNnpKJG7q/Z1Zz8yhqClsgiw=;
        b=kea/CPIvxIY3GDFWzupjtYIrvoRZFHNKeL4pdMaWLmLP8pzld+l/W4vttFxuFMoOsh
         4mi9RGCuRHDttcYaJbaN6g5tfmigKsEhOOCprY9XpzzBgyhqXYeXFgQnxcAb+VRdv4oL
         a6G2NEESoLG92uBJkXOFnguSA0jx4R773kmylAxzI8zCFiAp9/NGOvYAuJVYk/O1RKX5
         TdZe9MbmSVt68+0AFXMESU6U3TtXi6lg8PIs9Zbk/vkdwFZcwfTK6cLQeR7KzxqfrCdu
         YDiRR+P1xnyKL2IwtnrHrGx/5YfsxKkpks9cfmeGVW+zJa2uEkedFy2MFzWPV2S8bZ0L
         fEKQ==
X-Gm-Message-State: AOAM531knwgJXjJvFfZBWRJL0XapbhKU4XHk0mlwycs0Y9PkuJ/KsL5W
        vGAr1TfVDn8qMnIAw7UFBcs=
X-Google-Smtp-Source: ABdhPJxz+/WkHdLvzaQjBQXQEbkXuzkgfpaKe6bCAJRcfdcCysuzOrn7cZPPl0/Qr9+nrLVEgsFt6w==
X-Received: by 2002:a1c:7505:: with SMTP id o5mr3277219wmc.164.1592315600776;
        Tue, 16 Jun 2020 06:53:20 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id d5sm31603455wrb.14.2020.06.16.06.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 06:53:19 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 15/73] ARM: tegra: Add missing #phy-cells property to USB PHYs
Date:   Tue, 16 Jun 2020 15:51:40 +0200
Message-Id: <20200616135238.3001888-16-thierry.reding@gmail.com>
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

USB PHYs must have a #phy-cells property, so add one to the Tegra USB
PHYs which don't have one.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/tegra114.dtsi | 2 ++
 arch/arm/boot/dts/tegra124.dtsi | 3 +++
 arch/arm/boot/dts/tegra20.dtsi  | 3 +++
 arch/arm/boot/dts/tegra30.dtsi  | 3 +++
 4 files changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi
index 88632d8d0bde..d28d35dc3f5c 100644
--- a/arch/arm/boot/dts/tegra114.dtsi
+++ b/arch/arm/boot/dts/tegra114.dtsi
@@ -710,6 +710,7 @@ phy1: usb-phy@7d000000 {
 		clock-names = "reg", "pll_u", "utmi-pads";
 		resets = <&tegra_car 22>, <&tegra_car 22>;
 		reset-names = "usb", "utmi-pads";
+		#phy-cells = <0>;
 		nvidia,hssync-start-delay = <0>;
 		nvidia,idle-wait-delay = <17>;
 		nvidia,elastic-limit = <16>;
@@ -746,6 +747,7 @@ phy3: usb-phy@7d008000 {
 		clock-names = "reg", "pll_u", "utmi-pads";
 		resets = <&tegra_car 59>, <&tegra_car 22>;
 		reset-names = "usb", "utmi-pads";
+		#phy-cells = <0>;
 		nvidia,hssync-start-delay = <0>;
 		nvidia,idle-wait-delay = <17>;
 		nvidia,elastic-limit = <16>;
diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
index 76c1ef923213..f00e962c8f55 100644
--- a/arch/arm/boot/dts/tegra124.dtsi
+++ b/arch/arm/boot/dts/tegra124.dtsi
@@ -1056,6 +1056,7 @@ phy1: usb-phy@7d000000 {
 		clock-names = "reg", "pll_u", "utmi-pads";
 		resets = <&tegra_car 22>, <&tegra_car 22>;
 		reset-names = "usb", "utmi-pads";
+		#phy-cells = <0>;
 		nvidia,hssync-start-delay = <0>;
 		nvidia,idle-wait-delay = <17>;
 		nvidia,elastic-limit = <16>;
@@ -1093,6 +1094,7 @@ phy2: usb-phy@7d004000 {
 		clock-names = "reg", "pll_u", "utmi-pads";
 		resets = <&tegra_car 58>, <&tegra_car 22>;
 		reset-names = "usb", "utmi-pads";
+		#phy-cells = <0>;
 		nvidia,hssync-start-delay = <0>;
 		nvidia,idle-wait-delay = <17>;
 		nvidia,elastic-limit = <16>;
@@ -1129,6 +1131,7 @@ phy3: usb-phy@7d008000 {
 		clock-names = "reg", "pll_u", "utmi-pads";
 		resets = <&tegra_car 59>, <&tegra_car 22>;
 		reset-names = "usb", "utmi-pads";
+		#phy-cells = <0>;
 		nvidia,hssync-start-delay = <0>;
 		nvidia,idle-wait-delay = <17>;
 		nvidia,elastic-limit = <16>;
diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index 9e71ed84bf28..77f6b3ee8418 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -735,6 +735,7 @@ phy1: usb-phy@c5000000 {
 		clock-names = "reg", "pll_u", "timer", "utmi-pads";
 		resets = <&tegra_car 22>, <&tegra_car 22>;
 		reset-names = "usb", "utmi-pads";
+		#phy-cells = <0>;
 		nvidia,has-legacy-mode;
 		nvidia,hssync-start-delay = <9>;
 		nvidia,idle-wait-delay = <17>;
@@ -769,6 +770,7 @@ phy2: usb-phy@c5004000 {
 		clock-names = "reg", "pll_u", "ulpi-link";
 		resets = <&tegra_car 58>, <&tegra_car 22>;
 		reset-names = "usb", "utmi-pads";
+		#phy-cells = <0>;
 		status = "disabled";
 	};
 
@@ -795,6 +797,7 @@ phy3: usb-phy@c5008000 {
 		clock-names = "reg", "pll_u", "timer", "utmi-pads";
 		resets = <&tegra_car 59>, <&tegra_car 22>;
 		reset-names = "usb", "utmi-pads";
+		#phy-cells = <0>;
 		nvidia,hssync-start-delay = <9>;
 		nvidia,idle-wait-delay = <17>;
 		nvidia,elastic-limit = <16>;
diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index 536cc5629440..3d0515f6db51 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -914,6 +914,7 @@ phy1: usb-phy@7d000000 {
 		clock-names = "reg", "pll_u", "utmi-pads";
 		resets = <&tegra_car 22>, <&tegra_car 22>;
 		reset-names = "usb", "utmi-pads";
+		#phy-cells = <0>;
 		nvidia,hssync-start-delay = <9>;
 		nvidia,idle-wait-delay = <17>;
 		nvidia,elastic-limit = <16>;
@@ -951,6 +952,7 @@ phy2: usb-phy@7d004000 {
 		clock-names = "reg", "pll_u", "utmi-pads";
 		resets = <&tegra_car 58>, <&tegra_car 22>;
 		reset-names = "usb", "utmi-pads";
+		#phy-cells = <0>;
 		nvidia,hssync-start-delay = <9>;
 		nvidia,idle-wait-delay = <17>;
 		nvidia,elastic-limit = <16>;
@@ -987,6 +989,7 @@ phy3: usb-phy@7d008000 {
 		clock-names = "reg", "pll_u", "utmi-pads";
 		resets = <&tegra_car 59>, <&tegra_car 22>;
 		reset-names = "usb", "utmi-pads";
+		#phy-cells = <0>;
 		nvidia,hssync-start-delay = <0>;
 		nvidia,idle-wait-delay = <17>;
 		nvidia,elastic-limit = <16>;
-- 
2.24.1


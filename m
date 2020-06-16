Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BDFD1FB29D
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Jun 2020 15:53:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728934AbgFPNx2 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 Jun 2020 09:53:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728740AbgFPNx1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Jun 2020 09:53:27 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98754C061573
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:53:26 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id c3so20830965wru.12
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VM2Uwlxmoyqxqf++qM2jVkcD2n9DPZyWR9dCi4gsAdw=;
        b=QAn1YfzVPxQVb/ExSyLi53MVIDGtqXBgkOsCVDPNyK4aZa0lWfgewDZjsGJGdrks6x
         8psTIlK8eleaX6r8kKePDhjcQmsogwxs/i3H0rZDQbWOZjOF0dCF49LUQpWL5d+rstzL
         rxvGHnc1pm6Vy6adAIMaToXZ/gEkBGT1K4JLxjkD0tyqOEF5RMITJmzC1ByW2xgJEJLO
         5w0ft88PlnqlQKh9+MJTJ87YRQ89WDioM4brucOEau3UnfS5Ce8bcpidhAPLQ3t7lTXE
         Mq6m9QGz+hUf9LLrdJDniHzhYMQAKDfftu+TKlg1jvKokjh/UP3ITkoZ8Vw5ueExPHJn
         VVXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VM2Uwlxmoyqxqf++qM2jVkcD2n9DPZyWR9dCi4gsAdw=;
        b=IRQtS/DMSn727ULGQgxrAurXevtYvYdUAbXhUdtsOZz20fAw68BZGB18nypdPgTWKt
         xmU/c3qmsqJ0h7vJIHSr1CqzfKXf+qe8YQGz91/2aXdofuz3wAPIhvar46YWAlLZlbow
         Ac7KwKvadvuBDpDMifAO0OX7W65/L/InPvhHZoQSQJWylGMX2zBl9BU2XtB/5d2Kwj5Y
         bS07q+yjKoUA1CifvZe3UUiOv1dybkRbR6jsX9FML3xIkWjhpOWo9CANU2+TQ+UoulTO
         2rEX1cU9H7f82PNsMVGW+SY3Ynu/LXTHH6jV4Pe2q8fHEJq2AfDvW213/DR2luAp+xGr
         PA9w==
X-Gm-Message-State: AOAM530V/rtSEfRtegNf9TctmSXOawh/YD0fP0Z+//NEA5kLIa5PiZih
        sYtFDmicn8YOS9sAUcmG8l4=
X-Google-Smtp-Source: ABdhPJxkd5boKMHlXcRPjf4VcFJelnMCq2KbESn2B6zNccuUzABz46iN6hBbkFS3L2rweq1Pl0jF0w==
X-Received: by 2002:adf:ea11:: with SMTP id q17mr3119598wrm.75.1592315605195;
        Tue, 16 Jun 2020 06:53:25 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id l2sm28735784wru.58.2020.06.16.06.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 06:53:24 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Marcel Ziswiler <marcel.ziswiler@toradex.com>,
        Philippe Schenker <philippe.schenker@toradex.com>
Subject: [PATCH 17/73] ARM: tegra: Name GPIO hog nodes consistently
Date:   Tue, 16 Jun 2020 15:51:42 +0200
Message-Id: <20200616135238.3001888-18-thierry.reding@gmail.com>
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

Use the common gpios- prefix for GPIO hog node names to make it clear
that they are all hogs. This helps with json-schema based validation.

Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Cc: Philippe Schenker <philippe.schenker@toradex.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/tegra124-apalis-eval.dts      | 2 +-
 arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts | 2 +-
 arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi     | 4 ++--
 arch/arm/boot/dts/tegra124-apalis.dtsi          | 4 ++--
 arch/arm/boot/dts/tegra20-colibri.dtsi          | 6 +++---
 arch/arm/boot/dts/tegra30-apalis-eval.dts       | 2 +-
 arch/arm/boot/dts/tegra30-apalis-v1.1-eval.dts  | 2 +-
 arch/arm/boot/dts/tegra30-colibri.dtsi          | 2 +-
 8 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/tegra124-apalis-eval.dts b/arch/arm/boot/dts/tegra124-apalis-eval.dts
index 28c29b6813a7..89fafa39aa2a 100644
--- a/arch/arm/boot/dts/tegra124-apalis-eval.dts
+++ b/arch/arm/boot/dts/tegra124-apalis-eval.dts
@@ -246,7 +246,7 @@ reg_usbh_vbus: regulator-usbh-vbus {
 
 &gpio {
 	/* Apalis GPIO7 MXM3 pin 15 PLX PEX 8605 PCIe Switch Reset */
-	pex-perst-n {
+	gpios-pex-perst-n {
 		gpio-hog;
 		gpios = <TEGRA_GPIO(DD, 1) GPIO_ACTIVE_HIGH>;
 		output-high;
diff --git a/arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts b/arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts
index f3afde410615..441a244ef6c1 100644
--- a/arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts
+++ b/arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts
@@ -248,7 +248,7 @@ reg_usbh_vbus: regulator-usbh-vbus {
 
 &gpio {
 	/* Apalis GPIO7 MXM3 pin 15 PLX PEX 8605 PCIe Switch Reset */
-	pex-perst-n {
+	gpios-pex-perst-n {
 		gpio-hog;
 		gpios = <TEGRA_GPIO(DD, 1) GPIO_ACTIVE_HIGH>;
 		output-high;
diff --git a/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi b/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
index 0d6890af457e..eb5f4ad0fe71 100644
--- a/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
+++ b/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
@@ -2048,7 +2048,7 @@ gpu-shutdown-trip {
 
 &gpio {
 	/* I210 Gigabit Ethernet Controller Reset */
-	lan-reset-n {
+	gpios-lan-reset-n {
 		gpio-hog;
 		gpios = <TEGRA_GPIO(S, 2) GPIO_ACTIVE_HIGH>;
 		output-high;
@@ -2056,7 +2056,7 @@ lan-reset-n {
 	};
 
 	/* Control MXM3 pin 26 Reset Module Output Carrier Input */
-	reset-moci-ctrl {
+	gpios-reset-moci-ctrl {
 		gpio-hog;
 		gpios = <TEGRA_GPIO(U, 4) GPIO_ACTIVE_HIGH>;
 		output-high;
diff --git a/arch/arm/boot/dts/tegra124-apalis.dtsi b/arch/arm/boot/dts/tegra124-apalis.dtsi
index 8857a11332c2..64a18b525378 100644
--- a/arch/arm/boot/dts/tegra124-apalis.dtsi
+++ b/arch/arm/boot/dts/tegra124-apalis.dtsi
@@ -2040,7 +2040,7 @@ gpu-shutdown-trip {
 
 &gpio {
 	/* I210 Gigabit Ethernet Controller Reset */
-	lan-reset-n {
+	gpios-lan-reset-n {
 		gpio-hog;
 		gpios = <TEGRA_GPIO(S, 2) GPIO_ACTIVE_HIGH>;
 		output-high;
@@ -2048,7 +2048,7 @@ lan-reset-n {
 	};
 
 	/* Control MXM3 pin 26 Reset Module Output Carrier Input */
-	reset-moci-ctrl {
+	gpios-reset-moci-ctrl {
 		gpio-hog;
 		gpios = <TEGRA_GPIO(U, 4) GPIO_ACTIVE_HIGH>;
 		output-high;
diff --git a/arch/arm/boot/dts/tegra20-colibri.dtsi b/arch/arm/boot/dts/tegra20-colibri.dtsi
index 6162d193e12c..90f317117298 100644
--- a/arch/arm/boot/dts/tegra20-colibri.dtsi
+++ b/arch/arm/boot/dts/tegra20-colibri.dtsi
@@ -743,7 +743,7 @@ sound {
 };
 
 &gpio {
-	lan-reset-n {
+	gpios-lan-reset-n {
 		gpio-hog;
 		gpios = <TEGRA_GPIO(V, 4) GPIO_ACTIVE_HIGH>;
 		output-high;
@@ -751,7 +751,7 @@ lan-reset-n {
 	};
 
 	/* Tri-stating GMI_WR_N on SODIMM pin 99 nPWE */
-	npwe {
+	gpios-npwe {
 		gpio-hog;
 		gpios = <TEGRA_GPIO(T, 5) GPIO_ACTIVE_HIGH>;
 		output-high;
@@ -759,7 +759,7 @@ npwe {
 	};
 
 	/* Not tri-stating GMI_WR_N on SODIMM pin 93 RDnWR */
-	rdnwr {
+	gpios-rdnwr {
 		gpio-hog;
 		gpios = <TEGRA_GPIO(T, 6) GPIO_ACTIVE_HIGH>;
 		output-low;
diff --git a/arch/arm/boot/dts/tegra30-apalis-eval.dts b/arch/arm/boot/dts/tegra30-apalis-eval.dts
index 9f653ef41da4..01b2a9db77c8 100644
--- a/arch/arm/boot/dts/tegra30-apalis-eval.dts
+++ b/arch/arm/boot/dts/tegra30-apalis-eval.dts
@@ -239,7 +239,7 @@ reg_usbh_vbus: regulator-usbh-vbus {
 
 &gpio {
 	/* Apalis GPIO7 MXM3 pin 15 PLX PEX 8605 PCIe Switch Reset */
-	pex-perst-n {
+	gpios-pex-perst-n {
 		gpio-hog;
 		gpios = <TEGRA_GPIO(S, 7) GPIO_ACTIVE_HIGH>;
 		output-high;
diff --git a/arch/arm/boot/dts/tegra30-apalis-v1.1-eval.dts b/arch/arm/boot/dts/tegra30-apalis-v1.1-eval.dts
index dc633e529822..d5a244351137 100644
--- a/arch/arm/boot/dts/tegra30-apalis-v1.1-eval.dts
+++ b/arch/arm/boot/dts/tegra30-apalis-v1.1-eval.dts
@@ -257,7 +257,7 @@ reg_vddio_sdmmc3: regulator-vddio-sdmmc3 {
 
 &gpio {
 	/* Apalis GPIO7 MXM3 pin 15 PLX PEX 8605 PCIe Switch Reset */
-	pex-perst-n {
+	gpios-pex-perst-n {
 		gpio-hog;
 		gpios = <TEGRA_GPIO(S, 7) GPIO_ACTIVE_HIGH>;
 		output-high;
diff --git a/arch/arm/boot/dts/tegra30-colibri.dtsi b/arch/arm/boot/dts/tegra30-colibri.dtsi
index 933087ee45a8..c209020e13fd 100644
--- a/arch/arm/boot/dts/tegra30-colibri.dtsi
+++ b/arch/arm/boot/dts/tegra30-colibri.dtsi
@@ -1043,7 +1043,7 @@ sound {
 };
 
 &gpio {
-	lan-reset-n {
+	gpios-lan-reset-n {
 		gpio-hog;
 		gpios = <TEGRA_GPIO(DD, 0) GPIO_ACTIVE_HIGH>;
 		output-high;
-- 
2.24.1


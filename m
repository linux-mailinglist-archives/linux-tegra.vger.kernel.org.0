Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D81AB1FB29C
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Jun 2020 15:53:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728694AbgFPNx0 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 Jun 2020 09:53:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728957AbgFPNxZ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Jun 2020 09:53:25 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 701F8C061573
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:53:24 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id x6so20827895wrm.13
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sJr39yyI9C/ZJvW0g3qtF5zBH+JRNLr/9lqcD3hVnn4=;
        b=ge76C2STL0f+4pHYCR/B/zivH9wngVFJZySJe0vcYGTFXSEoJ8xYJ+3WqCGaVNI7f4
         Y/bVY0QaNLbAyvXip/dx0zWuaTtfUC1evAAtLHVehtCIUdzgOJoGNiohXmWvsPhssCQj
         Ig1qiw8vYOJJNXah/u2fTKkfGbkpe/b74HAcCRTRxEC9isCKYLuDy+O3PgJSu3WhnOGD
         F2148SvgkCvrKdcCB6QE1gdgEKdewPEFcpYWgeV975q0k0WXJCQc15J32KbW+mc61d3s
         +411O26aFDGS83qywohAvz+mBEgKGDx2SGHxNrewXe5TVrty9DzA4WcYLTNQc/8XoD6v
         6PlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sJr39yyI9C/ZJvW0g3qtF5zBH+JRNLr/9lqcD3hVnn4=;
        b=fGAliaUtY8G1rXQl5aGeEZXm/BE08FmVttFgjf1WfrwNWMTNFwVN246SvTNkphfY1u
         3nlvnWilgkQ6cHExe7OmjtC3IH4gPx1reJEghhgs2tk7Dsm/2q4FEy2tOO4ICPCekHsN
         nWvU+9/UVPxnDiNTRhOX4XbAs3dy6nk6O05cFXhTY3GLCWFbGGV/+liOshmcW9uyMAiF
         7cZFdLYnXxIMLmy1F0TbUamM4QXYvJ77/8+9eMYzgAv/uQ7JG3Ku/iN8dO+tzN+jEpD3
         wTP/7MDPylNdvSkxKmmvW7bphYSx65KuRfa9v1cQ4n2srQT7pSc351dTqgjbliQ97xb6
         7R9A==
X-Gm-Message-State: AOAM5327BTl8g7tPy/FSh8bfqtcTdcKXjGGym/YXmg1TheLifbVndtOC
        BfINQwVzzgUVHAFyc/yOj9U=
X-Google-Smtp-Source: ABdhPJyz6TTLW931mI4EuZycjFe/csNpCf2t8SIsQf8tt0+UuVUzftCJ0kkDFugJicecoimo3nNIAA==
X-Received: by 2002:a05:6000:1289:: with SMTP id f9mr3276316wrx.5.1592315603164;
        Tue, 16 Jun 2020 06:53:23 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id d5sm31603598wrb.14.2020.06.16.06.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 06:53:22 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Marcel Ziswiler <marcel.ziswiler@toradex.com>,
        Philippe Schenker <philippe.schenker@toradex.com>
Subject: [PATCH 16/73] ARM: tegra: Add missing #sound-dai-cells property to codecs
Date:   Tue, 16 Jun 2020 15:51:41 +0200
Message-Id: <20200616135238.3001888-17-thierry.reding@gmail.com>
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

Audio codecs need a #sound-dai-cells property, so add one to the audio
codecs on various Tegra-based boards that don't have one.

Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Cc: Philippe Schenker <philippe.schenker@toradex.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi | 1 +
 arch/arm/boot/dts/tegra124-apalis.dtsi      | 1 +
 arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi  | 1 +
 arch/arm/boot/dts/tegra30-apalis.dtsi       | 1 +
 arch/arm/boot/dts/tegra30-colibri.dtsi      | 1 +
 5 files changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi b/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
index 3fdc6ff32b0c..0d6890af457e 100644
--- a/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
+++ b/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
@@ -1559,6 +1559,7 @@ i2c@7000d000 {
 		sgtl5000: codec@a {
 			compatible = "fsl,sgtl5000";
 			reg = <0x0a>;
+			#sound-dai-cells = <0>;
 			VDDA-supply = <&reg_module_3v3_audio>;
 			VDDD-supply = <&reg_1v8_vddio>;
 			VDDIO-supply = <&reg_1v8_vddio>;
diff --git a/arch/arm/boot/dts/tegra124-apalis.dtsi b/arch/arm/boot/dts/tegra124-apalis.dtsi
index 29ceeba1e7b1..8857a11332c2 100644
--- a/arch/arm/boot/dts/tegra124-apalis.dtsi
+++ b/arch/arm/boot/dts/tegra124-apalis.dtsi
@@ -1552,6 +1552,7 @@ i2c@7000d000 {
 		sgtl5000: codec@a {
 			compatible = "fsl,sgtl5000";
 			reg = <0x0a>;
+			#sound-dai-cells = <0>;
 			VDDA-supply = <&reg_module_3v3_audio>;
 			VDDD-supply = <&reg_1v8_vddio>;
 			VDDIO-supply = <&reg_1v8_vddio>;
diff --git a/arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi b/arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi
index 9421063cd86c..fdd3e4e3522b 100644
--- a/arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi
+++ b/arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi
@@ -855,6 +855,7 @@ i2c@7000d000 {
 		sgtl5000: codec@a {
 			compatible = "fsl,sgtl5000";
 			reg = <0x0a>;
+			#sound-dai-cells = <0>;
 			VDDA-supply = <&reg_module_3v3_audio>;
 			VDDD-supply = <&reg_1v8_vio>;
 			VDDIO-supply = <&reg_module_3v3>;
diff --git a/arch/arm/boot/dts/tegra30-apalis.dtsi b/arch/arm/boot/dts/tegra30-apalis.dtsi
index d13f6b0c7c0c..90694d1a3b0c 100644
--- a/arch/arm/boot/dts/tegra30-apalis.dtsi
+++ b/arch/arm/boot/dts/tegra30-apalis.dtsi
@@ -846,6 +846,7 @@ i2c@7000d000 {
 		sgtl5000: codec@a {
 			compatible = "fsl,sgtl5000";
 			reg = <0x0a>;
+			#sound-dai-cells = <0>;
 			VDDA-supply = <&reg_module_3v3_audio>;
 			VDDD-supply = <&reg_1v8_vio>;
 			VDDIO-supply = <&reg_module_3v3>;
diff --git a/arch/arm/boot/dts/tegra30-colibri.dtsi b/arch/arm/boot/dts/tegra30-colibri.dtsi
index a7bfe26f038d..933087ee45a8 100644
--- a/arch/arm/boot/dts/tegra30-colibri.dtsi
+++ b/arch/arm/boot/dts/tegra30-colibri.dtsi
@@ -723,6 +723,7 @@ i2c@7000d000 {
 		sgtl5000: codec@a {
 			compatible = "fsl,sgtl5000";
 			reg = <0x0a>;
+			#sound-dai-cells = <0>;
 			VDDA-supply = <&reg_module_3v3_audio>;
 			VDDD-supply = <&reg_1v8_vio>;
 			VDDIO-supply = <&reg_module_3v3>;
-- 
2.24.1


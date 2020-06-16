Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1B5B1FB28A
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Jun 2020 15:52:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728869AbgFPNwu (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 Jun 2020 09:52:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728740AbgFPNws (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Jun 2020 09:52:48 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4688C06174E
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:52:47 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id l26so2965206wme.3
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e+aQRcr8g2L1XKOdnqIhl3Y/lE37D1u6kdXp0AB8z5I=;
        b=owc+3xnIp7+UxkS37n+s30rY/dEHLz54ugoJQyM3x7GXnY7LE12lTuv5JisMFRDytV
         moVOllI0lNionN251TnXUQu4+Fh4dUaWDxosglDGNVVtZCOIM1j9Ng0MKIZRv+Cqw+IF
         ZJxYatrl7IJvBmwOkGNrjXJ0k7ftb3D/yI8NvPDYBVCQaiwZ1oM318jsUc5RygzH9kYx
         zcB29tYTJdL7kGzH+pU8GSAMpm7wx0+BMLJh1BwABonik7y5QkcJkGVWHreqVJCY5kmG
         A8NGC3Ot8FIkaPRG0EH4O8s9I795Ye0Y8jV3MfB0O7l49WMWftyQM2uHkOt/Mb8+k2Pe
         9djg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e+aQRcr8g2L1XKOdnqIhl3Y/lE37D1u6kdXp0AB8z5I=;
        b=j08yioO1Ua884ouKW/4WMZHiV6k2c0i8kb9Z3p7/9GAXR7XcRZeovHNAytwA00EB4a
         qaIZZ0bDieGk3Ruk4mEsdj9eVbP4YP5N+vDdog9UOrTcK/XbHnLkUONVQ2nWACbLWSVJ
         duS7ricpK2q2KSHlmdV+bxFqgXi5xQZ5bPEMVFDRxVlCS3aXoAAUvTHieYHe35dJsTwF
         NF+J92CzkLqiDjsTNcj0uCGKSO2lTTl8lhMRxFAwzkLIolk0Vg02X9CtricCHZrj+oE1
         /GZsZpEZifDUSHYZITsJxBxl5IHCP31HlRS8Hg+I7VmJ2a17o5ES1gmr1iY/6WZAWHzI
         AQqA==
X-Gm-Message-State: AOAM530qFPIzsqHRcaM5F/5PjHho3MU6mO8aDdeVT9vcRnShfvv4JLUh
        aBs6LdUZvVWU3AE2OS4H7jQ=
X-Google-Smtp-Source: ABdhPJzaobN8VHO0iY9PKxgxYV6t9Vyj5L3IcgcwIYyFVUackFYExX4ODtN2vuG7CWtmYqpWvXmSew==
X-Received: by 2002:a05:600c:287:: with SMTP id 7mr3535658wmk.91.1592315566443;
        Tue, 16 Jun 2020 06:52:46 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id f11sm27766410wrm.13.2020.06.16.06.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 06:52:45 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 01/73] ARM: tegra: Add missing clock-names for SDHCI on Tegra114
Date:   Tue, 16 Jun 2020 15:51:26 +0200
Message-Id: <20200616135238.3001888-2-thierry.reding@gmail.com>
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

The Tegra SDHCI controller bindings state that the clock-names property
is required, so add the missing properties on Tegra114.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/tegra114.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi
index 450a1f1b12a0..01a81d380f1f 100644
--- a/arch/arm/boot/dts/tegra114.dtsi
+++ b/arch/arm/boot/dts/tegra114.dtsi
@@ -649,6 +649,7 @@ sdhci@78000000 {
 		reg = <0x78000000 0x200>;
 		interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA114_CLK_SDMMC1>;
+		clock-names = "sdhci";
 		resets = <&tegra_car 14>;
 		reset-names = "sdhci";
 		status = "disabled";
@@ -659,6 +660,7 @@ sdhci@78000200 {
 		reg = <0x78000200 0x200>;
 		interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA114_CLK_SDMMC2>;
+		clock-names = "sdhci";
 		resets = <&tegra_car 9>;
 		reset-names = "sdhci";
 		status = "disabled";
@@ -669,6 +671,7 @@ sdhci@78000400 {
 		reg = <0x78000400 0x200>;
 		interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA114_CLK_SDMMC3>;
+		clock-names = "sdhci";
 		resets = <&tegra_car 69>;
 		reset-names = "sdhci";
 		status = "disabled";
@@ -679,6 +682,7 @@ sdhci@78000600 {
 		reg = <0x78000600 0x200>;
 		interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA114_CLK_SDMMC4>;
+		clock-names = "sdhci";
 		resets = <&tegra_car 15>;
 		reset-names = "sdhci";
 		status = "disabled";
-- 
2.24.1


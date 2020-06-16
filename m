Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DCA01FB2A9
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Jun 2020 15:53:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726306AbgFPNxu (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 Jun 2020 09:53:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728993AbgFPNxp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Jun 2020 09:53:45 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63483C06174E
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:53:45 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id q25so3189150wmj.0
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lGpHqO3KmMFfHP9rR0idT1ys2+7XIuz3UI1Ywxs3EL4=;
        b=DQKqsrCVU7Zdk69PmXUJDmbr2EBqhQFhTRmEyYGc31Cx5TWlRwdJQDebyaFFbzWUkL
         17iZ9DbnZEGy+nj9zBiu7AFCzPk3bQMJSq+2mKnGaUy2oaDOM6SER/BZ0sesx3oWnH3j
         2NEltEr31n9jAKhRrrRiInIxrR0SJCbo2WtOxJqkXuDIN0R3fuJR5EgGZWCdTliZ3jUa
         570LK0WyezSeSCpYZ5dUUl6HD1yDd15ALcwmc10oBFO80mqlA9ivlXFL4R2Hrf58smEV
         2KxqSd5L0CExGYhkpMC9mvu2pdqF/PQ9xDRR3H4/mFDWfqPBKMmflGJDZnEpji3bWtdO
         vI4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lGpHqO3KmMFfHP9rR0idT1ys2+7XIuz3UI1Ywxs3EL4=;
        b=N6qJHg3q8v8JRO2M9Rg+axtv2UDY1s1kdrjAvG5q6RUtHot8i3MyN02tT+VAPWpeF1
         Nei07dQ4Ja06ml5O0zMkiMpDhOqaVc97GnKXUEEB9zd1ox3GGus9NF7LnqxkZpiqOr5u
         9hAzWyY5YTGVO0bC3ltIm/GsqUV8gjdfty5Mv0qqymk7sZCNjJ1m3eivLLd2K/QKY93+
         LHxDgGnd7RA7R9IOPscMWPEvC1vcjR/2HdUhtsT4ZgXy965J7d9E3uxi5zlMFA9m/JsT
         qmk+p4oMEhwTtLm+fjVzrWERJaWCk2iFh43kUM/9NvuT56IoFTvKj6018kaJ8w1vd2mv
         U6uQ==
X-Gm-Message-State: AOAM531U0Iibp3ezZezSk10gFwq7QajlIiopmtvMySlRSFZOYgs82SwV
        S/oKMBIvm0gX+ImTKs7u8p+bduR1
X-Google-Smtp-Source: ABdhPJzXWfBK79h5kk+93HOcIYTlNumI9fiUqKsiDtSO1NHs0XS4+IFKk34gcVxz/YUTumTF6odLOw==
X-Received: by 2002:a05:600c:22c1:: with SMTP id 1mr3577994wmg.50.1592315624117;
        Tue, 16 Jun 2020 06:53:44 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id a15sm29250251wra.86.2020.06.16.06.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 06:53:43 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 24/73] ARM: tegra: Add missing clock-names for SDHCI controllers
Date:   Tue, 16 Jun 2020 15:51:49 +0200
Message-Id: <20200616135238.3001888-25-thierry.reding@gmail.com>
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

The Tegra SDHCI controllers need to have a clock-names property
according to the bindings.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/tegra124.dtsi | 4 ++++
 arch/arm/boot/dts/tegra20.dtsi  | 4 ++++
 arch/arm/boot/dts/tegra30.dtsi  | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
index 3840019ed5c6..175d0bcd7a2b 100644
--- a/arch/arm/boot/dts/tegra124.dtsi
+++ b/arch/arm/boot/dts/tegra124.dtsi
@@ -839,6 +839,7 @@ mmc@700b0000 {
 		reg = <0x0 0x700b0000 0x0 0x200>;
 		interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA124_CLK_SDMMC1>;
+		clock-names = "sdhci";
 		resets = <&tegra_car 14>;
 		reset-names = "sdhci";
 		status = "disabled";
@@ -849,6 +850,7 @@ mmc@700b0200 {
 		reg = <0x0 0x700b0200 0x0 0x200>;
 		interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA124_CLK_SDMMC2>;
+		clock-names = "sdhci";
 		resets = <&tegra_car 9>;
 		reset-names = "sdhci";
 		status = "disabled";
@@ -859,6 +861,7 @@ mmc@700b0400 {
 		reg = <0x0 0x700b0400 0x0 0x200>;
 		interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA124_CLK_SDMMC3>;
+		clock-names = "sdhci";
 		resets = <&tegra_car 69>;
 		reset-names = "sdhci";
 		status = "disabled";
@@ -869,6 +872,7 @@ mmc@700b0600 {
 		reg = <0x0 0x700b0600 0x0 0x200>;
 		interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA124_CLK_SDMMC4>;
+		clock-names = "sdhci";
 		resets = <&tegra_car 15>;
 		reset-names = "sdhci";
 		status = "disabled";
diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index 90393d8f5ebc..ccd2995aef83 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -813,6 +813,7 @@ mmc@c8000000 {
 		reg = <0xc8000000 0x200>;
 		interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA20_CLK_SDMMC1>;
+		clock-names = "sdhci";
 		resets = <&tegra_car 14>;
 		reset-names = "sdhci";
 		status = "disabled";
@@ -823,6 +824,7 @@ mmc@c8000200 {
 		reg = <0xc8000200 0x200>;
 		interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA20_CLK_SDMMC2>;
+		clock-names = "sdhci";
 		resets = <&tegra_car 9>;
 		reset-names = "sdhci";
 		status = "disabled";
@@ -833,6 +835,7 @@ mmc@c8000400 {
 		reg = <0xc8000400 0x200>;
 		interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA20_CLK_SDMMC3>;
+		clock-names = "sdhci";
 		resets = <&tegra_car 69>;
 		reset-names = "sdhci";
 		status = "disabled";
@@ -843,6 +846,7 @@ mmc@c8000600 {
 		reg = <0xc8000600 0x200>;
 		interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA20_CLK_SDMMC4>;
+		clock-names = "sdhci";
 		resets = <&tegra_car 15>;
 		reset-names = "sdhci";
 		status = "disabled";
diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index 9a8c07ccbb30..f838e4775cf6 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -856,6 +856,7 @@ mmc@78000000 {
 		reg = <0x78000000 0x200>;
 		interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA30_CLK_SDMMC1>;
+		clock-names = "sdhci";
 		resets = <&tegra_car 14>;
 		reset-names = "sdhci";
 		status = "disabled";
@@ -866,6 +867,7 @@ mmc@78000200 {
 		reg = <0x78000200 0x200>;
 		interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA30_CLK_SDMMC2>;
+		clock-names = "sdhci";
 		resets = <&tegra_car 9>;
 		reset-names = "sdhci";
 		status = "disabled";
@@ -876,6 +878,7 @@ mmc@78000400 {
 		reg = <0x78000400 0x200>;
 		interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA30_CLK_SDMMC3>;
+		clock-names = "sdhci";
 		resets = <&tegra_car 69>;
 		reset-names = "sdhci";
 		status = "disabled";
@@ -886,6 +889,7 @@ mmc@78000600 {
 		reg = <0x78000600 0x200>;
 		interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA30_CLK_SDMMC4>;
+		clock-names = "sdhci";
 		resets = <&tegra_car 15>;
 		reset-names = "sdhci";
 		status = "disabled";
-- 
2.24.1


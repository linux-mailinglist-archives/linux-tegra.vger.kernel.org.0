Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DD211FB2B3
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Jun 2020 15:54:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728908AbgFPNyP (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 Jun 2020 09:54:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728899AbgFPNyP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Jun 2020 09:54:15 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8E25C061573
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:54:13 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id l17so2987650wmj.0
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iSV77y8AmWb+Wh1piRcAkQT0I7rk2MZqZTm5Fu4vFQA=;
        b=jGexnNuzhW3pKohokLWtgune9Doo8bb8gmGqdgTvbDkhDMwKYdhPz3/WCqj22H9MIO
         i0dXeEBirSfyKW80seDcyCd2Bst4RkZB1JtkhgLrpSvw6G9VFNqHH8SoQeJ5LuokoJ1p
         aNTuHV7IwXqDHLI3WWgIF+I63heoPGbFWZEiaI9iaG69Ob6v0s18rm/N6k+m9U2VpQQD
         UWaRUjYZBWHbxpdT+z3vfonrchDD0cVDN88fMw+tWwh+RIJnEHMBKXE7e4yIrL1p5hwp
         uafyjnRl2+LAzAngMLPw69/+EpTRfc+2/JHFUrP45Py2gyJaOI2Uz80mxWmTHYq8m+M7
         FDtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iSV77y8AmWb+Wh1piRcAkQT0I7rk2MZqZTm5Fu4vFQA=;
        b=MCxDT6LwBQ8E9YFUUndLLrx8RfXxIMiTZutf0ijJsUBiU8lIE7AfnPMK7JKB0xjtZD
         PAPJJrjd6kwrFB6nxHOMnUfgHAargkNipknApnGxGLFkNUkhB/zLxQcfrNVnHytAQ9a3
         PX8iwSRXzoVQJEHJ3VIVVrEDvk4C0t31Q8JQWRB27gIMF62kkiEgtW9+kbwUsn365gIJ
         TnUrM/eZz5thOriOF9Y38kAg7gjODJs9mPK3mOLsej90R0mVlRK09R1GTep6hTrvMcgW
         33czPgKUOHCi9QrsNj590GJpLJapD9+cj6v3Ts2L8BvY1p9qkS9JqwaMvhafL36DKszE
         DeoA==
X-Gm-Message-State: AOAM530aZaUYiER3BeylNKDTQudmtFYX1HXsv+5JaYnQTOnAJpmEJFhP
        4tNAGVZWwcEotAsr6wpPN3Jjc0aD
X-Google-Smtp-Source: ABdhPJwWvCiIh9OzTTLCPHqPjRDt8xPuHQuoHliL9OM1vk6X4Sdjm50lnyyfjGdrH6xZNulYKpnMbQ==
X-Received: by 2002:a1c:60d6:: with SMTP id u205mr3548805wmb.163.1592315652471;
        Tue, 16 Jun 2020 06:54:12 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id o18sm4383482wme.19.2020.06.16.06.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 06:54:11 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 34/73] ARM: tegra: The Tegra30 SDHCI is not backwards-compatible
Date:   Tue, 16 Jun 2020 15:51:59 +0200
Message-Id: <20200616135238.3001888-35-thierry.reding@gmail.com>
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

The SDHCI on Tegra30 is in fact not backwards-compatible with the
instantiation found on earlier SoCs. Drop the misleading compatible
string.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/tegra30.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index bedab43016c7..3c7ee0b871c0 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -854,7 +854,7 @@ tegra_i2s4: i2s@70080700 {
 	};
 
 	mmc@78000000 {
-		compatible = "nvidia,tegra30-sdhci", "nvidia,tegra20-sdhci";
+		compatible = "nvidia,tegra30-sdhci";
 		reg = <0x78000000 0x200>;
 		interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA30_CLK_SDMMC1>;
@@ -865,7 +865,7 @@ mmc@78000000 {
 	};
 
 	mmc@78000200 {
-		compatible = "nvidia,tegra30-sdhci", "nvidia,tegra20-sdhci";
+		compatible = "nvidia,tegra30-sdhci";
 		reg = <0x78000200 0x200>;
 		interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA30_CLK_SDMMC2>;
@@ -876,7 +876,7 @@ mmc@78000200 {
 	};
 
 	mmc@78000400 {
-		compatible = "nvidia,tegra30-sdhci", "nvidia,tegra20-sdhci";
+		compatible = "nvidia,tegra30-sdhci";
 		reg = <0x78000400 0x200>;
 		interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA30_CLK_SDMMC3>;
@@ -887,7 +887,7 @@ mmc@78000400 {
 	};
 
 	mmc@78000600 {
-		compatible = "nvidia,tegra30-sdhci", "nvidia,tegra20-sdhci";
+		compatible = "nvidia,tegra30-sdhci";
 		reg = <0x78000600 0x200>;
 		interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA30_CLK_SDMMC4>;
-- 
2.24.1


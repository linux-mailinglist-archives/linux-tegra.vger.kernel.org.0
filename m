Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15BE91FB2B8
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Jun 2020 15:54:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728899AbgFPNy0 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 Jun 2020 09:54:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728815AbgFPNy0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Jun 2020 09:54:26 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93111C061573
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:54:25 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id r9so2974333wmh.2
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kThqcb4cQbBx/uIsel8TVm5M32tgO5gv/gDCIhxkJJA=;
        b=o/hi0mnh2wpMjd4mgh7FpL98ASw5tSNjvcUQsMZmDL7CaRzCWFSeuAtCWoaRhUUZXn
         hS5gS/LCLSrTDWGHwZcaT/lr1RQ3IHm8vpgwcQLD5N99QRwLS7eAWrBI0m7zdsZRwRxu
         /dk6beZXp7QzUWAW94rcDpjx4WtdNIIbPZnYhkbNPyehGuq9Tp2FEHl1x/2ragpYV3ST
         grA85cCHOXQI/nyfs0m6Z8L/3V9r+yz5RA+vU/DbD8+obw/Z2gIfCBalD5VmQ79OTstK
         k2vn2+Tom6TvlQk0EVBdlJoZOJyznexZ4YUTO3Jm8QlYN1+gi5T3wYtZy0IeO7LD0B45
         MLuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kThqcb4cQbBx/uIsel8TVm5M32tgO5gv/gDCIhxkJJA=;
        b=AYgh2WdZlKjjAd5rZxSB/8+T0bRe8KYP1ibTim8+Q2AN3++VpKZQafM0YgpBer/fNM
         3hqHwFx9sxF8ryE7A+4JRS5MnMc4nJbtpoYU65grf3/sztbdwQx4fgSNuDTkCKNhsJRO
         LC6hUYyiiGLjlUC6eOSymNpMjzgRjvy3CK1LADjRXVEDrKGY18mWtJ7B5RoiqtJlgx8d
         9bI3RvcsplQgRi2kNueoelAhPTpdXH1FMvyunv5q0NFGCbDIlEcu31RThS4aVhN4sB0e
         lFd1W+t0ZCu2tLACAZFX0pdwQe8ZjiwOGY/WioU/LouH3ompRq0FqjQQPlzr9wIJnEa1
         5R6w==
X-Gm-Message-State: AOAM532Kx4PEoobgNvxQNqMhW4wcSIbH7Co4BwdSCWnCx+MU5+Yope8p
        o4bjV5ioU8SXBDtSWMbo4HtfSG1e
X-Google-Smtp-Source: ABdhPJwJwKgoBKOrgh9ybWXJW1wfiTzi0G/DnJugS41di6b6KeHJcMacLd5pTXFBo1vjSqxmGbaNEQ==
X-Received: by 2002:a1c:154:: with SMTP id 81mr3295877wmb.23.1592315664359;
        Tue, 16 Jun 2020 06:54:24 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id a124sm4156094wmh.4.2020.06.16.06.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 06:54:23 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 39/73] arm64: tegra: Remove extra compatible for Tegra194 SDHCI
Date:   Tue, 16 Jun 2020 15:52:04 +0200
Message-Id: <20200616135238.3001888-40-thierry.reding@gmail.com>
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

The SDHCI on Tegra194 is in fact not compatible with the one found on
Tegra186. Remove the extra compatible string to reflect that.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 4bc187a4eacd..ae438b2c4dd9 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -450,7 +450,7 @@ pwm8: pwm@32f0000 {
 		};
 
 		sdmmc1: sdhci@3400000 {
-			compatible = "nvidia,tegra194-sdhci", "nvidia,tegra186-sdhci";
+			compatible = "nvidia,tegra194-sdhci";
 			reg = <0x03400000 0x10000>;
 			interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&bpmp TEGRA194_CLK_SDMMC1>;
@@ -472,7 +472,7 @@ sdmmc1: sdhci@3400000 {
 		};
 
 		sdmmc3: sdhci@3440000 {
-			compatible = "nvidia,tegra194-sdhci", "nvidia,tegra186-sdhci";
+			compatible = "nvidia,tegra194-sdhci";
 			reg = <0x03440000 0x10000>;
 			interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&bpmp TEGRA194_CLK_SDMMC3>;
@@ -495,7 +495,7 @@ sdmmc3: sdhci@3440000 {
 		};
 
 		sdmmc4: sdhci@3460000 {
-			compatible = "nvidia,tegra194-sdhci", "nvidia,tegra186-sdhci";
+			compatible = "nvidia,tegra194-sdhci";
 			reg = <0x03460000 0x10000>;
 			interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&bpmp TEGRA194_CLK_SDMMC4>;
-- 
2.24.1


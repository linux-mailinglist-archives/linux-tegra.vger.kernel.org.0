Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8211E1FB291
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Jun 2020 15:53:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728934AbgFPNxL (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 Jun 2020 09:53:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728908AbgFPNxH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Jun 2020 09:53:07 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8579C061573
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:53:05 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id b82so2977775wmb.1
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MwlkI0IF0P2g4pEYmpV2rRTm6Y2o1Uayf0Va5pno/2M=;
        b=J9TB5th1Gvl7xbRfuSYK8wj2IyJHVBzwQ32+CeTMfbHGWvHoiA7D1+qizOO0175fm3
         POSdd0rNZf9USPTuAMyyIQqP/UBSwPL3VCXt5zY1XZr+M1tKVtq9ILEaVDLj1asIEAfU
         wxBgn5448hHF3RQbXs46V4yBpTGEgjJfXT191IkPcJ9jVWZeJclK6mPRn7r8iezfgquZ
         C+DKpwQdlIwtHJK35KwCQQLTf1V/alr0ocTwBZBDV3t3R6ufjf3alJcXf6rMt+3aTT8J
         Czk+qt1538blssJItJqexK9unH18t5y3jLC9JIEDCIyetevm9cmjU4MiCXpjlFpC1K81
         B9iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MwlkI0IF0P2g4pEYmpV2rRTm6Y2o1Uayf0Va5pno/2M=;
        b=GcSctqawCp6mG5X4SgnhXQ1iq9ihu0eArwjC9iiqcyMG5MzAn0QyMx5bc3QIfqCnR7
         KjOk7MbQPZiZu1LQtg/N3oc5NndQH/ZpvbkkSA6zZFT9jfhzDGh0fHsnA1xiFDw6lk/l
         qHLH5PnzJtxQy5R4PhWvG2tUo5l8autP1kTWo0d1K/ORbcTdra0WYomG0GRph6BD6iSF
         SS7KgH6tb/pLjyGYTWirpF5xuw/YdoUUXSFbaWCAsUABPKvCW/1lyqmaJrduD6+h71dI
         0lELVPXJDq9bQmJVDJ8IjfHkSiFDtgyGrqmFvicBagyEX6OkPv6xZPAoQANEhnxuqcT4
         PaHg==
X-Gm-Message-State: AOAM532DV1DsYiOE8Azgn5Cx/X/E5LTp6bOLOPXrIus3AF+FFELP1UFL
        x2MwjtyqmdNgVZPXKWiDoCM=
X-Google-Smtp-Source: ABdhPJzfU4Y+cwFeWdou8smoaFJ5Bv8iXBsqj0PmFxhSgk6NpofZY/8ZKcUEXC38V3ewrqU8aOSunw==
X-Received: by 2002:a1c:9ec4:: with SMTP id h187mr3314361wme.27.1592315584601;
        Tue, 16 Jun 2020 06:53:04 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id a3sm28145691wrp.91.2020.06.16.06.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 06:53:03 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 07/73] ARM: tegra: Do not mark host1x as simple bus
Date:   Tue, 16 Jun 2020 15:51:32 +0200
Message-Id: <20200616135238.3001888-8-thierry.reding@gmail.com>
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

The host1x is not a simple bus, so drop the corresponding compatible
string.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/tegra114.dtsi | 2 +-
 arch/arm/boot/dts/tegra124.dtsi | 2 +-
 arch/arm/boot/dts/tegra20.dtsi  | 2 +-
 arch/arm/boot/dts/tegra30.dtsi  | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi
index 01a81d380f1f..be048aa553ee 100644
--- a/arch/arm/boot/dts/tegra114.dtsi
+++ b/arch/arm/boot/dts/tegra114.dtsi
@@ -18,7 +18,7 @@ memory@80000000 {
 	};
 
 	host1x@50000000 {
-		compatible = "nvidia,tegra114-host1x", "simple-bus";
+		compatible = "nvidia,tegra114-host1x";
 		reg = <0x50000000 0x00028000>;
 		interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>, /* syncpt */
 			     <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>; /* general */
diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
index 94cac13d3e50..fc124343658e 100644
--- a/arch/arm/boot/dts/tegra124.dtsi
+++ b/arch/arm/boot/dts/tegra124.dtsi
@@ -85,7 +85,7 @@ pci@2,0 {
 	};
 
 	host1x@50000000 {
-		compatible = "nvidia,tegra124-host1x", "simple-bus";
+		compatible = "nvidia,tegra124-host1x";
 		reg = <0x0 0x50000000 0x0 0x00034000>;
 		interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>, /* syncpt */
 			     <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>; /* general */
diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index c3b8ad53b967..7319df2fcd3e 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -31,7 +31,7 @@ vde_pool: vde@400 {
 	};
 
 	host1x@50000000 {
-		compatible = "nvidia,tegra20-host1x", "simple-bus";
+		compatible = "nvidia,tegra20-host1x";
 		reg = <0x50000000 0x00024000>;
 		interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>, /* syncpt */
 			     <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>; /* general */
diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index d2d05f1da274..0b58863e570e 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -111,7 +111,7 @@ vde_pool: vde@400 {
 	};
 
 	host1x@50000000 {
-		compatible = "nvidia,tegra30-host1x", "simple-bus";
+		compatible = "nvidia,tegra30-host1x";
 		reg = <0x50000000 0x00024000>;
 		interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>, /* syncpt */
 			     <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>; /* general */
-- 
2.24.1


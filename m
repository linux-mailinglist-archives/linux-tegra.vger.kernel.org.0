Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F06731FB292
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Jun 2020 15:53:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728908AbgFPNxM (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 Jun 2020 09:53:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726306AbgFPNxJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Jun 2020 09:53:09 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7E5DC06174E
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:53:07 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id x6so20826793wrm.13
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kyl1JYScKTQ9NP2SAvtMlSq/xfYWMpq9fQvWFYMRQFM=;
        b=kFMFSo3m95KKvAi+EpgRTs2HoQ5aIOn+Ee7ywpxk8Ybt1X90Z91m50f7jlIL4FovYW
         y4DLrqjxIg9tlpITlyNIMUHX5vV4jGyDCabW6kjhQ9EztXcMwQoBh7oLQPuo3qCetvOf
         66/fIX+BkYiUiywA6lCKqVZh10yPXBRONRwuAZqxjvM99O0/gzVL38j5h4T2G8xUv7Tm
         hg2lp5tZ2zERMO0W/SLbpXVdQhI1iYzqZkwdtUwP8+qLKkJds+jVaBIsHsT8n+2xkQCK
         //s062vWoHOSw44PV/ezxA1f+eMzCYpQ4mBULAkz4Zw0jHxTM/1O+JdCLvCecOn/W+SQ
         y4ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kyl1JYScKTQ9NP2SAvtMlSq/xfYWMpq9fQvWFYMRQFM=;
        b=la/csgwMOsJdH3E75xKC3U72Yu0WmR/8qElo/BnYrEHspMy8U2Wf5aWqX5XqVuY7mp
         U7zMVgFqxKmBTUtD+tnP8kMAoK3O0/xUTED6OXrfnqygY46cn3GiRCZv2zVcwbKdTJXH
         loA2xVWMFLOAC9Vpc/8NAzhT5K3CcmMBx903A/n+gFGgv4lPYsKzGXkSruwUlPQJct4I
         ZY/pPjwtHNEtPLtn6sRfwZR4teqM3yfRCggk8r/ZYSvDPfoIklXCmC+k2ol75ErA6jMu
         6xkB7eIhEApmtqJ67/++uJcIphXp79eAwp4koZArvfKKL+v6tmWV/g9YMZd0oEPNtnDU
         ywGA==
X-Gm-Message-State: AOAM530Q5HpAVOYenJw1XUedMqXkEbNsAwV4Tx6buIRJgvHOAQtMG+x1
        VOWitGU2GAz6spAiiZuJWw8=
X-Google-Smtp-Source: ABdhPJzbWc3iSf4FDeWU8SptC5l0R0pYNgxv+AM9SFxGZhy/uHjp01VcoIIAzeNSS19+l4bwUXCT6g==
X-Received: by 2002:a5d:66c3:: with SMTP id k3mr3157851wrw.401.1592315586643;
        Tue, 16 Jun 2020 06:53:06 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id 138sm4353784wma.23.2020.06.16.06.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 06:53:05 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 08/73] ARM: tegra: Add missing host1x properties
Date:   Tue, 16 Jun 2020 15:51:33 +0200
Message-Id: <20200616135238.3001888-9-thierry.reding@gmail.com>
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

The host1x device tree bindings require the clock- and interrupt-names
properties to be present, so add them where missing.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/tegra114.dtsi | 2 ++
 arch/arm/boot/dts/tegra124.dtsi | 2 ++
 arch/arm/boot/dts/tegra20.dtsi  | 2 ++
 arch/arm/boot/dts/tegra30.dtsi  | 2 ++
 4 files changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi
index be048aa553ee..a0ac9ea9ec9d 100644
--- a/arch/arm/boot/dts/tegra114.dtsi
+++ b/arch/arm/boot/dts/tegra114.dtsi
@@ -22,7 +22,9 @@ host1x@50000000 {
 		reg = <0x50000000 0x00028000>;
 		interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>, /* syncpt */
 			     <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>; /* general */
+		interrupt-names = "syncpt", "host1x";
 		clocks = <&tegra_car TEGRA114_CLK_HOST1X>;
+		clock-names = "host1x";
 		resets = <&tegra_car 28>;
 		reset-names = "host1x";
 		iommus = <&mc TEGRA_SWGROUP_HC>;
diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
index fc124343658e..1afed8496c95 100644
--- a/arch/arm/boot/dts/tegra124.dtsi
+++ b/arch/arm/boot/dts/tegra124.dtsi
@@ -89,7 +89,9 @@ host1x@50000000 {
 		reg = <0x0 0x50000000 0x0 0x00034000>;
 		interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>, /* syncpt */
 			     <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>; /* general */
+		interrupt-names = "syncpt", "host1x";
 		clocks = <&tegra_car TEGRA124_CLK_HOST1X>;
+		clock-names = "host1x";
 		resets = <&tegra_car 28>;
 		reset-names = "host1x";
 		iommus = <&mc TEGRA_SWGROUP_HC>;
diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index 7319df2fcd3e..f0a172c61b26 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -35,7 +35,9 @@ host1x@50000000 {
 		reg = <0x50000000 0x00024000>;
 		interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>, /* syncpt */
 			     <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>; /* general */
+		interrupt-names = "syncpt", "host1x";
 		clocks = <&tegra_car TEGRA20_CLK_HOST1X>;
+		clock-names = "host1x";
 		resets = <&tegra_car 28>;
 		reset-names = "host1x";
 
diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index 0b58863e570e..27000f0ba35b 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -115,7 +115,9 @@ host1x@50000000 {
 		reg = <0x50000000 0x00024000>;
 		interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>, /* syncpt */
 			     <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>; /* general */
+		interrupt-names = "syncpt", "host1x";
 		clocks = <&tegra_car TEGRA30_CLK_HOST1X>;
+		clock-names = "host1x";
 		resets = <&tegra_car 28>;
 		reset-names = "host1x";
 		iommus = <&mc TEGRA_SWGROUP_HC>;
-- 
2.24.1


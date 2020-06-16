Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 297671FB2C1
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Jun 2020 15:54:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728885AbgFPNyn (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 Jun 2020 09:54:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728861AbgFPNyn (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Jun 2020 09:54:43 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E95AC061573
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:54:41 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id l11so20887846wru.0
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ScVLo3OLCSIkKXjokM31Qg9uqsCe/mNFJUR5ZIozpdg=;
        b=ix86ceYkDxBmJt95mC8J68J2pveSEwzb7Dm7fwmXnrTYhRWHHdia0OUYGqcAfWnM5Z
         pMfpH1pzwWRNdsPlHtFwnLIV8nA4TzowU8EmRpOutvKhV2ZE4Vq9amzHOVXr+6e2doqv
         w9SmGF7p8/eRawm/7J3S6izosparCrchqxCgKhFE9pel2gWUjemRl3FqMEMLnvaLVMcM
         YQFzwnBHrz1Ff5ylR+8akC9pd4TAGnECF60cIbGFUqVlK5Y1YHrX+vecMCSm/NCDiq2d
         ETZqwejIbeiJiccvr7c7qJytuUdRaB3DCLOHpkKmFmcS72yw5w69Ekdp7j6+QZkwN03j
         e6Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ScVLo3OLCSIkKXjokM31Qg9uqsCe/mNFJUR5ZIozpdg=;
        b=B5BG7jXmNnRaq4sUQpxtpSSmtbVjAhtkxM6+uFUSuh6R5MnLIcWAKzvr6MlIfibyBs
         zAdey9LfRY40+CR/Ix65V9lRm9WKZTUlx7JA5Xy3AjAjCqMYQu3xwtBvk0RYMUYb15ZW
         TLNMTyS5GJJ3umcImAQCpNQzhriPvlE2ZS8XSmkJJIZzPoRBvHl6qJa2rw2FiHp5+647
         BilGA6NzZ2OTjnR3Jot1XNq/jVatlh2rLx82ASAcTwluVixFtvGfXIDTB3YkAVHx0F1O
         4pJ6Bwl5iKncIvopRQaIjjI7cmeamkX9qEX5xV8PY0ZGfOczei0HLkNY6NSghRI/BuAU
         3i8w==
X-Gm-Message-State: AOAM533vD4AkXIEUaJ1hnuchhlISFR+Y1UjLY9rDpBFjLQZrNQ0CjLM7
        sRVfu4cQ8jG5O8yc/Mpq1S8=
X-Google-Smtp-Source: ABdhPJwYTX9uuPIKRe2/ufnmT13//0CJbLCYwlI7nSFk88b4h8KI69VRknfffeDOgIcUdRrxli5GgA==
X-Received: by 2002:a5d:4e45:: with SMTP id r5mr2238083wrt.92.1592315680297;
        Tue, 16 Jun 2020 06:54:40 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id x8sm30190568wrs.43.2020.06.16.06.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 06:54:39 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 46/73] arm64: tegra: Remove parent clock from display controllers
Date:   Tue, 16 Jun 2020 15:52:11 +0200
Message-Id: <20200616135238.3001888-47-thierry.reding@gmail.com>
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

The display controller's parent clock depends on the output that's
consuming data from the display controller, so it needs to be specified
as the parent of the corresponding output. The device tree bindings do
specify this, so just correct the existing device trees that get this
wrong.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra132.dtsi | 10 ++++------
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 10 ++++------
 2 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra132.dtsi b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
index 76e1a6451e83..4fc34c5ec2dc 100644
--- a/arch/arm64/boot/dts/nvidia/tegra132.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
@@ -104,9 +104,8 @@ dc@54200000 {
 			compatible = "nvidia,tegra124-dc";
 			reg = <0x0 0x54200000 0x0 0x00040000>;
 			interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&tegra_car TEGRA124_CLK_DISP1>,
-				 <&tegra_car TEGRA124_CLK_PLL_P>;
-			clock-names = "dc", "parent";
+			clocks = <&tegra_car TEGRA124_CLK_DISP1>;
+			clock-names = "dc";
 			resets = <&tegra_car 27>;
 			reset-names = "dc";
 
@@ -119,9 +118,8 @@ dc@54240000 {
 			compatible = "nvidia,tegra124-dc";
 			reg = <0x0 0x54240000 0x0 0x00040000>;
 			interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&tegra_car TEGRA124_CLK_DISP2>,
-				 <&tegra_car TEGRA124_CLK_PLL_P>;
-			clock-names = "dc", "parent";
+			clocks = <&tegra_car TEGRA124_CLK_DISP2>;
+			clock-names = "dc";
 			resets = <&tegra_car 26>;
 			reset-names = "dc";
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 0586722df64b..41ffa0531cd8 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -187,9 +187,8 @@ dc@54200000 {
 			compatible = "nvidia,tegra210-dc";
 			reg = <0x0 0x54200000 0x0 0x00040000>;
 			interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&tegra_car TEGRA210_CLK_DISP1>,
-				 <&tegra_car TEGRA210_CLK_PLL_P>;
-			clock-names = "dc", "parent";
+			clocks = <&tegra_car TEGRA210_CLK_DISP1>;
+			clock-names = "dc";
 			resets = <&tegra_car 27>;
 			reset-names = "dc";
 
@@ -202,9 +201,8 @@ dc@54240000 {
 			compatible = "nvidia,tegra210-dc";
 			reg = <0x0 0x54240000 0x0 0x00040000>;
 			interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&tegra_car TEGRA210_CLK_DISP2>,
-				 <&tegra_car TEGRA210_CLK_PLL_P>;
-			clock-names = "dc", "parent";
+			clocks = <&tegra_car TEGRA210_CLK_DISP2>;
+			clock-names = "dc";
 			resets = <&tegra_car 26>;
 			reset-names = "dc";
 
-- 
2.24.1


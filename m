Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29EBA1FB295
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Jun 2020 15:53:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728899AbgFPNxP (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 Jun 2020 09:53:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728869AbgFPNxP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Jun 2020 09:53:15 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD23BC061573
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:53:13 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id r7so20893035wro.1
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FT2XLpfBDjhksZtGFD0bEBzgpWT5Qpglrh+vmdOd/oo=;
        b=bSZJDYwIxLNahacewvcxphbOsAC+HSNSBsJRptZpwLITEgOkA4y2rzTTQqqYhx19H5
         ExAYqLTb0vgPpv8EwOVx5eVZ57iVTa6OaQo7awaM3WWiI78WbQ7lsO709u8HrGxj5hLB
         2Xvgy6dKKcYai63He7ezWodaclgfNYlocbgNPYpvH3bwxvI00J4eiu5wK4HZTqbHOft9
         1rlHorDTTMDmwS8CeRuYi+7C9EieSEdDoyYY4dUFdF+HJrkiWsu7yhA7DXWK03cBWRbK
         xUw7+LecocwcllFSp5EFKb9PjuOJ2c8q+X6D4jYxRi3FEO8wigot4yO4YNvZgFjVYQDY
         RmKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FT2XLpfBDjhksZtGFD0bEBzgpWT5Qpglrh+vmdOd/oo=;
        b=gnekKAci05wBKx42dmcVVSkEyC3Rk1dEzqbQqmwYBo9vgpNgjFbdwe85YXADWLez4k
         C4IzIAKHyyMoCzckcAgEkDEtmJH6J+bXpHhQjU+OkTV9aT5IL4lVRlodnQZ/GpMa4zGp
         RRTLYT/xOUlzpthxosud0+F7Uqhch9YfOIkfROFCzDqhcr4sudReY67f0aEemTO4p6Ee
         9RYnvat9KtsHHbKQ7E37Y44vF0E+LQEQ1BiOOV8Rjac52pUm++fqDSW6mPkdsLVvCone
         QqLQ30FZu97WTPI3Lt8drB+22vibSFbRt66L8PAB36FLR+KZAbEo900bDpSJDCmwLNyE
         9m5A==
X-Gm-Message-State: AOAM531R6Xv5JQvwbgu4F3loCSuDsHypMeHgouFo24awHORRSQ5ofq/V
        UXd0ymx7duW2Z8PY1vytunLUSJHH
X-Google-Smtp-Source: ABdhPJxbMvXDt5cbMxmncdZsxboagCBEEqp5k2CMTYXn6m3dztuFwDsTjCU4ppfvevzOAUYUtcvI/Q==
X-Received: by 2002:adf:c385:: with SMTP id p5mr3239900wrf.409.1592315592683;
        Tue, 16 Jun 2020 06:53:12 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id c81sm4199809wmd.42.2020.06.16.06.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 06:53:11 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 11/73] ARM: tegra: The Tegra114 DC is not backwards-compatible
Date:   Tue, 16 Jun 2020 15:51:36 +0200
Message-Id: <20200616135238.3001888-12-thierry.reding@gmail.com>
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

The display controller on Tegra114 is in fact not backwards-compatible
with the instantiation found on earlier SoCs. Drop the misleading
compatible string.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/tegra114.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi
index 392f06107b32..a06b88b01ef3 100644
--- a/arch/arm/boot/dts/tegra114.dtsi
+++ b/arch/arm/boot/dts/tegra114.dtsi
@@ -56,7 +56,7 @@ gr3d@54180000 {
 		};
 
 		dc@54200000 {
-			compatible = "nvidia,tegra114-dc", "nvidia,tegra20-dc";
+			compatible = "nvidia,tegra114-dc";
 			reg = <0x54200000 0x00040000>;
 			interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&tegra_car TEGRA114_CLK_DISP1>,
@@ -75,7 +75,7 @@ rgb {
 		};
 
 		dc@54240000 {
-			compatible = "nvidia,tegra114-dc", "nvidia,tegra20-dc";
+			compatible = "nvidia,tegra114-dc";
 			reg = <0x54240000 0x00040000>;
 			interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&tegra_car TEGRA114_CLK_DISP2>,
-- 
2.24.1


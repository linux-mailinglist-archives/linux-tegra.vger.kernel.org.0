Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 684351FB2DE
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Jun 2020 15:55:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728869AbgFPNz0 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 Jun 2020 09:55:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728553AbgFPNzW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Jun 2020 09:55:22 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73932C06174E
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:55:22 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id y20so3178922wmi.2
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iIbYc6mjj2XC9sB0100ZE5S9+tg7Z6KcqIjSEJek5/A=;
        b=txZgLaXFOtb1TJEVVvNDNlwz12hfxlSWcBarAU9dyFlctbMWrhF2nzSBhF3LhePv1T
         Ww/TUO2Rdz4HLFnjRLPAnitwyWxCZkAIJ21GXL0VVzh73J/rF6mhbnRj1nyKPok/1RGc
         MBoBs6w6tnd95AkdiAIe8CSdnG3DC/A5NdJoaX67YhOWosNuv3w1qk089WMEdz5l1CZV
         PerrFUyuimQoHRrBX3J9AElj7uGBKpwag1GbftgmP1n3aL9rkAst0f3pg/1nQZMkumjy
         +/gSwYqxJfkadCa1iwh3V4QM5rRP5O1uUL+QOBzyoXho97Yw4DBdeeurN7vLI0BS1dP3
         1boQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iIbYc6mjj2XC9sB0100ZE5S9+tg7Z6KcqIjSEJek5/A=;
        b=Hx9Yr2P3qgFIjUplO9RbDRfnxvaL3uz5A91Oq4TtNirp2E6HjT/0OEzxsXIZOzx4yK
         ZqlZ/vpPOZMyiPlvp5rsPenWywf8yYdsFnhMyf1TLS+1m+3Tv1/Q+DuFm6mVe4jmsnW4
         hnVhKnWKPDMivr1bVLTTNPcewTtiYN8FseOGTUFVEMWkG1yvEYWhn8fiRNX5iJiTsPXv
         doEFyoYT23a2hwrI7JMyhltIUnC/jIp8Nw9Rs3QWO8nUVMZlCf3lI+eH75LPad9j+QRM
         rlHQchiOUWAFLbntzb+iSrIY7vgdXIA20iBFp8mobBikI7Z7tq66ugo1IghQ37BQOBeb
         +Frg==
X-Gm-Message-State: AOAM530urgEe1Of0HjyEpvVTG/yx5txlbfzXi3fA0GBavw0VatXHc9Qm
        DXv32m1Bh70G+Ullbl3WNHg=
X-Google-Smtp-Source: ABdhPJx+AEgax2zGOWrfqomo1JreetAMxNewvozhWQyn7Y2ngUxG6D9CWDLNNRWJtNNec19UjZ1t5g==
X-Received: by 2002:a1c:f204:: with SMTP id s4mr3548336wmc.159.1592315721268;
        Tue, 16 Jun 2020 06:55:21 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id k14sm28337070wrq.97.2020.06.16.06.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 06:55:20 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 65/73] arm64: tegra: Do not mark display hub as simple bus
Date:   Tue, 16 Jun 2020 15:52:30 +0200
Message-Id: <20200616135238.3001888-66-thierry.reding@gmail.com>
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

The display hub on Tegra186 and Tegra194 is not a simple bus, so drop
the corresponding compatible string.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 2 +-
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index a73050ec61a7..3a41203deba2 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -990,7 +990,7 @@ i2c-bus {
 		};
 
 		display-hub@15200000 {
-			compatible = "nvidia,tegra186-display", "simple-bus";
+			compatible = "nvidia,tegra186-display";
 			reg = <0x15200000 0x00040000>;
 			resets = <&bpmp TEGRA186_RESET_NVDISPLAY0_MISC>,
 				 <&bpmp TEGRA186_RESET_NVDISPLAY0_WGRP0>,
diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 4d6f2127dd4a..3089ebecfbef 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -1055,7 +1055,7 @@ host1x@13e00000 {
 			interconnect-names = "dma-mem";
 
 			display-hub@15200000 {
-				compatible = "nvidia,tegra194-display", "simple-bus";
+				compatible = "nvidia,tegra194-display";
 				reg = <0x15200000 0x00040000>;
 				resets = <&bpmp TEGRA194_RESET_NVDISPLAY0_MISC>,
 					 <&bpmp TEGRA194_RESET_NVDISPLAY0_WGRP0>,
-- 
2.24.1


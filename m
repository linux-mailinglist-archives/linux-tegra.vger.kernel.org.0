Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7C091FB2B9
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Jun 2020 15:54:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728908AbgFPNyb (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 Jun 2020 09:54:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728740AbgFPNy3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Jun 2020 09:54:29 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB404C061573
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:54:27 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id l26so2970508wme.3
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XC8gu6MUt6zWRMhzY2/0XhcHGyfRevUXTL89flX6beE=;
        b=O9LtF6HdHx1EDTtLBe+5kdtSnBwuAd4ddqtu5IPeAU/COAmLwFdwkIgc47uKEu76wC
         zTEugU/ATrCS47nE8m4SbsohpWD5Jc9vf39a3qVw9/kDRP83YjvH8GKy0Lba8voaz+gS
         yXTqXbuwAqbq6mJAlMnZn03FtFi+EjZsdffQ3TfLSuaMFhyHAMeXWAWqpCwdBb7oCgyN
         BoVHKjVaxQ2dfaVNcSXDM/TBkUPZogLgclUMpMM33m/ywBqvw7dtrLQ4+C87x3N01+H+
         y6K/wIU+wn01Rqk8uwVinX2Nf5ijJ4f5aUG1AZRAFSIFfUVBCzZnJ07JRKC74yIIIjy9
         DGvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XC8gu6MUt6zWRMhzY2/0XhcHGyfRevUXTL89flX6beE=;
        b=F3jO1UD6Q6kjZ7QbGl4Z6zQWh/+jZQJGVlu4/PLBUkBQcGJ/9znLDcXwAbCnPUA0bl
         JyudHSu9arJ9KUhqG6KlLFkYEXYPKjfcFE6NPhtMvcSfw1Ekp+mbOH9MFEFcNwX5S1f1
         Hl8D7CFOq68KeyhN3gZv/0qqqcizJPWwebZVUSQUZxASWfV7q+Z8ZGKPCYVgYA8khOru
         7jbiS63FoVEAqWRyW8Vd58U2/Ezu7DOvOcg0HujHd9Ug8Fs1SlQvswUuTF9LF0h4//zs
         YejEWj9TdPoVcPM9MiwVjey5tJqd4AEwFl6N20uddiJPLxTLDDBUoWF6aXTEVeOUO1MS
         itRg==
X-Gm-Message-State: AOAM5308K4OcmX6l/UMYgbJw17fpfuRgedElriWhNipX4QaHKrM2Ysbg
        spXTo6JAkf9tiRHNEb5U3F4=
X-Google-Smtp-Source: ABdhPJyWPYonq75pR1HSqUUoE6DrwrW1nCA0FtK6irvG2rc4uDX9sIA2lSQT44WMNMaBVDNyU4XcFA==
X-Received: by 2002:a1c:f00a:: with SMTP id a10mr3468960wmb.61.1592315666556;
        Tue, 16 Jun 2020 06:54:26 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id f13sm3971363wmb.33.2020.06.16.06.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 06:54:25 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 40/73] arm64: tegra: Remove extra compatible for Tegra210 SDHCI
Date:   Tue, 16 Jun 2020 15:52:05 +0200
Message-Id: <20200616135238.3001888-41-thierry.reding@gmail.com>
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

The SDHCI on Tegra210 is in fact not compatible with the one found on
Tegra124. Remove the extra compatible string to reflect that.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 08655081f72d..cbf0d30a2f8b 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -1177,7 +1177,7 @@ usb3-3 {
 	};
 
 	sdhci@700b0000 {
-		compatible = "nvidia,tegra210-sdhci", "nvidia,tegra124-sdhci";
+		compatible = "nvidia,tegra210-sdhci";
 		reg = <0x0 0x700b0000 0x0 0x200>;
 		interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA210_CLK_SDMMC1>;
@@ -1205,7 +1205,7 @@ sdhci@700b0000 {
 	};
 
 	sdhci@700b0200 {
-		compatible = "nvidia,tegra210-sdhci", "nvidia,tegra124-sdhci";
+		compatible = "nvidia,tegra210-sdhci";
 		reg = <0x0 0x700b0200 0x0 0x200>;
 		interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA210_CLK_SDMMC2>;
@@ -1222,7 +1222,7 @@ sdhci@700b0200 {
 	};
 
 	sdhci@700b0400 {
-		compatible = "nvidia,tegra210-sdhci", "nvidia,tegra124-sdhci";
+		compatible = "nvidia,tegra210-sdhci";
 		reg = <0x0 0x700b0400 0x0 0x200>;
 		interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA210_CLK_SDMMC3>;
@@ -1245,7 +1245,7 @@ sdhci@700b0400 {
 	};
 
 	sdhci@700b0600 {
-		compatible = "nvidia,tegra210-sdhci", "nvidia,tegra124-sdhci";
+		compatible = "nvidia,tegra210-sdhci";
 		reg = <0x0 0x700b0600 0x0 0x200>;
 		interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA210_CLK_SDMMC4>;
-- 
2.24.1


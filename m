Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A42FB1FB2D5
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Jun 2020 15:55:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728917AbgFPNzK (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 Jun 2020 09:55:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728997AbgFPNzE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Jun 2020 09:55:04 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F092FC061755
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:55:03 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id h5so20899848wrc.7
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M2+WWbt81D5w31pyVWPdaLfZ5hQYQ+P3D86HY7L/Ogc=;
        b=ULToSW5Xh99c4Tl68Q9jJtZIxZF39auLC0cOdGLJ4X5I+zHS+QHIDRlU4pzsjp7/MM
         8gS4pghFXwDZa1MyXQ4h3cxcaS1VMsNuhoP+Lkv6ZOPDeQT/lw40izu4OzXyHIKTS2JB
         pDlwKzSVEWmQTqCt0vip3mc7QfDvJeEhTKCBIrPRUJna0pc9Z9OGvyJgpvo1H5YgkyRv
         hMUkE8ovbgV3OQYbsAM1hPw/kTPBoc/KwqvDtD6YLfuOLJ8xbJp/Oq40ig2/JFc1QtVV
         IZujR7n4mHTD6bxK+N+LqLjD7XFl6Gbe/PGthfxQKYxQkGtv5atzlHlFq/k7VJNngI1K
         LU2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M2+WWbt81D5w31pyVWPdaLfZ5hQYQ+P3D86HY7L/Ogc=;
        b=IdTdQZAG8i2m2DHmVAyXvjwUmP2M+dBmDn2gmTXoM8djDmiCQnBV1+/UjC6BYnC6El
         hhkZVT/3ie62hNqNxNa7A+XtlkYtnWBnXNtrxvbNL0UuqlhZjmN2tJySsqbQvw33rRdb
         XKIzU6TbKJPS/Fc9+Duq3QzdDJ40+fd08VUn0sxrFmuFfjp+5fdyBrA0F1cYwfN+OJH1
         9N+NtAbLqpOUQaUEwH4ESJv43tvxVGh/kDBPlt5mNDCNdqXvr7Ss3ihrdAgGHw7/L98H
         nWzQBgIx4eC+KQdwt1IGVPOcxbLP1+CihOyjAHY9pEClJfb6U+Otks+ooScswmiTR0w8
         cnFQ==
X-Gm-Message-State: AOAM530e/swuFFpciQ985M3PHgqdgKlyEv/aK5w9GrK50vaXaqhq3rJN
        RpuPVT7LSTtlBSH5JnS2Nco=
X-Google-Smtp-Source: ABdhPJyhI6uA+9ibd0qky4cUCRGjOBLRGmHeQqmOLtZbeHajgW8WhXs6yr0xiR0YtIrys4yEnnXrxw==
X-Received: by 2002:adf:e381:: with SMTP id e1mr3067831wrm.320.1592315702700;
        Tue, 16 Jun 2020 06:55:02 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id b18sm28627161wrn.88.2020.06.16.06.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 06:55:01 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 56/73] arm64: tegra: Do not mark host1x as simple bus
Date:   Tue, 16 Jun 2020 15:52:21 +0200
Message-Id: <20200616135238.3001888-57-thierry.reding@gmail.com>
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
 arch/arm64/boot/dts/nvidia/tegra132.dtsi | 3 +--
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 2 +-
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 2 +-
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 2 +-
 4 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra132.dtsi b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
index fa5ee55fd4a5..c4d3a88403eb 100644
--- a/arch/arm64/boot/dts/nvidia/tegra132.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
@@ -81,8 +81,7 @@ pci@2,0 {
 
 	host1x@50000000 {
 		compatible = "nvidia,tegra132-host1x",
-			     "nvidia,tegra124-host1x",
-			     "simple-bus";
+			     "nvidia,tegra124-host1x";
 		reg = <0x0 0x50000000 0x0 0x00034000>;
 		interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>, /* syncpt */
 			     <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>; /* general */
diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index 184cc0365002..b4150d8cccf5 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -934,7 +934,7 @@ smmu: iommu@12000000 {
 	};
 
 	host1x@13e00000 {
-		compatible = "nvidia,tegra186-host1x", "simple-bus";
+		compatible = "nvidia,tegra186-host1x";
 		reg = <0x0 0x13e00000 0x0 0x10000>,
 		      <0x0 0x13e10000 0x0 0x10000>;
 		reg-names = "hypervisor", "vm";
diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 72ba5146b0a9..bf696ada856c 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -1036,7 +1036,7 @@ pmc: pmc@c360000 {
 		};
 
 		host1x@13e00000 {
-			compatible = "nvidia,tegra194-host1x", "simple-bus";
+			compatible = "nvidia,tegra194-host1x";
 			reg = <0x13e00000 0x10000>,
 			      <0x13e10000 0x10000>;
 			reg-names = "hypervisor", "vm";
diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 6a78056b94f4..02a02ed1b264 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -86,7 +86,7 @@ pci@2,0 {
 	};
 
 	host1x@50000000 {
-		compatible = "nvidia,tegra210-host1x", "simple-bus";
+		compatible = "nvidia,tegra210-host1x";
 		reg = <0x0 0x50000000 0x0 0x00034000>;
 		interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>, /* syncpt */
 			     <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>; /* general */
-- 
2.24.1


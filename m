Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E1F51FB2C0
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Jun 2020 15:54:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728803AbgFPNym (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 Jun 2020 09:54:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728553AbgFPNyl (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Jun 2020 09:54:41 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64E5CC06174E
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:54:39 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id f185so3165032wmf.3
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ovQJ+nxLPgIkYbuQt2SCQKzxVuaVAKxPiX+Ud+yngTY=;
        b=KO1jqiv6JeFiRDgWo9+UDUMuiQ1ij+1+FXo0eIpu4YmpwS9Opv1/Ba/x8EoN4tnhH6
         tAz6JbF/AypHdOlPnYVU6xhd0p8h4uFq3ZLwo2v4k7Vt+0cwV06/T28aOqhqnX6/Vm6O
         vK2hrCJqjZSdxPEQLAzhaUaQfjPUhrUzRl8Sm7lE8xnlIHeigwUrKL9iQWGZ0S+/EqBM
         kfvsA377kicEBaIfLjWyAsptopGNUCbRHvBPyNn1ih8Ax7JmAGtr9HyXeBIc5XvWSezA
         OQd6H3A4Pz1I1nxrjQLVNL+xTB+Y/cDsppn6cs4EyPR3+hc3i7FO9OC0/8tTomi2jlbO
         wkmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ovQJ+nxLPgIkYbuQt2SCQKzxVuaVAKxPiX+Ud+yngTY=;
        b=mT3h5R1apy3xpDjL/SNMVThRFkvvgHbI/Vij3saICiM+G3bssoNS8JXcsWxSI6TF2Q
         6EUr2d+hKN4KZn6gdc+xgJepCoL9t+C+4/RZl0MOAswV9GDbqVm6+Bzq4z8llftUE4TQ
         MFMySFGQK9mKmDATKIOUMcRDv7m4gIci6rmg7JQJx0iFu3t37oe714MRN+fd+Ya+t122
         kqn+XxQPO2+93bsY/SjCEPtmCHsKwGOn4iHFsH0vn1WR7oYDHRXsFYduEjIRXtu928e5
         qCrF+ConsDXa0QezbqGYGjz6hePXtLccHGA48DwlQLKHvldmyMgWP1P7iojEvQatBkup
         ZMCQ==
X-Gm-Message-State: AOAM531Ly9vfaqZ6kqh1RgQ0zXTefC6txpel5v4XuHUM6GtHx772SHXN
        H0YmeItIxxU/VxmjW6ZA/71gmv6l
X-Google-Smtp-Source: ABdhPJw73cbPplV8KFd2PJxjrIwAqhVcwVIxNEO/gK1/CetMp7W8w3S2dltFFYXMsAz0u9PiABkTAw==
X-Received: by 2002:a1c:7215:: with SMTP id n21mr3337969wmc.10.1592315678136;
        Tue, 16 Jun 2020 06:54:38 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id f9sm28542733wre.65.2020.06.16.06.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 06:54:36 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 45/73] arm64: tegra: Add interrupt-names for host1x
Date:   Tue, 16 Jun 2020 15:52:10 +0200
Message-Id: <20200616135238.3001888-46-thierry.reding@gmail.com>
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

Interrupt names are used to distinguish between the syncpoint and
general host1x interrupts. Make sure they are available in the DT so
that drivers can use them if necessary.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra132.dtsi | 1 +
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 1 +
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 1 +
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 1 +
 4 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra132.dtsi b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
index 6ebfe503489f..76e1a6451e83 100644
--- a/arch/arm64/boot/dts/nvidia/tegra132.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
@@ -89,6 +89,7 @@ host1x@50000000 {
 		reg = <0x0 0x50000000 0x0 0x00034000>;
 		interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>, /* syncpt */
 			     <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>; /* general */
+		interrupt-names = "syncpt", "host1x";
 		clocks = <&tegra_car TEGRA124_CLK_HOST1X>;
 		clock-names = "host1x";
 		resets = <&tegra_car 28>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index decf8de3bbe5..e86b682f8645 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -940,6 +940,7 @@ host1x@13e00000 {
 		reg-names = "hypervisor", "vm";
 		interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>,
 		             <GIC_SPI 263 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "syncpt", "host1x";
 		clocks = <&bpmp TEGRA186_CLK_HOST1X>;
 		clock-names = "host1x";
 		resets = <&bpmp TEGRA186_RESET_HOST1X>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 73aba724bf67..f056158a2634 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -1042,6 +1042,7 @@ host1x@13e00000 {
 			reg-names = "hypervisor", "vm";
 			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 263 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "syncpt", "host1x";
 			clocks = <&bpmp TEGRA194_CLK_HOST1X>;
 			clock-names = "host1x";
 			resets = <&bpmp TEGRA194_RESET_HOST1X>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index cbf0d30a2f8b..0586722df64b 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -90,6 +90,7 @@ host1x@50000000 {
 		reg = <0x0 0x50000000 0x0 0x00034000>;
 		interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>, /* syncpt */
 			     <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>; /* general */
+		interrupt-names = "syncpt", "host1x";
 		clocks = <&tegra_car TEGRA210_CLK_HOST1X>;
 		clock-names = "host1x";
 		resets = <&tegra_car 28>;
-- 
2.24.1


Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69FC71FB2DC
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Jun 2020 15:55:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728908AbgFPNzU (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 Jun 2020 09:55:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728553AbgFPNzT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Jun 2020 09:55:19 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33EBCC06174E
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:55:18 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id x6so20834835wrm.13
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DYB4ZQuwwNsunJcbJiGNqX7khMQEkKhMmXCNYYxaz60=;
        b=ZkeIOyMY20cgfc6MeantZhoDn2yL2yD7tR5u5gSKkEYgdZ5XujQHp1Wj23YxKWgbZd
         syUEjg/GVJh6djWzI5bPvLbaAaTOgy78GK18r9eF2Q81ZVhUZ7vfqcRH0tZ7fIs5oQTl
         JIN7nIF5BIjZ3AexyiOWM0BmHUHfOusIcFo/xaWTJhDlpIazLrBSwgN2mQ6+ovNJZtQz
         R9vG3i6CW22fGqkrNyr9QDXUyNm8jIOr+G7kFLKsFYqngS4+IENTZzXhMbSxX6G+XpEl
         RjkpU7zLRNOITlgvNq1/a8lqx6MwGtPdxw/6SYeM/z/f0CXA+sbhtOsFroV1EDsKgCwU
         AphQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DYB4ZQuwwNsunJcbJiGNqX7khMQEkKhMmXCNYYxaz60=;
        b=SpbJ6qxxCfFW1NxiwNtlTRV6h6ih3LilvjeMmj3k54MLmxCYW0VDYha6Q65iDdBxO1
         JPnkyeC+Wgj/5vTJroxBo3CXbxPcd/xhlnw38I6KEpsmaZCXHdygV0JYdx1dND1S6J1z
         JswkmP5tgWDer9qIZ7geWYxkBij4H5xbQo0s60yzKhjeMrpKopyvTUH2k2FhefLfRj2T
         iSRkH94UU7HVIjFVEucDhwPcEnzKj33YxMulFsO/eJWvIbnuALIeWZJVpgQsV+lsiF0r
         EZT/AYDycDyIKAyqXfvdv0lgs8DXE7Am3IgVxjJ5htuX/JtKqbbDCRP9Wll5AOM1dDB3
         6nrg==
X-Gm-Message-State: AOAM5319249b+1uyqMgDAqs3XnpwcGU0iSe3vbYleK13ZFYau7gDwtw+
        +uhYwSV2sJm/V9oe1tS6H6Y=
X-Google-Smtp-Source: ABdhPJzXtOXZ/Pr4tVIFt6IhJt+h/kNErRYDhKHu5XKd8rkuicdDSouvUdSE+ansNiBx1ctl//tM5w==
X-Received: by 2002:adf:d851:: with SMTP id k17mr3181118wrl.30.1592315716913;
        Tue, 16 Jun 2020 06:55:16 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id f9sm28545072wre.65.2020.06.16.06.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 06:55:16 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 63/73] arm64: tegra: Remove XUSB pad controller interrupt from XUSB node
Date:   Tue, 16 Jun 2020 15:52:28 +0200
Message-Id: <20200616135238.3001888-64-thierry.reding@gmail.com>
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

The XUSB controller doesn't need the XUSB pad controller's interrupt, so
remove it.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 3 +--
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index b4150d8cccf5..1cd369ac48d2 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -568,8 +568,7 @@ usb@3530000 {
 		      <0x0 0x03538000 0x0 0x1000>;
 		reg-names = "hcd", "fpci";
 		interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>;
+			     <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&bpmp TEGRA186_CLK_XUSB_HOST>,
 			 <&bpmp TEGRA186_CLK_XUSB_FALCON>,
 			 <&bpmp TEGRA186_CLK_XUSB_SS>,
diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index bf696ada856c..4d6f2127dd4a 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -688,8 +688,7 @@ usb@3610000 {
 			reg-names = "hcd", "fpci";
 
 			interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
 
 			clocks = <&bpmp TEGRA194_CLK_XUSB_CORE_HOST>,
 				 <&bpmp TEGRA194_CLK_XUSB_FALCON>,
-- 
2.24.1


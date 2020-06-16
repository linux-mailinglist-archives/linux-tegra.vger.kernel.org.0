Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E63331FB2AE
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Jun 2020 15:54:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728931AbgFPNyE (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 Jun 2020 09:54:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728899AbgFPNyE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Jun 2020 09:54:04 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E80EFC061573
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:54:03 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id l26so2969178wme.3
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tMYaQdji6zR5lZgb0sKLhTaK1Jb/52l/cl/I/Gv3TlY=;
        b=dpTouy5lnSQNwoKZkllwZ8r+NnHAugELmJre2azRgCaQxs5E5VP/CHt559N+CRRAJc
         r38la9JiGOAAgaAbB4vgHn+YjfN9gnaC3acHsy1NP8dTezZirBLxLUQpPdHuTPRFqOG6
         S/AnbWdTVqfJcTl0VQqCI9NANyHEI28uZL7ZyzAlo2eYP5bqNOgCgU+FKfI+Xnii9Bbg
         AVDO1YqUWkb5H3vQo780+pJd7AufKtya7nEGgp02RK73QzU5T2LRbs9KalwYtmjpeuVz
         12+6gsGppT6hPxq5VrxH0ZUY0Ari+gnw2Uir6EdF8yQ2es93YWReAj1dubVuk0ZAPKZw
         kNRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tMYaQdji6zR5lZgb0sKLhTaK1Jb/52l/cl/I/Gv3TlY=;
        b=iluASDekYBQT6DFWMdJmbBhiZmzfq6EtL0XLtxKWclK25WDDweH8GZldiW2p1f+zVa
         aPryEemPpVo699Z0b06YDjcauZUnkRCLZVJ0nYhhtQtBnhapU3yf1WRtrH4USdjC4cUv
         9rRJ1yq3qwdkMmQ3mDhjl1fDxJ2sfhu5XDaM58Wb5ctIaRSU/IOReISrJFvp6j41cq83
         t+yGllJMOqS1LhfRayGotw5I4/Xso3JDbMdYvfY464sbr1uIOaMo7vX+QSeEWvYWj+4c
         +Cxi/XoXesiRgE+VmtlBSL+r2aCmo9PqkjFoNOYg2g42mSq57hq0HEPrBFj6bUMPs6ho
         YmtQ==
X-Gm-Message-State: AOAM531Kwh7ISvKm2CQzRf+O8RKyTH3vacj0TKbSAlbvqgdo768NsgrR
        V4Bmd0R/DpMaG//e2/8G9Nw=
X-Google-Smtp-Source: ABdhPJyqXi3fI4wDpzEil4M7ad15F2TY4dvEOrQvYWH6fnTkBq/azOgr+vucDNV5uc/ts6EfAesU6g==
X-Received: by 2002:a7b:cb18:: with SMTP id u24mr3441539wmj.67.1592315642652;
        Tue, 16 Jun 2020 06:54:02 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id 67sm30302842wrk.49.2020.06.16.06.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 06:54:01 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 30/73] ARM: tegra: Use standard names for SRAM nodes
Date:   Tue, 16 Jun 2020 15:51:55 +0200
Message-Id: <20200616135238.3001888-31-thierry.reding@gmail.com>
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

SRAM nodes should be named sram@<unit-address> to match the bindings.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/tegra20.dtsi | 4 ++--
 arch/arm/boot/dts/tegra30.dtsi | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index ccd2995aef83..2568236284ad 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -17,14 +17,14 @@ memory@0 {
 		reg = <0 0>;
 	};
 
-	iram@40000000 {
+	sram@40000000 {
 		compatible = "mmio-sram";
 		reg = <0x40000000 0x40000>;
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0 0x40000000 0x40000>;
 
-		vde_pool: vde@400 {
+		vde_pool: sram@400 {
 			reg = <0x400 0x3fc00>;
 			pool;
 		};
diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index f838e4775cf6..690e1628860f 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -97,14 +97,14 @@ pci@3,0 {
 		};
 	};
 
-	iram@40000000 {
+	sram@40000000 {
 		compatible = "mmio-sram";
 		reg = <0x40000000 0x40000>;
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0 0x40000000 0x40000>;
 
-		vde_pool: vde@400 {
+		vde_pool: sram@400 {
 			reg = <0x400 0x3fc00>;
 			pool;
 		};
-- 
2.24.1


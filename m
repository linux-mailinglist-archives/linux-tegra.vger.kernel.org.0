Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F28091FB2A1
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Jun 2020 15:53:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728917AbgFPNxg (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 Jun 2020 09:53:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726306AbgFPNxf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Jun 2020 09:53:35 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 673DFC061573
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:53:35 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id x13so20855838wrv.4
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iXboMnPmHQIHtE6HM9vw2yFF9ZSbpIwzP+DcxPet0tM=;
        b=Gzss4fSM87UaJzKPYU1n97qDJ/Lt4naG7zj/ylaKOxQcfvgQwlOVEPEJVfJK5HwM1g
         cjls36HJTPepPLCgXPKKpyp2TQgU+EwueaQMze1ymSMXJSK1shpEAZXlG8rzy++Sn2Mq
         mh90+tN3dXKLYTR8DpTZhG4xLQtsdLcUojWAR6e61jOqSt+yLqn7V7tNftayIolSudFG
         PdnRju7Yx0u8evzXHo61udcbBSjq2Ct/AXv2s2ze/HB33F64IwJVB5nQN2of81qtphjJ
         xs1qfXCbvqOrkdjT/XoB1c+BgqiWpOgDQ8QFX/Rs+CMtLo59O7+77vSABlNIri8MMjUT
         9Alw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iXboMnPmHQIHtE6HM9vw2yFF9ZSbpIwzP+DcxPet0tM=;
        b=HpatDkY9oiESTC1+FPns2v2NFj3HbP/yMw90NJ11IVPzrSpvk7tKIq4b3cBCZ/cUug
         VXRueaUR8RBAhlJJDOTPppsPPrNBUt7oir8nHc9E+SkKVskhwy9bKce6ihyY4l3NP/bs
         SuNFEtcDmkX/buOPHVSd4mWNTqSkoXimqOGANo9q31raF+GPvJ8Sx77dTGB5Br7cYimD
         Ihlm7vKThnf0x61w6BqE7IGVxNnW/FU8MicIYsilgMZKevC2ntke+nSX4BMqoCpl/iIK
         TdgzzSqgXvDGqGdCVsUxYT09q6IML4Wslumjkylu9NyyS/f130BK0+LgJGtdama4UTHE
         G1DQ==
X-Gm-Message-State: AOAM532I+MIOwNIf2wsuieltPouoU5ehYv+ak27kpGNrqN8SRaBVVGYP
        zpi+4hjNl3/zSIyrDcBWGFs=
X-Google-Smtp-Source: ABdhPJwAabq2qictYV0u1lT6v7v69dvOMKqGISfWlUh+49ofOGrc8/Ekt+ENvEQoYlPLglQJr4Dw1w==
X-Received: by 2002:adf:f003:: with SMTP id j3mr3224077wro.228.1592315614149;
        Tue, 16 Jun 2020 06:53:34 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id n204sm4389946wma.5.2020.06.16.06.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 06:53:33 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 21/73] ARM: tegra: Add missing panel power supplies on Nyan
Date:   Tue, 16 Jun 2020 15:51:46 +0200
Message-Id: <20200616135238.3001888-22-thierry.reding@gmail.com>
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

Both Nyan boards are missing panel power supplies. Add them.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/tegra124-nyan-big.dts   | 1 +
 arch/arm/boot/dts/tegra124-nyan-blaze.dts | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/tegra124-nyan-big.dts b/arch/arm/boot/dts/tegra124-nyan-big.dts
index 4d14dec21af6..1d2aac2cb6d0 100644
--- a/arch/arm/boot/dts/tegra124-nyan-big.dts
+++ b/arch/arm/boot/dts/tegra124-nyan-big.dts
@@ -16,6 +16,7 @@ / {
 	panel: panel {
 		compatible = "auo,b133xtn01";
 
+		power-supply = <&vdd_3v3_panel>;
 		backlight = <&backlight>;
 		ddc-i2c-bus = <&dpaux>;
 	};
diff --git a/arch/arm/boot/dts/tegra124-nyan-blaze.dts b/arch/arm/boot/dts/tegra124-nyan-blaze.dts
index 2a029ee86dd7..677babde6460 100644
--- a/arch/arm/boot/dts/tegra124-nyan-blaze.dts
+++ b/arch/arm/boot/dts/tegra124-nyan-blaze.dts
@@ -18,6 +18,7 @@ / {
 	panel: panel {
 		compatible = "samsung,ltn140at29-301";
 
+		power-supply = <&vdd_3v3_panel>;
 		backlight = <&backlight>;
 		ddc-i2c-bus = <&dpaux>;
 	};
-- 
2.24.1


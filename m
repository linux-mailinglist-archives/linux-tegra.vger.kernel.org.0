Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DCFFDA1776
	for <lists+linux-tegra@lfdr.de>; Thu, 29 Aug 2019 12:57:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726379AbfH2K4v (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 29 Aug 2019 06:56:51 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:38196 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725782AbfH2K4v (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 29 Aug 2019 06:56:51 -0400
Received: by mail-ed1-f67.google.com with SMTP id r12so3582228edo.5
        for <linux-tegra@vger.kernel.org>; Thu, 29 Aug 2019 03:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gSZBaKB3oMwwjSK37zhZj4ARDRbprCvK1TtdCv+zEls=;
        b=QAp1ZFX4EsN+PAu2oLbX+zJ3qE5D6oivYUEWgQ4xHkNOXKa960tEkn4JWlVdklPdpc
         MT7iydZzSe8D2H4r93LLwiUyMyXFAYsFxx2y5sEGxyRCMk3LLyeZtNlvNfiYO4ENMxZ5
         B8TRDirBGqBbwotVHVtlV14oR4hX412KkTjIQ9zfDkP/A3qFVwhf7+Wqs9WWj7CA7jIW
         4EM01I93u2+7+rk690Ox/LKqhIrhE/CyeLpyJzMljAB5n2zK+E239SxTeUVdwrnlaJei
         Snx1sTwzFGDQnQ+w95wUlIqJEZJGXgf+ItO/GL53KC5UPtUSiZ7P54BUghOQ/VRzMm+e
         gxQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gSZBaKB3oMwwjSK37zhZj4ARDRbprCvK1TtdCv+zEls=;
        b=GV9ScNnPx16gHCiBp/7JLD5COxRaf7S6xJZPLaVm7L5dQI7wfOCTbjTsP4MCCLF4qx
         NSjaTfrhW7ooP8rRjEvj4TAtCjnjt7p+bZNSbHM6uievptYfVsT5evINmCbfEleWcJOk
         kK9hI8CNzpN2xXo9NILvTFcgLmomKPyoH/ESUvBRrFnW8GQwhs3ERXKvNZTjD4aYfvSS
         Rx5b7h9KBWG3ciywOtsrdhmiFHowYKW6C5T6zXJWYX5jlKEWyfI43cGDKgRnuHZRM3HS
         6sOkhCOM8MAvPgRy+9JSddMJ7FUx81LCb8w1hbM8UB494miEkdcUAEuQ1GdHFrrrWVbx
         rGqw==
X-Gm-Message-State: APjAAAXmwMG6GZ9FSMa7QMRmKTEX9GDn+FO/aw/U1xWyVVxMo6Wq3jl+
        BbawABBlxCV0XvC5rbjSRZo=
X-Google-Smtp-Source: APXvYqyyJ0DJqixgafoJvXx6ACihdAkR5aY/oy/QNbRLKTgAocQei2KWIu1xe2zwS2yxfo1kMk9HHg==
X-Received: by 2002:a17:907:2134:: with SMTP id qo20mr7592543ejb.295.1567076209866;
        Thu, 29 Aug 2019 03:56:49 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
        by smtp.gmail.com with ESMTPSA id b18sm374854eds.68.2019.08.29.03.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 03:56:48 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: tegra: Hook up edp interrupt on Tegra210 SOCTHERM
Date:   Thu, 29 Aug 2019 12:56:47 +0200
Message-Id: <20190829105647.15212-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

For some reason this was never hooked up. Do it now so that over-current
interrupts can be logged.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 2db208f20191..a20cd368a772 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -1458,7 +1458,9 @@
 		reg = <0x0 0x700e2000 0x0 0x600 /* SOC_THERM reg_base */
 			0x0 0x60006000 0x0 0x400>; /* CAR reg_base */
 		reg-names = "soctherm-reg", "car-reg";
-		interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "thermal", "edp";
 		clocks = <&tegra_car TEGRA210_CLK_TSENSOR>,
 			<&tegra_car TEGRA210_CLK_SOC_THERM>;
 		clock-names = "tsensor", "soctherm";
-- 
2.22.0


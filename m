Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05C5A1FB2E3
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Jun 2020 15:55:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729040AbgFPNzh (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 Jun 2020 09:55:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729001AbgFPNzd (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Jun 2020 09:55:33 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92C8DC061573
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:55:31 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id e1so20912196wrt.5
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Bn1siE7j5QgVJ2P/0HXryBjQl66K/xnjGvXsbTL+kqQ=;
        b=NlQD9HdswI3+kQ0ylBD+r/kCIVPm0kyt8CDC9V5C+kEtu3MKMuyiLKNAQlkaxW3lyw
         z+3zO4MC3JUBUkirt2pbgdz/gMbbqJPOTPjZ4H1ALdXWQEzRXhG5TEal9HHNf24S4Hd9
         V/8QwDkws7bw0J9Pdti3SZqpgqyMXuE7QjIuNa5reGYRX3raaHucCeLd0snInrK5rVTC
         lP5NUp3GoNVAQH3iJQ7K/FTPDnMeEwrrzHQt71NCoAIPdp93WrZMLGYkK97D0C4MJmln
         s9RVho2hrwEQ+LM5ibDu5vILl8sHkzin/rVoMYmFfhPVGadWu2n4q4L7hxwC8dcX9q7J
         8qSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Bn1siE7j5QgVJ2P/0HXryBjQl66K/xnjGvXsbTL+kqQ=;
        b=MIV8mVgezctdBMOKRNKjnazxGyNB2AQHLedkUEAU6ecDSQrnZLstPutl1pZmalTwWP
         +q6kMCjXV2Va/7S7feX0m47S/TGYOe/GejAydYn2hEwO5xqkvXZACVqbcsMGYrPrPXR4
         OpgKLK/ilXqV7aH3S9aa43g3wRvcWLFZRBGjIIIphKrPskQyblDGZGiFxsoqFWJaqPsA
         Kyw5LG6E/dQhRpoOkBJODMG6U+USN8GtesQqq3srIZGtDusaKCOjeeUHb99sdm7H/JPs
         F4leYHjZwgRncHqmr8JkryDmHfVGXr3Urm6HDvtEWxjx0pHBIRXaE4gEqx1J+BJfAuMm
         64NQ==
X-Gm-Message-State: AOAM531HbHdN5LzP6Rw9ryGr/mz4i/RcyViS+xFLwgNXXslPHqRnDuRv
        ZVay2S69r80gg6qT6eaNueUfNpNf
X-Google-Smtp-Source: ABdhPJxCMHFkReSqDHQAMRCTmOevakodwkUPBhsFcNJTNyIT7KpTWMGsc2hvmCJ4YGTlnfQsXAWsrQ==
X-Received: by 2002:a05:6000:104f:: with SMTP id c15mr3178128wrx.391.1592315730029;
        Tue, 16 Jun 2020 06:55:30 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id a16sm29260858wrx.8.2020.06.16.06.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 06:55:29 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 69/73] arm64: tegra: Rename agic -> interrupt-controller
Date:   Tue, 16 Jun 2020 15:52:34 +0200
Message-Id: <20200616135238.3001888-70-thierry.reding@gmail.com>
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

Device tree nodes for interrupt controllers should be named "interrupt-
controller", so rename the AGIC accordingly.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts | 2 +-
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts      | 2 +-
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts b/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
index 0c0d51c23975..0ccb62606bef 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
@@ -119,7 +119,7 @@ dma@702e2000 {
 			status = "okay";
 		};
 
-		agic@702f9000 {
+		interrupt-controller@702f9000 {
 			status = "okay";
 		};
 	};
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
index cc0d7b4a5834..f7840e5e069a 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
@@ -1717,7 +1717,7 @@ dma@702e2000 {
 			status = "okay";
 		};
 
-		agic@702f9000 {
+		interrupt-controller@702f9000 {
 			status = "okay";
 		};
 	};
diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 02a02ed1b264..c265211f8a84 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -1355,7 +1355,7 @@ adma: dma@702e2000 {
 			status = "disabled";
 		};
 
-		agic: agic@702f9000 {
+		agic: interrupt-controller@702f9000 {
 			compatible = "nvidia,tegra210-agic";
 			#interrupt-cells = <3>;
 			interrupt-controller;
-- 
2.24.1


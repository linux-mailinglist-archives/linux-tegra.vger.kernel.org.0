Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0021A1FB29A
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Jun 2020 15:53:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728931AbgFPNxZ (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 Jun 2020 09:53:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728959AbgFPNxU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Jun 2020 09:53:20 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE2EBC061573
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:53:19 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id j10so20859757wrw.8
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XpGkTMQdujnzyohBXq/7v3DemG3fJUl2YFtinCTqAhM=;
        b=DQBDaZr73gv6rw1M5gWUzeXuMVdsi28IHqKnomFwpwXMH+sGvpUDjvy8P+HpjKY/eQ
         AV3X5BVQZtT8KZpwNnYKTedRTD5t0eHGdqMB2tc8vilPLpr8Q8+t1LZs3GE4uv43xXHL
         sTC0SjA8WeUFQu6pTZe4ntuebdLt6LveH8FnL3jAKh9fvbTm8J2wQNpiWJcq9i8xJql+
         Kly4Q5rSW4QnEYIadKyZYKjjQHDwjgVlPv4DT5128JWhqbOMmlIR2G+S2CVpz0bLyb/U
         kC2UK3gNMsu2LGlCxxOrrLsX6H0o52S7hM2SndGPV+uvGXnaKlsU19PVQQrjarSrNi3a
         Xh0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XpGkTMQdujnzyohBXq/7v3DemG3fJUl2YFtinCTqAhM=;
        b=O7hIm85Po5MphBWO1RqOYl07Gb0EUzwOTuCybSur4pQw91NW2sKaKiVVbGZa2JR/YW
         BPdxu95ZGuUidq3JZVDXG0CcKBeAaxdoDXpSKBNid7oci8k17vlJvlsotWVa0FjJTKxo
         NXJCqfFHE5ZuTREpGCCdE7c1mZYcz1i9W2htVKwZCwPs+TzmirhNMPVo0c1OvlY6Nfev
         S3buuUfKI/DyR71/yb0Q3zhfJj9bUc8nFvrabxnPgLGVgdDiLO0QIDMwJAklalMYyz8X
         4C/gVoUD0FfsC7GbiuhoBJ7AF7w2fMYdeULdlunN3D4AuPnpQXnicRRWp83gpk6GnkVY
         9V7w==
X-Gm-Message-State: AOAM5326mG9rWkc5UqLoB7jO8CbcS6giOr4m5v/0adX+oeZj8r7XKiNV
        4hJmjWwLy/XsxVd6D/KUJDJQAqEd
X-Google-Smtp-Source: ABdhPJxwsfvHvCrtLWZl/D+5u711U9x9i70B1QBdR4g7zl4F8o5Cf6s3RzcBsPd33G18r0vq6zkgFw==
X-Received: by 2002:a5d:4d4d:: with SMTP id a13mr3248962wru.252.1592315598704;
        Tue, 16 Jun 2020 06:53:18 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id w17sm30538823wra.71.2020.06.16.06.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 06:53:17 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 14/73] ARM: tegra: Tegra114 SDHCI is not backwards-compatible
Date:   Tue, 16 Jun 2020 15:51:39 +0200
Message-Id: <20200616135238.3001888-15-thierry.reding@gmail.com>
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

The SDHCI controller instantiated on Tegra114 is not backwards-
compatible with the version on Tegra30, so remove the corresponding
compatible string.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/tegra114.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi
index 69e0e3eeffb4..88632d8d0bde 100644
--- a/arch/arm/boot/dts/tegra114.dtsi
+++ b/arch/arm/boot/dts/tegra114.dtsi
@@ -645,7 +645,7 @@ mipi: mipi@700e3000 {
 	};
 
 	mmc@78000000 {
-		compatible = "nvidia,tegra114-sdhci", "nvidia,tegra30-sdhci";
+		compatible = "nvidia,tegra114-sdhci";
 		reg = <0x78000000 0x200>;
 		interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA114_CLK_SDMMC1>;
@@ -656,7 +656,7 @@ mmc@78000000 {
 	};
 
 	mmc@78000200 {
-		compatible = "nvidia,tegra114-sdhci", "nvidia,tegra30-sdhci";
+		compatible = "nvidia,tegra114-sdhci";
 		reg = <0x78000200 0x200>;
 		interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA114_CLK_SDMMC2>;
@@ -667,7 +667,7 @@ mmc@78000200 {
 	};
 
 	mmc@78000400 {
-		compatible = "nvidia,tegra114-sdhci", "nvidia,tegra30-sdhci";
+		compatible = "nvidia,tegra114-sdhci";
 		reg = <0x78000400 0x200>;
 		interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA114_CLK_SDMMC3>;
@@ -678,7 +678,7 @@ mmc@78000400 {
 	};
 
 	mmc@78000600 {
-		compatible = "nvidia,tegra114-sdhci", "nvidia,tegra30-sdhci";
+		compatible = "nvidia,tegra114-sdhci";
 		reg = <0x78000600 0x200>;
 		interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA114_CLK_SDMMC4>;
-- 
2.24.1


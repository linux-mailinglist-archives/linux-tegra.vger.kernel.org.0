Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 979B61FB2B0
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Jun 2020 15:54:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728553AbgFPNyI (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 Jun 2020 09:54:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728899AbgFPNyG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Jun 2020 09:54:06 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECD85C061573
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:54:05 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id d128so3178141wmc.1
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IvqY4q4DC8wmUVG9y7FJtCDdIsu08hGHLIyN1vg73Fs=;
        b=jttMGiL+Q4csJzhn2Ol/uy4X7sitxf1eDThGniOc/UH4rb9cWVc06eGU39cshmzywX
         e7a35YM/GlXBsx9duIUGYpkKT5p9VSzPJVOLm9AgftiqpZJSYtvTqfnrdg+VXsBmRpuj
         TydYsw+KL5pQYq2+BEr51C2ZBKk3qgMEVgcsBKcCQAQGowzJ/iTtYdfqWo2UKm0az3XG
         OVzwYHQeWQrMg1tlsn7IGxlGLlQAbHvycxqeHxTVubEt8b6BDrgYrf1CzDC5c72ESTh5
         F7Vxv62d3A7Z4g/Kief8YhVTumcWJLxv3Mgu9HI/R9nYxe4drTpt/2TW1pU9KVhSvMvo
         GXdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IvqY4q4DC8wmUVG9y7FJtCDdIsu08hGHLIyN1vg73Fs=;
        b=h9rgHi0YHrp1sjGfE35U2aWhNqhGiH7lvZPwJjpjlWaRfSfQb/9NST0yNVdocjadp3
         7E7i77NxYUxoWTFMHFdqcw2zdOFXn523Vxwa78q6Xp0rZrWltwXh3dH4T6xyJdUvYXPo
         iwtMbT34Vk9EAJZOqeWV150U9k6egm0E8ajwhjiwgL/fzMKmrDdm4CLH/lqMMLw8/tnn
         DfYX9hniWvX0gLApGtFX0AknviNtrmnooaKcBVnmq7PaQAvfs9FyfQ6cvmEgChM/jouh
         kv5rJzTRXK7kKGVIvCFcSKOyBcIdzLcy1bUqBjgpiaHqkDYYLMCSvCMynYwCwAqtD1cC
         fQWw==
X-Gm-Message-State: AOAM532IGzOnemg3yt5Q9GXY1NnNDLtkAefpfmPlW1m2X0ccqRSMGL6Z
        G1chW5sofipDuKDN5sGYDeU=
X-Google-Smtp-Source: ABdhPJwC1XcwS+3qA7bwc+eN4nmKzW+jEOyXH+9PsT2cd4xYAYa247dLNBU+WaNY1N3vWnpdjwvRrQ==
X-Received: by 2002:a05:600c:4102:: with SMTP id j2mr3328009wmi.48.1592315644736;
        Tue, 16 Jun 2020 06:54:04 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id a16sm29256154wrx.8.2020.06.16.06.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 06:54:03 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 31/73] ARM: tegra: Add parent clock to DSI output
Date:   Tue, 16 Jun 2020 15:51:56 +0200
Message-Id: <20200616135238.3001888-32-thierry.reding@gmail.com>
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

The DSI output needs to specify a parent clock that will be used to
drive both the output and the display controller.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/tegra20.dtsi | 4 +++-
 arch/arm/boot/dts/tegra30.dtsi | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index 2568236284ad..19d5d4b8692b 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -154,7 +154,9 @@ tvo@542c0000 {
 		dsi@54300000 {
 			compatible = "nvidia,tegra20-dsi";
 			reg = <0x54300000 0x00040000>;
-			clocks = <&tegra_car TEGRA20_CLK_DSI>;
+			clocks = <&tegra_car TEGRA20_CLK_DSI>,
+				 <&tegra_car TEGRA20_CLK_PLL_D_OUT0>;
+			clock-names = "dsi", "parent";
 			resets = <&tegra_car 48>;
 			reset-names = "dsi";
 			status = "disabled";
diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index 690e1628860f..d80f9d3d2d18 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -255,7 +255,9 @@ tvo@542c0000 {
 		dsi@54300000 {
 			compatible = "nvidia,tegra30-dsi";
 			reg = <0x54300000 0x00040000>;
-			clocks = <&tegra_car TEGRA30_CLK_DSIA>;
+			clocks = <&tegra_car TEGRA30_CLK_DSIA>,
+				 <&tegra_car TEGRA30_CLK_PLL_D_OUT0>;
+			clock-names = "dsi", "parent";
 			resets = <&tegra_car 48>;
 			reset-names = "dsi";
 			status = "disabled";
-- 
2.24.1


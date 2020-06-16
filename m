Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 026DF1FB2C4
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Jun 2020 15:54:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729014AbgFPNyw (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 Jun 2020 09:54:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728899AbgFPNyq (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Jun 2020 09:54:46 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B368C061573
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:54:45 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id x6so20832824wrm.13
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=paV2/lzaaYtE0qLJUFbXRABKclhl9jvXwdX7NaIXuEY=;
        b=kiWhB3Q4vWX/BBoj1SOl0UWp8e/mjdevzaMdWYctfAjA3zuohZX0VrkR83/4exm3rC
         BH1ss/xgmEV9UhiDtEWqsdLmTAiCYat2tuYhpYea1Si3rINPtS5m9NeA+J9fr2MQ1zf5
         M2b1t/NWLz9KzAywd+Du3u2w8uIkm+lviwFK6qIMtCEjETZSI5FcZi/VaHZRml2NMVUE
         WzjuriJIcPgKfEt36K6sxp5SvNHzALjHAmVHUBx8ilPo1g//1rXJ4IUM5+0rihDcAPWo
         oswJQee/FPDNqs4iuwxF99ywlHJHlBGifAQXirL/cn1K3p+43Qg1E7zxVvBbbdf/C7DW
         /AzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=paV2/lzaaYtE0qLJUFbXRABKclhl9jvXwdX7NaIXuEY=;
        b=Y7UuV9Pnl2PPaW0R/S1hxCieWJLJD9WGtd1UFoRxRHO/OOAnvyRtvB4G5TTmtSq6Nz
         hEj3IgZrC+DcxogJDsZTz3mTsjfzubwfOjlfQGjoKbf9AaGeF8vZ4RAIFyftjexB0Gzo
         /VFpmALLV5PYwNkcWCHLGa9zAKG9ebyJTZu/YboEjaVWFtY2veI/1G/bxovumejGxauL
         pUNkBsAeu31l9hbIKnE3kled0qpHSH2hui8aYPMVzQQ+j+BqV+bt0E1K5HnJZrwoKr9o
         wDqZdkBb6v7XaJdZKCrWJoTJyKX0SNXxqDEzTw4mKUI4IQLuGL16qgvrKRkwJD4my/b2
         BPaA==
X-Gm-Message-State: AOAM530DeIvP9CCUjiTfUMT6jDJcvGEcwOTxSsiHWjeuJaxm/Ns2SHoE
        +iGI3jRoDIVvuvF1lhEjUliGdF6r
X-Google-Smtp-Source: ABdhPJyUVeHZpiYWbGSkTjpWrhvyad1M/+wRQ+DahRg2ImY9mhTq9slYjpdm09KuYe22r4Njr7xzmg==
X-Received: by 2002:adf:bb02:: with SMTP id r2mr3374038wrg.143.1592315684328;
        Tue, 16 Jun 2020 06:54:44 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id n23sm4015644wmc.0.2020.06.16.06.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 06:54:43 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 48/73] arm64: tegra: Add unit-address to memory node
Date:   Tue, 16 Jun 2020 15:52:13 +0200
Message-Id: <20200616135238.3001888-49-thierry.reding@gmail.com>
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

The memory node requires a unit-address. For some boards the bootloader,
which is usually locked down, uses a hard-coded name for the memory node
without a unit-address, so we can't fix it on those boards.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra132-norrin.dts     | 2 +-
 arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi     | 2 +-
 arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi     | 2 +-
 arch/arm64/boot/dts/nvidia/tegra210-p2530.dtsi     | 2 +-
 arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi     | 2 +-
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts b/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
index 9f3206c63900..d0d03cc30197 100644
--- a/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
@@ -18,7 +18,7 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory {
+	memory@80000000 {
 		device_type = "memory";
 		reg = <0x0 0x80000000 0x0 0x80000000>;
 	};
diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
index de049d8d458a..7b5b9bb332cf 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
@@ -27,7 +27,7 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory {
+	memory@80000000 {
 		device_type = "memory";
 		reg = <0x0 0x80000000 0x2 0x00000000>;
 	};
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
index cc6ed45a2b48..751775357d51 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
@@ -17,7 +17,7 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory {
+	memory@80000000 {
 		device_type = "memory";
 		reg = <0x0 0x80000000 0x1 0x0>;
 	};
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2530.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2530.dtsi
index d0dc03923723..9ace2d9ea085 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2530.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2530.dtsi
@@ -14,7 +14,7 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory {
+	memory@80000000 {
 		device_type = "memory";
 		reg = <0x0 0x80000000 0x0 0xc0000000>;
 	};
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi
index 88a4b9333d84..615a8f5a6cf2 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi
@@ -16,7 +16,7 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory {
+	memory@80000000 {
 		device_type = "memory";
 		reg = <0x0 0x80000000 0x0 0xc0000000>;
 	};
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
index e7ebf1afeb7a..e6f4a36efa73 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
@@ -22,7 +22,7 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory {
+	memory@80000000 {
 		device_type = "memory";
 		reg = <0x0 0x80000000 0x1 0x0>;
 	};
-- 
2.24.1


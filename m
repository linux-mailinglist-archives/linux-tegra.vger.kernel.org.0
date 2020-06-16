Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A7D81FB2DB
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Jun 2020 15:55:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728899AbgFPNzT (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 Jun 2020 09:55:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728553AbgFPNzS (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Jun 2020 09:55:18 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 440BDC061573
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:55:16 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id x14so20885685wrp.2
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0FIwhGeWIKDzcDiXiL9U9G/fCD/sufAWQaOGk+U5mF8=;
        b=EGRqQsipzL1m6G88lpuZb4k+ImdYyA5qiAQeTodpNx51qmqHzgLJ08BZc5KdrnYTB8
         S8DV6VY4CypWGQ8X/+C/VlivZhRrlvKf4AaS+Cf/90RqgyUSGWE/vpaXnzgNXUt3ePrT
         n2dx4RiA8/l99SpjT0QShY18fXumSHMovKIaEbXwh1iX/cH52o2zHQSuSMeLEfBJvPUt
         S4ywvpx9MZzZt0M2NG6vhJB6WB7Pi9BkO9uGMINNoKjH9qVrTFVQBE6vOyLGOj4eKtlL
         JDWclzLj9YuhkqhgeUfamnfFOZs3hYqNYs/EJVwrmGp1UgpgAToNEA4R/KDHEz0qjSh3
         mpHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0FIwhGeWIKDzcDiXiL9U9G/fCD/sufAWQaOGk+U5mF8=;
        b=Ao0ucU/rK2WKigcMG42/0wpqOtsKlmzyUgxTVIKKGSGKmmQJX6uoH306PWf4DSaMd+
         XyB+i8tQhZ0bJ2ISC1puvEsGnrHPCWatPATBZO3rXA3+ZlyJsX8Ny+JBZ/MgqYKCoW29
         017xI7eEjkIzn1hTwBy3n4jl4obdStED7+qFLxk/l74BBhb9/IVYre2r5Ar/cdAwRhTn
         HgqcG9GDaZNaWOGjpc8DCojagGq/QB3hmHSd+HMopmhZI0I1HvFkfpP2+PjibpH7cTGS
         7vRC6EvqEY28rs/xrcnL5VQE8pnwCxlyX3x5fsjflAnsHgVG5me5QBCRLw1KZO9JSAqe
         EdLQ==
X-Gm-Message-State: AOAM531K977eEvwNmvQFsV42KgAItRXic/f2/y75L0bQe7v8LRELJyfW
        kNUG97f6mESL5JalTHuqm3k=
X-Google-Smtp-Source: ABdhPJwLlzLH8D8CFE7XROw4UUZo1RS1KiY0uDKZ36wx84SvyVCaL0wEle5caKQBa6INHFIjByUaNA==
X-Received: by 2002:a05:6000:10d2:: with SMTP id b18mr3182753wrx.366.1592315715034;
        Tue, 16 Jun 2020 06:55:15 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id z9sm3919624wmi.41.2020.06.16.06.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 06:55:14 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 62/73] arm64: tegra: Use standard EEPROM properties
Date:   Tue, 16 Jun 2020 15:52:27 +0200
Message-Id: <20200616135238.3001888-63-thierry.reding@gmail.com>
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

The address-bits and page-size properties that are currently used are
not valid properties according to the bindings. Use the address-width
and pagesize properties instead.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 4 ++--
 arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi     | 4 ++--
 arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi     | 4 ++--
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts | 4 ++--
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 8 ++++----
 5 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
index 4a7a022acabb..a70fd4e86840 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
@@ -222,8 +222,8 @@ eeprom@57 {
 			reg = <0x57>;
 
 			vcc-supply = <&vdd_1v8>;
-			address-bits = <8>;
-			page-size = <8>;
+			address-width = <8>;
+			pagesize = <8>;
 			size = <256>;
 			read-only;
 		};
diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
index b5568b9ff181..654c55ed048b 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
@@ -174,8 +174,8 @@ eeprom@50 {
 			reg = <0x50>;
 
 			vcc-supply = <&vdd_1v8>;
-			address-bits = <8>;
-			page-size = <8>;
+			address-width = <8>;
+			pagesize = <8>;
 			size = <256>;
 			read-only;
 		};
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
index d818fac3070c..6a4b50aaa25d 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
@@ -274,8 +274,8 @@ eeprom@50 {
 			reg = <0x50>;
 
 			vcc-supply = <&vdd_1v8>;
-			address-bits = <8>;
-			page-size = <8>;
+			address-width = <8>;
+			pagesize = <8>;
 			size = <256>;
 			read-only;
 		};
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts b/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
index eb46f745d75f..0c0d51c23975 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
@@ -84,8 +84,8 @@ eeprom@57 {
 			reg = <0x57>;
 
 			vcc-supply = <&vdd_1v8>;
-			address-bits = <8>;
-			page-size = <8>;
+			address-width = <8>;
+			pagesize = <8>;
 			size = <256>;
 			read-only;
 		};
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
index ac17f5485bf8..beec6aab2157 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
@@ -116,8 +116,8 @@ eeprom@50 {
 			reg = <0x50>;
 
 			vcc-supply = <&vdd_1v8>;
-			address-bits = <8>;
-			page-size = <8>;
+			address-width = <8>;
+			pagesize = <8>;
 			size = <256>;
 			read-only;
 		};
@@ -127,8 +127,8 @@ eeprom@57 {
 			reg = <0x57>;
 
 			vcc-supply = <&vdd_1v8>;
-			address-bits = <8>;
-			page-size = <8>;
+			address-width = <8>;
+			pagesize = <8>;
 			size = <256>;
 			read-only;
 		};
-- 
2.24.1


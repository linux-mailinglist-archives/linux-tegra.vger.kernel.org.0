Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30242222219
	for <lists+linux-tegra@lfdr.de>; Thu, 16 Jul 2020 14:02:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728237AbgGPMBp (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 16 Jul 2020 08:01:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727030AbgGPMBp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 16 Jul 2020 08:01:45 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC834C061755
        for <linux-tegra@vger.kernel.org>; Thu, 16 Jul 2020 05:01:44 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id by13so4544217edb.11
        for <linux-tegra@vger.kernel.org>; Thu, 16 Jul 2020 05:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RGzlhIDf11tNP1zXaXLjOUJqzRwSsXDiT+7NMFFWKcw=;
        b=DP9BDdtmCmgpzq3zvzGH2jXQqnp1xW7eIyWMVcambvt4BkVmu0yTKgCbvkWmBrQprw
         q9V0UkF/AjWta06zFdDV8JnwALU1wO7M7gtBovvRWJMV5Pu+E3Owquuy96GWkcYdB7/M
         m2zhHQ1kEFrNAfYHrF6AUHXYgQEVrSDLCxiGzEKfup5XdnB7oNY9TdEbZP8Q5oWRlEyY
         OHlROgaLjWxfvmDPmAk5FaYIzkobnBJ3MCC/8tHZSbRrmUFJrmP86jPz4VTlIm8MOu2e
         mfQzuR+dE6CrSKS4/gO84mXcWaPtLpcBVAPUlaTUaE/MwMG6+PQUC2EGEQqHFaAsiSbu
         uz7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RGzlhIDf11tNP1zXaXLjOUJqzRwSsXDiT+7NMFFWKcw=;
        b=uP7DTEPKdAzYbJSb/Z4E3ic23x0RGrIQKHEWdBDv6Zt0OJj4ijInRmg9i+KNX2KZMr
         KhlkCtTi+j/gX9XRdIFRv93k0lExf7nAdZmavhnI+HMEjhW9xkngAMiY+SlTEOaPnNG4
         9KrVnKyft0f7+QC7O69J6jPgTB8JWuOWfnNQwwbla0B1V0v1UTVsDsvMrjLxtu0LTfCh
         02Lwza/pAu5YJhzuLcKZwD626NSkx1bjLsZvEezCAGS/QjAvpUDVHUgoHYxLigkIwoTf
         2AulMkSpvdK9hU5aGZUCxRSCj7m8urbzhnol0tRGs4PHNHAAnO3wPLdKDA1PxgLWdtH4
         VTjw==
X-Gm-Message-State: AOAM532oxJZGHk1SK+vGb6hP+/OEhjWN1Kjifa2143pfqtnlCx9s6/gT
        ZEOYtdYOGvLANDlexc/RQHE=
X-Google-Smtp-Source: ABdhPJyJ/TyZ9kFtVcvhEHoJ2Gf+AekS/mPletUxA+yq6UlwFGfuJf/pUIGS9xTtZGK5/VJUsdjw6A==
X-Received: by 2002:aa7:df08:: with SMTP id c8mr4031307edy.372.1594900903236;
        Thu, 16 Jul 2020 05:01:43 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id x18sm1711178ejs.23.2020.07.16.05.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 05:01:42 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Terje Bergstrom <tbergstrom@nvidia.com>,
        Debarshi Dutta <ddutta@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: tegra: Add the GPU on Tegra194
Date:   Thu, 16 Jul 2020 14:01:38 +0200
Message-Id: <20200716120138.532906-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The GPU found on NVIDIA Tegra194 SoCs is a Volta generation GPU called
GV11B.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 33 ++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 259e40469908..f559fe983ebe 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -1395,6 +1395,39 @@ sor3: sor@15bc0000 {
 				nvidia,interface = <3>;
 			};
 		};
+
+		gpu@17000000 {
+			compatible = "nvidia,gv11b";
+			reg = <0x17000000 0x10000000>,
+			      <0x18000000 0x10000000>;
+			interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "stall", "nonstall";
+			clocks = <&bpmp TEGRA194_CLK_GPCCLK>,
+				 <&bpmp TEGRA194_CLK_GPU_PWR>;
+			clock-names = "gpu", "pwr";
+			resets = <&bpmp TEGRA194_RESET_GPU>;
+			reset-names = "gpu";
+			status = "disabled";
+
+			power-domains = <&bpmp TEGRA194_POWER_DOMAIN_GPU>;
+			interconnects = <&mc TEGRA194_MEMORY_CLIENT_NVL1R &emc>,
+					<&mc TEGRA194_MEMORY_CLIENT_NVL1RHP &emc>,
+					<&mc TEGRA194_MEMORY_CLIENT_NVL1W &emc>,
+					<&mc TEGRA194_MEMORY_CLIENT_NVL2R &emc>,
+					<&mc TEGRA194_MEMORY_CLIENT_NVL2RHP &emc>,
+					<&mc TEGRA194_MEMORY_CLIENT_NVL2W &emc>,
+					<&mc TEGRA194_MEMORY_CLIENT_NVL3R &emc>,
+					<&mc TEGRA194_MEMORY_CLIENT_NVL3RHP &emc>,
+					<&mc TEGRA194_MEMORY_CLIENT_NVL3W &emc>,
+					<&mc TEGRA194_MEMORY_CLIENT_NVL4R &emc>,
+					<&mc TEGRA194_MEMORY_CLIENT_NVL4RHP &emc>,
+					<&mc TEGRA194_MEMORY_CLIENT_NVL4W &emc>;
+			interconnect-names = "dma-mem", "read-0-hp", "write-0",
+					     "read-1", "read-1-hp", "write-1",
+					     "read-2", "read-2-hp", "write-2",
+					     "read-3", "read-3-hp", "write-3";
+		};
 	};
 
 	pcie@14100000 {
-- 
2.27.0


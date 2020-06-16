Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3B7E1FB2B6
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Jun 2020 15:54:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728803AbgFPNyX (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 Jun 2020 09:54:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728815AbgFPNyV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Jun 2020 09:54:21 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 333D5C06174E
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:54:21 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id b6so1729719wrs.11
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Q+qDaBmogzp3rENt1OG4yOphWjq8JVCDpGzP7ggeRUE=;
        b=F15k2Y0dRr1PfVU0cOR9rJidj02ntjM5osYJpN1Q7522vgCLGYIGRxfbeEwbV0q5GB
         cjPcGPv4miJk8NnsLhCCmG94vfL18zhaZhCjMCY/vLQsm3W420ihgVWEQilPZOibZ2gA
         cc/IHIl/t/DHIo0CEJ/9WZf53ogMVgrNsAez4qBfZpN8NuPvoK4p93V0pn5Ne4lIPCw9
         9lXy6+p/EupWYWkm93HIWQaif+nb+zH5UeGrdVY7jTe7vKEl+O9iG+C5Ut2aAxYMY69R
         q3zKH0B3Vknk+jHT1QmNw4fLjtuYXgRy+tRES60GGshE0MAl296P5qamEdVe+8PZRzPm
         bQwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Q+qDaBmogzp3rENt1OG4yOphWjq8JVCDpGzP7ggeRUE=;
        b=VGGWJ1K73YIXbIeOR7XZniJG5DaING+y3ED4GE0wJalasGKWclqAjgzVN14IBx7Uk2
         iP2mi2pCOTuushnLq1zwKcMbHZcFANIQbURkFOmxGkQXCzNNgN6vMGSpZ25asDw0jOPk
         Bhp9IWrdQTrBbIqHhplIZVbsnzGfIIg2/8LdE9LahSBDVvASDgvOprBTbT5r942WX8sB
         TWeLFq0pJZv3brt9Ow9QIZ4WqgV3Cu9tLxGZ+lbrT8d8hUgVDnZfRNSgceMAgopIxGGF
         kI0HEVih7Z0psuzhcJyxzwy/NKKhsVotSXkZ4XvvxIyTqM1WKG3ll+fMiSnSRQYRxGEj
         2l3g==
X-Gm-Message-State: AOAM530HqZdm76qfbXued3phg1+gO9cU/s+L8awW0osxQsnU2uMWlX78
        sxDMJ6HkjS/fF+xglqiUITvg10+P
X-Google-Smtp-Source: ABdhPJw85hnj9ARPHTZVDw2ajb6UG35sRgBJqf2472xqfKzPrPrvL70ttg/oUH2a/S5dRw7iS/zsfw==
X-Received: by 2002:adf:9b9e:: with SMTP id d30mr3280508wrc.345.1592315659931;
        Tue, 16 Jun 2020 06:54:19 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id b81sm4430697wmc.5.2020.06.16.06.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 06:54:18 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 37/73] arm64: tegra: Fix #address-cells/#size-cells for SRAM on Tegra186
Date:   Tue, 16 Jun 2020 15:52:02 +0200
Message-Id: <20200616135238.3001888-38-thierry.reding@gmail.com>
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

The standard mmio-sram bindings require the #address- and #size-cells
properties to be 1.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index 58100fb9cd8b..373f575b8678 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -1216,20 +1216,20 @@ gpu@17000000 {
 	sysram@30000000 {
 		compatible = "nvidia,tegra186-sysram", "mmio-sram";
 		reg = <0x0 0x30000000 0x0 0x50000>;
-		#address-cells = <2>;
-		#size-cells = <2>;
-		ranges = <0 0x0 0x0 0x30000000 0x0 0x50000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x0 0x0 0x30000000 0x50000>;
 
 		cpu_bpmp_tx: shmem@4e000 {
 			compatible = "nvidia,tegra186-bpmp-shmem";
-			reg = <0x0 0x4e000 0x0 0x1000>;
+			reg = <0x4e000 0x1000>;
 			label = "cpu-bpmp-tx";
 			pool;
 		};
 
 		cpu_bpmp_rx: shmem@4f000 {
 			compatible = "nvidia,tegra186-bpmp-shmem";
-			reg = <0x0 0x4f000 0x0 0x1000>;
+			reg = <0x4f000 0x1000>;
 			label = "cpu-bpmp-rx";
 			pool;
 		};
-- 
2.24.1


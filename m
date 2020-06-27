Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFEBD20BE9C
	for <lists+linux-tegra@lfdr.de>; Sat, 27 Jun 2020 06:56:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726527AbgF0E4Q (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sat, 27 Jun 2020 00:56:16 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:14265 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726525AbgF0E4Q (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 27 Jun 2020 00:56:16 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ef6d1400000>; Fri, 26 Jun 2020 21:55:28 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 26 Jun 2020 21:56:16 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 26 Jun 2020 21:56:16 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 27 Jun
 2020 04:56:15 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Sat, 27 Jun 2020 04:56:15 +0000
Received: from audio.nvidia.com (Not Verified[10.24.34.185]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5ef6d16a0001>; Fri, 26 Jun 2020 21:56:15 -0700
From:   Sameer Pujar <spujar@nvidia.com>
To:     <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
        <kuninori.morimoto.gx@renesas.com>, <robh+dt@kernel.org>,
        <lgirdwood@gmail.com>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <digetx@gmail.com>, <alsa-devel@alsa-project.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sharadg@nvidia.com>, <mkumard@nvidia.com>,
        <viswanathl@nvidia.com>, <rlokhande@nvidia.com>,
        <dramesh@nvidia.com>, <atalambedu@nvidia.com>,
        <nwartikar@nvidia.com>, <swarren@nvidia.com>,
        <nicoleotsuka@gmail.com>, Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH v4 22/23] arm64: tegra: Enable AHUB components on few Tegra platforms
Date:   Sat, 27 Jun 2020 10:23:44 +0530
Message-ID: <1593233625-14961-23-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
References: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1593233728; bh=rCHyHBw4OWamU3QbZHAZPO0cPzPEiPrMOO2b40srcwc=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:Content-Type;
        b=sPeLkXArvs0cHaAv3h18jp9bmS+hyDCBHlIGDLKg3AAfMJISV8QIK++yT2Z00Y9s9
         vzRvcxm37LMx2CAHiU0bwvTSuhx8Uxf80MOvpdbjXKYdO7i9zilwZNtm42kwySKYsC
         5rifARAlucoPvzAFZMMjgrG1VZyEGQLcVXZY6VYX9Ai0ZaEF+VgNBt2ax/YjgXs3AE
         MQY/tfxDkqvGFdV7jzCUgUXoX2yPOOQPxbADQnQI/58DIPVRORYmRSEuv+u02eCRWB
         gggRm07Nt467lGMhHo01SUUGnR73qOEBZj+pV3f6xrgdT1lgJTuJIw99URnJy461ft
         sxzXzJASvtZ+g==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This patch enables AHUB, ADMAIF modules for following Tegra platforms.
Along with this specific instances of I/O modules are enabled as per
the board design.

 * Jetson TX1
   - I2S1, I2S2, I2S3, I2S4 and I2S5
   - DMIC1, DMIC2 and DMIC3

 * Jetson Nano
   - I2S3 and I2S4
   - DMIC1 and DMIC2

 * Jetson TX2
   - I2S1, I2S2, I2S3, I2S4, I2S5 and I2S6
   - DMIC1, DMIC2 and DMIC3
   - DSPK2

 * Jetson AGX Xavier
   - I2S1, I2S2, I2S4 and I2S6
   - DMIC2 and DMIC3
   - DSPK1

This helps to register above components with ASoC core.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 48 ++++++++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts | 36 ++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts | 42 ++++++++++++++++++-
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 36 ++++++++++++++++
 4 files changed, 161 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
index a70fd4e..cb24b81 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
@@ -20,6 +20,54 @@
 		interrupt-controller@2a40000 {
 			status = "okay";
 		};
+
+		ahub@2900800 {
+			status = "okay";
+
+			admaif@290f000 {
+				status = "okay";
+			};
+
+			i2s@2901000 {
+				status = "okay";
+			};
+
+			i2s@2901100 {
+				status = "okay";
+			};
+
+			i2s@2901200 {
+				status = "okay";
+			};
+
+			i2s@2901300 {
+				status = "okay";
+			};
+
+			i2s@2901400 {
+				status = "okay";
+			};
+
+			i2s@2901500 {
+				status = "okay";
+			};
+
+			dmic@2904000 {
+				status = "okay";
+			};
+
+			dmic@2904100 {
+				status = "okay";
+			};
+
+			dmic@2904200 {
+				status = "okay";
+			};
+
+			dspk@2905100 {
+				status = "okay";
+			};
+		};
 	};
 
 	i2c@3160000 {
diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
index 90b6ea5..f71c3bd 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
@@ -21,6 +21,42 @@
 			interrupt-controller@2a40000 {
 				status = "okay";
 			};
+
+			ahub@2900800 {
+				status = "okay";
+
+				admaif@290f000 {
+					status = "okay";
+				};
+
+				i2s@2901000 {
+					status = "okay";
+				};
+
+				i2s@2901100 {
+					status = "okay";
+				};
+
+				i2s@2901300 {
+					status = "okay";
+				};
+
+				i2s@2901500 {
+					status = "okay";
+				};
+
+				dmic@2904100 {
+					status = "okay";
+				};
+
+				dmic@2904200 {
+					status = "okay";
+				};
+
+				dspk@2905000 {
+					status = "okay";
+				};
+			};
 		};
 
 		ddc: i2c@31c0000 {
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts b/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
index 56adf28..3c21137 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
@@ -118,12 +118,52 @@
 	aconnect@702c0000 {
 		status = "okay";
 
-		dma@702e2000 {
+		dma-controller@702e2000 {
 			status = "okay";
 		};
 
 		interrupt-controller@702f9000 {
 			status = "okay";
 		};
+
+		ahub@702d0800 {
+			status = "okay";
+
+			admaif@702d0000 {
+				status = "okay";
+			};
+
+			i2s@702d1000 {
+				status = "okay";
+			};
+
+			i2s@702d1100 {
+				status = "okay";
+			};
+
+			i2s@702d1200 {
+				status = "okay";
+			};
+
+			i2s@702d1300 {
+				status = "okay";
+			};
+
+			i2s@702d1400 {
+				status = "okay";
+			};
+
+			dmic@702d4000 {
+				status = "okay";
+			};
+
+			dmic@702d4100 {
+				status = "okay";
+			};
+
+			dmic@702d4200 {
+				status = "okay";
+			};
+		};
 	};
 };
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
index 9b63469..721f66c 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
@@ -806,4 +806,40 @@
 
 		vin-supply = <&avdd_1v05_pll>;
 	};
+
+	aconnect@702c0000 {
+		status = "okay";
+
+		dma-controller@702e2000 {
+			status = "okay";
+		};
+
+		interrupt-controller@702f9000 {
+			status = "okay";
+		};
+
+		ahub@702d0800 {
+			status = "okay";
+
+			admaif@702d0000 {
+				status = "okay";
+			};
+
+			i2s@702d1200 {
+				status = "okay";
+			};
+
+			i2s@702d1300 {
+				status = "okay";
+			};
+
+			dmic@702d4000 {
+				status = "okay";
+			};
+
+			dmic@702d4100 {
+				status = "okay";
+			};
+		};
+	};
 };
-- 
2.7.4


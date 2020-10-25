Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D09CA298463
	for <lists+linux-tegra@lfdr.de>; Sun, 25 Oct 2020 23:21:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1419296AbgJYWSU (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 25 Oct 2020 18:18:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1419291AbgJYWSS (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 25 Oct 2020 18:18:18 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77CC0C0613D4;
        Sun, 25 Oct 2020 15:18:18 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id c141so9409738lfg.5;
        Sun, 25 Oct 2020 15:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qWoeVer2DQ4Ci/3B8ME3CGqRj1U6D4IaN098JD3Mytg=;
        b=gxb+k1hf+1EwD78Exn86L0lJ4S+8qfCUwVItqgrv55I8MhOlS9Klk9RWUjExHu4HQ9
         jlUnoDv6T2njdB+cUajN6QyoKSs1lZCFr9S21eeY29jbWIE4RuKWd8ChgLGhL0bTX335
         af5B1lBJEQ7P7t9YfNtQfrlIsiZTu+FD+pRd7CbUIa2n2VJPL8TAtu+8QOBOvuNeVdxE
         nj/w8L/LxEX+MYyu2NYsNrjN4qyYCssgfXUzPEBWd+mSXhz0XeFaNxieR4/hAN4pw+t5
         CcpyeHf90IczdrswKl41AwtyBLV5z0egy3RJ0YvvlLTXu3nEqHuS7F5Y0ya9UZtu4TTi
         uXng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qWoeVer2DQ4Ci/3B8ME3CGqRj1U6D4IaN098JD3Mytg=;
        b=on4YeCF7NSTkrEbMtB1L0eRXYMiTQy4Hp5lBpYYNNELypPYzZh/TYCGxCVPg1CKAkX
         TMPDITKBHMuXuYIi3nCXGAS8g/HSHp4emhl5yuKfOCoz2AuoODcrElnLLpPvSQT/dPBu
         8Jpz+WS7qP68vo0bcB209DF1iABeJKc77AcApx/Vc3cM704Ryz8RFRy8VAW8Z794VYGL
         TkMxOGPKwKlpAJXSNffCZHx9UlOJahD8zbbREr+LU6YmP0ll+fJLIghHlrpgSZ3rAPWf
         QvkI+FeY7HAuDQixY8IjTp5RQfBffO/r4LSUWDQID2cA/ozTqF8AvIn0xf4uiE34je8O
         G32A==
X-Gm-Message-State: AOAM53282EKI8jSOKSHqrrNpknehePIVsOxTBsRL/C0AeF1L/dMLb5tq
        TFyx2TnZcXb4PwNK6lKEHys=
X-Google-Smtp-Source: ABdhPJy8F3ekilkLnsZ4j+jlUn3nnCvjuMLTsROqeMJeSfte9RBFfuUzA/bp0DJzIiFVvGdGqZm8PQ==
X-Received: by 2002:a19:7009:: with SMTP id h9mr4427340lfc.201.1603664296977;
        Sun, 25 Oct 2020 15:18:16 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-186.dynamic.spd-mgts.ru. [109.252.193.186])
        by smtp.gmail.com with ESMTPSA id k13sm932423ljh.136.2020.10.25.15.18.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2020 15:18:16 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Mikko Perttunen <cyndis@kapsi.fi>,
        Viresh Kumar <vireshk@kernel.org>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org
Subject: [PATCH v6 25/52] ARM: tegra: Add DVFS properties to Tegra20 EMC device-tree node
Date:   Mon, 26 Oct 2020 01:17:08 +0300
Message-Id: <20201025221735.3062-26-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201025221735.3062-1-digetx@gmail.com>
References: <20201025221735.3062-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add EMC OPP DVFS/DFS tables and emc-stats subdev that will be used for
dynamic memory bandwidth scaling, while EMC itself will perform voltage
scaling. Update board device-trees with optional EMC core supply and
remove unsupported OPPs.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../boot/dts/tegra20-acer-a500-picasso.dts    |  12 ++
 arch/arm/boot/dts/tegra20-colibri.dtsi        |   8 +
 arch/arm/boot/dts/tegra20-paz00.dts           |  10 +
 .../arm/boot/dts/tegra20-peripherals-opp.dtsi | 181 ++++++++++++++++++
 arch/arm/boot/dts/tegra20.dtsi                |  12 +-
 5 files changed, 222 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/tegra20-peripherals-opp.dtsi

diff --git a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
index a0b829738e8f..f5c1591c8ea8 100644
--- a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
+++ b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
@@ -1058,9 +1058,21 @@ map0 {
 		};
 	};
 
+	emc_opp_table0 {
+		/delete-node/ opp@666000000;
+		/delete-node/ opp@760000000;
+	};
+
+	emc_opp_table1 {
+		/delete-node/ opp@666000000;
+		/delete-node/ opp@760000000;
+	};
+
 	memory-controller@7000f400 {
 		nvidia,use-ram-code;
 
+		core-supply = <&vdd_core>;
+
 		emc-tables@0 {
 			nvidia,ram-code = <0>; /* elpida-8gb */
 
diff --git a/arch/arm/boot/dts/tegra20-colibri.dtsi b/arch/arm/boot/dts/tegra20-colibri.dtsi
index 6162d193e12c..78a2210bf9ae 100644
--- a/arch/arm/boot/dts/tegra20-colibri.dtsi
+++ b/arch/arm/boot/dts/tegra20-colibri.dtsi
@@ -611,6 +611,14 @@ i2c-thermtrip {
 		};
 	};
 
+	emc_opp_table0 {
+		/delete-node/ opp@760000000;
+	};
+
+	emc_opp_table1 {
+		/delete-node/ opp@760000000;
+	};
+
 	memory-controller@7000f400 {
 		emc-table@83250 {
 			reg = <83250>;
diff --git a/arch/arm/boot/dts/tegra20-paz00.dts b/arch/arm/boot/dts/tegra20-paz00.dts
index ada2bed8b1b5..7b9f0f279744 100644
--- a/arch/arm/boot/dts/tegra20-paz00.dts
+++ b/arch/arm/boot/dts/tegra20-paz00.dts
@@ -311,9 +311,19 @@ nvec@7000c500 {
 		reset-names = "i2c";
 	};
 
+	emc_opp_table0 {
+		/delete-node/ opp@760000000;
+	};
+
+	emc_opp_table1 {
+		/delete-node/ opp@760000000;
+	};
+
 	memory-controller@7000f400 {
 		nvidia,use-ram-code;
 
+		core-supply = <&core_vdd_reg>;
+
 		emc-tables@0 {
 			nvidia,ram-code = <0x0>;
 			#address-cells = <1>;
diff --git a/arch/arm/boot/dts/tegra20-peripherals-opp.dtsi b/arch/arm/boot/dts/tegra20-peripherals-opp.dtsi
new file mode 100644
index 000000000000..d10c61107702
--- /dev/null
+++ b/arch/arm/boot/dts/tegra20-peripherals-opp.dtsi
@@ -0,0 +1,181 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/ {
+	emc_icc_dvfs_opp_table: emc_opp_table0 {
+		compatible = "operating-points-v2";
+
+		opp@36000000 {
+			opp-microvolt = <950000 950000 1300000>;
+			opp-hz = /bits/ 64 <36000000>;
+		};
+
+		opp@47500000 {
+			opp-microvolt = <950000 950000 1300000>;
+			opp-hz = /bits/ 64 <47500000>;
+		};
+
+		opp@50000000 {
+			opp-microvolt = <950000 950000 1300000>;
+			opp-hz = /bits/ 64 <50000000>;
+		};
+
+		opp@54000000 {
+			opp-microvolt = <950000 950000 1300000>;
+			opp-hz = /bits/ 64 <54000000>;
+		};
+
+		opp@57000000 {
+			opp-microvolt = <950000 950000 1300000>;
+			opp-hz = /bits/ 64 <57000000>;
+		};
+
+		opp@100000000 {
+			opp-microvolt = <1000000 1000000 1300000>;
+			opp-hz = /bits/ 64 <100000000>;
+		};
+
+		opp@108000000 {
+			opp-microvolt = <1000000 1000000 1300000>;
+			opp-hz = /bits/ 64 <108000000>;
+		};
+
+		opp@126666000 {
+			opp-microvolt = <1000000 1000000 1300000>;
+			opp-hz = /bits/ 64 <126666000>;
+		};
+
+		opp@150000000 {
+			opp-microvolt = <1000000 1000000 1300000>;
+			opp-hz = /bits/ 64 <150000000>;
+		};
+
+		opp@190000000 {
+			opp-microvolt = <1000000 1000000 1300000>;
+			opp-hz = /bits/ 64 <190000000>;
+		};
+
+		opp@216000000 {
+			opp-microvolt = <1000000 1000000 1300000>;
+			opp-hz = /bits/ 64 <216000000>;
+		};
+
+		opp@300000000 {
+			opp-microvolt = <1000000 1000000 1300000>;
+			opp-hz = /bits/ 64 <300000000>;
+		};
+
+		opp@333000000 {
+			opp-microvolt = <1000000 1000000 1300000>;
+			opp-hz = /bits/ 64 <333000000>;
+		};
+
+		opp@380000000 {
+			opp-microvolt = <1100000 1100000 1300000>;
+			opp-hz = /bits/ 64 <380000000>;
+		};
+
+		opp@600000000 {
+			opp-microvolt = <1200000 1200000 1300000>;
+			opp-hz = /bits/ 64 <600000000>;
+		};
+
+		opp@666000000 {
+			opp-microvolt = <1200000 1200000 1300000>;
+			opp-hz = /bits/ 64 <666000000>;
+		};
+
+		opp@760000000 {
+			opp-microvolt = <1300000 1300000 1300000>;
+			opp-hz = /bits/ 64 <760000000>;
+		};
+	};
+
+	emc_bw_dfs_opp_table: emc_opp_table1 {
+		compatible = "operating-points-v2";
+
+		opp@36000000 {
+			opp-hz = /bits/ 64 <36000000>;
+			opp-peak-kBps = <144000>;
+		};
+
+		opp@47500000 {
+			opp-hz = /bits/ 64 <47500000>;
+			opp-peak-kBps = <190000>;
+		};
+
+		opp@50000000 {
+			opp-hz = /bits/ 64 <50000000>;
+			opp-peak-kBps = <200000>;
+		};
+
+		opp@54000000 {
+			opp-hz = /bits/ 64 <54000000>;
+			opp-peak-kBps = <216000>;
+		};
+
+		opp@57000000 {
+			opp-hz = /bits/ 64 <57000000>;
+			opp-peak-kBps = <228000>;
+		};
+
+		opp@100000000 {
+			opp-hz = /bits/ 64 <100000000>;
+			opp-peak-kBps = <400000>;
+		};
+
+		opp@108000000 {
+			opp-hz = /bits/ 64 <108000000>;
+			opp-peak-kBps = <432000>;
+		};
+
+		opp@126666000 {
+			opp-hz = /bits/ 64 <126666000>;
+			opp-peak-kBps = <506664>;
+		};
+
+		opp@150000000 {
+			opp-hz = /bits/ 64 <150000000>;
+			opp-peak-kBps = <600000>;
+		};
+
+		opp@190000000 {
+			opp-hz = /bits/ 64 <190000000>;
+			opp-peak-kBps = <760000>;
+		};
+
+		opp@216000000 {
+			opp-hz = /bits/ 64 <216000000>;
+			opp-peak-kBps = <864000>;
+		};
+
+		opp@300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+			opp-peak-kBps = <1200000>;
+		};
+
+		opp@333000000 {
+			opp-hz = /bits/ 64 <333000000>;
+			opp-peak-kBps = <1332000>;
+		};
+
+		opp@380000000 {
+			opp-hz = /bits/ 64 <380000000>;
+			opp-peak-kBps = <1520000>;
+		};
+
+		opp@600000000 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-peak-kBps = <2400000>;
+		};
+
+		opp@666000000 {
+			opp-hz = /bits/ 64 <666000000>;
+			opp-peak-kBps = <2664000>;
+		};
+
+		opp@760000000 {
+			opp-hz = /bits/ 64 <760000000>;
+			opp-peak-kBps = <3040000>;
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index 8f8ad81916e7..8a90d96c8773 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -6,6 +6,8 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/soc/tegra-pmc.h>
 
+#include "tegra20-peripherals-opp.dtsi"
+
 / {
 	compatible = "nvidia,tegra20";
 	interrupt-parent = <&lic>;
@@ -656,7 +658,7 @@ mc: memory-controller@7000f000 {
 	};
 
 	emc: memory-controller@7000f400 {
-		compatible = "nvidia,tegra20-emc";
+		compatible = "nvidia,tegra20-emc", "simple-mfd";
 		reg = <0x7000f400 0x400>;
 		interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA20_CLK_EMC>;
@@ -664,7 +666,15 @@ emc: memory-controller@7000f400 {
 		#size-cells = <0>;
 		#interconnect-cells = <0>;
 
+		operating-points-v2 = <&emc_icc_dvfs_opp_table>;
 		nvidia,memory-controller = <&mc>;
+
+		emc-stats {
+			compatible = "nvidia,tegra20-emc-statistics";
+			operating-points-v2 = <&emc_bw_dfs_opp_table>;
+			interconnects = <&mc TEGRA20_MC_MPCORER &emc>;
+			interconnect-names = "cpu-read";
+		};
 	};
 
 	fuse@7000f800 {
-- 
2.27.0


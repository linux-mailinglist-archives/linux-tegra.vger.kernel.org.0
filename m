Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFAC12AF822
	for <lists+linux-tegra@lfdr.de>; Wed, 11 Nov 2020 19:36:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727439AbgKKSfd (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 11 Nov 2020 13:35:33 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:5438 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727622AbgKKSfY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 11 Nov 2020 13:35:24 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fac2ee70000>; Wed, 11 Nov 2020 10:35:19 -0800
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 11 Nov
 2020 18:35:24 +0000
Received: from audio.nvidia.com (10.124.1.5) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Wed, 11 Nov 2020 18:35:21 +0000
From:   Sameer Pujar <spujar@nvidia.com>
To:     <broonie@kernel.org>, <robh+dt@kernel.org>,
        <thierry.reding@gmail.com>
CC:     <jonathanh@nvidia.com>, <kuninori.morimoto.gx@renesas.com>,
        <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sharadg@nvidia.com>, Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH v5 6/6] arm64: tegra: Audio graph sound card for Jetson Nano and TX1
Date:   Thu, 12 Nov 2020 00:04:36 +0530
Message-ID: <1605119676-32273-7-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605119676-32273-1-git-send-email-spujar@nvidia.com>
References: <1605119676-32273-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1605119719; bh=zgnKJF1VjTOw8+8MA5BXzpvmueNYvLnvIUw8iNhEnkY=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Type;
        b=YESGiiWmhkwGbgPKqJ68byGgZSu460J/PGmmg5TF0MqSbln3y6MV7lYZvQBtvbGrv
         t1E0IQFr6x9F0vellPjssIxtXNveIE8/QsbyiLPv4AwX/8dMTZT1qeKiPyrRjKcO+e
         D4OxMQ2VWH8URyQYE4tdq2e7YD2bwFhFOnNJEaE5mr4Ui4+45HbZS/FVxPEnt/8Z4d
         Gyci0mHZKCo1f4/AaGTDHmNtAE299+q6q/yB2MAsNIrF44OlLI0Jt3ZSAj2FUHm+nW
         CLrN8vHWApgrVc7Bbrs+L7dPhwtZBoNMN/7CquSz3cBBkmSJEU5k+kcUjojNrXQbB/
         okOcNB4lf5ovg==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Enable support for audio-graph based sound card on Jetson-Nano and
Jetson-TX1. Depending on the platform, required I/O interfaces are
enabled.

 * Jetson-Nano: Enable I2S3, I2S4, DMIC1 and DMIC2.
 * Jetson-TX1: Enable all I2S and DMIC interfaces.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts | 262 +++++++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 146 ++++++++++++
 2 files changed, 408 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts b/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
index 69102dc..747ab93 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
@@ -3,6 +3,7 @@
 
 #include "tegra210-p2180.dtsi"
 #include "tegra210-p2597.dtsi"
+#include "tegra210-audio-graph.dtsi"
 
 / {
 	model = "NVIDIA Jetson TX1 Developer Kit";
@@ -127,4 +128,265 @@
 			status = "okay";
 		};
 	};
+
+	tegra_sound {
+		status = "okay";
+
+		compatible = "nvidia,tegra210-audio-graph-card";
+
+		dais = /* FE */
+		       <&admaif1_port>, <&admaif2_port>, <&admaif3_port>,
+		       <&admaif4_port>, <&admaif5_port>, <&admaif6_port>,
+		       <&admaif7_port>, <&admaif8_port>, <&admaif9_port>,
+		       <&admaif10_port>,
+		       /* Router */
+		       <&xbar_i2s1_port>, <&xbar_i2s2_port>, <&xbar_i2s3_port>,
+		       <&xbar_i2s4_port>, <&xbar_i2s5_port>, <&xbar_dmic1_port>,
+		       <&xbar_dmic2_port>, <&xbar_dmic3_port>,
+		       /* I/O DAP Ports */
+		       <&i2s1_port>, <&i2s2_port>, <&i2s3_port>, <&i2s4_port>,
+		       <&i2s5_port>, <&dmic1_port>, <&dmic2_port>, <&dmic3_port>;
+
+		label = "jetson-tx1-ape";
+	};
+};
+
+&tegra_admaif {
+	status = "okay";
+};
+
+&tegra_ahub {
+	status = "okay";
+
+	ports {
+		xbar_i2s1_port: port@a {
+			reg = <0xa>;
+			xbar_i2s1_ep: endpoint {
+				remote-endpoint = <&i2s1_cif_ep>;
+			};
+		};
+		xbar_i2s2_port: port@b {
+			reg = <0xb>;
+			xbar_i2s2_ep: endpoint {
+				remote-endpoint = <&i2s2_cif_ep>;
+			};
+		};
+		xbar_i2s3_port: port@c {
+			reg = <0xc>;
+			xbar_i2s3_ep: endpoint {
+				remote-endpoint = <&i2s3_cif_ep>;
+			};
+		};
+		xbar_i2s4_port: port@d {
+			reg = <0xd>;
+			xbar_i2s4_ep: endpoint {
+				remote-endpoint = <&i2s4_cif_ep>;
+			};
+		};
+		xbar_i2s5_port: port@e {
+			reg = <0xe>;
+			xbar_i2s5_ep: endpoint {
+				remote-endpoint = <&i2s5_cif_ep>;
+			};
+		};
+		xbar_dmic1_port: port@f {
+			reg = <0xf>;
+			xbar_dmic1_ep: endpoint {
+				remote-endpoint = <&dmic1_cif_ep>;
+			};
+		};
+		xbar_dmic2_port: port@10 {
+			reg = <0x10>;
+			xbar_dmic2_ep: endpoint {
+				remote-endpoint = <&dmic2_cif_ep>;
+			};
+		};
+		xbar_dmic3_port: port@11 {
+			reg = <0x11>;
+			xbar_dmic3_ep: endpoint {
+				remote-endpoint = <&dmic3_cif_ep>;
+			};
+		};
+	};
+};
+
+&tegra_i2s1 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			i2s1_cif_ep: endpoint {
+				remote-endpoint = <&xbar_i2s1_ep>;
+			};
+		};
+		i2s1_port: port@1 {
+			reg = <1>;
+			i2s1_dap_ep: endpoint {
+				dai-format = "i2s";
+				/* Placeholder for external Codec */
+			};
+		};
+	};
+};
+
+&tegra_i2s2 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			i2s2_cif_ep: endpoint {
+				remote-endpoint = <&xbar_i2s2_ep>;
+			};
+		};
+		i2s2_port: port@1 {
+			reg = <1>;
+			i2s2_dap_ep: endpoint {
+				dai-format = "i2s";
+				/* Placeholder for external Codec */
+			};
+		};
+	};
+};
+
+&tegra_i2s3 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			i2s3_cif_ep: endpoint {
+				remote-endpoint = <&xbar_i2s3_ep>;
+			};
+		};
+		i2s3_port: port@1 {
+			reg = <1>;
+			i2s3_dap_ep: endpoint {
+				dai-format = "i2s";
+				/* Placeholder for external Codec */
+			};
+		};
+	};
+};
+
+&tegra_i2s4 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			i2s4_cif_ep: endpoint {
+				remote-endpoint = <&xbar_i2s4_ep>;
+			};
+		};
+		i2s4_port: port@1 {
+			reg = <1>;
+			i2s4_dap_ep: endpoint {
+				dai-format = "i2s";
+				/* Placeholder for external Codec */
+			};
+		};
+	};
+};
+
+&tegra_i2s5 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			i2s5_cif_ep: endpoint {
+				remote-endpoint = <&xbar_i2s5_ep>;
+			};
+		};
+		i2s5_port: port@1 {
+			reg = <1>;
+			i2s5_dap_ep: endpoint {
+				dai-format = "i2s";
+				/* Placeholder for external Codec */
+			};
+		};
+	};
+};
+
+&tegra_dmic1 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			dmic1_cif_ep: endpoint {
+				remote-endpoint = <&xbar_dmic1_ep>;
+			};
+		};
+		dmic1_port: port@1 {
+			reg = <1>;
+			dmic1_dap_ep: endpoint {
+				/* Placeholder for external Codec */
+			};
+		};
+	};
+};
+
+&tegra_dmic2 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			dmic2_cif_ep: endpoint {
+				remote-endpoint = <&xbar_dmic2_ep>;
+			};
+		};
+		dmic2_port: port@1 {
+			reg = <1>;
+			dmic2_dap_ep: endpoint {
+				/* Placeholder for external Codec */
+			};
+		};
+	};
+};
+
+&tegra_dmic3 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			dmic3_cif_ep: endpoint {
+				remote-endpoint = <&xbar_dmic3_ep>;
+			};
+		};
+		dmic3_port: port@1 {
+			reg = <1>;
+			dmic3_dap_ep: endpoint {
+				/* Placeholder for external Codec */
+			};
+		};
+	};
 };
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
index 6a877de..0c917a1 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
@@ -6,6 +6,7 @@
 #include <dt-bindings/mfd/max77620.h>
 
 #include "tegra210.dtsi"
+#include "tegra210-audio-graph.dtsi"
 
 / {
 	model = "NVIDIA Jetson Nano Developer Kit";
@@ -870,4 +871,149 @@
 
 		vin-supply = <&vdd_5v0_sys>;
 	};
+
+	tegra_sound {
+		status = "okay";
+
+		compatible = "nvidia,tegra210-audio-graph-card";
+
+		dais = /* FE */
+		       <&admaif1_port>, <&admaif2_port>, <&admaif3_port>,
+		       <&admaif4_port>, <&admaif5_port>, <&admaif6_port>,
+		       <&admaif7_port>, <&admaif8_port>, <&admaif9_port>,
+		       <&admaif10_port>,
+		       /* Router */
+		       <&xbar_i2s3_port>, <&xbar_i2s4_port>,
+		       <&xbar_dmic1_port>, <&xbar_dmic2_port>,
+		       /* I/O DAP Ports */
+		       <&i2s3_port>, <&i2s4_port>,
+		       <&dmic1_port>, <&dmic2_port>;
+
+		label = "jetson-nano-ape";
+	};
+};
+
+&tegra_admaif {
+	status = "okay";
+};
+
+&tegra_ahub {
+	status = "okay";
+
+	ports {
+		xbar_i2s3_port: port@c {
+			reg = <0xc>;
+			xbar_i2s3_ep: endpoint {
+				remote-endpoint = <&i2s3_cif_ep>;
+			};
+		};
+		xbar_i2s4_port: port@d {
+			reg = <0xd>;
+			xbar_i2s4_ep: endpoint {
+				remote-endpoint = <&i2s4_cif_ep>;
+			};
+		};
+		xbar_dmic1_port: port@f {
+			reg = <0xf>;
+			xbar_dmic1_ep: endpoint {
+				remote-endpoint = <&dmic1_cif_ep>;
+			};
+		};
+		xbar_dmic2_port: port@10 {
+			reg = <0x10>;
+			xbar_dmic2_ep: endpoint {
+				remote-endpoint = <&dmic2_cif_ep>;
+			};
+		};
+	};
+};
+
+&tegra_i2s3 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			i2s3_cif_ep: endpoint {
+				remote-endpoint = <&xbar_i2s3_ep>;
+			};
+		};
+		i2s3_port: port@1 {
+			reg = <1>;
+			i2s3_dap_ep: endpoint {
+				dai-format = "i2s";
+				/* Placeholder for external Codec */
+			};
+		};
+	};
+};
+
+&tegra_i2s4 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			i2s4_cif_ep: endpoint {
+				remote-endpoint = <&xbar_i2s4_ep>;
+			};
+		};
+		i2s4_port: port@1 {
+			reg = <1>;
+			i2s4_dap_ep: endpoint@0 {
+				dai-format = "i2s";
+				/* Placeholder for external Codec */
+			};
+		};
+	};
+};
+
+&tegra_dmic1 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			dmic1_cif_ep: endpoint@0 {
+				remote-endpoint = <&xbar_dmic1_ep>;
+			};
+		};
+		dmic1_port: port@1 {
+			reg = <1>;
+			dmic1_dap_ep: endpoint@0 {
+				/* Placeholder for external Codec */
+			};
+		};
+	};
+};
+
+&tegra_dmic2 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			dmic2_cif_ep: endpoint@0 {
+				remote-endpoint = <&xbar_dmic2_ep>;
+			};
+		};
+		dmic2_port: port@1 {
+			reg = <1>;
+			dmic2_dap_ep: endpoint@0 {
+				/* Placeholder for external Codec */
+			};
+		};
+	};
 };
-- 
2.7.4


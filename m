Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D5132DDA08
	for <lists+linux-tegra@lfdr.de>; Thu, 17 Dec 2020 21:31:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725988AbgLQU3y (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 17 Dec 2020 15:29:54 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:19892 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731563AbgLQU3l (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Dec 2020 15:29:41 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fdbbf8d0000>; Thu, 17 Dec 2020 12:29:01 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 17 Dec
 2020 20:28:59 +0000
Received: from skomatineni-linux.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Thu, 17 Dec 2020 20:28:58 +0000
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <broonie@kernel.org>, <robh+dt@kernel.org>, <lukas@wunner.de>
CC:     <skomatineni@nvidia.com>, <bbrezillon@kernel.org>,
        <p.yadav@ti.com>, <tudor.ambarus@microchip.com>,
        <linux-spi@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v4 9/9] arm64: tegra: Enable QSPI on Jetson Xavier NX
Date:   Thu, 17 Dec 2020 12:28:47 -0800
Message-ID: <1608236927-28701-10-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608236927-28701-1-git-send-email-skomatineni@nvidia.com>
References: <1608236927-28701-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1608236941; bh=fYE2T8fmJsPLDmks8zJZ++XGgYTpkfOpRR13aXBCmGY=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:X-NVConfidentiality:MIME-Version:Content-Type;
        b=XWPZPl5zXI26/hZ7JWf/q7DNk4TviPOb70FYfsygBgZXDlJ9LUn3s/EoadDOhe5bM
         9cRuPMLOtISN0UcKEYHmqn89A7QwwuxlK1LTjOwaVu8DAhKnJb+2+KZbOO3L3PW4EC
         pEFQCk+azyPKFZTqQkuuq8+ojkWG7qAGW+V2C+zJkGrKYEfcyP6CNOLIXRuthAQhSv
         W0t6BF1uKJ2CdfSBo34IDeFGqpyCnJud0VmSvwNmnGkDIxI1OIMk0fJ5U5mbmq4O7t
         13kk5oOEqNldMV6H19nVqWXJfNDIiFr3NarJp87443ayfp96j3I+9fJjwNMVBxoCcC
         G6LOdzaKSwoWQ==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This patch enables QSPI on Jetson Xavier NX.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 .../arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0000.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0000.dts b/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0000.dts
index 7f97b34..f1053e7 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0000.dts
@@ -100,6 +100,18 @@
 			phy-names = "usb2-1", "usb2-2", "usb3-2";
 		};
 
+		spi@3270000 {
+			status = "okay";
+
+			flash@0 {
+				compatible = "spi-nor";
+				reg = <0>;
+				spi-max-frequency = <102000000>;
+				spi-tx-bus-width = <4>;
+				spi-rx-bus-width = <4>;
+			};
+		};
+
 		pwm@32d0000 {
 			status = "okay";
 		};
-- 
2.7.4


Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C82610F27D
	for <lists+linux-tegra@lfdr.de>; Mon,  2 Dec 2019 22:57:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726107AbfLBV5o (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 2 Dec 2019 16:57:44 -0500
Received: from hera.iit.uni-miskolc.hu ([193.6.5.4]:46594 "EHLO
        hera.iit.uni-miskolc.hu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725874AbfLBV5n (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 2 Dec 2019 16:57:43 -0500
Received: from localhost (localhost [127.0.0.1])
        by hera.iit.uni-miskolc.hu (Postfix) with ESMTP id 478811B36;
        Mon,  2 Dec 2019 22:52:35 +0100 (CET)
X-Virus-Scanned: Kamavis at iit.uni-miskolc.hu
Received: from hera.iit.uni-miskolc.hu ([127.0.0.1])
        by localhost (hera.iit.uni-miskolc.hu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id EK9r_Vljru3F; Mon,  2 Dec 2019 22:52:18 +0100 (CET)
Received: from titan.hitronhub.home (unknown [IPv6:2a02:8109:a180:2298:f5f6:6861:31b7:8595])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: szucst@iit.uni-miskolc.hu)
        by hera.iit.uni-miskolc.hu (Postfix) with ESMTPSA id 77DCE1B3B;
        Mon,  2 Dec 2019 22:52:17 +0100 (CET)
From:   =?UTF-8?q?Tam=C3=A1s=20Sz=C5=B1cs?= <tszucs@protonmail.ch>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?Tam=C3=A1s=20Sz=C5=B1cs?= <tszucs@protonmail.ch>
Subject: [PATCH v2 1/1] arm64: tegra: Enable SDIO on Jetson Nano M.2 Key E
Date:   Mon,  2 Dec 2019 22:52:00 +0100
Message-Id: <20191202215200.9656-2-tszucs@protonmail.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191202215200.9656-1-tszucs@protonmail.ch>
References: <20191202215200.9656-1-tszucs@protonmail.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Enable SDMMC3 and set it up for SDIO devices.

Signed-off-by: Tamás Szűcs <tszucs@protonmail.ch>
---
Changes in v2:
- keep card powered in suspend and enable WoWLAN

 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
index 90381d52ac54..7f7b720a2a1c 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
@@ -536,6 +536,19 @@
 		vmmc-supply = <&vdd_3v3_sd>;
 	};
 
+	sdhci@700b0400 {
+		status = "okay";
+		bus-width = <4>;
+
+		vqmmc-supply = <&vdd_1v8>;
+		vmmc-supply = <&vdd_3v3_sys>;
+
+		non-removable;
+		cap-sdio-irq;
+		keep-power-in-suspend;
+		wakeup-source;
+	};
+
 	clocks {
 		compatible = "simple-bus";
 		#address-cells = <1>;
-- 
2.20.1


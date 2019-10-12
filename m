Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 968A4D4E22
	for <lists+linux-tegra@lfdr.de>; Sat, 12 Oct 2019 09:52:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728821AbfJLHwu (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sat, 12 Oct 2019 03:52:50 -0400
Received: from hera.iit.uni-miskolc.hu ([193.6.5.4]:44426 "EHLO
        hera.iit.uni-miskolc.hu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728159AbfJLHwt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 12 Oct 2019 03:52:49 -0400
Received: from localhost (localhost [127.0.0.1])
        by hera.iit.uni-miskolc.hu (Postfix) with ESMTP id C708F125;
        Sat, 12 Oct 2019 09:52:46 +0200 (CEST)
X-Virus-Scanned: Kamavis at iit.uni-miskolc.hu
Received: from hera.iit.uni-miskolc.hu ([127.0.0.1])
        by localhost (hera.iit.uni-miskolc.hu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id HyhJANVzi8_U; Sat, 12 Oct 2019 09:52:38 +0200 (CEST)
Received: from titan.hitronhub.home (unknown [IPv6:2a02:8109:a180:54c:226:9eff:fe30:2af8])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: szucst@iit.uni-miskolc.hu)
        by hera.iit.uni-miskolc.hu (Postfix) with ESMTPSA id 09F69129;
        Sat, 12 Oct 2019 09:52:37 +0200 (CEST)
From:   =?UTF-8?q?Tam=C3=A1s=20Sz=C5=B1cs?= <tszucs@protonmail.ch>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?Tam=C3=A1s=20Sz=C5=B1cs?= <tszucs@protonmail.ch>
Subject: [PATCH 1/1] arm64: tegra: enable SDIO on Jetson Nano M.2 Key E
Date:   Sat, 12 Oct 2019 09:52:13 +0200
Message-Id: <20191012075213.4880-2-tszucs@protonmail.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191012075213.4880-1-tszucs@protonmail.ch>
References: <20191012075213.4880-1-tszucs@protonmail.ch>
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
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
index 9d17ec707bce..66f913ba0b1c 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
@@ -515,6 +515,16 @@
 		vmmc-supply = <&vdd_3v3_sd>;
 	};
 
+	sdhci@700b0400 {
+		status = "okay";
+		bus-width = <4>;
+		cap-sdio-irq;
+		non-removable;
+
+		vqmmc-supply = <&vdd_1v8>;
+		vmmc-supply = <&vdd_3v3_sys>;
+	};
+
 	clocks {
 		compatible = "simple-bus";
 		#address-cells = <1>;
-- 
2.20.1


Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 538CD7634D
	for <lists+linux-tegra@lfdr.de>; Fri, 26 Jul 2019 12:16:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726005AbfGZKQV (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 26 Jul 2019 06:16:21 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:44355 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725953AbfGZKQV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 26 Jul 2019 06:16:21 -0400
Received: by mail-ed1-f68.google.com with SMTP id k8so52780818edr.11
        for <linux-tegra@vger.kernel.org>; Fri, 26 Jul 2019 03:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QFKLl3j0cV4b00IrtmDF2crMy7nq5ij9lMTGh/WZlxM=;
        b=Fy+55K5JBislxkoD9cJMvbdrIWiyweT7579G4qAXYGuX1AxPaY/BHx8VPAy36FFp+u
         dDucZNLmOatXw107QWpBy1XYvzfCteEu116OdNGO3jChwCVPjOSkr1G0hRWEerDeEZBg
         1E2RtYDkooI1ZghMpcPHJTTZscsK2GYbu48iYmc0+I11MO2nOXfUTnvhKHOlQyHFU/KJ
         FtuFgk9/qdImGCjJf2qTupwZFx5yhAfIEoBBSvcqRsF5o2iQEfug3xPLLbHDOItdmZAH
         kQLOZCVRm1QmW/5HbgY9EPgd8sfkNG25kMjxCPVnTNd5lZjDPQkGEBENcmMD5sIS9PUk
         T2oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QFKLl3j0cV4b00IrtmDF2crMy7nq5ij9lMTGh/WZlxM=;
        b=WxFv/XQD0RjG70NDjdAaWO6aR079QcXxQCe0F+qW7hgSaF7mtmZB02mN2jCTPVLSSQ
         IuUncukBYp4VAabP3KBrKHykyNQ3gczeKF2MVtiPmP2mhZiz2/H1wOGjxrdUaSClCUd9
         IGqfLSBAzl8PT7cBRrY2IsbU6BbG+F0BFqh+Du4mCf1i1g2S29dPc/XKwtTgHEZsnF34
         dczO71WJUuLAbKypaueeexOhL/d+sXzqxNy9f4BDj5BIMigFOyiXd6zYYzXvtCM5KMn8
         p1AO2U7fJz1lZo+ZE165qLvm6EYUgGnkJC40Lj7X+S8WkvRvN3UAS21Ypc9CBIRg0BPt
         KQKQ==
X-Gm-Message-State: APjAAAU0NLAl+BMMGTaUwvwgvJuxol7XFvRR7FRbLllrGF53Ko0Jpj4L
        trGXbcvZ4as2EnUFjkOezIA=
X-Google-Smtp-Source: APXvYqzKtp+ERuiP/pZGd7Mp5A9nxlmYRlwLXoWGAAN5xNzjADDpQK7LHhZVTSxxtfu002tP4sc8Jg==
X-Received: by 2002:a17:906:e213:: with SMTP id gf19mr31876779ejb.180.1564136179859;
        Fri, 26 Jul 2019 03:16:19 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
        by smtp.gmail.com with ESMTPSA id oo19sm9819541ejb.38.2019.07.26.03.16.19
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 26 Jul 2019 03:16:19 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/3] arm64: tegra: Add unit-address for CBB on Tegra194
Date:   Fri, 26 Jul 2019 12:16:16 +0200
Message-Id: <20190726101618.26896-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The control back-bone (CBB) starts at physical address 0, so give it a
unit-address to comply with standard naming practices checked for by the
device tree compiler.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../arm64/boot/dts/nvidia/tegra194-p2888.dtsi | 20 +++++++++----------
 .../boot/dts/nvidia/tegra194-p2972-0000.dts   |  2 +-
 arch/arm64/boot/dts/nvidia/tegra194.dtsi      |  2 +-
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
index 62e07e1197cc..02f6a8f0d741 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
@@ -8,17 +8,17 @@
 	compatible = "nvidia,p2888", "nvidia,tegra194";
 
 	aliases {
-		sdhci0 = "/cbb/sdhci@3460000";
-		sdhci1 = "/cbb/sdhci@3400000";
+		sdhci0 = "/cbb@0/sdhci@3460000";
+		sdhci1 = "/cbb@0/sdhci@3400000";
 		serial0 = &tcu;
 		i2c0 = "/bpmp/i2c";
-		i2c1 = "/cbb/i2c@3160000";
-		i2c2 = "/cbb/i2c@c240000";
-		i2c3 = "/cbb/i2c@3180000";
-		i2c4 = "/cbb/i2c@3190000";
-		i2c5 = "/cbb/i2c@31c0000";
-		i2c6 = "/cbb/i2c@c250000";
-		i2c7 = "/cbb/i2c@31e0000";
+		i2c1 = "/cbb@0/i2c@3160000";
+		i2c2 = "/cbb@0/i2c@c240000";
+		i2c3 = "/cbb@0/i2c@3180000";
+		i2c4 = "/cbb@0/i2c@3190000";
+		i2c5 = "/cbb@0/i2c@31c0000";
+		i2c6 = "/cbb@0/i2c@c250000";
+		i2c7 = "/cbb@0/i2c@31e0000";
 	};
 
 	chosen {
@@ -26,7 +26,7 @@
 		stdout-path = "serial0:115200n8";
 	};
 
-	cbb {
+	cbb@0 {
 		ethernet@2490000 {
 			status = "okay";
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
index 23597d53c9c9..740aaf597115 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
@@ -10,7 +10,7 @@
 	model = "NVIDIA Jetson AGX Xavier Developer Kit";
 	compatible = "nvidia,p2972-0000", "nvidia,tegra194";
 
-	cbb {
+	cbb@0 {
 		aconnect {
 			status = "okay";
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index adebbbf36bd0..2597eb7f747b 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -14,7 +14,7 @@
 	#size-cells = <2>;
 
 	/* control backbone */
-	cbb {
+	cbb@0 {
 		compatible = "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
2.22.0


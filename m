Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15AEA224F8B
	for <lists+linux-tegra@lfdr.de>; Sun, 19 Jul 2020 07:02:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726559AbgGSFCf (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 19 Jul 2020 01:02:35 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:18034 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725440AbgGSFCf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 19 Jul 2020 01:02:35 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f13d3de0000>; Sat, 18 Jul 2020 22:02:22 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Sat, 18 Jul 2020 22:02:35 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Sat, 18 Jul 2020 22:02:35 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 19 Jul
 2020 05:02:34 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Sun, 19 Jul 2020 05:02:34 +0000
Received: from audio.nvidia.com (Not Verified[10.24.34.185]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f13d3e50003>; Sat, 18 Jul 2020 22:02:34 -0700
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
Subject: [PATCH v5 10/11] arm64: tegra: Enable ACONNECT, ADMA and AGIC on Jetson Nano
Date:   Sun, 19 Jul 2020 10:31:29 +0530
Message-ID: <1595134890-16470-11-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595134890-16470-1-git-send-email-spujar@nvidia.com>
References: <1595134890-16470-1-git-send-email-spujar@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1595134942; bh=4eI7XBif5TWx/oyXnw8C7OBOPXz/vMhXc1EyyEQKfc0=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=DVv80znNaz5ntMKbRFlT2iLoL+RPNKsy74/iFtAMDECG+uDjuvueR43zJTzThIT/u
         ZOVVPv9D/zeQads6q6BgibHhSFfsmxB2ovL0+UrDD5KnYm35+8SHpdiUHBOAx8yPZN
         v+viVkqdlajl7TejAk4UVFoyu0LAhw8qfVcJnfN3P8lRBZPb2qXHqCHAbZY+iRMbkD
         dCt/Fofiq6U0JHr6NqILXOPx9uLbNRdRu58ElU6khzTcoCkUbdAGPAYPJe/GJqMmqk
         QWHogUu0KkC2tkdyRkATetMfPxZhDvlAeLycNQY5Rgsw2fBXW+/ezpV94WA0Een0l/
         06kEa+lDqAP4A==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

These devices are required for audio sub system and current patch
ensures probe path of these devices gets tested. Later sound card
support would be added which can use these devices at runtime.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
index 9b63469..0325fc0 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
@@ -806,4 +806,16 @@
 
 		vin-supply = <&avdd_1v05_pll>;
 	};
+
+	aconnect@702c0000 {
+		status = "okay";
+
+		dma@702e2000 {
+			status = "okay";
+		};
+
+		interrupt-controller@702f9000 {
+			status = "okay";
+		};
+	};
 };
-- 
2.7.4


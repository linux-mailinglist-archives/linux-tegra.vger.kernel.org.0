Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF0831284B1
	for <lists+linux-tegra@lfdr.de>; Fri, 20 Dec 2019 23:28:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727723AbfLTW11 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 20 Dec 2019 17:27:27 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:13478 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727708AbfLTW11 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 20 Dec 2019 17:27:27 -0500
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5dfd4ac40000>; Fri, 20 Dec 2019 14:27:16 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Fri, 20 Dec 2019 14:27:26 -0800
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Fri, 20 Dec 2019 14:27:26 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 20 Dec
 2019 22:27:26 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 20 Dec 2019 22:27:26 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.169.197]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5dfd4acd0001>; Fri, 20 Dec 2019 14:27:25 -0800
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <broonie@kernel.org>,
        <lgirdwood@gmail.com>, <perex@perex.cz>, <tiwai@suse.com>,
        <digetx@gmail.com>, <mperttunen@nvidia.com>,
        <gregkh@linuxfoundation.org>, <sboyd@kernel.org>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>
CC:     <pdeschrijver@nvidia.com>, <pgaikwad@nvidia.com>,
        <spujar@nvidia.com>, <josephl@nvidia.com>,
        <daniel.lezcano@linaro.org>, <mmaddireddy@nvidia.com>,
        <markz@nvidia.com>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 18/19] arm64: tegra: smaug: Change clk_out_2 provider to pmc
Date:   Fri, 20 Dec 2019 14:27:04 -0800
Message-ID: <1576880825-15010-19-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576880825-15010-1-git-send-email-skomatineni@nvidia.com>
References: <1576880825-15010-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1576880836; bh=eOYHBPuH2PvGbyKAJorT0sDzQB+cQxNaf55xPkTmLIU=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=XgZ3g+GIlKzELNz2bFbfGj80xuZqNM58WoEgMe1YQqdETq+RO0SFDysQXbnP/bMVz
         qhrWVER8VDEoWX4iQ5uwI3RTzK/NHy2/FrEemP0DjMyrMf3TidXLDH0Ef1SyWbi357
         074N22MvvNQcllF1yEb/MqtretjOSW+Jvu10s9AWhjcrdBPztVOmH7iwq5YOUT/BXX
         WqFCF0IdYojOpA1Gd3Fz1X9A8s7tL+aN2LuU5PDFguIIEawSP6znk3zKgCFrPw2JRG
         N2ZM854IvT9n0qo1e26KzqYW3ideRGdpnZUJ6rsXR1IVfIpa2dB6znn0tIOCPjREPY
         +gcAGWdL8ARLg==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

clk_out_2 is one of the clocks from Tegra PMC block and Tegra PMC
clocks are moved from clock driver to pmc driver with pmc as clock
provider and using pmc clock ids.

This patch changes clk_out_2 provider to pmc and uses corresponding
pmc clock id for clk_out_2.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
index 72c7a04ac1df..2faab6390552 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
@@ -1592,7 +1592,7 @@
 			reg = <0x1a>;
 			interrupt-parent = <&gpio>;
 			interrupts = <TEGRA_GPIO(E, 6) IRQ_TYPE_LEVEL_LOW>;
-			clocks = <&tegra_car TEGRA210_CLK_CLK_OUT_2>;
+			clocks = <&tegra_pmc TEGRA_PMC_CLK_OUT_2>;
 			clock-names = "mclk";
 
 			nuvoton,jkdet-enable;
-- 
2.7.4


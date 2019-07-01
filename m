Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F27EF4B76D
	for <lists+linux-tegra@lfdr.de>; Wed, 19 Jun 2019 13:52:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731623AbfFSLvw (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 19 Jun 2019 07:51:52 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:5607 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727067AbfFSLvw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 19 Jun 2019 07:51:52 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d0a21d70000>; Wed, 19 Jun 2019 04:51:51 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 19 Jun 2019 04:51:51 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 19 Jun 2019 04:51:51 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL106.nvidia.com
 (172.18.146.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 19 Jun
 2019 11:51:51 +0000
Received: from hqnvemgw02.nvidia.com (172.16.227.111) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 19 Jun 2019 11:51:50 +0000
Received: from linux.nvidia.com (Not Verified[10.24.34.185]) by hqnvemgw02.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5d0a21d40002>; Wed, 19 Jun 2019 04:51:50 -0700
From:   Sameer Pujar <spujar@nvidia.com>
To:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>
CC:     <mkumard@nvidia.com>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH v6 2/2] arm64: tegra: enable ACONNECT, ADMA and AGIC
Date:   Wed, 19 Jun 2019 17:21:22 +0530
Message-ID: <1560945082-24554-2-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560945082-24554-1-git-send-email-spujar@nvidia.com>
References: <1560945082-24554-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1560945111; bh=c/NXql/GWMhzTpOWf4RDxWf3rsd+83SK8WOo1rYUd8g=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:Content-Type;
        b=qsD0C1LE/CChBIviSflWIFuTnXBczWY9SlMlr0Qi2ux4fYG1IqiFbi0tRTA50t0Bv
         w57zFuV/7EvvD3CuKz5nrMh1OARm9aWDDTa8Lsmo3YDqEClXc3r+ugNquPeSamPHMR
         bJvxryIGgWMys+XTrMtRX60cvvN8vkB3lB3n+FWk9/yGzFsaedwdGqBMBkmrchKiX3
         THnRxWAHd3jUo6kdvyCrcPmmHKCMF/qkjvJ9Cw3BorbQuW8QbgOZOK1T4pne6z8WFf
         +VgrABMKJHcVrb9ZG0Y/yJP0SWbeoORxbQje9XgIS+d30x6+WmFTYW7Ls7EJkMkEVk
         WF5vCt2U9kdHw==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Enable ACONNECT, ADMA and AGIC devices for following platforms
  * Jetson TX2
  * Jetson Xavier

Verified driver probe path and devices get registered fine.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 changes in current revision
   * renamed agic, interrupt-controller, name

 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 12 ++++++++++++
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts | 12 ++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
index 5102de1..55c84bb 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
@@ -298,4 +298,16 @@
 			vin-supply = <&vdd_5v0_sys>;
 		};
 	};
+
+	aconnect {
+		status = "okay";
+
+		dma-controller@2930000 {
+			status = "okay";
+		};
+
+		interrupt-controller@2a40000 {
+			status = "okay";
+		};
+	};
 };
diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
index 6e6df65..5981cdc 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
@@ -167,4 +167,16 @@
 			};
 		};
 	};
+
+	aconnect {
+		status = "okay";
+
+		dma-controller@2930000 {
+			status = "okay";
+		};
+
+		interrupt-controller@2a40000 {
+			status = "okay";
+		};
+	};
 };
-- 
2.7.4


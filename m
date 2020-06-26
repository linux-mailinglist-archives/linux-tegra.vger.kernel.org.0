Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDBAC20AF90
	for <lists+linux-tegra@lfdr.de>; Fri, 26 Jun 2020 12:21:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727798AbgFZKUD (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 26 Jun 2020 06:20:03 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:6109 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727112AbgFZKTn (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 26 Jun 2020 06:19:43 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ef5cb610000>; Fri, 26 Jun 2020 03:18:09 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Fri, 26 Jun 2020 03:19:43 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Fri, 26 Jun 2020 03:19:43 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 26 Jun
 2020 10:19:31 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 26 Jun 2020 10:19:31 +0000
Received: from nkristam-ubuntu.nvidia.com (Not Verified[10.19.67.128]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5ef5cbb00003>; Fri, 26 Jun 2020 03:19:30 -0700
From:   Nagarjuna Kristam <nkristam@nvidia.com>
To:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <mark.rutland@arm.com>, <robh+dt@kernel.org>, <kishon@ti.com>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Nagarjuna Kristam <nkristam@nvidia.com>
Subject: [PATCH V4 1/7] dt-bindings: phy: tegra-xusb: Add charger-detect property
Date:   Fri, 26 Jun 2020 15:48:56 +0530
Message-ID: <1593166742-23592-2-git-send-email-nkristam@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593166742-23592-1-git-send-email-nkristam@nvidia.com>
References: <1593166742-23592-1-git-send-email-nkristam@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1593166689; bh=XHm7P4gPWFwOGcvfTKWpENt5qN8Z3AWUQwJ1eZ7/MVs=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=XoLuhDhzVA+i4KBo4FpReyELXb7iqtrX2uICuXPs6tPHBAPOlCsH1KKpvePIxUIRR
         eg+k1cirxSne16ZJWWEgM7t/eJxVnAQH40FN41wsfJc+pL4+bf9qNAeGUikxFzLulQ
         KrJbHybeXfes6/B+1XHpdns36urUOO/nq9HyzkckCp5/0WJ59awc7AJ+rkVd1hq3TZ
         DHmcWfEJiZfXP+ehqnVfXrd5unQJ9UsLBmL+zTsKIqJbpz6sh90R+FsH9WjFLudyx3
         7Ie825PePknNxmbMsjMAOiW33hSn4itVZ6s3YmZ0y3xFEmWPK3+3rb8la8XfPeI0zF
         gNWvNNTFduW5A==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add nvidia,charger-detect boolean property for Tegra210 and Tegra186
platforms. This property is used to inform driver to perform charger
detection on corresponding USB 2 port.

Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
Acked-by: Rob Herring <robh@kernel.org>
Acked-by: Thierry Reding <treding@nvidia.com>
---
V4:
 - No changes
---
V3:
 - Added Acked-by updates to commit message.
---
V2:
 - Added Acked-by updates to commit message.
---
 Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt b/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt
index 38c5fa2..9b2d2dd 100644
--- a/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt
+++ b/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt
@@ -190,6 +190,10 @@ Required properties for OTG/Peripheral capable USB2 ports:
   and peripheral roles. Connector should be added as subnode.
   See usb/usb-conn-gpio.txt.
 
+Optional properties for OTG/Peripheral capable USB2 ports:
+- nvidia,charger-detect: A boolean property whose presence inform driver to
+  perform charger-detect activity.
+
 Optional properties:
 - nvidia,internal: A boolean property whose presence determines that a port
   is internal. In the absence of this property the port is considered to be
-- 
2.7.4


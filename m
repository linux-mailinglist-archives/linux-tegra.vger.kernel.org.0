Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC0C5B47CB
	for <lists+linux-tegra@lfdr.de>; Tue, 17 Sep 2019 08:57:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404398AbfIQG5T (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 17 Sep 2019 02:57:19 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:16400 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403830AbfIQG5T (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 17 Sep 2019 02:57:19 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d8083d40000>; Mon, 16 Sep 2019 23:57:24 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Mon, 16 Sep 2019 23:57:19 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Mon, 16 Sep 2019 23:57:19 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 17 Sep
 2019 06:57:19 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 17 Sep 2019 06:57:18 +0000
Received: from nkristam-ubuntu.nvidia.com (Not Verified[10.19.65.118]) by hqnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5d8083cd0000>; Mon, 16 Sep 2019 23:57:18 -0700
From:   Nagarjuna Kristam <nkristam@nvidia.com>
To:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <mark.rutland@arm.com>, <robh+dt@kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        Nagarjuna Kristam <nkristam@nvidia.com>
Subject: [PATCH 3/3] arm64: tegra: Enable USB host on Jetson-TX2
Date:   Tue, 17 Sep 2019 12:26:45 +0530
Message-ID: <1568703406-20183-4-git-send-email-nkristam@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568703406-20183-1-git-send-email-nkristam@nvidia.com>
References: <1568703406-20183-1-git-send-email-nkristam@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1568703444; bh=AOMX+3luWEiiWvyqly4CZ2QKjkMGeO6glydbEwVi7cw=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=mj7VdwEbR8XgD3z0/XWjbvkc/2aPpB9V5UX1//ihBSKflL3B1GdhSlzeFMoFnbD0e
         PM/uZfYPK8Qc2VfPtiquvIXF5jj4nzi5C1Ys+M28j1iJtcjosoXNCHuRQ2fIAgBo4K
         OpWshkcgH1qJx9zDagI7RD0ETtchF48XF12TdhJEp3sw56wP4C7jiaxTp/m8ymVisc
         5AZfFsgQn5hy1cCbc/vqDLfedMfMEN/40sa4sVyhYfgrydcgxNlz6Igk+7ETj1UMKz
         Wym5i64OIIkmk29ux1f1Xegc3hAZVS+yDJ+AwcmzJfJBvV4TOgRIXZfr3c2r4s1kFZ
         J7ruFgGokHStg==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Enable USB host driver on Jetson-TX2 platform

Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
index d65caa1..b08eda6 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
@@ -193,7 +193,7 @@
 	};
 
 	usb@3530000 {
-		status = "disabled";
+		status = "okay";
 
 		phys = <&{/padctl@3520000/pads/usb2/lanes/usb2-0}>,
 		       <&{/padctl@3520000/pads/usb2/lanes/usb2-1}>,
-- 
2.7.4


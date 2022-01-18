Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 323004919EB
	for <lists+linux-tegra@lfdr.de>; Tue, 18 Jan 2022 03:57:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347713AbiARC5V (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 17 Jan 2022 21:57:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344391AbiARCnl (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 17 Jan 2022 21:43:41 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CDC8C0612A6;
        Mon, 17 Jan 2022 18:37:40 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id F310DB811D6;
        Tue, 18 Jan 2022 02:37:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEA67C36AF2;
        Tue, 18 Jan 2022 02:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642473457;
        bh=iEa4j39m6JiUc8TJJ81HeOyKWaiRmx+DH0d8CARI3Js=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QNX1toMLzD/fQr3Z67qYQ1EWSqhdbZoUzFzuiVLXq5WkC+nN49KWCWXQbXs7etLEc
         m72UFth5RsIM30rDXNP6Hod8FLWdyxyoaYjfhOcQwCLVDEBsX/ypY3RYm5TQbj3wUP
         +Hw4DP7YgpXsu4Sj3dC39JNml8QHjO/yyd+yTd5cg/Ibs8Wu0VfU7yU1bBSBklZ8rJ
         k1/iW1RUnAHeBBBi3KJex4TNRF2coZ+jgGaFoSpwpUUyCl3Ixi1bdvUElhVhvGgT1+
         JuLLZsbB8ssxeRFPeu518o4KsWvM2vCdRrARlP/yYWPmPi7DSzK+Tan/kwxLnHRZCa
         1fswWeWHAbNJg==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Thierry Reding <treding@nvidia.com>,
        Sasha Levin <sashal@kernel.org>, robh+dt@kernel.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com, spujar@nvidia.com,
        mperttunen@nvidia.com, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 124/188] arm64: tegra: Adjust length of CCPLEX cluster MMIO region
Date:   Mon, 17 Jan 2022 21:30:48 -0500
Message-Id: <20220118023152.1948105-124-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118023152.1948105-1-sashal@kernel.org>
References: <20220118023152.1948105-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

[ Upstream commit 2b14cbd643feea5fc17c6e8bead4e71088c69acd ]

The Tegra186 CCPLEX cluster register region is 4 MiB is length, not 4
MiB - 1. This was likely presumed to be the "limit" rather than length.
Fix it up.

Signed-off-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index e94f8add1a400..062e87e893316 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -1079,7 +1079,7 @@ sdmmc3_1v8: sdmmc3-1v8 {
 
 	ccplex@e000000 {
 		compatible = "nvidia,tegra186-ccplex-cluster";
-		reg = <0x0 0x0e000000 0x0 0x3fffff>;
+		reg = <0x0 0x0e000000 0x0 0x400000>;
 
 		nvidia,bpmp = <&bpmp>;
 	};
-- 
2.34.1


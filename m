Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B0D03C9098
	for <lists+linux-tegra@lfdr.de>; Wed, 14 Jul 2021 22:02:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237928AbhGNTzq (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 14 Jul 2021 15:55:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:46320 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239234AbhGNTtN (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 14 Jul 2021 15:49:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DC32A61405;
        Wed, 14 Jul 2021 19:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626291850;
        bh=liSe6McanGWa85HIg5Ho5nJWQTQVWy1aqtWDNjbkKxs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cq/BmJTVe99paow+PF40DivL82vFftt4WP5nqL3aS0rJjn/qrhmVvpkxPV1qzl9fC
         b3hUyX6DO9toDUhls8Wam+ri93rC8drWK290thw6gPqdNNwu6JB4fAzvpB3oMNeJPw
         B00tfA9xXwk+ypZWeR3MZ2EkWr5V5id9uwJjNi34z0HccqBHJbWamQ+6OTTAVcbzeL
         juFVt+ZOHFM/8cdu7a0EH7wgauW7pCh2H9jOS7yH4hD4GXgOWX1yp2mMCaxOIWzmP0
         VrPS00umz31njE5TvMUvTgRdXDnZWVhSnVKVxaqKc3syf8XBb3IekmyGTxPQ2y6wjZ
         y/82mX+YVo+cg==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Thierry Reding <treding@nvidia.com>,
        Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 44/88] ARM: tegra: nexus7: Correct 3v3 regulator GPIO of PM269 variant
Date:   Wed, 14 Jul 2021 15:42:19 -0400
Message-Id: <20210714194303.54028-44-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210714194303.54028-1-sashal@kernel.org>
References: <20210714194303.54028-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Dmitry Osipenko <digetx@gmail.com>

[ Upstream commit c4dd6066bc304649e3159f1c7a08ece25d537e00 ]

The 3v3 regulator GPIO is GP6 and not GP7, which is the DDR regulator.
Both regulators are always-on, nevertheless the DT model needs to be
corrected, fix it.

Reported-by: Svyatoslav Ryhel <clamor95@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/tegra30-asus-nexus7-grouper-ti-pmic.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-ti-pmic.dtsi b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-ti-pmic.dtsi
index bfc06b988781..215e497652d8 100644
--- a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-ti-pmic.dtsi
+++ b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-ti-pmic.dtsi
@@ -143,7 +143,7 @@ vdd_core: core-regulator@60 {
 	};
 
 	vdd_3v3_sys: regulator@1 {
-		gpio = <&pmic 7 GPIO_ACTIVE_HIGH>;
+		gpio = <&pmic 6 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 };
-- 
2.30.2


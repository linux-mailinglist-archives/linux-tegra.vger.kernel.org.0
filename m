Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59155F63EE
	for <lists+linux-tegra@lfdr.de>; Sun, 10 Nov 2019 03:56:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729080AbfKJCz7 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sat, 9 Nov 2019 21:55:59 -0500
Received: from mail.kernel.org ([198.145.29.99]:32820 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728157AbfKJCuG (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 9 Nov 2019 21:50:06 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4C2D8229EF;
        Sun, 10 Nov 2019 02:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573354206;
        bh=4ElWsVrVIaG8mM1b7IaApAMRwb0A/8ZhKWfzOuGRZXY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=uvMfMUzJIhNqiVzjJT1jcnf5ttBNUfXjdSIMkFrgWzXxtYy3hCnMq02Fovzrc6tyo
         mFgc317cFaD60+T5Wdjlf+ettskC5o5/0nwXuGWuoAFyzIdRwEJSNZzqCUt/4G4Wyx
         OyObaBFgEwfnOtgscLqik9HcagV0Gh1i25MA7K5s=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Marc Dietrich <marvin24@gmx.de>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Thierry Reding <treding@nvidia.com>,
        Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 48/66] ARM: dts: paz00: fix wakeup gpio keycode
Date:   Sat,  9 Nov 2019 21:48:27 -0500
Message-Id: <20191110024846.32598-48-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191110024846.32598-1-sashal@kernel.org>
References: <20191110024846.32598-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Marc Dietrich <marvin24@gmx.de>

[ Upstream commit ebea2a43fdafdbce918bd7e200b709d6c33b9f3b ]

The power key is controlled solely by the EC, which only tiggeres this
gpio after wakeup.
Fixes immediately return to suspend after wake from LP1.

Signed-off-by: Marc Dietrich <marvin24@gmx.de>
Tested-by: Nicolas Chauvet <kwizart@gmail.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/tegra20-paz00.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-paz00.dts b/arch/arm/boot/dts/tegra20-paz00.dts
index b4bfa5586c233..23d4c837b87a6 100644
--- a/arch/arm/boot/dts/tegra20-paz00.dts
+++ b/arch/arm/boot/dts/tegra20-paz00.dts
@@ -521,10 +521,10 @@
 	gpio-keys {
 		compatible = "gpio-keys";
 
-		power {
-			label = "Power";
+		wakeup {
+			label = "Wakeup";
 			gpios = <&gpio TEGRA_GPIO(J, 7) GPIO_ACTIVE_LOW>;
-			linux,code = <KEY_POWER>;
+			linux,code = <KEY_WAKEUP>;
 			wakeup-source;
 		};
 	};
-- 
2.20.1


Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B7ED1FB2E5
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Jun 2020 15:55:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728740AbgFPNzt (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 Jun 2020 09:55:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728997AbgFPNzg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Jun 2020 09:55:36 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C532C06174E
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:55:35 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id t194so3167968wmt.4
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=b/ud2iNCzzfUQWkTRBupAyrbtSyjxPAlpvmlQzKE/M8=;
        b=KaTK7VRcLSeBOA7sASfQ27MMNh4YKF8HqkEh2vTw6jfVOCtQnukZVveEbDu5+hvMEJ
         hhHk2VXTN0BmdqT3HQFGHME9C1Sn5MMt/EECRcAoc9hc23b7f+X1ge6xNjFgT4qBQvgP
         vrTR4H6doaOFapam1uChBUItERsO6Tlv+oJ/VSdY0Uzp2I1LJtsI7uRMyBokETN2Ci7V
         eQZdcQRnKABoNJnEna3COj+2pWvh+yp1VTW9JCoicR590hdjQSUGGFT70UatJd6UOblr
         InsFA9dgAxcjfX8jQyXlfEFTSKS32klyEPkD8Lp6VIXl2gWRg6JLewPLAFq9YsCUqS7g
         uEbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b/ud2iNCzzfUQWkTRBupAyrbtSyjxPAlpvmlQzKE/M8=;
        b=oJ4ITWt/JjrRNQqVeKMXIA/ZwBWEaucW7VVGfNDNxxTFI4BlOpvdMWNyQkbwB8FH34
         4WP/Q2/6voYg01yU0dkSZ7feV59iPnRjeP5j8U4zIKBygJ0GGT+HZp5kju+dNsQPmGMb
         cDtTxeqmU9B436NdSsZwsDnc1UTBoI6h1okkgvGKuILW6lUujfD1Po1BFzc0+/0UgtMZ
         oBMdQ8e6U505mkUxTYa7m29bT2tG7QPOcMC9gKI+wf5OcgYR+mt734A4Zsnhy1Pa48J+
         wJThl5GaZ3t3YQPd14jF5faFkONH7bheeZpvu2ul0ZFnTo5JdcXehOenpexh4vW/Zur+
         1cqg==
X-Gm-Message-State: AOAM530h4qfRCQrwq8p/hGWmnljRtQMvBAr+K+d2mZRBCzb+WLMoMfEl
        wtSJ+N33NrDZwwUnfdD4/JA=
X-Google-Smtp-Source: ABdhPJw98uyBFK8XEAC3DjOAnK67bOy1RiJufbug7vvO/yieL4pz7/m9oka73Gid+XbR56+o4MbdqA==
X-Received: by 2002:a1c:3b43:: with SMTP id i64mr3515565wma.112.1592315734143;
        Tue, 16 Jun 2020 06:55:34 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id g82sm4221734wmf.1.2020.06.16.06.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 06:55:33 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 71/73] arm64: tegra: Sort nodes by unit-address on Jetson Nano
Date:   Tue, 16 Jun 2020 15:52:36 +0200
Message-Id: <20200616135238.3001888-72-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200616135238.3001888-1-thierry.reding@gmail.com>
References: <20200616135238.3001888-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Move the usb@700d0000 node to the correct place in the device tree,
ordered by unit-address.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../boot/dts/nvidia/tegra210-p3450-0000.dts      | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
index beec6aab2157..4eb51e5eef3a 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
@@ -545,14 +545,6 @@ mmc@700b0000 {
 		vmmc-supply = <&vdd_3v3_sd>;
 	};
 
-	usb@700d0000 {
-		status = "okay";
-		phys = <&micro_b>;
-		phy-names = "usb2-0";
-		avddio-usb-supply = <&vdd_3v3_sys>;
-		hvdd-usb-supply = <&vdd_1v8>;
-	};
-
 	mmc@700b0400 {
 		status = "okay";
 		bus-width = <4>;
@@ -566,6 +558,14 @@ mmc@700b0400 {
 		wakeup-source;
 	};
 
+	usb@700d0000 {
+		status = "okay";
+		phys = <&micro_b>;
+		phy-names = "usb2-0";
+		avddio-usb-supply = <&vdd_3v3_sys>;
+		hvdd-usb-supply = <&vdd_1v8>;
+	};
+
 	clk32k_in: clock@0 {
 		compatible = "fixed-clock";
 		clock-frequency = <32768>;
-- 
2.24.1


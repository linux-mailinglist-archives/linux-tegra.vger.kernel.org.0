Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4611D4418F
	for <lists+linux-tegra@lfdr.de>; Thu, 13 Jun 2019 18:15:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391552AbfFMQPW (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 13 Jun 2019 12:15:22 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:38576 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391391AbfFMQPV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 13 Jun 2019 12:15:21 -0400
Received: by mail-wr1-f68.google.com with SMTP id d18so21421870wrs.5
        for <linux-tegra@vger.kernel.org>; Thu, 13 Jun 2019 09:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BGpCI974hxvyXUgx3FDho+OFT4rtIY1yIC2cfAU1mYQ=;
        b=Qr059p+x32r8F4UjbgTT7N2ALpwpGjkkoaH+48m6O6OVLOKkR6lEZXtgn0DXKiw95i
         8h62MCtDOpM2yAa68O5QYwFLqSSkg0Qujl6v6lVj+R6Nqp/2+xJXJha9uaumU2A4toIk
         G1iYEMm3djrQT8+ETWkSdUJXoWHxg1xwStXN7ODYyKZfiDlMrsMLi7n2oRspqHui6nUG
         CVJuZy64bkn6rmXsdeGdqxQh0O/UgnXh0XZPvQL4lpDftJeZ24jQ5Q1kxL2VCwCtpfcF
         cu5QnVRsqaX607NGIJpSPef1ALTHOhTOx7/yU4nS2aZ0LEZq5B6JL9gcd6zELAvR+ehB
         iDBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BGpCI974hxvyXUgx3FDho+OFT4rtIY1yIC2cfAU1mYQ=;
        b=oKFAvPmAtJgFg8QEGIRzS6bGzfPnK9AWhrtQfOcDrxPlbeZPBiHYHtWTh9Rq6Uojk3
         neo89SvtcMCs0tHawCxaQStESfQG5iaa45ASkiHNp2fccNh/9hCGfQ7iDth4pW7wjk78
         gkAMvls/g5Ev5Kt7TY7SxqXA3KuIwZhrAIo/SESbGeWOgHp7C53/yi6pcFdwx3M+bfwi
         XqV4jX81AaV8b7clkfAS4g+rNlJByQ8jrwtKNcG2lppY73VWr1XVeBsXYLFFHWGEXXga
         2a5qMP194nu9V+joU+eUlJuGfTZsKDecfZ+ysCKkI8+Vg174uHUeUm4HYNGnMnSoC4Ag
         jZzQ==
X-Gm-Message-State: APjAAAXgWi1QebYZDsqOrTEsvCKGaKhA9edfdviAVDOuNccP/KOoT5fK
        BJuTMu4NTc0QdlC8JFAeoUo=
X-Google-Smtp-Source: APXvYqzPjEtq9OwC7v/+Z6N46NG0bYyRQ658CvJFA1mGKiG6zeciL7gUURJuOfwpYd3R97VxdUvIlA==
X-Received: by 2002:a5d:4a0e:: with SMTP id m14mr13967212wrq.91.1560442519275;
        Thu, 13 Jun 2019 09:15:19 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id r5sm208511wrg.10.2019.06.13.09.15.18
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 13 Jun 2019 09:15:18 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH 1/3] arm64: tegra: Add ethernet alias on Jetson TX1
Date:   Thu, 13 Jun 2019 18:15:15 +0200
Message-Id: <20190613161517.2837-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Adding this alias for the Ethernet interface on Jetson TX1 allows the
bootloader to pass the MAC address to the Linux kernel.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
index 9ba69e68a844..c7cc81994f2c 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
@@ -5,6 +5,10 @@
 	model = "NVIDIA Tegra210 P2597 I/O board";
 	compatible = "nvidia,p2597", "nvidia,tegra210";
 
+	aliases {
+		ethernet = "/usb@70090000/ethernet@1";
+	};
+
 	host1x@50000000 {
 		dpaux@54040000 {
 			status = "okay";
@@ -1342,6 +1346,13 @@
 		avdd-usb-supply = <&vdd_3v3_sys>;
 
 		status = "okay";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethernet@1 {
+			reg = <1>;
+		};
 	};
 
 	padctl@7009f000 {
-- 
2.21.0


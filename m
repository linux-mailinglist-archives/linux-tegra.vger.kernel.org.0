Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC9C0151CD
	for <lists+linux-tegra@lfdr.de>; Mon,  6 May 2019 18:41:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726297AbfEFQlZ (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 6 May 2019 12:41:25 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:35857 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726094AbfEFQlZ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 6 May 2019 12:41:25 -0400
Received: by mail-wm1-f65.google.com with SMTP id n25so2353820wmi.1
        for <linux-tegra@vger.kernel.org>; Mon, 06 May 2019 09:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iQgeIsTEx/kg4VMAEWL5/A2xoaxXugvuxPH5cSYewSA=;
        b=iRDpA+vmODUAsqGvsSDQj7xMTEOdhls+TLlvbLY46dCsNO0mjlUDfqG4tLq5LOz+mk
         aQ1dMpo3N9PktpsZNedav1xyCrLoXNjBvyrHgpTirC9sBELsOEQqWO8njMDlMdTpm6D+
         ZIpGoxHmJoZ5IesNQ5JZIkCGtMN7FiOBE4BT2aIYMqeaxyLUDP/oss/uDe5cSTuVcRFw
         pC2CRkCCdtpBLIc7LZyd5VzGY4r0ii+7hypjJbi9oUXyhRwBUKUC4I0pIewJWFUY7uDy
         Wj8KEV0X3cydKifJ4p72w+cmnedj3ia4jpSqppOzgCaIyLRD37/oCeDgnSlsT1v1bXPd
         Y5dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iQgeIsTEx/kg4VMAEWL5/A2xoaxXugvuxPH5cSYewSA=;
        b=AvJkZNnWXTZm0xOtiGph4sAbHeCto9xhZrcJ+sZ7e4brnydQavaCvJWYtxXySdBwdd
         J2eeKI3pTR7x2IJofU15KrbmxukOAZayKpdxuEUgFOmdSuTpo+C6gVUXcYpFhwugJc0S
         /osgg/IKs0PnAp0IavgK9GOAjHd7SJQRcaIUozA+L4FTirV+JKd4BvpijARKPMfDnmNx
         RGk88LUPAvSA9d4yUAkuFkhJDWTnQSXdo5TiWM6nMbipxi9c2fSCRwZrW5+VISso5sSb
         Qz7LBL0FnJtcQQheksGb793Q7NJBb3QUA9hzwlI/5YtMLTJzBfuaoeUWtK/+0rit2S4V
         20sQ==
X-Gm-Message-State: APjAAAXBaOj0P0q6V79qBLYvJo3RglMEB94V+rjxzcmNrWZe9fseNvJi
        zNm1ZF3OnguB7Y9R3uZml4MTZgM/q4M=
X-Google-Smtp-Source: APXvYqzANdLemc6456XT1mU0YZtZMdf99+IAJEjPSEf7DxfemWkxLaVEN8Bsdm852kuTYccQkyqjBg==
X-Received: by 2002:a7b:c411:: with SMTP id k17mr17156595wmi.68.1557160883201;
        Mon, 06 May 2019 09:41:23 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id f138sm15280wmf.23.2019.05.06.09.41.22
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 May 2019 09:41:22 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Bitan Biswas <bbiswas@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Subject: [PATCH] arm64: tegra: Disable XUSB support on Jetson TX2
Date:   Mon,  6 May 2019 18:41:21 +0200
Message-Id: <20190506164121.4507-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The recently introduced XUSB support for Jetson TX2 is causing boot, CPU
hotplug and suspend/resume failures according to several reports.

Temporarily work around this by disabling the XUSB controller and XUSB
pad controller nodes in device tree, while we figure out what's causing
this.

Reported-by: Bitan Biswas <bbiswas@nvidia.com>
Reported-by: Jonathan Hunter <jonathanh@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
index 75ee6cf1e1b4..14d7fea82daf 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
@@ -59,7 +59,7 @@
 	};
 
 	padctl@3520000 {
-		status = "okay";
+		status = "disabled";
 
 		avdd-pll-erefeut-supply = <&vdd_1v8_pll>;
 		avdd-usb-supply = <&vdd_3v3_sys>;
@@ -137,7 +137,7 @@
 	};
 
 	usb@3530000 {
-		status = "okay";
+		status = "disabled";
 
 		phys = <&{/padctl@3520000/pads/usb2/lanes/usb2-0}>,
 		       <&{/padctl@3520000/pads/usb2/lanes/usb2-1}>,
-- 
2.21.0


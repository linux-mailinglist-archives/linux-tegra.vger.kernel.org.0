Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FF0A3789B
	for <lists+linux-tegra@lfdr.de>; Thu,  6 Jun 2019 17:54:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729566AbfFFPyJ (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 6 Jun 2019 11:54:09 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:53722 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729274AbfFFPyI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 6 Jun 2019 11:54:08 -0400
Received: by mail-wm1-f67.google.com with SMTP id x15so459467wmj.3
        for <linux-tegra@vger.kernel.org>; Thu, 06 Jun 2019 08:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zSC9WcLG/V6JDcdJ4LnaqDL5kXFCoFRHF1ciOZdHNZk=;
        b=FnueILvDh2XgnVzGsCGuaEJhpvaljUun85J5T1x2yo88yXEpnUsvLdp6fO3Ze9Q9ci
         XL+4JNW5OftOhIimH9UO0am/gyAyfyjgkUzbjftMD5DWsgCD/HZ39Liu8J1lYGr5G8Vw
         r+IIj22mJ1KRboBC2ERLokKFTM0HGNs+tMHqS5Ttx8199XAJqKtyIEDj/Qnv4A0adm9W
         BxtIGEwCJvB0EWTs/ZXrtMh7jb+Pk/huBMZRWhpTnygDtHtsvNFTlQpAqKx0yUVNGXZB
         TzRxEt9tGA8szgVzQQlTYPI9zyyyG6UcEIPwuFQOA5l8qWkWo63NWtP1idzo9OE6Du4Z
         XY0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zSC9WcLG/V6JDcdJ4LnaqDL5kXFCoFRHF1ciOZdHNZk=;
        b=HZshVTkJWB8U+XPGTDDeBcyJh3yvpmq8AWkhj2gm22UOuD+1ULuV8TxwOcOySXBpUS
         vjKygXuS5tJaqtxj+sWvseQILJ5giJhB9UEBhnUDhAFIOKvLC5FjvhUP7MR8ZeQzgSDd
         FX+QRwDpVCQ4PzqgFdshABlMtRRjqOC03VMIfXTlUdjVJd0YTrYOsDXDJ9E+MGqsZCl0
         6/U+ukUQUEYmHZg9E0tgafeIXCgScprlFmsrenN+pYyVFDUCvgSbzJ7LlxfkFo5KiYaS
         zxDiR7qmheZII1meuH0ucql28wqL4RtJzIb0RomYFUkZFWOhOqF0JFKAPWr0BE3xV9Sb
         wh0w==
X-Gm-Message-State: APjAAAX7XEgW/fWHSFeiHGhFGawYS98dk6Izf4ho442gOsmLNKhXUq3E
        C+UdQ8Cov1Zy+qRZF/fShiQ=
X-Google-Smtp-Source: APXvYqy3wioOCzSFBzFiCQDS58YnFUm5SLj1AI/R91MVQxzwZYjzzYH2if1QYeOWQ2M0552GB9SBBw==
X-Received: by 2002:a1c:7d4e:: with SMTP id y75mr486102wmc.169.1559836447513;
        Thu, 06 Jun 2019 08:54:07 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id t6sm2437418wmb.29.2019.06.06.08.54.06
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 06 Jun 2019 08:54:06 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH] arm64: tegra: Add ID EEPROMs on Jetson Nano
Date:   Thu,  6 Jun 2019 17:54:05 +0200
Message-Id: <20190606155405.16388-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The Jetson Nano has two ID EEPROMs, one for the module and another for
the carrier board. Add both to the device tree so that they can be read
from at runtime.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../boot/dts/nvidia/tegra210-p3450-0000.dts   | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
index 5d0181908f45..97349fcacee9 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
@@ -88,6 +88,31 @@
 		status = "okay";
 	};
 
+	i2c@7000c500 {
+		status = "okay";
+		clock-frequency = <100000>;
+
+		eeprom@50 {
+			compatible = "atmel,24c02";
+			reg = <0x50>;
+
+			address-bits = <8>;
+			page-size = <8>;
+			size = <256>;
+			read-only;
+		};
+
+		eeprom@57 {
+			compatible = "atmel,24c02";
+			reg = <0x57>;
+
+			address-bits = <8>;
+			page-size = <8>;
+			size = <256>;
+			read-only;
+		};
+	};
+
 	hdmi_ddc: i2c@7000c700 {
 		status = "okay";
 		clock-frequency = <100000>;
-- 
2.21.0


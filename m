Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 864C3446B1
	for <lists+linux-tegra@lfdr.de>; Thu, 13 Jun 2019 18:53:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731805AbfFMQxw (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 13 Jun 2019 12:53:52 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:37802 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404413AbfFMQxf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 13 Jun 2019 12:53:35 -0400
Received: by mail-wm1-f65.google.com with SMTP id 22so10865710wmg.2;
        Thu, 13 Jun 2019 09:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Xo+8K/7HEyUS1rYNunK9octJlI7FpY8zAV41iZk/7W0=;
        b=cWVixu446QAAW5gfz9ln0uVRjzMyXoGtTwa01V440cB6noOTLHB5AHACm02ZhD7pOa
         m9tIYn8gA+Eq7DMMVvRRRinPz2OFWI5oX9/dK4tJDUlnxbRQOcqYAJ2hxeGDlQJCVdJV
         oT3a73Qcr9/qHwbxD6mi3puZgzKwb9srFbqfvalDMsPL1fbmkF01rNS4+x3jfdkr0GKh
         j7ChSVzsS140a5rvU+AQdxmw8KVq673i7sjWdICI3a3G8XKynqQuSM2YsZN9U+yjNKP+
         D+0BDC6TxjZvb6e2b7u5ziIx82tavzuYTrV6oxeO1WITlVv7J8DN8Cisja5W9yAP+NLi
         3W1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Xo+8K/7HEyUS1rYNunK9octJlI7FpY8zAV41iZk/7W0=;
        b=PTXRdJQQg+DwuJ4SDqqha72iiUnIDoOgaDxgY+3xVXvyJJ1Pp5wAOGWLj3k9vzgpUW
         nvpvdT/yT6mBBFLvDoygJftoTBh8vopE1PcoMLTb9e/ygp+F3DGJGR3B/kLwZ3jpbHlh
         GHOAJy3dBbBY1RZsUWyOiF/YbFe2KOs71twpK15NqV9UfSjWtabdphYPEdRrFgoDVTtR
         OhhgpvXlhc3x05mws2VtkOrWHnrw6tZUGUNhtdJ6g1nOWPaIphA/R0DmOmJlXJeDZgRY
         5jOQjpU4TWguZka5OoOZ8fSjQBR+dr3iKRXgADInfunrEcAjd3GX4/5jN4ZmQ0UczBUs
         HlgQ==
X-Gm-Message-State: APjAAAWhM0y6MmsRYhQAgRZdGA79IKEA0Lbehy3a3pzV5/laXDqgTWoz
        PTNLFq81XN7NZY5/cI9Fnm0=
X-Google-Smtp-Source: APXvYqzxHZekdHxI54daZODLw4jqiBKpvYkD8jNkkJUk1u+uHMWSD45JwxHrswC/4d3TWb7a6Y+/Sw==
X-Received: by 2002:a1c:5453:: with SMTP id p19mr4053864wmi.148.1560444813439;
        Thu, 13 Jun 2019 09:53:33 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id l190sm559800wml.16.2019.06.13.09.53.32
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 13 Jun 2019 09:53:33 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/4] arm64: tegra: Add ID EEPROM for Jetson TX2 module
Date:   Thu, 13 Jun 2019 18:53:28 +0200
Message-Id: <20190613165331.8689-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

There is an ID EEPROM in the Jetson TX2 module that stores various bits
of information to indentify the module. Add the device tree node so that
operating systems can access this EEPROM.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
index 38ad1053f21a..4bbee83d9943 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
@@ -124,6 +124,17 @@
 
 	i2c@c250000 {
 		status = "okay";
+
+		/* module ID EEPROM */
+		eeprom@50 {
+			compatible = "atmel,24c02";
+			reg = <0x50>;
+
+			address-bits = <8>;
+			page-size = <8>;
+			size = <256>;
+			read-only;
+		};
 	};
 
 	rtc@c2a0000 {
-- 
2.21.0


Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 141F7446A8
	for <lists+linux-tegra@lfdr.de>; Thu, 13 Jun 2019 18:53:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404438AbfFMQxk (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 13 Jun 2019 12:53:40 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:52668 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404414AbfFMQxh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 13 Jun 2019 12:53:37 -0400
Received: by mail-wm1-f67.google.com with SMTP id s3so10967392wms.2;
        Thu, 13 Jun 2019 09:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=g7DtBPspuM/d238lv8u3PyKyoU0jaNDA2UnmS23c3l8=;
        b=AUz3GBrF5/KwIty2Xz9nn26LPWQ0a+YRIWPfwkYSWxfvpHAMtMTbNCdLNq41955EPA
         eYHjhxF29zu9lSutV9Kn7G6a/CIJKHrSAwYvRVcKuWL4AFvmmXH+PaeuCm4FWpLQgvA7
         cGBpjy4C5n3FMNtuIqux/SO1ryQj0yyJTMJ85HBZVg9F7D/f1M6D8ob0rJEhq0fGtjhq
         8MwDQNNUUtdM5lo2nXyla5eFCLrGRAL6n3XZVoxuFfikbZrm2r5P3ZAImtHKstBu2grj
         OWHNn822X7Ni0eYs+eysB4r2LC658uNCAyh4LFREwuhi4tPCRRtuIQyq6eENIpnYf2bA
         wWLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g7DtBPspuM/d238lv8u3PyKyoU0jaNDA2UnmS23c3l8=;
        b=C2YvgGCoW6weA5lQypSrFbLppzWHozriHUCRxmpNpZv3Ze33oq3KVZlATzFb0Oppwm
         lJN7hFORGxMV17v3DLN8YDDpgcU4GL6hGym2WAd84M25pBWi5KNIagW5G3AGiyNIibPu
         GdBqk/HogZnaz9811GC8fRNscI6RLDqmLX6Lb5IcBbTCIpqqddOn2x3fzFUUithAf5at
         nBgLzoeKzxI1vd6lOH/DnebEvAkzdO43pzAukuJPE8WlscU0HlZd2BAL/H78QX4DmzSv
         iuJ2o+3VbPR1hHuSAryzuIW9kL9vMeOybugPz7Ok90nJi+qRDgadccyp7NwojM3tWOTc
         T54Q==
X-Gm-Message-State: APjAAAUXJ8Z65I36tRi7hm+VtpnIDtEmWWvpYA/qXUvJBbAtipbUXoPG
        DO/FfeZPWDyyW87U7Y8fqoM=
X-Google-Smtp-Source: APXvYqyMa24vugO65VP3MxLyioc/VVw02NAtOXlE0WFQAf9E3ZXr9iAUxzpumfA1jZmy8yunEQcSJQ==
X-Received: by 2002:a1c:9d86:: with SMTP id g128mr4906331wme.51.1560444815003;
        Thu, 13 Jun 2019 09:53:35 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id j189sm487621wmb.48.2019.06.13.09.53.34
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 13 Jun 2019 09:53:34 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/4] arm64: tegra: Add ID EEPROM for Jetson TX2 Developer Kit
Date:   Thu, 13 Jun 2019 18:53:29 +0200
Message-Id: <20190613165331.8689-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190613165331.8689-1-thierry.reding@gmail.com>
References: <20190613165331.8689-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

There is an ID EEPROM on the Jetson TX2 carrier board, part of the
Jetson TX2 Developer Kit, that exposes information that can be used to
identify the carrier board. Add the device tree node so that operating
systems can access this EEPROM.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
index 837218e83e69..ab6648c72ad5 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
@@ -149,6 +149,19 @@
 		phy-names = "usb2-0", "usb2-1", "usb3-0";
 	};
 
+	i2c@c250000 {
+		/* carrier board ID EEPROM */
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
 	pcie@10003000 {
 		status = "okay";
 
-- 
2.21.0


Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B3C234C3C
	for <lists+linux-tegra@lfdr.de>; Tue,  4 Jun 2019 17:29:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728032AbfFDP3Q (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 4 Jun 2019 11:29:16 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:37956 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727951AbfFDP3Q (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 4 Jun 2019 11:29:16 -0400
Received: by mail-wm1-f68.google.com with SMTP id t5so514589wmh.3
        for <linux-tegra@vger.kernel.org>; Tue, 04 Jun 2019 08:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a150wWdQElyVMPGovwdQUvdBYe0f1R8XzB+6e8LgwkQ=;
        b=EvLDrXYzhuWs/WsryajdLtAwyZ196asO7IOLOpuGHVWarNeaj7odHek1DGSsY6a6no
         w4pWuDED+91OZG/mcrvrs8SCxmr7JMvW9IVcSKo9QmaEPKLN8XsOigsWyW55S62nyFus
         2yW3JwOHXvSxAGkiOzvYX+u9U+FNjrCREdy6j7oboQlTTJAvfFwTkQ4eMAOLms7qgFFV
         e7MJoNfY2deI4LNCo9q/X3PZ5RC2BM6OTsQZYpuSGQzwSo7reyRwyId8EGExVzQxmBro
         8S/F7PEySLXZkQRLkHDnhUldvZrKhXek5PDwZIZAsxrKL8lmuCp7B3jv2TdVmHueHgUQ
         Z+PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a150wWdQElyVMPGovwdQUvdBYe0f1R8XzB+6e8LgwkQ=;
        b=rXE9b49ZskaxUEmqjQgyuRTDchmEI/yIQOZWIYYyHmJifFsv2/XsMyzBNsRhamLyuS
         Z9xDD+xu7ziT7pd1aS0ZilwzxCPncPKqGQ0JhuxfOi1TzFry5WPzft+sOgyGtyWgbXm5
         SzyLcexkGBkqBcIEZU6asCIq+Numtqn4jqZKE3mGalQaAQmbcUwV0UZAyuRDiXRwlyj/
         KC6eGQCdNSI9gaNbo4ag8iXl5b0Q95FakEYc+mkpc7kgruNBeCjx1CVwFN2eFC8vt4Im
         vckaMVF5rsSMth1cftr2hzlYM7Jpfy+juUfv87SqxR22m35rmwCuAhxllkrZ4bpuqU7y
         UXQw==
X-Gm-Message-State: APjAAAVZcnl9k78zbl5YTaQlLdvqbIsy/kvY8+jIeWDM/8pEyQXIPSsX
        9BmnQ5Ckn6PRDr6zV/u2Hg2Y45gD
X-Google-Smtp-Source: APXvYqyQatEvlOMmTxAP5ArVm/etiF1SS5wcrr6YyyLbl9nOTJ2VcoLACe5viTYegRUwe65+awFIcQ==
X-Received: by 2002:a1c:9c08:: with SMTP id f8mr714780wme.143.1559662154319;
        Tue, 04 Jun 2019 08:29:14 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id w185sm17574429wma.39.2019.06.04.08.29.13
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 04 Jun 2019 08:29:13 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH] arm64: tegra: Add VCC supply for GPIO expanders on Jetson TX2
Date:   Tue,  4 Jun 2019 17:29:12 +0200
Message-Id: <20190604152912.21458-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The GPIO expanders on Jetson TX2 are powered by the VDD_1V8 and
VDD_3V3_SYS supplies, respectively. Model this in device tree so that
the correct supplies are referenced.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
index 5102de1dac9c..837218e83e69 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
@@ -31,6 +31,8 @@
 
 			#gpio-cells = <2>;
 			gpio-controller;
+
+			vcc-supply = <&vdd_3v3_sys>;
 		};
 
 		exp2: gpio@77 {
@@ -43,6 +45,8 @@
 
 			#gpio-cells = <2>;
 			gpio-controller;
+
+			vcc-supply = <&vdd_1v8>;
 		};
 	};
 
-- 
2.21.0


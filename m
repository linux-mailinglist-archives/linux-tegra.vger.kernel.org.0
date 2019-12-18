Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EDD06125130
	for <lists+linux-tegra@lfdr.de>; Wed, 18 Dec 2019 20:00:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726831AbfLRTAU (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 18 Dec 2019 14:00:20 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:46104 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726939AbfLRTAU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 18 Dec 2019 14:00:20 -0500
Received: by mail-lf1-f68.google.com with SMTP id f15so2439776lfl.13
        for <linux-tegra@vger.kernel.org>; Wed, 18 Dec 2019 11:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eoDXaTyw+gIvJ5ckCSwh5rhCMxi3cj8JyA3RyBnKQcE=;
        b=W2SrWYBWT7oeWjIQE7mjntNue6NtCnroTsVm4+s9lGiel8BS2NrRJyFHbgD4XGG7gK
         91vZJit4CoKs69gfYjTuksdjT6oKWa0l3oiEs0i6hQDjVCP1TUlxmKiEOw4EfSg909tC
         rMjJxf8/8F2yjuKyr4om4VdUeQmdY9lN/A4d6S4EXBtXNc7tyt7dDuMTpfzJ2LgN0jJD
         O15/+V9TqELjP0ij1N8lZRR2IR83YYnYesJkT6/hQwA24kPhITd0ST2tonsSqZ7a2nTC
         OWGQw4fhZe0Ccidx0X7oWywkhQ5dnpWoDbXUVAE2UCp3nVJDaHTlOKGUCk1m5E6KJuZ3
         ABQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eoDXaTyw+gIvJ5ckCSwh5rhCMxi3cj8JyA3RyBnKQcE=;
        b=e6RruECKNYx0wZlq/yjV8Zb5shSjl20q4PqTHgEnPGPtkGZUFCnG2ZidXk3TTZ9Mlm
         7LVYaR9ZX7vV3mIOeYYOwzP5KMnNyWOh0yD+yNhsei7LyXIAZorS0su8x8cHqLICYg7L
         Sd7fVaQeWIsxMlKhL8F9g7u/I2nGFC1TYJ+ehtk9ijY/7A4VjOljX14fWEBi64iB8ot8
         KDArR0hLQqxLWTy3b7Wnxo4y356vanKOUBrf2WC8mfKKuGvGxdTSI4EMICGpSyeluBAp
         8EPNUyV/xuCz2T/IiWjGKYS0436AqsImyovUmr4BnV/RaSXC5YfycpdyLFR3mt5PQ5/q
         8dqw==
X-Gm-Message-State: APjAAAVsgtFcOCkABBvTWv57EDyjPo9oxbRiLcSMTTaDoaJh3YpdLPWm
        pi7NiWuO0v/UN+rf1j7ERsvL5pDs
X-Google-Smtp-Source: APXvYqyq5jDqyBpM6OE/BWFMAnWkFoELZNDXeFhGRdZ1DOI8e7/jjOzCT9cklDfD4sFYxGTZ/z/zsQ==
X-Received: by 2002:a19:8456:: with SMTP id g83mr2833295lfd.0.1576695618289;
        Wed, 18 Dec 2019 11:00:18 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.gmail.com with ESMTPSA id l64sm1576013lfd.30.2019.12.18.11.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 11:00:17 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Marc Dietrich <marvin24@gmx.de>,
        Nicolas Chauvet <kwizart@gmail.com>
Cc:     linux-tegra@vger.kernel.org
Subject: [PATCH v1] ARM: dts: tegra20: paz00: Add memory timings
Date:   Wed, 18 Dec 2019 21:59:57 +0300
Message-Id: <20191218185957.29237-1-digetx@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

PAZ00 board has two variants of DDR2 SDRAM devices for External Memory:
one is Hynix HY5PS1G831CLFP-Y5 and the other is Micron MT47H128M8CF-25:H.
The Micron variant doesn't have official timings in the wild, hence only
timings for the Hynix are added. The memory frequency-scaling was tested
using the Tegra20 devfreq driver.

Tested-by: Marc Dietrich <marvin24@gmx.de>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20-paz00.dts | 46 +++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/arm/boot/dts/tegra20-paz00.dts b/arch/arm/boot/dts/tegra20-paz00.dts
index 85fce5bc72d6..be0ab9b84b9a 100644
--- a/arch/arm/boot/dts/tegra20-paz00.dts
+++ b/arch/arm/boot/dts/tegra20-paz00.dts
@@ -311,6 +311,52 @@ nvec@7000c500 {
 		reset-names = "i2c";
 	};
 
+	memory-controller@7000f400 {
+		nvidia,use-ram-code;
+
+		emc-tables@hynix {
+			nvidia,ram-code = <0x0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			emc-table@166500 {
+				reg = <166500>;
+				compatible = "nvidia,tegra20-emc-table";
+				clock-frequency = <166500>;
+				nvidia,emc-registers = <0x0000000a 0x00000016
+					0x00000008 0x00000003 0x00000004 0x00000004
+					0x00000002 0x0000000c 0x00000003 0x00000003
+					0x00000002 0x00000001 0x00000004 0x00000005
+					0x00000004 0x00000009 0x0000000d 0x000004df
+					0x00000000 0x00000003 0x00000003 0x00000003
+					0x00000003 0x00000001 0x0000000a 0x000000c8
+					0x00000003 0x00000006 0x00000004 0x00000008
+					0x00000002 0x00000000 0x00000000 0x00000002
+					0x00000000 0x00000000 0x00000083 0xe03b0323
+					0x007fe010 0x00001414 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000>;
+			};
+
+			emc-table@333000 {
+				reg = <333000>;
+				compatible = "nvidia,tegra20-emc-table";
+				clock-frequency = <333000>;
+				nvidia,emc-registers = <0x00000018 0x00000033
+					0x00000012 0x00000004 0x00000004 0x00000005
+					0x00000003 0x0000000c 0x00000006 0x00000006
+					0x00000003 0x00000001 0x00000004 0x00000005
+					0x00000004 0x00000009 0x0000000d 0x00000bff
+					0x00000000 0x00000003 0x00000003 0x00000006
+					0x00000006 0x00000001 0x00000011 0x000000c8
+					0x00000003 0x0000000e 0x00000007 0x00000008
+					0x00000002 0x00000000 0x00000000 0x00000002
+					0x00000000 0x00000000 0x00000083 0xf0440303
+					0x007fe010 0x00001414 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000>;
+			};
+		};
+	};
+
 	i2c@7000d000 {
 		status = "okay";
 		clock-frequency = <400000>;
-- 
2.24.0


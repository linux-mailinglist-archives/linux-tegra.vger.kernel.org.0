Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01BE247166E
	for <lists+linux-tegra@lfdr.de>; Sat, 11 Dec 2021 22:15:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232244AbhLKVOl (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sat, 11 Dec 2021 16:14:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232153AbhLKVOd (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 11 Dec 2021 16:14:33 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F260DC061A72;
        Sat, 11 Dec 2021 13:14:30 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id k37so24199439lfv.3;
        Sat, 11 Dec 2021 13:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=H5/KDFNcOS9t19t6LWOC8ZlEIcQKSGI/wf4Jd/2UtuY=;
        b=pJx8lpGO3qtofxHRhP8VM+/4VBEn60sn+om2q3lRWGAZlfJJznDuh6u01PFVgAWmy8
         eBiH5eMrXG1dp1UDHtm8IOdmHRQKpMSIkyeiBxx6KYaZscKOq9FchPTWuzn31x/12OSb
         iR/NaW5dn748EI8lqCRLp2nmljwyQHXszgC6dE0y5U2cLGxF0Td3d/bCtrWUVPHT4VDj
         wLpLL7XJreHSdxBu5aJFCPcDfL3drTFEXdnQTnkAjA5liCR6J6kmpTU59gK0SwXX4N7B
         0QJEDh0KdPADazWlqDCA7bhNONBqSuZsiBnhNHZf+TOvYSUT2n25RnWtng8I5IAlpLhI
         b2Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H5/KDFNcOS9t19t6LWOC8ZlEIcQKSGI/wf4Jd/2UtuY=;
        b=SLmIEDHgOjCozYra4AgIpkQLF19TrkJgEaJ1vx/OUt8nYysh4OJ/qFgVibL2CoSrFc
         qIPCOlHbLfFoQlm7EwtgEwtVZlCO99RUZtS0ABQcxxzveXiFONnRHEEH5KVxHr1d3xT1
         8ZhzgSvQ0cmLdj6dEM8U2lzSIqCx+oayO+xhiXun6e8KC6dm3yJcgzVg585tjn6WsHLA
         NLggHNXchPbpq++yU3PpEeY+vQoVL2p9aALokEwFb5vRSH2XaM7Bd50vKkTaXkW496wq
         AMk4f0z9JomH4gZrHZ/9n+3j+5dQjKxxQclEWd+tw/U2Om2TFU5zPGRWSqNt8BTisAtt
         CddA==
X-Gm-Message-State: AOAM533Kur+IQ/H6V4dqNp0/dsEmbBfEQYR+Q8rJr8u1tHgMm//9IE0y
        LA2vkZgLAoVnPG3nzStD8ik=
X-Google-Smtp-Source: ABdhPJygGcBBpAGrPJjXvORYyaHg7Kb6llMIlDBks4l1s75Exne98Og7p2xGQ3qrT9u+MzZ6awMo0g==
X-Received: by 2002:ac2:442e:: with SMTP id w14mr5902897lfl.379.1639257269051;
        Sat, 11 Dec 2021 13:14:29 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru. [94.29.46.111])
        by smtp.gmail.com with ESMTPSA id v6sm765927lfp.61.2021.12.11.13.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Dec 2021 13:14:28 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        David Heidelberg <david@ixit.cz>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Anton Bambura <jenneron@protonmail.com>,
        Antoni Aloy Torrens <aaloytorrens@gmail.com>,
        Nikola Milosavljevic <mnidza@outlook.com>,
        Ion Agorria <ion@agorria.com>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Ihor Didenko <tailormoon@rambler.ru>,
        Andreas Westman Dorcsak <hedmoo@yahoo.com>,
        Maxim Schwalm <maxim.schwalm@gmail.com>,
        Raffaele Tranquillini <raffaele.tranquillini@gmail.com>,
        Jasper Korten <jja2000@gmail.com>,
        Thomas Graichen <thomas.graichen@gmail.com>,
        Stefan Eichenberger <stefan.eichenberger@toradex.com>,
        Stefan Agner <stefan@agner.ch>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 08/28] ARM: tegra: Add device-tree for ASUS Transformer Prime TF201
Date:   Sun, 12 Dec 2021 00:13:52 +0300
Message-Id: <20211211211412.10791-9-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211211211412.10791-1-digetx@gmail.com>
References: <20211211211412.10791-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Svyatoslav Ryhel <clamor95@gmail.com>

Add device-tree for ASUS Transformer Prime TF201, which is a NVIDIA
Tegra30-based 2-in-1 detachable, orignally running Android.

Link: https://wiki.postmarketos.org/wiki/ASUS_Transformer_Prime_(asus-tf201)
Co-developed-by: Ion Agorria <ion@agorria.com>
Signed-off-by: Ion Agorria <ion@agorria.com>
Co-developed-by: Maxim Schwalm <maxim.schwalm@gmail.com>
Signed-off-by: Maxim Schwalm <maxim.schwalm@gmail.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/Makefile               |   1 +
 arch/arm/boot/dts/tegra30-asus-tf201.dts | 623 +++++++++++++++++++++++
 2 files changed, 624 insertions(+)
 create mode 100644 arch/arm/boot/dts/tegra30-asus-tf201.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 8fdebf7c1afe..a72aab08e4db 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1321,6 +1321,7 @@ dtb-$(CONFIG_ARCH_TEGRA_3x_SOC) += \
 	tegra30-asus-nexus7-grouper-PM269.dtb \
 	tegra30-asus-nexus7-grouper-E1565.dtb \
 	tegra30-asus-nexus7-tilapia-E1565.dtb \
+	tegra30-asus-tf201.dtb \
 	tegra30-beaver.dtb \
 	tegra30-cardhu-a02.dtb \
 	tegra30-cardhu-a04.dtb \
diff --git a/arch/arm/boot/dts/tegra30-asus-tf201.dts b/arch/arm/boot/dts/tegra30-asus-tf201.dts
new file mode 100644
index 000000000000..76bbb1b67119
--- /dev/null
+++ b/arch/arm/boot/dts/tegra30-asus-tf201.dts
@@ -0,0 +1,623 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+
+#include "tegra30-asus-transformer-common.dtsi"
+#include "tegra30-asus-lvds-display.dtsi"
+
+/ {
+	model = "Asus Transformer Prime TF201";
+	compatible = "asus,tf201", "nvidia,tegra30";
+
+	pinmux@70000868 {
+		state_default: pinmux {
+			lcd_pwr2_pc6 {
+				nvidia,pins = "lcd_pwr2_pc6",
+						"lcd_dc1_pd2";
+				nvidia,function = "displaya";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			pbb3 {
+				nvidia,pins = "pbb3";
+				nvidia,function = "vgp3";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			pbb7 {
+				nvidia,pins = "pbb7";
+				nvidia,function = "i2s4";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			kb_row7_pr7 {
+				nvidia,pins = "kb_row7_pr7";
+				nvidia,function = "kbc";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+			gmi_cs4_n_pk2 {
+				nvidia,pins = "gmi_cs4_n_pk2";
+				nvidia,function = "gmi";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+		};
+	};
+
+	uartc: serial@70006200 {
+		/* Azurewave AW-NH615 BCM4329B1 */
+		bluetooth {
+			compatible = "brcm,bcm4329-bt";
+		};
+	};
+
+	i2c@7000c400 {
+		/* Atmel MXT768E touchscreen */
+		touchscreen@4d {
+			compatible = "atmel,maxtouch";
+			reg = <0x4d>;
+
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(H, 4) IRQ_TYPE_EDGE_FALLING>;
+			reset-gpios = <&gpio TEGRA_GPIO(H, 6) GPIO_ACTIVE_LOW>;
+
+			vdda-supply = <&vdd_3v3_sys>;
+			vdd-supply  = <&vdd_3v3_sys>;
+		};
+	};
+
+	i2c@7000c500 {
+		clock-frequency = <100000>;
+
+		magnetometer@e {
+			mount-matrix =  "-1",  "0",  "0",
+					 "0", "-1",  "0",
+					 "0",  "0", "-1";
+		};
+
+		gyroscope@68 {
+			mount-matrix =   "0", "-1",  "0",
+					"-1",  "0",  "0",
+					 "0",  "0", "-1";
+
+			/* External I2C interface */
+			i2c-gate {
+				accelerometer@f {
+					mount-matrix =   "1",  "0",  "0",
+							 "0", "-1",  "0",
+							 "0",  "0",  "1";
+				};
+			};
+		};
+	};
+
+	i2c@7000d000 {
+		/* Realtek ALC5631 audio codec */
+		rt5631: audio-codec@1a {
+			compatible = "realtek,rt5631";
+			reg = <0x1a>;
+		};
+	};
+
+	usb-phy@7d000000 {
+		/delete-property/ nvidia,xcvr-setup-use-fuses;
+		nvidia,xcvr-setup = <5>;      /* Based on TF201 fuse value - 48 */
+	};
+
+	usb-phy@7d008000 {
+		/delete-property/ nvidia,xcvr-setup-use-fuses;
+		nvidia,xcvr-setup = <5>;      /* Based on TF201 fuse value - 48 */
+	};
+
+	display-panel {
+		compatible = "hannstar,hsd101pww2";
+	};
+
+	haptic-feedback {
+		compatible = "gpio-vibrator";
+		enable-gpios = <&gpio TEGRA_GPIO(H, 7) GPIO_ACTIVE_HIGH>;
+		vcc-supply = <&vdd_3v3_sys>;
+	};
+
+	memory-controller@7000f000 {
+		emc-timings-0 {
+			/* Elpida 1GB EDB8132B2MA-8D-F LPDDR2 400MHz */
+			nvidia,ram-code = <0>;
+
+			timing-25500000 {
+				clock-frequency = <25500000>;
+
+				nvidia,emem-configuration = < 0x00020001 0x80000010
+					0x00000001 0x00000001 0x00000002 0x00000000
+					0x00000003 0x00000001 0x00000002 0x00000004
+					0x00000001 0x00000000 0x00000002 0x00000002
+					0x02020001 0x00060402 0x73e30303 0x001f0000 >;
+			};
+
+			timing-51000000 {
+				clock-frequency = <51000000>;
+
+				nvidia,emem-configuration = < 0x00010001 0x80000010
+					0x00000001 0x00000001 0x00000002 0x00000000
+					0x00000003 0x00000001 0x00000002 0x00000004
+					0x00000001 0x00000000 0x00000002 0x00000002
+					0x02020001 0x00060402 0x72c30303 0x001f0000 >;
+			};
+
+			timing-102000000 {
+				clock-frequency = <102000000>;
+
+				nvidia,emem-configuration = < 0x00000001 0x80000018
+					0x00000001 0x00000001 0x00000003 0x00000001
+					0x00000003 0x00000001 0x00000002 0x00000004
+					0x00000001 0x00000000 0x00000002 0x00000002
+					0x02020001 0x00060403 0x72430504 0x001f0000 >;
+			};
+
+			timing-204000000 {
+				clock-frequency = <204000000>;
+
+				nvidia,emem-configuration = < 0x00000003 0x80000025
+					0x00000001 0x00000001 0x00000006 0x00000003
+					0x00000005 0x00000001 0x00000002 0x00000004
+					0x00000001 0x00000000 0x00000003 0x00000002
+					0x02030001 0x00070506 0x71e40a07 0x001f0000 >;
+			};
+
+			timing-400000000 {
+				clock-frequency = <400000000>;
+
+				nvidia,emem-configuration = < 0x00000006 0x80000048
+					0x00000002 0x00000003 0x0000000c 0x00000007
+					0x00000009 0x00000001 0x00000002 0x00000006
+					0x00000001 0x00000000 0x00000004 0x00000004
+					0x04040001 0x000d090c 0x71c6120d 0x001f0000 >;
+			};
+		};
+
+		emc-timings-1 {
+			/* TF201 Unknown 1GB LPDDR2 500MHZ */
+			nvidia,ram-code = <1>;
+
+			timing-25500000 {
+				clock-frequency = <25500000>;
+
+				nvidia,emem-configuration = < 0x00020001 0x80000010
+					0x00000001 0x00000001 0x00000002 0x00000000
+					0x00000003 0x00000001 0x00000002 0x00000004
+					0x00000001 0x00000000 0x00000002 0x00000002
+					0x02020001 0x00060402 0x73e30303 0x001f0000 >;
+			};
+
+			timing-51000000 {
+				clock-frequency = <51000000>;
+
+				nvidia,emem-configuration = < 0x00010001 0x80000010
+					0x00000001 0x00000001 0x00000002 0x00000000
+					0x00000003 0x00000001 0x00000002 0x00000004
+					0x00000001 0x00000000 0x00000002 0x00000002
+					0x02020001 0x00060402 0x72c30303 0x001f0000 >;
+			};
+
+			timing-102000000 {
+				clock-frequency = <102000000>;
+
+				nvidia,emem-configuration = < 0x00000001 0x80000018
+					0x00000001 0x00000001 0x00000003 0x00000001
+					0x00000003 0x00000001 0x00000002 0x00000004
+					0x00000001 0x00000000 0x00000002 0x00000002
+					0x02020001 0x00060403 0x72430504 0x001f0000 >;
+			};
+
+			timing-204000000 {
+				clock-frequency = <204000000>;
+
+				nvidia,emem-configuration = < 0x00000003 0x80000025
+					0x00000001 0x00000001 0x00000006 0x00000003
+					0x00000005 0x00000001 0x00000002 0x00000004
+					0x00000001 0x00000000 0x00000003 0x00000002
+					0x02030001 0x00070506 0x71e40a07 0x001f0000 >;
+			};
+
+			timing-500000000 {
+				clock-frequency = <500000000>;
+
+				nvidia,emem-configuration = < 0x00000007 0x8000005a
+					0x00000003 0x00000004 0x0000000e 0x00000009
+					0x0000000c 0x00000002 0x00000002 0x00000008
+					0x00000001 0x00000000 0x00000004 0x00000005
+					0x05040001 0x00100a0e 0x71c8170f 0x001f0000 >;
+			};
+		};
+	};
+
+	memory-controller@7000f400 {
+		emc-timings-0 {
+			/* Elpida 1GB EDB8132B2MA-8D-F LPDDR2 400MHz */
+			nvidia,ram-code = <0>;
+
+			timing-25500000 {
+				clock-frequency = <25500000>;
+
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-mode-1 = <0x00010022>;
+				nvidia,emc-mode-2 = <0x00020001>;
+				nvidia,emc-mode-reset = <0x00000000>;
+				nvidia,emc-zcal-cnt-long = <0x00000009>;
+				nvidia,emc-cfg-periodic-qrst;
+
+				nvidia,emc-configuration =  < 0x00000001
+					0x00000003 0x00000002 0x00000002 0x00000004
+					0x00000004 0x00000001 0x00000005 0x00000002
+					0x00000002 0x00000001 0x00000001 0x00000000
+					0x00000001 0x00000003 0x00000001 0x0000000b
+					0x0000000a 0x00000060 0x00000000 0x00000018
+					0x00000001 0x00000001 0x00000002 0x00000000
+					0x00000001 0x00000007 0x00000004 0x00000004
+					0x00000003 0x00000008 0x00000004 0x00000004
+					0x00000002 0x0000006b 0x00000004 0x00000004
+					0x00000000 0x00000000 0x00004282 0x00780084
+					0x00008000 0x00098000 0x00098000 0x00098000
+					0x00098000 0x00000010 0x00000010 0x00000010
+					0x00000010 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000008 0x00000008 0x00000008
+					0x00000008 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00080000 0x00080000 0x00080000
+					0x00080000 0x00100220 0x0800201c 0x00000000
+					0x77ffc004 0x01f1f008 0x00000000 0x00000007
+					0x08000068 0x08000000 0x00000802 0x00000000
+					0x00000009 0x00090009 0xa0f10000 0x00000000
+					0x00000000 0x800001c5 0xe0000000 0xff00ff00 >;
+			};
+
+			timing-51000000 {
+				clock-frequency = <51000000>;
+
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-mode-1 = <0x00010022>;
+				nvidia,emc-mode-2 = <0x00020001>;
+				nvidia,emc-mode-reset = <0x00000000>;
+				nvidia,emc-zcal-cnt-long = <0x00000009>;
+				nvidia,emc-cfg-periodic-qrst;
+
+				nvidia,emc-configuration =  < 0x00000003
+					0x00000006 0x00000002 0x00000002 0x00000004
+					0x00000004 0x00000001 0x00000005 0x00000002
+					0x00000002 0x00000001 0x00000001 0x00000000
+					0x00000001 0x00000003 0x00000001 0x0000000b
+					0x0000000a 0x000000c0 0x00000000 0x00000030
+					0x00000001 0x00000001 0x00000002 0x00000000
+					0x00000001 0x00000007 0x00000008 0x00000008
+					0x00000003 0x00000008 0x00000004 0x00000004
+					0x00000002 0x000000d5 0x00000004 0x00000004
+					0x00000000 0x00000000 0x00004282 0x00780084
+					0x00008000 0x00098000 0x00098000 0x00098000
+					0x00098000 0x00000010 0x00000010 0x00000010
+					0x00000010 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000018 0x00000018 0x00000018
+					0x00000018 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00080000 0x00080000 0x00080000
+					0x00080000 0x00100220 0x0800201c 0x00000000
+					0x77ffc004 0x01f1f008 0x00000000 0x00000007
+					0x08000068 0x08000000 0x00000802 0x00000000
+					0x00000009 0x00090009 0xa0f10000 0x00000000
+					0x00000000 0x80000287 0xe0000000 0xff00ff00 >;
+			};
+
+			timing-102000000 {
+				clock-frequency = <102000000>;
+
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-mode-1 = <0x00010022>;
+				nvidia,emc-mode-2 = <0x00020001>;
+				nvidia,emc-mode-reset = <0x00000000>;
+				nvidia,emc-zcal-cnt-long = <0x0000000a>;
+				nvidia,emc-cfg-periodic-qrst;
+
+				nvidia,emc-configuration =  < 0x00000006
+					0x0000000d 0x00000004 0x00000002 0x00000004
+					0x00000004 0x00000001 0x00000005 0x00000002
+					0x00000002 0x00000001 0x00000001 0x00000000
+					0x00000001 0x00000003 0x00000001 0x0000000b
+					0x0000000a 0x00000181 0x00000000 0x00000060
+					0x00000001 0x00000001 0x00000002 0x00000000
+					0x00000001 0x00000007 0x0000000f 0x0000000f
+					0x00000003 0x00000008 0x00000004 0x00000004
+					0x00000002 0x000001a9 0x00000004 0x00000006
+					0x00000000 0x00000000 0x00004282 0x00780084
+					0x00008000 0x000a0000 0x000a0000 0x000a0000
+					0x000a0000 0x00000010 0x00000010 0x00000010
+					0x00000010 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000008 0x00000008 0x00000008
+					0x00000008 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00080000 0x00080000 0x00080000
+					0x00080000 0x00120220 0x0800201c 0x00000000
+					0x77ffc004 0x01f1f008 0x00000000 0x00000007
+					0x08000068 0x08000000 0x00000802 0x00000000
+					0x0000000a 0x00090009 0xa0f10000 0x00000000
+					0x00000000 0x8000040b 0xe0000000 0xff00ff00 >;
+			};
+
+			timing-204000000 {
+				clock-frequency = <204000000>;
+
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-mode-1 = <0x00010042>;
+				nvidia,emc-mode-2 = <0x00020001>;
+				nvidia,emc-mode-reset = <0x00000000>;
+				nvidia,emc-zcal-cnt-long = <0x00000013>;
+				nvidia,emc-cfg-periodic-qrst;
+
+				nvidia,emc-configuration =  < 0x0000000c
+					0x0000001a 0x00000008 0x00000003 0x00000005
+					0x00000004 0x00000001 0x00000006 0x00000003
+					0x00000003 0x00000002 0x00000002 0x00000000
+					0x00000001 0x00000003 0x00000001 0x0000000c
+					0x0000000a 0x00000303 0x00000000 0x000000c0
+					0x00000001 0x00000001 0x00000003 0x00000000
+					0x00000001 0x00000007 0x0000001d 0x0000001d
+					0x00000004 0x0000000b 0x00000005 0x00000004
+					0x00000002 0x00000351 0x00000004 0x00000006
+					0x00000000 0x00000000 0x00004282 0x00440084
+					0x00008000 0x00074000 0x00074000 0x00074000
+					0x00074000 0x00000010 0x00000010 0x00000010
+					0x00000010 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000018 0x00000018 0x00000018
+					0x00000018 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00078000 0x00078000 0x00078000
+					0x00078000 0x00100220 0x0800201c 0x00000000
+					0x77ffc004 0x01f1f008 0x00000000 0x00000007
+					0x08000068 0x08000000 0x00000802 0x00000000
+					0x00000013 0x00090009 0xa0f10000 0x00000000
+					0x00000000 0x80000713 0xe0000000 0xff00ff00 >;
+			};
+
+			timing-400000000 {
+				clock-frequency = <400000000>;
+
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-mode-1 = <0x00010082>;
+				nvidia,emc-mode-2 = <0x00020004>;
+				nvidia,emc-mode-reset = <0x00000000>;
+				nvidia,emc-zcal-cnt-long = <0x00000024>;
+				nvidia,emc-cfg-periodic-qrst;
+
+				nvidia,emc-configuration =  < 0x00000017
+					0x00000033 0x00000010 0x00000007 0x00000007
+					0x00000007 0x00000002 0x0000000a 0x00000007
+					0x00000007 0x00000003 0x00000002 0x00000000
+					0x00000003 0x00000007 0x00000004 0x0000000d
+					0x0000000e 0x000005e9 0x00000000 0x0000017a
+					0x00000002 0x00000002 0x00000007 0x00000000
+					0x00000001 0x0000000c 0x00000038 0x00000038
+					0x00000006 0x00000014 0x00000009 0x00000004
+					0x00000002 0x00000680 0x00000000 0x00000006
+					0x00000000 0x00000000 0x00006282 0x001d0084
+					0x00008000 0x0002c000 0x0002c000 0x0002c000
+					0x0002c000 0x00000010 0x00000010 0x00000010
+					0x00000010 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000008 0x00000008 0x00000008
+					0x00000008 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00048000 0x00048000 0x00048000
+					0x00048000 0x000c0220 0x0800003d 0x00000000
+					0x77ffc004 0x01f1f408 0x00000000 0x00000007
+					0x08000068 0x08000000 0x00000802 0x00000000
+					0x00000024 0x000c000c 0xa0f10000 0x00000000
+					0x00000000 0x80000ce6 0xe0000000 0xff00ff88 >;
+			};
+		};
+
+		emc-timings-1 {
+			/* TF201 Unknown 1GB LPDDR2 500MHZ */
+			nvidia,ram-code = <1>;
+
+			timing-25500000 {
+				clock-frequency = <25500000>;
+
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-mode-1 = <0x00010022>;
+				nvidia,emc-mode-2 = <0x00020001>;
+				nvidia,emc-mode-reset = <0x00000000>;
+				nvidia,emc-zcal-cnt-long = <0x00000009>;
+				nvidia,emc-cfg-dyn-self-ref;
+				nvidia,emc-cfg-periodic-qrst;
+
+				nvidia,emc-configuration =  < 0x00000001
+					0x00000003 0x00000002 0x00000002 0x00000004
+					0x00000004 0x00000001 0x00000005 0x00000002
+					0x00000002 0x00000001 0x00000001 0x00000000
+					0x00000001 0x00000003 0x00000001 0x0000000b
+					0x00000009 0x00000060 0x00000000 0x00000018
+					0x00000001 0x00000001 0x00000002 0x00000000
+					0x00000001 0x00000007 0x00000004 0x00000004
+					0x00000003 0x00000008 0x00000004 0x00000004
+					0x00000002 0x0000006b 0x00000004 0x00000004
+					0x00000000 0x00000000 0x00004282 0x00780084
+					0x00008000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x00100220 0x0800201c 0x00000000
+					0x77ffc004 0x01f1f008 0x00000000 0x00000007
+					0x08000068 0x08000000 0x00000802 0x00064000
+					0x0000000a 0x00090009 0xa0f10000 0x00000000
+					0x00000000 0x800001c5 0xe0000000 0xff00ff00 >;
+			};
+
+			timing-51000000 {
+				clock-frequency = <51000000>;
+
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-mode-1 = <0x00010022>;
+				nvidia,emc-mode-2 = <0x00020001>;
+				nvidia,emc-mode-reset = <0x00000000>;
+				nvidia,emc-zcal-cnt-long = <0x00000009>;
+				nvidia,emc-cfg-dyn-self-ref;
+				nvidia,emc-cfg-periodic-qrst;
+
+				nvidia,emc-configuration =  < 0x00000003
+					0x00000006 0x00000002 0x00000002 0x00000004
+					0x00000004 0x00000001 0x00000005 0x00000002
+					0x00000002 0x00000001 0x00000001 0x00000000
+					0x00000001 0x00000003 0x00000001 0x0000000b
+					0x00000009 0x000000c0 0x00000000 0x00000030
+					0x00000001 0x00000001 0x00000002 0x00000000
+					0x00000001 0x00000007 0x00000008 0x00000008
+					0x00000003 0x00000008 0x00000004 0x00000004
+					0x00000002 0x000000d5 0x00000004 0x00000004
+					0x00000000 0x00000000 0x00004282 0x00780084
+					0x00008000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x00100220 0x0800201c 0x00000000
+					0x77ffc004 0x01f1f008 0x00000000 0x00000007
+					0x08000068 0x08000000 0x00000802 0x00064000
+					0x00000013 0x00090009 0xa0f10000 0x00000000
+					0x00000000 0x80000287 0xe0000000 0xff00ff00 >;
+			};
+
+			timing-102000000 {
+				clock-frequency = <102000000>;
+
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-mode-1 = <0x00010022>;
+				nvidia,emc-mode-2 = <0x00020001>;
+				nvidia,emc-mode-reset = <0x00000000>;
+				nvidia,emc-zcal-cnt-long = <0x0000000a>;
+				nvidia,emc-cfg-dyn-self-ref;
+				nvidia,emc-cfg-periodic-qrst;
+
+				nvidia,emc-configuration =  < 0x00000006
+					0x0000000d 0x00000004 0x00000002 0x00000004
+					0x00000004 0x00000001 0x00000005 0x00000002
+					0x00000002 0x00000001 0x00000001 0x00000000
+					0x00000001 0x00000003 0x00000001 0x0000000b
+					0x00000009 0x00000181 0x00000000 0x00000060
+					0x00000001 0x00000001 0x00000002 0x00000000
+					0x00000001 0x00000007 0x0000000f 0x0000000f
+					0x00000003 0x00000008 0x00000004 0x00000004
+					0x00000002 0x000001a9 0x00000004 0x00000004
+					0x00000000 0x00000000 0x00004282 0x00780084
+					0x00008000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x000fc000 0x000fc000 0x000fc000
+					0x000fc000 0x00100220 0x0800201c 0x00000000
+					0x77ffc004 0x01f1f008 0x00000000 0x00000007
+					0x08000068 0x08000000 0x00000802 0x00064000
+					0x00000025 0x00090009 0xa0f10000 0x00000000
+					0x00000000 0x8000040b 0xe0000000 0xff00ff00 >;
+			};
+
+			timing-204000000 {
+				clock-frequency = <204000000>;
+
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-mode-1 = <0x00010042>;
+				nvidia,emc-mode-2 = <0x00020001>;
+				nvidia,emc-mode-reset = <0x00000000>;
+				nvidia,emc-zcal-cnt-long = <0x00000013>;
+				nvidia,emc-cfg-dyn-self-ref;
+				nvidia,emc-cfg-periodic-qrst;
+
+				nvidia,emc-configuration =  < 0x0000000c
+					0x0000001a 0x00000008 0x00000003 0x00000005
+					0x00000004 0x00000001 0x00000006 0x00000003
+					0x00000003 0x00000002 0x00000002 0x00000000
+					0x00000001 0x00000003 0x00000001 0x0000000c
+					0x0000000a 0x00000303 0x00000000 0x000000c0
+					0x00000001 0x00000001 0x00000003 0x00000000
+					0x00000001 0x00000007 0x0000001d 0x0000001d
+					0x00000004 0x0000000b 0x00000005 0x00000004
+					0x00000002 0x00000351 0x00000004 0x00000006
+					0x00000000 0x00000000 0x00004282 0x00440084
+					0x00008000 0x00060000 0x00060000 0x00060000
+					0x00060000 0x00072000 0x00072000 0x00072000
+					0x00072000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x000d0000 0x000d0000 0x000d0000
+					0x000d0000 0x000e0220 0x0800201c 0x00000000
+					0x77ffc004 0x01f1f008 0x00000000 0x00000007
+					0x08000068 0x08000000 0x00000802 0x00064000
+					0x0000004a 0x00090009 0xa0f10000 0x00000000
+					0x00000000 0x80000713 0xe0000000 0xff00ff00 >;
+			};
+
+			timing-500000000 {
+				clock-frequency = <500000000>;
+
+				nvidia,emc-auto-cal-interval = <0x001fffff>;
+				nvidia,emc-mode-1 = <0x000100c2>;
+				nvidia,emc-mode-2 = <0x00020005>;
+				nvidia,emc-mode-reset = <0x00000000>;
+				nvidia,emc-zcal-cnt-long = <0x0000002d>;
+				nvidia,emc-cfg-periodic-qrst;
+
+				nvidia,emc-configuration =  < 0x0000001d
+					0x00000040 0x00000014 0x00000008 0x00000007
+					0x00000009 0x00000003 0x0000000d 0x00000008
+					0x00000008 0x00000004 0x00000002 0x00000000
+					0x00000004 0x00000008 0x00000005 0x0000000d
+					0x0000000f 0x00000763 0x00000000 0x000001d8
+					0x00000003 0x00000003 0x00000008 0x00000000
+					0x00000001 0x0000000e 0x00000046 0x00000046
+					0x00000008 0x00000019 0x0000000b 0x00000004
+					0x00000002 0x00000820 0x00000000 0x00000006
+					0x00000000 0x00000000 0x00006282 0xf0140091
+					0x00008000 0x00000008 0x00000008 0x00000008
+					0x00000008 0x0000000a 0x0000000a 0x0000000a
+					0x0000000a 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000
+					0x00000000 0x0000000c 0x0000000c 0x0000000c
+					0x0000000c 0x00080220 0x0800003d 0x00000000
+					0x77ffc004 0x01f1f408 0x00000000 0x00000007
+					0x08000068 0x08000000 0x00000802 0x00064000
+					0x000000b4 0x000d000d 0xa0f10404 0x00000000
+					0x00000000 0x80000fde 0xe0000000 0xff00ff88 >;
+			};
+		};
+	};
+};
+
+&emc_icc_dvfs_opp_table {
+	/delete-node/ opp-533000000-1200;
+	/delete-node/ opp-625000000-1200;
+	/delete-node/ opp-625000000-1250;
+	/delete-node/ opp-667000000-1200;
+	/delete-node/ opp-750000000-1300;
+	/delete-node/ opp-800000000-1300;
+	/delete-node/ opp-900000000-1350;
+};
+
+&emc_bw_dfs_opp_table {
+	/delete-node/ opp-533000000;
+	/delete-node/ opp-625000000;
+	/delete-node/ opp-667000000;
+	/delete-node/ opp-750000000;
+	/delete-node/ opp-800000000;
+	/delete-node/ opp-900000000;
+};
-- 
2.33.1


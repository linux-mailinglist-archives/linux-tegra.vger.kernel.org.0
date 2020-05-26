Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80E091D4042
	for <lists+linux-tegra@lfdr.de>; Thu, 14 May 2020 23:38:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726216AbgENViZ (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 14 May 2020 17:38:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728294AbgENViP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 14 May 2020 17:38:15 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFAE6C061A0F;
        Thu, 14 May 2020 14:38:14 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id d22so34118lfm.11;
        Thu, 14 May 2020 14:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9duifyysftuOHq6stxeBoXSaEQaPvw17HHZ03swcqDE=;
        b=fBau2OD0mzwKU72E/DaiysO+anuWU2UQmlURJvMa/aaK+fTvYaBkdkL4hG3e/Sla62
         AqPoLaUI4l5hTm+LAFMYieqo1jdPgsf8rylZKmQhy56d/Il9EA4YkjmA8A/N1qLRIHWl
         sLxAp++sXGxJ7SBZm4WVkmkUS4GoCSQLRuWSlqPYQBxIMolRSfq+Ari1WSjwE0+tfup+
         mY10MI89vosbz+UT2BXWco6p9nxlz3YcizgU3edrWdDsagQF4FzZzcMQNJBmJeIuoZ26
         RflEymG9ztc2X7cvbrdywk1IXHBVFLnBm+EDmmUxYwOV8D7AzFY4ji8ILxaWDAfrdZCm
         Pd+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9duifyysftuOHq6stxeBoXSaEQaPvw17HHZ03swcqDE=;
        b=UivHKx6sEn1ZMFNtA0ICp+T4H6x4C+zQ9YRjEi9MmjJf+Es7Zy4B7xmszdG9XTJwKB
         76+wUBL03u2zADBeIVx7BMRlOCLTxlyHIc5xqurnQG3ofpYzVZ3bVz6KwvV53LPr8JPk
         rStut3dB9OlLOUFMfrq0SCh02521Ekx7e8Ch2iBVXAXPKMONCeKhy7j2kGIF8Yz2T6mn
         NKBnALvm0gxZSmrvFw7Ecdv1YlV/rCYDXvKMFUsCsTb8TxclQFl3VhcqMPk/glxglKTF
         dHddM+B2ITfKIQK+DVgWVEfEN/SRYZGhCxEre5yIlGHTXpwTJqb/qCwbwq4eLHV5BQI6
         hnyg==
X-Gm-Message-State: AOAM532v0QNXI5TZv3ZvWSMz7ggin1fPL9vGVMhLcSVmmXNIgdqrsS8d
        vxs2/2vG1RzJG9MpzUCSkWI01qUz
X-Google-Smtp-Source: ABdhPJy6znsW1ZvASd5RA8laYzzv2xVn9kNqUvPX13KA1J9uRKVFyAAqEtXK8ISPFdbJktsRWuXG4g==
X-Received: by 2002:a19:d55:: with SMTP id 82mr123265lfn.89.1589492293484;
        Thu, 14 May 2020 14:38:13 -0700 (PDT)
Received: from localhost.localdomain (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.gmail.com with ESMTPSA id a12sm63628ljj.64.2020.05.14.14.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 14:38:13 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        David Heidelberg <david@ixit.cz>,
        Peter Geis <pgwipeout@gmail.com>,
        Stephen Warren <swarren@wwwdotorg.org>,
        Nicolas Chauvet <kwizart@gmail.com>,
        =?UTF-8?q?Pedro=20=C3=82ngelo?= <pangelo@void.io>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Zack Pearsall <zpearsall@yahoo.com>
Cc:     linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v8 6/6] ARM: tegra_defconfig: Enable options useful for Nexus 7 and Acer A500
Date:   Fri, 15 May 2020 00:36:54 +0300
Message-Id: <20200514213654.12834-7-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200514213654.12834-1-digetx@gmail.com>
References: <20200514213654.12834-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Enable several very useful options and drivers for hardware that is found
on Nexus 7 and Acer A500 tablet devices. Please note that some drivers may
require firmware files extracted from original Android image.

Link: https://github.com/digetx/linux-firmware
Link: https://github.com/digetx/alsa-ucm-conf
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/configs/tegra_defconfig | 42 ++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_defconfig
index 0029259a6bf5..b382f06f835b 100644
--- a/arch/arm/configs/tegra_defconfig
+++ b/arch/arm/configs/tegra_defconfig
@@ -10,6 +10,8 @@ CONFIG_RT_GROUP_SCHED=y
 CONFIG_CGROUP_FREEZER=y
 CONFIG_CGROUP_CPUACCT=y
 CONFIG_CGROUP_DEBUG=y
+CONFIG_NAMESPACES=y
+CONFIG_USER_NS=y
 CONFIG_BLK_DEV_INITRD=y
 # CONFIG_ELF_CORE is not set
 CONFIG_EMBEDDED=y
@@ -18,6 +20,7 @@ CONFIG_SLAB=y
 CONFIG_ARCH_TEGRA=y
 CONFIG_SMP=y
 CONFIG_HIGHMEM=y
+CONFIG_SECCOMP=y
 CONFIG_ZBOOT_ROM_TEXT=0x0
 CONFIG_ZBOOT_ROM_BSS=0x0
 CONFIG_KEXEC=y
@@ -63,11 +66,17 @@ CONFIG_BT_RFCOMM=y
 CONFIG_BT_BNEP=y
 CONFIG_BT_HIDP=y
 CONFIG_BT_HCIBTUSB=m
+CONFIG_BT_HCIUART=y
+CONFIG_BT_HCIUART_BCM=y
 CONFIG_CFG80211=y
 CONFIG_MAC80211=y
 CONFIG_RFKILL=y
 CONFIG_RFKILL_INPUT=y
 CONFIG_RFKILL_GPIO=y
+CONFIG_NFC=y
+CONFIG_NFC_HCI=y
+CONFIG_NFC_SHDLC=y
+CONFIG_NFC_PN544_I2C=y
 CONFIG_PCI=y
 CONFIG_PCIEPORTBUS=y
 CONFIG_PCI_MSI=y
@@ -106,20 +115,24 @@ CONFIG_INPUT_JOYDEV=y
 CONFIG_INPUT_EVDEV=y
 CONFIG_KEYBOARD_GPIO=y
 CONFIG_KEYBOARD_TEGRA=y
+CONFIG_KEYBOARD_CAP11XX=y
 CONFIG_KEYBOARD_CROS_EC=y
 CONFIG_MOUSE_PS2_ELANTECH=y
 CONFIG_INPUT_TOUCHSCREEN=y
 CONFIG_TOUCHSCREEN_ATMEL_MXT=y
+CONFIG_TOUCHSCREEN_ELAN=y
 CONFIG_TOUCHSCREEN_WM97XX=y
 # CONFIG_TOUCHSCREEN_WM9705 is not set
 # CONFIG_TOUCHSCREEN_WM9713 is not set
 CONFIG_TOUCHSCREEN_STMPE=y
 CONFIG_INPUT_MISC=y
+CONFIG_INPUT_GPIO_VIBRA=y
 # CONFIG_LEGACY_PTYS is not set
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_OF_PLATFORM=y
 CONFIG_SERIAL_TEGRA=y
+CONFIG_SERIAL_DEV_BUS=y
 # CONFIG_HW_RANDOM is not set
 # CONFIG_I2C_COMPAT is not set
 CONFIG_I2C_CHARDEV=y
@@ -131,10 +144,12 @@ CONFIG_SPI_TEGRA114=y
 CONFIG_SPI_TEGRA20_SFLASH=y
 CONFIG_SPI_TEGRA20_SLINK=y
 CONFIG_PINCTRL_AS3722=y
+CONFIG_PINCTRL_MAX77620=y
 CONFIG_PINCTRL_PALMAS=y
 CONFIG_GPIO_SYSFS=y
 CONFIG_GPIO_PCA953X=y
 CONFIG_GPIO_PCA953X_IRQ=y
+CONFIG_GPIO_MAX77620=y
 CONFIG_GPIO_PALMAS=y
 CONFIG_GPIO_TPS6586X=y
 CONFIG_GPIO_TPS65910=y
@@ -142,13 +157,21 @@ CONFIG_POWER_RESET=y
 CONFIG_POWER_RESET_AS3722=y
 CONFIG_POWER_RESET_GPIO=y
 CONFIG_BATTERY_SBS=y
+CONFIG_BATTERY_BQ27XXX=y
+CONFIG_CHARGER_GPIO=y
+CONFIG_CHARGER_SMB347=y
 CONFIG_CHARGER_TPS65090=y
 CONFIG_SENSORS_LM90=y
 CONFIG_SENSORS_LM95245=y
+CONFIG_THERMAL=y
+CONFIG_THERMAL_STATISTICS=y
+CONFIG_CPU_THERMAL=y
 CONFIG_WATCHDOG=y
+CONFIG_MAX77620_WATCHDOG=y
 CONFIG_TEGRA_WATCHDOG=y
 CONFIG_MFD_AS3722=y
 CONFIG_MFD_CROS_EC=y
+CONFIG_MFD_MAX77620=y
 CONFIG_MFD_MAX8907=y
 CONFIG_MFD_STMPE=y
 CONFIG_MFD_PALMAS=y
@@ -159,6 +182,7 @@ CONFIG_REGULATOR=y
 CONFIG_REGULATOR_FIXED_VOLTAGE=y
 CONFIG_REGULATOR_AS3722=y
 CONFIG_REGULATOR_GPIO=y
+CONFIG_REGULATOR_MAX77620=y
 CONFIG_REGULATOR_MAX8907=y
 CONFIG_REGULATOR_PALMAS=y
 CONFIG_REGULATOR_TPS51632=y
@@ -174,7 +198,10 @@ CONFIG_USB_GSPCA=y
 CONFIG_DRM=y
 CONFIG_DRM_NOUVEAU=m
 CONFIG_DRM_TEGRA=y
+CONFIG_DRM_TEGRA_STAGING=y
+CONFIG_DRM_PANEL_LVDS=y
 CONFIG_DRM_PANEL_SIMPLE=y
+CONFIG_DRM_LVDS_CODEC=y
 # CONFIG_LCD_CLASS_DEVICE is not set
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
 # CONFIG_BACKLIGHT_GENERIC is not set
@@ -238,6 +265,7 @@ CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_AS3722=y
 CONFIG_RTC_DRV_DS1307=y
 CONFIG_RTC_DRV_MAX8907=y
+CONFIG_RTC_DRV_MAX77686=y
 CONFIG_RTC_DRV_PALMAS=y
 CONFIG_RTC_DRV_TPS6586X=y
 CONFIG_RTC_DRV_TPS65910=y
@@ -259,11 +287,18 @@ CONFIG_ARCH_TEGRA_2x_SOC=y
 CONFIG_ARCH_TEGRA_3x_SOC=y
 CONFIG_ARCH_TEGRA_114_SOC=y
 CONFIG_ARCH_TEGRA_124_SOC=y
+CONFIG_PM_DEVFREQ=y
+CONFIG_ARM_TEGRA_DEVFREQ=y
+CONFIG_ARM_TEGRA20_DEVFREQ=y
 CONFIG_MEMORY=y
 CONFIG_IIO=y
+CONFIG_KXCJK1013=y
 CONFIG_MPU3050_I2C=y
+CONFIG_INV_MPU6050_I2C=y
+CONFIG_AL3010=y
 CONFIG_SENSORS_ISL29018=y
 CONFIG_SENSORS_ISL29028=y
+CONFIG_AK8974=y
 CONFIG_AK8975=y
 CONFIG_PWM=y
 CONFIG_PWM_TEGRA=y
@@ -283,6 +318,13 @@ CONFIG_TMPFS_POSIX_ACL=y
 CONFIG_SQUASHFS=y
 CONFIG_SQUASHFS_LZO=y
 CONFIG_SQUASHFS_XZ=y
+CONFIG_PSTORE=y
+CONFIG_PSTORE_LZO_COMPRESS=y
+CONFIG_PSTORE_LZ4_COMPRESS=y
+CONFIG_PSTORE_LZ4HC_COMPRESS=y
+CONFIG_PSTORE_842_COMPRESS=y
+CONFIG_PSTORE_CONSOLE=y
+CONFIG_PSTORE_RAM=y
 CONFIG_NFS_FS=y
 CONFIG_NFS_V4=y
 CONFIG_ROOT_NFS=y
-- 
2.26.0


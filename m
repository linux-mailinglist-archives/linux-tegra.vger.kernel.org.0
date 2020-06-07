Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 646771F0C7C
	for <lists+linux-tegra@lfdr.de>; Sun,  7 Jun 2020 17:43:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726683AbgFGPnp (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 7 Jun 2020 11:43:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726595AbgFGPno (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 7 Jun 2020 11:43:44 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C83EC08C5C3;
        Sun,  7 Jun 2020 08:43:44 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id 82so8683622lfh.2;
        Sun, 07 Jun 2020 08:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yf0dEFF4gM5Mo+qgJBi/+O4Rqtdvpn0aIjyyfWdfUss=;
        b=rdzL/B/NTFMDcIyE9x46i8/VP8ZDtvuQnZzv/NqEyasF4oS+AQhHpkYn79LedVrjjC
         15yA0ihyRuJEmtMbMxZp1kt19pW8LhQABL+en/a9rXu/TbQlPISORQcSVizV5D5KcbOW
         CEOfG9UbPhUFt9zruPyPMcrbWVSnGI83ynIKo1HoQC/1jnGL3bXAWpTu2R99QU3NBiLr
         lARgTlQbWIXW8GlNuhFGHbcDHRu1HJUejsAOU2HW9DmzScflzF3Vy8aYjWoDISH6lsCm
         SyECbnyD3n0m543Dou54ALQdeXoaCqa3cQ/Y+r2nZBntXyDzFaTqnRtbcjWklK5AFL/I
         p0mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yf0dEFF4gM5Mo+qgJBi/+O4Rqtdvpn0aIjyyfWdfUss=;
        b=n8epqCWJ/pP70IztNx2vW/PN7sgYfCJMtGpSbPlu8NOX4BDeNoNzG/ME4QyixuHvrz
         libQIbmiOUmgtbP5P0l+AGIswkRRamz3AqPg5xZZ3K5pfTZGjA5JB0feoRrH28GxSe1Q
         vi45K1YbrkaYweRQp0mJrdCLssSS9fXHsg2t0o5KAoqJM4zzq/hqfwkgcAznokfm1zSJ
         QG+4u4bo0OVI4C6tyOkhw7ZJTdEwHZJ7Eib54F+sm5FxpItgsoMPCuYUHPSZIo6kO/tz
         3ybNof0gQwytsX7qRnx1sU5GgeLfdiiVrVsbtUB4OVOdrsrIUsM+BtjGxqaj5SQBzfDN
         u+RA==
X-Gm-Message-State: AOAM531RoRCjxlPbVFYg1ajgdJqZqSdqMtu8cIDKnSMihMHc2jJ2J6/a
        GIAFnbQU4lXL9pJJjKj2RfjAJuDI
X-Google-Smtp-Source: ABdhPJzUFS4Eb6QJjqYM34BQpqAHEVGYG+dflN+FllMgiuCmXhJcw89AsXRT7c9Xq71ZT+TpfeU01w==
X-Received: by 2002:ac2:54b4:: with SMTP id w20mr10350572lfk.48.1591544622724;
        Sun, 07 Jun 2020 08:43:42 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru. [79.139.237.54])
        by smtp.gmail.com with ESMTPSA id a7sm3592234lfm.4.2020.06.07.08.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2020 08:43:41 -0700 (PDT)
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
Subject: [PATCH v9 0/6] Support NVIDIA Tegra-based Acer A500 and Nexus 7 devices
Date:   Sun,  7 Jun 2020 18:43:21 +0300
Message-Id: <20200607154327.18589-1-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hello,

This series introduces upstream kernel support for Acer Iconia Tab A500
and ASUS Google Nexus 7 tablet devices. Please review and apply, thanks
in advance.

Changelog:

v9: - Nexus 7 memory timings are moved out to a separate dtsi file to ease
      reviewing of the device-trees since the sparse definition of the timings
      within multiple DT files created some unnecessary confusion.
      Thanks to Michał Mirosław for the suggestion.

v8: - The eMMC voltage regulator is now marked as always-ON in all
      device-trees because turned out that some bootloader versions have
      assumption about the enabled regulator at a boot time. This fixes
      machine hanging on a warm reboot, it's also matching the downstream
      kernel regulator configuration.

    - The core regulator of the Ti PMIC Nexus 7 variant is now limited
      to a 1.35V, which is a more realistic limit than 1.5V that was borrowed
      from the Cardhu device-tree. Now both Maxim and Ti variants have the
      common limits.

    - Added acks from Rob Herring.

v7: - This version brings support for a Nexus 7 variant that uses Ti PMIC
      instead of the Maxim PMIC. Previously we assumed that variant with
      the Ti PMIC doesn't exist in a wild, but turned out that it was a
      wrong assumption. In a result the device-trees are separated into
      more DTSI pieces, which combined together form the final device-tree.
      Thanks to Zack Pearsall for testing the Ti version!

    - The camera voltage regulator is now preset to a correct 1.8v in the
      Nexus 7 device-tree.

v6: - Corrected PMIC's RTC alias in the DTs. Sometime ago I renamed the
      PMIC's node to match the modern upstream styling, but forgot to change
      the RTC alias. Now PMIC RTC alias uses node's handle instead of string.

    - Removed "panel: " handle from device trees, which became unused after
      v5 and I just missed to remove it.

v5: - After spending some more time on adding LVDS encoder bridge support
      to the Tegra DRM driver, I'm now having a second thought and agree
      with Thierry Reding that in a longer run it should be better not to
      mix old nvidia,panel with new output graph in device-tree. So the
      nvidia,panel phandle is removed now in both A500 and Nexus 7 DTs.

v4: - Corrected CPU's thermal zone on both A500 and Nexus 7, which
      should use the remote thermal sensor (Tegra chip) instead of the
      local ("skin" temperature).

    - Added default PMIC pinmux state on Nexus 7, for completeness.

    - Added PMIC cpu_pwr_req GPIO hog on Nexus 7, for completeness.

    - Renamed thermal sensor node label to NCT72 on Nexus 7 to match the
      actual hardware (NCT72 is compatible with NCT1008). For completeness.

    - Added always-on USB AVDD regulator on Nexus 7, which is controlled by
      the PMIC GPIO. For completeness.

    - Added PMIC GPIO enable-control to the 3v3_sys regulator on Nexus 7,
      for completeness.

    - Added CONFIG_NAMESPACES, CONFIG_USER_NS, CONFIG_SECCOMP and
      CONFIG_PINCTRL_MAX77620 to the tegra_defconfig. The first three
      options are must-have for the modern userspace, the last is somewhat
      actual now since the default PMIC pinmux state is added to the N7 DT.

v3: - Improved device-tree node-names in accordance to review comments that
      were made by Thierry Reding to v2.

    - Corrected LVDS encoder powerdown-GPIO polarity on both A500 and Nexus 7
      because I implemented the DRM bridges support in the Tegra DRM driver
      and found that there was a mistake in the device-trees. The updated
      polarity also matches the boards schematics. Now DRM bridges support
      becomes mandatory since LVDS is getting disabled during of the encoder
      driver probing. I'll send the DRM patch separately from this series.

    - Replaced recently deprecated CONFIG_DRM_LVDS_ENCODER with the new
      CONFIG_DRM_LVDS_CODEC in tegra_defconfig.

    - Added more config options to tegra_defconfig, like pstore and thermal.

    - Added atmel,cfg_name to the A500 DT, which is a new upcoming property
      in 5.8+ that allows to specify the per-board hardware config file name.

v2: - Corrected "volume down" key-label in the grouper's device-tree and
      improved some other names in device-trees.

    - Added optional (upcoming in 5.8+) VDD/AVDD regulators to the touchscreen
      node in A500 device-tree.

Dmitry Osipenko (6):
  ARM: tegra: Add device-tree for Acer Iconia Tab A500
  ARM: tegra: Add device-tree for ASUS Google Nexus 7
  dt-bindings: Add vendor prefix for Acer Inc.
  dt-bindings: ARM: tegra: Add Acer Iconia Tab A500
  dt-bindings: ARM: tegra: Add ASUS Google Nexus 7
  ARM: tegra_defconfig: Enable options useful for Nexus 7 and Acer A500

 .../devicetree/bindings/arm/tegra.yaml        |   10 +
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 arch/arm/boot/dts/Makefile                    |    4 +
 .../boot/dts/tegra20-acer-a500-picasso.dts    | 1458 +++++++++++++++
 .../dts/tegra30-asus-nexus7-grouper-E1565.dts |    9 +
 .../dts/tegra30-asus-nexus7-grouper-PM269.dts |    9 +
 .../tegra30-asus-nexus7-grouper-common.dtsi   | 1249 +++++++++++++
 ...egra30-asus-nexus7-grouper-maxim-pmic.dtsi |  188 ++
 ...30-asus-nexus7-grouper-memory-timings.dtsi | 1565 +++++++++++++++++
 .../tegra30-asus-nexus7-grouper-ti-pmic.dtsi  |  151 ++
 .../boot/dts/tegra30-asus-nexus7-grouper.dtsi |  149 ++
 .../dts/tegra30-asus-nexus7-tilapia-E1565.dts |    9 +
 ...30-asus-nexus7-tilapia-memory-timings.dtsi |  325 ++++
 .../boot/dts/tegra30-asus-nexus7-tilapia.dtsi |  235 +++
 arch/arm/configs/tegra_defconfig              |   42 +
 15 files changed, 5405 insertions(+)
 create mode 100644 arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
 create mode 100644 arch/arm/boot/dts/tegra30-asus-nexus7-grouper-E1565.dts
 create mode 100644 arch/arm/boot/dts/tegra30-asus-nexus7-grouper-PM269.dts
 create mode 100644 arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
 create mode 100644 arch/arm/boot/dts/tegra30-asus-nexus7-grouper-maxim-pmic.dtsi
 create mode 100644 arch/arm/boot/dts/tegra30-asus-nexus7-grouper-memory-timings.dtsi
 create mode 100644 arch/arm/boot/dts/tegra30-asus-nexus7-grouper-ti-pmic.dtsi
 create mode 100644 arch/arm/boot/dts/tegra30-asus-nexus7-grouper.dtsi
 create mode 100644 arch/arm/boot/dts/tegra30-asus-nexus7-tilapia-E1565.dts
 create mode 100644 arch/arm/boot/dts/tegra30-asus-nexus7-tilapia-memory-timings.dtsi
 create mode 100644 arch/arm/boot/dts/tegra30-asus-nexus7-tilapia.dtsi

-- 
2.26.0


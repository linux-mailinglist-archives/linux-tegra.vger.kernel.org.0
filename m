Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8215F224061
	for <lists+linux-tegra@lfdr.de>; Fri, 17 Jul 2020 18:14:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726798AbgGQQNT (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 17 Jul 2020 12:13:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727858AbgGQQNS (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 17 Jul 2020 12:13:18 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C9B8C0619D2
        for <linux-tegra@vger.kernel.org>; Fri, 17 Jul 2020 09:13:18 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id g20so8144396edm.4
        for <linux-tegra@vger.kernel.org>; Fri, 17 Jul 2020 09:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7h4gsXGMOxrqCi+GYe022LD+RXp27DxUtOtRLuYj4kA=;
        b=CsIrej6Ehi2Va70CGC1IEx1LpfrZl1V1cx4ynrNCzxsoldOd6y0U4EZErClj3fA6zZ
         K/D6DfcmMPaA+7nuJyrKloVJ3ymqIpA/bmjaaxE/feIaDeW+Rw5TYfQ/3Vxh/caV33WN
         tLrVnG7Qyn+iIShbGqaJzc/b0pig1Sw2dGF2EacY+2XUa/cR8DG+QfHBPv43WdHSLYIa
         LXkUanyC8xL6eaPP7r/iZi3/Fzs3MPQfnNStG50b27ZvDKP3Cl/v8FXnnvnZl/JFdqwc
         pgNIjyDgjNS4U233qh7v/Q/kY8LXQAyRehbw8jgzyUkdXwTPatBbXaotUFpCsi0Jl4Qu
         zKrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7h4gsXGMOxrqCi+GYe022LD+RXp27DxUtOtRLuYj4kA=;
        b=MZEy/ZHO+mIUwHyi1vF5lCFo9D9UsbwxfA4+aL4ntP9eCDMtAmUaT+BpNVp0FPG/ic
         796o5XIH3DsHT191R8KW/eBZxyCH5xXXdp3FWE9fiDaDcBt+OEaeBkvpgJ8jMhmUedl5
         Ov2bCDxsgk2DbIQXFabKgW7nP6ytKxfrdK29pCuL7nLWL9/mFpbOcy2QgshP5yrBl6WU
         n0hkfUuIbM7IxYDliqd8xV2VbwfLv9d+h1Bc4jGVRv+6NgjT8zy7scHmQoWpwgPwiqbR
         eNZKMWbhkSgNia6V5RTwimzbDUus61n+w0u5ND70J+owyoQKNnP5TK6EXwR3kiECZC6D
         JRLw==
X-Gm-Message-State: AOAM531Ag+Ye5hiNjcg8pmLuT4rytlIi2Otm5QeC9UKy8tUT4F4Zm8mr
        IYtlRMKY/aMoRwpbXKd/ZTw=
X-Google-Smtp-Source: ABdhPJzLYizkqkFySZysCNdfVJvbPowe5rQ68SKcyRsiDtbV9IUdb3Lm8JxhEmlWmumtPgFclnID9A==
X-Received: by 2002:a05:6402:b84:: with SMTP id cf4mr9661986edb.21.1595002397158;
        Fri, 17 Jul 2020 09:13:17 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id b14sm8160792ejg.18.2020.07.17.09.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 09:13:15 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 7/7] arm64: tegra: Device tree changes for v5.9-rc1
Date:   Fri, 17 Jul 2020 18:13:00 +0200
Message-Id: <20200717161300.1661002-7-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200717161300.1661002-1-thierry.reding@gmail.com>
References: <20200717161300.1661002-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c7407:

  Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.9-arm64-dt

for you to fetch changes up to 0f134e39ae651ff3b77c44de387ee1c49d63e99b:

  arm64: tegra: Add the GPU on Tegra194 (2020-07-17 16:14:17 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree changes for v5.9-rc1

This contains a slew of fixes in preparation for validating device trees
against json-schema bindings. In addition, this enables the CPU complex
(for CPU frequency scaling) and GPU on Tegra194.

----------------------------------------------------------------
Jon Hunter (3):
      arm64: tegra: Add support for Jetson Xavier NX
      arm64: tegra: Enable DFLL support on Jetson Nano
      arm64: tegra: Populate VBUS for USB3 on Jetson TX2

Sowjanya Komatineni (3):
      arm64: tegra: jetson-tx1: Add camera supplies
      arm64: tegra: Enable Tegra VI CSI support for Jetson Nano
      arm64: tegra: Add missing clocks and power-domains to Tegra210 VI I2C

Sumit Gupta (1):
      arm64: tegra: Add compatible string for Tegra194 CPU complex

Thierry Reding (48):
      arm64: tegra: Add missing #phy-cells property on Jetson TX2
      arm64: tegra: Add missing #phy-cells property on Jetson AGX Xavier
      arm64: tegra: Fix #address-cells/#size-cells for SRAM on Tegra186
      arm64: tegra: Use standard notation for interrupts
      arm64: tegra: Remove extra compatible for Tegra194 SDHCI
      arm64: tegra: Remove extra compatible for Tegra210 SDHCI
      arm64: tegra: Describe interconnect paths on Tegra186
      arm64: tegra: Describe interconnect paths on Tegra194
      arm64: tegra: Add interrupt for Tegra194 memory controller
      arm64: tegra: Add Tegra132 compatible string for host1x
      arm64: tegra: Add interrupt-names for host1x
      arm64: tegra: Remove parent clock from display controllers
      arm64: tegra: Fixup I/O and PLL supply names for HDMI/DP
      arm64: tegra: Add unit-address to memory node
      arm64: tegra: Rename sdhci nodes to mmc
      arm64: tegra: Enable XUSB on Norrin
      arm64: tegra: Remove undocumented battery-name property
      arm64: tegra: Remove simple clocks bus
      arm64: tegra: Remove simple regulators bus
      arm64: tegra: norrin: Add missing panel power supply
      arm64: tegra: Use proper tuple notation
      arm64: tegra: Do not mark host1x as simple bus
      arm64: tegra: Use sor0_out clock on Tegra132
      arm64: tegra: Tegra132 EMC is not compatible with Tegra124
      arm64: tegra: Add missing #phy-cells property to USB PHYs
      arm64: tegra: Remove unneeded power supplies
      arm64: tegra: Update USB connector nodes
      arm64: tegra: Use standard EEPROM properties
      arm64: tegra: Remove XUSB pad controller interrupt from XUSB node
      arm64: tegra: Fix {clock,reset}-names ordering
      arm64: tegra: Do not mark display hub as simple bus
      arm64: tegra: Use standard names for SRAM nodes
      arm64: tegra: Remove unused interrupts from Tegra194 AON GPIO
      arm64: tegra: Fix indentation in Tegra132 device tree
      arm64: tegra: Fix indentation in Tegra194 device tree
      arm64: tegra: Rename agic -> interrupt-controller
      arm64: tegra: Various fixes for PMICs
      arm64: tegra: Sort nodes by unit-address on Jetson Nano
      arm64: tegra: Rename cbb@0 to bus@0 on Tegra194
      arm64: tegra: Fix order of XUSB controller clocks
      arm64: tegra: Remove spurious tabs
      arm64: tegra: Sort aliases alphabetically
      arm64: tegra: Add i2c-bus subnode for DPAUX controllers
      arm64: tegra: Fix compatible string for DPAUX on Tegra210
      arm64: tegra: Add clocks and resets for ISP on Tegra210
      arm64: tegra: Add #{address,size}-cells for VI I2C on Tegra210
      arm64: tegra: Add HDMI supplies on Norrin
      arm64: tegra: Add the GPU on Tegra194

Vidya Sagar (1):
      arm64: tegra: Re-order PCIe aperture mappings

 arch/arm64/boot/dts/nvidia/Makefile                |   1 +
 arch/arm64/boot/dts/nvidia/tegra132-norrin.dts     | 399 +++++++++++---------
 arch/arm64/boot/dts/nvidia/tegra132.dtsi           | 205 ++++++++--
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 111 +++---
 arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi     |  80 ++--
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           | 124 ++++--
 arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi     | 125 +++----
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts |  16 +-
 .../dts/nvidia/tegra194-p3509-0000+p3668-0000.dts  | 331 ++++++++++++++++
 .../arm64/boot/dts/nvidia/tegra194-p3668-0000.dtsi | 290 +++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           | 280 +++++++++-----
 arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi     |  46 +--
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts |   6 +-
 arch/arm64/boot/dts/nvidia/tegra210-p2530.dtsi     |  19 +-
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     | 330 ++++++++--------
 arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi     | 414 ++++++++++-----------
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 277 ++++++++------
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts      | 171 ++++-----
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |  72 ++--
 19 files changed, 2107 insertions(+), 1190 deletions(-)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0000.dts
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra194-p3668-0000.dtsi

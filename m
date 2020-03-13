Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE7D2184D1B
	for <lists+linux-tegra@lfdr.de>; Fri, 13 Mar 2020 17:59:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbgCMQ7M (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 13 Mar 2020 12:59:12 -0400
Received: from mail-wr1-f46.google.com ([209.85.221.46]:36159 "EHLO
        mail-wr1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726533AbgCMQ7M (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 13 Mar 2020 12:59:12 -0400
Received: by mail-wr1-f46.google.com with SMTP id s5so13064247wrg.3
        for <linux-tegra@vger.kernel.org>; Fri, 13 Mar 2020 09:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y7E/7I3UwnoYO4kboIxPPunVUq6lzAu3iTHHuSklZrw=;
        b=hg9jxfVBhWx9OFfJIBsDeZGL8xTFUmDYN4ffVvtSmy1Xq/kAZqoWXPIoiTtUgChgee
         2qPUhSCrZAtIcbZehU5jH4TZojxHtisu9hS7qVs6LK8c5GOapg7QPRc4NIvTRGPnDIoh
         u0W6zSGv3De1+qjxPUkABOfvFd/K4JcOnvYnLOpIFmuGKSo+7tsd7l7OdDlHA0upmG8H
         BDmzlVz5LNlgrNWaI9a/Qg6m2bV54IVUm3U5Ly6GeNDe+djG936PhDqjWnIYaP9u+IsJ
         4O3LbRDJVMy5/DvG76ihrEkg1KHIwnuU1PdEgoQXKa3NTkAs1gBdehfWiUwmE4WFC1s7
         FadQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y7E/7I3UwnoYO4kboIxPPunVUq6lzAu3iTHHuSklZrw=;
        b=hOqDaRXBE5D9Y2HLR9uKGm3FN1Y7sDCIeOvF2we3uXLuyfLXfEpz2FLpj2YY0qhrzU
         2o1L462+3+aem+BTsHCYNe2orEaIMI4ENdTxTVCMWoffGX0t3uyrzyVXMJh6zsGfh80T
         MSSyNi6C0GlBbXtnM9hQwVz9NiSqo1sNwbdr0neMq3rculsPIpIHm0FP/+w6QX9euExh
         vqfDRGiyqFUB1RxNt473yzyO0nvlbBjIZsc0tuK1ObRaJzZcPm6zak1OmmwHqv9I7mSn
         xCx+8F1ZKsk22m8ML+MJNepBnXCq+FC6Xr6tP3cealXgqaEF/+Dx8gKXoCpdFgEgiFou
         S4/g==
X-Gm-Message-State: ANhLgQ37XnFejSkPtOM+h09Bioao/hkRx4kU2lZE8ivw/PCgG2y3Wd8v
        6XgwqGuQrllfK2VyJqjHslc=
X-Google-Smtp-Source: ADFU+vssbO4TufJR7WDKRLhsy6jm8DZzzwhkYunqFuhHpdXgYbkPqO4pibw89cfm5vrGAhM2E2R4Sw==
X-Received: by 2002:adf:ec88:: with SMTP id z8mr3131265wrn.61.1584118749224;
        Fri, 13 Mar 2020 09:59:09 -0700 (PDT)
Received: from localhost (pD9E516A9.dip0.t-ipconnect.de. [217.229.22.169])
        by smtp.gmail.com with ESMTPSA id s13sm28875891wrw.29.2020.03.13.09.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2020 09:59:08 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 08/10] arm64: tegra: Device tree changes for v5.7-rc1
Date:   Fri, 13 Mar 2020 17:58:46 +0100
Message-Id: <20200313165848.2915133-8-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200313165848.2915133-1-thierry.reding@gmail.com>
References: <20200313165848.2915133-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:

  Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.7-arm64-dt

for you to fetch changes up to 84eaaf7500036f292f5563b39a983c492d5b12ae:

  arm64: tegra: Add support for PCIe endpoint mode in P2972-0000 platform (2020-03-12 12:14:31 +0100)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree changes for v5.7-rc1

These changes add support for the XUSB pad controller, as well as the
XUSB controller on Tegra194. Furthermore, USB device mode is supported
across Tegra210 and Tegra186 boards. PCIe endpoint mode support is added
for the Jetson AGX Xavier platform.

Various minor fixes eliminate warnings on boot related to missing power
supplies for some devices.

----------------------------------------------------------------
JC Kuo (2):
      arm64: tegra: Add XUSB and pad controller on Tegra194
      arm64: tegra: Enable XUSB host in P2972-0000 board

Jon Hunter (5):
      arm64: tegra: Fix Tegra194 PCIe compatible string
      arm64: tegra: Enable I2C controller for EEPROM
      arm64: tegra: Add EEPROM supplies
      arm64: tegra: Fix Tegra186 SOR supply
      arm64: tegra: Populate LP8557 backlight regulator

Nagarjuna Kristam (8):
      arm64: tegra: Update OTG port entries for Jetson TX1
      arm64: tegra: Update OTG port entries for Jetson TX2
      arm64: tegra: Add XUDC node for Tegra210
      arm64: tegra: Enable XUDC on Jetson TX1
      arm64: tegra: Add XUDC node for Tegra186
      arm64: tegra: Enable XUDC node on Jetson TX2
      arm64: tegra: Update OTG port entries for Jetson Nano
      arm64: tegra: Enable XUDC node on Jetson Nano

Sowjanya Komatineni (6):
      dt-bindings: clock: tegra: Add IDs for OSC clocks
      dt-bindings: tegra: Convert Tegra PMC bindings to YAML
      dt-bindings: soc: tegra-pmc: Add Tegra PMC clock bindings
      dt-bindings: soc: tegra-pmc: Add ID for Tegra PMC 32 kHz blink clock
      arm64: tegra: Add clock-cells property to Tegra PMC node
      arm64: tegra: smaug: Change clk_out_2 provider to PMC

Thierry Reding (2):
      Merge branch 'for-5.7/dt-bindings' into for-5.7/arm64/dt
      arm64: tegra: Add ethernet alias on Jetson TX1

Vidya Sagar (2):
      arm64: tegra: Add PCIe endpoint controllers nodes for Tegra194
      arm64: tegra: Add support for PCIe endpoint mode in P2972-0000 platform

 .../bindings/arm/tegra/nvidia,tegra20-pmc.txt      | 300 -----------------
 .../bindings/arm/tegra/nvidia,tegra20-pmc.yaml     | 354 +++++++++++++++++++++
 .../bindings/pci/nvidia,tegra194-pcie.txt          |   2 +-
 arch/arm64/boot/dts/nvidia/tegra132.dtsi           |   4 +-
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts |  26 +-
 arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi     |   1 +
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           |  19 ++
 arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi     |  36 ++-
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts |  81 +++++
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           | 250 ++++++++++++++-
 arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi     |   3 +
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts |   2 +
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     |  45 ++-
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts |  24 +-
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts      |   2 +-
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |  25 +-
 include/dt-bindings/clock/tegra114-car.h           |   4 +-
 include/dt-bindings/clock/tegra124-car-common.h    |   4 +-
 include/dt-bindings/clock/tegra210-car.h           |   4 +-
 include/dt-bindings/clock/tegra30-car.h            |   4 +-
 include/dt-bindings/soc/tegra-pmc.h                |  16 +
 21 files changed, 883 insertions(+), 323 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.txt
 create mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
 create mode 100644 include/dt-bindings/soc/tegra-pmc.h

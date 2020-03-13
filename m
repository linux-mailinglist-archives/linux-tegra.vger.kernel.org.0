Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E28B184D19
	for <lists+linux-tegra@lfdr.de>; Fri, 13 Mar 2020 17:59:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726754AbgCMQ7H (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 13 Mar 2020 12:59:07 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:45463 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726533AbgCMQ7H (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 13 Mar 2020 12:59:07 -0400
Received: by mail-wr1-f68.google.com with SMTP id t2so2956327wrx.12
        for <linux-tegra@vger.kernel.org>; Fri, 13 Mar 2020 09:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZIfXzv5neGBtpJUqK4oBSOIQcZhZavQRkTZC/ZMF6dw=;
        b=tIurPIPKkWRIAgCHTJkHgVKyubcfxP26ZdQC4118yMSoD4Apt5guOeuyySRDjMM0U8
         CGjY/Z+lMWNvdQXIbfJ4g1k1/pD5RPajpDdx9pO/vbvBaKcudQn4Y3mk1aWBO21MLFtn
         xucA/vDegEfA1boCvlyPFzBcEUcQj45yVvyNJOjsRGWrEr4IRC688xB6XMpiVirVu+uY
         eNdxDMy1hJy/MFuUVDUMPHWcmRajyBK9V9Vwnvj2ahU+WlnJeXl0WEyHAYQMNceFHCIS
         1SMgD7PZcBkFkagdHxlj2s+CMnm1hZ5pQ+SQHdP5C2Nr9248vBcJ8UXEVLjdcfeu36Ll
         dtog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZIfXzv5neGBtpJUqK4oBSOIQcZhZavQRkTZC/ZMF6dw=;
        b=nEOXfsKf40XC6kLroLtU4cOGC8Gy70VlPUDclsy96Z8wmKGVL8vUqu8VC0SAg8whlU
         MbI5PxLVT/m2brSUpwbEw2y46/xxpgbWeIq9wMHHbgP070mTwsawi9gPQN/oYkT/LuXe
         o569KnzUPbPiVgqM8xYKV9ihqud0F5DR1De648NLzpoZCEuI2C5FvVHt72xIr0cTLfUJ
         jFCZqrgwg7u0d08DZjqBscQo9XLtfKhWeM2eJb04g+3yT+9bvXjhwBg7It3Vztkoa3tY
         eQxyID1A4SaqusejYGh4GNQckg/rSsCcce2cmlWZ2Q5NwfNVOx0dwMWGq3/L6eUo6IWf
         qFqw==
X-Gm-Message-State: ANhLgQ1q8OqnsSP3SQyt3RripJih23GuNyhOAgbaDW2E4lXqHkLguQx0
        e/h6OIY9mBMHqCFc+F3ahJE=
X-Google-Smtp-Source: ADFU+vuS6XpW5zBrYRfIm1Mm+Upfw2PLjJU40yeTjvnqRZo7CtK4vDfSPb8FULv+ESumhrun/cuzhQ==
X-Received: by 2002:adf:dfc1:: with SMTP id q1mr18378154wrn.62.1584118745660;
        Fri, 13 Mar 2020 09:59:05 -0700 (PDT)
Received: from localhost (pD9E516A9.dip0.t-ipconnect.de. [217.229.22.169])
        by smtp.gmail.com with ESMTPSA id s28sm4996272wrb.42.2020.03.13.09.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2020 09:59:04 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 06/10] ARM: tegra: Device tree changes for v5.7-rc1
Date:   Fri, 13 Mar 2020 17:58:44 +0100
Message-Id: <20200313165848.2915133-6-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.7-arm-dt

for you to fetch changes up to bdb2c52a6e564af02b467862097b77941699c698:

  ARM: tegra: Update sound node clocks in device tree (2020-03-13 11:25:44 +0100)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Device tree changes for v5.7-rc1

Minor fixes and additions for 32-bit Tegra SoC device trees.

----------------------------------------------------------------
JC Kuo (1):
      dt-bindings: phy: tegra: Add Tegra194 support

Nagarjuna Kristam (3):
      dt-bindings: phy: tegra-xusb: Add usb-role-switch
      dt-bindings: usb: Add NVIDIA Tegra XUSB device mode controller binding
      ARM: tegra: Remove USB 2-0 port from Jetson TK1 padctl

Sowjanya Komatineni (6):
      dt-bindings: clock: tegra: Add IDs for OSC clocks
      dt-bindings: tegra: Convert Tegra PMC bindings to YAML
      dt-bindings: soc: tegra-pmc: Add Tegra PMC clock bindings
      dt-bindings: soc: tegra-pmc: Add ID for Tegra PMC 32 kHz blink clock
      ARM: tegra: Add clock-cells property to PMC
      ARM: tegra: Update sound node clocks in device tree

Thierry Reding (1):
      Merge branch 'for-5.7/dt-bindings' into for-5.7/arm/dt

 .../bindings/arm/tegra/nvidia,tegra20-pmc.txt      | 300 -----------------
 .../bindings/arm/tegra/nvidia,tegra20-pmc.yaml     | 354 +++++++++++++++++++++
 .../bindings/phy/nvidia,tegra124-xusb-padctl.txt   |  24 ++
 .../devicetree/bindings/usb/nvidia,tegra-xudc.yaml | 190 +++++++++++
 arch/arm/boot/dts/tegra114-dalmore.dts             |   8 +-
 arch/arm/boot/dts/tegra114.dtsi                    |   4 +-
 arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi        |   8 +-
 arch/arm/boot/dts/tegra124-apalis.dtsi             |   8 +-
 arch/arm/boot/dts/tegra124-jetson-tk1.dts          |  14 +-
 arch/arm/boot/dts/tegra124-nyan.dtsi               |   8 +-
 arch/arm/boot/dts/tegra124-venice2.dts             |   8 +-
 arch/arm/boot/dts/tegra124.dtsi                    |   4 +-
 arch/arm/boot/dts/tegra20.dtsi                     |   4 +-
 arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi         |   8 +-
 arch/arm/boot/dts/tegra30-apalis.dtsi              |   8 +-
 arch/arm/boot/dts/tegra30-beaver.dts               |   8 +-
 arch/arm/boot/dts/tegra30-cardhu.dtsi              |   8 +-
 arch/arm/boot/dts/tegra30-colibri.dtsi             |   8 +-
 arch/arm/boot/dts/tegra30.dtsi                     |   4 +-
 include/dt-bindings/clock/tegra114-car.h           |   4 +-
 include/dt-bindings/clock/tegra124-car-common.h    |   4 +-
 include/dt-bindings/clock/tegra210-car.h           |   4 +-
 include/dt-bindings/clock/tegra30-car.h            |   4 +-
 include/dt-bindings/soc/tegra-pmc.h                |  16 +
 24 files changed, 685 insertions(+), 325 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.txt
 create mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml
 create mode 100644 include/dt-bindings/soc/tegra-pmc.h

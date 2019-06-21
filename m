Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA8CA4EB76
	for <lists+linux-tegra@lfdr.de>; Fri, 21 Jun 2019 17:02:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726121AbfFUPCP (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 21 Jun 2019 11:02:15 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:34109 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726075AbfFUPCP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 21 Jun 2019 11:02:15 -0400
Received: by mail-wr1-f67.google.com with SMTP id k11so6943211wrl.1
        for <linux-tegra@vger.kernel.org>; Fri, 21 Jun 2019 08:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YrLivGcQuzCRORO001qD3KWZx8yDGr4VW8kByjQhyLI=;
        b=h3ozZ654DLC58KvzyUm3cL02rDLG+wkPlC3LroL8eOqBMP294aX+nCzBjj5v+7pCex
         x/9E61jJhjm+/wWdNP5xHiKfosrAZkEGTwfQ2fxGyXeI9wuIyTu0qPHi/dsfSLMb05Rf
         BiNKt+/UbdftMDajZnBYgawv74ArJuiiAQ6VFNQGHFI8KhewNK26Q0Jf9+zYq5nzBj3d
         aYN483sfdJZ2ZV4ycwIKdiE6/E2qHP5rtBgYbyHmmcX2LLOwkSpnGt/M8YvgFtV4pxxz
         LaRv0oFTUP6rduFPzfYk1sX+IyXCN1M8VJ/UQuUC3zzgSdbd8qM9lXigXaGu4dBh6F43
         kN1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YrLivGcQuzCRORO001qD3KWZx8yDGr4VW8kByjQhyLI=;
        b=RPV65dvgSyJ4uSVdDuvsVXLqJHUXbhaELUga8184Yp4YKN4bqLiv7FLJoKKn3O4NnO
         rtLFs/dINgAQ03g26mqag9Qf/cfy+zj9jC7fqlKnCMBweCFFO66sg7viAqPvyMxXiqWn
         SFkFFqKRkBsVguYTeC1kKUMxxzzcEAuQl3rGjwrhGKpqAOEJqGdH6A96xVMrNwTWkSg5
         xGfSUL729fC3PUipQ41S27FAYYSv52CVTYYM2KT9Czm0OC606PIqBWowf7G51HDnvBHZ
         GETarOKEJpcDL4nWuD3+Uhh6/rg1imM9DfYhHIG1uD4BC3wwDwn5LJ/JfTKqPFUVeYlu
         NpTA==
X-Gm-Message-State: APjAAAXaSlUnBi8E5etKoeAeKXqCLIEU1hiZUBtsxxXCjbsJbouLJnwe
        U2uTgUzSyA0yJssOjOQdj+Q=
X-Google-Smtp-Source: APXvYqxxLVqBQXTLzyjlvI95xYsfP4eyC/fVGpGAtc91t8WshHndVfuFnsPqeciei5aF9WH8jzx3ow==
X-Received: by 2002:adf:db12:: with SMTP id s18mr43506778wri.335.1561129333071;
        Fri, 21 Jun 2019 08:02:13 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id o185sm2758735wmo.45.2019.06.21.08.02.12
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 21 Jun 2019 08:02:12 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/5] arm64: tegra: Device tree changes for v5.3-rc1
Date:   Fri, 21 Jun 2019 17:02:05 +0200
Message-Id: <20190621150206.19037-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190621150206.19037-1-thierry.reding@gmail.com>
References: <20190621150206.19037-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.3-arm64-dt

for you to fetch changes up to a586c88eab65619f3654194dc90d46c98e712af2:

  arm64: tegra: Enable PCIe slots in P2972-0000 board (2019-06-21 16:06:00 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree changes for v5.3-rc1

This contains the bulk of the Tegra changes this cycle. It has a bunch
of improvements across almost all boards. These are mostly small and not
too exciting additions.

Most notably perhaps is the continuation of Jetson Nano support, which
is now mostly on feature parity with Jetson TX1.

----------------------------------------------------------------
Jon Hunter (3):
      arm64: tegra: Fix AGIC register range
      arm64: tegra: Update Jetson TX1 GPU regulator timings
      arm64: tegra: Fix Jetson Nano GPU regulator

Joseph Lo (1):
      arm64: tegra: Add CPU cache topology for Tegra186

Manikanta Maddireddy (1):
      arm64: tegra: Add PEX DPD states as pinctrl properties

Nicolin Chen (1):
      arm64: tegra: Add INA3221 channel info for Jetson TX2

Sameer Pujar (2):
      arm64: tegra: Add ACONNECT, ADMA and AGIC nodes
      arm64: tegra: Enable ACONNECT, ADMA and AGIC

Thierry Reding (18):
      arm64: tegra: Use TEGRA186_ prefix for GPIOs
      dt-bindings: tegra186-gpio: Remove unused definitions
      arm64: tegra: Clarify that P2771 is the Jetson TX2 Developer Kit
      arm64: tegra: Clarify that P3310 is the Jetson TX2
      arm64: tegra: Clarify that P2888 is the Jetson AGX Xavier
      arm64: tegra: Make DT model property consistent
      arm64: tegra: Add VCC supply for GPIO expanders on Jetson TX2
      arm64: tegra: Add pin control states for I2C on Tegra186
      arm64: tegra: Mark architected timer as always on
      arm64: tegra: Don't use architected timer for suspend on Tegra210
      arm64: tegra: Add ID EEPROM for Jetson TX1 module
      arm64: tegra: Add ID EEPROM for Jetson TX1 Developer Kit
      arm64: tegra: Add ID EEPROM for Jetson TX2 module
      arm64: tegra: Add ID EEPROM for Jetson TX2 Developer Kit
      arm64: tegra: Add ID EEPROMs on Jetson Nano
      arm64: tegra: Enable CPU sleep on Jetson Nano
      arm64: tegra: Enable PWM on Jetson Nano
      arm64: tegra: Sort device tree nodes alphabetically

Vidya Sagar (2):
      arm64: tegra: Add P2U and PCIe controller nodes to Tegra194 DT
      arm64: tegra: Enable PCIe slots in P2972-0000 board

 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts |  75 ++-
 arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi     |  53 ++-
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           | 176 ++++++-
 arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi     |   4 +-
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts |  55 ++-
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           | 509 +++++++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi     |  16 +-
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts |  13 +
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts |  52 ++-
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |  22 +-
 include/dt-bindings/gpio/tegra186-gpio.h           |  41 --
 11 files changed, 937 insertions(+), 79 deletions(-)

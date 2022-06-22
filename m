Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47A5F554998
	for <lists+linux-tegra@lfdr.de>; Wed, 22 Jun 2022 14:17:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357689AbiFVLiE (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 22 Jun 2022 07:38:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357483AbiFVLhz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 22 Jun 2022 07:37:55 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42BBB3CA4E;
        Wed, 22 Jun 2022 04:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
        s=20161220; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
        Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=T02pZ/spQxA2e8NWYLL7bn+PampfH2BP7FC9jpkGLKg=; b=121d3BvSP/wf5vchE/sx9HTFcR
        qRNWybK0GTlHEcqNBmf5Xno7j11EHkY01ufmX8mujhVgtCLEWa423HEeGgJ80HlF+BlxQgf69Jzln
        vkBo1eIss91GrLpf856lVYJkmR4fVphdLZMs9nA+0tWL4Wf7iCh1NKhnGhBaiBDYvc9cUzKJT2d4h
        Ho308fMBPp9KerrT0JPDIfDpTm8k7XpbpUowomCzZ1kD20nVWMTITHOD7Yg89k/ORy1FbqUwh9Ho5
        oGjdivpnQeh5Jzz7I4FTeFRCF9VIDiyriNk+dxYVeyBGUlk3tMmSQnDLooXtFo2IeInLu2tc7Lj53
        0DkRsi3w==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <cyndis@kapsi.fi>)
        id 1o3yg3-0001Xl-8a; Wed, 22 Jun 2022 14:37:42 +0300
From:   Mikko Perttunen <cyndis@kapsi.fi>
To:     thierry.reding@gmail.com, jonathanh@nvidia.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, digetx@gmail.com
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH v2 00/13] Host1x support on Tegra234
Date:   Wed, 22 Jun 2022 14:37:20 +0300
Message-Id: <20220622113733.1710471-1-cyndis@kapsi.fi>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Mikko Perttunen <mperttunen@nvidia.com>

-------------
Merging notes
-------------

This series should be applied on top of the Host1x context isolation
series.

-------------
Changes in v2
-------------

Rebased on top of v5.19-rc3.

Updated Host1x device tree schema based on Rob's comments.

No changes to node names done, as that is a change that should be
done uniformly in a separate series for all Tegra generations,
if deemed appropriate.

-------------
Original message
-------------

Hi all,

This series adds support for Host1x and VIC on the recently released
Tegra234 (Orin) SoC. It's split into the following parts:

* Device tree binding updates
* Cleanup in host1x driver
* Add programming of new registers and old registers that now need to
  be programmed to a non-reset value
* Tegra234 device data and headers
* Rewrite of the job opcode sequence, and related patches to
  support MLOCKs on Tegra186+.

The rewrite of the job opcode sequence brings Tegra186, Tegra194 and
Tegra234 support to a 'full-featured' status that is necessary to
support all host1x features in the future. This should not have any
impact on older SoCs.

This series should be applied on top of the Host1x context isolation
series.

Tested on Jetson AGX Xavier and Jetson AGX Orin.

Thanks,
Mikko

Mikko Perttunen (13):
  dt-bindings: Add bindings for Tegra234 Host1x and VIC
  dt-bindings: Add headers for Host1x and VIC on Tegra234
  arm64: tegra: Add Host1x and VIC on Tegra234
  gpu: host1x: Deduplicate hardware headers
  gpu: host1x: Simplify register mapping and add common aperture
  gpu: host1x: Program virtualization tables
  gpu: host1x: Allow reset to be missing
  gpu: host1x: Program interrupt destinations on Tegra234
  gpu: host1x: Tegra234 device data and headers
  gpu: host1x: Rewrite job opcode sequence
  gpu: host1x: Add MLOCK release code on Tegra234
  gpu: host1x: Use RESTART_W to skip timed out jobs on Tegra186+
  drm/tegra: vic: Add Tegra234 support

 .../display/tegra/nvidia,tegra124-vic.yaml    |   1 +
 .../display/tegra/nvidia,tegra20-host1x.yaml  | 110 +++++++++--
 arch/arm64/boot/dts/nvidia/tegra234.dtsi      |  46 +++++
 drivers/gpu/drm/tegra/drm.c                   |   1 +
 drivers/gpu/drm/tegra/vic.c                   |  12 ++
 drivers/gpu/host1x/Makefile                   |   3 +-
 drivers/gpu/host1x/cdma.c                     |  19 +-
 drivers/gpu/host1x/dev.c                      | 112 +++++++----
 drivers/gpu/host1x/dev.h                      |  11 ++
 drivers/gpu/host1x/hw/cdma_hw.c               |  34 ++++
 drivers/gpu/host1x/hw/channel_hw.c            | 144 ++++++++------
 drivers/gpu/host1x/hw/host1x01_hardware.h     | 114 +----------
 drivers/gpu/host1x/hw/host1x02_hardware.h     | 113 +----------
 drivers/gpu/host1x/hw/host1x04_hardware.h     | 113 +----------
 drivers/gpu/host1x/hw/host1x05_hardware.h     | 113 +----------
 drivers/gpu/host1x/hw/host1x06_hardware.h     | 128 +------------
 drivers/gpu/host1x/hw/host1x07_hardware.h     | 128 +------------
 drivers/gpu/host1x/hw/host1x08.c              |  33 ++++
 drivers/gpu/host1x/hw/host1x08.h              |  15 ++
 drivers/gpu/host1x/hw/host1x08_hardware.h     |  21 ++
 drivers/gpu/host1x/hw/hw_host1x08_channel.h   |  11 ++
 drivers/gpu/host1x/hw/hw_host1x08_common.h    |  11 ++
 .../gpu/host1x/hw/hw_host1x08_hypervisor.h    |   9 +
 drivers/gpu/host1x/hw/hw_host1x08_uclass.h    | 181 ++++++++++++++++++
 drivers/gpu/host1x/hw/hw_host1x08_vm.h        |  36 ++++
 drivers/gpu/host1x/hw/intr_hw.c               |  11 ++
 drivers/gpu/host1x/hw/opcodes.h               | 150 +++++++++++++++
 include/dt-bindings/clock/tegra234-clock.h    |   4 +
 include/dt-bindings/memory/tegra234-mc.h      |   5 +
 .../dt-bindings/power/tegra234-powergate.h    |   1 +
 include/dt-bindings/reset/tegra234-reset.h    |   1 +
 31 files changed, 877 insertions(+), 814 deletions(-)
 create mode 100644 drivers/gpu/host1x/hw/host1x08.c
 create mode 100644 drivers/gpu/host1x/hw/host1x08.h
 create mode 100644 drivers/gpu/host1x/hw/host1x08_hardware.h
 create mode 100644 drivers/gpu/host1x/hw/hw_host1x08_channel.h
 create mode 100644 drivers/gpu/host1x/hw/hw_host1x08_common.h
 create mode 100644 drivers/gpu/host1x/hw/hw_host1x08_hypervisor.h
 create mode 100644 drivers/gpu/host1x/hw/hw_host1x08_uclass.h
 create mode 100644 drivers/gpu/host1x/hw/hw_host1x08_vm.h
 create mode 100644 drivers/gpu/host1x/hw/opcodes.h

-- 
2.36.1


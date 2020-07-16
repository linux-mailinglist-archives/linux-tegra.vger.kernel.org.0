Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0D7F222522
	for <lists+linux-tegra@lfdr.de>; Thu, 16 Jul 2020 16:19:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728817AbgGPOTE (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 16 Jul 2020 10:19:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728412AbgGPOTD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 16 Jul 2020 10:19:03 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B327C061755
        for <linux-tegra@vger.kernel.org>; Thu, 16 Jul 2020 07:19:03 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id e22so4876968edq.8
        for <linux-tegra@vger.kernel.org>; Thu, 16 Jul 2020 07:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OnuwbpnlNbW1uR8nF6pdqvLhWcxteeR9e8cv9tVY9hA=;
        b=NcnC8Zv5UhA2K6E8kdobnJY3XkuCSLSX2dlUXfMnIKCNZG2wwTnnkD6eZN8kI2ga0b
         e/8TFZsO03qbHbu0FpYy/8rUlFbyml16Mhl0sI09YVwh4TWG7K8lS2S7HWpK42VLfJ9v
         BhD+f4XIh6FhYVMAYg9orquuax8yHUZUF4SMHUVjcsLrNBNyUN9ASkwhp3ZIsPZ3QAOG
         /KBOcGKA19bzG2nRVISw+4Qz0IU2jLi5BmHqDeBSSbnDPK+PGg0oE4DXUWsWtWMw5FE2
         5NQUPuWJKUl4TsNxnrDVMBktUEAnIjJzZbsJoPxZI5HU7+0JR0u1969j+zbH4lvrualo
         LAxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OnuwbpnlNbW1uR8nF6pdqvLhWcxteeR9e8cv9tVY9hA=;
        b=jWeTcGUyxajEevAccRn6vJfh0kwU0MRVBgvmIklpOqjMUz5Y0I0AoLmy1dlPvchMHt
         SMzjhhWrV4WJsnI4Aw1fsKP6U5vEkjsksU+eZURWfEaObfxwj9Do0JRvtLu+oRYN4qAH
         WqWpEEQ3ltjQ8BGJDNypWY3odDNYlBC+vCchiebnG58sG8teduP3gVVQLSR/5rNEfN2y
         fwDa0dVxW6RzYa5DvnDtkp/yjBPJyeUhJFps3e4eVOJfvnq6w6hUDRcvk/j4E4oQ1oUi
         jY4mWygfbMJlYNBgCjDgTvy0zfcH1wZ7wBFwn+dxc6JYfhxgNinJoSDkPv7KCFabImb8
         m0Ag==
X-Gm-Message-State: AOAM532bYVSG4RZD269unFRYBIAeDciQn8g9r59/KQdegSt7Cu4V0nyW
        iJI9kJ2lvpvt6+scP5xOm7A=
X-Google-Smtp-Source: ABdhPJxjpG5bot+8izG/xYl9VCveIjSSXNn2+eL6O1Mpicn/m7PlLB7IxYi3IkC+f7f/IlHQeRx81A==
X-Received: by 2002:aa7:d049:: with SMTP id n9mr4897268edo.39.1594909141953;
        Thu, 16 Jul 2020 07:19:01 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id s1sm5385377edy.1.2020.07.16.07.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 07:19:00 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/9] arm64: tegra: Initial Tegra234 VDK support
Date:   Thu, 16 Jul 2020 16:18:47 +0200
Message-Id: <20200716141856.544718-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

This set of patches introduces support for the new Tegra234 SoC, also
known as Orin. Currently no silicon of this chip is available, so the
support added here is for a simulation platform known as VDK.

Note that this simulation platform is not available publicly. However
the goal is to use the simulation platform as a way of upstreaming as
much support as possible ahead of tapeout.

Once actual silicon becomes available, the plan is to stop supporting
the simulation platform and shift focus to real hardware.

Thierry

Sandipan Patra (1):
  soc/tegra: fuse: Add Tegra186 and Tegra194 SoC IDs

Thierry Reding (8):
  dt-bindings: tegra: Add Tegra234 VDK compatible
  dt-bindings: fuse: tegra: Add missing compatible strings
  dt-bindings: fuse: tegra: Document Tegra234 compatible string
  soc/tegra: fuse: Extract tegra_get_platform()
  soc/tegra: fuse: Implement tegra_is_silicon()
  soc/tegra: fuse: Add Tegra234 support
  firmware: tegra: Enable BPMP support on Tegra234
  arm64: tegra: Initial Tegra234 VDK support

 .../devicetree/bindings/arm/tegra.yaml        |   4 +
 .../bindings/fuse/nvidia,tegra20-fuse.txt     |   6 +-
 arch/arm64/boot/dts/nvidia/Makefile           |   1 +
 .../boot/dts/nvidia/tegra234-sim-vdk.dts      |  40 ++++
 arch/arm64/boot/dts/nvidia/tegra234.dtsi      | 191 ++++++++++++++++++
 drivers/firmware/tegra/bpmp.c                 |   3 +-
 drivers/mailbox/tegra-hsp.c                   |   9 +-
 drivers/soc/tegra/Kconfig                     |  10 +
 drivers/soc/tegra/fuse/fuse-tegra.c           |   8 +-
 drivers/soc/tegra/fuse/fuse-tegra30.c         |  30 +++
 drivers/soc/tegra/fuse/fuse.h                 |  10 +-
 drivers/soc/tegra/fuse/tegra-apbmisc.c        |  19 ++
 include/dt-bindings/clock/tegra234-clock.h    |  14 ++
 include/dt-bindings/reset/tegra234-reset.h    |  10 +
 include/soc/tegra/fuse.h                      |   5 +
 15 files changed, 353 insertions(+), 7 deletions(-)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dts
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra234.dtsi
 create mode 100644 include/dt-bindings/clock/tegra234-clock.h
 create mode 100644 include/dt-bindings/reset/tegra234-reset.h

-- 
2.27.0


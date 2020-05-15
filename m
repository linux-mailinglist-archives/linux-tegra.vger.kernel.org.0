Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 708F01D5291
	for <lists+linux-tegra@lfdr.de>; Fri, 15 May 2020 16:53:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726525AbgEOOxb (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 15 May 2020 10:53:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726144AbgEOOxa (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 15 May 2020 10:53:30 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B0BFC061A0C
        for <linux-tegra@vger.kernel.org>; Fri, 15 May 2020 07:53:30 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id u188so2999702wmu.1
        for <linux-tegra@vger.kernel.org>; Fri, 15 May 2020 07:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OPQXfC8VLeh7yB0C+9OJNGpPQZauVK3Msd52CBY6WNE=;
        b=oJYvt3WWSmWwnFRSq3ns2pb6ONzvcCkHiiyrWwSVPxvhaX5uq7xzNJmA6fjyCGSk9R
         KqkcnQYZcy7233IZ6OtXuhTwUiK+MyYM2DRUjxpp+nYIYJUt2P4sq55DZoIZoBrYfUKu
         6o2QpGN/SxfZreYsa8Aw1CuhF23mCg7bVEHSyJFyvIobQ6yImPkrjs3cO7B85GrlyyNB
         ssXoQ52yC8GbB7zYkHljMpxmpQiSsJrqTM7VOm5R27YmcL8E1z0pL11j3UczwqSyI0jo
         MQ5lHrk2UhqSqpZdAZlrpUscTF+2cnelD/SFceJ8Te7VncgJCDwCFfzmSkr4TKmmBryE
         eNnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OPQXfC8VLeh7yB0C+9OJNGpPQZauVK3Msd52CBY6WNE=;
        b=E/r9AjC3y4EsvJ1fLdypQuiV1uh1IIegIuPEf+OT402CaYhkBh5EQn/E01uHjZCxl2
         ILRsSn9k8251R34FZSe5/ZbscnxRbKgdYLPNt1OxyykVp1/2/8BLo2RN79wDU92GmI2P
         O7FW1OmLbvySSgvykr+NV8p1FzmmJKyMHKKJr2uM3qLhyhGDwYtb8vDvWx3jUJu/uP4z
         45y9FsTWUzdGS6gqu8H/cUK4ArpYGJTjpZ0rOwSgrIPQ1UZQ8rpWW9r24UloARCsPnIz
         qxSj1lx3gBBMy4y0+241rWhe8DFR94l5Lzok/LinoN+gvks472VXrPFSAmNk8jANtOmt
         wxxw==
X-Gm-Message-State: AOAM532yHj9jfjInbujBMT2UaICuVuxiVShHpTxhaLIz3VSjvCwMtnkn
        fPfAigVI8mq6VIdjQ0EboLMxkHel
X-Google-Smtp-Source: ABdhPJzmOjglOXh3jng6KG92iiQM5k8LyruLeNxAvCHY0/wDqVS09vViAXRoZgguHbPJs3R3KytWYw==
X-Received: by 2002:a05:600c:d6:: with SMTP id u22mr4204078wmm.45.1589554409202;
        Fri, 15 May 2020 07:53:29 -0700 (PDT)
Received: from localhost (pD9E51079.dip0.t-ipconnect.de. [217.229.16.121])
        by smtp.gmail.com with ESMTPSA id r2sm4022439wrg.84.2020.05.15.07.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 07:53:28 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 07/11] memory: tegra: Changes for v5.8-rc1
Date:   Fri, 15 May 2020 16:53:07 +0200
Message-Id: <20200515145311.1580134-8-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200515145311.1580134-1-thierry.reding@gmail.com>
References: <20200515145311.1580134-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:

  Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.8-memory

for you to fetch changes up to b7d4cab0360484786b2a53b1bb603b564218112f:

  memory: tegra: Delete some dead code (2020-05-12 22:52:00 +0200)

Thanks,
Thierry

----------------------------------------------------------------
memory: tegra: Changes for v5.8-rc1

Contains a few cleanup patches and an implementation to scale the EMC
frequency on Tegra210 systems.

----------------------------------------------------------------
Arnd Bergmann (1):
      memory: tegra: Avoid unused function warnings

Christophe JAILLET (1):
      memory: tegra: Fix an error handling path in tegra186_emc_probe()

Dan Carpenter (1):
      memory: tegra: Delete some dead code

Dmitry Osipenko (9):
      dt-bindings: cpufreq: Add binding for NVIDIA Tegra20/30
      clk: tegra: Add custom CCLK implementation
      clk: tegra: pll: Add pre/post rate-change hooks
      clk: tegra: cclk: Add helpers for handling PLLX rate changes
      clk: tegra20: Use custom CCLK implementation
      clk: tegra30: Use custom CCLK implementation
      memory: tegra: Make debugfs permissions human-readable
      memory: tegra20-emc: Poll EMC-CaR handshake instead of waiting for interrupt
      memory: tegra30-emc: Poll EMC-CaR handshake instead of waiting for interrupt

Geert Uytterhoeven (2):
      of: Make <linux/of_reserved_mem.h> self-contained
      memory: tegra: Drop <linux/clk-provider.h>

Joseph Lo (7):
      dt-bindings: memory: tegra: Add external memory controller binding for Tegra210
      clk: tegra: Add PLLP_UD and PLLMB_UD for Tegra210
      clk: tegra: Export functions for EMC clock scaling
      clk: tegra: Implement Tegra210 EMC clock
      clk: tegra: Remove the old emc_mux clock for Tegra210
      memory: tegra: Add EMC scaling support code for Tegra210
      memory: tegra: Add EMC scaling sequence code for Tegra210

Sowjanya Komatineni (4):
      dt-bindings: clock: tegra: Remove PMC clock IDs
      dt-bindings: clock: tegra: Add clock ID for CSI TPG clock
      dt-bindings: tegra: Add VI and CSI bindings
      clk: tegra: Add Tegra210 CSI TPG clock gate

Thierry Reding (9):
      of: reserved-memory: Support lookup of regions by name
      of: reserved-memory: Support multiple regions per device
      dt-bindings: i2c: tegra: Document Tegra210 VI I2C
      Merge branch 'for-5.8/dt-bindings' into for-5.8/clk
      clk: tegra: Rename Tegra124 EMC clock source file
      Merge branch 'for-5.8/dt-bindings' into for-5.8/memory
      Merge branch 'for-5.8/of' into for-5.8/memory
      Merge branch 'for-5.8/clk' into for-5.8/memory
      memory: tegra: Support derated timings on Tegra210

 .../bindings/cpufreq/nvidia,tegra20-cpufreq.txt    |   56 +
 .../display/tegra/nvidia,tegra20-host1x.txt        |   73 +-
 .../devicetree/bindings/i2c/nvidia,tegra20-i2c.txt |    6 +
 .../memory-controllers/nvidia,tegra210-emc.yaml    |   82 +
 drivers/clk/tegra/Kconfig                          |    4 -
 drivers/clk/tegra/Makefile                         |    4 +-
 drivers/clk/tegra/clk-pll.c                        |   12 +-
 drivers/clk/tegra/clk-tegra-super-cclk.c           |  212 ++
 .../clk/tegra/{clk-emc.c => clk-tegra124-emc.c}    |    0
 drivers/clk/tegra/clk-tegra20.c                    |    7 +-
 drivers/clk/tegra/clk-tegra210-emc.c               |  369 ++++
 drivers/clk/tegra/clk-tegra210.c                   |   94 +-
 drivers/clk/tegra/clk-tegra30.c                    |    6 +-
 drivers/clk/tegra/clk.h                            |   24 +-
 drivers/memory/tegra/Kconfig                       |   14 +
 drivers/memory/tegra/Makefile                      |    4 +
 drivers/memory/tegra/mc.h                          |    1 +
 drivers/memory/tegra/tegra124-emc.c                |    6 +-
 drivers/memory/tegra/tegra186-emc.c                |   21 +-
 drivers/memory/tegra/tegra186.c                    |    4 +-
 drivers/memory/tegra/tegra20-emc.c                 |   34 +-
 drivers/memory/tegra/tegra210-emc-cc-r21021.c      | 1775 +++++++++++++++++
 drivers/memory/tegra/tegra210-emc-core.c           | 2100 ++++++++++++++++++++
 drivers/memory/tegra/tegra210-emc-table.c          |   90 +
 drivers/memory/tegra/tegra210-emc.h                | 1016 ++++++++++
 drivers/memory/tegra/tegra210-mc.h                 |   50 +
 drivers/memory/tegra/tegra30-emc.c                 |  122 +-
 drivers/of/of_reserved_mem.c                       |   41 +-
 include/dt-bindings/clock/tegra114-car.h           |   14 +-
 include/dt-bindings/clock/tegra124-car-common.h    |   14 +-
 include/dt-bindings/clock/tegra20-car.h            |    2 +-
 include/dt-bindings/clock/tegra210-car.h           |   20 +-
 include/dt-bindings/clock/tegra30-car.h            |   14 +-
 include/linux/clk/tegra.h                          |   27 +
 include/linux/of_reserved_mem.h                    |   12 +
 35 files changed, 6131 insertions(+), 199 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/cpufreq/nvidia,tegra20-cpufreq.txt
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.yaml
 create mode 100644 drivers/clk/tegra/clk-tegra-super-cclk.c
 rename drivers/clk/tegra/{clk-emc.c => clk-tegra124-emc.c} (100%)
 create mode 100644 drivers/clk/tegra/clk-tegra210-emc.c
 create mode 100644 drivers/memory/tegra/tegra210-emc-cc-r21021.c
 create mode 100644 drivers/memory/tegra/tegra210-emc-core.c
 create mode 100644 drivers/memory/tegra/tegra210-emc-table.c
 create mode 100644 drivers/memory/tegra/tegra210-emc.h
 create mode 100644 drivers/memory/tegra/tegra210-mc.h

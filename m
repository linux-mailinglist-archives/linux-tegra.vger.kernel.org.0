Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B49C8184D1C
	for <lists+linux-tegra@lfdr.de>; Fri, 13 Mar 2020 17:59:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726571AbgCMQ7N (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 13 Mar 2020 12:59:13 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:38651 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726613AbgCMQ7N (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 13 Mar 2020 12:59:13 -0400
Received: by mail-wr1-f67.google.com with SMTP id x11so8269034wrv.5
        for <linux-tegra@vger.kernel.org>; Fri, 13 Mar 2020 09:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jvqohnMij0I2CBTDF5YLXeAgLpbv445ozkjXuVEGaTQ=;
        b=fw4nUGDdM7Jea/euj+WFkdeMcd478PgA6JePiH8KX8hdXt1AtKCGlBAy2D+dcjlt1D
         kl1/ZbnB8xDoLggyDGOzeqEZ/M2Xl7LZuqL8GyW6YDz/GhM1UnbkspSPvv09h5ZC5Boe
         nMt9kVz9H/ioWrcB2rPou+7T5z4BncrxktYpx+YJq2kLYJ7G1d28g2/+/EOxGk/MDMe/
         FsfJVgCwjP8ljRQiwTRLp5iuOFyqC/UmraUKrOvQDEL/R20BG8CFQ9sCekSv4ex5k/9Y
         ExGCHJmrhQjYI/1URjJFvv3TveQ3Yhq3SVV8Skpn4tdassaBFmcdSOnw5ygm9i6LJaQt
         X1Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jvqohnMij0I2CBTDF5YLXeAgLpbv445ozkjXuVEGaTQ=;
        b=fV57ydqnAZC7bswLFlJeeyOrEsxZCAmo0BxSzKWxEfWSi+qZtS2QZ3EUraJKpey/6W
         F/D0wfGaNZuFe9M26QT3mJMeIIsPQGhzPIKk9u7Bm+RZYShQXdgryrxlzhxfhGMKAXvW
         z/rXrtXGCk4G8Q3guDvfUeMDWAk05yftYwp1P7x2fyLCCLmEXel+vDTaiSfUsti4yUnh
         Nx47xltnbWB8vV2N5jJgTWj5Ht56E3hUoeKvkr3RShNKTl+9LHYS1HPm2FfRiRkpufYZ
         4BBGmaw2+CNMWZ2C6bCkgFSgfbIjXhsCfQC0k4BIMA6s2BYDBnFmIQhfXL4R1nBOQgrL
         ivGg==
X-Gm-Message-State: ANhLgQ3YxKtwjjl0SVKTkyfbspPLkDwltEIOlESRPObkofgt4SViwaKw
        CeLWN9cXDY/znYb22VF5EE0=
X-Google-Smtp-Source: ADFU+vtLcomxxRNE6ZfG88AZ1ylBxIg3ZrOocA9bP65sr7EsMPJksN7bDWkcyZzoKlyFARffhYOE0Q==
X-Received: by 2002:adf:ef44:: with SMTP id c4mr18318790wrp.404.1584118750894;
        Fri, 13 Mar 2020 09:59:10 -0700 (PDT)
Received: from localhost (pD9E516A9.dip0.t-ipconnect.de. [217.229.22.169])
        by smtp.gmail.com with ESMTPSA id t124sm18104873wmg.13.2020.03.13.09.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2020 09:59:10 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 09/10] cpuidle: tegra: Changes for v5.7-rc1
Date:   Fri, 13 Mar 2020 17:58:47 +0100
Message-Id: <20200313165848.2915133-9-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.7-cpuidle

for you to fetch changes up to 382ac8e22b90e6334d373da03c17b319458b258e:

  cpuidle: tegra: Disable CC6 state if LP2 unavailable (2020-03-13 11:32:01 +0100)

This set of changes was acked by Daniel Lezcano and the preference is to
take this through the ARM SoC tree because it has a dependency on one of
the other branches (tegra-for-5.7-arm-core) that also goes through the
ARM SoC tree.

Thanks,
Thierry

----------------------------------------------------------------
cpuidle: tegra: Changes for v5.7-rc1

These changes unify CPU idle support for Tegra20, Tegra30 and Tegra114.

----------------------------------------------------------------
Dmitry Osipenko (15):
      ARM: tegra: Compile sleep-tegra20/30.S unconditionally
      ARM: tegra: Add tegra_pm_park_secondary_cpu()
      ARM: tegra: Remove pen-locking from cpuidle-tegra20
      ARM: tegra: Change tegra_set_cpu_in_lp2() type to void
      ARM: tegra: Propagate error from tegra_idle_lp2_last()
      ARM: tegra: Expose PM functions required for new cpuidle driver
      ARM: tegra: Rename some of the newly exposed PM functions
      ARM: tegra: Make outer_disable() open-coded
      ARM: tegra: cpuidle: Handle case where secondary CPU hangs on entering LP2
      ARM: tegra: cpuidle: Make abort_flag atomic
      ARM: tegra: cpuidle: Remove unnecessary memory barrier
      cpuidle: Refactor and move out NVIDIA Tegra20 driver into drivers/cpuidle
      cpuidle: tegra: Squash Tegra30 driver into the common driver
      cpuidle: tegra: Squash Tegra114 driver into the common driver
      cpuidle: tegra: Disable CC6 state if LP2 unavailable

Thierry Reding (1):
      Merge branch 'for-5.7/arm/core' into for-5.7/cpuidle

 arch/arm/mach-tegra/Makefile                     |  19 +-
 arch/arm/mach-tegra/cpuidle-tegra114.c           |  89 -----
 arch/arm/mach-tegra/cpuidle-tegra20.c            | 212 ------------
 arch/arm/mach-tegra/cpuidle-tegra30.c            | 132 --------
 arch/arm/mach-tegra/cpuidle.c                    |  50 ---
 arch/arm/mach-tegra/cpuidle.h                    |  21 --
 arch/arm/mach-tegra/irq.c                        |   3 +-
 arch/arm/mach-tegra/pm.c                         |  54 ++--
 arch/arm/mach-tegra/pm.h                         |   4 -
 arch/arm/mach-tegra/reset-handler.S              |  11 -
 arch/arm/mach-tegra/reset.h                      |   9 +-
 arch/arm/mach-tegra/sleep-tegra20.S              | 170 ----------
 arch/arm/mach-tegra/sleep-tegra30.S              |   6 +-
 arch/arm/mach-tegra/sleep.h                      |  15 -
 arch/arm/mach-tegra/tegra.c                      |   7 +-
 drivers/cpuidle/Kconfig.arm                      |   8 +
 drivers/cpuidle/Makefile                         |   1 +
 drivers/cpuidle/cpuidle-tegra.c                  | 392 +++++++++++++++++++++++
 include/soc/tegra/cpuidle.h                      |   2 +-
 {arch/arm/mach-tegra => include/soc/tegra}/irq.h |   8 +-
 include/soc/tegra/pm.h                           |  31 ++
 21 files changed, 483 insertions(+), 761 deletions(-)
 delete mode 100644 arch/arm/mach-tegra/cpuidle-tegra114.c
 delete mode 100644 arch/arm/mach-tegra/cpuidle-tegra20.c
 delete mode 100644 arch/arm/mach-tegra/cpuidle-tegra30.c
 delete mode 100644 arch/arm/mach-tegra/cpuidle.c
 delete mode 100644 arch/arm/mach-tegra/cpuidle.h
 create mode 100644 drivers/cpuidle/cpuidle-tegra.c
 rename {arch/arm/mach-tegra => include/soc/tegra}/irq.h (59%)

Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F178ECF0B
	for <lists+linux-tegra@lfdr.de>; Sat,  2 Nov 2019 15:01:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726454AbfKBOBW (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sat, 2 Nov 2019 10:01:22 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:33012 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726380AbfKBOBW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 2 Nov 2019 10:01:22 -0400
Received: by mail-wm1-f66.google.com with SMTP id 6so10655870wmf.0
        for <linux-tegra@vger.kernel.org>; Sat, 02 Nov 2019 07:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hnTsoxyaf/hF5ZVsLU/Wj1SHuWXKdJ6AcNaBSIKQ1/s=;
        b=kVQqejUyl8zcIopZOZB3jIe6SJsMrpITKpccaQhsu67rgXZN1px17PtJ7R1vBbKMAA
         K3JjUsmGFJiWClC28DKkQlHeLem/bP6MJ69dkY9nA88JV57pWzrjFvW44nb+oc0nkXCW
         /LFEn47Ur3lrtkmfO8A3g6N/rzyR2lJTMePbkyT/wDxiV5hLU9IjABq7p287488qtz/s
         9qT/Y4sLNAMz3Bk6Oak+c27bFEDyBSrvnRlul3oR8vdphlAWlZtFEI9qlJJTR4t8s3Wb
         fSzvw+e1MsFt1IZXPvXIY1K68FRb7hY0JZv3IJM6hUNdlMq8zlCkpPnziJ6HYkt5BZwD
         g5lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hnTsoxyaf/hF5ZVsLU/Wj1SHuWXKdJ6AcNaBSIKQ1/s=;
        b=HOfFWXBXdFy5rzFCHz87mAwnhecUGlT81jTrJYBtyRhzdmOIZ5tg+cVYGKciekT1DM
         //j29neWLLXbd7HXBmFAEFkXW/mc6hO8sXhzaq8AFuJYG8O9M0vKtJjjynJM9qePP3ql
         De0aWKdXpYTDDU/JkO9kSWm02xEJ2cQQMSueZPEzNhsxgFtZgD6S3BCJc1E6ojdCIJEq
         Ak7p3aQQBzd4Jp2dNa3nMX1qa3EYslXlQjJlO9OuFptUd3aj4vcWhkf3PcvTy3cOoiz7
         4w9y+bV7yyknbE9iyoyNGBMWgms4+8AucyWnyrrwsa6cUJRh7On2v7aQli1N4GGmSpGi
         EfHA==
X-Gm-Message-State: APjAAAXam4iWqynkXMB6uRdgFlZPMfupYOuJIbP6F+Bu0ahTJnxzUDWf
        eRHqYCSKd19/a0DOU5yByHtQN/4b
X-Google-Smtp-Source: APXvYqzLdjtDQasei/8m65LUcNIXjLg6bpoSEjiWcEOEeK8qrOrq2Nnau2BmizU+uRVRv68jE0KyVg==
X-Received: by 2002:a7b:cbc2:: with SMTP id n2mr12118662wmi.173.1572703279108;
        Sat, 02 Nov 2019 07:01:19 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id b14sm1078487wmj.18.2019.11.02.07.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Nov 2019 07:01:17 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dave Airlie <airlied@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [GIT PULL] drm/tegra: Changes for v5.5-rc1
Date:   Sat,  2 Nov 2019 15:01:16 +0100
Message-Id: <20191102140116.3860545-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Dave,

The following changes since commit 9a42c7c647a9ad0f7ebb147a52eda3dcb7c84292:

  drm/tegra: Move drm_dp_link helpers to Tegra DRM (2019-10-23 18:22:10 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/tegra/linux tags/drm/tegra/for-5.5-rc1

for you to fetch changes up to 84db889e6d827eefc3dde130fec8382d2dcb23ac:

  drm/tegra: Unconditionally select IOMMU_IOVA (2019-11-01 10:49:29 +0100)

Note that this is based on the drm-misc-next-2019-10-24-2 tag which
contains the DP link helper move into the Tegra DRM driver. The diffstat
below shows only the differences since that tag, since the other changes
have already been merged as part of drm-misc-next.

Thierry

----------------------------------------------------------------
drm/tegra: Changes for v5.5-rc1

The bulk of these changes is the addition of DisplayPort support for
Tegra210, Tegra186 and Tegra194. I've been running versions of this for
about three years now, so I'd consider these changes to be pretty
mature. These changes also unify the existing eDP support with the DP
support since the programming is very similar, except for a few steps
that can be easily parameterized.

The rest are a couple of fixes all over the place for minor issues, as
well as some work to support the IOMMU-backed DMA API, which in the end
turned out to also clean up a number of cases where the DMA API was not
being used correctly.

----------------------------------------------------------------
Ben Dooks (Codethink) (1):
      gpu: host1x: Make host1x_cdma_wait_pushbuffer_space() static

Dariusz Marcinkiewicz (1):
      drm/tegra: Use cec_notifier_conn_(un)register()

Thierry Reding (66):
      drm/tegra: sor: Move register programming out of ->init()
      drm/tegra: Fix ordering of cleanup code
      gpu: host1x: Do not limit DMA segment size
      gpu: host1x: Remove gratuitous blank line
      gpu: host1x: Explicitly initialize host1x_info structures
      gpu: host1x: Request channels for clients, not devices
      drm/tegra: Inherit device DMA parameters from host1x
      drm/tegra: Use DRM_DEBUG_DRIVER for driver messages
      drm/tegra: vic: Skip stream ID programming without IOMMU
      drm/tegra: vic: Inherit DMA mask from host1x
      drm/tegra: vic: Use common IOMMU attach/detach code
      drm/tegra: Move IOMMU group into host1x client
      drm/tegra: gem: Rename paddr -> iova
      drm/tegra: gem: Use dma_get_sgtable()
      drm/tegra: gem: Always map SG tables for DMA-BUFs
      drm/tegra: gem: Use sg_alloc_table_from_pages()
      drm/tegra: dpaux: Support monitor hotplugging
      drm/tegra: dpaux: Retry on transfer size mismatch
      drm/tegra: dpaux: Fix crash if VDD supply is absent
      drm/tegra: dpaux: Parameterize CMH, DRVZ and DRVI
      drm/tegra: Add missing kerneldoc for struct drm_dp_link
      drm/tegra: dp: Add drm_dp_link_reset() implementation
      drm/tegra: dp: Track link capabilities alongside settings
      drm/tegra: dp: Turn link capabilities into booleans
      drm/tegra: dp: Probe link using existing parsing helpers
      drm/tegra: dp: Read fast training capability from link
      drm/tegra: dp: Read TPS3 capability from sink
      drm/tegra: dp: Read channel coding capability from sink
      drm/tegra: dp: Read alternate scrambler reset capability from sink
      drm/tegra: dp: Read eDP version from DPCD
      drm/tegra: dp: Read AUX read interval from DPCD
      drm/tegra: dp: Set channel coding on link configuration
      drm/tegra: dp: Enable alternate scrambler reset when supported
      drm/tegra: dp: Add drm_dp_link_choose() helper
      drm/tegra: dp: Add support for eDP link rates
      drm/tegra: dp: Add DisplayPort link training helper
      drm/tegra: sor: Use DP link training helpers
      drm/tegra: sor: Hook up I2C-over-AUX to output
      drm/tegra: sor: Stabilize eDP
      drm/tegra: sor: Filter eDP rates
      drm/tegra: sor: Add DisplayPort support
      drm/tegra: sor: Remove tegra186-sor1 support
      drm/tegra: sor: Use correct SOR index on Tegra210
      drm/tegra: sor: Implement pad clock for all SOR instances
      drm/tegra: sor: Deduplicate connector type detection code
      drm/tegra: sor: Support DisplayPort on Tegra194
      drm/tegra: sor: Unify clock setup for eDP, HDMI and DP
      drm/tegra: sor: Use correct I/O pad for DP
      drm/tegra: sor: Unify eDP and DP support
      drm/tegra: sor: Avoid timeouts on unplug events
      drm/tegra: sor: Extract common audio enabling code
      drm/tegra: sor: Introduce audio enable/disable callbacks
      drm/tegra: Do not use ->load() and ->unload() callbacks
      drm/tegra: Simplify IOMMU group selection
      gpu: host1x: Overhaul host1x_bo_{pin,unpin}() API
      gpu: host1x: Clean up debugfs on removal
      gpu: host1x: Add direction flags to relocations
      gpu: host1x: Allocate gather copy for host1x
      gpu: host1x: Support DMA mapping of buffers
      gpu: host1x: Set DMA mask based on IOMMU setup
      drm/tegra: Remove memory allocation from Falcon library
      drm/tegra: falcon: Clarify address usage
      drm/tegra: Support DMA API for display controllers
      drm/tegra: Optionally attach clients to the IOMMU
      gpu: host1x: Unconditionally select IOMMU_IOVA
      drm/tegra: Unconditionally select IOMMU_IOVA

 drivers/gpu/drm/tegra/Kconfig  |    2 +-
 drivers/gpu/drm/tegra/dc.c     |   30 +-
 drivers/gpu/drm/tegra/dc.h     |    2 -
 drivers/gpu/drm/tegra/dp.c     |  765 +++++++++++++++++-
 drivers/gpu/drm/tegra/dp.h     |  157 +++-
 drivers/gpu/drm/tegra/dpaux.c  |  207 +++--
 drivers/gpu/drm/tegra/drm.c    |  417 +++++-----
 drivers/gpu/drm/tegra/drm.h    |   13 +-
 drivers/gpu/drm/tegra/falcon.c |   64 +-
 drivers/gpu/drm/tegra/falcon.h |   16 +-
 drivers/gpu/drm/tegra/fb.c     |    4 +-
 drivers/gpu/drm/tegra/gem.c    |   81 +-
 drivers/gpu/drm/tegra/gem.h    |    2 +-
 drivers/gpu/drm/tegra/gr2d.c   |   12 +-
 drivers/gpu/drm/tegra/gr3d.c   |   12 +-
 drivers/gpu/drm/tegra/hub.c    |    6 +-
 drivers/gpu/drm/tegra/output.c |   28 +-
 drivers/gpu/drm/tegra/plane.c  |  104 +++
 drivers/gpu/drm/tegra/plane.h  |    8 +
 drivers/gpu/drm/tegra/sor.c    | 1703 +++++++++++++++++++++++++---------------
 drivers/gpu/drm/tegra/sor.h    |    3 +
 drivers/gpu/drm/tegra/vic.c    |  138 ++--
 drivers/gpu/host1x/Kconfig     |    2 +-
 drivers/gpu/host1x/bus.c       |    2 +-
 drivers/gpu/host1x/cdma.c      |    6 +-
 drivers/gpu/host1x/channel.c   |   13 +-
 drivers/gpu/host1x/channel.h   |    1 +
 drivers/gpu/host1x/dev.c       |  236 ++++--
 drivers/gpu/host1x/dev.h       |    3 +
 drivers/gpu/host1x/intr.c      |    1 -
 drivers/gpu/host1x/job.c       |   91 ++-
 drivers/gpu/host1x/job.h       |    4 +
 include/linux/host1x.h         |   26 +-
 33 files changed, 2873 insertions(+), 1286 deletions(-)

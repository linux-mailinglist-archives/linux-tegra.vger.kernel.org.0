Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F7A16D96DC
	for <lists+linux-tegra@lfdr.de>; Thu,  6 Apr 2023 14:14:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229656AbjDFMOJ (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 6 Apr 2023 08:14:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230079AbjDFMOI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 6 Apr 2023 08:14:08 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEA273C0B
        for <linux-tegra@vger.kernel.org>; Thu,  6 Apr 2023 05:14:06 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id n21so857410ejz.4
        for <linux-tegra@vger.kernel.org>; Thu, 06 Apr 2023 05:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680783245;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t0cKGNr7aS2PBD4dskbuQlYyxnKlXAeKQMmfFjR+x8U=;
        b=XFPe72ZR0w8dUcNuFlrPWAXiEsSjall0aUnMemRVcU1D1KX66YG05mnVuyAxQLcX9X
         ON9i5fQVCMh8ifamEuBXu1AtbmzXAIE6/2WuVz1kOU7S61lMuF36b2IsyQtdEE1uvEGW
         JfeZgipSsnWiJpI1wyKtv0UjJXM6y3/SuSR04aeAeM6PYgWXippAFfZkAUZ0sxt6gz5g
         nZqVbHRLLyaPUwlrTnjyRvIomywvLnhnZSa4dsC0ZJOa/CBlj8isODoyvzF8OWP3cMR9
         5R8v/BekEFzj/IDH8VCdWDp1mrZuuooDmNhdpIG7zQhJ86+mgI2xGpdlykfpnSiTM6TJ
         zP8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680783245;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t0cKGNr7aS2PBD4dskbuQlYyxnKlXAeKQMmfFjR+x8U=;
        b=lljg3nq+ABRKEuH6ZgiETLR1b6GEZMsT6EiAl1RAwNVRsTfB+qD4C0ApzTL9Lfl+yi
         FwnPWvPCHrC/u/6LjYPFetPwOhOzkrNkS2sQoFNQxiqM9qNoU98XwmAho9PFF9gnuEnr
         FaJNC/p9N4QalSpTmeGl6gWVLqS8YJanFAxz4Z8Di4bbYv6I0RO2gmw/dI2stH3lHvr5
         Pzl/PxQAsQ6RB+8dErrGXc4LCsaxR+jH9kT4ehD7Cncc/4rCThEBQlnLvjwMS6cAMcuQ
         K1bEdRVWyq89gDGtchLBiJqwpEXZAv9UMZO+zW2O+t2/ATQCfsuUBYtiS7KqZZa7q7n4
         jVNw==
X-Gm-Message-State: AAQBX9dXrWkhbTMaYOhyrf5FRmyKyl83ARliefI8dBjnQ1an5YGbhmL0
        ZItMx+kQShe3hKINs98kQ18=
X-Google-Smtp-Source: AKy350bn7S7LsNXLrOK6NW2S8RlhndG3xDpjK9WwxpESScyCWY60jcm3xVTweEw+/iP0DUq18RXOKg==
X-Received: by 2002:a17:906:3f86:b0:929:e5a8:63f7 with SMTP id b6-20020a1709063f8600b00929e5a863f7mr4863887ejj.28.1680783245167;
        Thu, 06 Apr 2023 05:14:05 -0700 (PDT)
Received: from localhost (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id lf11-20020a170907174b00b0092b546b57casm726124ejc.195.2023.04.06.05.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 05:14:04 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [GIT PULL] drm/tegra: Changes for v6.4-rc1
Date:   Thu,  6 Apr 2023 14:14:04 +0200
Message-Id: <20230406121404.967704-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Dave, Daniel,

The following changes since commit e8d018dd0257f744ca50a729e3d042cf2ec9da65:

  Linux 6.3-rc3 (2023-03-19 13:27:55 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/tegra.git tags/drm/tegra/for-6.4-rc1

for you to fetch changes up to 2429b3c529da29d4277d519bd66d034842dcd70c:

  drm/tegra: Avoid potential 32-bit integer overflow (2023-04-06 14:02:33 +0200)

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Changes for v6.4-rc1

The majority of this is minor cleanups and fixes. Other than those, this
contains Uwe's conversion to the new driver remove callback and Thomas'
fbdev DRM client conversion. The driver can now also be built on other
architectures to easy compile coverage.

Finally, this adds Mikko as a second maintainer for the driver. As a
next step we also want Tegra DRM to move into drm-misc to streamline the
maintenance process.

----------------------------------------------------------------
Cai Huoqing (3):
      drm/tegra: sor: Make use of the helper function dev_err_probe()
      drm/tegra: dsi: Make use of the helper function dev_err_probe()
      drm/tegra: plane: Improve use of dev_err_probe()

Christian König (2):
      drm/tegra: Allow compile test on !ARM v2
      drm/tegra: Fix another missing include

Deepak R Varma (1):
      drm/tegra: sor: Remove redundant error logging

Diogo Ivo (1):
      drm/tegra: dsi: Clear enable register if powered by bootloader

Lee Jones (1):
      drm/tegra: dc: Remove set but unused variable 'state'

Mikko Perttunen (1):
      gpu: host1x: Don't rely on dma_fence_wait_timeout return value

Nur Hussein (1):
      drm/tegra: Avoid potential 32-bit integer overflow

Thierry Reding (1):
      MAINTAINERS: Add Mikko as backup maintainer for Tegra DRM

Thomas Zimmermann (7):
      drm/tegra: Include <linux/of.h>
      drm/tegra: Include <linux/i2c.h>
      drm/tegra: Removed fb from struct tegra_fbdev
      drm/tegra: Remove struct tegra_fbdev
      drm/tegra: Hide fbdev support behind config option
      drm/tegra: Initialize fbdev DRM client
      drm/tegra: Implement fbdev emulation as in-kernel client

Uwe Kleine-König (12):
      gpu: host1x: Make host1x_client_unregister() return void
      drm/tegra: rgb: Make tegra_dc_rgb_remove() return void
      drm/tegra: dc: Convert to platform remove callback returning void
      drm/tegra: dpaux: Convert to platform remove callback returning void
      drm/tegra: dsi: Convert to platform remove callback returning void
      drm/tegra: gr2d: Convert to platform remove callback returning void
      drm/tegra: gr3d: Convert to platform remove callback returning void
      drm/tegra: hdmi: Convert to platform remove callback returning void
      drm/tegra: hub: Convert to platform remove callback returning void
      drm/tegra: nvdec: Convert to platform remove callback returning void
      drm/tegra: sor: Convert to platform remove callback returning void
      drm/tegra: vic: Convert to platform remove callback returning void

Yang Yingliang (2):
      gpu: host1x: Fix potential double free if IOMMU is disabled
      gpu: host1x: Fix memory leak of device names

Ye Xingchen (1):
      gpu: host1x: mipi: Use devm_platform_get_and_ioremap_resource()

 MAINTAINERS                             |   1 +
 drivers/gpu/drm/tegra/Kconfig           |   2 +-
 drivers/gpu/drm/tegra/Makefile          |   2 +
 drivers/gpu/drm/tegra/dc.c              |  22 +--
 drivers/gpu/drm/tegra/dc.h              |   2 +-
 drivers/gpu/drm/tegra/dpaux.c           |   6 +-
 drivers/gpu/drm/tegra/drm.c             |  23 +--
 drivers/gpu/drm/tegra/drm.h             |  27 ++--
 drivers/gpu/drm/tegra/dsi.c             |  51 ++++---
 drivers/gpu/drm/tegra/fb.c              | 242 +-------------------------------
 drivers/gpu/drm/tegra/fbdev.c           | 241 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/tegra/gem.c             |   1 +
 drivers/gpu/drm/tegra/gr2d.c            |  14 +-
 drivers/gpu/drm/tegra/gr3d.c            |  14 +-
 drivers/gpu/drm/tegra/hdmi.c            |  14 +-
 drivers/gpu/drm/tegra/hub.c             |  13 +-
 drivers/gpu/drm/tegra/nvdec.c           |  14 +-
 drivers/gpu/drm/tegra/output.c          |   3 +
 drivers/gpu/drm/tegra/plane.c           |  16 +--
 drivers/gpu/drm/tegra/rgb.c             |   7 +-
 drivers/gpu/drm/tegra/sor.c             |  44 ++----
 drivers/gpu/drm/tegra/vic.c             |  14 +-
 drivers/gpu/host1x/Kconfig              |   2 +-
 drivers/gpu/host1x/bus.c                |   6 +-
 drivers/gpu/host1x/context.c            |  24 ++--
 drivers/gpu/host1x/mipi.c               |   4 +-
 drivers/gpu/host1x/syncpt.c             |   8 +-
 drivers/staging/media/tegra-video/csi.c |   8 +-
 drivers/staging/media/tegra-video/vi.c  |   8 +-
 include/linux/host1x.h                  |   2 +-
 30 files changed, 370 insertions(+), 465 deletions(-)
 create mode 100644 drivers/gpu/drm/tegra/fbdev.c

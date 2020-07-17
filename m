Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70127224077
	for <lists+linux-tegra@lfdr.de>; Fri, 17 Jul 2020 18:20:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726401AbgGQQUR (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 17 Jul 2020 12:20:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726351AbgGQQUR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 17 Jul 2020 12:20:17 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF990C0619D2
        for <linux-tegra@vger.kernel.org>; Fri, 17 Jul 2020 09:20:14 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id b15so8164374edy.7
        for <linux-tegra@vger.kernel.org>; Fri, 17 Jul 2020 09:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=efN2uKFDZXpgLfoJY/eErs8o7zF1deEJZBO5IyFo8NI=;
        b=obHc5zncS9Emc9zEPipZp4zFxj075sw3gCnd3XWRkjNYU8Or6dIAnATvL9tkWkgI5B
         Bz9EU30iXOChRiugiFumvfPJj1q4aHv9sY/vZ8zphajYisKV2jlcrRMFJP4MmudCZDcQ
         xrthHedKJ+6C/K/6UbV00K8B2R2/8NX5aIaITRRcI9R7zgCfLBvU8hu43PVc0xGdBZwN
         C7OONg4T9CoC9rDfe/qw14VVxd0XSrorcrai9yXbofyIVSy954ByeJ4uDULt8QGaVq4V
         WVx6uKUjFrNAsX1hqANlAAYXH1tpDD+sqZRXJxdDnCJ9dx0Gt4Ksau/LYGRix5DEhSfS
         4CFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=efN2uKFDZXpgLfoJY/eErs8o7zF1deEJZBO5IyFo8NI=;
        b=uIrvezYjHAo2C3Bap3XYK0r3wBXl6MG9q9TOpErooGVREN58bvTS8BVsRc0L4B2zzj
         A2GsVHRQZSwmiWYpydojAlsYGJ2SLA5ZiywuyF+5tBtMHt+TbWmQ2wABTIg4PyVCcW0V
         BV37NHk7kA7Rqpduy6AVCI0rqtidb9Umx5XAZSlMLd4fjTjvkMufbwdEuD1tn6zFsSPn
         5WYD1eMrk0SwbXGz0fVVJCzt2gsAU6MtWE1/u8IpvNVFMFF3kOxaEHlQtKFMZyu1Ebtf
         eihHCKB67UWL0e8qy3VXgi42qXvZgSzcWviVr0VgwObsgAUafE0ErEdvU7BM5PPtGUPH
         4iqA==
X-Gm-Message-State: AOAM533qkz92nXS5QEzZ0gTzbjP3VeNMzJ2jmd8k9x2Vwntp+62o9VBg
        JHooNsy1vq5viv2F4RCvrky8j4cy
X-Google-Smtp-Source: ABdhPJwreqcmknRZAA/ayM7AnZu4AwEMQTT7/kF3fAyRxWR/szU6ZexOQo+1mfWqVxlR+9L5TrSH8g==
X-Received: by 2002:a05:6402:3138:: with SMTP id dd24mr10148075edb.118.1595002813386;
        Fri, 17 Jul 2020 09:20:13 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id m13sm8248902ejc.1.2020.07.17.09.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 09:20:12 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dave Airlie <airlied@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [GIT PULL] drm/tegra: Changes for v5.9-rc1
Date:   Fri, 17 Jul 2020 18:20:11 +0200
Message-Id: <20200717162011.1661788-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Dave,

The following changes since commit fce3a51d9b31312aa12ecb72ffabfc4c7b40bdc6:

  drm/tegra: Add zpos property for cursor planes (2020-06-16 19:03:25 +0200)

are available in the Git repository at:

  ssh://git.freedesktop.org/git/tegra/linux.git tags/drm/tegra/for-5.9-rc1

for you to fetch changes up to 4fba6d22ca9ad28b8871d763b35a4da2e1ca272e:

  drm/tegra: plane: Support 180° rotation (2020-07-17 16:06:17 +0200)

Note that I've supplied the ssh:// URL above as opposed to the git://
URL that I usually use. The latter has been somewhat spotty for me. Let
me know if this is causing any issues.

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Changes for v5.9-rc1

This set of patches contains a few preparatory patches to enable video
capture support from external camera modules. This is a dependency for
the V4L2 driver patches that will likely be merged in v5.9 or v5.10.

On top of that there are a couple of fixes across the board as well as
some improvements.

From a feature point of view this also adds support for horizontal
reflection and 180° rotation of planes.

----------------------------------------------------------------
Dmitry Osipenko (9):
      gpu: host1x: Optimize BOs usage when firewall is enabled
      gpu: host1x: Put gather's BO on pinning error
      gpu: host1x: debug: Fix multiple channels emitting messages simultaneously
      gpu: host1x: debug: Dump push buffer state
      drm/tegra: gr3d: Assert reset before power-gating
      drm/tegra: gr2d: Add tiled PATBASE address register
      drm/tegra: plane: Rename bottom_up to reflect_y
      drm/tegra: plane: Support horizontal reflection
      drm/tegra: plane: Support 180° rotation

Sowjanya Komatineni (3):
      gpu: host1x: mipi: Update tegra_mipi_request() to be node based
      gpu: host1x: mipi: Use readl_relaxed_poll_timeout() in tegra_mipi_wait()
      gpu: host1x: mipi: Split tegra_mipi_calibrate() and tegra_mipi_wait()

Tang Bin (1):
      drm/tegra: dc: Omit superfluous error message in tegra_dc_probe()

Thierry Reding (1):
      drm/tegra: sor: Use correct power supply names for HDMI

 drivers/gpu/drm/tegra/dc.c       | 50 ++++++++++++++++++++++++++++++----------
 drivers/gpu/drm/tegra/dc.h       |  3 ++-
 drivers/gpu/drm/tegra/dsi.c      |  9 ++++++--
 drivers/gpu/drm/tegra/gr2d.c     |  1 +
 drivers/gpu/drm/tegra/gr2d.h     |  1 +
 drivers/gpu/drm/tegra/gr3d.c     |  2 ++
 drivers/gpu/drm/tegra/plane.c    |  3 ++-
 drivers/gpu/drm/tegra/plane.h    |  3 ++-
 drivers/gpu/drm/tegra/sor.c      |  4 ++--
 drivers/gpu/host1x/debug.c       |  4 ++++
 drivers/gpu/host1x/hw/debug_hw.c |  6 +++++
 drivers/gpu/host1x/job.c         | 27 ++++++++++++++++------
 drivers/gpu/host1x/mipi.c        | 37 ++++++++++++++++-------------
 include/linux/host1x.h           |  4 +++-
 14 files changed, 111 insertions(+), 43 deletions(-)

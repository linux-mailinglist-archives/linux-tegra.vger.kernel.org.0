Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6AA93137AC0
	for <lists+linux-tegra@lfdr.de>; Sat, 11 Jan 2020 01:48:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727755AbgAKAsj (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 10 Jan 2020 19:48:39 -0500
Received: from mail-wm1-f49.google.com ([209.85.128.49]:36509 "EHLO
        mail-wm1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727732AbgAKAsj (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 10 Jan 2020 19:48:39 -0500
Received: by mail-wm1-f49.google.com with SMTP id p17so3830271wma.1
        for <linux-tegra@vger.kernel.org>; Fri, 10 Jan 2020 16:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OcMhrvj/gjIvMQAc5+infCgbhuX8evOJ6JvKbRK/FOg=;
        b=PJBHT0X8tCYaS3KRSjgP43ajcEMx3HxIl+8Dx2LBuUifw28J2G8411DOL9gh6u5vhL
         Mii57wFwge16LvOz2V1gZoUg8XCDiCyQ34KHUge+ZexQFi8zfk8WpSQjlWoNz4T6EncJ
         i44Da532aChdLGWRr9OnuSfj8JIP5o3r4gsKclxsyfLiY/J1+DTHr3wheNrL2QXpdi3W
         xkFL4jK3RvuFMjKiBikNvoUt4Ru7kkdkV18qZV0Aquum+G8RkntFkm6mikKs/HMtZ0uA
         n1GkG+29898Rpy+zT2wOHYG8M7cKQtWFtqQ2MNfORERBr2HV51A4W16P66R1QSgD+l5L
         xNUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OcMhrvj/gjIvMQAc5+infCgbhuX8evOJ6JvKbRK/FOg=;
        b=da/lvT36rsfyzdKVHh1HP8JQ8MJ+l7QPUY9+/TBE4FYeV9CiWkRSEsbfnhC6EOegmy
         ZW2FalPcBMXDyGrhhJL0Cek4FaQvQqXx0H5bMYmUkbZL548F3Tj5QdbAeP0zE5e1aFBT
         1PHm628VgHXI09d/3OOWk13ot1cHZ+gto0uaGEvAdHa9ZgsjJm5y0+KU+XDtvutEwksG
         qPr3AeBb4e9ML0y63mhK4G0SW/+axskyarDEUVISSxcEYlt3OXNXr/XExgro38Bjd/Fh
         Ud9OVUi+DnUULXWiE+jXUSDm3BNLgGsjHl7voCsGewpr/6I6MjwPmRy4BkQH50yZF+M9
         nWBQ==
X-Gm-Message-State: APjAAAWJinJ+LYg4DDeCYWeeGlLc5vI0XNsTxz1P5hB49UjgAaelOjhu
        r8CL6XZGQ2N+sTyjuD1Kq6I=
X-Google-Smtp-Source: APXvYqxr7PY+wprKAWhRPJBmHhPjnjtaxOZFEgbIzbdUN+3vXc6aKIilncMjIhQtFgqfU6Q/glMwrg==
X-Received: by 2002:a7b:c764:: with SMTP id x4mr7233451wmk.116.1578703717204;
        Fri, 10 Jan 2020 16:48:37 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
        by smtp.gmail.com with ESMTPSA id w19sm4114350wmc.22.2020.01.10.16.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2020 16:48:36 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dave Airlie <airlied@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [GIT PULL] drm/tegra: Changes for v5.6-rc1
Date:   Sat, 11 Jan 2020 01:48:35 +0100
Message-Id: <20200111004835.2412858-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Dave,

The following changes since commit e42617b825f8073569da76dc4510bfa019b1c35a:

  Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/tegra/linux tags/drm/tegra/for-5.6-rc1

for you to fetch changes up to 033ccdb7f6b11701623507339646013b4ce389d3:

  gpu: host1x: Remove dev_err() on platform_get_irq() failure (2020-01-10 17:05:12 +0100)

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Changes for v5.6-rc1

This contains a small set of mostly fixes and some minor improvements.

----------------------------------------------------------------
Arnd Bergmann (1):
      drm/tegra: sor: Mark PM functions as __maybe_unused

Thierry Reding (3):
      gpu: host1x: Rename "parent" to "host"
      drm/tegra: Do not implement runtime PM
      drm/tegra: output: Implement system suspend/resume

YueHaibing (1):
      gpu: host1x: Remove dev_err() on platform_get_irq() failure

 drivers/gpu/drm/tegra/dc.c     | 147 +++++++++++++++++-------------
 drivers/gpu/drm/tegra/dpaux.c  |   2 +-
 drivers/gpu/drm/tegra/drm.c    |   4 +-
 drivers/gpu/drm/tegra/drm.h    |   2 +
 drivers/gpu/drm/tegra/dsi.c    | 177 ++++++++++++++++++++----------------
 drivers/gpu/drm/tegra/gr2d.c   |   4 +-
 drivers/gpu/drm/tegra/gr3d.c   |   4 +-
 drivers/gpu/drm/tegra/hdmi.c   | 118 +++++++++++++-----------
 drivers/gpu/drm/tegra/hub.c    | 198 ++++++++++++++++++++++++-----------------
 drivers/gpu/drm/tegra/hub.h    |   2 +-
 drivers/gpu/drm/tegra/output.c |  16 ++++
 drivers/gpu/drm/tegra/sor.c    | 163 ++++++++++++++++++++-------------
 drivers/gpu/drm/tegra/vic.c    |   8 +-
 drivers/gpu/host1x/bus.c       |  79 +++++++++++++++-
 drivers/gpu/host1x/dev.c       |   4 +-
 drivers/gpu/host1x/syncpt.c    |   2 +-
 include/linux/host1x.h         |  15 +++-
 17 files changed, 593 insertions(+), 352 deletions(-)

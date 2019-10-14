Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0CE1D62F5
	for <lists+linux-tegra@lfdr.de>; Mon, 14 Oct 2019 14:50:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731092AbfJNMuy (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 14 Oct 2019 08:50:54 -0400
Received: from mail-wm1-f53.google.com ([209.85.128.53]:55753 "EHLO
        mail-wm1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731035AbfJNMux (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 14 Oct 2019 08:50:53 -0400
Received: by mail-wm1-f53.google.com with SMTP id a6so17127119wma.5
        for <linux-tegra@vger.kernel.org>; Mon, 14 Oct 2019 05:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GgdWGOJECNveIsaNtl+AyHGRoV+8tWMLO9eybpPm16w=;
        b=PHpvE6d0ajOD2Um5j6df0769ekrMEuYnuTcINS3aTy533i4MU4InV2PCxLk9kTiVw1
         4OPElqvhOzUi+dYLcqtdprl/joliAs/TRqOb+lYjGVjEv6uSk//b0sM9oClnwjnwyGps
         SqU9lagnsIn2zfoSqyqmvwP0aOSfukjRTC7jd1ych2r3hKiJFjHi0G1AUP4rD1Ao+KM7
         6WGygZuN9/s6/qHmLPZLuBTYVy6IGcAq0RQ60AF3pme0XOiR0OaSr/cdC76P7n7q3lLG
         noVkj0HYhJdMG3gKe2cISONO3uQP+PjJ9/oafYEC7Kub0Eeo51OeFTK8cws3Mi5fpJtD
         gQlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GgdWGOJECNveIsaNtl+AyHGRoV+8tWMLO9eybpPm16w=;
        b=UabhRWB9wi5ZSrD289f7VDJS7McZ7r+h8vEBnuYyr7WxkkkSlfPDBy4phsEH/BwXPn
         8uU+gYB0TVnlHo91YVmlpUV+vaEQXetqGVBINv5QXIQLlozEipkBf3QkL2KdD7A0Ihrl
         EvOwcQxW1vzGIHKJNuG6yav6DT6cWBVKH4AzpadmYnuFO/r+JZJxHY7CBEvJg6mbktCO
         StbL69MBotuWCBRHcb+01BSGoOlACly+Sl2mFX9PAbBcPlN9MH72lTYMY2RlwajupOpO
         6VDhWYLjpAvyFAyomX/gjXu8sO00w2fwq7Up6SrnTGvydA6xPPejqn8p0AqEb0n0MGG0
         8U5w==
X-Gm-Message-State: APjAAAWVq8bdxm8FOjqRLCtCp4uMm+B0SfiC8tMcvfOYjQBYGHmZIx6l
        MB3nGmY5nRHbvv68Dm3HQWjFcEzp
X-Google-Smtp-Source: APXvYqxWtXcBjxk3th2tVx8wtmCQ0UYIsKyvBM0qSL2J6dcXMRSGsrHUJ0VF50xtg3lnR/z27H95lA==
X-Received: by 2002:a05:600c:34b:: with SMTP id u11mr14412599wmd.172.1571057451484;
        Mon, 14 Oct 2019 05:50:51 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id s1sm26157158wrg.80.2019.10.14.05.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2019 05:50:50 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 00/14] drm/tegra: Miscellaneous cleanups
Date:   Mon, 14 Oct 2019 14:50:35 +0200
Message-Id: <20191014125049.425101-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Some cleanups and minor improvements, nothing exciting here. However,
these prepare the way for some larger rework that will convert explicit
IOMMU API usage to the DMA API, which optionally can be backed by an
IOMMU.

Thierry

Thierry Reding (14):
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

 drivers/gpu/drm/tegra/dc.c   | 24 +++++++++++------
 drivers/gpu/drm/tegra/dc.h   |  2 --
 drivers/gpu/drm/tegra/drm.c  | 30 ++++++++++-----------
 drivers/gpu/drm/tegra/drm.h  |  6 ++---
 drivers/gpu/drm/tegra/fb.c   |  4 +--
 drivers/gpu/drm/tegra/gem.c  | 37 +++++++++++---------------
 drivers/gpu/drm/tegra/gem.h  |  2 +-
 drivers/gpu/drm/tegra/gr2d.c | 12 ++++-----
 drivers/gpu/drm/tegra/gr3d.c | 12 ++++-----
 drivers/gpu/drm/tegra/hub.c  |  2 +-
 drivers/gpu/drm/tegra/vic.c  | 51 ++++++++++++++++++++----------------
 drivers/gpu/host1x/bus.c     |  2 +-
 drivers/gpu/host1x/channel.c | 13 ++++-----
 drivers/gpu/host1x/channel.h |  1 +
 drivers/gpu/host1x/dev.c     | 12 +++++++++
 drivers/gpu/host1x/intr.c    |  1 -
 include/linux/host1x.h       |  4 ++-
 17 files changed, 114 insertions(+), 101 deletions(-)

-- 
2.23.0


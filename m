Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5291F3A29BC
	for <lists+linux-tegra@lfdr.de>; Thu, 10 Jun 2021 13:05:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230166AbhFJLHR (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 10 Jun 2021 07:07:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230060AbhFJLHR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 10 Jun 2021 07:07:17 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D7EEC0617A8
        for <linux-tegra@vger.kernel.org>; Thu, 10 Jun 2021 04:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
        :Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=T3L/NWYT7nlzi5DObKDBt5SbzbU01NAg2jJfu5U4kBY=; b=Pm9vXHL9hPvVO0xfO50O6PAaRR
        BbFMP5HEzExdv09WrLfXbug5jCCvKb59r0g6aGXg/k5LGuha2bR7ITNq4wEg5HTOWFD9xtce0qkjD
        5GaVfKgWeF5727EStp7HFngBeSMqJJZ3NrydgUtf1igmgBYtNKIVCHYmJWvel7nJl6anQ7K5RVyXu
        lpCKzTuMR3VhNRkAbIIEwytZJFeU34n1lnwHM3/Ehwe+fXHVt3q9DdRWmzztSqHbpjHauo4quS3DJ
        ecoxNC1lUoVyYZP4uRexTtzwwkcu+1RIwu1i5k3upFVu+OLf4wuOCWcRa++4YhsI6b7DXVNmT6CgI
        EMl2JdXA==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <mperttunen@nvidia.com>)
        id 1lrIUs-0001s7-KV; Thu, 10 Jun 2021 14:05:14 +0300
From:   Mikko Perttunen <mperttunen@nvidia.com>
To:     thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com,
        airlied@linux.ie, daniel@ffwll.ch
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH v7 00/15] TegraDRM UAPI
Date:   Thu, 10 Jun 2021 14:04:41 +0300
Message-Id: <20210610110456.3692391-1-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: mperttunen@nvidia.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi all,

here's the seventh revision of the TegraDRM UAPI proposal.
Only some small changes to v6 here to fix things on older
Tegras with certain configuration combinations, as well as
rebasing to latest linux-next.

The following pieces of userspace have been updated to support
this revision of the UAPI (unchanged from v6):

* vaapi-tegra-driver - https://github.com/cyndis/vaapi-tegra-driver
  Experimental support for MPEG2 and H264 decoding on T210, T186
  and T194.

* xf86-video-opentegra - https://github.com/grate-driver/xf86-video-opentegra
  X11 userspace acceleration driver for Tegra20, Tegra30, and Tegra114.

* grate - https://github.com/grate-driver/grate
  3D rendering testbed for Tegra20, Tegra30, and Tegra114

The series can be also found in
https://github.com/cyndis/linux/commits/work/tegradrm-v7.

Older versions:
v1: https://www.spinics.net/lists/linux-tegra/msg51000.html
v2: https://www.spinics.net/lists/linux-tegra/msg53061.html
v3: https://www.spinics.net/lists/linux-tegra/msg54370.html
v4: https://www.spinics.net/lists/dri-devel/msg279897.html
v5: https://www.spinics.net/lists/linux-tegra/msg56353.html
v6: https://www.spinics.net/lists/linux-tegra/msg58950.html

Thank you,
Mikko

Mikko Perttunen (15):
  gpu: host1x: Add DMA fence implementation
  gpu: host1x: Add no-recovery mode
  gpu: host1x: Add job release callback
  gpu: host1x: Add support for syncpoint waits in CDMA pushbuffer
  gpu: host1x: Add option to skip firewall for a job
  drm/tegra: Extract tegra_gem_lookup
  drm/tegra: Add new UAPI to header
  drm/tegra: Boot VIC during runtime PM resume
  drm/tegra: Allocate per-engine channel in core code
  drm/tegra: Implement new UAPI
  drm/tegra: Implement syncpoint management UAPI
  drm/tegra: Implement syncpoint wait UAPI
  drm/tegra: Implement job submission part of new UAPI
  drm/tegra: Add job firewall
  drm/tegra: Bump driver version

 drivers/gpu/drm/tegra/Makefile             |   4 +
 drivers/gpu/drm/tegra/drm.c                |  84 ++--
 drivers/gpu/drm/tegra/drm.h                |  12 +
 drivers/gpu/drm/tegra/firewall.c           | 254 ++++++++++
 drivers/gpu/drm/tegra/gather_bo.c          |  82 +++
 drivers/gpu/drm/tegra/gather_bo.h          |  24 +
 drivers/gpu/drm/tegra/gem.c                |  13 +
 drivers/gpu/drm/tegra/gem.h                |   2 +
 drivers/gpu/drm/tegra/submit.c             | 557 +++++++++++++++++++++
 drivers/gpu/drm/tegra/submit.h             |  21 +
 drivers/gpu/drm/tegra/uapi.c               | 337 +++++++++++++
 drivers/gpu/drm/tegra/uapi.h               |  58 +++
 drivers/gpu/drm/tegra/vic.c                | 112 ++---
 drivers/gpu/host1x/Makefile                |   1 +
 drivers/gpu/host1x/cdma.c                  |  58 ++-
 drivers/gpu/host1x/fence.c                 | 184 +++++++
 drivers/gpu/host1x/fence.h                 |  13 +
 drivers/gpu/host1x/hw/channel_hw.c         |  87 +++-
 drivers/gpu/host1x/hw/debug_hw.c           |   9 +-
 drivers/gpu/host1x/hw/hw_host1x02_uclass.h |  12 +
 drivers/gpu/host1x/hw/hw_host1x04_uclass.h |  12 +
 drivers/gpu/host1x/hw/hw_host1x05_uclass.h |  12 +
 drivers/gpu/host1x/hw/hw_host1x06_uclass.h |  12 +
 drivers/gpu/host1x/hw/hw_host1x07_uclass.h |  12 +
 drivers/gpu/host1x/intr.c                  |   9 +
 drivers/gpu/host1x/intr.h                  |   2 +
 drivers/gpu/host1x/job.c                   |  98 +++-
 drivers/gpu/host1x/job.h                   |  16 +
 drivers/gpu/host1x/syncpt.c                |   2 +
 drivers/gpu/host1x/syncpt.h                |  12 +
 include/linux/host1x.h                     |  28 +-
 include/uapi/drm/tegra_drm.h               | 414 ++++++++++++++-
 32 files changed, 2374 insertions(+), 179 deletions(-)
 create mode 100644 drivers/gpu/drm/tegra/firewall.c
 create mode 100644 drivers/gpu/drm/tegra/gather_bo.c
 create mode 100644 drivers/gpu/drm/tegra/gather_bo.h
 create mode 100644 drivers/gpu/drm/tegra/submit.c
 create mode 100644 drivers/gpu/drm/tegra/submit.h
 create mode 100644 drivers/gpu/drm/tegra/uapi.c
 create mode 100644 drivers/gpu/drm/tegra/uapi.h
 create mode 100644 drivers/gpu/host1x/fence.c
 create mode 100644 drivers/gpu/host1x/fence.h

-- 
2.30.1


Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA2A72F12D9
	for <lists+linux-tegra@lfdr.de>; Mon, 11 Jan 2021 14:01:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727525AbhAKNBL (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 11 Jan 2021 08:01:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727614AbhAKNBL (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 11 Jan 2021 08:01:11 -0500
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C347C061794
        for <linux-tegra@vger.kernel.org>; Mon, 11 Jan 2021 05:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
        :Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=KA5bafOZeUkARKG6BTqpHwrlD6Qf0zeZPOzz1gTVYio=; b=u0N3NBOicVPJnt66FT3yzIzvkw
        XRLSHUJWAX4Knw6/g7nMGaJu2SB564J12MyeUvbaP7ZQ78hQhofRiAcVYs2baX5Eft7Wo3E08IJ8m
        uLZTvbx0HvRgJMv8gw7TdWLqe7qSgtILB7jxPg7sz8yZ+W5TYv0F6K3btseH03YgttCwLvHrcn6q4
        AqeqDAWH1oU/egJaEjio0NgJ1HQln0mXpjnXO6sHnJkZfbNNesYc8ZJXqZ9Ig69EcwnW6JUcoaKGP
        IOYc32/rEvDwlL+dxflXO1Dk8Fs6J6zGA09G4IFEheNee1k1UbGnYEMFn0C/a2lWZN6VwlkigXigd
        20K/CKCQ==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <mperttunen@nvidia.com>)
        id 1kywo6-0002tl-5u; Mon, 11 Jan 2021 15:00:26 +0200
From:   Mikko Perttunen <mperttunen@nvidia.com>
To:     thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com,
        airlied@linux.ie, daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com,
        Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH v5 00/21] Host1x/TegraDRM UAPI
Date:   Mon, 11 Jan 2021 14:59:58 +0200
Message-Id: <20210111130019.3515669-1-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: mperttunen@nvidia.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi all,

here's the fifth revision of the Host1x/TegraDRM UAPI proposal,
containing primarily small bug fixes. It has also been
rebased on top of recent linux-next.

vaapi-tegra-driver has been updated to support the new UAPI
as well as Tegra186:

  https://github.com/cyndis/vaapi-tegra-driver

The `putsurface` program has been tested to work.

The test suite for the new UAPI is available at
https://github.com/cyndis/uapi-test

The series can be also found in
https://github.com/cyndis/linux/commits/work/host1x-uapi-v5.

Older versions:
v1: https://www.spinics.net/lists/linux-tegra/msg51000.html
v2: https://www.spinics.net/lists/linux-tegra/msg53061.html
v3: https://www.spinics.net/lists/linux-tegra/msg54370.html
v4: https://www.spinics.net/lists/dri-devel/msg279897.html

Thank you,
Mikko

Mikko Perttunen (21):
  gpu: host1x: Use different lock classes for each client
  gpu: host1x: Allow syncpoints without associated client
  gpu: host1x: Show number of pending waiters in debugfs
  gpu: host1x: Remove cancelled waiters immediately
  gpu: host1x: Use HW-equivalent syncpoint expiration check
  gpu: host1x: Cleanup and refcounting for syncpoints
  gpu: host1x: Introduce UAPI header
  gpu: host1x: Implement /dev/host1x device node
  gpu: host1x: DMA fences and userspace fence creation
  gpu: host1x: Add no-recovery mode
  gpu: host1x: Add job release callback
  gpu: host1x: Add support for syncpoint waits in CDMA pushbuffer
  gpu: host1x: Reset max value when freeing a syncpoint
  gpu: host1x: Reserve VBLANK syncpoints at initialization
  drm/tegra: Add new UAPI to header
  drm/tegra: Boot VIC during runtime PM resume
  drm/tegra: Set resv fields when importing/exporting GEMs
  drm/tegra: Allocate per-engine channel in core code
  drm/tegra: Implement new UAPI
  drm/tegra: Implement job submission part of new UAPI
  drm/tegra: Add job firewall

 drivers/gpu/drm/tegra/Makefile         |   4 +
 drivers/gpu/drm/tegra/dc.c             |  10 +-
 drivers/gpu/drm/tegra/drm.c            |  69 ++--
 drivers/gpu/drm/tegra/drm.h            |   9 +
 drivers/gpu/drm/tegra/gem.c            |   2 +
 drivers/gpu/drm/tegra/gr2d.c           |   4 +-
 drivers/gpu/drm/tegra/gr3d.c           |   4 +-
 drivers/gpu/drm/tegra/uapi.h           |  63 ++++
 drivers/gpu/drm/tegra/uapi/firewall.c  | 221 +++++++++++++
 drivers/gpu/drm/tegra/uapi/gather_bo.c |  86 +++++
 drivers/gpu/drm/tegra/uapi/gather_bo.h |  22 ++
 drivers/gpu/drm/tegra/uapi/submit.c    | 436 +++++++++++++++++++++++++
 drivers/gpu/drm/tegra/uapi/submit.h    |  21 ++
 drivers/gpu/drm/tegra/uapi/uapi.c      | 307 +++++++++++++++++
 drivers/gpu/drm/tegra/vic.c            | 118 ++++---
 drivers/gpu/host1x/Makefile            |   2 +
 drivers/gpu/host1x/bus.c               |   7 +-
 drivers/gpu/host1x/cdma.c              |  69 +++-
 drivers/gpu/host1x/debug.c             |  14 +-
 drivers/gpu/host1x/dev.c               |  15 +
 drivers/gpu/host1x/dev.h               |  16 +-
 drivers/gpu/host1x/fence.c             | 208 ++++++++++++
 drivers/gpu/host1x/fence.h             |  13 +
 drivers/gpu/host1x/hw/cdma_hw.c        |   2 +-
 drivers/gpu/host1x/hw/channel_hw.c     |  63 ++--
 drivers/gpu/host1x/hw/debug_hw.c       |  11 +-
 drivers/gpu/host1x/intr.c              |  32 +-
 drivers/gpu/host1x/intr.h              |   6 +-
 drivers/gpu/host1x/job.c               |  79 +++--
 drivers/gpu/host1x/job.h               |  14 +
 drivers/gpu/host1x/syncpt.c            | 187 ++++++-----
 drivers/gpu/host1x/syncpt.h            |  16 +-
 drivers/gpu/host1x/uapi.c              | 385 ++++++++++++++++++++++
 drivers/gpu/host1x/uapi.h              |  22 ++
 drivers/staging/media/tegra-video/vi.c |   4 +-
 include/linux/host1x.h                 |  47 ++-
 include/uapi/drm/tegra_drm.h           | 338 +++++++++++++++++--
 include/uapi/linux/host1x.h            | 134 ++++++++
 38 files changed, 2771 insertions(+), 289 deletions(-)
 create mode 100644 drivers/gpu/drm/tegra/uapi.h
 create mode 100644 drivers/gpu/drm/tegra/uapi/firewall.c
 create mode 100644 drivers/gpu/drm/tegra/uapi/gather_bo.c
 create mode 100644 drivers/gpu/drm/tegra/uapi/gather_bo.h
 create mode 100644 drivers/gpu/drm/tegra/uapi/submit.c
 create mode 100644 drivers/gpu/drm/tegra/uapi/submit.h
 create mode 100644 drivers/gpu/drm/tegra/uapi/uapi.c
 create mode 100644 drivers/gpu/host1x/fence.c
 create mode 100644 drivers/gpu/host1x/fence.h
 create mode 100644 drivers/gpu/host1x/uapi.c
 create mode 100644 drivers/gpu/host1x/uapi.h
 create mode 100644 include/uapi/linux/host1x.h

-- 
2.30.0


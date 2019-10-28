Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB9DEE7170
	for <lists+linux-tegra@lfdr.de>; Mon, 28 Oct 2019 13:37:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727880AbfJ1MhY (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 28 Oct 2019 08:37:24 -0400
Received: from mail-wr1-f54.google.com ([209.85.221.54]:40463 "EHLO
        mail-wr1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727590AbfJ1MhX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 28 Oct 2019 08:37:23 -0400
Received: by mail-wr1-f54.google.com with SMTP id o28so9701241wro.7
        for <linux-tegra@vger.kernel.org>; Mon, 28 Oct 2019 05:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6jAETuFf+roFoMMRMhX/zKde2GbyLswiJsVFqHMPnLg=;
        b=U3Lzu5G7veVfI68uRWdSpFeid+7/B4JhM6RnnBxQYyBXEvkP2MS0DPkiBlb9mdczdx
         fpLkiCziXz2ORSYVpoiCffEQx+SsqBqLEOdKEQ8WesyvLMqKpacj1w5ObH2N0nlYijF1
         IPlSvqRubRpi9lcY2l/+vEEzEt3tUjGovmQunBMeprrQTcmhYBXE9ZdQQZ9RuIZEmQIj
         o7G1YaXv3E3zfwrvyu5iMyjB+oVFjgV0GGDW1nFEr4r/QSgrr0mgBpjUfus5p+3NeNAC
         l1Jd6wukOQqr58kh0xyCVDKFXu2nbbRdzW0VCfdqEuYBGhXFqG8KQ+pKABzscJdwKjOq
         y0rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6jAETuFf+roFoMMRMhX/zKde2GbyLswiJsVFqHMPnLg=;
        b=E6NvXc8T3NLNbJV6IMkjmrz5w1T+xvTu/Z/YrrJ02otYavWG856GqpSbfpBKWRVmmg
         8cXJuT+hapPrdylCR22F02xbPnkCKLIo6yErklslGCIaunW/Z8/j3fMBuuy/AiuHrrFT
         bQBSQfwtS4M6Fw1o2sIdl/LGv1bsdXoKkThY5rV40uqbLfYny4o1EAL0QLha7hKtH0vh
         ht4KcAPNzzlx6Tn4eW45v/mgAPDB3emSV9QndQPZDX1k731L0EH4cwHRTra87vxP076y
         ft7PPkdL0DINKjbuetjxfLedS5hk2YClYSrMDIwM1xU33XJZvGhdBfKBReg55Io5dPlE
         HRYQ==
X-Gm-Message-State: APjAAAWzg3pt0kDSsOpBTjVKdeDyZiJgya4V0yLuvsJe72jRYxePhyHN
        eXnHCgMtASF38CwRW7MgMo4=
X-Google-Smtp-Source: APXvYqxx/dmQYEYE/WkvloYY3t2QSmY0mSX+m9bywcAPzviQk1/HzYNjDz3YrI52nTsVJ6wHIi76Dg==
X-Received: by 2002:a05:6000:10d:: with SMTP id o13mr14456404wrx.321.1572266241346;
        Mon, 28 Oct 2019 05:37:21 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id c21sm10483174wmb.46.2019.10.28.05.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 05:37:20 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Sachin Nikam <snikam@nvidia.com>,
        Puneet Saxena <puneets@nvidia.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 00/12] drm/tegra: Support IOMMU-backed DMA API
Date:   Mon, 28 Oct 2019 13:37:06 +0100
Message-Id: <20191028123718.3890217-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

This series is a continuation of the work to move host1x and Tegra DRM
towards being able to use the IOMMU-backed DMA API.

The first two patches are required to workaround the shortage of IOMMU
domains on older Tegra SoC generations. The remainder of the patches is
mostly preparatory work to smoothen the transition to the DMA API. With
all of these patches applied, it's possible for the drivers to either
use the IOMMU API explicitly, or, if already attached to an DMA IOMMU
domain, continue to use that existing mapping with the DMA API.

These patches apply on top of linux-next and the ->load()/->unload()
removal patch from here:

	https://patchwork.freedesktop.org/patch/337896/

Thierry

Thierry Reding (12):
  memory: tegra: Add gr2d and gr3d to DRM IOMMU group
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

 drivers/gpu/drm/tegra/dc.c      |  10 +-
 drivers/gpu/drm/tegra/drm.c     |  82 ++++++++----
 drivers/gpu/drm/tegra/drm.h     |   4 +-
 drivers/gpu/drm/tegra/falcon.c  |  64 ++-------
 drivers/gpu/drm/tegra/falcon.h  |  16 +--
 drivers/gpu/drm/tegra/gem.c     |  46 ++++++-
 drivers/gpu/drm/tegra/gr2d.c    |   2 +-
 drivers/gpu/drm/tegra/gr3d.c    |   2 +-
 drivers/gpu/drm/tegra/hub.c     |   6 +-
 drivers/gpu/drm/tegra/plane.c   | 104 +++++++++++++++
 drivers/gpu/drm/tegra/plane.h   |   8 ++
 drivers/gpu/drm/tegra/vic.c     |  91 ++++++++-----
 drivers/gpu/host1x/dev.c        | 223 +++++++++++++++++++-------------
 drivers/gpu/host1x/dev.h        |   1 +
 drivers/gpu/host1x/job.c        |  91 +++++++++++--
 drivers/gpu/host1x/job.h        |   4 +
 drivers/memory/tegra/tegra114.c |  10 +-
 drivers/memory/tegra/tegra124.c |   8 +-
 drivers/memory/tegra/tegra30.c  |  11 +-
 include/linux/host1x.h          |  21 ++-
 20 files changed, 552 insertions(+), 252 deletions(-)

-- 
2.23.0


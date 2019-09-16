Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9552B3D1A
	for <lists+linux-tegra@lfdr.de>; Mon, 16 Sep 2019 17:04:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730339AbfIPPES (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 16 Sep 2019 11:04:18 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:38678 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727598AbfIPPES (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 16 Sep 2019 11:04:18 -0400
Received: by mail-ed1-f67.google.com with SMTP id a23so373213edv.5
        for <linux-tegra@vger.kernel.org>; Mon, 16 Sep 2019 08:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o+M6Ex0Sr9L/2wgTxcjcULg3l1xb8gfJ3JFn8p8EOQM=;
        b=h1T2EdN8fhF2rR+N7w9uZcRVRuV59l9G2ou/lVfxTCeiPWL1dJ7oM6bjschL/m3WdO
         l+Aijm3+T6FtKqtFWHCZJsU3A+vzUNZOhuivR4H/Gc+8EaOY23LPLkAZMnnt5GtswCrc
         emraHZ8iXotgD3UG+CNmdZA9s1jiDdN0zx6nXQfMHjb6KlwpgQbHniK/8xoaH4Zo3EyE
         TyQs5QRtGhjR6mf6moetGdMcsTWoPs91N08k8h6h22k4DW1YkeC6oJA+7PkBEO3VH26Q
         sj3Iprz4aIMtXc9tiF13T0xL7zogxsTS7gwAtqgCXVoSmygl/CCDvwVW6jI6bRCrILnm
         ANLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o+M6Ex0Sr9L/2wgTxcjcULg3l1xb8gfJ3JFn8p8EOQM=;
        b=ZAATtUT7p6kGipAeIq3FNU0d/SQ3Luh+zyIG2s84hYgOgpSCTkOJPi7x/Xass3SHvM
         TqpUncYDBDmq+kp3d+Cgrvpul98FFQNdQC97QtL/7VqJ1+Rc57LfdsytWou1vQ43Goie
         0zN1P64Kw/p3yLR3ZxDmjU5mjcW5dXERQmSyLGfUxkUuleKk6gjtyyN4b6/ioCGSF0M6
         cwv7W8d0XSbJqr6bJc6o50+YFYae3YfmZoqVZjz4vqVM5YhyeBZ73ccDz9ipGQaRD1p7
         FMaLidL/CuyPN8ud6a5urTpVMqhBZaVru5DP0aIIprQgmR/ruqodOZhaakBUTm+OZnAw
         tcyQ==
X-Gm-Message-State: APjAAAWScBMxjyP2rAF/0H0Nha2jONfqT2u0GufobczWrm71Rdj8dH89
        CVIInXH5L+BZ8Y8uHdYW9xg=
X-Google-Smtp-Source: APXvYqyGVfjb2Q/NqMoH5rWS6uX0idXDA2Hsx1dGyxITQV+1nAVGbeD+KNeBG6YGNDPh6TcL40cKew==
X-Received: by 2002:a05:6402:13cd:: with SMTP id a13mr12171577edx.6.1568646254393;
        Mon, 16 Sep 2019 08:04:14 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id q33sm7190225eda.60.2019.09.16.08.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2019 08:04:13 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Ben Skeggs <bskeggs@redhat.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 00/11] drm/nouveau: Enable GP10B by default
Date:   Mon, 16 Sep 2019 17:04:01 +0200
Message-Id: <20190916150412.10025-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Hi,

the GPU on Jetson TX2 (GP10B) does not work properly on all devices. Why
exactly is not clear, but there are slight differences between the SKUs
that were tested. It turns out that the biggest issue is that on some
devices (e.g. the one that I have), pulsing the GPU reset twice as is
done in the current code (once as part of the power-ungate operation and
then again in the driver) causes the GPU to go into a bad state on some
devices. Conditionally doing the reset in the driver only if it isn't
already done by the power domain code fixes this issue.

Another issue is that the clock may be running at a rate of 0 Hz. This
is unlikely to happen because it internally actually can't run that
slow, but explicitly setting the clock rate at probe time does seem to
help in some cases.

Patch three in this series unifies reading the WPR configuration by
getting it from GPU register rather than reaching into the memory
controller's register space. This is slightly better because it better
separates the two drivers and doesn't require an update everytime the
memory controller moves to another register aperture.

Patch 4 ensures the L2 cache makes memory requests with the proper
stream ID, which is required when the GPU is behind an IOMMU.

Patch 5 changes the GP10B device initialization to use the correct copy
engine. GP10B is a Pascal generation GPU and the way that engines are
described changes how the copy engines are enumerated compared to
earlier generations.

Patches 6 through 9 allow Nouveau to work on Tegra GPUs if the DMA API
is backed by an IOMMU. This is different from current assumptions
because mappings for all buffers mapped through the DMA API will need
to have the special IOMMU bit set in their page tables. Note that this
technically makes it possible to support big pages on Tegra because from
the GPU's point of view all memory is now contiguous. However, these
patches only make sure that buffers are mapped properly and don't try to
enable big pages. Also note that mapping through the IOMMU comes at a
slight cost, so this may not always be desirable. However, with Tegra186
and later it's currently not possible (from a DMA API point of view) to
map only a subset of buffers through the IOMMU, so any such optimization
is deferred. Furthermore, the ARM SMMU driver currently enforces the use
of the SMMU by default, so there not much of a choice at the moment.

Finally patches 10 and 11 enable the GPU on Jetson TX2 and make it use
the SMMU. I can pick up patches 10 and 11 into the Tegra tree once the
other patches have been merged into Nouveau.

Thierry

Alexandre Courbot (1):
  arm64: tegra: Enable GPU on Jetson TX2

Thierry Reding (10):
  drm/nouveau: tegra: Avoid pulsing reset twice
  drm/nouveau: tegra: Set clock rate if not set
  drm/nouveau: secboot: Read WPR configuration from GPU registers
  drm/nouveau: gp10b: Add custom L2 cache implementation
  drm/nouveau: gp10b: Use correct copy engine
  drm/nouveau: gk20a: Set IOMMU bit for DMA API if appropriate
  drm/nouveau: gk20a: Implement custom MMU class
  drm/nouveau: tegra: Skip IOMMU initialization if already attached
  drm/nouveau: tegra: Fall back to 32-bit DMA mask without IOMMU
  arm64: tegra: Enable SMMU for GPU on Tegra186

 .../boot/dts/nvidia/tegra186-p2771-0000.dts   |   4 +
 arch/arm64/boot/dts/nvidia/tegra186.dtsi      |   1 +
 .../gpu/drm/nouveau/include/nvkm/subdev/ltc.h |   1 +
 .../gpu/drm/nouveau/nvkm/engine/device/base.c |   4 +-
 .../drm/nouveau/nvkm/engine/device/tegra.c    | 152 +++++++++++-------
 .../drm/nouveau/nvkm/subdev/instmem/gk20a.c   |  35 ++--
 .../gpu/drm/nouveau/nvkm/subdev/ltc/Kbuild    |   1 +
 .../gpu/drm/nouveau/nvkm/subdev/ltc/gp10b.c   |  69 ++++++++
 .../gpu/drm/nouveau/nvkm/subdev/ltc/priv.h    |   2 +
 .../gpu/drm/nouveau/nvkm/subdev/mmu/gk20a.c   |  50 +++++-
 .../gpu/drm/nouveau/nvkm/subdev/mmu/gk20a.h   |  44 +++++
 .../gpu/drm/nouveau/nvkm/subdev/mmu/gm20b.c   |   6 +-
 .../gpu/drm/nouveau/nvkm/subdev/mmu/gp10b.c   |   4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h |   1 +
 .../drm/nouveau/nvkm/subdev/mmu/vmmgk20a.c    |  22 ++-
 .../drm/nouveau/nvkm/subdev/mmu/vmmgm20b.c    |   4 +-
 .../drm/nouveau/nvkm/subdev/mmu/vmmgp10b.c    |  20 ++-
 .../drm/nouveau/nvkm/subdev/secboot/gm200.h   |   2 +-
 .../drm/nouveau/nvkm/subdev/secboot/gm20b.c   |  81 ++++++----
 .../drm/nouveau/nvkm/subdev/secboot/gp10b.c   |   4 +-
 20 files changed, 394 insertions(+), 113 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gp10b.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gk20a.h

-- 
2.23.0


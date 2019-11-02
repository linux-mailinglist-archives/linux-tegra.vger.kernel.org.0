Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1469ED00C
	for <lists+linux-tegra@lfdr.de>; Sat,  2 Nov 2019 18:56:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726523AbfKBR4n (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sat, 2 Nov 2019 13:56:43 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:35731 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726675AbfKBR4m (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 2 Nov 2019 13:56:42 -0400
Received: by mail-wr1-f66.google.com with SMTP id l10so12742810wrb.2
        for <linux-tegra@vger.kernel.org>; Sat, 02 Nov 2019 10:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fg11aERMXXKX34QNhVirF3sCeunB+ZROwt3Ey5G2HSM=;
        b=FLzW9d6erDn/RwVAHdSRCc0yMFte8vZTNq4lvLhX1e1ADj0W+CfFPce59eATPP+3Vc
         qBsxWMNzdGFuTwDSHnnh/yDzJibGf3nSDiLQxSDFHXIq4KiOJ3YiTk2VqxaPKNmb4S0N
         vAy8qzOCL7u+OFNtt+y4liudUD+D3QS0IGnM9J11M2EaoakBxKRAadXaE7i5R7uriwmT
         d6WObeUbfe2SDQfqsAc2GgCwI4HqoklFhtxTnQqsBeJQvrxJ0ztJ8RBHH9ZLzRl+R0vh
         kVCf5beLLR9S82ZtcXLgbuB+azDyuhrIdmevUyjGqMC3Rft+SJaRVrUEQEntcTq5oUPI
         tEMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fg11aERMXXKX34QNhVirF3sCeunB+ZROwt3Ey5G2HSM=;
        b=kf6vfdN8sLAD8F+TxAfop61EEDhA9wv5K9gMc24CLbTHWhrhyfABVjUM1jmVSAEsXT
         dnt+WMKke7poFv9xCyuxErJRE38Iwmb2oAZkbh1Ak0qKh1AOUEeW8+M8gW7yj3lsnol0
         655QoOQaDb6A8bTrlpIERYyrC7HGvL1o1hlC4AkXams+WTQFt4XFNuZ7hJpQ3S9f/g0e
         YS3q6VyvZSvsCOQMpybDeGRzHKDE8lvlpGYXGJUKAs1SJdLCEYZEaGweS8bZx2OJ7oUF
         mA0uA5uL2Kl8Km0czQTsCEg74CkdUPmCZ1UurxJSyJ1kWdA2CbkK01ZGjZbUQcoqQnAq
         mOvg==
X-Gm-Message-State: APjAAAUE9dBKwHAbxyNHSd9Kie4UG6avp9PtHeSBksR8fhOumCSE8Jss
        U/n4xAt5/wTeSzafMzkpV/jyIgxn
X-Google-Smtp-Source: APXvYqw6k2ZjTC5NJXhWRF/IpJtNW8Ee625GVll8Tb68kyZ4MZEqLCHCXpiEBakP2egHmjfskc68qA==
X-Received: by 2002:a5d:5222:: with SMTP id i2mr15880369wra.271.1572717400076;
        Sat, 02 Nov 2019 10:56:40 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id x8sm4879225wrm.7.2019.11.02.10.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Nov 2019 10:56:38 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Ben Skeggs <bskeggs@redhat.com>, Joerg Roedel <joro@8bytes.org>
Cc:     Ben Dooks <ben.dooks@codethink.co.uk>,
        Lyude Paul <lyude@redhat.com>, nouveau@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH v2 0/9] drm/nouveau: Various fixes for GP10B
Date:   Sat,  2 Nov 2019 18:56:28 +0100
Message-Id: <20191102175637.3065-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Hi Ben,

here's a revised subset of the patches I had sent out a couple of weeks
ago. I've reworked the BAR2 accesses in the way that you had suggested,
which at least for GP10B turned out to be fairly trivial to do. I have
not looked in detail at this for GV11B yet, but a cursory look showed
that BAR2 is accessed in more places, so the equivalent for GV11B might
be a bit more involved.

Other than that, not a lot has changed since then. I've added a couple
of precursory patches to add IOMMU helper dummies for the case where
IOMMU is disabled (as suggested by Ben Dooks).

Joerg, it'd be great if you could give an Acked-by on those two patches
so that Ben can pick them both up into the Nouveau tree. Alternatively I
can put them both into a stable branch and send a pull request to both
of you. Or yet another alternative would be for Joerg to apply them now
and Ben to wait for v5.5-rc1 until he picks up the rest. All of those
work for me.

Thierry

Thierry Reding (9):
  iommu: Document iommu_fwspec::flags field
  iommu: Add dummy dev_iommu_fwspec_get() helper
  drm/nouveau: fault: Add support for GP10B
  drm/nouveau: tegra: Do not try to disable PCI device
  drm/nouveau: tegra: Avoid pulsing reset twice
  drm/nouveau: tegra: Set clock rate if not set
  drm/nouveau: secboot: Read WPR configuration from GPU registers
  drm/nouveau: gp10b: Add custom L2 cache implementation
  drm/nouveau: gp10b: Use correct copy engine

 .../drm/nouveau/include/nvkm/subdev/fault.h   |  1 +
 .../gpu/drm/nouveau/include/nvkm/subdev/ltc.h |  1 +
 drivers/gpu/drm/nouveau/nouveau_drm.c         |  3 +-
 .../gpu/drm/nouveau/nvkm/engine/device/base.c |  6 +-
 .../drm/nouveau/nvkm/engine/device/tegra.c    | 24 ++++--
 .../gpu/drm/nouveau/nvkm/subdev/fault/Kbuild  |  1 +
 .../gpu/drm/nouveau/nvkm/subdev/fault/base.c  |  2 +-
 .../gpu/drm/nouveau/nvkm/subdev/fault/gp100.c | 17 ++--
 .../gpu/drm/nouveau/nvkm/subdev/fault/gp10b.c | 53 ++++++++++++
 .../gpu/drm/nouveau/nvkm/subdev/fault/gv100.c |  1 +
 .../gpu/drm/nouveau/nvkm/subdev/fault/priv.h  | 10 +++
 .../gpu/drm/nouveau/nvkm/subdev/ltc/Kbuild    |  1 +
 .../gpu/drm/nouveau/nvkm/subdev/ltc/gp10b.c   | 65 +++++++++++++++
 .../gpu/drm/nouveau/nvkm/subdev/ltc/priv.h    |  2 +
 .../drm/nouveau/nvkm/subdev/secboot/gm200.h   |  2 +-
 .../drm/nouveau/nvkm/subdev/secboot/gm20b.c   | 81 ++++++++++++-------
 .../drm/nouveau/nvkm/subdev/secboot/gp10b.c   |  4 +-
 include/linux/iommu.h                         | 46 ++++++-----
 18 files changed, 249 insertions(+), 71 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/fault/gp10b.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gp10b.c

-- 
2.23.0


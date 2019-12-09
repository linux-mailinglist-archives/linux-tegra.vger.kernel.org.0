Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7F86116CA6
	for <lists+linux-tegra@lfdr.de>; Mon,  9 Dec 2019 13:00:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727385AbfLIMAK (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 9 Dec 2019 07:00:10 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:39281 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727163AbfLIMAJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 9 Dec 2019 07:00:09 -0500
Received: by mail-wr1-f67.google.com with SMTP id y11so15864182wrt.6
        for <linux-tegra@vger.kernel.org>; Mon, 09 Dec 2019 04:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jVo4EgL5w5uDzGazf3l7wTsJXSg/MMHtXYeNv2rCsg0=;
        b=SOtdMTkeK4Pz/v4aVYilY6jLxtIONogeSbNmCED6mecKqiMNQmaVrWE6AOzhiMrm9H
         mCp06313qLGpUBnFQRrvFW32/EnbuZzn1//FBzNena9YePQCuAj7P0Tn9w0JkemC8gng
         Bq3kMuj0QL2Pk9zNr60qvJuLHMxJP3dEW8eximpgUIJSIOFgOJLEeGuZ3fVAG5EfMDir
         grgBrRPkKuWhoLBozRiIvgM7P27yv3+jo3xkqAIwbY9g6ESHBan2BzItHP0G3/qv0pko
         aUX+Y7kvINbNerW6MoZVmMSgvvcT/Xq8GURz8bxVWsmM4F6mL0nDKpf/gus+2FF1rTbW
         Y2HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jVo4EgL5w5uDzGazf3l7wTsJXSg/MMHtXYeNv2rCsg0=;
        b=Ar4RYgzXHCW8i+shkLozy4Q28eK4vN+KTMk8JIQsDbjihAit+1JTc5+oW7P2/vgYLj
         +bSGnoUtJeSzwk1ycRVkTedQFbd9owIcfTsjMJVGIiXyjasiE+axcQcFtsH0ucXPHdML
         FYulb6LKxSDMDtbfclJS95ojtg+d+xgG5pS2QlXf3GAPFukufC5pg8TcCF/dR9MQB1Bo
         vNwj7xhcPAbU3jfoSbJAJBm3rF+LWFMfHVY+3oe2v5K0WkofyIjCit+ih8+aYQoT/21N
         QwjdpC/Sdk5HWm27TRvUmNJ4LrCNK3byatORAauDmAvichHMqn4UqBbNlimheGMy4gfR
         u4Gg==
X-Gm-Message-State: APjAAAVxVfg60f1PatY+cwKPpjDdFYMPqO5erP5JzOq5DlXJb84sFtfY
        pksIm8RL51SPxDEJwG0m66M=
X-Google-Smtp-Source: APXvYqxvFtxU6WB/3/ekW7w5obFZRKXEM9dhhw5b2O7nuk/LQYLOnnP+CjtLvAnv6TgIKMEEED5xxg==
X-Received: by 2002:a5d:528e:: with SMTP id c14mr1828916wrv.308.1575892807435;
        Mon, 09 Dec 2019 04:00:07 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id y139sm13774689wmd.24.2019.12.09.04.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2019 04:00:06 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Ben Skeggs <bskeggs@redhat.com>
Cc:     Joerg Roedel <joro@8bytes.org>, Lyude Paul <lyude@redhat.com>,
        nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v3 0/9] drm/nouveau: Various fixes for GP10B
Date:   Mon,  9 Dec 2019 12:59:56 +0100
Message-Id: <20191209120005.2254786-1-thierry.reding@gmail.com>
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

Joerg has given an Acked-by on the first two patches, so I think it'd be
easiest if you picked those up into the Nouveau tree because of the
build dependency of subsequent patches on them.

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
 include/linux/iommu.h                         | 47 ++++++-----
 18 files changed, 249 insertions(+), 72 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/fault/gp10b.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gp10b.c

-- 
2.23.0


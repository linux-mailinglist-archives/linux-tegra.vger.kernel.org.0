Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7167ECF3D
	for <lists+linux-tegra@lfdr.de>; Sat,  2 Nov 2019 15:45:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726450AbfKBOp0 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sat, 2 Nov 2019 10:45:26 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:41684 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726437AbfKBOpZ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 2 Nov 2019 10:45:25 -0400
Received: by mail-wr1-f66.google.com with SMTP id p4so12431685wrm.8
        for <linux-tegra@vger.kernel.org>; Sat, 02 Nov 2019 07:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MlbcMmuvAlZUFyN7GSyGfftxWdaDG41yMHD9JZL16rM=;
        b=fNpqxTr7VI+YR4gcBcQRYakD69SSVXT/NRf+UwvSUzq1XaLYtRwOvZDORzdSxQzFSY
         5Z7NeGHb9MkVZAKG/SXYpiJkgdoSO4rW9LPlQeeKhZDuCLIvgk6Gk7tZUxiJCkeK3xMY
         BA6wRDH5cnO+gJGZbe5w+JpTnA3TJRzNujZkiII+f/LbfP2DVB0UHHWNlgmgYV2HsbdW
         bqTdDbk3ciaKO96WWBhLspscuxlt1KUxeRewSZ9Rtrt0wuUdyGO2ot8OU92PkduNpcav
         ay1j2eviXcWGBjGPMTuE1W4qZLkl6YoFis4U9Q1Vu4KYQOJ0uwna2FBW33zlk0xJr9pq
         7M7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MlbcMmuvAlZUFyN7GSyGfftxWdaDG41yMHD9JZL16rM=;
        b=trb/y4lF8qufKtJU23KY+7XidY+vFeg/v+zynvBN8cOAp1Tu4PmmfuhOvMwXsOdYfW
         Lr2H5b5dc7ATgHqXA9fCqiUZr1TxUhmbH2GfiDsIpheb4PBV2lWK10lWu7CNnPVRaXWz
         Sjl61t1uQR3PYSwuweFimlON+xE9JHNgUJ+ZOn3Gfl72tIUuSrlokbnhPxQncLLp/HbS
         BzeiPydKosjFCWWcir98hFhapOwkrOdJ75ookLdf+HcsFPxR+DGuevwHbLDKbqeEKjUP
         +QrHSdOmEccmrDEbiNhLfpxP+u0MzuJSNbBtaLXr0KCmC59VfxhJoSnk5Lx2hw40aRyX
         +ICQ==
X-Gm-Message-State: APjAAAVI85RB5YAfCZLEvrXafn6rEs0WdsYDRD9C0Y7fKY/UD6KibB/n
        97BkzcLpP9HvBecD2deNNVg=
X-Google-Smtp-Source: APXvYqxJFlcWgHrVDFZ005IJWPG0nXP4eAlpTM1ZH6BkC7i49nHDqHA3aD5m4HDmbmTP2VlIinVRCA==
X-Received: by 2002:a5d:4f8b:: with SMTP id d11mr16024773wru.25.1572705923859;
        Sat, 02 Nov 2019 07:45:23 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id w81sm11048760wmg.5.2019.11.02.07.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Nov 2019 07:45:22 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/8] dt-bindings: Changes for v5.5-rc1
Date:   Sat,  2 Nov 2019 15:45:14 +0100
Message-Id: <20191102144521.3863321-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:

  Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.5-dt-bindings

for you to fetch changes up to 641262f5e1ed5c96799e17595893fa1a703616ac:

  dt-bindings: memory: Add binding for NVIDIA Tegra30 External Memory Controller (2019-10-29 20:22:34 +0100)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Changes for v5.5-rc1

This contains various updates to device tree bindings and includes that
are related to driver changes in other Tegra branches.

----------------------------------------------------------------
Dmitry Osipenko (4):
      dt-bindings: regulator: Document regulators coupling of NVIDIA Tegra20/30 SoCs
      dt-bindings: memory: tegra30: Convert to Tegra124 YAML
      dt-bindings: memory: Add binding for NVIDIA Tegra30 Memory Controller
      dt-bindings: memory: Add binding for NVIDIA Tegra30 External Memory Controller

Thierry Reding (1):
      dt-bindings: clock: tegra: Rename SOR0_LVDS to SOR0_OUT

 .../memory-controllers/nvidia,tegra124-mc.yaml     | 152 ++++++++++
 .../memory-controllers/nvidia,tegra30-emc.yaml     | 336 +++++++++++++++++++++
 .../memory-controllers/nvidia,tegra30-mc.txt       | 123 --------
 .../memory-controllers/nvidia,tegra30-mc.yaml      | 167 ++++++++++
 .../regulator/nvidia,tegra-regulators-coupling.txt |  65 ++++
 include/dt-bindings/clock/tegra124-car-common.h    |   3 +-
 include/dt-bindings/clock/tegra210-car.h           |   3 +-
 7 files changed, 724 insertions(+), 125 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-mc.yaml
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-emc.yaml
 delete mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-mc.txt
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-mc.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/nvidia,tegra-regulators-coupling.txt

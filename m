Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63B11ECF44
	for <lists+linux-tegra@lfdr.de>; Sat,  2 Nov 2019 15:45:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726762AbfKBOpl (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sat, 2 Nov 2019 10:45:41 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:40267 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726437AbfKBOpk (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 2 Nov 2019 10:45:40 -0400
Received: by mail-wm1-f66.google.com with SMTP id f3so674699wmc.5
        for <linux-tegra@vger.kernel.org>; Sat, 02 Nov 2019 07:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aZU4q2obXFsRyJfy0ffm0WGcG8q+ibuTKe+aCmk4/9k=;
        b=MYSCk3QmjSgxx5m4Lh4r5lWzRYYGIxEkDyLzFcLFUCLeHMOAoMTh7YnUWKxJx5bt36
         my6Y4Sf5wIdSZ7ZVyENfw2aetED2NHychdtQc34wVv4ILXVeNd5f5G0CwTGDHqZtmJu8
         mA8r4nZL7Ty9GA7AL2BCyhSkq+i3ywME1sz3VBu9iA7nGhlJPpcD6QnjDEsTFWBXVDAj
         MlUEqlqwJtvnLJpH4WQSGLaZniXPDbiIvlXNIlTQqU4d9B5P2BVpuv9bvCGWpaKKl7rh
         bpIM5aXq6iR6+rRV5P2u3TFpopMD0DU1PkjpQoc18jzu/o/fEm3pGCpeG/BQALjtKkoT
         420g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aZU4q2obXFsRyJfy0ffm0WGcG8q+ibuTKe+aCmk4/9k=;
        b=GGUCVNWSTNHASke7+tpdK8H9buy4ZShGQBDMU/5Xqq5c3l/PFw71EB5TIFoe/Y8xZh
         yA9q1SIdDQrC1qNN9jEsJaefBKqYQ7Tt6WKSBrwmy9+2sPMRyvZc1yaNj4FQh3hgfd2K
         NB3sW0HKJiTOvvHuxGiL6XEKgJ2sSHFJqE9voFUxN5AJ8g8wifFYJRlDtpj6mtp0ccST
         8c5ZNORbs8RlxUws2eIh5XblwMLvd0XTG3DdkKax44lFlxUanhLqUgS1J3XfMAkrsPK8
         JicH2zt1b84F3meDvaLoAlKTQP+G9vl1LKyKPrWnVfCTkYLS1x78CKk22jqo+G6M7SUm
         wuSg==
X-Gm-Message-State: APjAAAWkVMVneBftRXvZn5P868xSIZyZ20HHmCdxTKRkFXGQ0FQPuv0v
        EqEk1KUjTnRMSX4on6SWGig=
X-Google-Smtp-Source: APXvYqzviHdmwnXlqVv/c5rayoBS97WZKnWEiaBfjsiSytB6ry7JNYPvCwgv39fEIxQaCgffsb4EVA==
X-Received: by 2002:a1c:96c9:: with SMTP id y192mr15973392wmd.8.1572705938541;
        Sat, 02 Nov 2019 07:45:38 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id i3sm10704851wrw.69.2019.11.02.07.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Nov 2019 07:45:37 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 8/8] arm64: tegra: Device tree changes for v5.5-rc1
Date:   Sat,  2 Nov 2019 15:45:21 +0100
Message-Id: <20191102144521.3863321-8-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191102144521.3863321-1-thierry.reding@gmail.com>
References: <20191102144521.3863321-1-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.5-arm64-dt

for you to fetch changes up to 47b4e129155fd1e721462fa23d128940c93b5b7b:

  arm64: tegra: Add Jetson Nano SC7 timings (2019-10-29 20:30:09 +0100)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree changes for v5.5-rc1

Adds support for DP and XUSB on various boards, enables SMMU support for
more devices and fixes a couple of DTC warnings and inconsistencies that
are reported at runtime.

These changes along with some of the driver changes in other branches
allow suspend/resume support on Tegra210 devices (e.g. Jetson TX1 and
Jetson Nano).

----------------------------------------------------------------
Jon Hunter (2):
      arm64: tegra: Fix 'active-low' warning for Jetson TX1 regulator
      arm64: tegra: Fix 'active-low' warning for Jetson Xavier regulator

Nagarjuna Kristam (3):
      arm64: tegra: Enable XUSB pad controller on Jetson TX2
      arm64: tegra: Enable SMMU for XUSB host on Tegra186
      arm64: tegra: Enable XUSB host controller on Jetson TX2

Sowjanya Komatineni (3):
      arm64: tegra: Enable wake from deep sleep on RTC alarm
      arm64: tegra: Add Jetson TX1 SC7 timings
      arm64: tegra: Add Jetson Nano SC7 timings

Thierry Reding (18):
      dt-bindings: clock: tegra: Rename SOR0_LVDS to SOR0_OUT
      Merge branch 'for-5.5/dt-bindings'
      arm64: tegra: Add CPU and cache topology for Tegra194
      arm64: tegra: Add unit-address for CBB on Tegra194
      arm64: tegra: Add unit-address for ACONNECT on Tegra194
      arm64: tegra: Fix base address for SOR1 on Tegra194
      arm64: tegra: Hook up edp interrupt on Tegra210 SOCTHERM
      arm64: tegra: Fix compatible string for EQOS on Tegra194
      arm64: tegra: Add ethernet alias on Jetson AGX Xavier
      arm64: tegra: Enable SMMU for VIC on Tegra186
      arm64: tegra: Add SOR0_OUT clock on Tegra210
      arm64: tegra: Enable DP support on Jetson Nano
      arm64: tegra: Fix compatible for SOR1
      arm64: tegra: Enable DP support on Jetson TX2
      arm64: tegra: p2888: Rename regulators for consistency
      arm64: tegra: Enable DisplayPort on Jetson AGX Xavier
      arm64: tegra: Add blank lines for better readability
      arm64: tegra: Add PMU on Tegra210

Vidya Sagar (1):
      arm64: tegra: Assume no CLKREQ presence by default

 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts |  12 +-
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           |   4 +-
 arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi     |  36 ++---
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts |  33 +++-
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           | 171 ++++++++++++++++++---
 arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi     |   7 +
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     |   2 +-
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts |  35 +++++
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |  25 ++-
 include/dt-bindings/clock/tegra124-car-common.h    |   3 +-
 include/dt-bindings/clock/tegra210-car.h           |   3 +-
 11 files changed, 278 insertions(+), 53 deletions(-)

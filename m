Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D33F71D5290
	for <lists+linux-tegra@lfdr.de>; Fri, 15 May 2020 16:53:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726339AbgEOOx3 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 15 May 2020 10:53:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726144AbgEOOx3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 15 May 2020 10:53:29 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFD13C061A0C
        for <linux-tegra@vger.kernel.org>; Fri, 15 May 2020 07:53:28 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id m12so2625596wmc.0
        for <linux-tegra@vger.kernel.org>; Fri, 15 May 2020 07:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9UBYYcdIgbZSSo88eAH9WbkMVlcw8uQpcEd0d8c9QEI=;
        b=iLTgQubvbdvxXADF2lJaBVfdvzqfwkCgdBgJx+MOvK2jIL7zXYNiRWcynMi0icRipR
         9o+FjUvK/wkTfpF+IcYA7uIQ5wqAIMyQKePmCSXENGjXgMIam2rf3N7Fo21M79VfdAr7
         Hpp2tCEY0GzLgZSXo/7PaGCrXFRn2LU3czLFu0v2CtZeVS2lpjQ66k3kcQHITvZC7y4E
         PsDLlh72/jk8gPtbBLPdHb/q9EzeOjVSSEZs7EjpRDHAM263mkkRZ8+FAOqW/AWUW6h2
         Iij253mDSAay8ZEf+4ED6hfZ1JXCS9rD2CxO+rP48xW7z7qfzd3ArSzIXxOsDA+OUL1Y
         VXMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9UBYYcdIgbZSSo88eAH9WbkMVlcw8uQpcEd0d8c9QEI=;
        b=TJLl29Z2GJkE7aOZJL+G30f0HOGykGbFaxDuwyqscLR7iCdyEnUZWMp9Cl76O05oB4
         3KORYyXDkjEgB+JtsuKFlqfXfkQvUoNYbzwxL9K0OLNAQ9PoHepD+e8FEEueBExbhVDV
         DTEz/fkunevZeXfeBkEWYuOFzRGV2hQkvArqWblOt736+e3Di11v2cjOCp2kjMdSGKfl
         NR9wDCTETF+FZJPQ6Gq9SiXN/r2RwP28WWreJ/EOcHWfQDdh11f4xmNSNAnrDP5OcHm6
         lAHdLYHF9WsIPFxq/XpP3FILnqmMybbngWsZ7hMwc7af8SuU3Ive19lpOFMPwhdieCDH
         3TIw==
X-Gm-Message-State: AOAM531PthGQUkUKcgjZYzZvQvoeG0Or2nlU676oelni4MxMRThw0+QV
        tvnEHUWvSywNYvK3pqB2/XJsXJag
X-Google-Smtp-Source: ABdhPJxW/lNGeuuFBpIkpzs8OslocfcDWMlr9WDQeun9e5LenyOb+/obiqbm3JLQzNaZXq0JViS0vw==
X-Received: by 2002:a1c:4857:: with SMTP id v84mr4633914wma.106.1589554407502;
        Fri, 15 May 2020 07:53:27 -0700 (PDT)
Received: from localhost (pD9E51079.dip0.t-ipconnect.de. [217.229.16.121])
        by smtp.gmail.com with ESMTPSA id u16sm3846305wrq.17.2020.05.15.07.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 07:53:26 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 06/11] media: tegra: Changes for v5.8-rc1
Date:   Fri, 15 May 2020 16:53:06 +0200
Message-Id: <20200515145311.1580134-7-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200515145311.1580134-1-thierry.reding@gmail.com>
References: <20200515145311.1580134-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:

  Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.8-media

for you to fetch changes up to ba8f6682bcb3312645c6cb77499ceaa66cc950a6:

  media: tegra-video: Do not enable COMPILE_TEST (2020-05-12 23:09:33 +0200)

Thanks,
Thierry

----------------------------------------------------------------
media: tegra: Changes for v5.8-rc1

This contains a V4L2 video capture driver for Tegra210.

----------------------------------------------------------------
Dmitry Osipenko (1):
      dt-bindings: cpufreq: Add binding for NVIDIA Tegra20/30

Joseph Lo (1):
      dt-bindings: memory: tegra: Add external memory controller binding for Tegra210

Lukas Bulwahn (1):
      MAINTAINERS: correct path in TEGRA VIDEO DRIVER

Samuel Zou (1):
      media: tegra-video: Make tegra210_video_formats static

Sowjanya Komatineni (5):
      dt-bindings: clock: tegra: Add clock ID for CSI TPG clock
      dt-bindings: clock: tegra: Remove PMC clock IDs
      dt-bindings: tegra: Add VI and CSI bindings
      media: tegra-video: Add Tegra210 Video input driver
      MAINTAINERS: Add Tegra Video driver section

Thierry Reding (3):
      dt-bindings: i2c: tegra: Document Tegra210 VI I2C
      Merge branch 'for-5.8/dt-bindings' into for-5.8/media
      media: tegra-video: Do not enable COMPILE_TEST

 .../bindings/cpufreq/nvidia,tegra20-cpufreq.txt    |   56 +
 .../display/tegra/nvidia,tegra20-host1x.txt        |   73 +-
 .../devicetree/bindings/i2c/nvidia,tegra20-i2c.txt |    6 +
 .../memory-controllers/nvidia,tegra210-emc.yaml    |   82 ++
 MAINTAINERS                                        |   10 +
 drivers/staging/media/Kconfig                      |    2 +
 drivers/staging/media/Makefile                     |    1 +
 drivers/staging/media/tegra-video/Kconfig          |   12 +
 drivers/staging/media/tegra-video/Makefile         |    8 +
 drivers/staging/media/tegra-video/TODO             |   11 +
 drivers/staging/media/tegra-video/csi.c            |  539 ++++++++++
 drivers/staging/media/tegra-video/csi.h            |  147 +++
 drivers/staging/media/tegra-video/tegra210.c       |  978 ++++++++++++++++++
 drivers/staging/media/tegra-video/vi.c             | 1074 ++++++++++++++++++++
 drivers/staging/media/tegra-video/vi.h             |  257 +++++
 drivers/staging/media/tegra-video/video.c          |  155 +++
 drivers/staging/media/tegra-video/video.h          |   29 +
 include/dt-bindings/clock/tegra114-car.h           |   14 +-
 include/dt-bindings/clock/tegra124-car-common.h    |   14 +-
 include/dt-bindings/clock/tegra20-car.h            |    2 +-
 include/dt-bindings/clock/tegra210-car.h           |   16 +-
 include/dt-bindings/clock/tegra30-car.h            |   14 +-
 22 files changed, 3457 insertions(+), 43 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/cpufreq/nvidia,tegra20-cpufreq.txt
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.yaml
 create mode 100644 drivers/staging/media/tegra-video/Kconfig
 create mode 100644 drivers/staging/media/tegra-video/Makefile
 create mode 100644 drivers/staging/media/tegra-video/TODO
 create mode 100644 drivers/staging/media/tegra-video/csi.c
 create mode 100644 drivers/staging/media/tegra-video/csi.h
 create mode 100644 drivers/staging/media/tegra-video/tegra210.c
 create mode 100644 drivers/staging/media/tegra-video/vi.c
 create mode 100644 drivers/staging/media/tegra-video/vi.h
 create mode 100644 drivers/staging/media/tegra-video/video.c
 create mode 100644 drivers/staging/media/tegra-video/video.h

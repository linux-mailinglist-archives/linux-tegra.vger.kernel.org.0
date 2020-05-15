Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 971AD1D528C
	for <lists+linux-tegra@lfdr.de>; Fri, 15 May 2020 16:53:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726292AbgEOOxY (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 15 May 2020 10:53:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726144AbgEOOxY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 15 May 2020 10:53:24 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B94DBC061A0C
        for <linux-tegra@vger.kernel.org>; Fri, 15 May 2020 07:53:22 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id h17so3867834wrc.8
        for <linux-tegra@vger.kernel.org>; Fri, 15 May 2020 07:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1SsS+ZSTt/ULxJrwRQDkWWTbTiy0pezxPev3oDys/NQ=;
        b=iysdOe4FAn3ll8B3ThqIjAYC97gkTK6GJYK6e2G9Edo/ZG49ZDlqMWper0xOGunFje
         hXxuDmze9n1mgqI/VpLiiM0tqXcq9F5T9sED5L//v/DW7JHQZUAFR9bE/2XhqfC5Jo8j
         U/x7cp12WXwjz/xAgyz8HbP2HhU79xHznPxryUnAXOPdj8k743ur+0fJOHxhtRLW5BPI
         43K4tw810Hwy6U2QcOOhqLH4tlz1I1nhv5s1f+SnF7SfzIvsrUir5RmNdPl9S01AqUZL
         ucGIvNfPFIip+yudT7sXWKdf7zU4gNHjWz3dgsH09bkhXmLZL+pvh/t3N46yvpFeERZI
         6Qig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1SsS+ZSTt/ULxJrwRQDkWWTbTiy0pezxPev3oDys/NQ=;
        b=dqKEVPC5jVCFqxqdMbS3LU9Rs32wLv/NwebXLUiE6MVrVB2OfbbMUgM1gslBTHwWbb
         D3rCWR5OZc3NR3xuJ/WaAthOS69j6+WYilxTvbQnOuhTG3hK740CnpwHNwQwEhL6ZKkv
         cC0yb43k/dwAyVr63HMSOu1/3xj1XT4CEle6zuAh2qMNvu91A4jCFDs5v+AV+FgmsLvv
         XifPSpxwU6NpaAh6rC5ejy3SK3guUAa7zNcieCDlM+O0AdmulD7MaRc8dKXtYAsn/rMr
         EyRGAtIdk+2pzU8BO8iKioi2RX0y7BVELD2zbTtbJ7igExlxrzmFXJf6DeDvM35dpNhZ
         OFhA==
X-Gm-Message-State: AOAM530l5IZa2v0RHFnK1RkmjfkK9Rb6Z47m84LVAZnTo2g2ENC31jBZ
        0BqWv0jc1wHEl4NCbeR8Hyk=
X-Google-Smtp-Source: ABdhPJyGosKoHaIyb7spq/jdjjQ71Kd31n//F2dO6CqRU84CNLY2LpOSEHa9VifxuNHIDydbbs0riQ==
X-Received: by 2002:adf:ed82:: with SMTP id c2mr4878997wro.255.1589554401520;
        Fri, 15 May 2020 07:53:21 -0700 (PDT)
Received: from localhost (pD9E51079.dip0.t-ipconnect.de. [217.229.16.121])
        by smtp.gmail.com with ESMTPSA id h133sm4213503wmf.25.2020.05.15.07.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 07:53:20 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 03/11] dt-bindings: Changes for v5.8-rc1
Date:   Fri, 15 May 2020 16:53:03 +0200
Message-Id: <20200515145311.1580134-4-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.8-dt-bindings

for you to fetch changes up to 4e79691d050e6d06ee7fa09002c52dd1ce9ac6e6:

  dt-bindings: i2c: tegra: Document Tegra210 VI I2C (2020-05-12 22:47:36 +0200)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Changes for v5.8-rc1

This adds bindings for the CSI TPG clock on Tegra210, moves various
clocks from the clock and reset controller to the PMC where their
controls really are, adds bindings for the external memory controller
and video capture controller on Tegra210, as well as CPU frequency
scaling on Tegra20 and Tegra30.

----------------------------------------------------------------
Dmitry Osipenko (1):
      dt-bindings: cpufreq: Add binding for NVIDIA Tegra20/30

Joseph Lo (1):
      dt-bindings: memory: tegra: Add external memory controller binding for Tegra210

Sowjanya Komatineni (3):
      dt-bindings: clock: tegra: Add clock ID for CSI TPG clock
      dt-bindings: clock: tegra: Remove PMC clock IDs
      dt-bindings: tegra: Add VI and CSI bindings

Thierry Reding (1):
      dt-bindings: i2c: tegra: Document Tegra210 VI I2C

 .../bindings/cpufreq/nvidia,tegra20-cpufreq.txt    | 56 +++++++++++++++
 .../display/tegra/nvidia,tegra20-host1x.txt        | 73 +++++++++++++++----
 .../devicetree/bindings/i2c/nvidia,tegra20-i2c.txt |  6 ++
 .../memory-controllers/nvidia,tegra210-emc.yaml    | 82 ++++++++++++++++++++++
 include/dt-bindings/clock/tegra114-car.h           | 14 ++--
 include/dt-bindings/clock/tegra124-car-common.h    | 14 ++--
 include/dt-bindings/clock/tegra20-car.h            |  2 +-
 include/dt-bindings/clock/tegra210-car.h           | 16 ++---
 include/dt-bindings/clock/tegra30-car.h            | 14 ++--
 9 files changed, 234 insertions(+), 43 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/cpufreq/nvidia,tegra20-cpufreq.txt
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.yaml

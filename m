Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0544F7690
	for <lists+linux-tegra@lfdr.de>; Mon, 11 Nov 2019 15:38:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726832AbfKKOil (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 11 Nov 2019 09:38:41 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:41919 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726923AbfKKOil (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 11 Nov 2019 09:38:41 -0500
Received: by mail-wr1-f67.google.com with SMTP id p4so14886539wrm.8
        for <linux-tegra@vger.kernel.org>; Mon, 11 Nov 2019 06:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KdKS5nQgloGgR5hKS/9aF3v1RXwuBZu05wTCxgCw21A=;
        b=qDvfYWYnoKzB5oxYuBjtx6IjWb7zOjzkJJbCLW5gCzQ09UK4EsJlUUKrG2eQyMzvxs
         TTAxr+nMMw9Fgfch8JWcfkgyJa082CWBBWNgjcbW2KHkNekZD6tARZ04iNwiJLEX5vAz
         BoOVFbDk4e60WexgUJqHzDPqUHuqg5MEPIejpHPxpPeapEQfx944sVC81s1/muzwr6cp
         OISAzJJ/Koo62J6gYNx2YGMH/RG3qZLfN/tomb+BeIwokFipy4iMaJbX7s56usvLLhoj
         Y69/gXYfCWygWts94KIztyE5MZs+z50qX/dJbIVORFR9QjF+zCdaycuwRn6XHHN0OmW+
         PFXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KdKS5nQgloGgR5hKS/9aF3v1RXwuBZu05wTCxgCw21A=;
        b=rn9o5HIEjO/FnsFMZyML4Z0O8fSqlPbTz47ZjfkmGW7mqLl1+xR0rvteVBS5OkK0ta
         bk7ZI7jo49c5JHDmWh/PUJ7tm0/xgZ7XPAs5888rSHDrdCinJ0tHy2NEE26IIp/L4dXJ
         gT0oODl8KEEqg2biyF/AHzUAmInC26jXhH5ibQv7uNvVIDJn4jnIt3SeLPMItZyPeuSx
         A2wABup5zF6wYCim8WIpmANGFeLfOsQ69o+ku5CLKt5LUywOID1kaPCAazJTTduNPwjW
         PQCDxyDqFrpJP1CcVMt78hUsNmykHCmMtgWe+Deg5ykZO50txkX2QmsEI4oZcPNsRYvy
         c/jQ==
X-Gm-Message-State: APjAAAXTFPDZm8cB/FgFR3lz+i4WI6D9qSFA70vVw1+ddcBc7BudEs7i
        2S+6v754v9GmH52KVofzjMGiDlF/zEU=
X-Google-Smtp-Source: APXvYqxWUQDGc4T8bsgFxDf9/WvrPBbK2l4Rdn+Tc8Zrm9TYJXoiuG7/CU42I9qEaAfWSq8bE2L6OQ==
X-Received: by 2002:adf:fd91:: with SMTP id d17mr20770388wrr.214.1573483118704;
        Mon, 11 Nov 2019 06:38:38 -0800 (PST)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id x205sm24164485wmb.5.2019.11.11.06.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 06:38:37 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     soc@kernel.org, arm@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL v2 3/8] memory: tegra: Changes for v5.5-rc1
Date:   Mon, 11 Nov 2019 15:38:36 +0100
Message-Id: <20191111143836.4027200-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191102144521.3863321-3-thierry.reding@gmail.com>
References: <20191102144521.3863321-3-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.5-memory-v2

for you to fetch changes up to 141bef44e123c101c0da0443ab6b3cfa750f251a:

  memory: tegra: Consolidate registers definition into common header (2019-11-11 14:55:27 +0100)

This is an updated pull request which now no longer pulls in the core
common clock framework change because it's not required by any of the
code in this pull request.

Thanks,
Thierry

----------------------------------------------------------------
memory: tegra: Changes for v5.5-rc1

This contains a couple of fixes and adds support for EMC frequency
scaling on Tegra30.

----------------------------------------------------------------
Dmitry Osipenko (11):
      clk: tegra: Add Tegra20/30 EMC clock implementation
      memory: tegra: Don't set EMC rate to maximum on probe for Tegra20
      memory: tegra: Adapt for Tegra20 clock driver changes
      memory: tegra: Include io.h instead of iopoll.h
      memory: tegra: Pre-configure debug register on Tegra20
      memory: tegra: Print a brief info message about EMC timings
      memory: tegra: Increase handshake timeout on Tegra20
      memory: tegra: Do not handle error from wait_for_completion_timeout()
      memory: tegra: Introduce Tegra30 EMC driver
      memory: tegra: Ensure timing control debug features are disabled
      memory: tegra: Consolidate registers definition into common header

Thierry Reding (3):
      Merge branch 'for-5.5/clk' into for-5.5/memory
      memory: tegra: Set DMA mask based on supported address bits
      memory: tegra: Add gr2d and gr3d to DRM IOMMU group

 drivers/clk/tegra/Makefile          |    2 +
 drivers/clk/tegra/clk-tegra20-emc.c |  293 +++++++++
 drivers/clk/tegra/clk-tegra20.c     |   55 +-
 drivers/clk/tegra/clk-tegra30.c     |   38 +-
 drivers/clk/tegra/clk.h             |    3 +
 drivers/memory/tegra/Kconfig        |   10 +
 drivers/memory/tegra/Makefile       |    1 +
 drivers/memory/tegra/mc.c           |   52 +-
 drivers/memory/tegra/mc.h           |   74 ++-
 drivers/memory/tegra/tegra114.c     |   10 +-
 drivers/memory/tegra/tegra124.c     |   30 +-
 drivers/memory/tegra/tegra20-emc.c  |  134 ++--
 drivers/memory/tegra/tegra30-emc.c  | 1232 +++++++++++++++++++++++++++++++++++
 drivers/memory/tegra/tegra30.c      |   34 +-
 include/linux/clk/tegra.h           |   11 +
 include/soc/tegra/mc.h              |    2 +-
 16 files changed, 1779 insertions(+), 202 deletions(-)
 create mode 100644 drivers/clk/tegra/clk-tegra20-emc.c
 create mode 100644 drivers/memory/tegra/tegra30-emc.c

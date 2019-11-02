Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D78B8ECF3F
	for <lists+linux-tegra@lfdr.de>; Sat,  2 Nov 2019 15:45:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726523AbfKBOpa (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sat, 2 Nov 2019 10:45:30 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:36742 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726437AbfKBOpa (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 2 Nov 2019 10:45:30 -0400
Received: by mail-wr1-f67.google.com with SMTP id w18so12467423wrt.3
        for <linux-tegra@vger.kernel.org>; Sat, 02 Nov 2019 07:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2xwdK9ORPHr8BUbtUyij/HAbdNm3052Xp3KlIuPrDTs=;
        b=ePM140datcGTK2ysJ1FnNHxCI1dMMmWN/G4pgRW485JxcHCI3s9da3fACfaPSkEQxi
         Vj9RYbmnV4GvR52xtl4UXBs+GC9VcGbHcFc1JjQ9BGn4AbprkJrpHC/xmxrc5yirgOmr
         ZA0zVfPbMyWJJBXw1mV6AxGUEs5j557MXDwKBcOTFcEaT6v3EyzUSyq7/r9UuSD3vjzB
         DoAs5785whZMyBw9kiEPHSiUBoqXnGbf/KirXAZzDQ9YRa4UTA400Z16QRQ3kWbpNCau
         CTZ/HZM6se78LDAJ6aXOnHGt92YdZtaBFXrzDtyMPBtm+6G2Vq42N883FScMv2hhZpNE
         MUYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2xwdK9ORPHr8BUbtUyij/HAbdNm3052Xp3KlIuPrDTs=;
        b=lJJHF8q/a6Dq2Nq1C431TBMhChJVWuPtXkyWHzLMuRKs87lJLFmgaIHWyQvw+jqk3G
         wp0pN6fXxbKB2muQ3zv+xtwWb0UYPeA06b4Sw7JI4MLO1oTlVLQAdNEpmhVyYdbcewy7
         FFstamtOI2KnwtlwxvWF1WF50y/r0qS0M68fSi1o+4PUmLk9QUDESwHLFVO+svPUXphn
         0vOkXCxU4XEZ05OdFMCNuWjsZYuSIE/IcUnEOqWo5FIi66pW47xtRxx8HspXIwRKLVWw
         oRbOwl3PgQ/bvl463KH6FxSmygcoSyEr8uhu71lyJ3+IKD9/Dp01l4igtQotpGF7+UE4
         L6+w==
X-Gm-Message-State: APjAAAXAf6iW7tR2Zml0uhT6gp5pIwFWNJ34l6lE6KpPawe8MtEHnvT8
        Lcc2zaVMnnEVX3pxNs7XpDw=
X-Google-Smtp-Source: APXvYqzwCJtp598wAta+v/62Na2U+YrKr83lBOY4U7NpO1IMs4pca+q/sbJD7TX3YE6HCWEE2kdsCg==
X-Received: by 2002:adf:fc10:: with SMTP id i16mr14783375wrr.157.1572705928288;
        Sat, 02 Nov 2019 07:45:28 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id y16sm1366647wro.25.2019.11.02.07.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Nov 2019 07:45:27 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/8] memory: tegra: Changes for v5.5-rc1
Date:   Sat,  2 Nov 2019 15:45:16 +0100
Message-Id: <20191102144521.3863321-3-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.5-memory

for you to fetch changes up to 8b04225c4464422f185e62c2cedfb9e234423814:

  memory: tegra: Consolidate registers definition into common header (2019-11-01 10:57:37 +0100)

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

Sowjanya Komatineni (1):
      clk: Add API to get index of the clock parent

Thierry Reding (3):
      Merge branch 'for-5.5/clk'
      memory: tegra: Set DMA mask based on supported address bits
      memory: tegra: Add gr2d and gr3d to DRM IOMMU group

 drivers/clk/clk.c                   |   17 +
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
 include/linux/clk-provider.h        |    1 +
 include/linux/clk/tegra.h           |   11 +
 include/soc/tegra/mc.h              |    2 +-
 18 files changed, 1797 insertions(+), 202 deletions(-)
 create mode 100644 drivers/clk/tegra/clk-tegra20-emc.c
 create mode 100644 drivers/memory/tegra/tegra30-emc.c

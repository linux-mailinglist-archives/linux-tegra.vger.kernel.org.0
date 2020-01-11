Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3891137AA5
	for <lists+linux-tegra@lfdr.de>; Sat, 11 Jan 2020 01:36:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727732AbgAKAgE (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 10 Jan 2020 19:36:04 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:43493 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727724AbgAKAgD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 10 Jan 2020 19:36:03 -0500
Received: by mail-wr1-f68.google.com with SMTP id d16so3436953wre.10
        for <linux-tegra@vger.kernel.org>; Fri, 10 Jan 2020 16:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DfFWEYOrKeczPJ3XK4soniW4tzy+GmC4nNvc+3g9T8A=;
        b=ZI/nZUOZWUNvO+ce5wPUrutG+eMxHj+AVzCJ5WqbwSS75gn0tKvmDWCSEgxAbuzlYF
         NriseRMQmaKqAdj+n74NG/4X7ldVJOwvKwFJHF0/u1PxHNK5SLmEG4zlXpwfcFv2zVlf
         KbuMgkc2cNn22zPdLXHzdsmNZieyvMdMxtKgQ+/rSAVoP83cnxpy32C6LbHjTrVGigBj
         NfWspNnzYnzuUlrcGKklluYQNMsVOokcFYiU3BFlKG+cu2L3tcwOIEmbUVje2c/os9Gc
         wKcrcYtvhSOe+aHyZ/P5y+Y3ns+jokVM4Q/9CvBJqfMK/hn7Wr4Q9nlhZUmUxu+kWLKk
         XgNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DfFWEYOrKeczPJ3XK4soniW4tzy+GmC4nNvc+3g9T8A=;
        b=eJagIADJIxipsq545rkriPrnRYrjXsrfygIrDuc3nnWBxPmEysRNR46q6Msgw8i5hS
         /gt7O3AUZsfrQCQXXvx9AvbxkvTUyZRTwgIY3dGKuus31bJurc/8N+ijusINnwUs/K0D
         8hy7BDlcNJxGcoavBFNKkktG64xMqRZDUsAPfPQVWMBL157y6tMOTLqKc3PCBMqazQL+
         l1l6WRUceq3yx2p4LH41iG4As6ZjFbkEXD2Pe7NBfXqV360YnyxzA0GYJW/TeLrxuPNu
         b4xQwemRjrb8VBSWG9cOY8Qe7/5MCwyecbnqJomCr1bXJboI8h2Ss46/peJcvj3FKfOv
         7FSg==
X-Gm-Message-State: APjAAAWy/TKEUCYtD0dGGrgmX29OM+OEYvTAXdO0E1M3DIYeaAW8uhhW
        ZhrAtYfvqM+ksL1upabb5Ug=
X-Google-Smtp-Source: APXvYqykLEcbUN9GC32HzSWckg0KzGu4rjtF08ttP9eWJnZ6dHSn+yTU5MEIwnWbguQ1oskF2qV/wQ==
X-Received: by 2002:a5d:5267:: with SMTP id l7mr6372124wrc.84.1578702961948;
        Fri, 10 Jan 2020 16:36:01 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
        by smtp.gmail.com with ESMTPSA id w8sm4345050wmm.0.2020.01.10.16.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2020 16:36:01 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/8] memory: tegra: Changes for v5.6-rc1
Date:   Sat, 11 Jan 2020 01:35:48 +0100
Message-Id: <20200111003553.2411874-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200111003553.2411874-1-thierry.reding@gmail.com>
References: <20200111003553.2411874-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit e42617b825f8073569da76dc4510bfa019b1c35a:

  Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.6-memory

for you to fetch changes up to 5e5eca6644873da93f5a32904f43220380f34e88:

  memory: tegra30-emc: Correct error message for timed out auto calibration (2020-01-10 15:48:48 +0100)

Thanks,
Thierry

----------------------------------------------------------------
memory: tegra: Changes for v5.6-rc1

This adds a couple of fixes for the Tegra30 EMC frequency scaling code
and adds support for EMC frequency scaling on Tegra186 and later.

----------------------------------------------------------------
Dmitry Osipenko (3):
      memory: tegra30-emc: Firm up suspend/resume sequence
      memory: tegra30-emc: Firm up hardware programming sequence
      memory: tegra30-emc: Correct error message for timed out auto calibration

Nicolin Chen (1):
      memory: tegra: Correct reset value of xusb_hostr

Thierry Reding (10):
      memory: tegra: Refashion EMC debugfs interface on Tegra124
      memory: tegra: Implement EMC debugfs interface on Tegra20
      memory: tegra: Implement EMC debugfs interface on Tegra30
      memory: tegra: Rename tegra_mc to tegra186_mc on Tegra186
      memory: tegra: Add per-SoC data for Tegra186
      memory: tegra: Extract memory client SID programming
      memory: tegra: Add system sleep support
      memory: tegra: Support DVFS on Tegra186 and later
      memory: tegra: Only include support for enabled SoCs
      memory: tegra: Add support for the Tegra194 memory controller

 drivers/memory/tegra/Makefile       |    3 +-
 drivers/memory/tegra/tegra124-emc.c |  185 ++++--
 drivers/memory/tegra/tegra186-emc.c |  293 ++++++++++
 drivers/memory/tegra/tegra186.c     | 1067 ++++++++++++++++++++++++++++++++++-
 drivers/memory/tegra/tegra20-emc.c  |  175 ++++++
 drivers/memory/tegra/tegra210.c     |    2 +-
 drivers/memory/tegra/tegra30-emc.c  |  352 +++++++++---
 7 files changed, 1928 insertions(+), 149 deletions(-)
 create mode 100644 drivers/memory/tegra/tegra186-emc.c

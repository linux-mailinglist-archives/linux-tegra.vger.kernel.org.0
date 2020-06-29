Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F57220CC11
	for <lists+linux-tegra@lfdr.de>; Mon, 29 Jun 2020 05:18:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725998AbgF2DSy (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 28 Jun 2020 23:18:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725976AbgF2DSy (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 28 Jun 2020 23:18:54 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9506AC03E979
        for <linux-tegra@vger.kernel.org>; Sun, 28 Jun 2020 20:18:53 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id e4so16380316ljn.4
        for <linux-tegra@vger.kernel.org>; Sun, 28 Jun 2020 20:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HlEJy5BcEYfJuRETmD/4cFe9b4ldi2YDayAxtaQnFzo=;
        b=kkHRe1nEGyLQiI8VAigNZ/OsAMEF3OAkcjxIxcoA3YJgV3nYrqOvDc/Be57y+YZPk9
         XmRuvgcO0C0wPaAHY9hFAaJbZLXZ6yp0f8H7V5iB1btoh9mVMFUNeR02iN16WPuusZAF
         fsy6+FI02jlQM0t+o7I2yTyFntlE/BUplz/0OKSx7LwgOPUA48IBDqOtiwJWfVfRUzDb
         KLM9lb36HixOj8JeYw00njRqAIydbWUV+XHXqu+EC3IXiUhCXlGqxVNdfDzIuC57n1kd
         zA0HmRZ4nj0C/pCHQLbaE0q7B2T4aIttsyebMmDspXpIW7PRGxKXig7jkqe8vKc6wfaB
         kqlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HlEJy5BcEYfJuRETmD/4cFe9b4ldi2YDayAxtaQnFzo=;
        b=LMgqp56jyO5+pAR6Qml0UdyRotccOX92u9kQ8AZLRGc4O8RLfaxGSnt3Er6et8Wfjr
         OjFiEupFQ5/EVibGFOme6RBYT5VN89j58tZT/QF+JCv8ngKY3wudFZCC1bAUpRRjRvCd
         XtmC9jqbRzWrocCywKJuePwCxAibFch0GypYMMsi1+JTJkqGaLjNoC8lEO0u2qdu44C2
         mAbsNjzJg1NXr95FPDLjhkys6wwqX8bR2raSiKE0NJ+xdZjFh+eDN3sq/Y2WoDOHMQ5z
         SrJQOs+GLd4UlbeVkRlH1FsjDAFQ44jTIXncD0JYlA1EXDECSREE1bPkF9V5x1Mo4gtA
         +InA==
X-Gm-Message-State: AOAM533J+RsrLrTOWhuhmwRbkRHYRdzkAj/6aT3XFNMMFMTuwVeldWEp
        a5Z1H7OgwFYNTHimuEEiUS0p8iAgBsk=
X-Google-Smtp-Source: ABdhPJzFXYT+7+qKn0ocb0G8QP4XRZYfVx8VOholhZM09Vq42RxZqOylYDRPlvp0Ijw1ItlYdQ4erQ==
X-Received: by 2002:a2e:2c18:: with SMTP id s24mr359135ljs.291.1593400731986;
        Sun, 28 Jun 2020 20:18:51 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru. [79.139.237.54])
        by smtp.gmail.com with ESMTPSA id m1sm2383295ljg.60.2020.06.28.20.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2020 20:18:51 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mikko Perttunen <cyndis@kapsi.fi>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH v2 0/6] Tegra DRM / Host1x drivers improvements and corrections
Date:   Mon, 29 Jun 2020 06:18:36 +0300
Message-Id: <20200629031842.32463-1-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hello!

This small series fixes a few minor long-standing problems of the
Tegra DRM and Host1x drivers. It also adds a push buffer dumping support,
which is a minor debugging feature.

Changelog:

v2: - The drm/tegra and host1x patches got aggregated into this common
      series because I'm a bit worried that the standalone patches may
      become forgotten for a long time.

    - In the patch "gpu: host1x: debug: Dump push buffer state" I fixed
      the printk formatting problem on ARM64 that was reported by kernel
      test robot for a previous version of this patch.

Dmitry Osipenko (6):
  drm/tegra: gr3d: Assert reset before power-gating
  drm/tegra: gr2d: Add tiled PATBASE address register
  gpu: host1x: Optimize BOs usage when firewall is enabled
  gpu: host1x: Put gather's BO on pinning error
  gpu: host1x: debug: Fix multiple channels emitting messages
    simultaneously
  gpu: host1x: debug: Dump push buffer state

 drivers/gpu/drm/tegra/gr2d.c     |  1 +
 drivers/gpu/drm/tegra/gr2d.h     |  1 +
 drivers/gpu/drm/tegra/gr3d.c     |  2 ++
 drivers/gpu/host1x/debug.c       |  4 ++++
 drivers/gpu/host1x/hw/debug_hw.c |  6 ++++++
 drivers/gpu/host1x/job.c         | 27 ++++++++++++++++++++-------
 6 files changed, 34 insertions(+), 7 deletions(-)

-- 
2.26.0


Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC25E154A33
	for <lists+linux-tegra@lfdr.de>; Thu,  6 Feb 2020 18:28:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727440AbgBFR2A (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 6 Feb 2020 12:28:00 -0500
Received: from mail-wm1-f54.google.com ([209.85.128.54]:36227 "EHLO
        mail-wm1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726990AbgBFR2A (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 6 Feb 2020 12:28:00 -0500
Received: by mail-wm1-f54.google.com with SMTP id p17so993022wma.1
        for <linux-tegra@vger.kernel.org>; Thu, 06 Feb 2020 09:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GoPHJNkYrWrAAYhDknAJRzG2TQROB7g+UrDNyYdeF6I=;
        b=j20XkOpbb521H8AmSZohb+SUmlpF2+iQ1dSFIoOgpjLopwZAR051IT2dIx+E0Bpe/g
         Q6mJ4PK5KtZYUwDjV4ii9PE5OO6FScXy1bGO5C+kyvqd+RQtbjJqRdKgcz+lNC0bfahs
         IClYgc6QCiG0xrDGith5AIFHF+UKPyTo+Nrj7/PqpnH9XgKTRDZrAvB2PD5sEastmS+X
         /0ppjNqyD716zM2VQYZpsVbNPSxWWb7eHQkj9L90xe9k5DRHRAeoqd1fip68egXdAWkl
         whUoCyOWw2F4V59y/LpcwizN3Bz57+IzWO3Z4vs+tQeZ5OEUCY8LPrdm4Qkbi7QCNyyH
         96oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GoPHJNkYrWrAAYhDknAJRzG2TQROB7g+UrDNyYdeF6I=;
        b=Rq5jiRTZYRBEoGDqI9MJnwd7ykKf0PREZPF44mepZgVLhoogCLQrEmSsg0zRRyRCv0
         eRFX4ZYQXiAE2UfOfgcYiqTHOPd6yK9Uw68LAwruXePJHHObdhvMC9kqCoJ9HB4NCvjP
         TjwSNZeF8OgXI58gEDMUh0dTaqiscJA1HxKwGC4o1BPyH5X2rwRt2iB6+n0DXs0S2jO/
         rGJ5IEXz9kr2dKq49ecOg5oWJXKc6H5ZuIrbWIII98wH5qGXTNwjcOPkyXH8d08x4IWI
         kPQMQdykPqoKsDzEI1aEC3rWcmSvtqTQqpjiai2bvFahBtL7EQG0MoX3Ucky8qjyzXW8
         CLrg==
X-Gm-Message-State: APjAAAVoIrSH6hYGXJTR1bwt2AXAMgfDhbz8zQ5jSv8Lt0ctySIZvYv+
        7Vvb4ba8NhpiInTsT+kKM2U=
X-Google-Smtp-Source: APXvYqwaOeI4fa6bruuHqRk00hB1htVU++pE61frXxam4Oa7kGCIpB5yOx295HFAD/APhEMrcIYoaw==
X-Received: by 2002:a7b:c119:: with SMTP id w25mr5828873wmi.116.1581010077707;
        Thu, 06 Feb 2020 09:27:57 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
        by smtp.gmail.com with ESMTPSA id w1sm5280224wro.72.2020.02.06.09.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2020 09:27:56 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dave Airlie <airlied@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [GIT PULL] drm/tegra: Fixes for v5.6-rc1
Date:   Thu,  6 Feb 2020 18:27:53 +0100
Message-Id: <20200206172753.2185390-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Dave,

The following changes since commit 033ccdb7f6b11701623507339646013b4ce389d3:

  gpu: host1x: Remove dev_err() on platform_get_irq() failure (2020-01-10 17:05:12 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/tegra/linux tags/drm/tegra/for-5.6-rc1-fixes

for you to fetch changes up to 98ae41adb252866158dd4e998551dfa85e612bed:

  gpu: host1x: Set DMA direction only for DMA-mapped buffer objects (2020-02-06 18:23:12 +0100)

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Fixes for v5.6-rc1

These are a couple of quick fixes for regressions that were found during
the first two weeks of the merge window.

----------------------------------------------------------------
Thierry Reding (6):
      drm/tegra: sor: Suspend on clock registration failure
      drm/tegra: sor: Disable runtime PM on probe failure
      drm/tegra: sor: Initialize runtime PM before use
      drm/tegra: Relax IOMMU usage criteria on old Tegra
      drm/tegra: Reuse IOVA mapping where possible
      gpu: host1x: Set DMA direction only for DMA-mapped buffer objects

 drivers/gpu/drm/tegra/drm.c   | 49 ++++++++++++++++++++++++++++---------------
 drivers/gpu/drm/tegra/gem.c   | 10 ++++++++-
 drivers/gpu/drm/tegra/plane.c | 44 +++++++++++++++++++++-----------------
 drivers/gpu/drm/tegra/sor.c   | 49 ++++++++++++++++++++++++-------------------
 drivers/gpu/host1x/job.c      | 34 ++++++++++++++++++++++++++----
 5 files changed, 123 insertions(+), 63 deletions(-)

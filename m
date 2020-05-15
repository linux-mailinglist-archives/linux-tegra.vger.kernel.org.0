Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 343BC1D5293
	for <lists+linux-tegra@lfdr.de>; Fri, 15 May 2020 16:53:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726302AbgEOOxe (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 15 May 2020 10:53:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726144AbgEOOxe (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 15 May 2020 10:53:34 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 267C4C061A0C
        for <linux-tegra@vger.kernel.org>; Fri, 15 May 2020 07:53:34 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id u16so2978626wmc.5
        for <linux-tegra@vger.kernel.org>; Fri, 15 May 2020 07:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1Yzwf8FDzX+wb74TfFoQfONnR1+EyUuWhCFXjNGoyb8=;
        b=uO5FrXtHH24EA7xcro6XaJGq84Fjell9NOszuFKpNAB1Jk987JD81aupS5nl2Skro2
         mIor7cW1C5Ka5UOX9tpdeXdp7mfCuv0DOY1g+PCvG/qKsHg9kuc1uNJyUE0qVKqqMQom
         XfgvPOQSjofMciSOkx4u2AH6Bsh2ShhIlxuvlQBfAvtcQRqcLs57zSLjrbQtYrmMRNRD
         YlEuyuhAxZMe9RFG4z3aNffy2j65nxQlIHF+QnIwQaqooRYSi1qNx7B7IKUWZzFn4ebk
         IgLGLgF2w2+TAWu6HriqToy8GO8ZxxZFTOMsR1d/4WbfyWBAds+MKxVrFMZ5mAOhMMmT
         k2jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1Yzwf8FDzX+wb74TfFoQfONnR1+EyUuWhCFXjNGoyb8=;
        b=ek4GzsHHGiNW4g+d/hJWIAIJN42yANk82JdKIngMBL+Wrv8TOtsLH1FHqXO8zN1HZp
         Z56KRmDhXC212aBdKLjL9gErbzHlojs3yLBQpixqwk+KqDVfMsU0/CackEIwKwsPCMpJ
         VFbXICls7c9sBwJld+f1jLHnChkgGgxfYP566bBU6ZafzLXKbWVhux4u2hvXLGjElPDO
         g0XG40BfL09UjcfYHQ9+LcqtzAKeDLyhv2EjyW8+APVXE1mcdn2dBhpxf3ctmi/PR71t
         LWzxTPHRKHcXzcH/qs4/sxziFHMMYbiXP36zswfYWi88XfTnCOcRPSD13uwRI8vEos9k
         7XRw==
X-Gm-Message-State: AOAM533c9TFINdc+IY7y1Q94LQfYy9mnJFPyezYkU7oz0SkFn3NCvC3Q
        ehZhK7wp3kteHd5pPJcDmVw=
X-Google-Smtp-Source: ABdhPJxFNDq0PMZXUTqswa66oNRefg573GH41Vyc1PkKZ1/H5LDn/If80ZLYh01Bv9fmhHLjECgUcQ==
X-Received: by 2002:a1c:66d6:: with SMTP id a205mr4654572wmc.163.1589554412834;
        Fri, 15 May 2020 07:53:32 -0700 (PDT)
Received: from localhost (pD9E51079.dip0.t-ipconnect.de. [217.229.16.121])
        by smtp.gmail.com with ESMTPSA id b12sm4259300wmj.0.2020.05.15.07.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 07:53:31 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 09/11] ARM: tegra: Core changes for v5.8-rc1
Date:   Fri, 15 May 2020 16:53:09 +0200
Message-Id: <20200515145311.1580134-10-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.8-arm-core

for you to fetch changes up to b9bf73aed99ed3170b37fbbf98557c70a6f19e50:

  ARM: tegra: Create tegra20-cpufreq platform device on Tegra30 (2020-05-06 19:01:17 +0200)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Core changes for v5.8-rc1

This contains core changes needed for the CPU frequency scaling and CPU
idle drivers on Tegra20 and Tegra30.

----------------------------------------------------------------
Dmitry Osipenko (7):
      firmware: tf: Different way of L2 cache enabling after LP2 suspend
      ARM: tegra: Initialize r0 register for firmware wake-up
      ARM: tegra: Do not fully reinitialize L2 on resume
      ARM: tegra: Correct PL310 Auxiliary Control Register initialization
      ARM: tegra: Switch CPU to PLLP on resume from LP1 on Tegra30/114/124
      ARM: tegra: Don't enable PLLX while resuming from LP1 on Tegra30
      ARM: tegra: Create tegra20-cpufreq platform device on Tegra30

Thierry Reding (2):
      firmware: tegra: Make BPMP a regular driver
      Merge branch 'for-5.8/firmware' into for-5.8/arm/core

 arch/arm/mach-tegra/pm.c                     |  4 ++++
 arch/arm/mach-tegra/reset-handler.S          |  7 ++++++-
 arch/arm/mach-tegra/sleep-tegra30.S          | 16 +++++++++-------
 arch/arm/mach-tegra/tegra.c                  |  8 ++++++--
 drivers/firmware/tegra/bpmp.c                |  9 +++------
 drivers/firmware/trusted_foundations.c       | 21 +++++++++++++++++++--
 include/linux/firmware/trusted_foundations.h |  1 +
 7 files changed, 48 insertions(+), 18 deletions(-)

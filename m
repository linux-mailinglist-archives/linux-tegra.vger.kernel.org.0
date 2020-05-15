Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 381041D5292
	for <lists+linux-tegra@lfdr.de>; Fri, 15 May 2020 16:53:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726541AbgEOOxd (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 15 May 2020 10:53:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726144AbgEOOxc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 15 May 2020 10:53:32 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33302C061A0C
        for <linux-tegra@vger.kernel.org>; Fri, 15 May 2020 07:53:32 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id m12so2625781wmc.0
        for <linux-tegra@vger.kernel.org>; Fri, 15 May 2020 07:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7/M3vJWfG1Iqpp3J3L+tQPhMOxfEZSLbbAZe6XXYpPI=;
        b=iHWXtDzN0eZuyf52qAbulgbixodq3rnKNxB0ayhZ9tHWB3LeWO809X6OiSHopTBhXG
         6paNWSAnmYiqEWZh0KEPmgve+MNC/+wppK9jQirhNDUBZJbxQkxZNqPitO0HWWbSLh8F
         l5gn6vzcNYs3r0ncsvC4LU+FqV23lQ3v1pq79M32qEUuRyrILTPmDyk4N65uSjQ07zK/
         tIo+ru5AFz06LZ4Ss2E5N6yh7ecZwkcFy5L8tGhxi2B+0tler7syYOKIJCxMI44MZCcg
         Q+yta8AfbN4NAbc7yL1howFDlrYb4P02FQoCbF9+Ii/ftFJpjYVEpuj7ds6k1fGLI0hd
         3ivg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7/M3vJWfG1Iqpp3J3L+tQPhMOxfEZSLbbAZe6XXYpPI=;
        b=ev4dLsEpJl0NFSQQQDOAKmATlE+Or/rNR1pM/zwDt+nJtjlB1awo684o26EoDsAeZG
         7Q5jaHhhGGcP6lNiDRCXwbwFbzgx16r2kX6rlu5zSyTwhw43Oqz+HNRLT9cicX7hXYAR
         +4qiH184HKFu8q3lSdicso18jLioYJh2dYwhR3nZAXRTUkO2/owMFOttvZ5noOr79q2n
         Cge3i/qlP7xQhT16ZP6mi6LDEHzhzuO7g1Ray5WTDnysl4PxDZXf96uYrPMoIYhenbxK
         ATQntTNRj/W9FDtX2/WlpkA68CdcqCwQZRv9fIpfj0kis2sJEAhZPXIR7StJyIzAHVMr
         cIug==
X-Gm-Message-State: AOAM533RQZtjuh0O1M9GdSA3WdpVMOqpUwA8nhXuM4U3x1KILpdKu/Xa
        +uIC8xUt0GCeAMOu7G1HKog=
X-Google-Smtp-Source: ABdhPJysjrVJTeXIf4FOxp/8wYTTjb6m2bdgr0xP4mWY8rd/LsVamPLH2ZXcaB0gmzJgJi4jXIjtbg==
X-Received: by 2002:a1c:31d6:: with SMTP id x205mr4348071wmx.105.1589554410968;
        Fri, 15 May 2020 07:53:30 -0700 (PDT)
Received: from localhost (pD9E51079.dip0.t-ipconnect.de. [217.229.16.121])
        by smtp.gmail.com with ESMTPSA id h188sm4266082wme.8.2020.05.15.07.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 07:53:30 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 08/11] soc/tegra: Changes for v5.8-rc1
Date:   Fri, 15 May 2020 16:53:08 +0200
Message-Id: <20200515145311.1580134-9-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.8-soc

for you to fetch changes up to e4cc4f54be01b91b3e1b55430709d2a113f4e08f:

  soc: tegra: Fix tegra_pmc_get_suspend_mode definition (2020-05-07 22:03:10 +0200)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Changes for v5.8-rc1

Enables Tegra186 and Tegra194 to be woken from suspend by the PMIC and
exports a bit more information about SoCs via sysfs.

----------------------------------------------------------------
Arnd Bergmann (1):
      soc: tegra: Fix tegra_pmc_get_suspend_mode definition

Corentin Labbe (1):
      soc/tegra: pmc: Select GENERIC_PINCONF

Jon Hunter (4):
      soc/tegra: fuse: Add custom SoC attributes
      soc/tegra: fuse: Trivial clean-up of tegra_init_revision()
      soc/tegra: fuse: Update the SoC revision attribute to display a name
      soc/tegra: pmc: Enable PMIC wake event on Tegra194

Thierry Reding (1):
      soc/tegra: pmc: Enable PMIC wake event on Tegra186

 drivers/soc/tegra/Kconfig              |  1 +
 drivers/soc/tegra/fuse/fuse-tegra.c    | 57 +++++++++++++++++++++++++++++++++-
 drivers/soc/tegra/fuse/fuse-tegra20.c  |  1 +
 drivers/soc/tegra/fuse/fuse-tegra30.c  |  6 ++++
 drivers/soc/tegra/fuse/fuse.h          |  8 +++++
 drivers/soc/tegra/fuse/tegra-apbmisc.c | 32 +++++++++++--------
 drivers/soc/tegra/pmc.c                |  2 ++
 include/soc/tegra/pmc.h                | 15 +++++----
 8 files changed, 102 insertions(+), 20 deletions(-)

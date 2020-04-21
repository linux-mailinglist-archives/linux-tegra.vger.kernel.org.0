Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A19081B31D3
	for <lists+linux-tegra@lfdr.de>; Tue, 21 Apr 2020 23:21:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726124AbgDUVVe (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 21 Apr 2020 17:21:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726112AbgDUVVd (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 21 Apr 2020 17:21:33 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0527DC0610D5
        for <linux-tegra@vger.kernel.org>; Tue, 21 Apr 2020 14:21:33 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id y24so5165118wma.4
        for <linux-tegra@vger.kernel.org>; Tue, 21 Apr 2020 14:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TK7n//gPeG36lihND5HMtLgm//L8iTOGVH+6m3LoRfw=;
        b=XIKtgmreyS0Cr6MKPOKrYxqNc93UbzcWrhNvLYFT9vLZAJagyeJmTIQ8Pm6cD7ezdx
         YuSb9y/DnY/LbqShUXWjH1D/onnkNjCoYWLZ0dxFZABe5sx7vS4Aqb+dfLMKUJTRWbnH
         5C8mmPYlFP52as320wX32lNV88wLvHtEG69BFpT8ikKSIqwSrgdXHbxqSnEnpdtP1CDn
         RImCkCDSIg8OFs0iBA8I6UYsDPm1hJlLz7wVj/DmxOmpK7U6G//o6WIbS5/7eL9jNb/p
         cK/zTDFubnJx7n+7DlAplKXWQN5lvh8PajC5LUnyFvlsvVPJLQnZfzhwq9QLajgPLZcV
         Ia5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TK7n//gPeG36lihND5HMtLgm//L8iTOGVH+6m3LoRfw=;
        b=ihdoXH1mAD5jgt31XunUxg1kKAnxCOiUoSf65JEqtiati2AvPPf4AAGLGh6yvFoixo
         P3XHmojJfwV9eZmulFGIEkINZ+5nj0crQClGDZT0JqqDZNyDIDiARMWZkgkPYmBqRD8Q
         nBrS/RR6OJCWwBLNmVQrawlCiPKIQXWm82jiVWN9PjUNEkXcNxbfvyQSAlhPlaeu95Aa
         X986aQflVmwBxd6hBHsuvmNeLZz68SqbI4CqefIyoUrVNE6KjJgc6N17u9ehWviHO9fX
         ABYhP7Bk7BMbpUwLmYODHU6aEaKoCoBHsFQYkN6ftq0T81Wq1bzYQeqFkKE6cLSu9Awz
         WW9w==
X-Gm-Message-State: AGi0PuaBcgYwoxjp6P50gi1te47VN5KJR7tLJlMBYWtMnKpQjvsSycWm
        euiQDKb2DvCOlWFiDH6tVx4=
X-Google-Smtp-Source: APiQypJHCYt/qQSBjjIeoumdlZTCo2ETQ8TRw1e0/LrPSZlVZ38YwA2+3pNHXDSq+tHbVExjrJwweA==
X-Received: by 2002:a7b:c306:: with SMTP id k6mr6630963wmj.40.1587504091656;
        Tue, 21 Apr 2020 14:21:31 -0700 (PDT)
Received: from localhost (p2E5BEDBA.dip0.t-ipconnect.de. [46.91.237.186])
        by smtp.gmail.com with ESMTPSA id c190sm5252751wme.10.2020.04.21.14.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2020 14:21:30 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org
Subject: [GIT PULL] ASoC: tegra: Fixes for v5.7-rc3
Date:   Tue, 21 Apr 2020 23:21:21 +0200
Message-Id: <20200421212121.3286517-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Liam, Mark,

The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:

  Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.7-asoc

for you to fetch changes up to ff5d18cb04f4ecccbcf05b7f83ab6df2a0d95c16:

  ASoC: tegra: Enable audio mclk during tegra_asoc_utils_init() (2020-04-21 16:53:15 +0200)

This is a set of patches that I was supposed to send out during the
merge window[0], but I somehow messed up my scripts and then didn't
notice that this was missing. I've rebased these patches on top of
v5.7-rc1.

The lack of these are now causing some issues with unbalanced clock
reference counts.

Is there any chance you can pick these up for v5.7-rc3?

Thanks,
Thierry

[0]: https://lore.kernel.org/lkml/20200327154506.GF4437@sirena.org.uk/

----------------------------------------------------------------
ASoC: tegra: Fixes for v5.7-rc3

This contains a couple of fixes that are needed to properly reconfigure
the audio clocks on older Tegra devices.

----------------------------------------------------------------
Sowjanya Komatineni (4):
      ASoC: tegra: Use device managed resource APIs to get the clock
      ASoC: nau8825: Change Tegra clk_out_2 provider to PMC
      ASoC: tegra: Add audio mclk parent configuration
      ASoC: tegra: Enable audio mclk during tegra_asoc_utils_init()

 .../devicetree/bindings/sound/nau8825.txt          |   2 +-
 sound/soc/tegra/tegra_alc5632.c                    |   7 +-
 sound/soc/tegra/tegra_asoc_utils.c                 | 113 ++++++++++-----------
 sound/soc/tegra/tegra_asoc_utils.h                 |   1 -
 sound/soc/tegra/tegra_max98090.c                   |  22 ++--
 sound/soc/tegra/tegra_rt5640.c                     |  22 ++--
 sound/soc/tegra/tegra_rt5677.c                     |   7 +-
 sound/soc/tegra/tegra_sgtl5000.c                   |   7 +-
 sound/soc/tegra/tegra_wm8753.c                     |  22 ++--
 sound/soc/tegra/tegra_wm8903.c                     |  22 ++--
 sound/soc/tegra/tegra_wm9712.c                     |   8 +-
 sound/soc/tegra/trimslice.c                        |  18 +---
 12 files changed, 90 insertions(+), 161 deletions(-)

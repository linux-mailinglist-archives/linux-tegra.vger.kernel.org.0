Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2AE08F16F4
	for <lists+linux-tegra@lfdr.de>; Wed,  6 Nov 2019 14:28:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730705AbfKFN2g (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 6 Nov 2019 08:28:36 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:44858 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726882AbfKFN2g (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 6 Nov 2019 08:28:36 -0500
Received: by mail-pl1-f193.google.com with SMTP id q16so11433413pll.11
        for <linux-tegra@vger.kernel.org>; Wed, 06 Nov 2019 05:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=1g5bmlvDJmzq0j8rw+Hyiq1h7w7jIJ4WDcwt2PpU20g=;
        b=Mo4TAU7fRjbhRaWWEK1LJyvn+DSxubqpdHRD94G9troWEwzLz8YYrBRIS2KdSpX3dT
         FeMeoDlj7TwE3SHuoLTBKK+WrPKt4gh0PazZ1g5ozZLTZDY1XPVJRgI7Y3gApyFnHK/1
         3cFeLTF1BcFuj3Ip+HCsBdu5/XN6JIT4IO2nzkU8wdkue1G52cekATxLLxxMGq70HiPj
         KD2SMv14UvZ/GkEikI7a62KpToNHUOtEaKhrhhq5wGD66CXnWhHliySQH/pY23OEUsqG
         8z4GOFi9XOisHIgTNfRfMeAu0z6FY4WyKVzYa8WTLixMCLiMNJsQHO1OZjQ+X00OG6p4
         2vrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=1g5bmlvDJmzq0j8rw+Hyiq1h7w7jIJ4WDcwt2PpU20g=;
        b=asefDxemXto7yN/6WUHVe7lYvS7EC02DcrSe9K7PuQe/nIrAnxBxfv5Fonb5u4b9gl
         LkAQNL+QbqnvP+yBR5L5tkYK7oGd2612yjA/mYd3hmOPk/FkikqGfnrLkW0UEgO/I9FR
         KxS3lhs/XSoJevozjX5OQXPysmo8tC0A9bpiYLdUFdW+KYXX7RvF+MOZqL/A4+gnzJpK
         vtMDU90y+7EW9ViVPzRtVDm9NCoI72DU7lHYoLcwSJHoK2jZWAXMP6keTskNL5jj/+HV
         gun1ocg0uKqMSi5VKVbTmiMNH8iXbmVDm1V4zxukcT85AK9qh2XWu2EORtqzDYyjgwhs
         4Xnw==
X-Gm-Message-State: APjAAAWK/m0n7/70j5QG5TbeNz8oLaIHPjpWjS51YekmvQOh+Es5Z7x7
        ZVnTfI1/CzxJwrMWZFiFE7WfoQ==
X-Google-Smtp-Source: APXvYqyAyMf4Opoy7bESQRlotkkR0kSWU/mPg+gqk7EyqL30BQrBho6L7bwwesWM6v5WR7oQnljBAw==
X-Received: by 2002:a17:902:ac90:: with SMTP id h16mr2681286plr.147.1573046915172;
        Wed, 06 Nov 2019 05:28:35 -0800 (PST)
Received: from localhost ([49.248.202.230])
        by smtp.gmail.com with ESMTPSA id x20sm23085573pfa.186.2019.11.06.05.28.34
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Nov 2019 05:28:34 -0800 (PST)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, edubezval@gmail.com,
        Amit Daniel Kachhap <amit.kachhap@gmail.com>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Guillaume La Roque <glaroque@baylibre.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Javi Merino <javi.merino@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jun Nie <jun.nie@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 00/11] thermal: clean up output of make W=1
Date:   Wed,  6 Nov 2019 18:58:16 +0530
Message-Id: <cover.1573046440.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Cleanup output of make W=1 inside drivers/thermal. This should allow us to
focus on real issues that tend to get lost in the noise much better.

There is no functional change. This series was generate on top of
linux-next from 20191105.

Regards,
Amit

Amit Kucheria (11):
  thermal: of-thermal: Appease the kernel-doc deity
  thermal: cpu_cooling: Appease the kernel-doc deity
  thermal: step_wise: Appease the kernel-doc deity
  thermal: devfreq_cooling: Appease the kernel-doc deity
  thermal: max77620: Appease the kernel-doc deity
  thermal: mediatek: Appease the kernel-doc deity
  thermal: rockchip: Appease the kernel-doc deity
  thermal: samsung: Appease the kernel-doc deity
  thermal: tegra: Appease the kernel-doc deity
  thermal: amlogic: Appease the kernel-doc deity
  thermal: zx2967: Appease the kernel-doc deity

 drivers/thermal/amlogic_thermal.c    |  6 +++++-
 drivers/thermal/cpu_cooling.c        |  1 +
 drivers/thermal/devfreq_cooling.c    |  3 ++-
 drivers/thermal/fair_share.c         |  4 ++--
 drivers/thermal/gov_bang_bang.c      |  4 ++--
 drivers/thermal/max77620_thermal.c   |  2 +-
 drivers/thermal/mtk_thermal.c        | 12 ++++++------
 drivers/thermal/of-thermal.c         |  2 +-
 drivers/thermal/rockchip_thermal.c   | 22 ++++++++++++++++------
 drivers/thermal/samsung/exynos_tmu.c |  5 ++++-
 drivers/thermal/step_wise.c          |  4 ++--
 drivers/thermal/tegra/soctherm.c     | 15 +++++++++++++--
 drivers/thermal/user_space.c         |  4 ++--
 drivers/thermal/zx2967_thermal.c     |  1 +
 14 files changed, 58 insertions(+), 27 deletions(-)

-- 
2.17.1


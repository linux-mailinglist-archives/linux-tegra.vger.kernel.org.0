Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3865103FD3
	for <lists+linux-tegra@lfdr.de>; Wed, 20 Nov 2019 16:46:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728541AbfKTPqo (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 20 Nov 2019 10:46:44 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:33702 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729752AbfKTPp2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 20 Nov 2019 10:45:28 -0500
Received: by mail-pl1-f193.google.com with SMTP id ay6so14005359plb.0
        for <linux-tegra@vger.kernel.org>; Wed, 20 Nov 2019 07:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=p1oQ2/ApuLBZfJjzJxbReeEfweEJSenuiYCAOd26jOY=;
        b=sx33veXRT/WG71DXlr2LQUN/kHNNUnPt88phqsfsYVlAgZGxBvXbK0fqchczHwjND/
         1EGPyi7lDPIkCrm+8jV6C6faKYzD2LwCZtawDM48VNil5JrKDFYq/j92RN3POFavam4Q
         3M+Tutp1fhrWLVf5po3HELVk4FWWjzopaxpiuFaSbEUlC19y3zCMMjRiDRAIjNgB3Vs4
         BX5kbPUQ3ld73hsLb3GuVJmcROm71Vb4Y1uWFMHNmbnhMSz53nFcT9/CBimpRqCrj33I
         3/U1bD9M8Kdjx6Vb62TMyRxIX5ab6z88+AMp21kU32iV1Yznt8pQb9jqRWu7JaM6XwcU
         sQwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=p1oQ2/ApuLBZfJjzJxbReeEfweEJSenuiYCAOd26jOY=;
        b=TSUzwtoxpDILwV2KSBqJD3U2nZw7H+oYe91oKWTStqsjVs2OWhdBx1SIkEuMRJlWx+
         KlmBPzZ9icGqSWAH6F/a2XLP7HsE1mIg/PXAEcdTxcPVVs7sUB9lyuIGcTdXJ2MkZgTR
         oOcoxerPGVBGuoVugJfCp8ZxXnREKv+6yCfKYzTzEen3nbAMsRu06l5VFvpxEwstSAR7
         PMJWWFvOzUCBlfJp7vQo6GkmwrSwpQmLSsNbl8tlhUIRrwQZ3hcDDlMLrOzXM5JJ9qPJ
         JUSxk/hNll6XP7RvB0ID6cIIfEqlfRHhjzfZdjiXMwx3A5njZiYQ5GOlcJBt/U+cKyMu
         oWNA==
X-Gm-Message-State: APjAAAWav1f3BxkU3XtXR9sqk87s6lRye0ExcjBj06g4jD76txBthemS
        S0RTiVYf60bu/Fu7lD7hcO+J0A==
X-Google-Smtp-Source: APXvYqxogLp6gc4NSWr1kl81LqhVaiFMVmTnBYfJTGwLUMofS4/vu9+JzshkluAWJdxeFvOnWyJZAQ==
X-Received: by 2002:a17:90a:bb82:: with SMTP id v2mr5064560pjr.62.1574264727478;
        Wed, 20 Nov 2019 07:45:27 -0800 (PST)
Received: from localhost ([14.96.110.98])
        by smtp.gmail.com with ESMTPSA id q41sm7643756pja.20.2019.11.20.07.45.25
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Nov 2019 07:45:26 -0800 (PST)
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
Subject: [PATCH v2 00/11] thermal: clean up output of make W=1 
Date:   Wed, 20 Nov 2019 21:15:09 +0530
Message-Id: <cover.1574242756.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Cleanup output of make W=1 inside drivers/thermal. This should allow us to
focus on real issues that tend to get lost in the noise much better.

There is no functional change. This series was generate on top of
linux-next from 20191119.

Changes since v1:
- Add review tags
- Fixed up commit message for devfreq_cooling and samsung changes

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
2.20.1


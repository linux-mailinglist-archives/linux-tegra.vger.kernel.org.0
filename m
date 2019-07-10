Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 533A96185A
	for <lists+linux-tegra@lfdr.de>; Mon,  8 Jul 2019 01:04:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726605AbfGGXEb (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 7 Jul 2019 19:04:31 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:34526 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726105AbfGGXEb (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 7 Jul 2019 19:04:31 -0400
Received: by mail-qk1-f194.google.com with SMTP id t8so11941880qkt.1;
        Sun, 07 Jul 2019 16:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eW6Tv6ue/c3vhq7NdnkhwTsBPO8Mm5FYeXQ1Yihcqz0=;
        b=XaS1sn+/xjVoGpGIfvbzXh5uCwQCTVHjHcLoFi8JSTye4U02Ho1qAQOXFP9JAQwDJR
         OrGO4qtuP2rgY9vNEpj5MQmgvczhL+2VAy6mhl9ikRQU9ZgUNGCE67jd2gussG6+8v/A
         z3TaVUjvf4vQeWziHa0cdiWXz6hLMdoOfayFUWgYH1mYB9+Z/GqLOV9O9MRekPSqC4Bg
         2xiFn3DjTXtZRjLy2F57hrM9QP9wiTEaqhSceYvTPCpTv2MujlZnjEVOJuwln7/FTeGA
         X7xgbRMQqgWHzoFqwTRh8fgw5mPIqP6LydrwbuEb6HyepR2XeIatB1HACFMof5IqteuZ
         xU8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eW6Tv6ue/c3vhq7NdnkhwTsBPO8Mm5FYeXQ1Yihcqz0=;
        b=T2jomA3yqbn3tAr9dsfufuJmZ+ZcNi2jQ58RztYbiaIApl96vqO/2Nd3A7VB//A5G4
         ZamLrIAfM54P3uDwrnBCOQskSxjqbzkFH+ztW899c+/lXxqbS3aYln0P0b4qaSCOpvj6
         ZoeiuULW+LTcFruPPxFfeIyAd1QFb1zXov18+IkL3m7jLaY067+VGUyNwC3cgHRnN3Qn
         B65igk7B6T9pJF6zIU9b4rcfVIQI/TFQqW30kKOuWfM3V7FQsUWPVSzrHiYc8WrrDWGW
         9gQad3AvlMoLtEbUBEPyO7UK+gdH9gX0lPsbDYK7MyYMQpH6EBu5/Ufw0tK1RZdercO0
         XiLQ==
X-Gm-Message-State: APjAAAVHBdphBkUqyArVR5dDnDRbLJDggoyKMj6Fr4RLeEwTl8HGeNhO
        RVLm2kTgQbQGYAblRidOtk4=
X-Google-Smtp-Source: APXvYqx2AriUBPEuFubF0ovfVn/SxH/WDk0cQdJG2r1zSmv9k7TiK15mlb9PUfQkZm/+sfYVVjxV5Q==
X-Received: by 2002:ae9:e707:: with SMTP id m7mr12067684qka.50.1562540670406;
        Sun, 07 Jul 2019 16:04:30 -0700 (PDT)
Received: from localhost.localdomain (ppp79-139-233-208.pppoe.spdop.ru. [79.139.233.208])
        by smtp.gmail.com with ESMTPSA id g22sm2788420qtr.95.2019.07.07.16.04.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 07 Jul 2019 16:04:29 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] Tegra30+ CPU suspend-resume bug-fixes
Date:   Mon,  8 Jul 2019 02:03:56 +0300
Message-Id: <20190707230358.10672-1-digetx@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hello,

This small series addresses two suspend-resume bugs: one affects Tegra30+
due to a typo in the code, other fixes CPU hang on Tegra30 specifically.

Please review and apply, thanks!

Dmitry Osipenko (2):
  ARM: tegra: Fix FLOW_CTLR_HALT register clobbering by tegra_resume()
  ARM: tegra: Use WFE for power-gating on Tegra30

 arch/arm/mach-tegra/reset-handler.S |  6 +++---
 arch/arm/mach-tegra/sleep-tegra30.S |  4 +++-
 drivers/soc/tegra/flowctrl.c        | 19 +++++++++++++++++--
 3 files changed, 23 insertions(+), 6 deletions(-)

-- 
2.22.0


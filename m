Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CC0122405C
	for <lists+linux-tegra@lfdr.de>; Fri, 17 Jul 2020 18:14:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726812AbgGQQNJ (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 17 Jul 2020 12:13:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726798AbgGQQNI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 17 Jul 2020 12:13:08 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0143C0619D2
        for <linux-tegra@vger.kernel.org>; Fri, 17 Jul 2020 09:13:08 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id n22so8507850ejy.3
        for <linux-tegra@vger.kernel.org>; Fri, 17 Jul 2020 09:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cUnkdzNdxg8LD5hqVaIzXy2XoR2S7oQA1tg31Kfen/Y=;
        b=jwIzNTJ5eh4Mo+Z+zqr/8LNBEo2x1KJvOzCP8JRlfzlIcfHFG6zGrKWsFZOC0gD/wg
         xRuna04i9D9aVOSvjq6GQVX49F+lk73WDzcoZ1Bpe8KAaIfOILOc7BkPiYQGMlhreZ3M
         neWy63kPPCFhMLis5L9l8pE12V5zPR0Ezif8wMHs1x3Pw7AvNdX96WDr1JsUqcuftjoU
         IsgHxzkDqWLlryz1vLXdQZFY+B+0LnDpMnDz+otbylOKhqm6JPBkK1hLiOf60CUOiKEs
         2HNG0l/4gwFu4WzYPGZH1+K1bfILT3ytbfc6/wOWoHerf6pKr59TrEzfaZOeGGRaHket
         N1fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cUnkdzNdxg8LD5hqVaIzXy2XoR2S7oQA1tg31Kfen/Y=;
        b=ngy04KpexB3F5rZReETfA4KrURgB5r3+fMZEX2f50EMwZbMYoXlzD2hDt0JlsDkKx6
         LFSi8EfCFSMuJlyNDZOaAKf5keb2aUgEWIuGjONrMTTRMjRG8ckAwAV0AGus2tGnMfoE
         SVt6JHhNNHhOfj5lqfNquhkTvcenYsRz2s2artK4xjImeGhVIbGYzBOFdIPHpfbDTCPP
         c9faQxmT46sU48crXvH7vBqbDeKAC8ORd3VI+c9b/K/J+murbsVj7S8NizNa0qBK4s8k
         0vMHQOsrfr/Ejkt+DJVI7vDPgXslV32Fa5hLz4vO7W1W+yHa6xo9pYZ6m5egKDgEqRJ+
         WR9w==
X-Gm-Message-State: AOAM53298EB9eLEbjtgkhK2xP/6tTLItDBlXI9hyMNQlMx8Pijmtcijv
        PtgYbx0QgL21UCPMPKMknio=
X-Google-Smtp-Source: ABdhPJwDnt2HX9wPDBSm5W8xZz6dR9sdm9xm0mQ9/m+om5cB+kKZfQdbR3TDVTfLWgFZTG6dVGZx0w==
X-Received: by 2002:a17:906:31c8:: with SMTP id f8mr8883155ejf.269.1595002387396;
        Fri, 17 Jul 2020 09:13:07 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id cb7sm8385204ejb.12.2020.07.17.09.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 09:13:06 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/7] memory: tegra: Changes for v5.9-rc1
Date:   Fri, 17 Jul 2020 18:12:56 +0200
Message-Id: <20200717161300.1661002-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200717161300.1661002-1-thierry.reding@gmail.com>
References: <20200717161300.1661002-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c7407:

  Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.9-memory

for you to fetch changes up to 46c019239fb263922d2881847dd6b614c814d867:

  memory: tegra: Add Tegra132 compatible string match (2020-07-15 11:55:21 +0200)

Thanks,
Thierry

----------------------------------------------------------------
memory: tegra: Changes for v5.9-rc1

This contains the Tegra210 EMC frequency scaling support that didn't
make it into v5.8. In addition there are a couple of cleanups and minor
fixes.

----------------------------------------------------------------
Arnd Bergmann (1):
      memory: tegra: Avoid unused function warnings

Christophe JAILLET (1):
      memory: tegra: Fix an error handling path in tegra186_emc_probe()

Dan Carpenter (1):
      memory: tegra: Delete some dead code

Dmitry Osipenko (3):
      memory: tegra: Make debugfs permissions human-readable
      memory: tegra20-emc: Poll EMC-CaR handshake instead of waiting for interrupt
      memory: tegra30-emc: Poll EMC-CaR handshake instead of waiting for interrupt

Geert Uytterhoeven (1):
      memory: tegra: Drop <linux/clk-provider.h>

Jon Hunter (1):
      memory: tegra: Fix KCONFIG variables for Tegra186 and Tegra194

Joseph Lo (2):
      memory: tegra: Add EMC scaling support code for Tegra210
      memory: tegra: Add EMC scaling sequence code for Tegra210

Thierry Reding (2):
      memory: tegra: Support derated timings on Tegra210
      memory: tegra: Add Tegra132 compatible string match

 drivers/memory/tegra/Kconfig                  |   14 +
 drivers/memory/tegra/Makefile                 |    4 +
 drivers/memory/tegra/mc.h                     |    1 +
 drivers/memory/tegra/tegra124-emc.c           |    7 +-
 drivers/memory/tegra/tegra186-emc.c           |   25 +-
 drivers/memory/tegra/tegra186.c               |    4 +-
 drivers/memory/tegra/tegra20-emc.c            |   34 +-
 drivers/memory/tegra/tegra210-emc-cc-r21021.c | 1775 +++++++++++++++++++++
 drivers/memory/tegra/tegra210-emc-core.c      | 2100 +++++++++++++++++++++++++
 drivers/memory/tegra/tegra210-emc-table.c     |   90 ++
 drivers/memory/tegra/tegra210-emc.h           | 1016 ++++++++++++
 drivers/memory/tegra/tegra210-mc.h            |   50 +
 drivers/memory/tegra/tegra30-emc.c            |  122 +-
 13 files changed, 5130 insertions(+), 112 deletions(-)
 create mode 100644 drivers/memory/tegra/tegra210-emc-cc-r21021.c
 create mode 100644 drivers/memory/tegra/tegra210-emc-core.c
 create mode 100644 drivers/memory/tegra/tegra210-emc-table.c
 create mode 100644 drivers/memory/tegra/tegra210-emc.h
 create mode 100644 drivers/memory/tegra/tegra210-mc.h

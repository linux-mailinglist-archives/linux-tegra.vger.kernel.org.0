Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D335F22405B
	for <lists+linux-tegra@lfdr.de>; Fri, 17 Jul 2020 18:14:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726811AbgGQQNH (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 17 Jul 2020 12:13:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726798AbgGQQNH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 17 Jul 2020 12:13:07 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1E6CC0619D2
        for <linux-tegra@vger.kernel.org>; Fri, 17 Jul 2020 09:13:06 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id z17so8131240edr.9
        for <linux-tegra@vger.kernel.org>; Fri, 17 Jul 2020 09:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Q6wQPTgtuBVqC9/lrDF9iatGwKmwcjNiwUtUBaCtoZ4=;
        b=dZs+61wbmVme0tjhyyW9bvS/4nYn+6ONXqr+HZXwJF9Z7y+Y8B85KBPmK3vtIJSAj1
         JH7q74E9r0UCAvLT3MNK9nEu0PdH6Og4MvUwF7wQ4W+QuEnSO3jh7NC1VJR2rywdrVdl
         Ql7IkEKBeET5/uJIIwpG5I9pvxwDg9cLeT6bLuW3+YDHiIysg1cpqQx5j36gpqH71i3G
         jgHdKQQMcs0cx8qu4+vEVR+5hFqjCis6bmX3mwbDoDZixNry3DGRq1sOM/4x/7l6YTq7
         Uq+iEXrOapGqaClJciZGhwLJlrr8BYj/eSxU8nAPI2hMpqeTyccB1/Sr/741o3F0o02m
         AX5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Q6wQPTgtuBVqC9/lrDF9iatGwKmwcjNiwUtUBaCtoZ4=;
        b=WtbMS6pK4ATtNQtm/5Ozdi29XqFV9BIYEhoJXNtFvrmKCUwX/knqH/NoZyGxOAQfCQ
         JRR7aRfPEXRhPde1wXbPoUYjRo95Cz1omTzuTGFrhaIopjDmHv6OLhPVRgL2/q4OuTOw
         6MGCm7Pi14zIjtyXpqiQ2pfvTFo0oFlQ1DJaFgj39tdxTjLMK5EbY1hQBlUL4Ds6di1H
         HDxrX7Y56GhUJy3szV8aO1AskfC0aU3OX6W1LnQfVhTqCf1zoZRauw0n4AMOktlFUEVT
         biWKGgfcMl7Q48z1UwP7iFws3BksfrzNgnV72Kz/zQkw47xCr9F1SYT3xhvfgBrUlBdt
         STvg==
X-Gm-Message-State: AOAM533Le59HEfRk4MyunaxmR0wt1WSyU6wotc4nFTcpz0wp/9DNZwCq
        u2NFqZnuDGDlZikLgHa6OBM=
X-Google-Smtp-Source: ABdhPJwJ457FKePFD/sGNNy2DaY7qKcHBqTQYANUpAm55vgvHImNqiOzoE1VB8pRbc87RJXaUn4HiQ==
X-Received: by 2002:a05:6402:17f6:: with SMTP id t22mr10220988edy.141.1595002385407;
        Fri, 17 Jul 2020 09:13:05 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id bt26sm8617051edb.17.2020.07.17.09.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 09:13:04 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/7] firmware: tegra: Changes for v5.9-rc1
Date:   Fri, 17 Jul 2020 18:12:55 +0200
Message-Id: <20200717161300.1661002-2-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.9-firmware

for you to fetch changes up to 4e87189912bd2167998d82c95bb68f73185069e2:

  firmware: tegra: Update BPMP ABI (2020-07-14 18:03:45 +0200)

Thanks,
Thierry

----------------------------------------------------------------
firmware: tegra: Changes for v5.9-rc1

This has a few cleanups and the addition of a new mechanism to query
debug information from the BPMP.

----------------------------------------------------------------
Jon Hunter (4):
      firmware: tegra: Use consistent return variable name
      firmware: tegra: Prepare for supporting in-band debugfs
      firmware: tegra: Add support for in-band debug
      firmware: tegra: Update BPMP ABI

Timo Alho (1):
      firmware: tegra: Add return code checks and increase debugfs size

 drivers/firmware/tegra/bpmp-debugfs.c | 436 ++++++++++++++--
 drivers/firmware/tegra/bpmp.c         |   6 +-
 include/soc/tegra/bpmp-abi.h          | 913 +++++++++++++++++++++++-----------
 3 files changed, 1038 insertions(+), 317 deletions(-)

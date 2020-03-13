Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06762184D17
	for <lists+linux-tegra@lfdr.de>; Fri, 13 Mar 2020 17:59:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbgCMQ7D (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 13 Mar 2020 12:59:03 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:54619 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726533AbgCMQ7D (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 13 Mar 2020 12:59:03 -0400
Received: by mail-wm1-f65.google.com with SMTP id n8so10772164wmc.4
        for <linux-tegra@vger.kernel.org>; Fri, 13 Mar 2020 09:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HxGHGn3tB3D32yQFzRW5y1d93PxBfuWUMuBxygRtPfk=;
        b=DZgIf698xz8f0XnKqu6AcP8/cziZ1JZP9pk2104IYEMLfMwy6VYOP6TTa3X8HCJ8y2
         +SU6wxMpF4y0n29PUO2qrdsamzcyF0xwTl4OVziSnekDyADApTHjDxGLBDo2LY91P1TJ
         mCkjk4adkWs7LVOGHo7+CRSnRj22WGsOfiGJ9Zr5N5ic/o/IxvmMnLZZlfDO9SsJ8sHq
         xmHds67eHQwgOFUlOXHq4m8sRq+TkXTSkeZ+ivZsYcakpT0ykGz7v7nYSgNbBLywvWRL
         9TU4Ag1Ib6PhK5yWS0wP/knRoMS8sCY1LS2xMA+rCOzny6wI0iQI9J5vehSo0kDEOQ0C
         8NIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HxGHGn3tB3D32yQFzRW5y1d93PxBfuWUMuBxygRtPfk=;
        b=ahgqcx8WqtZkjAJTm8vON3seIhiT56/TkcA0D2ZFqe/DAl8Ta5N1xZZl9aTnq3CMfk
         o/NUCck8htkQv+0o8f7NCWJJuqDaenrFF3HOKw5575ELpaxEjtJ8Zb3XnDJJKXUyH6Nf
         +fjZs7UrPfYlkmUuzx79iZXs5hYvh6aZoUmHHUUWf6LzPK+RZglflIoyZabtwfujiWy0
         g07wcJuqSm9rs1VXKYqE9ZwWOrIhUNsqvwr86bhn5l0TyMbGpkrYrd2jcAWk4WQuKT2g
         ZympVc3SNef37H/m6gOz7nKbo0EPnFytqryiXrB6TBk9Na2ZFKFLzE9vvIVjCvfuW+il
         uF3Q==
X-Gm-Message-State: ANhLgQ0A0P3BxSYWgb0W0bk+Kz70iDcluXCTTJU/hEIYMy92hAjcn4y9
        3KJa3w2SHjPh2CPQwbNd1a4=
X-Google-Smtp-Source: ADFU+vv/jM3n8wXmOoGLCXeZk5i1ZbIXfRterX7TTOiOMv26DvmAtXr2nFT+UjIUAho1xA9ot0YeJA==
X-Received: by 2002:a1c:e442:: with SMTP id b63mr12050983wmh.174.1584118741447;
        Fri, 13 Mar 2020 09:59:01 -0700 (PDT)
Received: from localhost (pD9E516A9.dip0.t-ipconnect.de. [217.229.22.169])
        by smtp.gmail.com with ESMTPSA id l7sm9001198wrw.33.2020.03.13.09.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2020 09:59:00 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 04/10] memory: tegra: Changes for v5.7-rc1
Date:   Fri, 13 Mar 2020 17:58:42 +0100
Message-Id: <20200313165848.2915133-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200313165848.2915133-1-thierry.reding@gmail.com>
References: <20200313165848.2915133-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:

  Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.7-memory

for you to fetch changes up to 141267bffd1dc19a76e4d50e3e4829f85a806875:

  memory: tegra: Correct debugfs clk rate-range on Tegra124 (2020-03-11 15:24:16 +0100)

Thanks,
Thierry

----------------------------------------------------------------
memory: tegra: Changes for v5.7-rc1

These patches contain fixes for EMC scaling debugfs support on Tegra20,
Tegra30 and Tegra124.

----------------------------------------------------------------
Dmitry Osipenko (3):
      memory: tegra: Correct debugfs clk rate-range on Tegra20
      memory: tegra: Correct debugfs clk rate-range on Tegra30
      memory: tegra: Correct debugfs clk rate-range on Tegra124

 drivers/memory/tegra/tegra124-emc.c | 5 +++++
 drivers/memory/tegra/tegra20-emc.c  | 5 +++++
 drivers/memory/tegra/tegra30-emc.c  | 5 +++++
 3 files changed, 15 insertions(+)

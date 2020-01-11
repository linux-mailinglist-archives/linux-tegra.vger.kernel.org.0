Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E333137AA6
	for <lists+linux-tegra@lfdr.de>; Sat, 11 Jan 2020 01:36:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727756AbgAKAgG (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 10 Jan 2020 19:36:06 -0500
Received: from mail-wr1-f48.google.com ([209.85.221.48]:39255 "EHLO
        mail-wr1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727724AbgAKAgF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 10 Jan 2020 19:36:05 -0500
Received: by mail-wr1-f48.google.com with SMTP id y11so3454928wrt.6
        for <linux-tegra@vger.kernel.org>; Fri, 10 Jan 2020 16:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aWpAXNzFoYtxf2UeMCD20vvhdE5STvbqiF5TJSOU+4Y=;
        b=fBgp78rdrXpRlIt1ulc0IOC+sYpunb8zcV0yntvGiMK4Rq1GAR0kXFX0V2sCR79xcd
         Iua8ECLP+06o9zPYxHE9GOK/rQvjf5KzpJwqjrnHS+zv8j+rTKqzsSpGsGklnVXFQHQu
         Jddp3KHmIW2qQJxR5VNr5oJuTaN4/DSGkeayiNaCALXPw1HdDTm3i6DV86ruJVVMdew/
         Nc3KgOGRpEMWahspkCtJX+Cz7+2T8PNHMUBH4ZJT73qz2e4TZ/IMzOm7J7idN50/JPWt
         XD/XAyzcBPpq9NxgKKg2gVmOmDq/NCeEhTjVCCXLAldkJdjnYjpELLBA+HynUpa/mFda
         lkCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aWpAXNzFoYtxf2UeMCD20vvhdE5STvbqiF5TJSOU+4Y=;
        b=eKUT8QV7VzYLp7DR+IXN7MF9R2jFH++xin0RMnZ1xeWqvAKsMLyJ6/6l0YEioDQGDr
         qC0wnHszq1+wYHeJxAiQ7gFAnoNmu14bfDbdT+mOlJ585PHPg4kZ9i8ft+7d7WLFvZCV
         +Ch+VwRQSQ5lDl01Tt2OKiQghjSnyySjB8RzT1FqkLV6qyRVo2JIsWtcZQLe2+TFnnyZ
         rwONS5Ww5DfyUr/sVZmWdJVYouUo8MKQfjVw49Bgy8YlWx0j5GbMpZ6JQOI55ruTIjsj
         bS9a/woVamx32w6qSc4QD23oVeQ6NBKHfdNRVvZrSq4FZ6WOe0Klmu6SaLV7Ipwy+GYx
         dewQ==
X-Gm-Message-State: APjAAAWuJh6IMSci/LzTTRBWJro+SNed+VIR0oqP6SiPi9AoEXks0MPS
        m90LtHcfrRQFrPN3HVp4bv8=
X-Google-Smtp-Source: APXvYqyzp2HbmutsntCMdiaaHJ/1+fk+Rk4v4O+Q+fhHma9PbkMwjsZ7WmZHtELg/Mno1HMVzqGY5Q==
X-Received: by 2002:adf:de86:: with SMTP id w6mr6119495wrl.115.1578702963537;
        Fri, 10 Jan 2020 16:36:03 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
        by smtp.gmail.com with ESMTPSA id m7sm4104792wma.39.2020.01.10.16.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2020 16:36:02 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/8] soc: tegra: Changes for v5.6-rc1
Date:   Sat, 11 Jan 2020 01:35:49 +0100
Message-Id: <20200111003553.2411874-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200111003553.2411874-1-thierry.reding@gmail.com>
References: <20200111003553.2411874-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit e42617b825f8073569da76dc4510bfa019b1c35a:

  Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.6-soc

for you to fetch changes up to 02676345e9b31ad8907af3755960e3cfef575f8d:

  soc/tegra: fuse: Unmap registers once they are not needed anymore (2020-01-10 15:59:43 +0100)

Thanks,
Thierry

----------------------------------------------------------------
soc: tegra: Changes for v5.6-rc1

This adds a couple of optimizations to how the chip ID and straps are
read and adds support for the FUSE block on Tegra194. Included is also a
small optimization for the coupled regulator driver to abort early if no
voltage change has occurred.

----------------------------------------------------------------
Dmitry Osipenko (6):
      soc/tegra: fuse: Add APB DMA dependency for Tegra20
      soc/tegra: regulators: Do nothing if voltage is unchanged
      soc/tegra: fuse: Cache values of straps and Chip ID registers
      soc/tegra: fuse: Warn if straps are not ready
      soc/tegra: fuse: Correct straps' address for older Tegra124 device trees
      soc/tegra: fuse: Unmap registers once they are not needed anymore

JC Kuo (1):
      soc/tegra: fuse: Add Tegra194 support

 drivers/soc/tegra/Kconfig              |  1 +
 drivers/soc/tegra/fuse/fuse-tegra.c    |  3 +++
 drivers/soc/tegra/fuse/fuse-tegra30.c  | 29 +++++++++++++++++++++++++++++
 drivers/soc/tegra/fuse/fuse.h          |  4 ++++
 drivers/soc/tegra/fuse/tegra-apbmisc.c | 34 ++++++++++++++++++++--------------
 drivers/soc/tegra/regulators-tegra20.c |  8 +++++++-
 drivers/soc/tegra/regulators-tegra30.c |  6 ++++++
 7 files changed, 70 insertions(+), 15 deletions(-)

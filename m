Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A5214EB8D
	for <lists+linux-tegra@lfdr.de>; Fri, 21 Jun 2019 17:07:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726043AbfFUPH4 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 21 Jun 2019 11:07:56 -0400
Received: from mail-wr1-f44.google.com ([209.85.221.44]:45760 "EHLO
        mail-wr1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726002AbfFUPH4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 21 Jun 2019 11:07:56 -0400
Received: by mail-wr1-f44.google.com with SMTP id f9so6893898wre.12
        for <linux-tegra@vger.kernel.org>; Fri, 21 Jun 2019 08:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8SXoO37vsaoSj2sxGo5F/QhkOQlE9hJZY36FjuFEIVY=;
        b=pJUpQviWRmSef7UujC28eXyDWxVtPfLbknf2SqMNxCJ8zwI9t9NsTWjnCNbJLo9h9A
         L2egME28BXbiJybuWn/c1wI3y4teru9YCm3ppAnj62BHYtrCG9pnJk7q/MUjQsb7OsZg
         4LFl96D7KHOlx/+HzBqhTGOr6FylYmDAXUlo3j8fRMUf1HvKvgqbezmvp9gggXZDI/eD
         BXJC0omPCTnWAyDVPGEZi0+vAwJ3Wg0LM1eR70nF/Q+7KjjOYOrHcACvUejdkXEgIuDQ
         dlK+9M3egPkvuaEBjoQv4HmTtrn4KhEIH19cuWpScjqlRRhRq0Ek1ZBAEVYBqMKbD2ce
         hTKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8SXoO37vsaoSj2sxGo5F/QhkOQlE9hJZY36FjuFEIVY=;
        b=ilDwrvydsjAuFf1xQSce2LH9Rx77A8fgjMfr0VwmyTvPBF0/1wdJkmhN7pdZ3ZAi3c
         R33Xg5KX/FiM5dL23doHX8xi1BRhsxSmR8opzckzFZnEnyv6coJX/aBtmfJm9fFQyBwU
         idx3Hu5BnCEekXkG7p6vGwpFFZV6EBTltJAsKz5FNiGrDPFc5oV6P9VUiKGbmCI9rqju
         fJ88Bc99I/J1ASEGvgYqexKqFCQL8wJvXOHYldK89S3z/2alBPIs6/n190KY1jNH+r9Q
         GGks6+WHhHAlTLDFoBos76AG2ZTpoUNMf8bctKtqXo/F4JR7VJGyntcxSGxnjBuvW4S9
         oxiQ==
X-Gm-Message-State: APjAAAWh1cmWbtE4Cygiri3+i9adAQPxIi8DMjFDnyY5JJ+BhD28/z6r
        fdWRrktUZeeYw9NLO3Nkx1o=
X-Google-Smtp-Source: APXvYqzFTmvWUMOGjFpTi0w/rO8NGLPCB6G5/5/qIG9wYtKojmB3Ib7i/EulvAk65GBOnjpQYXewAg==
X-Received: by 2002:adf:fb8d:: with SMTP id a13mr6761064wrr.273.1561129675246;
        Fri, 21 Jun 2019 08:07:55 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id s10sm3429144wmf.8.2019.06.21.08.07.54
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 21 Jun 2019 08:07:54 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dave Airlie <airlied@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [GIT PULL] drm/tegra: Changes for v5.3-rc1
Date:   Fri, 21 Jun 2019 17:07:53 +0200
Message-Id: <20190621150753.19550-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Dave,

The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/tegra/linux tags/drm/tegra/for-5.3-rc1

for you to fetch changes up to eb7cf945a8dac8603e6d0759023e9b6cfed7a008:

  host1x: debugfs_create_dir() can never return NULL (2019-06-13 18:23:38 +0200)

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Changes for v5.3-rc1

This contains a couple of small improvements and cleanups for the Tegra
DRM driver.

----------------------------------------------------------------
Greg Kroah-Hartman (1):
      host1x: debugfs_create_dir() can never return NULL

Thierry Reding (5):
      gpu: host1x: Do not output error message for deferred probe
      gpu: host1x: Increase maximum DMA segment size
      gpu: host1x: Do not link logical devices to DT nodes
      drm/tegra: Use GPIO descriptor API
      drm/tegra: dpaux: Make VDD supply optional

 drivers/gpu/drm/tegra/dpaux.c  | 13 +++++++----
 drivers/gpu/drm/tegra/drm.h    |  3 +--
 drivers/gpu/drm/tegra/output.c | 52 +++++++++++++++---------------------------
 drivers/gpu/host1x/bus.c       | 35 +++++++++++++++++++++++++++-
 drivers/gpu/host1x/debug.c     |  3 ---
 drivers/gpu/host1x/dev.c       |  5 +++-
 include/linux/host1x.h         |  2 ++
 7 files changed, 69 insertions(+), 44 deletions(-)

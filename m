Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5D40A2991
	for <lists+linux-tegra@lfdr.de>; Fri, 30 Aug 2019 00:19:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727973AbfH2WTQ (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 29 Aug 2019 18:19:16 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:34527 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728255AbfH2WTQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 29 Aug 2019 18:19:16 -0400
Received: by mail-ed1-f65.google.com with SMTP id s49so5784623edb.1
        for <linux-tegra@vger.kernel.org>; Thu, 29 Aug 2019 15:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8/8WQyIgycnOeWzso8bRkFscVIfCDPQrAJMk5OTdiO0=;
        b=hf0z98o+qLl320eTFsvGEG0HuVQc7VmzREvRNXScZnFtaqhQtnAC5p8+ArjI5FFNUr
         dYJQvw+smb5nHepbtcYZ4cdwMedHuEwjIOo0dgoJQqccdacvR1mGE5ELmW/hUbMSS2vz
         3HVeR2qSvVIpBk3I6YwKEmopzAl+0PzvHFCziRBUM2L5Atz4sVuLg4uhxT2aLAWt/3Kz
         sr8Z7oCS68bNYcSFPSq8GXR6/7C9p2BhXDTe+bRqYVQ9GfnyHklYFxeFypasaj1p+5Y/
         S0vlvXYO5gBLaqG4sLCopOw1+7xhfrF/8bvbLPaMRJ/kQ2rx3yP5dOs/FOAJH4IDvee3
         rKMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8/8WQyIgycnOeWzso8bRkFscVIfCDPQrAJMk5OTdiO0=;
        b=OkdJphnkaizMIXxf8C2jqGFTe2V4PrJExkAmq8RESKQzPq88IntsI+BxhjtK38Ozju
         iXSKII4utq9ANDmo2PpAiuetxawedaCIsW+HRsEGYaDFQuR98PlIlyj+UGOh5oaOrKsl
         nCrI1vX8iSWxp+SywCMi0UJQ4kfLYcatSkoRg/v6FMoDFmRyrXndiWDqIXxtKw9VeNiw
         a0VgUPcb6cEAhtuVDB9F0m1bT/zyWipudvjTYLAaQiSEzicHTzc2sdONBgK6H/VzOCWG
         t/SnrHTPt1RcTbd8IUjM0iRuLGcHlOKcLyN+jO9uz8uuscBOudfT2TbvQtyFUSjPs9sn
         3RGA==
X-Gm-Message-State: APjAAAV1T1B8WyDCINU+Mdk7Sxq/9kGyarzsDOqdVg1ZIrDq0exgN+oS
        Emz7jGnhb21ZLKog3zK4hxShbMMh
X-Google-Smtp-Source: APXvYqwdaLetoW06qWHrg42mkiSvAhpZ4E6lIjat9gqFx0UbFFBNwst/VZbJ7U6V6Gn2F6VAtFVm2w==
X-Received: by 2002:aa7:d80d:: with SMTP id v13mr7006500edq.168.1567117154945;
        Thu, 29 Aug 2019 15:19:14 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
        by smtp.gmail.com with ESMTPSA id x42sm672008edm.77.2019.08.29.15.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 15:19:13 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Nagarjuna Kristam <nkristam@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/7] Replace Tegra FUSE API by nvmem API
Date:   Fri, 30 Aug 2019 00:19:04 +0200
Message-Id: <20190829221911.24876-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The nvmem API provides a generic API to retrieve the kind of information
currently retrieved using the custom Tegra FUSE API. Convert the Tegra
FUSE driver to be an nvmem provider and export cells used by existing
drivers.

The three non-SoC drivers included in this series are meant to serve as
examples for how to use this. I'm not Cc'ing them to the subsystem
maintainers because the idea is to first merge the soc/tegra patches and
after that convert the consumers. Once the first patches are applied, I
will send out the consumers conversion patches to the respective
subsystems.

What's not included in this series is a cleanup patch that finally
removes the custom Tegra FUSE API. I'll follow up with that once these
patches have been applied.

Thierry

Thierry Reding (7):
  soc/tegra: fuse: Restore base on sysfs failure
  soc/tegra: fuse: Implement nvmem device
  soc/tegra: fuse: Add cell information
  soc/tegra: fuse: Register cell lookups for compatibility
  drm/nouveau: tegra: Use nvmem API
  phy: tegra: xusb: Use nvmem API
  thermal: tegra: Use nvmem API

 .../gpu/drm/nouveau/nvkm/subdev/clk/gm20b.c   |  12 +-
 drivers/phy/tegra/xusb-tegra124.c             |  10 +-
 drivers/phy/tegra/xusb-tegra186.c             |   7 +-
 drivers/phy/tegra/xusb-tegra210.c             |  10 +-
 drivers/soc/tegra/fuse/fuse-tegra.c           | 193 +++++++++++++-----
 drivers/soc/tegra/fuse/fuse-tegra30.c         | 154 ++++++++++++++
 drivers/soc/tegra/fuse/fuse.h                 |   8 +
 drivers/thermal/tegra/soctherm-fuse.c         |  19 +-
 drivers/thermal/tegra/soctherm.c              |   4 +-
 drivers/thermal/tegra/soctherm.h              |   9 +-
 drivers/thermal/tegra/tegra124-soctherm.c     |   8 -
 drivers/thermal/tegra/tegra132-soctherm.c     |   8 -
 drivers/thermal/tegra/tegra210-soctherm.c     |   8 -
 13 files changed, 344 insertions(+), 106 deletions(-)

-- 
2.22.0


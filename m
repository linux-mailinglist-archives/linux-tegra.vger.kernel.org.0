Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECA881CA802
	for <lists+linux-tegra@lfdr.de>; Fri,  8 May 2020 12:14:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725825AbgEHKOG (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 8 May 2020 06:14:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbgEHKOF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 8 May 2020 06:14:05 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13BB4C05BD43
        for <linux-tegra@vger.kernel.org>; Fri,  8 May 2020 03:14:04 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id e26so9635404wmk.5
        for <linux-tegra@vger.kernel.org>; Fri, 08 May 2020 03:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vSVzsNo/f2HsblA9EhDyIIGLzh8Z4JeTmAlaXX4Bxm4=;
        b=JMFcWPz3oKo6z2O/k/rTcfj414wMLqtRujLQ3nUf2rUVeOk7nef9GjvA/55CeCJTr7
         VM7fqFtA7xHmtHRr+m1Zd/Xnj9HrQHl95HqD7qjSXNVYBDNoOjTAJWnlxS5lq/xnw/hb
         9YDqJL5vCRgbvS5krnmP9L0XRhd5OU/KLgQnVx4jxlGfWADZ3BhYx7aA70CvChSB0RoI
         SWGh5kQvtxBr2rnzg0Ksrfh69bspWnLhX0zY6f1JXfpVDKWivciC85TX89Tz5iLq9dHK
         e5OG4ylP4wfe7i1DvZqzotvxG4Qr76xyHnjQyOcxJ5K6j75BXlIpVI0LHjiO4cw0VL7g
         hnjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vSVzsNo/f2HsblA9EhDyIIGLzh8Z4JeTmAlaXX4Bxm4=;
        b=DTECGddm3GyMsnsF7ejeG47fApTykbjTzR66neDOu9vqvTKZNczv4xS3dxFqlBik8y
         /RACfwo92yKGI2H8pMe13sNQAZcdI6vzC/Rk1FkiQEAAK0GRk/SlOUsLFD/ZqtTSM1NN
         8XT7A+SQkfeqlqxy6xwrXDF1StZFbHDPG2A26oNZ0rCmmodFQv09dyVgm2oDLsboo1IN
         BNoKAf4L1NccDPVc9t266WxkU2kU3OJn+P4KTgkMQBX+HvZqSTf2OZ3SGRiSxhSGT6eX
         5QtCsAAhlD9zBx534UuaY9igPxOaDhLGcDVqxSlb4vAe08x0WC5O4CBhkmavYK8Daco2
         jIoQ==
X-Gm-Message-State: AGi0PuaENg7yyI8vtXvyN6QodWjgepLGQaWGGDey7UhNlJ5QkWmLnYDQ
        6MX0C6GAw8/ZGqOvB55Owb0=
X-Google-Smtp-Source: APiQypJQNxGUMRRBHHoLIP9X4chOGOOgTS4J3ZHvpJEMuH3vJqu4bC631vKsVd469lBypyffY4xF7A==
X-Received: by 2002:a1c:1d3:: with SMTP id 202mr9291808wmb.145.1588932842798;
        Fri, 08 May 2020 03:14:02 -0700 (PDT)
Received: from localhost (p2E5BE57B.dip0.t-ipconnect.de. [46.91.229.123])
        by smtp.gmail.com with ESMTPSA id 18sm313743wmj.19.2020.05.08.03.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2020 03:14:01 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dave Airlie <airlied@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [GIT PULL] drm/tegra: Fixes for v5.7
Date:   Fri,  8 May 2020 12:13:55 +0200
Message-Id: <20200508101355.3031268-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Dave,

The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:

  Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/tegra/linux tags/drm/tegra/for-5.7-fixes

for you to fetch changes up to 4010e729349fcab69183f338fe3743df17a473a0:

  gpu: host1x: Use SMMU on Tegra124 and Tegra210 (2020-04-28 11:44:07 +0200)

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Fixes for v5.7

This contains a pair of patches which fix SMMU support on Tegra124 and
Tegra210 for host1x and the Tegra DRM driver.

----------------------------------------------------------------
Thierry Reding (2):
      drm/tegra: Fix SMMU support on Tegra124 and Tegra210
      gpu: host1x: Use SMMU on Tegra124 and Tegra210

 drivers/gpu/drm/tegra/drm.c |  3 ++-
 drivers/gpu/host1x/dev.c    | 59 ++++++++++++++++++++++++++++++++++++++++++---
 include/linux/host1x.h      |  3 +++
 3 files changed, 60 insertions(+), 5 deletions(-)

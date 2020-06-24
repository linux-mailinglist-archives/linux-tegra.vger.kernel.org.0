Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA5C620799A
	for <lists+linux-tegra@lfdr.de>; Wed, 24 Jun 2020 18:53:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404173AbgFXQxF (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 24 Jun 2020 12:53:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404017AbgFXQxE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 24 Jun 2020 12:53:04 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A0CDC061573
        for <linux-tegra@vger.kernel.org>; Wed, 24 Jun 2020 09:53:04 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id z17so2008383edr.9
        for <linux-tegra@vger.kernel.org>; Wed, 24 Jun 2020 09:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8ykskx82s4AmCuTWYxay1plvnN+S8KauOmt7zyXl/Vs=;
        b=l/C+4LhE0NI8HOY7ODUg13gL6Ulp1iai1hMujVDBu6QPnqzazBz6eTLyNslEhSAJs5
         EIWAYACp+NGKasRZnkxIBlXDV8616u/7LttwKW4IuMeOsvdrSUCA4FXL3y3qeazcEj/L
         PPlDZ8YlNhM9VDB712YQi0Z/7Ghylge8LS5VaAvWR4kYaNDgB9cH4zHpy0Gax9/QXC/m
         0ewwq5CFmYjLbSe6ts32uZ2PNQiaYOPtAqI36PO9xbatxFxww5qpg2UPoHC1nyzXFQJs
         PxpARezCOsrqdNupn3YHPalXILFjuTCjkI6MeecZ13knfCHF1lYaYQyDtp3+alld+JM/
         8yUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8ykskx82s4AmCuTWYxay1plvnN+S8KauOmt7zyXl/Vs=;
        b=mdf9+KgFXoIuqPUIOnCGXA4n/P2MYtiLqMvrHCkVTBeJ6P37oMJD3E1VuNg6FvptGE
         bQ2wZBpPV2WZlB2vGBs57r2GWZech8Yv/YbIX12dvj9fqrEJ0Sp6Pmiy8D/C7lcb96UC
         R4MwJ2kUzt/i06gqGAuQ+QVfIt4hqClF6sGoIgbjAjzqOj9JlAgBwIvkmM5IXmo6e1MM
         6xuaeXjZxWJb9Kh3Z+GzXy6DhwNO8ehG83IqApGXKH6QP2JOv1F/NLi3gYt3qH7hh/p8
         wO+iDwy2sHsHXIiWWng2xDriWat3KoUd6JNigMnpgnM8Y4hOSiw0Acq8I5xef89uXPhz
         sZdw==
X-Gm-Message-State: AOAM533ecs/fSupS5Bfuy92D6GR8DRi65yXP6tMtL3bn6PjK4imcOZAO
        +Rof0dK+l1+Q9F3fB/BR0tM6OkT+
X-Google-Smtp-Source: ABdhPJxOK2EfCi4iXbYQR1XqwiHBAgTKwQWnt5sFo9PHvNZ/MoCiRcDA3smtZgyi51Xc949pIgZGbA==
X-Received: by 2002:a05:6402:1c8f:: with SMTP id cy15mr17846851edb.308.1593017582672;
        Wed, 24 Jun 2020 09:53:02 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id n17sm15695902ejj.75.2020.06.24.09.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 09:53:01 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dave Airlie <airlied@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [GIT PULL] drm/tegra: Fixes for v5.8-rc3
Date:   Wed, 24 Jun 2020 18:52:54 +0200
Message-Id: <20200624165254.2763104-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Dave,

The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c7407:

  Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/tegra/linux tags/drm/tegra/for-5.8-rc3

for you to fetch changes up to fce3a51d9b31312aa12ecb72ffabfc4c7b40bdc6:

  drm/tegra: Add zpos property for cursor planes (2020-06-16 19:03:25 +0200)

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Fixes for v5.8-rc3

This contains a fairly random assortment of fixes for various minor
issues.

----------------------------------------------------------------
Christophe JAILLET (1):
      gpu: host1x: Clean up debugfs in error handling path

Colton Lewis (1):
      gpu: host1x: Correct trivial kernel-doc inconsistencies

Nicolin Chen (1):
      drm/tegra: hub: Do not enable orphaned window group

Thierry Reding (4):
      gpu: host1x: Register child devices
      drm/tegra: hub: Register child devices
      gpu: host1x: Detach driver on unregister
      drm/tegra: Add zpos property for cursor planes

 drivers/gpu/drm/tegra/dc.c  |  1 +
 drivers/gpu/drm/tegra/hub.c | 17 +++++++++++++++--
 drivers/gpu/host1x/bus.c    |  9 +++++++++
 drivers/gpu/host1x/dev.c    | 11 +++++++++--
 include/linux/host1x.h      |  3 +++
 5 files changed, 37 insertions(+), 4 deletions(-)

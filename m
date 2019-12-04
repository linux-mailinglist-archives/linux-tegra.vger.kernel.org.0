Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70F8F112BCD
	for <lists+linux-tegra@lfdr.de>; Wed,  4 Dec 2019 13:43:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727815AbfLDMnV (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 4 Dec 2019 07:43:21 -0500
Received: from mail-wm1-f49.google.com ([209.85.128.49]:40504 "EHLO
        mail-wm1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727649AbfLDMnV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 4 Dec 2019 07:43:21 -0500
Received: by mail-wm1-f49.google.com with SMTP id t14so7732967wmi.5
        for <linux-tegra@vger.kernel.org>; Wed, 04 Dec 2019 04:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1wn2jp4LT9iwuBpIKIKfX+5+LhAsHTdc2jkOsNBwo3k=;
        b=gADshrIjiFTNXU4V4/9GR2mzUyDpOWE5gLlWmjjc5Lj8M0CIXSkTl7PEdu7i8Hi2zF
         3wmrar6wZsPO0EMw0YJJyL2dUVlI/MKI19q27Xw4qZc/yJHlsEwXfVXCvo3HbShm82nT
         HOX5V4zRrYWlzHanpg8JRunjtVBISZ9Z4ByUivt+qfSr0c2VpW1Gro5dLp/1MaNO9OSh
         xsPf2CDN4uJ/R+F9kmhsfoAdyX/H/2er/SbJZXRky/om4kj7S9p/WE8hE2efzWth7Bfu
         WuXvL3TsH8KOi1T751ExEyQHGTWq4MSqsPwGu+q2odY2QkiqVcu2//VaHfRyqKWer5ds
         pl0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1wn2jp4LT9iwuBpIKIKfX+5+LhAsHTdc2jkOsNBwo3k=;
        b=hwjGN9gL5T8hdCt2OsKXWNujHoES/ELYrKW8UOht4HOVEzP4/fmD7BESJC8aR78CV+
         DlGob2qQn7u2Jz0H5Wsef+KXPWo1he9oGujFsP7K4/BDBO8XcvmdMHUSYzAqLbU50cVg
         G8/UzTSi7u1rNBYgWhRchJVidvkb+nwfF4Te1OdLUgMFayQfeks+UjJICpmf1bow3P+/
         MKHKkZndQk3gNYhHvBrNSIhToLPW6S9oAF10uD1YQ/61ozrU6WG1j3BJ4ySkJpBXcdrV
         FCADbDrpDT0cepZ/vfw5JrnJNgNhSB/Aezk6znUyz2C8kjzYt/8u57nK/FxPfO3GbfdS
         2eUQ==
X-Gm-Message-State: APjAAAWxSopVfSU4bdJTtwZlaMCzNBLUwrDZUM2+8aoMhX5OCwxxOcDX
        BW6OKOxYlwQOknKswyYjwo0=
X-Google-Smtp-Source: APXvYqzrzAwdOyUnm1fxDZs8ZrIFvrDk9DVCpjpWgK9h3WMWg/COKu22NStLyb4MyTNU6QMNakR1pg==
X-Received: by 2002:a05:600c:24d1:: with SMTP id 17mr30212448wmu.151.1575463398758;
        Wed, 04 Dec 2019 04:43:18 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id l26sm6696512wmj.48.2019.12.04.04.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2019 04:43:17 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dave Airlie <airlied@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [GIT PULL] drm/tegra: Fixes for v5.5-rc1
Date:   Wed,  4 Dec 2019 13:43:16 +0100
Message-Id: <20191204124316.3534855-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Dave,

The following changes since commit 84db889e6d827eefc3dde130fec8382d2dcb23ac:

  drm/tegra: Unconditionally select IOMMU_IOVA (2019-11-01 10:49:29 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/tegra/linux tags/drm/tegra/for-5.5-rc1-fixes

for you to fetch changes up to d66dfcf80d0f55f95b9ea4a45ca41cc7115e9789:

  drm/tegra: Run hub cleanup on ->remove() (2019-12-04 13:38:16 +0100)

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Fixes for v5.5-rc1

This is a set of small fixes, mostly for regressions introduced with the
DMA API and DisplayPort support in the main pull request for v5.5-rc1.

----------------------------------------------------------------
Thierry Reding (9):
      drm/tegra: hub: Remove bogus connection mutex check
      drm/tegra: gem: Properly pin imported buffers
      drm/tegra: gem: Remove premature import restrictions
      drm/tegra: Use proper IOVA address for cursor image
      drm/tegra: sor: Implement system suspend/resume
      drm/tegra: vic: Export module device table
      drm/tegra: Silence expected errors on IOMMU attach
      drm/tegra: sor: Make the +5V HDMI supply optional
      drm/tegra: Run hub cleanup on ->remove()

 drivers/gpu/drm/tegra/dc.c    | 18 ++++++++--------
 drivers/gpu/drm/tegra/drm.c   |  7 +++---
 drivers/gpu/drm/tegra/gem.c   | 50 +++++++++++++++++++++++++++++++++++++------
 drivers/gpu/drm/tegra/hub.c   |  3 ---
 drivers/gpu/drm/tegra/plane.c | 11 ++++++++++
 drivers/gpu/drm/tegra/sor.c   | 38 +++++++++++++++++++++++++++-----
 drivers/gpu/drm/tegra/vic.c   |  7 +++---
 7 files changed, 104 insertions(+), 30 deletions(-)

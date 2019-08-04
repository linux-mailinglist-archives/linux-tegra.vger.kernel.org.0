Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E386580A1A
	for <lists+linux-tegra@lfdr.de>; Sun,  4 Aug 2019 11:41:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726039AbfHDJlr (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 4 Aug 2019 05:41:47 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:36999 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726037AbfHDJlr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 4 Aug 2019 05:41:47 -0400
Received: by mail-lj1-f196.google.com with SMTP id z28so22468417ljn.4
        for <linux-tegra@vger.kernel.org>; Sun, 04 Aug 2019 02:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Un84htxySnyq/oPIbkJczaEF16pCyxnlWEcyUuYZ++A=;
        b=snfJhpEwOpxTOv7rx5JXLprIOInh39GnEC269uJ06AxibCy3t9kvm8xoExQwOhQ31+
         8eL6s2/G5w3jYQxBZuHAWWUA7elVp9g5fst3fXLbz0olSN5Zg81A6ZFnZPc1kd09vvZH
         bwjPH9dgw42QiRUw6oKeM8WYVnQrlcZUcOOe4H/2PFv1HPbfg3E+GmVCQtdrS50gvRLf
         qSnBiGJFiecVEhWwa8qVHZpQvLmviBHjSn+8L0uyIRlY0RNZwY2ug/l9tvu2iXI7K7tj
         ep7lopCfJvmvdcTwkZHrz/K83mv+0hyYPpoXazj5/estMkFBQwfqDP6GD/P/mgvalTBw
         Hqxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=Un84htxySnyq/oPIbkJczaEF16pCyxnlWEcyUuYZ++A=;
        b=SpMr1yEM5kCnTb60yZZummrWGIzNMVWAB4YeE+Ixsxn2tGCGEr85Bzg2E/pDfKqF7U
         gZWnCbkqLZTctaQxyMYWreEVEqOPWvPcH2NgfliCnqKlnjCJ9WuTX4Cr6fgJUZ0q1Hf+
         bn7WXUp759of8S0wlrcCkob4XvWI7XnmogEsGLBvYcxzffdbbO+UJteCX/sZ+fb/6Xce
         vqzbP1ELTC4U9jCwcxzrl2yp2T1Lv9gkMy0OQHAniOwNKGZ/BLMoZ/yfZrROj2drBU9n
         MB2Jo53Ndw4ZcxYykse1YZLCLE3sEbiOFl46kH9rfzzzpfKin+sfcDq0tTjzzPSVMXXT
         yIag==
X-Gm-Message-State: APjAAAVSq9kvwJTvFn05pq6o1i4Jd1KNeT0BUQQd0t2OhRrpy82HR6cw
        yseBCFtCwXF7M/FRL/DM7CI=
X-Google-Smtp-Source: APXvYqzzpOhTKGfm1bk8OZZm2/IS1cErWTCwTOeEnhiTZjQDyTQ18VytbKnA7vZ6lyAxy0HDDY4axw==
X-Received: by 2002:a2e:3604:: with SMTP id d4mr25146197lja.85.1564911705326;
        Sun, 04 Aug 2019 02:41:45 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id 25sm16230194ljn.62.2019.08.04.02.41.44
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 04 Aug 2019 02:41:44 -0700 (PDT)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     dri-devel@lists.freedesktop.org
Cc:     Brian Starkey <brian.starkey@arm.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, Liviu Dudau <liviu.dudau@arm.com>,
        malidp@foss.arm.com, Russell King <linux@armlinux.org.uk>,
        Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2 0/4] drm: drop drmP in tda998x, tegra, arm, armada
Date:   Sun,  4 Aug 2019 11:41:28 +0200
Message-Id: <20190804094132.29463-1-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This set of patches is one of the final steps before
we have succeeded to stop using drmP.h in all of drm/.

There is a few patches in flight through other trees
and the plan is that all users shall be gone in the
upstream kernel after next merge window.

The patches has seen build test with various configs
with various architectures.

The patches has been sent before, but to my best knowledge
they have not been applied anywhere.
All four patches are based on drm-misc-next,
but I checked that the tda998x patch can be applied to
the tda998x tree.

There are no dependencies between the patches.

v2:
- rebase on top of drm-misc-next

To maintainers: (Assuming the patch are OK)
Please let me know if you take the patch, or request
me to apply it to drm-misc-next.
Or let me me know if the patch should be based on another tree.

	Sam


Sam Ravnborg (4):
      drm/i2c/tda998x: drop use of drmP.h
      drm/tegra: drop use of drmP.h
      drm/armada: drop use of drmP.h
      drm/arm: drop use of drmP.h

 drivers/gpu/drm/arm/hdlcd_crtc.c        | 12 +++++++-----
 drivers/gpu/drm/arm/hdlcd_drv.c         |  7 ++++++-
 drivers/gpu/drm/arm/malidp_crtc.c       | 11 +++++++----
 drivers/gpu/drm/arm/malidp_drv.c        |  8 +++++---
 drivers/gpu/drm/arm/malidp_drv.h        |  7 ++++---
 drivers/gpu/drm/arm/malidp_hw.c         |  7 ++++++-
 drivers/gpu/drm/arm/malidp_mw.c         |  5 +++--
 drivers/gpu/drm/arm/malidp_planes.c     |  4 +++-
 drivers/gpu/drm/armada/armada_crtc.c    | 10 +++++++---
 drivers/gpu/drm/armada/armada_debugfs.c |  8 ++++++--
 drivers/gpu/drm/armada/armada_drm.h     |  5 ++++-
 drivers/gpu/drm/armada/armada_drv.c     |  8 ++++++++
 drivers/gpu/drm/armada/armada_fb.c      |  3 +++
 drivers/gpu/drm/armada/armada_fbdev.c   |  3 +++
 drivers/gpu/drm/armada/armada_gem.c     |  7 ++++++-
 drivers/gpu/drm/armada/armada_overlay.c |  8 +++++---
 drivers/gpu/drm/armada/armada_plane.c   |  4 +++-
 drivers/gpu/drm/armada/armada_trace.h   |  5 ++++-
 drivers/gpu/drm/i2c/tda998x_drv.c       |  2 +-
 drivers/gpu/drm/tegra/dc.c              | 13 +++++++++----
 drivers/gpu/drm/tegra/dpaux.c           |  5 +++--
 drivers/gpu/drm/tegra/drm.c             |  8 ++++++++
 drivers/gpu/drm/tegra/drm.h             |  3 +--
 drivers/gpu/drm/tegra/dsi.c             |  8 +++++---
 drivers/gpu/drm/tegra/fb.c              |  6 ++++--
 drivers/gpu/drm/tegra/gem.c             |  3 +++
 drivers/gpu/drm/tegra/gem.h             |  1 -
 drivers/gpu/drm/tegra/gr2d.c            |  1 +
 drivers/gpu/drm/tegra/hdmi.c            |  5 +++++
 drivers/gpu/drm/tegra/hub.c             |  3 ++-
 drivers/gpu/drm/tegra/hub.h             |  1 -
 drivers/gpu/drm/tegra/plane.c           |  1 +
 drivers/gpu/drm/tegra/sor.c             |  3 +++
 drivers/gpu/drm/tegra/vic.c             |  1 +
 34 files changed, 137 insertions(+), 49 deletions(-)



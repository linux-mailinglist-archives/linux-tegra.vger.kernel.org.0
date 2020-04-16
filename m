Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 428F01ACEAC
	for <lists+linux-tegra@lfdr.de>; Thu, 16 Apr 2020 19:26:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389624AbgDPR0Z (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 16 Apr 2020 13:26:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726514AbgDPR0Y (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 16 Apr 2020 13:26:24 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D6CCC061A0C
        for <linux-tegra@vger.kernel.org>; Thu, 16 Apr 2020 10:26:24 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id q19so8659221ljp.9
        for <linux-tegra@vger.kernel.org>; Thu, 16 Apr 2020 10:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZiCNvkh9T+OdzJSCJmGWzbdtJNrMVTbSIfhdr+GotcQ=;
        b=Ws4QXhiAvGNKHTMXP4AWNtMdYdAPVNiy3ni7wl4QQPu6caTsD4AcUpa2/HKUzesULz
         RtTxjc7IBxFagwe4tNuD0sdvpf5FC/uTDYTlahrNXVd8l46j93mdjnosiExaiph3HZMf
         jjxjyrvH7RRQRKMLgdA0XMG1uUcQlCjTibpp1EdDcvjEdqCgZcgD+QaSjKDaG7T9Vrdy
         XWBNgnlBCrDgC0GUSWp4DhfmvZy7OBjOzuE0jH5BbsM3nDiSEhR7id+PXrrG+IDf5ZSS
         yJKAfOyjf+VoeiVZXF8ZkN8O0/dj4LZbRZZTlHu7gfXMEktN7qTLOUzLlUvKCs4NstaF
         zXPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZiCNvkh9T+OdzJSCJmGWzbdtJNrMVTbSIfhdr+GotcQ=;
        b=pBdS3nZdFD4wtH2XkaVljNi0nnPcJ9fUGwUr+bj7AxZ9IhTSJMsB+Ylrf8Ue3zbt2Z
         4YL0F48tIYbzTG8dBU4i7mbnAnNEOL53SAhTwUZwHfhTnCHqga/Kz6XGBTnC5At4033D
         lgXyO4JjCjn3RLB/HfJFLuJT/Hk441mZ9SPMM/mhDNSx28ti6szBrcoGMMMqc58xilHp
         2kdFAVU2Y9OyDsc+ndYkz1UWo1RcfV5wiGCEchYqoGRieF6jhFUVwTOeRWa0p3egL4tJ
         pEjyQRYQ426hsy9AvZrHL1XctZ9OTZEaDcGZ8MHVNVQmLhXyfwCeUhc59j1U3bfmCq3U
         Jv+Q==
X-Gm-Message-State: AGi0PuZOt6sa1JkgB4hESZ3byUy9b//eklbS4I83tm4gnCgdJ+XlHU6I
        GKfduTza0VBJ0V0vRQCB0ZE=
X-Google-Smtp-Source: APiQypIIC9kjgFxL1oSMIpuH+mLD6+GljcyOy3LohW83aCcQbZ1bimLKfLED+Ewq+wglUvrCkLaTrA==
X-Received: by 2002:a2e:9a82:: with SMTP id p2mr7248376lji.279.1587057982791;
        Thu, 16 Apr 2020 10:26:22 -0700 (PDT)
Received: from localhost.localdomain (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.gmail.com with ESMTPSA id q26sm5367381ljg.47.2020.04.16.10.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2020 10:26:22 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH v3 0/2] Support DRM bridges on NVIDIA Tegra
Date:   Thu, 16 Apr 2020 20:24:03 +0300
Message-Id: <20200416172405.5051-1-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hello,

This small series adds initial support for the DRM bridges to NVIDIA Tegra
DRM driver. This is required by newer device-trees where we model the LVDS
encoder bridge properly.

Changelog:

v3: - Following recommendation from Sam Ravnborg, the new bridge attachment
      model is now being used, i.e. we ask bridge to *not* create a connector
      using the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag.

    - The bridge is now created only for the RGB (LVDS) output, and only
      when necessary. For now we don't need bridges for HDMI or DSI outputs.

    - I noticed that we're leaking OF node in the panel's error code path,
      this is fixed now by the new patch "Don't leak OF node on error".

v2: - Added the new "rgb: Don't register connector if bridge is used"
      patch, which hides the unused connector provided by the Tegra DRM
      driver when bridge is used, since bridge provides its own connector
      to us.

    - Please notice that the first "Support DRM bridges" patch was previously
      sent out as a standalone v1 change.


Dmitry Osipenko (2):
  drm/tegra: output: Don't leak OF node on error
  drm/tegra: output: rgb: Support LVDS encoder bridge

 drivers/gpu/drm/tegra/drm.h    |  2 ++
 drivers/gpu/drm/tegra/output.c | 19 ++++++++++++++-----
 drivers/gpu/drm/tegra/rgb.c    | 34 ++++++++++++++++++++++++++++++++++
 3 files changed, 50 insertions(+), 5 deletions(-)

-- 
2.26.0


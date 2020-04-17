Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D91FA1AE41D
	for <lists+linux-tegra@lfdr.de>; Fri, 17 Apr 2020 19:54:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730035AbgDQRyu (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 17 Apr 2020 13:54:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729980AbgDQRyt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 17 Apr 2020 13:54:49 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7462DC061A0C
        for <linux-tegra@vger.kernel.org>; Fri, 17 Apr 2020 10:54:49 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id u6so2935960ljl.6
        for <linux-tegra@vger.kernel.org>; Fri, 17 Apr 2020 10:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kUgkvGxwUTj//f5ZA1Y2QPcTYYMvVcKNmfn7DC/ae88=;
        b=jAGzA03gM2tyI7DEuYLXPYxmhX75m/zzh07gPgQHCIBoFLlx3ef2hZO69f4ELyWmGD
         qZuCUePvuYuj3zjMUphXMqz/Wbd20m8rQHudTDWMXKxvxrcnHbWT3qDwBPWWhmbfy2qm
         +KpD3KMOza8QKHR+pkLxNTSBQ5vtWHsIjAlNf3YUvXPLxpseeXcyY3BxEFYfASVUPUG5
         XjngArpReFSx4M+Y5GHki3xpTKn+hM0bWBIWxDbddGlVafcMCPZEoNUerHU9IsMUzw56
         COU8sMWkVeyUN9aJJwUO3BhTaZ/UEW45XUJlR7Pq57cIxQDOxdbOYUTZbe0CX4+2CwRK
         u4Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kUgkvGxwUTj//f5ZA1Y2QPcTYYMvVcKNmfn7DC/ae88=;
        b=MHAj1P1AXpEIML2RozD9zxB3f4Oo/X3pm3cUqocc/nxj6F5O6BKFI4jMoafcd8awpj
         UoRCFRkwxXInCxdCWwNXtvHSdiKa2OXqdQL/tVQ2xQJFrcZrSwlCdgOE2JjPBIIGmefK
         1ID/FMsdrFwrSi1eah84TkErWUtML5Lgdu2OR4x9KMyebu0BaaEdMeRYM8zpdcH8/W0l
         WxQ9fCvm+Ug9oql/6HgIoUit/LsEVebmXCb6lsdrPU+hl6nAAPi4rx9sANKhtXP3Mlq3
         UGBq6waFDX5Q+S4QRujXr9YTynDW70cUBKX463A+IEjj5jzKjEffg8Zg2m5TJuZSoNCR
         2s/A==
X-Gm-Message-State: AGi0PuZ/Z3W5gR04slAC1uclLaWGNDvbHPwBZxvRg/i9zDNs9TMgJ6kZ
        +OuFoRfFMW61Z2wnM+cyyLE=
X-Google-Smtp-Source: APiQypLvbpu1aJkpmbh9/md97PH+AYM6G8tvU1+7muvQuvQKdNG5OyeLYJ/z2UlpiwPJoY88DjmCgw==
X-Received: by 2002:a2e:7004:: with SMTP id l4mr2911157ljc.55.1587146087930;
        Fri, 17 Apr 2020 10:54:47 -0700 (PDT)
Received: from localhost.localdomain (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.gmail.com with ESMTPSA id j15sm7204358lja.71.2020.04.17.10.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2020 10:54:46 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH v4 0/3] Support DRM bridges on NVIDIA Tegra
Date:   Fri, 17 Apr 2020 20:52:35 +0300
Message-Id: <20200417175238.27154-1-digetx@gmail.com>
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

v4: - Following review comments that were made by Laurent Pinchart to the v3,
      we now create and use the "bridge connector".

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

Dmitry Osipenko (3):
  drm/tegra: output: Don't leak OF node on error
  drm/tegra: output: Support DRM bridges
  drm/tegra: output: rgb: Support LVDS encoder bridge

 drivers/gpu/drm/tegra/drm.h    |  2 ++
 drivers/gpu/drm/tegra/output.c | 22 +++++++++----
 drivers/gpu/drm/tegra/rgb.c    | 58 ++++++++++++++++++++++++++++------
 3 files changed, 67 insertions(+), 15 deletions(-)

-- 
2.26.0


Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CEEC8E387D
	for <lists+linux-tegra@lfdr.de>; Thu, 24 Oct 2019 18:45:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393994AbfJXQpk (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 24 Oct 2019 12:45:40 -0400
Received: from mail-wr1-f46.google.com ([209.85.221.46]:46232 "EHLO
        mail-wr1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390181AbfJXQpj (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Oct 2019 12:45:39 -0400
Received: by mail-wr1-f46.google.com with SMTP id n15so16069903wrw.13
        for <linux-tegra@vger.kernel.org>; Thu, 24 Oct 2019 09:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DjKIZ1LpAPZhzjpwp4Zv4ngCHh1CxDu19C7DzIcBPMA=;
        b=KsxOAaCRv6vJxegiNqJlu9sEi7yYxJIPYT32Fxc6lLJwF2Wt26IlSethlX8TNOuPCX
         L9o2Z1jeyido8RZVPwUXYs13sznHAC9WopHp+ROoeW+ieTl0DXcaYRuSpY7Xowdb2Hqv
         tpuNpkud/JDuSEPaEzqAu3hiisXU13z/Kc3+sxNN1wMdmL1Ygi/lgXNdDfnteZH3ePas
         8bO3Ih29DYnSjaiumqJJNDkPqR1VBhm8yQkpcJA4H+ez9BT90i8Oy0TWmO+knG5z96H1
         b2svCLxy01CkoCkRz4BnDxmmJRvxLrZqVvtgYJitDR7FjSD/oLKjdAOIZG//Gk6GVX8u
         DL6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DjKIZ1LpAPZhzjpwp4Zv4ngCHh1CxDu19C7DzIcBPMA=;
        b=bog0iSPspEhIZEEXn+nGksqPc5ptJ76SW5Mon4VHNYOq5WFt8Qj+qBBZJZSUtBjoRI
         e8BJEy+BM2L6vsrbtewp7j/qWMIebPptZw55FAxIJ/9yzYQZmpnERrN2l13hRUXmk6A/
         YxppTHlbzWtSg31RVuHmmk1ApLWFXNdK7lVp3GodlPPiajtjJUg1H+FkhdSB61o8HbEJ
         CBI+2DZ7ZyeKAjKjnD5iV/16p31Jv4Vk8150YmTPc1WAIMJunq15ZL/NXWOT8cph5LUN
         fRHglLrYwyCqtNQCbUBTS3rERKq62e/yZg2EU5TGklLxuKUA5JlxNgB8U0b+hofbHTTG
         IfdQ==
X-Gm-Message-State: APjAAAUdghltcAqiKvFCLgsvgVBGSbopEvXMhmf7+v/Bbw0XBOqGmw9K
        0E+PcbNKqyWTBJLDvEaW8Ug=
X-Google-Smtp-Source: APXvYqx2lKg7yQQ0+7HxydYUvSHqeZdiRIUrqKTaixBZM5T+2vGOpUYTbVp29/lEzWdkEVQdp0wB+g==
X-Received: by 2002:a5d:54c7:: with SMTP id x7mr4415473wrv.99.1571935537359;
        Thu, 24 Oct 2019 09:45:37 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id t13sm31799765wra.70.2019.10.24.09.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2019 09:45:36 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 00/32] drm/tegra: Add DisplayPort support
Date:   Thu, 24 Oct 2019 18:45:02 +0200
Message-Id: <20191024164534.132764-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

This set of patches build on top of the existing eDP support that exists
for Tegra124 and extends it with full DP support on Tegra210, Tegra186
and Tegra194. After the series, the eDP code is unified with the DP code
and only parameterized where necessary.

Thierry

Thierry Reding (32):
  drm/tegra: Add missing kerneldoc for struct drm_dp_link
  drm/tegra: dp: Add drm_dp_link_reset() implementation
  drm/tegra: dp: Track link capabilities alongside settings
  drm/tegra: dp: Turn link capabilities into booleans
  drm/tegra: dp: Probe link using existing parsing helpers
  drm/tegra: dp: Read fast training capability from link
  drm/tegra: dp: Read TPS3 capability from sink
  drm/tegra: dp: Read channel coding capability from sink
  drm/tegra: dp: Read alternate scrambler reset capability from sink
  drm/tegra: dp: Read eDP version from DPCD
  drm/tegra: dp: Read AUX read interval from DPCD
  drm/tegra: dp: Set channel coding on link configuration
  drm/tegra: dp: Enable alternate scrambler reset when supported
  drm/tegra: dp: Add drm_dp_link_choose() helper
  drm/tegra: dp: Add support for eDP link rates
  drm/tegra: dp: Add DisplayPort link training helper
  drm/tegra: sor: Use DP link training helpers
  drm/tegra: sor: Hook up I2C-over-AUX to output
  drm/tegra: sor: Stabilize eDP
  drm/tegra: sor: Filter eDP rates
  drm/tegra: sor: Add DisplayPort support
  drm/tegra: sor: Remove tegra186-sor1 support
  drm/tegra: sor: Use correct SOR index on Tegra210
  drm/tegra: sor: Implement pad clock for all SOR instances
  drm/tegra: sor: Deduplicate connector type detection code
  drm/tegra: sor: Support DisplayPort on Tegra194
  drm/tegra: sor: Unify clock setup for eDP, HDMI and DP
  drm/tegra: sor: Use correct I/O pad for DP
  drm/tegra: sor: Unify eDP and DP support
  drm/tegra: sor: Avoid timeouts on unplug events
  drm/tegra: sor: Extract common audio enabling code
  drm/tegra: sor: Introduce audio enable/disable callbacks

 drivers/gpu/drm/tegra/dp.c    |  765 +++++++++-
 drivers/gpu/drm/tegra/dp.h    |  157 +-
 drivers/gpu/drm/tegra/dpaux.c |   69 -
 drivers/gpu/drm/tegra/drm.h   |    5 -
 drivers/gpu/drm/tegra/sor.c   | 2571 +++++++++++++++++++--------------
 drivers/gpu/drm/tegra/sor.h   |    3 +
 6 files changed, 2395 insertions(+), 1175 deletions(-)

-- 
2.23.0


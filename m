Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B741B702940
	for <lists+linux-tegra@lfdr.de>; Mon, 15 May 2023 11:44:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240784AbjEOJoW (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 15 May 2023 05:44:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239663AbjEOJoH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 15 May 2023 05:44:07 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D06D24222;
        Mon, 15 May 2023 02:40:36 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id CC1891F749;
        Mon, 15 May 2023 09:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1684143634; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=gmr4FfaH5fbVmlkPgeABvPLh70AOaXqGDduq6NJ5ewI=;
        b=HpNO9MAQmtFT0yZbTdZhHZmp8ZPFMHBzlHtwh31/3eOPlc7YuselHO3PrhTKLIIdYrpcc2
        yC/MUpPcKq0V3gL1sfNqXEfpioV/utCoqMoBevvXfeJIV3ghSjd6AHvy2XnInEn7rrzxin
        yDT9gUB2X5QNfk6+Rqi+VQnDwfrpyew=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1684143634;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=gmr4FfaH5fbVmlkPgeABvPLh70AOaXqGDduq6NJ5ewI=;
        b=4pKrYyAEyEMbX3hdJ4z9QYEPh45rqeWWpG6ZCOLivDWeKEx/er2DoKqzb/RJCcDjiJXzJE
        pM7snHdKQ6tgHNAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6EE5513466;
        Mon, 15 May 2023 09:40:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 5OD4GRL+YWTeTwAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Mon, 15 May 2023 09:40:34 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     daniel@ffwll.ch, airlied@gmail.com,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        javierm@redhat.com, sam@ravnborg.org
Cc:     dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        amd-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 00/12] drm/fbdev: Remove DRM's helpers for fbdev I/O
Date:   Mon, 15 May 2023 11:40:21 +0200
Message-Id: <20230515094033.2133-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

DRM provides a number of wrappers around fbdev cfb_() sys_(), fb_io_()
and fb_sys_() helpers. The DRM functions don't provide any additional
functionality for most DRM drivers. So remove them and call the fbdev
I/O helpers directly.

The DRM fbdev I/O wrappers were originally added because <linux/fb.h>
does not protect its content with CONFIG_FB. DRM fbdev emulation did
not build if the config option had been disabled. This has been
fixed. For fbdev-generic and i915, the wrappers added support for damage
handling. But this is better handled within the two callers, as each
is special in its damage handling.

Patch 1 adds several internal Kconfig otpions that DRM drivers (and
possibly other fbdev code) will use to select the correct set of I/O
helpers.

Patches 2 to 9 replace the DRM wrappers in a number of fbdev emulations.
Patch 10 exports two helpers for damage handling. Patches 11 and 12
update fbdev-generic and i915 with the help of the exported functions.
The patches also remove DRM's fbdev I/O helpers, which are now unused.

DRM's fbdev helpers had to select fbdev I/O helpers for I/O and for
system memory. Each fbdev emulation now selects the correct helpers
for itself. Depending on the selected DRM drivers, kernel builds will
now only contain the necessary fbdev I/O helpers and might be slightly
smaller in size.

v2:
	* simplify Kconfig handling (Sam)

Thomas Zimmermann (12):
  fbdev: Add Kconfig options to select different fb_ops helpers
  drm/armada: Use regular fbdev I/O helpers
  drm/exynos: Use regular fbdev I/O helpers
  drm/gma500: Use regular fbdev I/O helpers
  drm/radeon: Use regular fbdev I/O helpers
  drm/fbdev-dma: Use regular fbdev I/O helpers
  drm/msm: Use regular fbdev I/O helpers
  drm/omapdrm: Use regular fbdev I/O helpers
  drm/tegra: Use regular fbdev I/O helpers
  drm/fb-helper: Export helpers for marking damage areas
  drm/fbdev-generic: Implement dedicated fbdev I/O helpers
  drm/i915: Implement dedicated fbdev I/O helpers

 drivers/gpu/drm/Kconfig                    |  10 +-
 drivers/gpu/drm/armada/Kconfig             |   1 +
 drivers/gpu/drm/armada/armada_fbdev.c      |   9 +-
 drivers/gpu/drm/drm_fb_helper.c            | 233 ++-------------------
 drivers/gpu/drm/drm_fbdev_dma.c            |  12 +-
 drivers/gpu/drm/drm_fbdev_generic.c        |  47 ++++-
 drivers/gpu/drm/exynos/Kconfig             |   1 +
 drivers/gpu/drm/exynos/Makefile            |   2 +-
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c  |  10 +-
 drivers/gpu/drm/gma500/Kconfig             |   1 +
 drivers/gpu/drm/gma500/fbdev.c             |   9 +-
 drivers/gpu/drm/i915/Kconfig               |   1 +
 drivers/gpu/drm/i915/display/intel_fbdev.c |  51 ++++-
 drivers/gpu/drm/msm/Kconfig                |   1 +
 drivers/gpu/drm/msm/msm_fbdev.c            |  12 +-
 drivers/gpu/drm/omapdrm/Kconfig            |   1 +
 drivers/gpu/drm/omapdrm/omap_fbdev.c       |  12 +-
 drivers/gpu/drm/radeon/Kconfig             |   1 +
 drivers/gpu/drm/radeon/radeon_fbdev.c      |   9 +-
 drivers/gpu/drm/tegra/Kconfig              |   1 +
 drivers/gpu/drm/tegra/fbdev.c              |  11 +-
 drivers/video/fbdev/Kconfig                |  21 ++
 include/drm/drm_fb_helper.h                |  84 +-------
 23 files changed, 184 insertions(+), 356 deletions(-)


base-commit: 451e49cfbaa90720149e63f4fa9c7824013c783d
-- 
2.40.1


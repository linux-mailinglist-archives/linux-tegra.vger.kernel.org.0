Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E05E85623C7
	for <lists+linux-tegra@lfdr.de>; Thu, 30 Jun 2022 22:04:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236280AbiF3UEn (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 30 Jun 2022 16:04:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236934AbiF3UEm (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 30 Jun 2022 16:04:42 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D02BC3B568;
        Thu, 30 Jun 2022 13:04:41 -0700 (PDT)
Received: from dimapc.. (109-252-118-164.nat.spd-mgts.ru [109.252.118.164])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dmitry.osipenko)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 5A5D9660196E;
        Thu, 30 Jun 2022 21:04:39 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1656619480;
        bh=V1SHbcWB2a7VYQPoJZtKapo1RnxYVO0PZCoH59y/TXc=;
        h=From:To:Cc:Subject:Date:From;
        b=YlUV6dFWQJG4Fv6Rj5expKG4LJrhePHQ4dwS9cS7fJi16AElKQLL8jX1Ci+ffZTXG
         X3z6vG3N6f/7afzrYA5YabQkIsO0+x3t8y+nP1g1GOSsOE7up/5y88B6b2uv6Fkr+w
         KJzebLf1l+K/mkXB6NGzknoRizo18EjUxJzEfTHVMOqL3r7YO1aHI5g2KVckKRnG6p
         5pt0A14oyMSOMY0uxncJOWdydSeOYtZ1aBnJX50jmtYkUDfUHMeB+LYFGNGsFpY/E6
         t2YZchG+C6sesFOzLVjULRVIjnCaGtoUrlOi5zBd1EGSWEMpDC0W8LR4DAEwoydNCr
         IsMRFFpO4FOJg==
From:   Dmitry Osipenko <dmitry.osipenko@collabora.com>
To:     David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
        Gurchetan Singh <gurchetansingh@chromium.org>,
        Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas_os@shipmail.org>
Cc:     dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-tegra@vger.kernel.org, kernel@collabora.com,
        virtualization@lists.linux-foundation.org
Subject: [PATCH v7 0/2] DRM GEM fixes
Date:   Thu, 30 Jun 2022 23:04:03 +0300
Message-Id: <20220630200405.1883897-1-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This patchset fixes two problems in the common GEM code. First fixed problem
is the bogus lockdep splat that complicates debugging of DRM drivers. Second
problem is the inconsistency in behaviour and improper handling of mapping
the imported GEMs by some drivers, to fix it we will prohibit to map the
imported GEMs like majority of drivers already do.

Changelog:

v7: - Factored out GEM patches from [1] since I'll be working on the
      dma-buf locking in a separate patchsets now.

[1] https://lore.kernel.org/all/20220526235040.678984-1-dmitry.osipenko@collabora.com/

    - Improved commit message and added fixes tag to the "Properly annotate
      WW context" patch.

    - Replaced "Move mapping of imported dma-bufs to drm_gem_mmap_obj()"
      patch with "Don't map imported GEMs", like was suggested by
      Thomas Hellström.

    - Added r-b and suggested-by from Thomas Hellström.

Dmitry Osipenko (2):
  drm/gem: Properly annotate WW context on drm_gem_lock_reservations()
    error
  drm/gem: Don't map imported GEMs

 drivers/gpu/drm/drm_gem.c              | 8 ++++++--
 drivers/gpu/drm/drm_gem_shmem_helper.c | 9 ---------
 2 files changed, 6 insertions(+), 11 deletions(-)

-- 
2.36.1


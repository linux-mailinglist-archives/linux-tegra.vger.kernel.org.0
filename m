Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 714336D9D11
	for <lists+linux-tegra@lfdr.de>; Thu,  6 Apr 2023 18:07:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239848AbjDFQHR (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 6 Apr 2023 12:07:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239844AbjDFQHQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 6 Apr 2023 12:07:16 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E8819EE4;
        Thu,  6 Apr 2023 09:07:00 -0700 (PDT)
Received: from workpc.. (109-252-119-170.nat.spd-mgts.ru [109.252.119.170])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dmitry.osipenko)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id D662966031C6;
        Thu,  6 Apr 2023 17:06:56 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1680797218;
        bh=Hk90072+fNtMk6bzJlUk3vMa94X4jOPr38sjSqJGC68=;
        h=From:To:Cc:Subject:Date:From;
        b=TH08idU5sasycPk66wdrwrZWcxg/7Zyy0vnU/rvtWLMSQCnWqR9sufNIHDMt1NqCI
         kaSdKDy4CLUXpyyJnsgkHHbnJpWjoG1seTkqmqiaw3TtIb/jzh8dN59CvqgSDAWuXd
         dLiGDkamMv2gWwTj0Gwrv/dJq65b4oTMWtbrdQ/+ssBKv79x8rDhe84Wv/HegpkjtO
         rv0vjx5/VXtvIXjIGo1VEl/oZaUrK9794lnBIJLMrt0FHAV65ixcCun5Za6l+nL+jH
         wWz94cfPKOR7sTmMBaomC3wlLst5l5yTJonZyYboDwfPi9jpS+fmiMXB+64tbt8c+J
         0g82VUu1eSmvw==
From:   Dmitry Osipenko <dmitry.osipenko@collabora.com>
To:     Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Liam Mark <lmark@codeaurora.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        John Stultz <jstultz@google.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Tomi Valkeinen <tomba@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Emil Velikov <emil.l.velikov@gmail.com>
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        kernel@collabora.com
Subject: [PATCH v2 0/7] Move dma-buf mmap() reservation locking down to exporters
Date:   Thu,  6 Apr 2023 19:06:30 +0300
Message-Id: <20230406160637.541702-1-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This patchset makes dma-buf exporters responisble for taking care of
the reservation lock. I also included patch that moves drm-shmem to use
reservation lock, to let CI test the whole set. I'm going to take all
the patches via the drm-misc tree, please give an ack.

Previous policy stated that dma-buf core takes the lock around mmap()
callback. Which meant that both importers and exporters shouldn't touch
the reservation lock in the mmap() code path. This worked well until
Intel-CI found a deadlock problem in a case of self-imported dma-buf [1].

The problem happens when userpace mmaps a self-imported dma-buf, i.e.
mmaps the dma-buf FD. DRM core treats self-imported dma-bufs as own GEMs
[2]. There is no way to differentiate a prime GEM from a normal GEM for
drm-shmem in drm_gem_shmem_mmap(), which resulted in a deadlock problem
for drm-shmem mmap() code path once it's switched to use reservation lock.

It was difficult to fix the drm-shmem problem without adjusting dma-buf
locking policy. In parctice not much changed from importers perspective
because previosly dma-buf was taking the lock in between of importers
and exporters. Now this lock is shifted down to exporters.

[1] https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_114671v2/shard-snb5/igt@prime_vgem@sync@rcs0.html
[2] https://elixir.bootlin.com/linux/v6.3-rc4/source/drivers/gpu/drm/drm_prime.c#L924

Changelog:

v2: - Added ack from Christian König to the DRM patch.

    - Dropped "fixes" tag from the patches, like was requested by
      Christian König. The patches don't actually need a backport
      and merely improve the locking policy.

    - Dropped "reverts" from the patch titles to prevent them from
      auto-backporting by the stable bot based on the title.

    - Added r-b from Emil Velikov and placed the drm_WARN in the
      drm-shmem patch like he suggested in a comment to v1.

    - Corrected drm-shmem patch dma_resv_lock(obj->resv) inconsistently
      used with dma_resv_unlock(shmem->base.resv). Now shmem->base.resv
      variant is used for all locks/unlocks.

Dmitry Osipenko (7):
  media: videobuf2: Don't assert held reservation lock for dma-buf
    mmapping
  dma-buf/heaps: Don't assert held reservation lock for dma-buf mmapping
  udmabuf: Don't assert held reservation lock for dma-buf mmapping
  fastrpc: Don't assert held reservation lock for dma-buf mmapping
  drm: Don't assert held reservation lock for dma-buf mmapping
  dma-buf: Change locking policy for mmap()
  drm/shmem-helper: Switch to reservation lock

 drivers/dma-buf/dma-buf.c                     |  17 +-
 drivers/dma-buf/heaps/cma_heap.c              |   3 -
 drivers/dma-buf/heaps/system_heap.c           |   3 -
 drivers/dma-buf/udmabuf.c                     |   2 -
 drivers/gpu/drm/drm_gem_shmem_helper.c        | 208 ++++++++----------
 drivers/gpu/drm/drm_prime.c                   |   2 -
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |   2 -
 drivers/gpu/drm/lima/lima_gem.c               |   8 +-
 drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c     |   2 -
 drivers/gpu/drm/panfrost/panfrost_drv.c       |   7 +-
 .../gpu/drm/panfrost/panfrost_gem_shrinker.c  |   6 +-
 drivers/gpu/drm/panfrost/panfrost_mmu.c       |  19 +-
 drivers/gpu/drm/tegra/gem.c                   |   2 -
 .../common/videobuf2/videobuf2-dma-contig.c   |   3 -
 .../media/common/videobuf2/videobuf2-dma-sg.c |   3 -
 .../common/videobuf2/videobuf2-vmalloc.c      |   3 -
 drivers/misc/fastrpc.c                        |   3 -
 include/drm/drm_gem_shmem_helper.h            |  14 +-
 18 files changed, 117 insertions(+), 190 deletions(-)

-- 
2.39.2


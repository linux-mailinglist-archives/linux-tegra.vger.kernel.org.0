Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEF5A6D9D35
	for <lists+linux-tegra@lfdr.de>; Thu,  6 Apr 2023 18:07:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240010AbjDFQHq (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 6 Apr 2023 12:07:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239951AbjDFQHk (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 6 Apr 2023 12:07:40 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE4E586B0;
        Thu,  6 Apr 2023 09:07:19 -0700 (PDT)
Received: from workpc.. (109-252-119-170.nat.spd-mgts.ru [109.252.119.170])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dmitry.osipenko)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 7A95A66031D2;
        Thu,  6 Apr 2023 17:07:12 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1680797234;
        bh=2LGtU0pJUE3a/3duS9Vh1FoAGcCC8Le26Q5vq5urikI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FUcbSMVcgc77GSMrqGVNkMhvFwZrSGNzJ698IQQ1N3WW5XQazwplcZjVab4Dhy528
         m5HxUf/9rOU2FLKhwrW67htcu162jochjWYkBRmA+QTVzhrnn6rJ3u4lfv3Uycup4j
         1sd9LzAtcJI7QaRU6krnptZJUaF07uBSbFDVxjeJYIwTp/MuFPWzhxlPUWNG9Kfqxi
         8f98/oUvPjZNJxsjUuf0HI+PLu4GqPHd2h8KrU2CfmLjYi7NwBIOWxpTZWB5rzMDbj
         fpBU90QCHbraRJM2RJ4yBsfLAS0+BrwY+ZjKEYwiimWBwR95KiLAWOeAWzlYWVxqMM
         dY7Wi3cK2lIwQ==
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
Subject: [PATCH v2 7/7] drm/shmem-helper: Switch to reservation lock
Date:   Thu,  6 Apr 2023 19:06:37 +0300
Message-Id: <20230406160637.541702-8-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230406160637.541702-1-dmitry.osipenko@collabora.com>
References: <20230406160637.541702-1-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Replace all drm-shmem locks with a GEM reservation lock. This makes locks
consistent with dma-buf locking convention where importers are responsible
for holding reservation lock for all operations performed over dma-bufs,
preventing deadlock between dma-buf importers and exporters.

Suggested-by: Daniel Vetter <daniel@ffwll.ch>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c        | 208 ++++++++----------
 drivers/gpu/drm/lima/lima_gem.c               |   8 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c       |   7 +-
 .../gpu/drm/panfrost/panfrost_gem_shrinker.c  |   6 +-
 drivers/gpu/drm/panfrost/panfrost_mmu.c       |  19 +-
 include/drm/drm_gem_shmem_helper.h            |  14 +-
 6 files changed, 114 insertions(+), 148 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 4ea6507a77e5..395942ca36fe 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -88,8 +88,6 @@ __drm_gem_shmem_create(struct drm_device *dev, size_t size, bool private)
 	if (ret)
 		goto err_release;
 
-	mutex_init(&shmem->pages_lock);
-	mutex_init(&shmem->vmap_lock);
 	INIT_LIST_HEAD(&shmem->madv_list);
 
 	if (!private) {
@@ -141,11 +139,13 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
 {
 	struct drm_gem_object *obj = &shmem->base;
 
-	drm_WARN_ON(obj->dev, shmem->vmap_use_count);
-
 	if (obj->import_attach) {
 		drm_prime_gem_destroy(obj, shmem->sgt);
 	} else {
+		dma_resv_lock(shmem->base.resv, NULL);
+
+		drm_WARN_ON(obj->dev, shmem->vmap_use_count);
+
 		if (shmem->sgt) {
 			dma_unmap_sgtable(obj->dev->dev, shmem->sgt,
 					  DMA_BIDIRECTIONAL, 0);
@@ -154,18 +154,18 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
 		}
 		if (shmem->pages)
 			drm_gem_shmem_put_pages(shmem);
-	}
 
-	drm_WARN_ON(obj->dev, shmem->pages_use_count);
+		drm_WARN_ON(obj->dev, shmem->pages_use_count);
+
+		dma_resv_unlock(shmem->base.resv);
+	}
 
 	drm_gem_object_release(obj);
-	mutex_destroy(&shmem->pages_lock);
-	mutex_destroy(&shmem->vmap_lock);
 	kfree(shmem);
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_free);
 
-static int drm_gem_shmem_get_pages_locked(struct drm_gem_shmem_object *shmem)
+static int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem)
 {
 	struct drm_gem_object *obj = &shmem->base;
 	struct page **pages;
@@ -197,35 +197,16 @@ static int drm_gem_shmem_get_pages_locked(struct drm_gem_shmem_object *shmem)
 }
 
 /*
- * drm_gem_shmem_get_pages - Allocate backing pages for a shmem GEM object
+ * drm_gem_shmem_put_pages - Decrease use count on the backing pages for a shmem GEM object
  * @shmem: shmem GEM object
  *
- * This function makes sure that backing pages exists for the shmem GEM object
- * and increases the use count.
- *
- * Returns:
- * 0 on success or a negative error code on failure.
+ * This function decreases the use count and puts the backing pages when use drops to zero.
  */
-int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem)
+void drm_gem_shmem_put_pages(struct drm_gem_shmem_object *shmem)
 {
 	struct drm_gem_object *obj = &shmem->base;
-	int ret;
-
-	drm_WARN_ON(obj->dev, obj->import_attach);
-
-	ret = mutex_lock_interruptible(&shmem->pages_lock);
-	if (ret)
-		return ret;
-	ret = drm_gem_shmem_get_pages_locked(shmem);
-	mutex_unlock(&shmem->pages_lock);
-
-	return ret;
-}
-EXPORT_SYMBOL(drm_gem_shmem_get_pages);
 
-static void drm_gem_shmem_put_pages_locked(struct drm_gem_shmem_object *shmem)
-{
-	struct drm_gem_object *obj = &shmem->base;
+	dma_resv_assert_held(shmem->base.resv);
 
 	if (drm_WARN_ON_ONCE(obj->dev, !shmem->pages_use_count))
 		return;
@@ -243,20 +224,25 @@ static void drm_gem_shmem_put_pages_locked(struct drm_gem_shmem_object *shmem)
 			  shmem->pages_mark_accessed_on_put);
 	shmem->pages = NULL;
 }
+EXPORT_SYMBOL(drm_gem_shmem_put_pages);
 
-/*
- * drm_gem_shmem_put_pages - Decrease use count on the backing pages for a shmem GEM object
- * @shmem: shmem GEM object
- *
- * This function decreases the use count and puts the backing pages when use drops to zero.
- */
-void drm_gem_shmem_put_pages(struct drm_gem_shmem_object *shmem)
+static int drm_gem_shmem_pin_locked(struct drm_gem_shmem_object *shmem)
+{
+	int ret;
+
+	dma_resv_assert_held(shmem->base.resv);
+
+	ret = drm_gem_shmem_get_pages(shmem);
+
+	return ret;
+}
+
+static void drm_gem_shmem_unpin_locked(struct drm_gem_shmem_object *shmem)
 {
-	mutex_lock(&shmem->pages_lock);
-	drm_gem_shmem_put_pages_locked(shmem);
-	mutex_unlock(&shmem->pages_lock);
+	dma_resv_assert_held(shmem->base.resv);
+
+	drm_gem_shmem_put_pages(shmem);
 }
-EXPORT_SYMBOL(drm_gem_shmem_put_pages);
 
 /**
  * drm_gem_shmem_pin - Pin backing pages for a shmem GEM object
@@ -271,10 +257,17 @@ EXPORT_SYMBOL(drm_gem_shmem_put_pages);
 int drm_gem_shmem_pin(struct drm_gem_shmem_object *shmem)
 {
 	struct drm_gem_object *obj = &shmem->base;
+	int ret;
 
 	drm_WARN_ON(obj->dev, obj->import_attach);
 
-	return drm_gem_shmem_get_pages(shmem);
+	ret = dma_resv_lock_interruptible(shmem->base.resv, NULL);
+	if (ret)
+		return ret;
+	ret = drm_gem_shmem_pin_locked(shmem);
+	dma_resv_unlock(shmem->base.resv);
+
+	return ret;
 }
 EXPORT_SYMBOL(drm_gem_shmem_pin);
 
@@ -291,12 +284,29 @@ void drm_gem_shmem_unpin(struct drm_gem_shmem_object *shmem)
 
 	drm_WARN_ON(obj->dev, obj->import_attach);
 
-	drm_gem_shmem_put_pages(shmem);
+	dma_resv_lock(shmem->base.resv, NULL);
+	drm_gem_shmem_unpin_locked(shmem);
+	dma_resv_unlock(shmem->base.resv);
 }
 EXPORT_SYMBOL(drm_gem_shmem_unpin);
 
-static int drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem,
-				     struct iosys_map *map)
+/*
+ * drm_gem_shmem_vmap - Create a virtual mapping for a shmem GEM object
+ * @shmem: shmem GEM object
+ * @map: Returns the kernel virtual address of the SHMEM GEM object's backing
+ *       store.
+ *
+ * This function makes sure that a contiguous kernel virtual address mapping
+ * exists for the buffer backing the shmem GEM object. It hides the differences
+ * between dma-buf imported and natively allocated objects.
+ *
+ * Acquired mappings should be cleaned up by calling drm_gem_shmem_vunmap().
+ *
+ * Returns:
+ * 0 on success or a negative error code on failure.
+ */
+int drm_gem_shmem_vmap(struct drm_gem_shmem_object *shmem,
+		       struct iosys_map *map)
 {
 	struct drm_gem_object *obj = &shmem->base;
 	int ret = 0;
@@ -312,6 +322,8 @@ static int drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem,
 	} else {
 		pgprot_t prot = PAGE_KERNEL;
 
+		dma_resv_assert_held(shmem->base.resv);
+
 		if (shmem->vmap_use_count++ > 0) {
 			iosys_map_set_vaddr(map, shmem->vaddr);
 			return 0;
@@ -346,45 +358,30 @@ static int drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem,
 
 	return ret;
 }
+EXPORT_SYMBOL(drm_gem_shmem_vmap);
 
 /*
- * drm_gem_shmem_vmap - Create a virtual mapping for a shmem GEM object
+ * drm_gem_shmem_vunmap - Unmap a virtual mapping for a shmem GEM object
  * @shmem: shmem GEM object
- * @map: Returns the kernel virtual address of the SHMEM GEM object's backing
- *       store.
- *
- * This function makes sure that a contiguous kernel virtual address mapping
- * exists for the buffer backing the shmem GEM object. It hides the differences
- * between dma-buf imported and natively allocated objects.
+ * @map: Kernel virtual address where the SHMEM GEM object was mapped
  *
- * Acquired mappings should be cleaned up by calling drm_gem_shmem_vunmap().
+ * This function cleans up a kernel virtual address mapping acquired by
+ * drm_gem_shmem_vmap(). The mapping is only removed when the use count drops to
+ * zero.
  *
- * Returns:
- * 0 on success or a negative error code on failure.
+ * This function hides the differences between dma-buf imported and natively
+ * allocated objects.
  */
-int drm_gem_shmem_vmap(struct drm_gem_shmem_object *shmem,
-		       struct iosys_map *map)
-{
-	int ret;
-
-	ret = mutex_lock_interruptible(&shmem->vmap_lock);
-	if (ret)
-		return ret;
-	ret = drm_gem_shmem_vmap_locked(shmem, map);
-	mutex_unlock(&shmem->vmap_lock);
-
-	return ret;
-}
-EXPORT_SYMBOL(drm_gem_shmem_vmap);
-
-static void drm_gem_shmem_vunmap_locked(struct drm_gem_shmem_object *shmem,
-					struct iosys_map *map)
+void drm_gem_shmem_vunmap(struct drm_gem_shmem_object *shmem,
+			  struct iosys_map *map)
 {
 	struct drm_gem_object *obj = &shmem->base;
 
 	if (obj->import_attach) {
 		dma_buf_vunmap(obj->import_attach->dmabuf, map);
 	} else {
+		dma_resv_assert_held(shmem->base.resv);
+
 		if (drm_WARN_ON_ONCE(obj->dev, !shmem->vmap_use_count))
 			return;
 
@@ -397,26 +394,6 @@ static void drm_gem_shmem_vunmap_locked(struct drm_gem_shmem_object *shmem,
 
 	shmem->vaddr = NULL;
 }
-
-/*
- * drm_gem_shmem_vunmap - Unmap a virtual mapping for a shmem GEM object
- * @shmem: shmem GEM object
- * @map: Kernel virtual address where the SHMEM GEM object was mapped
- *
- * This function cleans up a kernel virtual address mapping acquired by
- * drm_gem_shmem_vmap(). The mapping is only removed when the use count drops to
- * zero.
- *
- * This function hides the differences between dma-buf imported and natively
- * allocated objects.
- */
-void drm_gem_shmem_vunmap(struct drm_gem_shmem_object *shmem,
-			  struct iosys_map *map)
-{
-	mutex_lock(&shmem->vmap_lock);
-	drm_gem_shmem_vunmap_locked(shmem, map);
-	mutex_unlock(&shmem->vmap_lock);
-}
 EXPORT_SYMBOL(drm_gem_shmem_vunmap);
 
 static int
@@ -447,24 +424,24 @@ drm_gem_shmem_create_with_handle(struct drm_file *file_priv,
  */
 int drm_gem_shmem_madvise(struct drm_gem_shmem_object *shmem, int madv)
 {
-	mutex_lock(&shmem->pages_lock);
+	dma_resv_assert_held(shmem->base.resv);
 
 	if (shmem->madv >= 0)
 		shmem->madv = madv;
 
 	madv = shmem->madv;
 
-	mutex_unlock(&shmem->pages_lock);
-
 	return (madv >= 0);
 }
 EXPORT_SYMBOL(drm_gem_shmem_madvise);
 
-void drm_gem_shmem_purge_locked(struct drm_gem_shmem_object *shmem)
+void drm_gem_shmem_purge(struct drm_gem_shmem_object *shmem)
 {
 	struct drm_gem_object *obj = &shmem->base;
 	struct drm_device *dev = obj->dev;
 
+	dma_resv_assert_held(shmem->base.resv);
+
 	drm_WARN_ON(obj->dev, !drm_gem_shmem_is_purgeable(shmem));
 
 	dma_unmap_sgtable(dev->dev, shmem->sgt, DMA_BIDIRECTIONAL, 0);
@@ -472,7 +449,7 @@ void drm_gem_shmem_purge_locked(struct drm_gem_shmem_object *shmem)
 	kfree(shmem->sgt);
 	shmem->sgt = NULL;
 
-	drm_gem_shmem_put_pages_locked(shmem);
+	drm_gem_shmem_put_pages(shmem);
 
 	shmem->madv = -1;
 
@@ -488,17 +465,6 @@ void drm_gem_shmem_purge_locked(struct drm_gem_shmem_object *shmem)
 
 	invalidate_mapping_pages(file_inode(obj->filp)->i_mapping, 0, (loff_t)-1);
 }
-EXPORT_SYMBOL(drm_gem_shmem_purge_locked);
-
-bool drm_gem_shmem_purge(struct drm_gem_shmem_object *shmem)
-{
-	if (!mutex_trylock(&shmem->pages_lock))
-		return false;
-	drm_gem_shmem_purge_locked(shmem);
-	mutex_unlock(&shmem->pages_lock);
-
-	return true;
-}
 EXPORT_SYMBOL(drm_gem_shmem_purge);
 
 /**
@@ -551,7 +517,7 @@ static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
 	/* We don't use vmf->pgoff since that has the fake offset */
 	page_offset = (vmf->address - vma->vm_start) >> PAGE_SHIFT;
 
-	mutex_lock(&shmem->pages_lock);
+	dma_resv_lock(shmem->base.resv, NULL);
 
 	if (page_offset >= num_pages ||
 	    drm_WARN_ON_ONCE(obj->dev, !shmem->pages) ||
@@ -563,7 +529,7 @@ static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
 		ret = vmf_insert_pfn(vma, vmf->address, page_to_pfn(page));
 	}
 
-	mutex_unlock(&shmem->pages_lock);
+	dma_resv_unlock(shmem->base.resv);
 
 	return ret;
 }
@@ -575,7 +541,7 @@ static void drm_gem_shmem_vm_open(struct vm_area_struct *vma)
 
 	drm_WARN_ON(obj->dev, obj->import_attach);
 
-	mutex_lock(&shmem->pages_lock);
+	dma_resv_lock(shmem->base.resv, NULL);
 
 	/*
 	 * We should have already pinned the pages when the buffer was first
@@ -585,7 +551,7 @@ static void drm_gem_shmem_vm_open(struct vm_area_struct *vma)
 	if (!drm_WARN_ON_ONCE(obj->dev, !shmem->pages_use_count))
 		shmem->pages_use_count++;
 
-	mutex_unlock(&shmem->pages_lock);
+	dma_resv_unlock(shmem->base.resv);
 
 	drm_gem_vm_open(vma);
 }
@@ -595,7 +561,10 @@ static void drm_gem_shmem_vm_close(struct vm_area_struct *vma)
 	struct drm_gem_object *obj = vma->vm_private_data;
 	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
 
+	dma_resv_lock(shmem->base.resv, NULL);
 	drm_gem_shmem_put_pages(shmem);
+	dma_resv_unlock(shmem->base.resv);
+
 	drm_gem_vm_close(vma);
 }
 
@@ -633,7 +602,10 @@ int drm_gem_shmem_mmap(struct drm_gem_shmem_object *shmem, struct vm_area_struct
 		return ret;
 	}
 
+	dma_resv_lock(shmem->base.resv, NULL);
 	ret = drm_gem_shmem_get_pages(shmem);
+	dma_resv_unlock(shmem->base.resv);
+
 	if (ret)
 		return ret;
 
@@ -699,7 +671,7 @@ static struct sg_table *drm_gem_shmem_get_pages_sgt_locked(struct drm_gem_shmem_
 
 	drm_WARN_ON(obj->dev, obj->import_attach);
 
-	ret = drm_gem_shmem_get_pages_locked(shmem);
+	ret = drm_gem_shmem_get_pages(shmem);
 	if (ret)
 		return ERR_PTR(ret);
 
@@ -721,7 +693,7 @@ static struct sg_table *drm_gem_shmem_get_pages_sgt_locked(struct drm_gem_shmem_
 	sg_free_table(sgt);
 	kfree(sgt);
 err_put_pages:
-	drm_gem_shmem_put_pages_locked(shmem);
+	drm_gem_shmem_put_pages(shmem);
 	return ERR_PTR(ret);
 }
 
@@ -746,11 +718,11 @@ struct sg_table *drm_gem_shmem_get_pages_sgt(struct drm_gem_shmem_object *shmem)
 	int ret;
 	struct sg_table *sgt;
 
-	ret = mutex_lock_interruptible(&shmem->pages_lock);
+	ret = dma_resv_lock_interruptible(shmem->base.resv, NULL);
 	if (ret)
 		return ERR_PTR(ret);
 	sgt = drm_gem_shmem_get_pages_sgt_locked(shmem);
-	mutex_unlock(&shmem->pages_lock);
+	dma_resv_unlock(shmem->base.resv);
 
 	return sgt;
 }
diff --git a/drivers/gpu/drm/lima/lima_gem.c b/drivers/gpu/drm/lima/lima_gem.c
index 10252dc11a22..4f9736e5f929 100644
--- a/drivers/gpu/drm/lima/lima_gem.c
+++ b/drivers/gpu/drm/lima/lima_gem.c
@@ -34,7 +34,7 @@ int lima_heap_alloc(struct lima_bo *bo, struct lima_vm *vm)
 
 	new_size = min(new_size, bo->base.base.size);
 
-	mutex_lock(&bo->base.pages_lock);
+	dma_resv_lock(bo->base.base.resv, NULL);
 
 	if (bo->base.pages) {
 		pages = bo->base.pages;
@@ -42,7 +42,7 @@ int lima_heap_alloc(struct lima_bo *bo, struct lima_vm *vm)
 		pages = kvmalloc_array(bo->base.base.size >> PAGE_SHIFT,
 				       sizeof(*pages), GFP_KERNEL | __GFP_ZERO);
 		if (!pages) {
-			mutex_unlock(&bo->base.pages_lock);
+			dma_resv_unlock(bo->base.base.resv);
 			return -ENOMEM;
 		}
 
@@ -56,13 +56,13 @@ int lima_heap_alloc(struct lima_bo *bo, struct lima_vm *vm)
 		struct page *page = shmem_read_mapping_page(mapping, i);
 
 		if (IS_ERR(page)) {
-			mutex_unlock(&bo->base.pages_lock);
+			dma_resv_unlock(bo->base.base.resv);
 			return PTR_ERR(page);
 		}
 		pages[i] = page;
 	}
 
-	mutex_unlock(&bo->base.pages_lock);
+	dma_resv_unlock(bo->base.base.resv);
 
 	ret = sg_alloc_table_from_pages(&sgt, pages, i, 0,
 					new_size, GFP_KERNEL);
diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index bbada731bbbd..d9dda6acdfac 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -407,6 +407,10 @@ static int panfrost_ioctl_madvise(struct drm_device *dev, void *data,
 
 	bo = to_panfrost_bo(gem_obj);
 
+	ret = dma_resv_lock_interruptible(bo->base.base.resv, NULL);
+	if (ret)
+		goto out_put_object;
+
 	mutex_lock(&pfdev->shrinker_lock);
 	mutex_lock(&bo->mappings.lock);
 	if (args->madv == PANFROST_MADV_DONTNEED) {
@@ -444,7 +448,8 @@ static int panfrost_ioctl_madvise(struct drm_device *dev, void *data,
 out_unlock_mappings:
 	mutex_unlock(&bo->mappings.lock);
 	mutex_unlock(&pfdev->shrinker_lock);
-
+	dma_resv_unlock(bo->base.base.resv);
+out_put_object:
 	drm_gem_object_put(gem_obj);
 	return ret;
 }
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c b/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
index bf0170782f25..6a71a2555f85 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
@@ -48,14 +48,14 @@ static bool panfrost_gem_purge(struct drm_gem_object *obj)
 	if (!mutex_trylock(&bo->mappings.lock))
 		return false;
 
-	if (!mutex_trylock(&shmem->pages_lock))
+	if (!dma_resv_trylock(shmem->base.resv))
 		goto unlock_mappings;
 
 	panfrost_gem_teardown_mappings_locked(bo);
-	drm_gem_shmem_purge_locked(&bo->base);
+	drm_gem_shmem_purge(&bo->base);
 	ret = true;
 
-	mutex_unlock(&shmem->pages_lock);
+	dma_resv_unlock(shmem->base.resv);
 
 unlock_mappings:
 	mutex_unlock(&bo->mappings.lock);
diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index 666a5e53fe19..0679df57f394 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -443,6 +443,7 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
 	struct panfrost_gem_mapping *bomapping;
 	struct panfrost_gem_object *bo;
 	struct address_space *mapping;
+	struct drm_gem_object *obj;
 	pgoff_t page_offset;
 	struct sg_table *sgt;
 	struct page **pages;
@@ -465,15 +466,16 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
 	page_offset = addr >> PAGE_SHIFT;
 	page_offset -= bomapping->mmnode.start;
 
-	mutex_lock(&bo->base.pages_lock);
+	obj = &bo->base.base;
+
+	dma_resv_lock(obj->resv, NULL);
 
 	if (!bo->base.pages) {
 		bo->sgts = kvmalloc_array(bo->base.base.size / SZ_2M,
 				     sizeof(struct sg_table), GFP_KERNEL | __GFP_ZERO);
 		if (!bo->sgts) {
-			mutex_unlock(&bo->base.pages_lock);
 			ret = -ENOMEM;
-			goto err_bo;
+			goto err_unlock;
 		}
 
 		pages = kvmalloc_array(bo->base.base.size >> PAGE_SHIFT,
@@ -481,9 +483,8 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
 		if (!pages) {
 			kvfree(bo->sgts);
 			bo->sgts = NULL;
-			mutex_unlock(&bo->base.pages_lock);
 			ret = -ENOMEM;
-			goto err_bo;
+			goto err_unlock;
 		}
 		bo->base.pages = pages;
 		bo->base.pages_use_count = 1;
@@ -491,7 +492,6 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
 		pages = bo->base.pages;
 		if (pages[page_offset]) {
 			/* Pages are already mapped, bail out. */
-			mutex_unlock(&bo->base.pages_lock);
 			goto out;
 		}
 	}
@@ -502,14 +502,11 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
 	for (i = page_offset; i < page_offset + NUM_FAULT_PAGES; i++) {
 		pages[i] = shmem_read_mapping_page(mapping, i);
 		if (IS_ERR(pages[i])) {
-			mutex_unlock(&bo->base.pages_lock);
 			ret = PTR_ERR(pages[i]);
 			goto err_pages;
 		}
 	}
 
-	mutex_unlock(&bo->base.pages_lock);
-
 	sgt = &bo->sgts[page_offset / (SZ_2M / PAGE_SIZE)];
 	ret = sg_alloc_table_from_pages(sgt, pages + page_offset,
 					NUM_FAULT_PAGES, 0, SZ_2M, GFP_KERNEL);
@@ -528,6 +525,8 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
 	dev_dbg(pfdev->dev, "mapped page fault @ AS%d %llx", as, addr);
 
 out:
+	dma_resv_unlock(obj->resv);
+
 	panfrost_gem_mapping_put(bomapping);
 
 	return 0;
@@ -536,6 +535,8 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
 	sg_free_table(sgt);
 err_pages:
 	drm_gem_shmem_put_pages(&bo->base);
+err_unlock:
+	dma_resv_unlock(obj->resv);
 err_bo:
 	panfrost_gem_mapping_put(bomapping);
 	return ret;
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index 5994fed5e327..20ddcd799df9 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -26,11 +26,6 @@ struct drm_gem_shmem_object {
 	 */
 	struct drm_gem_object base;
 
-	/**
-	 * @pages_lock: Protects the page table and use count
-	 */
-	struct mutex pages_lock;
-
 	/**
 	 * @pages: Page table
 	 */
@@ -65,11 +60,6 @@ struct drm_gem_shmem_object {
 	 */
 	struct sg_table *sgt;
 
-	/**
-	 * @vmap_lock: Protects the vmap address and use count
-	 */
-	struct mutex vmap_lock;
-
 	/**
 	 * @vaddr: Kernel virtual address of the backing memory
 	 */
@@ -109,7 +99,6 @@ struct drm_gem_shmem_object {
 struct drm_gem_shmem_object *drm_gem_shmem_create(struct drm_device *dev, size_t size);
 void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem);
 
-int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem);
 void drm_gem_shmem_put_pages(struct drm_gem_shmem_object *shmem);
 int drm_gem_shmem_pin(struct drm_gem_shmem_object *shmem);
 void drm_gem_shmem_unpin(struct drm_gem_shmem_object *shmem);
@@ -128,8 +117,7 @@ static inline bool drm_gem_shmem_is_purgeable(struct drm_gem_shmem_object *shmem
 		!shmem->base.dma_buf && !shmem->base.import_attach;
 }
 
-void drm_gem_shmem_purge_locked(struct drm_gem_shmem_object *shmem);
-bool drm_gem_shmem_purge(struct drm_gem_shmem_object *shmem);
+void drm_gem_shmem_purge(struct drm_gem_shmem_object *shmem);
 
 struct sg_table *drm_gem_shmem_get_sg_table(struct drm_gem_shmem_object *shmem);
 struct sg_table *drm_gem_shmem_get_pages_sgt(struct drm_gem_shmem_object *shmem);
-- 
2.39.2


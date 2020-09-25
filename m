Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91CC627866B
	for <lists+linux-tegra@lfdr.de>; Fri, 25 Sep 2020 13:56:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728339AbgIYL4I (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 25 Sep 2020 07:56:08 -0400
Received: from mx2.suse.de ([195.135.220.15]:45480 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727982AbgIYL4H (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 25 Sep 2020 07:56:07 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 44894ABF4;
        Fri, 25 Sep 2020 11:56:05 +0000 (UTC)
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     sumit.semwal@linaro.org, christian.koenig@amd.com, afd@ti.com,
        corbet@lwn.net, benjamin.gaignard@linaro.org, lmark@codeaurora.org,
        labbott@redhat.com, Brian.Starkey@arm.com, john.stultz@linaro.org,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        airlied@linux.ie, daniel@ffwll.ch, l.stach@pengutronix.de,
        linux+etnaviv@armlinux.org.uk, christian.gmeiner@gmail.com,
        jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
        rodrigo.vivi@intel.com, thierry.reding@gmail.com,
        jonathanh@nvidia.com, pawel@osciak.com, m.szyprowski@samsung.com,
        kyungmin.park@samsung.com, tfiga@chromium.org, mchehab@kernel.org,
        matthew.auld@intel.com, robin.murphy@arm.com,
        thomas.hellstrom@intel.com, sam@ravnborg.org, kraxel@redhat.com,
        arnd@arndb.de, gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
        etnaviv@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        linux-tegra@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH v3 1/4] dma-buf: Add struct dma-buf-map for storing struct dma_buf.vaddr_ptr
Date:   Fri, 25 Sep 2020 13:55:58 +0200
Message-Id: <20200925115601.23955-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200925115601.23955-1-tzimmermann@suse.de>
References: <20200925115601.23955-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The new type struct dma_buf_map represents a mapping of dma-buf memory
into kernel space. It contains a flag, is_iomem, that signals users to
access the mapped memory with I/O operations instead of regular loads
and stores.

It was assumed that DMA buffer memory can be accessed with regular load
and store operations. Some architectures, such as sparc64, require the
use of I/O operations to access dma-map buffers that are located in I/O
memory. Providing struct dma_buf_map allows drivers to implement this.
This was specifically a problem when refreshing the graphics framebuffer
on such systems. [1]

As the first step, struct dma_buf stores an instance of struct dma_buf_map
internally. Afterwards, dma-buf's vmap and vunmap interfaces are be
converted. Finally, affected drivers can be fixed.

v3:
	* moved documentation into separate patch
	* test for NULL pointers with !<ptr>

[1] https://lore.kernel.org/dri-devel/20200725191012.GA434957@ravnborg.org/

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Acked-by: Sumit Semwal <sumit.semwal@linaro.org>
---
 drivers/dma-buf/dma-buf.c   | 14 +++----
 include/linux/dma-buf-map.h | 82 +++++++++++++++++++++++++++++++++++++
 include/linux/dma-buf.h     |  3 +-
 3 files changed, 91 insertions(+), 8 deletions(-)
 create mode 100644 include/linux/dma-buf-map.h

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 58564d82a3a2..5e849ca241a0 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -1207,12 +1207,12 @@ void *dma_buf_vmap(struct dma_buf *dmabuf)
 	mutex_lock(&dmabuf->lock);
 	if (dmabuf->vmapping_counter) {
 		dmabuf->vmapping_counter++;
-		BUG_ON(!dmabuf->vmap_ptr);
-		ptr = dmabuf->vmap_ptr;
+		BUG_ON(dma_buf_map_is_null(&dmabuf->vmap_ptr));
+		ptr = dmabuf->vmap_ptr.vaddr;
 		goto out_unlock;
 	}
 
-	BUG_ON(dmabuf->vmap_ptr);
+	BUG_ON(dma_buf_map_is_set(&dmabuf->vmap_ptr));
 
 	ptr = dmabuf->ops->vmap(dmabuf);
 	if (WARN_ON_ONCE(IS_ERR(ptr)))
@@ -1220,7 +1220,7 @@ void *dma_buf_vmap(struct dma_buf *dmabuf)
 	if (!ptr)
 		goto out_unlock;
 
-	dmabuf->vmap_ptr = ptr;
+	dmabuf->vmap_ptr.vaddr = ptr;
 	dmabuf->vmapping_counter = 1;
 
 out_unlock:
@@ -1239,15 +1239,15 @@ void dma_buf_vunmap(struct dma_buf *dmabuf, void *vaddr)
 	if (WARN_ON(!dmabuf))
 		return;
 
-	BUG_ON(!dmabuf->vmap_ptr);
+	BUG_ON(dma_buf_map_is_null(&dmabuf->vmap_ptr));
 	BUG_ON(dmabuf->vmapping_counter == 0);
-	BUG_ON(dmabuf->vmap_ptr != vaddr);
+	BUG_ON(!dma_buf_map_is_vaddr(&dmabuf->vmap_ptr, vaddr));
 
 	mutex_lock(&dmabuf->lock);
 	if (--dmabuf->vmapping_counter == 0) {
 		if (dmabuf->ops->vunmap)
 			dmabuf->ops->vunmap(dmabuf, vaddr);
-		dmabuf->vmap_ptr = NULL;
+		dma_buf_map_clear(&dmabuf->vmap_ptr);
 	}
 	mutex_unlock(&dmabuf->lock);
 }
diff --git a/include/linux/dma-buf-map.h b/include/linux/dma-buf-map.h
new file mode 100644
index 000000000000..00143c88feb6
--- /dev/null
+++ b/include/linux/dma-buf-map.h
@@ -0,0 +1,82 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Pointer to dma-buf-mapped memory, plus helpers.
+ */
+
+#ifndef __DMA_BUF_MAP_H__
+#define __DMA_BUF_MAP_H__
+
+#include <linux/io.h>
+
+/**
+ * struct dma_buf_map - Pointer to vmap'ed dma-buf memory.
+ * @vaddr_iomem:	The buffer's address if in I/O memory
+ * @vaddr:		The buffer's address if in system memory
+ * @is_iomem:		True if the dma-buf memory is located in I/O
+ *			memory, or false otherwise.
+ */
+struct dma_buf_map {
+	union {
+		void __iomem *vaddr_iomem;
+		void *vaddr;
+	};
+	bool is_iomem;
+};
+
+/* API transition helper */
+static inline bool dma_buf_map_is_vaddr(const struct dma_buf_map *map, const void *vaddr)
+{
+	return !map->is_iomem && (map->vaddr == vaddr);
+}
+
+/**
+ * dma_buf_map_is_null - Tests for a dma-buf mapping to be NULL
+ * @map:	The dma-buf mapping structure
+ *
+ * Depending on the state of struct dma_buf_map.is_iomem, tests if the
+ * mapping is NULL.
+ *
+ * Returns:
+ * True if the mapping is NULL, or false otherwise.
+ */
+static inline bool dma_buf_map_is_null(const struct dma_buf_map *map)
+{
+	if (map->is_iomem)
+		return !map->vaddr_iomem;
+	return !map->vaddr;
+}
+
+/**
+ * dma_buf_map_is_set - Tests is the dma-buf mapping has been set
+ * @map:	The dma-buf mapping structure
+ *
+ * Depending on the state of struct dma_buf_map.is_iomem, tests if the
+ * mapping has been set.
+ *
+ * Returns:
+ * True if the mapping is been set, or false otherwise.
+ */
+static inline bool dma_buf_map_is_set(const struct dma_buf_map *map)
+{
+	return !dma_buf_map_is_null(map);
+}
+
+/**
+ * dma_buf_map_clear - Clears a dma-buf mapping structure
+ * @map:	The dma-buf mapping structure
+ *
+ * Clears all fields to zero; including struct dma_buf_map.is_iomem. So
+ * mapping structures that were set to point to I/O memory are reset for
+ * system memory. Pointers are cleared to NULL. This is the default.
+ */
+static inline void dma_buf_map_clear(struct dma_buf_map *map)
+{
+	if (map->is_iomem) {
+		map->vaddr_iomem = NULL;
+		map->is_iomem = false;
+	} else {
+		map->vaddr = NULL;
+	}
+}
+
+#endif /* __DMA_BUF_MAP_H__ */
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index 957b398d30e5..fcc2ddfb6d18 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -13,6 +13,7 @@
 #ifndef __DMA_BUF_H__
 #define __DMA_BUF_H__
 
+#include <linux/dma-buf-map.h>
 #include <linux/file.h>
 #include <linux/err.h>
 #include <linux/scatterlist.h>
@@ -309,7 +310,7 @@ struct dma_buf {
 	const struct dma_buf_ops *ops;
 	struct mutex lock;
 	unsigned vmapping_counter;
-	void *vmap_ptr;
+	struct dma_buf_map vmap_ptr;
 	const char *exp_name;
 	const char *name;
 	spinlock_t name_lock;
-- 
2.28.0


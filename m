Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 448CD715214
	for <lists+linux-tegra@lfdr.de>; Tue, 30 May 2023 00:46:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229830AbjE2WqW (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 29 May 2023 18:46:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230046AbjE2WqV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 29 May 2023 18:46:21 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87A1A9F;
        Mon, 29 May 2023 15:46:18 -0700 (PDT)
Received: from workpc.. (109-252-150-34.dynamic.spd-mgts.ru [109.252.150.34])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dmitry.osipenko)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id EAF2C6606E70;
        Mon, 29 May 2023 23:46:14 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1685400376;
        bh=0gUDR36aFi1An+7dulD3u+YxPIoB7pS3+8FHmbgN34M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kFTQwSvRp+7rcxbKYy6ILZdSTky+OhBr8/U7fMcRcLjIb3k1sNvx7jZCvG8ZzX6PS
         Vgze+gX3jXv24R9Afi3K7GzE0N44iN1GjkHi74MHVeSmzi6inak8ULRq8VqzisE9j5
         Y3uRDYlrv+IFub32VPIJHlHRhryBo/GIkU1Wk2M2xvbHejtxd7fS75jOrFGTmbeCgX
         5K8Ub8V1bMhPLN8yuJdIyLWs4j/vAu3GesLHrBXrqMO9WRPyEr2q6og0D1iskbt67U
         w4rYpzoLcGZlmLsM+trMh15Lb60ILuE4pZz6OOJfQtm3zNPV6IaA23aobnL9PFsh1p
         KVuT6Y9hWOf+A==
From:   Dmitry Osipenko <dmitry.osipenko@collabora.com>
To:     Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Brian Starkey <Brian.Starkey@arm.com>,
        John Stultz <jstultz@google.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Tomi Valkeinen <tomba@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Emil Velikov <emil.l.velikov@gmail.com>
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-tegra@vger.kernel.org, kernel@collabora.com
Subject: [PATCH v4 5/6] dma-buf: Change locking policy for mmap()
Date:   Tue, 30 May 2023 01:39:34 +0300
Message-Id: <20230529223935.2672495-6-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230529223935.2672495-1-dmitry.osipenko@collabora.com>
References: <20230529223935.2672495-1-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Change locking policy of mmap() callback, making exporters responsible
for handling dma-buf reservation locking. Previous locking policy stated
that dma-buf is locked for both importers and exporters by the dma-buf
core, which caused a deadlock problem for DRM drivers in a case of
self-imported dma-bufs which required to take the lock from the DRM
exporter side.

Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/dma-buf/dma-buf.c | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index aa4ea8530cb3..21916bba77d5 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -131,7 +131,6 @@ static struct file_system_type dma_buf_fs_type = {
 static int dma_buf_mmap_internal(struct file *file, struct vm_area_struct *vma)
 {
 	struct dma_buf *dmabuf;
-	int ret;
 
 	if (!is_dma_buf_file(file))
 		return -EINVAL;
@@ -147,11 +146,7 @@ static int dma_buf_mmap_internal(struct file *file, struct vm_area_struct *vma)
 	    dmabuf->size >> PAGE_SHIFT)
 		return -EINVAL;
 
-	dma_resv_lock(dmabuf->resv, NULL);
-	ret = dmabuf->ops->mmap(dmabuf, vma);
-	dma_resv_unlock(dmabuf->resv);
-
-	return ret;
+	return dmabuf->ops->mmap(dmabuf, vma);
 }
 
 static loff_t dma_buf_llseek(struct file *file, loff_t offset, int whence)
@@ -850,6 +845,7 @@ static struct sg_table * __map_dma_buf(struct dma_buf_attachment *attach,
  *     - &dma_buf_ops.release()
  *     - &dma_buf_ops.begin_cpu_access()
  *     - &dma_buf_ops.end_cpu_access()
+ *     - &dma_buf_ops.mmap()
  *
  * 2. These &dma_buf_ops callbacks are invoked with locked dma-buf
  *    reservation and exporter can't take the lock:
@@ -858,7 +854,6 @@ static struct sg_table * __map_dma_buf(struct dma_buf_attachment *attach,
  *     - &dma_buf_ops.unpin()
  *     - &dma_buf_ops.map_dma_buf()
  *     - &dma_buf_ops.unmap_dma_buf()
- *     - &dma_buf_ops.mmap()
  *     - &dma_buf_ops.vmap()
  *     - &dma_buf_ops.vunmap()
  *
@@ -1463,8 +1458,6 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_end_cpu_access, DMA_BUF);
 int dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma,
 		 unsigned long pgoff)
 {
-	int ret;
-
 	if (WARN_ON(!dmabuf || !vma))
 		return -EINVAL;
 
@@ -1485,11 +1478,7 @@ int dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma,
 	vma_set_file(vma, dmabuf->file);
 	vma->vm_pgoff = pgoff;
 
-	dma_resv_lock(dmabuf->resv, NULL);
-	ret = dmabuf->ops->mmap(dmabuf, vma);
-	dma_resv_unlock(dmabuf->resv);
-
-	return ret;
+	return dmabuf->ops->mmap(dmabuf, vma);
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_mmap, DMA_BUF);
 
-- 
2.40.1


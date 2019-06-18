Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0C024A68A
	for <lists+linux-tegra@lfdr.de>; Tue, 18 Jun 2019 18:17:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730003AbfFRQQk (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 18 Jun 2019 12:16:40 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:32876 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729976AbfFRQQj (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 18 Jun 2019 12:16:39 -0400
Received: by mail-lj1-f193.google.com with SMTP id h10so184070ljg.0;
        Tue, 18 Jun 2019 09:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ve9QZe9narnIHEdkikFe4H1K5ftKONF8XglM9iqqtGE=;
        b=oCSWY00eIGfsc7PqD3sl6bzirOkevvcWg6qTjGzAszU+370qHbut1OvJGqcpKg8e1i
         dRcQq4+9yGXCFGvyEFRGjRA+9qHzLSaSM23fhlV2b5sFyVEtdGWKs4FPPqCVtABG9EH+
         uyqNBV8cy6G0KIXselDSkOSVPPC9tr1HwCddoCcUoVfINJa/nN1G/gbHFSOQ7sFG4mFL
         sQ8WTqsUwWuVvAIKbCqy9jzQCE1VFd4D+uVd4ttIG82HINq6G29NzVU34AtV2ige0eic
         wdS4PfJuXJf99x77ZsHrjzzDfrmsrJ0jKKzsrTzc+HCalBn706cFVuI/LbJLPrbqnKBx
         AzpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ve9QZe9narnIHEdkikFe4H1K5ftKONF8XglM9iqqtGE=;
        b=J1p33TZIZPvvHulVN093qh0F/RS2rKahqjOFXQEa5IgfgEOXis1eGQ9IJivUwWHM5U
         BYBmPlt716xzH5evUdeFv+7FKt7pxsgMFoYYQVne3Tw+MrtGLoEeQCQrODaSk4GUSoy6
         YPc6D3MxNWXacqnQqDrv1oBYSSd3hN2O4Vzioq7ws7l4NyWUBPJfkVoXsxl0QtlIgtDC
         ydsRuc2OHL1AMn4MYmBXeO/mh5Qj1KIouH8QfzTEVQSuMSr+3ueWRmgU2xxe4J/Zrhu2
         aNBSLkD1twshZ+c2vXPhFUxIQUhKgraIjNai/Dn0TH1c65HWX8d+ZtUBlIeU27pBP5r1
         uvgw==
X-Gm-Message-State: APjAAAUuoxAp0mniJy4qMs+OCrSTj3vgvtVCDAEptpfaeKB2OoXFjznv
        O6XRTBjwUVDe4FykOgCVaNs=
X-Google-Smtp-Source: APXvYqzpfVngHmDCckiVbR5CSwkZtATzjLIIuih4mzYtv8x+fXYMJQXzs5Ftog0g8GQe0xdUHxmT9g==
X-Received: by 2002:a2e:4e12:: with SMTP id c18mr1403918ljb.211.1560874596226;
        Tue, 18 Jun 2019 09:16:36 -0700 (PDT)
Received: from localhost.localdomain (ppp91-79-162-197.pppoe.mtu-net.ru. [91.79.162.197])
        by smtp.gmail.com with ESMTPSA id v15sm2273295lfd.53.2019.06.18.09.16.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Jun 2019 09:16:35 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] staging: media: tegra-vde: Defer dmabuf's unmapping
Date:   Tue, 18 Jun 2019 19:14:58 +0300
Message-Id: <20190618161458.20499-8-digetx@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190618161458.20499-1-digetx@gmail.com>
References: <20190618161458.20499-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Frequent IOMMU remappings take about 50% of CPU usage because there is
quite a lot to remap. Defer dmabuf's unmapping by 5 seconds in order to
mitigate the mapping overhead which goes away completely and driver works
as fast as in a case of a disabled IOMMU. The case of a disabled IOMMU
should also benefit a tad from the caching since CPU cache maintenance
that happens on dmabuf's attaching takes some resources.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/staging/media/tegra-vde/Makefile      |   2 +-
 .../staging/media/tegra-vde/dmabuf-cache.c    | 226 ++++++++++++++++++
 drivers/staging/media/tegra-vde/iommu.c       |   2 -
 drivers/staging/media/tegra-vde/vde.c         | 143 +++--------
 drivers/staging/media/tegra-vde/vde.h         |  18 +-
 5 files changed, 276 insertions(+), 115 deletions(-)
 create mode 100644 drivers/staging/media/tegra-vde/dmabuf-cache.c

diff --git a/drivers/staging/media/tegra-vde/Makefile b/drivers/staging/media/tegra-vde/Makefile
index c11867e28233..2827f7601de8 100644
--- a/drivers/staging/media/tegra-vde/Makefile
+++ b/drivers/staging/media/tegra-vde/Makefile
@@ -1,3 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
-tegra-vde-y := vde.o iommu.o
+tegra-vde-y := vde.o iommu.o dmabuf-cache.o
 obj-$(CONFIG_TEGRA_VDE)	+= tegra-vde.o
diff --git a/drivers/staging/media/tegra-vde/dmabuf-cache.c b/drivers/staging/media/tegra-vde/dmabuf-cache.c
new file mode 100644
index 000000000000..a93b317885bf
--- /dev/null
+++ b/drivers/staging/media/tegra-vde/dmabuf-cache.c
@@ -0,0 +1,226 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * NVIDIA Tegra Video decoder driver
+ *
+ * Copyright (C) 2016-2019 GRATE-DRIVER project
+ */
+
+#include <linux/dma-buf.h>
+#include <linux/iova.h>
+#include <linux/kernel.h>
+#include <linux/list.h>
+#include <linux/sched.h>
+#include <linux/slab.h>
+#include <linux/workqueue.h>
+
+#include "vde.h"
+
+struct tegra_vde_cache_entry {
+	enum dma_data_direction dma_dir;
+	struct dma_buf_attachment *a;
+	struct delayed_work dwork;
+	struct tegra_vde *vde;
+	struct list_head list;
+	struct sg_table *sgt;
+	struct iova *iova;
+	unsigned int refcnt;
+};
+
+static void tegra_vde_release_entry(struct tegra_vde_cache_entry *entry)
+{
+	struct dma_buf *dmabuf = entry->a->dmabuf;
+
+	WARN_ON_ONCE(entry->refcnt);
+
+	if (entry->vde->domain)
+		tegra_vde_iommu_unmap(entry->vde, entry->iova);
+
+	dma_buf_unmap_attachment(entry->a, entry->sgt, entry->dma_dir);
+	dma_buf_detach(dmabuf, entry->a);
+	dma_buf_put(dmabuf);
+
+	list_del(&entry->list);
+	kfree(entry);
+}
+
+static void tegra_vde_delayed_unmap(struct work_struct *work)
+{
+	struct tegra_vde_cache_entry *entry;
+	struct tegra_vde *vde;
+
+	entry = container_of(work, struct tegra_vde_cache_entry,
+			     dwork.work);
+	vde = entry->vde;
+
+	mutex_lock(&vde->map_lock);
+	tegra_vde_release_entry(entry);
+	mutex_unlock(&vde->map_lock);
+}
+
+int tegra_vde_dmabuf_cache_map(struct tegra_vde *vde,
+			       struct dma_buf *dmabuf,
+			       enum dma_data_direction dma_dir,
+			       struct dma_buf_attachment **ap,
+			       dma_addr_t *addrp)
+{
+	struct device *dev = vde->miscdev.parent;
+	struct dma_buf_attachment *attachment;
+	struct tegra_vde_cache_entry *entry;
+	struct sg_table *sgt;
+	struct iova *iova;
+	int err;
+
+	mutex_lock(&vde->map_lock);
+
+	list_for_each_entry(entry, &vde->map_list, list) {
+		if (entry->a->dmabuf != dmabuf)
+			continue;
+
+		if (!cancel_delayed_work(&entry->dwork))
+			continue;
+
+		if (entry->dma_dir != dma_dir)
+			entry->dma_dir = DMA_BIDIRECTIONAL;
+
+		dma_buf_put(dmabuf);
+
+		if (vde->domain)
+			*addrp = iova_dma_addr(&vde->iova, entry->iova);
+		else
+			*addrp = sg_dma_address(entry->sgt->sgl);
+
+		goto ref;
+	}
+
+	attachment = dma_buf_attach(dmabuf, dev);
+	if (IS_ERR(attachment)) {
+		dev_err(dev, "Failed to attach dmabuf\n");
+		err = PTR_ERR(attachment);
+		goto err_unlock;
+	}
+
+	sgt = dma_buf_map_attachment(attachment, dma_dir);
+	if (IS_ERR(sgt)) {
+		dev_err(dev, "Failed to get dmabufs sg_table\n");
+		err = PTR_ERR(sgt);
+		goto err_detach;
+	}
+
+	if (!vde->domain && sgt->nents > 1) {
+		dev_err(dev, "Sparse DMA region is unsupported, please enable IOMMU\n");
+		err = -EINVAL;
+		goto err_unmap;
+	}
+
+	entry = kzalloc(sizeof(*entry), GFP_KERNEL);
+	if (!entry) {
+		err = -ENOMEM;
+		goto err_unmap;
+	}
+
+	if (vde->domain) {
+		err = tegra_vde_iommu_map(vde, sgt, &iova, dmabuf->size);
+		if (err)
+			goto err_free;
+
+		*addrp = iova_dma_addr(&vde->iova, iova);
+	} else {
+		*addrp = sg_dma_address(sgt->sgl);
+		iova = NULL;
+	}
+
+	INIT_DELAYED_WORK(&entry->dwork, tegra_vde_delayed_unmap);
+	list_add(&entry->list, &vde->map_list);
+
+	entry->dma_dir = dma_dir;
+	entry->iova = iova;
+	entry->vde = vde;
+	entry->sgt = sgt;
+	entry->a = attachment;
+ref:
+	entry->refcnt++;
+
+	*ap = entry->a;
+
+	mutex_unlock(&vde->map_lock);
+
+	return 0;
+
+err_free:
+	kfree(entry);
+err_unmap:
+	dma_buf_unmap_attachment(attachment, sgt, dma_dir);
+err_detach:
+	dma_buf_detach(dmabuf, attachment);
+err_unlock:
+	mutex_unlock(&vde->map_lock);
+
+	return err;
+}
+
+void tegra_vde_dmabuf_cache_unmap(struct tegra_vde *vde,
+				  struct dma_buf_attachment *a,
+				  bool release)
+{
+	struct tegra_vde_cache_entry *entry;
+
+	mutex_lock(&vde->map_lock);
+
+	list_for_each_entry(entry, &vde->map_list, list) {
+		if (entry->a != a)
+			continue;
+
+		WARN_ON_ONCE(!entry->refcnt);
+
+		if (--entry->refcnt == 0) {
+			if (release)
+				tegra_vde_release_entry(entry);
+			else
+				schedule_delayed_work(&entry->dwork, 5 * HZ);
+		}
+		break;
+	}
+
+	mutex_unlock(&vde->map_lock);
+}
+
+void tegra_vde_dmabuf_cache_unmap_sync(struct tegra_vde *vde)
+{
+	struct tegra_vde_cache_entry *entry, *tmp;
+
+	mutex_lock(&vde->map_lock);
+
+	list_for_each_entry_safe(entry, tmp, &vde->map_list, list) {
+		if (entry->refcnt)
+			continue;
+
+		if (!cancel_delayed_work(&entry->dwork))
+			continue;
+
+		tegra_vde_release_entry(entry);
+	}
+
+	mutex_unlock(&vde->map_lock);
+}
+
+void tegra_vde_dmabuf_cache_unmap_all(struct tegra_vde *vde)
+{
+	struct tegra_vde_cache_entry *entry, *tmp;
+
+	mutex_lock(&vde->map_lock);
+
+	while (!list_empty(&vde->map_list)) {
+		list_for_each_entry_safe(entry, tmp, &vde->map_list, list) {
+			if (!cancel_delayed_work(&entry->dwork))
+				continue;
+
+			tegra_vde_release_entry(entry);
+		}
+
+		mutex_unlock(&vde->map_lock);
+		schedule();
+		mutex_lock(&vde->map_lock);
+	}
+
+	mutex_unlock(&vde->map_lock);
+}
diff --git a/drivers/staging/media/tegra-vde/iommu.c b/drivers/staging/media/tegra-vde/iommu.c
index ddc281b82e5c..1ee46a8d1cc7 100644
--- a/drivers/staging/media/tegra-vde/iommu.c
+++ b/drivers/staging/media/tegra-vde/iommu.c
@@ -19,7 +19,6 @@
 int tegra_vde_iommu_map(struct tegra_vde *vde,
 			struct sg_table *sgt,
 			struct iova **iovap,
-			dma_addr_t *addrp,
 			size_t size)
 {
 	struct iova *iova;
@@ -45,7 +44,6 @@ int tegra_vde_iommu_map(struct tegra_vde *vde,
 	}
 
 	*iovap = iova;
-	*addrp = addr;
 
 	return 0;
 }
diff --git a/drivers/staging/media/tegra-vde/vde.c b/drivers/staging/media/tegra-vde/vde.c
index cbcdbfef072d..3466daddf663 100644
--- a/drivers/staging/media/tegra-vde/vde.c
+++ b/drivers/staging/media/tegra-vde/vde.c
@@ -11,6 +11,7 @@
 #include <linux/genalloc.h>
 #include <linux/interrupt.h>
 #include <linux/iopoll.h>
+#include <linux/list.h>
 #include <linux/miscdevice.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
@@ -37,18 +38,10 @@
 #define BSE_DMA_BUSY		BIT(23)
 
 struct video_frame {
-	struct iova *y_iova;
-	struct iova *cb_iova;
-	struct iova *cr_iova;
-	struct iova *aux_iova;
 	struct dma_buf_attachment *y_dmabuf_attachment;
 	struct dma_buf_attachment *cb_dmabuf_attachment;
 	struct dma_buf_attachment *cr_dmabuf_attachment;
 	struct dma_buf_attachment *aux_dmabuf_attachment;
-	struct sg_table *y_sgt;
-	struct sg_table *cb_sgt;
-	struct sg_table *cr_sgt;
-	struct sg_table *aux_sgt;
 	dma_addr_t y_addr;
 	dma_addr_t cb_addr;
 	dma_addr_t cr_addr;
@@ -494,22 +487,6 @@ static void tegra_vde_decode_frame(struct tegra_vde *vde,
 			 vde->sxe, 0x00);
 }
 
-static void tegra_vde_detach_and_put_dmabuf(struct tegra_vde *vde,
-					    enum dma_data_direction dma_dir,
-					    struct dma_buf_attachment *a,
-					    struct sg_table *sgt,
-					    struct iova *iova)
-{
-	struct dma_buf *dmabuf = a->dmabuf;
-
-	if (vde->domain)
-		tegra_vde_iommu_unmap(vde, iova);
-
-	dma_buf_unmap_attachment(a, sgt, dma_dir);
-	dma_buf_detach(dmabuf, a);
-	dma_buf_put(dmabuf);
-}
-
 static int tegra_vde_attach_dmabuf(struct tegra_vde *vde,
 				   int fd,
 				   unsigned long offset,
@@ -517,15 +494,11 @@ static int tegra_vde_attach_dmabuf(struct tegra_vde *vde,
 				   size_t align_size,
 				   struct dma_buf_attachment **a,
 				   dma_addr_t *addrp,
-				   struct sg_table **s,
-				   struct iova **iovap,
 				   size_t *size,
 				   enum dma_data_direction dma_dir)
 {
 	struct device *dev = vde->miscdev.parent;
-	struct dma_buf_attachment *attachment;
 	struct dma_buf *dmabuf;
-	struct sg_table *sgt;
 	int err;
 
 	dmabuf = dma_buf_get(fd);
@@ -546,49 +519,17 @@ static int tegra_vde_attach_dmabuf(struct tegra_vde *vde,
 		return -EINVAL;
 	}
 
-	attachment = dma_buf_attach(dmabuf, dev);
-	if (IS_ERR(attachment)) {
-		dev_err(dev, "Failed to attach dmabuf\n");
-		err = PTR_ERR(attachment);
+	err = tegra_vde_dmabuf_cache_map(vde, dmabuf, dma_dir, a, addrp);
+	if (err)
 		goto err_put;
-	}
-
-	sgt = dma_buf_map_attachment(attachment, dma_dir);
-	if (IS_ERR(sgt)) {
-		dev_err(dev, "Failed to get dmabufs sg_table\n");
-		err = PTR_ERR(sgt);
-		goto err_detach;
-	}
-
-	if (!vde->domain && sgt->nents > 1) {
-		dev_err(dev, "Sparse DMA region is unsupported, please enable IOMMU\n");
-		err = -EINVAL;
-		goto err_unmap;
-	}
-
-	if (vde->domain) {
-		err = tegra_vde_iommu_map(vde, sgt, iovap, addrp, dmabuf->size);
-		if (err) {
-			dev_err(dev, "IOMMU mapping failed: %d\n", err);
-			goto err_unmap;
-		}
-	} else {
-		*addrp = sg_dma_address(sgt->sgl);
-	}
 
 	*addrp = *addrp + offset;
-	*a = attachment;
-	*s = sgt;
 
 	if (size)
 		*size = dmabuf->size - offset;
 
 	return 0;
 
-err_unmap:
-	dma_buf_unmap_attachment(attachment, sgt, dma_dir);
-err_detach:
-	dma_buf_detach(dmabuf, attachment);
 err_put:
 	dma_buf_put(dmabuf);
 
@@ -608,8 +549,6 @@ static int tegra_vde_attach_dmabufs_to_frame(struct tegra_vde *vde,
 				      src->y_offset, lsize, SZ_256,
 				      &frame->y_dmabuf_attachment,
 				      &frame->y_addr,
-				      &frame->y_sgt,
-				      &frame->y_iova,
 				      NULL, dma_dir);
 	if (err)
 		return err;
@@ -618,8 +557,6 @@ static int tegra_vde_attach_dmabufs_to_frame(struct tegra_vde *vde,
 				      src->cb_offset, csize, SZ_256,
 				      &frame->cb_dmabuf_attachment,
 				      &frame->cb_addr,
-				      &frame->cb_sgt,
-				      &frame->cb_iova,
 				      NULL, dma_dir);
 	if (err)
 		goto err_release_y;
@@ -628,8 +565,6 @@ static int tegra_vde_attach_dmabufs_to_frame(struct tegra_vde *vde,
 				      src->cr_offset, csize, SZ_256,
 				      &frame->cr_dmabuf_attachment,
 				      &frame->cr_addr,
-				      &frame->cr_sgt,
-				      &frame->cr_iova,
 				      NULL, dma_dir);
 	if (err)
 		goto err_release_cb;
@@ -643,8 +578,6 @@ static int tegra_vde_attach_dmabufs_to_frame(struct tegra_vde *vde,
 				      src->aux_offset, csize, SZ_256,
 				      &frame->aux_dmabuf_attachment,
 				      &frame->aux_addr,
-				      &frame->aux_sgt,
-				      &frame->aux_iova,
 				      NULL, dma_dir);
 	if (err)
 		goto err_release_cr;
@@ -652,20 +585,11 @@ static int tegra_vde_attach_dmabufs_to_frame(struct tegra_vde *vde,
 	return 0;
 
 err_release_cr:
-	tegra_vde_detach_and_put_dmabuf(vde, dma_dir,
-					frame->cr_dmabuf_attachment,
-					frame->cr_sgt,
-					frame->cr_iova);
+	tegra_vde_dmabuf_cache_unmap(vde, frame->cr_dmabuf_attachment, true);
 err_release_cb:
-	tegra_vde_detach_and_put_dmabuf(vde, dma_dir,
-					frame->cb_dmabuf_attachment,
-					frame->cb_sgt,
-					frame->cb_iova);
+	tegra_vde_dmabuf_cache_unmap(vde, frame->cb_dmabuf_attachment, true);
 err_release_y:
-	tegra_vde_detach_and_put_dmabuf(vde, dma_dir,
-					frame->y_dmabuf_attachment,
-					frame->y_sgt,
-					frame->y_iova);
+	tegra_vde_dmabuf_cache_unmap(vde, frame->y_dmabuf_attachment, true);
 
 	return err;
 }
@@ -673,28 +597,16 @@ static int tegra_vde_attach_dmabufs_to_frame(struct tegra_vde *vde,
 static void tegra_vde_release_frame_dmabufs(struct tegra_vde *vde,
 					    struct video_frame *frame,
 					    enum dma_data_direction dma_dir,
-					    bool baseline_profile)
+					    bool baseline_profile,
+					    bool release)
 {
 	if (!baseline_profile)
-		tegra_vde_detach_and_put_dmabuf(vde, dma_dir,
-						frame->aux_dmabuf_attachment,
-						frame->aux_sgt,
-						frame->aux_iova);
-
-	tegra_vde_detach_and_put_dmabuf(vde, dma_dir,
-					frame->cr_dmabuf_attachment,
-					frame->cr_sgt,
-					frame->cr_iova);
-
-	tegra_vde_detach_and_put_dmabuf(vde, dma_dir,
-					frame->cb_dmabuf_attachment,
-					frame->cb_sgt,
-					frame->cb_iova);
-
-	tegra_vde_detach_and_put_dmabuf(vde, dma_dir,
-					frame->y_dmabuf_attachment,
-					frame->y_sgt,
-					frame->y_iova);
+		tegra_vde_dmabuf_cache_unmap(vde, frame->aux_dmabuf_attachment,
+					     release);
+
+	tegra_vde_dmabuf_cache_unmap(vde, frame->cr_dmabuf_attachment, release);
+	tegra_vde_dmabuf_cache_unmap(vde, frame->cb_dmabuf_attachment, release);
+	tegra_vde_dmabuf_cache_unmap(vde, frame->y_dmabuf_attachment, release);
 }
 
 static int tegra_vde_validate_frame(struct device *dev,
@@ -786,8 +698,6 @@ static int tegra_vde_ioctl_decode_h264(struct tegra_vde *vde,
 	struct tegra_vde_h264_frame __user *frames_user;
 	struct video_frame *dpb_frames;
 	struct dma_buf_attachment *bitstream_data_dmabuf_attachment;
-	struct sg_table *bitstream_sgt;
-	struct iova *bitstream_iova;
 	enum dma_data_direction dma_dir;
 	dma_addr_t bitstream_data_addr;
 	dma_addr_t bsev_ptr;
@@ -812,8 +722,6 @@ static int tegra_vde_ioctl_decode_h264(struct tegra_vde *vde,
 				      SZ_16K, SZ_16K,
 				      &bitstream_data_dmabuf_attachment,
 				      &bitstream_data_addr,
-				      &bitstream_sgt,
-				      &bitstream_iova,
 				      &bitstream_data_size,
 				      DMA_TO_DEVICE);
 	if (ret)
@@ -944,7 +852,7 @@ static int tegra_vde_ioctl_decode_h264(struct tegra_vde *vde,
 		dma_dir = (i == 0) ? DMA_FROM_DEVICE : DMA_TO_DEVICE;
 
 		tegra_vde_release_frame_dmabufs(vde, &dpb_frames[i], dma_dir,
-						ctx.baseline_profile);
+						ctx.baseline_profile, ret != 0);
 	}
 
 free_dpb_frames:
@@ -954,10 +862,8 @@ static int tegra_vde_ioctl_decode_h264(struct tegra_vde *vde,
 	kfree(frames);
 
 release_bitstream_dmabuf:
-	tegra_vde_detach_and_put_dmabuf(vde, DMA_TO_DEVICE,
-					bitstream_data_dmabuf_attachment,
-					bitstream_sgt,
-					bitstream_iova);
+	tegra_vde_dmabuf_cache_unmap(vde, bitstream_data_dmabuf_attachment,
+				     ret != 0);
 
 	return ret;
 }
@@ -979,9 +885,21 @@ static long tegra_vde_unlocked_ioctl(struct file *filp,
 	return -ENOTTY;
 }
 
+static int tegra_vde_release_file(struct inode *inode, struct file *filp)
+{
+	struct miscdevice *miscdev = filp->private_data;
+	struct tegra_vde *vde = container_of(miscdev, struct tegra_vde,
+					     miscdev);
+
+	tegra_vde_dmabuf_cache_unmap_sync(vde);
+
+	return 0;
+}
+
 static const struct file_operations tegra_vde_fops = {
 	.owner		= THIS_MODULE,
 	.unlocked_ioctl	= tegra_vde_unlocked_ioctl,
+	.release	= tegra_vde_release_file,
 };
 
 static irqreturn_t tegra_vde_isr(int irq, void *data)
@@ -1159,6 +1077,8 @@ static int tegra_vde_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	}
 
+	INIT_LIST_HEAD(&vde->map_list);
+	mutex_init(&vde->map_lock);
 	mutex_init(&vde->lock);
 	init_completion(&vde->decode_completion);
 
@@ -1221,6 +1141,7 @@ static int tegra_vde_remove(struct platform_device *pdev)
 
 	misc_deregister(&vde->miscdev);
 
+	tegra_vde_dmabuf_cache_unmap_all(vde);
 	tegra_vde_iommu_deinit(vde);
 
 	gen_pool_free(vde->iram_pool, (unsigned long)vde->iram,
diff --git a/drivers/staging/media/tegra-vde/vde.h b/drivers/staging/media/tegra-vde/vde.h
index ef9616b24e08..4b901aeed6e9 100644
--- a/drivers/staging/media/tegra-vde/vde.h
+++ b/drivers/staging/media/tegra-vde/vde.h
@@ -9,16 +9,20 @@
 #define TEGRA_VDE_H
 
 #include <linux/completion.h>
+#include <linux/dma-direction.h>
+#include <linux/list.h>
 #include <linux/miscdevice.h>
 #include <linux/mutex.h>
 #include <linux/types.h>
 #include <linux/iova.h>
 
 struct clk;
+struct dma_buf;
 struct gen_pool;
 struct iommu_group;
 struct iommu_domain;
 struct reset_control;
+struct dma_buf_attachment;
 
 struct tegra_vde {
 	void __iomem *sxe;
@@ -31,6 +35,8 @@ struct tegra_vde {
 	void __iomem *vdma;
 	void __iomem *frameid;
 	struct mutex lock;
+	struct mutex map_lock;
+	struct list_head map_list;
 	struct miscdevice miscdev;
 	struct reset_control *rst;
 	struct reset_control *rst_mc;
@@ -49,10 +55,20 @@ void tegra_vde_iommu_deinit(struct tegra_vde *vde);
 int tegra_vde_iommu_map(struct tegra_vde *vde,
 			struct sg_table *sgt,
 			struct iova **iovap,
-			dma_addr_t *addrp,
 			size_t size);
 void tegra_vde_iommu_unmap(struct tegra_vde *vde, struct iova *iova);
 
+int tegra_vde_dmabuf_cache_map(struct tegra_vde *vde,
+			       struct dma_buf *dmabuf,
+			       enum dma_data_direction dma_dir,
+			       struct dma_buf_attachment **ap,
+			       dma_addr_t *addrp);
+void tegra_vde_dmabuf_cache_unmap(struct tegra_vde *vde,
+				  struct dma_buf_attachment *a,
+				  bool release);
+void tegra_vde_dmabuf_cache_unmap_sync(struct tegra_vde *vde);
+void tegra_vde_dmabuf_cache_unmap_all(struct tegra_vde *vde);
+
 static __maybe_unused char const *
 tegra_vde_reg_base_name(struct tegra_vde *vde, void __iomem *base)
 {
-- 
2.22.0


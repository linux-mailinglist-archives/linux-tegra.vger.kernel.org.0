Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C6D526B332
	for <lists+linux-tegra@lfdr.de>; Wed, 16 Sep 2020 01:01:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727081AbgIOXBZ (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 15 Sep 2020 19:01:25 -0400
Received: from mx2.suse.de ([195.135.220.15]:36400 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726146AbgIOPB1 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 15 Sep 2020 11:01:27 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 459C6AD5F;
        Tue, 15 Sep 2020 15:00:21 +0000 (UTC)
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     alexander.deucher@amd.com, christian.koenig@amd.com,
        airlied@linux.ie, daniel@ffwll.ch, linux@armlinux.org.uk,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        l.stach@pengutronix.de, christian.gmeiner@gmail.com,
        inki.dae@samsung.com, jy0922.shim@samsung.com,
        sw0312.kim@samsung.com, kyungmin.park@samsung.com,
        kgene@kernel.org, krzk@kernel.org, patrik.r.jakobsson@gmail.com,
        jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
        rodrigo.vivi@intel.com, chunkuang.hu@kernel.org,
        p.zabel@pengutronix.de, matthias.bgg@gmail.com,
        robdclark@gmail.com, sean@poorly.run, bskeggs@redhat.com,
        tomi.valkeinen@ti.com, eric@anholt.net, hjc@rock-chips.com,
        heiko@sntech.de, thierry.reding@gmail.com, jonathanh@nvidia.com,
        rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com,
        oleksandr_andrushchenko@epam.com, hyun.kwon@xilinx.com,
        laurent.pinchart@ideasonboard.com, michal.simek@xilinx.com,
        sumit.semwal@linaro.org, evan.quan@amd.com, Hawking.Zhang@amd.com,
        tianci.yin@amd.com, marek.olsak@amd.com, hdegoede@redhat.com,
        andrey.grodzovsky@amd.com, Felix.Kuehling@amd.com,
        xinhui.pan@amd.com, aaron.liu@amd.com, nirmoy.das@amd.com,
        chris@chris-wilson.co.uk, matthew.auld@intel.com,
        tvrtko.ursulin@linux.intel.com, andi.shyti@intel.com,
        sam@ravnborg.org, miaoqinglang@huawei.com,
        emil.velikov@collabora.com
Cc:     amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        etnaviv@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
        xen-devel@lists.xenproject.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 05/21] drm/gma500: Introduce GEM object functions
Date:   Tue, 15 Sep 2020 16:59:42 +0200
Message-Id: <20200915145958.19993-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200915145958.19993-1-tzimmermann@suse.de>
References: <20200915145958.19993-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

GEM object functions deprecate several similar callback interfaces in
struct drm_driver. This patch replaces the per-driver callbacks with
per-instance callbacks in gma500.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/gma500/framebuffer.c |  2 ++
 drivers/gpu/drm/gma500/gem.c         | 18 ++++++++++++++++--
 drivers/gpu/drm/gma500/gem.h         |  3 +++
 drivers/gpu/drm/gma500/psb_drv.c     |  9 ---------
 drivers/gpu/drm/gma500/psb_drv.h     |  2 --
 5 files changed, 21 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/gma500/framebuffer.c b/drivers/gpu/drm/gma500/framebuffer.c
index 54d9876b5305..5ede24fb44ae 100644
--- a/drivers/gpu/drm/gma500/framebuffer.c
+++ b/drivers/gpu/drm/gma500/framebuffer.c
@@ -24,6 +24,7 @@
 #include <drm/drm_gem_framebuffer_helper.h>
 
 #include "framebuffer.h"
+#include "gem.h"
 #include "gtt.h"
 #include "psb_drv.h"
 #include "psb_intel_drv.h"
@@ -285,6 +286,7 @@ static struct gtt_range *psbfb_alloc(struct drm_device *dev, int aligned_size)
 	/* Begin by trying to use stolen memory backing */
 	backing = psb_gtt_alloc_range(dev, aligned_size, "fb", 1, PAGE_SIZE);
 	if (backing) {
+		backing->gem.funcs = &psb_gem_object_funcs;
 		drm_gem_private_object_init(dev, &backing->gem, aligned_size);
 		return backing;
 	}
diff --git a/drivers/gpu/drm/gma500/gem.c b/drivers/gpu/drm/gma500/gem.c
index f9c4b1d76f56..8f07de83b6fb 100644
--- a/drivers/gpu/drm/gma500/gem.c
+++ b/drivers/gpu/drm/gma500/gem.c
@@ -18,7 +18,9 @@
 
 #include "psb_drv.h"
 
-void psb_gem_free_object(struct drm_gem_object *obj)
+static vm_fault_t psb_gem_fault(struct vm_fault *vmf);
+
+static void psb_gem_free_object(struct drm_gem_object *obj)
 {
 	struct gtt_range *gtt = container_of(obj, struct gtt_range, gem);
 
@@ -36,6 +38,17 @@ int psb_gem_get_aperture(struct drm_device *dev, void *data,
 	return -EINVAL;
 }
 
+static const struct vm_operations_struct psb_gem_vm_ops = {
+	.fault = psb_gem_fault,
+	.open = drm_gem_vm_open,
+	.close = drm_gem_vm_close,
+};
+
+const struct drm_gem_object_funcs psb_gem_object_funcs = {
+	.free = psb_gem_free_object,
+	.vm_ops = &psb_gem_vm_ops,
+};
+
 /**
  *	psb_gem_create		-	create a mappable object
  *	@file: the DRM file of the client
@@ -63,6 +76,7 @@ int psb_gem_create(struct drm_file *file, struct drm_device *dev, u64 size,
 		dev_err(dev->dev, "no memory for %lld byte GEM object\n", size);
 		return -ENOSPC;
 	}
+	r->gem.funcs = &psb_gem_object_funcs;
 	/* Initialize the extra goodies GEM needs to do all the hard work */
 	if (drm_gem_object_init(dev, &r->gem, size) != 0) {
 		psb_gtt_free_range(dev, r);
@@ -123,7 +137,7 @@ int psb_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
  *	vma->vm_private_data points to the GEM object that is backing this
  *	mapping.
  */
-vm_fault_t psb_gem_fault(struct vm_fault *vmf)
+static vm_fault_t psb_gem_fault(struct vm_fault *vmf)
 {
 	struct vm_area_struct *vma = vmf->vma;
 	struct drm_gem_object *obj;
diff --git a/drivers/gpu/drm/gma500/gem.h b/drivers/gpu/drm/gma500/gem.h
index 4a74dc623b6b..3741a711b9fd 100644
--- a/drivers/gpu/drm/gma500/gem.h
+++ b/drivers/gpu/drm/gma500/gem.h
@@ -8,6 +8,9 @@
 #ifndef _GEM_H
 #define _GEM_H
 
+extern const struct drm_gem_object_funcs psb_gem_object_funcs;
+
 extern int psb_gem_create(struct drm_file *file, struct drm_device *dev,
 			  u64 size, u32 *handlep, int stolen, u32 align);
+
 #endif
diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
index 34b4aae9a15e..b13376a6fb91 100644
--- a/drivers/gpu/drm/gma500/psb_drv.c
+++ b/drivers/gpu/drm/gma500/psb_drv.c
@@ -480,12 +480,6 @@ static const struct dev_pm_ops psb_pm_ops = {
 	.runtime_idle = psb_runtime_idle,
 };
 
-static const struct vm_operations_struct psb_gem_vm_ops = {
-	.fault = psb_gem_fault,
-	.open = drm_gem_vm_open,
-	.close = drm_gem_vm_close,
-};
-
 static const struct file_operations psb_gem_fops = {
 	.owner = THIS_MODULE,
 	.open = drm_open,
@@ -507,9 +501,6 @@ static struct drm_driver driver = {
 	.irq_uninstall = psb_irq_uninstall,
 	.irq_handler = psb_irq_handler,
 
-	.gem_free_object_unlocked = psb_gem_free_object,
-	.gem_vm_ops = &psb_gem_vm_ops,
-
 	.dumb_create = psb_gem_dumb_create,
 	.ioctls = psb_ioctls,
 	.fops = &psb_gem_fops,
diff --git a/drivers/gpu/drm/gma500/psb_drv.h b/drivers/gpu/drm/gma500/psb_drv.h
index 956926341316..c71a5a4e912c 100644
--- a/drivers/gpu/drm/gma500/psb_drv.h
+++ b/drivers/gpu/drm/gma500/psb_drv.h
@@ -735,12 +735,10 @@ extern const struct drm_connector_helper_funcs
 extern const struct drm_connector_funcs psb_intel_lvds_connector_funcs;
 
 /* gem.c */
-extern void psb_gem_free_object(struct drm_gem_object *obj);
 extern int psb_gem_get_aperture(struct drm_device *dev, void *data,
 			struct drm_file *file);
 extern int psb_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
 			struct drm_mode_create_dumb *args);
-extern vm_fault_t psb_gem_fault(struct vm_fault *vmf);
 
 /* psb_device.c */
 extern const struct psb_ops psb_chip_ops;
-- 
2.28.0


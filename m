Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C38BBE3633
	for <lists+linux-tegra@lfdr.de>; Thu, 24 Oct 2019 17:10:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407409AbfJXPKi (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 24 Oct 2019 11:10:38 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:44481 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407327AbfJXPKi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Oct 2019 11:10:38 -0400
Received: by mail-wr1-f65.google.com with SMTP id z11so3134449wro.11
        for <linux-tegra@vger.kernel.org>; Thu, 24 Oct 2019 08:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iPfY7+I+U87jKu1umZ2Dx/+dKwkQ7iiI6IZAa/Ykx5g=;
        b=dSA7/5LafziFlZey3oi471xxaFLvKP4ziT26/aBvSEtXW4ih+hKbS2kftc2G84zNHD
         0634QcYwLRB+VXiyFXThK+v9nNwdhLeyny93W6cpEWTyBu/cTDZDoaVXWpu0SBo9ATLo
         3nbeK93cgpZqeAEGJf0wpRbgDi3fKs/JaAGeigB/KNVd/H99w9WdkhWKGXgMdNMtgOA6
         j/eC/MYqvubvgMOqcjtv7e+h7bKtOJt+uxmwhW82YCHCvXM9NZ6sD0HSSJe2AHtVgKzt
         SK3om9Xwe7BOPIPaWhZGIYfvdLJHnVL7HKMmwhunv9z50QamRaCGrik9SSccBrDzTnxs
         714g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iPfY7+I+U87jKu1umZ2Dx/+dKwkQ7iiI6IZAa/Ykx5g=;
        b=eYh0QaJy8EN8h52AtD1f3uNs1hksmrqIieR0NOaKMfT4mj/EtUyKo5gc7OaAm9JwuS
         O56FAyy4alyAi7vgWqY69mRDmVhxcl/4LhD2Xv4uSjQVcEHHhxlg3KAdY5oltPQB1YCU
         iRZCPIzdza/Z5NMsalSdgV7s++vjJ82Ydt9PlMjjjWXLQvQfzPwjycKNgpxoZlx+szgT
         vFZHzinQ44K/88oL6A7SVjtsGv+d0rCnX4ueXkwY7Vm6/q0Ev783lQf3DZqyak8IUN2t
         UrNZLl7/lvZeb+FOxGmpgKrFa7iroI2So2jOhR6ExPMQremRZMpiPtKvn7F/coNlXkPa
         YaOA==
X-Gm-Message-State: APjAAAURL4VAyQ7draDuu0cveJ2Zu+E7FJGdpAMA+MgGJmbypVAlAPDG
        UJd7YXtkmolNiaIlOR3V/O96c11r
X-Google-Smtp-Source: APXvYqy3ti6fKjinmfxVVVC1NFvAWKDRCmy8auH9CrDoTdU85AEtBnR6TlmrRK9aTClm/B/uI11Z5w==
X-Received: by 2002:adf:db42:: with SMTP id f2mr4648487wrj.287.1571929834021;
        Thu, 24 Oct 2019 08:10:34 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id r15sm2729660wme.0.2019.10.24.08.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2019 08:10:32 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH] drm/tegra: Do not use ->load() and ->unload() callbacks
Date:   Thu, 24 Oct 2019 17:10:30 +0200
Message-Id: <20191024151030.3822283-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The ->load() and ->unload() drivers are midlayers and should be avoided
in modern drivers. Fix this by moving the code into the driver ->probe()
and ->remove() implementations, respectively.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/drm.c | 386 +++++++++++++++++-------------------
 1 file changed, 186 insertions(+), 200 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 3012f13bab97..bd7a00272965 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -82,202 +82,6 @@ tegra_drm_mode_config_helpers = {
 	.atomic_commit_tail = tegra_atomic_commit_tail,
 };
 
-static int tegra_drm_load(struct drm_device *drm, unsigned long flags)
-{
-	struct host1x_device *device = to_host1x_device(drm->dev);
-	struct iommu_domain *domain;
-	struct tegra_drm *tegra;
-	int err;
-
-	tegra = kzalloc(sizeof(*tegra), GFP_KERNEL);
-	if (!tegra)
-		return -ENOMEM;
-
-	/*
-	 * If the Tegra DRM clients are backed by an IOMMU, push buffers are
-	 * likely to be allocated beyond the 32-bit boundary if sufficient
-	 * system memory is available. This is problematic on earlier Tegra
-	 * generations where host1x supports a maximum of 32 address bits in
-	 * the GATHER opcode. In this case, unless host1x is behind an IOMMU
-	 * as well it won't be able to process buffers allocated beyond the
-	 * 32-bit boundary.
-	 *
-	 * The DMA API will use bounce buffers in this case, so that could
-	 * perhaps still be made to work, even if less efficient, but there
-	 * is another catch: in order to perform cache maintenance on pages
-	 * allocated for discontiguous buffers we need to map and unmap the
-	 * SG table representing these buffers. This is fine for something
-	 * small like a push buffer, but it exhausts the bounce buffer pool
-	 * (typically on the order of a few MiB) for framebuffers (many MiB
-	 * for any modern resolution).
-	 *
-	 * Work around this by making sure that Tegra DRM clients only use
-	 * an IOMMU if the parent host1x also uses an IOMMU.
-	 *
-	 * Note that there's still a small gap here that we don't cover: if
-	 * the DMA API is backed by an IOMMU there's no way to control which
-	 * device is attached to an IOMMU and which isn't, except via wiring
-	 * up the device tree appropriately. This is considered an problem
-	 * of integration, so care must be taken for the DT to be consistent.
-	 */
-	domain = iommu_get_domain_for_dev(drm->dev->parent);
-
-	if (domain && iommu_present(&platform_bus_type)) {
-		tegra->domain = iommu_domain_alloc(&platform_bus_type);
-		if (!tegra->domain) {
-			err = -ENOMEM;
-			goto free;
-		}
-
-		err = iova_cache_get();
-		if (err < 0)
-			goto domain;
-	}
-
-	mutex_init(&tegra->clients_lock);
-	INIT_LIST_HEAD(&tegra->clients);
-
-	drm->dev_private = tegra;
-	tegra->drm = drm;
-
-	drm_mode_config_init(drm);
-
-	drm->mode_config.min_width = 0;
-	drm->mode_config.min_height = 0;
-
-	drm->mode_config.max_width = 4096;
-	drm->mode_config.max_height = 4096;
-
-	drm->mode_config.allow_fb_modifiers = true;
-
-	drm->mode_config.normalize_zpos = true;
-
-	drm->mode_config.funcs = &tegra_drm_mode_config_funcs;
-	drm->mode_config.helper_private = &tegra_drm_mode_config_helpers;
-
-	err = tegra_drm_fb_prepare(drm);
-	if (err < 0)
-		goto config;
-
-	drm_kms_helper_poll_init(drm);
-
-	err = host1x_device_init(device);
-	if (err < 0)
-		goto fbdev;
-
-	if (tegra->group) {
-		u64 carveout_start, carveout_end, gem_start, gem_end;
-		u64 dma_mask = dma_get_mask(&device->dev);
-		dma_addr_t start, end;
-		unsigned long order;
-
-		start = tegra->domain->geometry.aperture_start & dma_mask;
-		end = tegra->domain->geometry.aperture_end & dma_mask;
-
-		gem_start = start;
-		gem_end = end - CARVEOUT_SZ;
-		carveout_start = gem_end + 1;
-		carveout_end = end;
-
-		order = __ffs(tegra->domain->pgsize_bitmap);
-		init_iova_domain(&tegra->carveout.domain, 1UL << order,
-				 carveout_start >> order);
-
-		tegra->carveout.shift = iova_shift(&tegra->carveout.domain);
-		tegra->carveout.limit = carveout_end >> tegra->carveout.shift;
-
-		drm_mm_init(&tegra->mm, gem_start, gem_end - gem_start + 1);
-		mutex_init(&tegra->mm_lock);
-
-		DRM_DEBUG_DRIVER("IOMMU apertures:\n");
-		DRM_DEBUG_DRIVER("  GEM: %#llx-%#llx\n", gem_start, gem_end);
-		DRM_DEBUG_DRIVER("  Carveout: %#llx-%#llx\n", carveout_start,
-				 carveout_end);
-	} else if (tegra->domain) {
-		iommu_domain_free(tegra->domain);
-		tegra->domain = NULL;
-		iova_cache_put();
-	}
-
-	if (tegra->hub) {
-		err = tegra_display_hub_prepare(tegra->hub);
-		if (err < 0)
-			goto device;
-	}
-
-	/*
-	 * We don't use the drm_irq_install() helpers provided by the DRM
-	 * core, so we need to set this manually in order to allow the
-	 * DRM_IOCTL_WAIT_VBLANK to operate correctly.
-	 */
-	drm->irq_enabled = true;
-
-	/* syncpoints are used for full 32-bit hardware VBLANK counters */
-	drm->max_vblank_count = 0xffffffff;
-
-	err = drm_vblank_init(drm, drm->mode_config.num_crtc);
-	if (err < 0)
-		goto hub;
-
-	drm_mode_config_reset(drm);
-
-	err = tegra_drm_fb_init(drm);
-	if (err < 0)
-		goto hub;
-
-	return 0;
-
-hub:
-	if (tegra->hub)
-		tegra_display_hub_cleanup(tegra->hub);
-device:
-	if (tegra->domain) {
-		mutex_destroy(&tegra->mm_lock);
-		drm_mm_takedown(&tegra->mm);
-		put_iova_domain(&tegra->carveout.domain);
-		iova_cache_put();
-	}
-
-	host1x_device_exit(device);
-fbdev:
-	drm_kms_helper_poll_fini(drm);
-	tegra_drm_fb_free(drm);
-config:
-	drm_mode_config_cleanup(drm);
-domain:
-	if (tegra->domain)
-		iommu_domain_free(tegra->domain);
-free:
-	kfree(tegra);
-	return err;
-}
-
-static void tegra_drm_unload(struct drm_device *drm)
-{
-	struct host1x_device *device = to_host1x_device(drm->dev);
-	struct tegra_drm *tegra = drm->dev_private;
-	int err;
-
-	drm_kms_helper_poll_fini(drm);
-	tegra_drm_fb_exit(drm);
-	drm_atomic_helper_shutdown(drm);
-	drm_mode_config_cleanup(drm);
-
-	err = host1x_device_exit(device);
-	if (err < 0)
-		return;
-
-	if (tegra->domain) {
-		mutex_destroy(&tegra->mm_lock);
-		drm_mm_takedown(&tegra->mm);
-		put_iova_domain(&tegra->carveout.domain);
-		iova_cache_put();
-		iommu_domain_free(tegra->domain);
-	}
-
-	kfree(tegra);
-}
-
 static int tegra_drm_open(struct drm_device *drm, struct drm_file *filp)
 {
 	struct tegra_drm_file *fpriv;
@@ -1046,8 +850,6 @@ static int tegra_debugfs_init(struct drm_minor *minor)
 static struct drm_driver tegra_drm_driver = {
 	.driver_features = DRIVER_MODESET | DRIVER_GEM |
 			   DRIVER_ATOMIC | DRIVER_RENDER,
-	.load = tegra_drm_load,
-	.unload = tegra_drm_unload,
 	.open = tegra_drm_open,
 	.postclose = tegra_drm_postclose,
 	.lastclose = drm_fb_helper_lastclose,
@@ -1231,6 +1033,8 @@ void tegra_drm_free(struct tegra_drm *tegra, size_t size, void *virt,
 static int host1x_drm_probe(struct host1x_device *dev)
 {
 	struct drm_driver *driver = &tegra_drm_driver;
+	struct iommu_domain *domain;
+	struct tegra_drm *tegra;
 	struct drm_device *drm;
 	int err;
 
@@ -1238,18 +1042,179 @@ static int host1x_drm_probe(struct host1x_device *dev)
 	if (IS_ERR(drm))
 		return PTR_ERR(drm);
 
+	tegra = kzalloc(sizeof(*tegra), GFP_KERNEL);
+	if (!tegra) {
+		err = -ENOMEM;
+		goto put;
+	}
+
+	/*
+	 * If the Tegra DRM clients are backed by an IOMMU, push buffers are
+	 * likely to be allocated beyond the 32-bit boundary if sufficient
+	 * system memory is available. This is problematic on earlier Tegra
+	 * generations where host1x supports a maximum of 32 address bits in
+	 * the GATHER opcode. In this case, unless host1x is behind an IOMMU
+	 * as well it won't be able to process buffers allocated beyond the
+	 * 32-bit boundary.
+	 *
+	 * The DMA API will use bounce buffers in this case, so that could
+	 * perhaps still be made to work, even if less efficient, but there
+	 * is another catch: in order to perform cache maintenance on pages
+	 * allocated for discontiguous buffers we need to map and unmap the
+	 * SG table representing these buffers. This is fine for something
+	 * small like a push buffer, but it exhausts the bounce buffer pool
+	 * (typically on the order of a few MiB) for framebuffers (many MiB
+	 * for any modern resolution).
+	 *
+	 * Work around this by making sure that Tegra DRM clients only use
+	 * an IOMMU if the parent host1x also uses an IOMMU.
+	 *
+	 * Note that there's still a small gap here that we don't cover: if
+	 * the DMA API is backed by an IOMMU there's no way to control which
+	 * device is attached to an IOMMU and which isn't, except via wiring
+	 * up the device tree appropriately. This is considered an problem
+	 * of integration, so care must be taken for the DT to be consistent.
+	 */
+	domain = iommu_get_domain_for_dev(drm->dev->parent);
+
+	if (domain && iommu_present(&platform_bus_type)) {
+		tegra->domain = iommu_domain_alloc(&platform_bus_type);
+		if (!tegra->domain) {
+			err = -ENOMEM;
+			goto free;
+		}
+
+		err = iova_cache_get();
+		if (err < 0)
+			goto domain;
+	}
+
+	mutex_init(&tegra->clients_lock);
+	INIT_LIST_HEAD(&tegra->clients);
+
 	dev_set_drvdata(&dev->dev, drm);
+	drm->dev_private = tegra;
+	tegra->drm = drm;
+
+	drm_mode_config_init(drm);
+
+	drm->mode_config.min_width = 0;
+	drm->mode_config.min_height = 0;
+
+	drm->mode_config.max_width = 4096;
+	drm->mode_config.max_height = 4096;
+
+	drm->mode_config.allow_fb_modifiers = true;
+
+	drm->mode_config.normalize_zpos = true;
+
+	drm->mode_config.funcs = &tegra_drm_mode_config_funcs;
+	drm->mode_config.helper_private = &tegra_drm_mode_config_helpers;
+
+	err = tegra_drm_fb_prepare(drm);
+	if (err < 0)
+		goto config;
+
+	drm_kms_helper_poll_init(drm);
+
+	err = host1x_device_init(dev);
+	if (err < 0)
+		goto fbdev;
+
+	if (tegra->group) {
+		u64 carveout_start, carveout_end, gem_start, gem_end;
+		u64 dma_mask = dma_get_mask(&dev->dev);
+		dma_addr_t start, end;
+		unsigned long order;
+
+		start = tegra->domain->geometry.aperture_start & dma_mask;
+		end = tegra->domain->geometry.aperture_end & dma_mask;
+
+		gem_start = start;
+		gem_end = end - CARVEOUT_SZ;
+		carveout_start = gem_end + 1;
+		carveout_end = end;
+
+		order = __ffs(tegra->domain->pgsize_bitmap);
+		init_iova_domain(&tegra->carveout.domain, 1UL << order,
+				 carveout_start >> order);
+
+		tegra->carveout.shift = iova_shift(&tegra->carveout.domain);
+		tegra->carveout.limit = carveout_end >> tegra->carveout.shift;
+
+		drm_mm_init(&tegra->mm, gem_start, gem_end - gem_start + 1);
+		mutex_init(&tegra->mm_lock);
+
+		DRM_DEBUG_DRIVER("IOMMU apertures:\n");
+		DRM_DEBUG_DRIVER("  GEM: %#llx-%#llx\n", gem_start, gem_end);
+		DRM_DEBUG_DRIVER("  Carveout: %#llx-%#llx\n", carveout_start,
+				 carveout_end);
+	} else if (tegra->domain) {
+		iommu_domain_free(tegra->domain);
+		tegra->domain = NULL;
+		iova_cache_put();
+	}
+
+	if (tegra->hub) {
+		err = tegra_display_hub_prepare(tegra->hub);
+		if (err < 0)
+			goto device;
+	}
+
+	/*
+	 * We don't use the drm_irq_install() helpers provided by the DRM
+	 * core, so we need to set this manually in order to allow the
+	 * DRM_IOCTL_WAIT_VBLANK to operate correctly.
+	 */
+	drm->irq_enabled = true;
+
+	/* syncpoints are used for full 32-bit hardware VBLANK counters */
+	drm->max_vblank_count = 0xffffffff;
+
+	err = drm_vblank_init(drm, drm->mode_config.num_crtc);
+	if (err < 0)
+		goto hub;
+
+	drm_mode_config_reset(drm);
+
+	err = tegra_drm_fb_init(drm);
+	if (err < 0)
+		goto hub;
 
 	err = drm_fb_helper_remove_conflicting_framebuffers(NULL, "tegradrmfb", false);
 	if (err < 0)
-		goto put;
+		goto fb;
 
 	err = drm_dev_register(drm, 0);
 	if (err < 0)
-		goto put;
+		goto fb;
 
 	return 0;
 
+fb:
+	tegra_drm_fb_exit(drm);
+hub:
+	if (tegra->hub)
+		tegra_display_hub_cleanup(tegra->hub);
+device:
+	if (tegra->domain) {
+		mutex_destroy(&tegra->mm_lock);
+		drm_mm_takedown(&tegra->mm);
+		put_iova_domain(&tegra->carveout.domain);
+		iova_cache_put();
+	}
+
+	host1x_device_exit(dev);
+fbdev:
+	drm_kms_helper_poll_fini(drm);
+	tegra_drm_fb_free(drm);
+config:
+	drm_mode_config_cleanup(drm);
+domain:
+	if (tegra->domain)
+		iommu_domain_free(tegra->domain);
+free:
+	kfree(tegra);
 put:
 	drm_dev_put(drm);
 	return err;
@@ -1258,8 +1223,29 @@ static int host1x_drm_probe(struct host1x_device *dev)
 static int host1x_drm_remove(struct host1x_device *dev)
 {
 	struct drm_device *drm = dev_get_drvdata(&dev->dev);
+	struct tegra_drm *tegra = drm->dev_private;
+	int err;
 
 	drm_dev_unregister(drm);
+
+	drm_kms_helper_poll_fini(drm);
+	tegra_drm_fb_exit(drm);
+	drm_atomic_helper_shutdown(drm);
+	drm_mode_config_cleanup(drm);
+
+	err = host1x_device_exit(dev);
+	if (err < 0)
+		dev_err(&dev->dev, "host1x device cleanup failed: %d\n", err);
+
+	if (tegra->domain) {
+		mutex_destroy(&tegra->mm_lock);
+		drm_mm_takedown(&tegra->mm);
+		put_iova_domain(&tegra->carveout.domain);
+		iova_cache_put();
+		iommu_domain_free(tegra->domain);
+	}
+
+	kfree(tegra);
 	drm_dev_put(drm);
 
 	return 0;
-- 
2.23.0


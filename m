Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F08AE376E
	for <lists+linux-tegra@lfdr.de>; Thu, 24 Oct 2019 18:08:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407703AbfJXQIJ (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 24 Oct 2019 12:08:09 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:37700 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405863AbfJXQII (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Oct 2019 12:08:08 -0400
Received: by mail-wm1-f67.google.com with SMTP id q130so2987383wme.2
        for <linux-tegra@vger.kernel.org>; Thu, 24 Oct 2019 09:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=dWZHHou50r87TUYIvGIWH48SC/gZICg6KRy6one8984=;
        b=TxZUhGoCFvTAiAyZbnuWYHxfGFGWDddXp0gOR+Y1ofg8aOgzfssxnIO9Tq9MGVF+9/
         WJY+ULcrR3R9+ucjiQyZBTpo/QoaBl5l6qvJ2sCk2C4WzTXwOHA8ehTF+2uAeQOgZflx
         8xWR2R91NY1ari8E6sczUpzmk37fUvr0lQ1qQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=dWZHHou50r87TUYIvGIWH48SC/gZICg6KRy6one8984=;
        b=SuC/XPiDn8FAcdWK+2QOi8MVd7xLgqeCxCuuj4+URAgdl88iB00OjUUPlVS7Bs1U7x
         z4b/Pe9c0taF/NKdVUR3vWSy1cPegw+ie/0FqDp+KY3EaLa/MVMCuIYUarVMl2rKACny
         zof1+z2hlDZU6m4fVAteeczCnSmcXDtIb5gPiW2b9e+LW1s8o7ZBQWVl0v+c1wDUfdn/
         is6tRhxf6QMaReEVp21OMCV29+NJkXNvET5+DuxCR8pqmpHezJ+E4G0cqJCAuZaw4wNS
         ijjyqj8hz34v+2TCFBNjoxnvXaF/KJXiEV6VcRdkCxHpacKvUHLQtgP8cLn/oqz2y3rp
         TFPA==
X-Gm-Message-State: APjAAAWpE5YQYQbQUj1fyY2pUMLIlnD1ElSqtOfT5xIE6q+mxNkS/HOL
        h6sIMS8HO8Bh+X78idSDWfmRCEybDog=
X-Google-Smtp-Source: APXvYqxiwpFlWPHQdW40JuN//gKcs2iR4jOtz1ksNgmnIjsXvGZfZMy2bz60Q3hTKjmV0g2W69/nbA==
X-Received: by 2002:a1c:544e:: with SMTP id p14mr5464470wmi.17.1571933284116;
        Thu, 24 Oct 2019 09:08:04 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net. [212.51.149.96])
        by smtp.gmail.com with ESMTPSA id b196sm4299624wmd.24.2019.10.24.09.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2019 09:07:56 -0700 (PDT)
Date:   Thu, 24 Oct 2019 18:07:54 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH] drm/tegra: Do not use ->load() and ->unload() callbacks
Message-ID: <20191024160754.GK11828@phenom.ffwll.local>
References: <20191024151030.3822283-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191024151030.3822283-1-thierry.reding@gmail.com>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Oct 24, 2019 at 05:10:30PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The ->load() and ->unload() drivers are midlayers and should be avoided
> in modern drivers. Fix this by moving the code into the driver ->probe()
> and ->remove() implementations, respectively.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/drm.c | 386 +++++++++++++++++-------------------
>  1 file changed, 186 insertions(+), 200 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
> index 3012f13bab97..bd7a00272965 100644
> --- a/drivers/gpu/drm/tegra/drm.c
> +++ b/drivers/gpu/drm/tegra/drm.c
> @@ -82,202 +82,6 @@ tegra_drm_mode_config_helpers = {
>  	.atomic_commit_tail = tegra_atomic_commit_tail,
>  };
>  
> -static int tegra_drm_load(struct drm_device *drm, unsigned long flags)
> -{
> -	struct host1x_device *device = to_host1x_device(drm->dev);
> -	struct iommu_domain *domain;
> -	struct tegra_drm *tegra;
> -	int err;
> -
> -	tegra = kzalloc(sizeof(*tegra), GFP_KERNEL);
> -	if (!tegra)
> -		return -ENOMEM;
> -
> -	/*
> -	 * If the Tegra DRM clients are backed by an IOMMU, push buffers are
> -	 * likely to be allocated beyond the 32-bit boundary if sufficient
> -	 * system memory is available. This is problematic on earlier Tegra
> -	 * generations where host1x supports a maximum of 32 address bits in
> -	 * the GATHER opcode. In this case, unless host1x is behind an IOMMU
> -	 * as well it won't be able to process buffers allocated beyond the
> -	 * 32-bit boundary.
> -	 *
> -	 * The DMA API will use bounce buffers in this case, so that could
> -	 * perhaps still be made to work, even if less efficient, but there
> -	 * is another catch: in order to perform cache maintenance on pages
> -	 * allocated for discontiguous buffers we need to map and unmap the
> -	 * SG table representing these buffers. This is fine for something
> -	 * small like a push buffer, but it exhausts the bounce buffer pool
> -	 * (typically on the order of a few MiB) for framebuffers (many MiB
> -	 * for any modern resolution).
> -	 *
> -	 * Work around this by making sure that Tegra DRM clients only use
> -	 * an IOMMU if the parent host1x also uses an IOMMU.
> -	 *
> -	 * Note that there's still a small gap here that we don't cover: if
> -	 * the DMA API is backed by an IOMMU there's no way to control which
> -	 * device is attached to an IOMMU and which isn't, except via wiring
> -	 * up the device tree appropriately. This is considered an problem
> -	 * of integration, so care must be taken for the DT to be consistent.
> -	 */
> -	domain = iommu_get_domain_for_dev(drm->dev->parent);
> -
> -	if (domain && iommu_present(&platform_bus_type)) {
> -		tegra->domain = iommu_domain_alloc(&platform_bus_type);
> -		if (!tegra->domain) {
> -			err = -ENOMEM;
> -			goto free;
> -		}
> -
> -		err = iova_cache_get();
> -		if (err < 0)
> -			goto domain;
> -	}
> -
> -	mutex_init(&tegra->clients_lock);
> -	INIT_LIST_HEAD(&tegra->clients);
> -
> -	drm->dev_private = tegra;
> -	tegra->drm = drm;
> -
> -	drm_mode_config_init(drm);
> -
> -	drm->mode_config.min_width = 0;
> -	drm->mode_config.min_height = 0;
> -
> -	drm->mode_config.max_width = 4096;
> -	drm->mode_config.max_height = 4096;
> -
> -	drm->mode_config.allow_fb_modifiers = true;
> -
> -	drm->mode_config.normalize_zpos = true;
> -
> -	drm->mode_config.funcs = &tegra_drm_mode_config_funcs;
> -	drm->mode_config.helper_private = &tegra_drm_mode_config_helpers;
> -
> -	err = tegra_drm_fb_prepare(drm);
> -	if (err < 0)
> -		goto config;
> -
> -	drm_kms_helper_poll_init(drm);
> -
> -	err = host1x_device_init(device);
> -	if (err < 0)
> -		goto fbdev;
> -
> -	if (tegra->group) {
> -		u64 carveout_start, carveout_end, gem_start, gem_end;
> -		u64 dma_mask = dma_get_mask(&device->dev);
> -		dma_addr_t start, end;
> -		unsigned long order;
> -
> -		start = tegra->domain->geometry.aperture_start & dma_mask;
> -		end = tegra->domain->geometry.aperture_end & dma_mask;
> -
> -		gem_start = start;
> -		gem_end = end - CARVEOUT_SZ;
> -		carveout_start = gem_end + 1;
> -		carveout_end = end;
> -
> -		order = __ffs(tegra->domain->pgsize_bitmap);
> -		init_iova_domain(&tegra->carveout.domain, 1UL << order,
> -				 carveout_start >> order);
> -
> -		tegra->carveout.shift = iova_shift(&tegra->carveout.domain);
> -		tegra->carveout.limit = carveout_end >> tegra->carveout.shift;
> -
> -		drm_mm_init(&tegra->mm, gem_start, gem_end - gem_start + 1);
> -		mutex_init(&tegra->mm_lock);
> -
> -		DRM_DEBUG_DRIVER("IOMMU apertures:\n");
> -		DRM_DEBUG_DRIVER("  GEM: %#llx-%#llx\n", gem_start, gem_end);
> -		DRM_DEBUG_DRIVER("  Carveout: %#llx-%#llx\n", carveout_start,
> -				 carveout_end);
> -	} else if (tegra->domain) {
> -		iommu_domain_free(tegra->domain);
> -		tegra->domain = NULL;
> -		iova_cache_put();
> -	}
> -
> -	if (tegra->hub) {
> -		err = tegra_display_hub_prepare(tegra->hub);
> -		if (err < 0)
> -			goto device;
> -	}
> -
> -	/*
> -	 * We don't use the drm_irq_install() helpers provided by the DRM
> -	 * core, so we need to set this manually in order to allow the
> -	 * DRM_IOCTL_WAIT_VBLANK to operate correctly.
> -	 */
> -	drm->irq_enabled = true;
> -
> -	/* syncpoints are used for full 32-bit hardware VBLANK counters */
> -	drm->max_vblank_count = 0xffffffff;
> -
> -	err = drm_vblank_init(drm, drm->mode_config.num_crtc);
> -	if (err < 0)
> -		goto hub;
> -
> -	drm_mode_config_reset(drm);
> -
> -	err = tegra_drm_fb_init(drm);
> -	if (err < 0)
> -		goto hub;
> -
> -	return 0;
> -
> -hub:
> -	if (tegra->hub)
> -		tegra_display_hub_cleanup(tegra->hub);
> -device:
> -	if (tegra->domain) {
> -		mutex_destroy(&tegra->mm_lock);
> -		drm_mm_takedown(&tegra->mm);
> -		put_iova_domain(&tegra->carveout.domain);
> -		iova_cache_put();
> -	}
> -
> -	host1x_device_exit(device);
> -fbdev:
> -	drm_kms_helper_poll_fini(drm);
> -	tegra_drm_fb_free(drm);
> -config:
> -	drm_mode_config_cleanup(drm);
> -domain:
> -	if (tegra->domain)
> -		iommu_domain_free(tegra->domain);
> -free:
> -	kfree(tegra);
> -	return err;
> -}
> -
> -static void tegra_drm_unload(struct drm_device *drm)
> -{
> -	struct host1x_device *device = to_host1x_device(drm->dev);
> -	struct tegra_drm *tegra = drm->dev_private;
> -	int err;
> -
> -	drm_kms_helper_poll_fini(drm);
> -	tegra_drm_fb_exit(drm);
> -	drm_atomic_helper_shutdown(drm);
> -	drm_mode_config_cleanup(drm);
> -
> -	err = host1x_device_exit(device);
> -	if (err < 0)
> -		return;
> -
> -	if (tegra->domain) {
> -		mutex_destroy(&tegra->mm_lock);
> -		drm_mm_takedown(&tegra->mm);
> -		put_iova_domain(&tegra->carveout.domain);
> -		iova_cache_put();
> -		iommu_domain_free(tegra->domain);
> -	}
> -
> -	kfree(tegra);
> -}
> -
>  static int tegra_drm_open(struct drm_device *drm, struct drm_file *filp)
>  {
>  	struct tegra_drm_file *fpriv;
> @@ -1046,8 +850,6 @@ static int tegra_debugfs_init(struct drm_minor *minor)
>  static struct drm_driver tegra_drm_driver = {
>  	.driver_features = DRIVER_MODESET | DRIVER_GEM |
>  			   DRIVER_ATOMIC | DRIVER_RENDER,
> -	.load = tegra_drm_load,
> -	.unload = tegra_drm_unload,
>  	.open = tegra_drm_open,
>  	.postclose = tegra_drm_postclose,
>  	.lastclose = drm_fb_helper_lastclose,
> @@ -1231,6 +1033,8 @@ void tegra_drm_free(struct tegra_drm *tegra, size_t size, void *virt,
>  static int host1x_drm_probe(struct host1x_device *dev)
>  {
>  	struct drm_driver *driver = &tegra_drm_driver;
> +	struct iommu_domain *domain;
> +	struct tegra_drm *tegra;
>  	struct drm_device *drm;
>  	int err;
>  
> @@ -1238,18 +1042,179 @@ static int host1x_drm_probe(struct host1x_device *dev)
>  	if (IS_ERR(drm))
>  		return PTR_ERR(drm);
>  
> +	tegra = kzalloc(sizeof(*tegra), GFP_KERNEL);
> +	if (!tegra) {
> +		err = -ENOMEM;
> +		goto put;
> +	}
> +
> +	/*
> +	 * If the Tegra DRM clients are backed by an IOMMU, push buffers are
> +	 * likely to be allocated beyond the 32-bit boundary if sufficient
> +	 * system memory is available. This is problematic on earlier Tegra
> +	 * generations where host1x supports a maximum of 32 address bits in
> +	 * the GATHER opcode. In this case, unless host1x is behind an IOMMU
> +	 * as well it won't be able to process buffers allocated beyond the
> +	 * 32-bit boundary.
> +	 *
> +	 * The DMA API will use bounce buffers in this case, so that could
> +	 * perhaps still be made to work, even if less efficient, but there
> +	 * is another catch: in order to perform cache maintenance on pages
> +	 * allocated for discontiguous buffers we need to map and unmap the
> +	 * SG table representing these buffers. This is fine for something
> +	 * small like a push buffer, but it exhausts the bounce buffer pool
> +	 * (typically on the order of a few MiB) for framebuffers (many MiB
> +	 * for any modern resolution).
> +	 *
> +	 * Work around this by making sure that Tegra DRM clients only use
> +	 * an IOMMU if the parent host1x also uses an IOMMU.
> +	 *
> +	 * Note that there's still a small gap here that we don't cover: if
> +	 * the DMA API is backed by an IOMMU there's no way to control which
> +	 * device is attached to an IOMMU and which isn't, except via wiring
> +	 * up the device tree appropriately. This is considered an problem
> +	 * of integration, so care must be taken for the DT to be consistent.
> +	 */
> +	domain = iommu_get_domain_for_dev(drm->dev->parent);
> +
> +	if (domain && iommu_present(&platform_bus_type)) {
> +		tegra->domain = iommu_domain_alloc(&platform_bus_type);
> +		if (!tegra->domain) {
> +			err = -ENOMEM;
> +			goto free;
> +		}
> +
> +		err = iova_cache_get();
> +		if (err < 0)
> +			goto domain;
> +	}
> +
> +	mutex_init(&tegra->clients_lock);
> +	INIT_LIST_HEAD(&tegra->clients);
> +
>  	dev_set_drvdata(&dev->dev, drm);
> +	drm->dev_private = tegra;
> +	tegra->drm = drm;
> +
> +	drm_mode_config_init(drm);
> +
> +	drm->mode_config.min_width = 0;
> +	drm->mode_config.min_height = 0;
> +
> +	drm->mode_config.max_width = 4096;
> +	drm->mode_config.max_height = 4096;
> +
> +	drm->mode_config.allow_fb_modifiers = true;
> +
> +	drm->mode_config.normalize_zpos = true;
> +
> +	drm->mode_config.funcs = &tegra_drm_mode_config_funcs;
> +	drm->mode_config.helper_private = &tegra_drm_mode_config_helpers;
> +
> +	err = tegra_drm_fb_prepare(drm);
> +	if (err < 0)
> +		goto config;
> +
> +	drm_kms_helper_poll_init(drm);
> +
> +	err = host1x_device_init(dev);
> +	if (err < 0)
> +		goto fbdev;
> +
> +	if (tegra->group) {
> +		u64 carveout_start, carveout_end, gem_start, gem_end;
> +		u64 dma_mask = dma_get_mask(&dev->dev);
> +		dma_addr_t start, end;
> +		unsigned long order;
> +
> +		start = tegra->domain->geometry.aperture_start & dma_mask;
> +		end = tegra->domain->geometry.aperture_end & dma_mask;
> +
> +		gem_start = start;
> +		gem_end = end - CARVEOUT_SZ;
> +		carveout_start = gem_end + 1;
> +		carveout_end = end;
> +
> +		order = __ffs(tegra->domain->pgsize_bitmap);
> +		init_iova_domain(&tegra->carveout.domain, 1UL << order,
> +				 carveout_start >> order);
> +
> +		tegra->carveout.shift = iova_shift(&tegra->carveout.domain);
> +		tegra->carveout.limit = carveout_end >> tegra->carveout.shift;
> +
> +		drm_mm_init(&tegra->mm, gem_start, gem_end - gem_start + 1);
> +		mutex_init(&tegra->mm_lock);
> +
> +		DRM_DEBUG_DRIVER("IOMMU apertures:\n");
> +		DRM_DEBUG_DRIVER("  GEM: %#llx-%#llx\n", gem_start, gem_end);
> +		DRM_DEBUG_DRIVER("  Carveout: %#llx-%#llx\n", carveout_start,
> +				 carveout_end);
> +	} else if (tegra->domain) {
> +		iommu_domain_free(tegra->domain);
> +		tegra->domain = NULL;
> +		iova_cache_put();
> +	}
> +
> +	if (tegra->hub) {
> +		err = tegra_display_hub_prepare(tegra->hub);
> +		if (err < 0)
> +			goto device;
> +	}
> +
> +	/*
> +	 * We don't use the drm_irq_install() helpers provided by the DRM
> +	 * core, so we need to set this manually in order to allow the
> +	 * DRM_IOCTL_WAIT_VBLANK to operate correctly.
> +	 */
> +	drm->irq_enabled = true;
> +
> +	/* syncpoints are used for full 32-bit hardware VBLANK counters */
> +	drm->max_vblank_count = 0xffffffff;
> +
> +	err = drm_vblank_init(drm, drm->mode_config.num_crtc);
> +	if (err < 0)
> +		goto hub;
> +
> +	drm_mode_config_reset(drm);
> +
> +	err = tegra_drm_fb_init(drm);
> +	if (err < 0)
> +		goto hub;
>  
>  	err = drm_fb_helper_remove_conflicting_framebuffers(NULL, "tegradrmfb", false);

I think you want to do this before you set up the drmfb. Well probably you
want to do this as the one of the very first things in your probe code,
before you start touching any of the hw. At least that's what the old
order did.

>  	if (err < 0)
> -		goto put;
> +		goto fb;
>  
>  	err = drm_dev_register(drm, 0);
>  	if (err < 0)
> -		goto put;
> +		goto fb;
>  
>  	return 0;
>  
> +fb:
> +	tegra_drm_fb_exit(drm);
> +hub:
> +	if (tegra->hub)
> +		tegra_display_hub_cleanup(tegra->hub);
> +device:
> +	if (tegra->domain) {
> +		mutex_destroy(&tegra->mm_lock);
> +		drm_mm_takedown(&tegra->mm);
> +		put_iova_domain(&tegra->carveout.domain);
> +		iova_cache_put();
> +	}
> +
> +	host1x_device_exit(dev);
> +fbdev:
> +	drm_kms_helper_poll_fini(drm);
> +	tegra_drm_fb_free(drm);
> +config:
> +	drm_mode_config_cleanup(drm);
> +domain:
> +	if (tegra->domain)
> +		iommu_domain_free(tegra->domain);
> +free:
> +	kfree(tegra);
>  put:
>  	drm_dev_put(drm);
>  	return err;
> @@ -1258,8 +1223,29 @@ static int host1x_drm_probe(struct host1x_device *dev)
>  static int host1x_drm_remove(struct host1x_device *dev)
>  {
>  	struct drm_device *drm = dev_get_drvdata(&dev->dev);
> +	struct tegra_drm *tegra = drm->dev_private;
> +	int err;
>  
>  	drm_dev_unregister(drm);
> +
> +	drm_kms_helper_poll_fini(drm);
> +	tegra_drm_fb_exit(drm);
> +	drm_atomic_helper_shutdown(drm);
> +	drm_mode_config_cleanup(drm);
> +
> +	err = host1x_device_exit(dev);
> +	if (err < 0)
> +		dev_err(&dev->dev, "host1x device cleanup failed: %d\n", err);
> +
> +	if (tegra->domain) {
> +		mutex_destroy(&tegra->mm_lock);
> +		drm_mm_takedown(&tegra->mm);
> +		put_iova_domain(&tegra->carveout.domain);
> +		iova_cache_put();
> +		iommu_domain_free(tegra->domain);
> +	}
> +
> +	kfree(tegra);
>  	drm_dev_put(drm);
>  
>  	return 0;

Aside from the one question:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> -- 
> 2.23.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

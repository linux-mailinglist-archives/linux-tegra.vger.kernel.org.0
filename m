Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52EB3EDC78
	for <lists+linux-tegra@lfdr.de>; Mon,  4 Nov 2019 11:26:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727607AbfKDK0n (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 4 Nov 2019 05:26:43 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:36768 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727499AbfKDK0n (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 4 Nov 2019 05:26:43 -0500
Received: by mail-wr1-f66.google.com with SMTP id w18so16397575wrt.3
        for <linux-tegra@vger.kernel.org>; Mon, 04 Nov 2019 02:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3Yxi0NUazNzewb6jVgqPN9WIbnHfthYeGVpESvAZV2E=;
        b=W/wiFjTcYbwXNr5qVm8iWxT7/cPQo73BUem2fwTxb0OLdSTpFxBPCDZaEkCakhqqg0
         RqIybEKCFZk+YctjAX8/yED/Xg3nsi2wqqP/nXFgfiSLpDoncIYMJfN2qUVqg1LnFAvn
         wAPQppbSvX5plPEWTM/wvKbBkJh+7PLmbWdLo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=3Yxi0NUazNzewb6jVgqPN9WIbnHfthYeGVpESvAZV2E=;
        b=jKMd521nQMy5WB2qtiY1HuQXCIROxvC20wbV+I+UFvtKQ0GTZ7vzF85Y+FVMCcuK6o
         gVbsqU0oaCmGIVmBBy7TswHkXS+tA15QsQxgSybzLTz4p8mMBO5ZkU/gBobpmJEIIa69
         37cHRTsXs9WqIysaWLKnvYPPANDsuT/JomG4I4+jPUx+q4i4rpMzhVG/v2EGwhLUgqCb
         T0aMlqnIrLDEXMPZTY8H2/Vo5OGdBxt2wTH8QaXBsmtK43rWsDjksX23jBCG2oU4PT3O
         HsJQqcqXs4EId/XS+6Wu1Qy2baSAbViv7iKDv8o1P/aXmcz5UMJxBJd0SIofrIsrw1LA
         DFJg==
X-Gm-Message-State: APjAAAVrdyZpQNn3vxCypfNlRQs/Hqa+UzCyOYvMJCyk0PgC9os2568W
        ofpr3jIoqf8HCMaYu/Pk4O/LPg==
X-Google-Smtp-Source: APXvYqyAZOk8KkqycRLav1bjoEEY84Y+h1Vrv4qouw109cZWP8hQ6AxP40cY4pe4jRE3KbNfoYWBYg==
X-Received: by 2002:adf:9323:: with SMTP id 32mr22270634wro.15.1572863199034;
        Mon, 04 Nov 2019 02:26:39 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net. [212.51.149.96])
        by smtp.gmail.com with ESMTPSA id n22sm13959448wmk.19.2019.11.04.02.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 02:26:38 -0800 (PST)
Date:   Mon, 4 Nov 2019 11:26:36 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Dmitry Osipenko <digetx@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3] drm/tegra: Do not use ->load() and ->unload()
 callbacks
Message-ID: <20191104102636.GF10326@phenom.ffwll.local>
References: <20191028121610.3889207-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191028121610.3889207-1-thierry.reding@gmail.com>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Oct 28, 2019 at 01:16:10PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The ->load() and ->unload() drivers are midlayers and should be avoided
> in modern drivers. Fix this by moving the code into the driver ->probe()
> and ->remove() implementations, respectively.
> 
> v2: kick out conflicting framebuffers before initializing fbdev
> v3: rebase onto drm/tegra/for-next
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>

My for v2 seems to have been lost, so:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/tegra/drm.c | 321 +++++++++++++++++-------------------
>  1 file changed, 154 insertions(+), 167 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
> index b74362cb63eb..7480f575188d 100644
> --- a/drivers/gpu/drm/tegra/drm.c
> +++ b/drivers/gpu/drm/tegra/drm.c
> @@ -86,168 +86,6 @@ tegra_drm_mode_config_helpers = {
>  	.atomic_commit_tail = tegra_atomic_commit_tail,
>  };
>  
> -static int tegra_drm_load(struct drm_device *drm, unsigned long flags)
> -{
> -	struct host1x_device *device = to_host1x_device(drm->dev);
> -	struct tegra_drm *tegra;
> -	int err;
> -
> -	tegra = kzalloc(sizeof(*tegra), GFP_KERNEL);
> -	if (!tegra)
> -		return -ENOMEM;
> -
> -	if (iommu_present(&platform_bus_type)) {
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
> -	if (tegra->domain) {
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
> @@ -1014,8 +852,6 @@ static int tegra_debugfs_init(struct drm_minor *minor)
>  static struct drm_driver tegra_drm_driver = {
>  	.driver_features = DRIVER_MODESET | DRIVER_GEM |
>  			   DRIVER_ATOMIC | DRIVER_RENDER,
> -	.load = tegra_drm_load,
> -	.unload = tegra_drm_unload,
>  	.open = tegra_drm_open,
>  	.postclose = tegra_drm_postclose,
>  	.lastclose = drm_fb_helper_lastclose,
> @@ -1202,6 +1038,7 @@ void tegra_drm_free(struct tegra_drm *tegra, size_t size, void *virt,
>  static int host1x_drm_probe(struct host1x_device *dev)
>  {
>  	struct drm_driver *driver = &tegra_drm_driver;
> +	struct tegra_drm *tegra;
>  	struct drm_device *drm;
>  	int err;
>  
> @@ -1209,18 +1046,147 @@ static int host1x_drm_probe(struct host1x_device *dev)
>  	if (IS_ERR(drm))
>  		return PTR_ERR(drm);
>  
> +	tegra = kzalloc(sizeof(*tegra), GFP_KERNEL);
> +	if (!tegra) {
> +		err = -ENOMEM;
> +		goto put;
> +	}
> +
> +	if (iommu_present(&platform_bus_type)) {
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
>  
> -	err = drm_fb_helper_remove_conflicting_framebuffers(NULL, "tegradrmfb", false);
> +	drm->mode_config.funcs = &tegra_drm_mode_config_funcs;
> +	drm->mode_config.helper_private = &tegra_drm_mode_config_helpers;
> +
> +	err = tegra_drm_fb_prepare(drm);
>  	if (err < 0)
> -		goto put;
> +		goto config;
> +
> +	drm_kms_helper_poll_init(drm);
> +
> +	err = host1x_device_init(dev);
> +	if (err < 0)
> +		goto fbdev;
> +
> +	if (tegra->domain) {
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
> +	err = drm_fb_helper_remove_conflicting_framebuffers(NULL, "tegradrmfb",
> +							    false);
> +	if (err < 0)
> +		goto hub;
> +
> +	err = tegra_drm_fb_init(drm);
> +	if (err < 0)
> +		goto hub;
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
> @@ -1229,8 +1195,29 @@ static int host1x_drm_probe(struct host1x_device *dev)
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
> -- 
> 2.23.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

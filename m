Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5954C110392
	for <lists+linux-tegra@lfdr.de>; Tue,  3 Dec 2019 18:33:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727198AbfLCRdP (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 3 Dec 2019 12:33:15 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:39198 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726074AbfLCRdP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 3 Dec 2019 12:33:15 -0500
Received: by mail-wm1-f68.google.com with SMTP id s14so4478960wmh.4
        for <linux-tegra@vger.kernel.org>; Tue, 03 Dec 2019 09:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=vunnsGASfrPGdutrmZXhBJxJuEuoYHD13Yjm532sObE=;
        b=MZ2CwD5O0wVMLjuCSKtGpuK6E9Kxlfsw0vznXo+m8yt4qwoijNZLMGhmNq/NaNlrn9
         JZPmnLhth4ORZ57nduBm6RMBt1n8lbqFyYofgY6pBhPzNh1qi9sTnm4DWYc6WECPV2Oq
         BF9Re8AYV61QxF78rwFUowNJhWgtgTGCPHC10=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=vunnsGASfrPGdutrmZXhBJxJuEuoYHD13Yjm532sObE=;
        b=Y4Masb7qIJi8RmGzup/6Epg5TG5f+Y3/sjb1HwVujeOGugCYYFVR9/mPu7IPTBQHL8
         MrwCUtCwCp+75/oqRXWUXTX4DWJJQf8f2v7EsTXnwjtY2W75x6ZqvlAALWX0DIuD2AUo
         LYuKv0xLeMWtxL1rirYZ6es+eH2WNuS2hYrIbdyBEbfAnwkqcI3ixGbZEqW7pimLVjY+
         FV98cbJ8WEgCtn7Srex+KbZCCRPHtKUnLqgDhe3cdnEhtqWrlXt6qVC/V2+wXNIatFfK
         uC57z07or7JDLQ7n/25Xye/zHo0tv3sn17iZJituNvz8/T3L3oHA5A8306H77qQii2kz
         k5Gw==
X-Gm-Message-State: APjAAAUut4yKKbWrL6zx0Gpyaq0Vc3dRP3vmn+kwHGQE6N0RSICNyl77
        sZzSF/EqCAqgxnxcG9bCvkdC9Q==
X-Google-Smtp-Source: APXvYqytmDwfKrb3FXpmbvX5KqK7G89VKh22wxCwf37cgu6IdtDGyeIv7u4hOBPIxWmmkyUgKwa8Jg==
X-Received: by 2002:a1c:9958:: with SMTP id b85mr28619012wme.63.1575394391466;
        Tue, 03 Dec 2019 09:33:11 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net. [212.51.149.96])
        by smtp.gmail.com with ESMTPSA id t5sm4505917wrr.35.2019.12.03.09.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2019 09:33:10 -0800 (PST)
Date:   Tue, 3 Dec 2019 18:33:08 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 3/3] drm/tegra: Implement correct DMA-BUF semantics
Message-ID: <20191203173308.GK624164@phenom.ffwll.local>
References: <20191203163203.1486837-1-thierry.reding@gmail.com>
 <20191203163203.1486837-3-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191203163203.1486837-3-thierry.reding@gmail.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Dec 03, 2019 at 05:32:03PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> DMA-BUF requires that each device that accesses a DMA-BUF attaches to it
> separately. To do so the host1x_bo_pin() and host1x_bo_unpin() functions
> need to be reimplemented so that they can return a mapping, which either
> represents an attachment or a map of the driver's own GEM object.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>

I didn't check the full details, but this looks like it's doing things as
intended.

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Cheers, Daniel

> ---
>  drivers/gpu/drm/tegra/gem.c   | 131 +++++++++++++++++++++-------------
>  drivers/gpu/drm/tegra/plane.c |  47 ++++--------
>  drivers/gpu/drm/tegra/plane.h |   2 +-
>  drivers/gpu/host1x/job.c      | 127 ++++++++++++--------------------
>  drivers/gpu/host1x/job.h      |   6 +-
>  include/linux/host1x.h        |  32 ++++++---
>  6 files changed, 162 insertions(+), 183 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
> index 1237df157e05..c085499067ed 100644
> --- a/drivers/gpu/drm/tegra/gem.c
> +++ b/drivers/gpu/drm/tegra/gem.c
> @@ -27,71 +27,77 @@ static void tegra_bo_put(struct host1x_bo *bo)
>  	drm_gem_object_put_unlocked(&obj->gem);
>  }
>  
> -/* XXX move this into lib/scatterlist.c? */
> -static int sg_alloc_table_from_sg(struct sg_table *sgt, struct scatterlist *sg,
> -				  unsigned int nents, gfp_t gfp_mask)
> +static struct host1x_bo_mapping *
> +tegra_bo_pin(struct device *dev, struct host1x_bo *bo,
> +	     enum dma_data_direction direction)
>  {
> -	struct scatterlist *dst;
> -	unsigned int i;
> +	struct tegra_bo *obj = host1x_to_tegra_bo(bo);
> +	struct drm_gem_object *gem = &obj->gem;
> +	struct host1x_bo_mapping *map;
>  	int err;
>  
> -	err = sg_alloc_table(sgt, nents, gfp_mask);
> -	if (err < 0)
> -		return err;
> -
> -	dst = sgt->sgl;
> +	map = kzalloc(sizeof(*map), GFP_KERNEL);
> +	if (!map)
> +		return ERR_PTR(-ENOMEM);
>  
> -	for (i = 0; i < nents; i++) {
> -		sg_set_page(dst, sg_page(sg), sg->length, 0);
> -		dst = sg_next(dst);
> -		sg = sg_next(sg);
> -	}
> -
> -	return 0;
> -}
> -
> -static struct sg_table *tegra_bo_pin(struct device *dev, struct host1x_bo *bo,
> -				     dma_addr_t *phys)
> -{
> -	struct tegra_bo *obj = host1x_to_tegra_bo(bo);
> -	struct sg_table *sgt;
> -	int err;
> +	map->direction = direction;
> +	map->dev = dev;
> +	map->bo = bo;
>  
>  	/*
>  	 * If we've manually mapped the buffer object through the IOMMU, make
>  	 * sure to return the IOVA address of our mapping.
>  	 */
> -	if (phys && obj->mm) {
> -		*phys = obj->iova;
> -		return NULL;
> +	if (obj->mm) {
> +		map->phys = obj->iova;
> +		return map;
> +	}
> +
> +	/*
> +	 * Imported buffers need special treatment to satisfy the semantics of
> +	 * DMA-BUF.
> +	 */
> +	if (gem->import_attach) {
> +		struct dma_buf *buf = gem->import_attach->dmabuf;
> +
> +		map->attach = dma_buf_attach(buf, dev);
> +		if (IS_ERR(map->attach)) {
> +			err = PTR_ERR(map->attach);
> +			goto free;
> +		}
> +
> +		map->sgt = dma_buf_map_attachment(map->attach, direction);
> +		if (IS_ERR(map->sgt)) {
> +			dma_buf_detach(buf, map->attach);
> +			err = PTR_ERR(map->sgt);
> +			goto free;
> +		}
> +
> +		map->chunks = sgt_dma_count_chunks(map->sgt);
> +		map->phys = sg_dma_address(map->sgt->sgl);
> +		map->size = gem->size;
> +
> +		return map;
>  	}
>  
>  	/*
>  	 * If we don't have a mapping for this buffer yet, return an SG table
>  	 * so that host1x can do the mapping for us via the DMA API.
>  	 */
> -	sgt = kzalloc(sizeof(*sgt), GFP_KERNEL);
> -	if (!sgt)
> -		return ERR_PTR(-ENOMEM);
> +	map->sgt = kzalloc(sizeof(*map->sgt), GFP_KERNEL);
> +	if (!map->sgt) {
> +		err = -ENOMEM;
> +		goto free;
> +	}
>  
>  	if (obj->pages) {
>  		/*
>  		 * If the buffer object was allocated from the explicit IOMMU
>  		 * API code paths, construct an SG table from the pages.
>  		 */
> -		err = sg_alloc_table_from_pages(sgt, obj->pages, obj->num_pages,
> -						0, obj->gem.size, GFP_KERNEL);
> -		if (err < 0)
> -			goto free;
> -	} else if (obj->sgt) {
> -		/*
> -		 * If the buffer object already has an SG table but no pages
> -		 * were allocated for it, it means the buffer was imported and
> -		 * the SG table needs to be copied to avoid overwriting any
> -		 * other potential users of the original SG table.
> -		 */
> -		err = sg_alloc_table_from_sg(sgt, obj->sgt->sgl, obj->sgt->nents,
> -					     GFP_KERNEL);
> +		err = sg_alloc_table_from_pages(map->sgt, obj->pages,
> +						obj->num_pages, 0,
> +						obj->gem.size, GFP_KERNEL);
>  		if (err < 0)
>  			goto free;
>  	} else {
> @@ -100,25 +106,48 @@ static struct sg_table *tegra_bo_pin(struct device *dev, struct host1x_bo *bo,
>  		 * not imported, it had to be allocated with the DMA API, so
>  		 * the DMA API helper can be used.
>  		 */
> -		err = dma_get_sgtable(dev, sgt, obj->vaddr, obj->iova,
> +		err = dma_get_sgtable(dev, map->sgt, obj->vaddr, obj->iova,
>  				      obj->gem.size);
>  		if (err < 0)
>  			goto free;
>  	}
>  
> -	return sgt;
> +	err = dma_map_sg(dev, map->sgt->sgl, map->sgt->nents, direction);
> +	if (!err) {
> +		err = -ENOMEM;
> +		goto free_sgt;
> +	}
> +
> +	map->phys = sg_dma_address(map->sgt->sgl);
> +	map->size = gem->size;
> +	map->chunks = err;
> +
> +	return map;
>  
> +free_sgt:
> +	sg_free_table(map->sgt);
>  free:
> -	kfree(sgt);
> +	kfree(map->sgt);
> +	kfree(map);
>  	return ERR_PTR(err);
>  }
>  
> -static void tegra_bo_unpin(struct device *dev, struct sg_table *sgt)
> +static void tegra_bo_unpin(struct host1x_bo_mapping *map)
>  {
> -	if (sgt) {
> -		sg_free_table(sgt);
> -		kfree(sgt);
> +	if (!map)
> +		return;
> +
> +	if (map->attach) {
> +		dma_buf_unmap_attachment(map->attach, map->sgt, map->direction);
> +		dma_buf_detach(map->attach->dmabuf, map->attach);
> +	} else {
> +		dma_unmap_sg(map->dev, map->sgt->sgl, map->sgt->nents,
> +			     map->direction);
> +		sg_free_table(map->sgt);
> +		kfree(map->sgt);
>  	}
> +
> +	kfree(map);
>  }
>  
>  static void *tegra_bo_mmap(struct host1x_bo *bo)
> diff --git a/drivers/gpu/drm/tegra/plane.c b/drivers/gpu/drm/tegra/plane.c
> index cadcdd9ea427..28cf668026da 100644
> --- a/drivers/gpu/drm/tegra/plane.c
> +++ b/drivers/gpu/drm/tegra/plane.c
> @@ -67,7 +67,7 @@ tegra_plane_atomic_duplicate_state(struct drm_plane *plane)
>  
>  	for (i = 0; i < 3; i++) {
>  		copy->iova[i] = DMA_MAPPING_ERROR;
> -		copy->sgt[i] = NULL;
> +		copy->map[i] = NULL;
>  	}
>  
>  	return &copy->base;
> @@ -114,18 +114,11 @@ static int tegra_dc_pin(struct tegra_dc *dc, struct tegra_plane_state *state)
>  		struct tegra_bo *bo = tegra_fb_get_plane(state->base.fb, i);
>  
>  		if (!dc->client.group) {
> -			struct sg_table *sgt;
> +			struct host1x_bo_mapping *map;
>  
> -			sgt = host1x_bo_pin(dc->dev, &bo->base, NULL);
> -			if (IS_ERR(sgt)) {
> -				err = PTR_ERR(sgt);
> -				goto unpin;
> -			}
> -
> -			err = dma_map_sg(dc->dev, sgt->sgl, sgt->nents,
> -					 DMA_TO_DEVICE);
> -			if (err == 0) {
> -				err = -ENOMEM;
> +			map = host1x_bo_pin(dc->dev, &bo->base, DMA_TO_DEVICE);
> +			if (IS_ERR(map)) {
> +				err = PTR_ERR(map);
>  				goto unpin;
>  			}
>  
> @@ -135,13 +128,13 @@ static int tegra_dc_pin(struct tegra_dc *dc, struct tegra_plane_state *state)
>  			 * map its SG table to a single contiguous chunk of
>  			 * I/O virtual memory.
>  			 */
> -			if (err > 1) {
> +			if (map->chunks > 1) {
>  				err = -EINVAL;
>  				goto unpin;
>  			}
>  
> -			state->iova[i] = sg_dma_address(sgt->sgl);
> -			state->sgt[i] = sgt;
> +			state->iova[i] = map->phys;
> +			state->map[i] = map;
>  		} else {
>  			state->iova[i] = bo->iova;
>  		}
> @@ -153,14 +146,9 @@ static int tegra_dc_pin(struct tegra_dc *dc, struct tegra_plane_state *state)
>  	dev_err(dc->dev, "failed to map plane %u: %d\n", i, err);
>  
>  	while (i--) {
> -		struct tegra_bo *bo = tegra_fb_get_plane(state->base.fb, i);
> -		struct sg_table *sgt = state->sgt[i];
> -
> -		dma_unmap_sg(dc->dev, sgt->sgl, sgt->nents, DMA_TO_DEVICE);
> -		host1x_bo_unpin(dc->dev, &bo->base, sgt);
> -
> +		host1x_bo_unpin(state->map[i]);
>  		state->iova[i] = DMA_MAPPING_ERROR;
> -		state->sgt[i] = NULL;
> +		state->map[i] = NULL;
>  	}
>  
>  	return err;
> @@ -171,20 +159,11 @@ static void tegra_dc_unpin(struct tegra_dc *dc, struct tegra_plane_state *state)
>  	unsigned int i;
>  
>  	for (i = 0; i < state->base.fb->format->num_planes; i++) {
> -		struct tegra_bo *bo = tegra_fb_get_plane(state->base.fb, i);
> -
> -		if (!dc->client.group) {
> -			struct sg_table *sgt = state->sgt[i];
> -
> -			if (sgt) {
> -				dma_unmap_sg(dc->dev, sgt->sgl, sgt->nents,
> -					     DMA_TO_DEVICE);
> -				host1x_bo_unpin(dc->dev, &bo->base, sgt);
> -			}
> -		}
> +		if (!dc->client.group)
> +			host1x_bo_unpin(state->map[i]);
>  
>  		state->iova[i] = DMA_MAPPING_ERROR;
> -		state->sgt[i] = NULL;
> +		state->map[i] = NULL;
>  	}
>  }
>  
> diff --git a/drivers/gpu/drm/tegra/plane.h b/drivers/gpu/drm/tegra/plane.h
> index a158a915109a..08df1ba1f567 100644
> --- a/drivers/gpu/drm/tegra/plane.h
> +++ b/drivers/gpu/drm/tegra/plane.h
> @@ -39,7 +39,7 @@ struct tegra_plane_legacy_blending_state {
>  struct tegra_plane_state {
>  	struct drm_plane_state base;
>  
> -	struct sg_table *sgt[3];
> +	struct host1x_bo_mapping *map[3];
>  	dma_addr_t iova[3];
>  
>  	struct tegra_bo_tiling tiling;
> diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
> index 60b2fedd0061..88e445553df3 100644
> --- a/drivers/gpu/host1x/job.c
> +++ b/drivers/gpu/host1x/job.c
> @@ -99,6 +99,7 @@ EXPORT_SYMBOL(host1x_job_add_gather);
>  
>  static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
>  {
> +	unsigned long mask = HOST1X_RELOC_READ | HOST1X_RELOC_WRITE;
>  	struct host1x_client *client = job->client;
>  	struct device *dev = client->dev;
>  	unsigned int i;
> @@ -108,8 +109,8 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
>  
>  	for (i = 0; i < job->num_relocs; i++) {
>  		struct host1x_reloc *reloc = &job->relocs[i];
> -		dma_addr_t phys_addr, *phys;
> -		struct sg_table *sgt;
> +		enum dma_data_direction direction;
> +		struct host1x_bo_mapping *map;
>  
>  		reloc->target.bo = host1x_bo_get(reloc->target.bo);
>  		if (!reloc->target.bo) {
> @@ -117,63 +118,40 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
>  			goto unpin;
>  		}
>  
> -		if (client->group)
> -			phys = &phys_addr;
> -		else
> -			phys = NULL;
> -
> -		sgt = host1x_bo_pin(dev, reloc->target.bo, phys);
> -		if (IS_ERR(sgt)) {
> -			err = PTR_ERR(sgt);
> -			goto unpin;
> -		}
> -
> -		if (sgt) {
> -			unsigned long mask = HOST1X_RELOC_READ |
> -					     HOST1X_RELOC_WRITE;
> -			enum dma_data_direction dir;
> -
> -			switch (reloc->flags & mask) {
> -			case HOST1X_RELOC_READ:
> -				dir = DMA_TO_DEVICE;
> -				break;
> -
> -			case HOST1X_RELOC_WRITE:
> -				dir = DMA_FROM_DEVICE;
> -				break;
> +		switch (reloc->flags & mask) {
> +		case HOST1X_RELOC_READ:
> +			direction = DMA_TO_DEVICE;
> +			break;
>  
> -			case HOST1X_RELOC_READ | HOST1X_RELOC_WRITE:
> -				dir = DMA_BIDIRECTIONAL;
> -				break;
> +		case HOST1X_RELOC_WRITE:
> +			direction = DMA_FROM_DEVICE;
> +			break;
>  
> -			default:
> -				err = -EINVAL;
> -				goto unpin;
> -			}
> +		case HOST1X_RELOC_READ | HOST1X_RELOC_WRITE:
> +			direction = DMA_BIDIRECTIONAL;
> +			break;
>  
> -			err = dma_map_sg(dev, sgt->sgl, sgt->nents, dir);
> -			if (!err) {
> -				err = -ENOMEM;
> -				goto unpin;
> -			}
> +		default:
> +			err = -EINVAL;
> +			goto unpin;
> +		}
>  
> -			job->unpins[job->num_unpins].dev = dev;
> -			job->unpins[job->num_unpins].dir = dir;
> -			phys_addr = sg_dma_address(sgt->sgl);
> +		map = host1x_bo_pin(dev, reloc->target.bo, direction);
> +		if (IS_ERR(map)) {
> +			err = PTR_ERR(map);
> +			goto unpin;
>  		}
>  
> -		job->addr_phys[job->num_unpins] = phys_addr;
> -		job->unpins[job->num_unpins].bo = reloc->target.bo;
> -		job->unpins[job->num_unpins].sgt = sgt;
> +		job->addr_phys[job->num_unpins] = map->phys;
> +		job->unpins[job->num_unpins].map = map;
>  		job->num_unpins++;
>  	}
>  
>  	for (i = 0; i < job->num_gathers; i++) {
>  		struct host1x_job_gather *g = &job->gathers[i];
> +		struct host1x_bo_mapping *map;
>  		size_t gather_size = 0;
>  		struct scatterlist *sg;
> -		struct sg_table *sgt;
> -		dma_addr_t phys_addr;
>  		unsigned long shift;
>  		struct iova *alloc;
>  		unsigned int j;
> @@ -184,15 +162,16 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
>  			goto unpin;
>  		}
>  
> -		sgt = host1x_bo_pin(host->dev, g->bo, NULL);
> -		if (IS_ERR(sgt)) {
> -			err = PTR_ERR(sgt);
> +		map = host1x_bo_pin(host->dev, g->bo, DMA_TO_DEVICE);
> +		if (IS_ERR(map)) {
> +			err = PTR_ERR(map);
>  			goto unpin;
>  		}
>  
>  		if (!IS_ENABLED(CONFIG_TEGRA_HOST1X_FIREWALL) && host->domain) {
> -			for_each_sg(sgt->sgl, sg, sgt->nents, j)
> +			for_each_sg(map->sgt->sgl, sg, map->sgt->nents, j)
>  				gather_size += sg->length;
> +
>  			gather_size = iova_align(&host->iova, gather_size);
>  
>  			shift = iova_shift(&host->iova);
> @@ -204,35 +183,24 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
>  			}
>  
>  			err = iommu_map_sg(host->domain,
> -					iova_dma_addr(&host->iova, alloc),
> -					sgt->sgl, sgt->nents, IOMMU_READ);
> +					   iova_dma_addr(&host->iova, alloc),
> +					   map->sgt->sgl, map->sgt->nents,
> +					   IOMMU_READ);
>  			if (err == 0) {
>  				__free_iova(&host->iova, alloc);
>  				err = -EINVAL;
>  				goto unpin;
>  			}
>  
> -			job->unpins[job->num_unpins].size = gather_size;
> -			phys_addr = iova_dma_addr(&host->iova, alloc);
> -		} else {
> -			err = dma_map_sg(host->dev, sgt->sgl, sgt->nents,
> -					 DMA_TO_DEVICE);
> -			if (!err) {
> -				err = -ENOMEM;
> -				goto unpin;
> -			}
> -
> -			job->unpins[job->num_unpins].dev = host->dev;
> -			phys_addr = sg_dma_address(sgt->sgl);
> +			map->phys = iova_dma_addr(&host->iova, alloc);
> +			map->size = gather_size;
>  		}
>  
> -		job->addr_phys[job->num_unpins] = phys_addr;
> -		job->gather_addr_phys[i] = phys_addr;
> -
> -		job->unpins[job->num_unpins].dir = DMA_TO_DEVICE;
> -		job->unpins[job->num_unpins].bo = g->bo;
> -		job->unpins[job->num_unpins].sgt = sgt;
> +		job->addr_phys[job->num_unpins] = map->phys;
> +		job->unpins[job->num_unpins].map = map;
>  		job->num_unpins++;
> +
> +		job->gather_addr_phys[i] = map->phys;
>  	}
>  
>  	return 0;
> @@ -608,24 +576,19 @@ void host1x_job_unpin(struct host1x_job *job)
>  	unsigned int i;
>  
>  	for (i = 0; i < job->num_unpins; i++) {
> -		struct host1x_job_unpin_data *unpin = &job->unpins[i];
> -		struct device *dev = unpin->dev ?: host->dev;
> -		struct sg_table *sgt = unpin->sgt;
> +		struct host1x_bo_mapping *map = job->unpins[i].map;
> +		struct host1x_bo *bo = map->bo;
>  
>  		if (!IS_ENABLED(CONFIG_TEGRA_HOST1X_FIREWALL) &&
> -		    unpin->size && host->domain) {
> +		    map->size && host->domain) {
>  			iommu_unmap(host->domain, job->addr_phys[i],
> -				    unpin->size);
> +				    map->size);
>  			free_iova(&host->iova,
> -				iova_pfn(&host->iova, job->addr_phys[i]));
> +				  iova_pfn(&host->iova, job->addr_phys[i]));
>  		}
>  
> -		if (unpin->dev && sgt)
> -			dma_unmap_sg(unpin->dev, sgt->sgl, sgt->nents,
> -				     unpin->dir);
> -
> -		host1x_bo_unpin(dev, unpin->bo, sgt);
> -		host1x_bo_put(unpin->bo);
> +		host1x_bo_unpin(map);
> +		host1x_bo_put(bo);
>  	}
>  
>  	job->num_unpins = 0;
> diff --git a/drivers/gpu/host1x/job.h b/drivers/gpu/host1x/job.h
> index 94bc2e4ae241..c28eebb8ce14 100644
> --- a/drivers/gpu/host1x/job.h
> +++ b/drivers/gpu/host1x/job.h
> @@ -19,11 +19,7 @@ struct host1x_job_gather {
>  };
>  
>  struct host1x_job_unpin_data {
> -	struct host1x_bo *bo;
> -	struct sg_table *sgt;
> -	struct device *dev;
> -	size_t size;
> -	enum dma_data_direction dir;
> +	struct host1x_bo_mapping *map;
>  };
>  
>  /*
> diff --git a/include/linux/host1x.h b/include/linux/host1x.h
> index 0254ebcdc0a7..f1e6fad19289 100644
> --- a/include/linux/host1x.h
> +++ b/include/linux/host1x.h
> @@ -7,6 +7,7 @@
>  #define __LINUX_HOST1X_H
>  
>  #include <linux/device.h>
> +#include <linux/dma-direction.h>
>  #include <linux/types.h>
>  
>  enum host1x_class {
> @@ -72,12 +73,24 @@ struct host1x_client {
>  struct host1x_bo;
>  struct sg_table;
>  
> +struct host1x_bo_mapping {
> +	struct dma_buf_attachment *attach;
> +	enum dma_data_direction direction;
> +	struct host1x_bo *bo;
> +	struct sg_table *sgt;
> +	unsigned int chunks;
> +	struct device *dev;
> +	dma_addr_t phys;
> +	size_t size;
> +};
> +
>  struct host1x_bo_ops {
>  	struct host1x_bo *(*get)(struct host1x_bo *bo);
>  	void (*put)(struct host1x_bo *bo);
> -	struct sg_table *(*pin)(struct device *dev, struct host1x_bo *bo,
> -				dma_addr_t *phys);
> -	void (*unpin)(struct device *dev, struct sg_table *sgt);
> +	struct host1x_bo_mapping *(*pin)(struct device *dev,
> +					 struct host1x_bo *bo,
> +					 enum dma_data_direction dir);
> +	void (*unpin)(struct host1x_bo_mapping *map);
>  	void *(*mmap)(struct host1x_bo *bo);
>  	void (*munmap)(struct host1x_bo *bo, void *addr);
>  };
> @@ -102,17 +115,16 @@ static inline void host1x_bo_put(struct host1x_bo *bo)
>  	bo->ops->put(bo);
>  }
>  
> -static inline struct sg_table *host1x_bo_pin(struct device *dev,
> -					     struct host1x_bo *bo,
> -					     dma_addr_t *phys)
> +static inline struct host1x_bo_mapping *
> +host1x_bo_pin(struct device *dev, struct host1x_bo *bo,
> +	      enum dma_data_direction dir)
>  {
> -	return bo->ops->pin(dev, bo, phys);
> +	return bo->ops->pin(dev, bo, dir);
>  }
>  
> -static inline void host1x_bo_unpin(struct device *dev, struct host1x_bo *bo,
> -				   struct sg_table *sgt)
> +static inline void host1x_bo_unpin(struct host1x_bo_mapping *map)
>  {
> -	bo->ops->unpin(dev, sgt);
> +	map->bo->ops->unpin(map);
>  }
>  
>  static inline void *host1x_bo_mmap(struct host1x_bo *bo)
> -- 
> 2.23.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

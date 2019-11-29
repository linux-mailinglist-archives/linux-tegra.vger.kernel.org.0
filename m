Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B33D10D2FA
	for <lists+linux-tegra@lfdr.de>; Fri, 29 Nov 2019 10:10:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726604AbfK2JKp (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 29 Nov 2019 04:10:45 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:37677 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725892AbfK2JKp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 29 Nov 2019 04:10:45 -0500
Received: by mail-wr1-f68.google.com with SMTP id w15so3203523wru.4
        for <linux-tegra@vger.kernel.org>; Fri, 29 Nov 2019 01:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3aO97pOEtqkMLXTBXdj6G0lmfb+oABXgy4h9k+T807M=;
        b=bcuIAt40w7Xe+lNKwmpCMGbKkfRGr0dS/4VpGxF517qXp/4KEj6NYUdN/k4YRncu88
         Jlk1AUGRgZFnVO0fyOjYSJ0maj9NYu8On27yczLypuJvwmJxCk7gOvoLZC9AVWJYA///
         hjmf1XpNTCtfZmo1y38uuUgWhjAZ3QT4IPAPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3aO97pOEtqkMLXTBXdj6G0lmfb+oABXgy4h9k+T807M=;
        b=YAjulUj1A79yTEKAnxf5Z8KfVwjZBzj1rU6n+YxD5Wy1rkIuYQDW4c8FJmBfUqnnV5
         o7JTChQws96mSPSDG07N4x8AQd7rKJdYr8BxP6CWA8yUzXudV9CDjrALrI0dVedUv/kc
         f/RsVxcr9yPHwThFii2izV67b6Fb0kxJXkQWyLhK5JATgVfbrs8gEr550nztrPOkO57J
         oOw3fnmZVkESKg061AK5Nnu8aNAlXy3XjqcjvSi95OF4PebB9eghNIMtPC0SvkU2bw6G
         d4Rq2POsB96FXalbrqgzTozLLw9f8GJlu2TnEgUCBJ49iB0Gf2LWgJCoQYxUfp5ZXGoA
         yyuQ==
X-Gm-Message-State: APjAAAVxtG/eDhKVa3Fsq/SXVIbEINcoaGb0WMLEztXWYUhprUXBUz0Q
        5HTinbZJLu2dex0uFubkjCNKtw==
X-Google-Smtp-Source: APXvYqzGEf8G1x7Dhy9qTU57UhkfsnwYgA32AlmeHbS6vfJYoPkyrbQ2Fva6p5pr+5Hyt6P5dzGSdg==
X-Received: by 2002:adf:ea8d:: with SMTP id s13mr52892635wrm.366.1575018641942;
        Fri, 29 Nov 2019 01:10:41 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net. [212.51.149.96])
        by smtp.gmail.com with ESMTPSA id r15sm27703126wrc.5.2019.11.29.01.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2019 01:10:40 -0800 (PST)
Date:   Fri, 29 Nov 2019 10:10:38 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/9] drm/tegra: gem: Properly pin imported buffers
Message-ID: <20191129091038.GB624164@phenom.ffwll.local>
References: <20191128153741.2380419-1-thierry.reding@gmail.com>
 <20191128153741.2380419-3-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191128153741.2380419-3-thierry.reding@gmail.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Nov 28, 2019 at 04:37:34PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Buffers that are imported from a DMA-BUF don't have pages allocated with
> them. At the same time an SG table for them can't be derived using the
> DMA API helpers because the necessary information doesn't exist. However
> there's already an SG table that was created during import, so this can
> simply be duplicated.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/gem.c | 43 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
> index 746dae32c484..6dfad56eee2b 100644
> --- a/drivers/gpu/drm/tegra/gem.c
> +++ b/drivers/gpu/drm/tegra/gem.c
> @@ -27,6 +27,29 @@ static void tegra_bo_put(struct host1x_bo *bo)
>  	drm_gem_object_put_unlocked(&obj->gem);
>  }
>  
> +/* XXX move this into lib/scatterlist.c? */
> +static int sg_alloc_table_from_sg(struct sg_table *sgt, struct scatterlist *sg,
> +				  unsigned int nents, gfp_t gfp_mask)
> +{
> +	struct scatterlist *dst;
> +	unsigned int i;
> +	int err;
> +
> +	err = sg_alloc_table(sgt, nents, gfp_mask);
> +	if (err < 0)
> +		return err;
> +
> +	dst = sgt->sgl;
> +
> +	for (i = 0; i < nents; i++) {
> +		sg_set_page(dst, sg_page(sg), sg->length, 0);
> +		dst = sg_next(dst);
> +		sg = sg_next(sg);
> +	}
> +
> +	return 0;
> +}
> +
>  static struct sg_table *tegra_bo_pin(struct device *dev, struct host1x_bo *bo,
>  				     dma_addr_t *phys)
>  {
> @@ -52,11 +75,31 @@ static struct sg_table *tegra_bo_pin(struct device *dev, struct host1x_bo *bo,
>  		return ERR_PTR(-ENOMEM);
>  
>  	if (obj->pages) {
> +		/*
> +		 * If the buffer object was allocated from the explicit IOMMU
> +		 * API code paths, construct an SG table from the pages.
> +		 */
>  		err = sg_alloc_table_from_pages(sgt, obj->pages, obj->num_pages,
>  						0, obj->gem.size, GFP_KERNEL);
>  		if (err < 0)
>  			goto free;
> +	} else if (obj->sgt) {
> +		/*
> +		 * If the buffer object already has an SG table but no pages
> +		 * were allocated for it, it means the buffer was imported and
> +		 * the SG table needs to be copied to avoid overwriting any
> +		 * other potential users of the original SG table.
> +		 */
> +		err = sg_alloc_table_from_sg(sgt, obj->sgt->sgl, obj->sgt->nents,
> +					     GFP_KERNEL);

Why duplicate this instead of just handing out obj->sgt, and then in unpin
making sure you don't release it? You could also only map/unmap the
dma_buf here in your pin/unpin, but that's a pile of work plus the mapping
is cached anyway so won't change a thing.
-Daniel

> +		if (err < 0)
> +			goto free;
>  	} else {
> +		/*
> +		 * If the buffer object had no pages allocated and if it was
> +		 * not imported, it had to be allocated with the DMA API, so
> +		 * the DMA API helper can be used.
> +		 */
>  		err = dma_get_sgtable(dev, sgt, obj->vaddr, obj->iova,
>  				      obj->gem.size);
>  		if (err < 0)
> -- 
> 2.23.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

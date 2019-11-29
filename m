Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D944310DA00
	for <lists+linux-tegra@lfdr.de>; Fri, 29 Nov 2019 20:09:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726970AbfK2TJf (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 29 Nov 2019 14:09:35 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:36823 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727028AbfK2TJe (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 29 Nov 2019 14:09:34 -0500
Received: by mail-wr1-f67.google.com with SMTP id z3so36384720wru.3
        for <linux-tegra@vger.kernel.org>; Fri, 29 Nov 2019 11:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Y+4QYKsOjQnwEWeU38Xz62KA5COFu9Z2lHktcaErdcI=;
        b=M+/8igbEyVjNWdX150ys0wFK+t2Xsj96GGYSUBid3AQ6KqaXE5afivwECo7xi9KZ9e
         ExqzDXORxhdt+63N2xaS2/ZpKrib1+nw1FnbJmJpLUBEdFJq9Myy9aT4BYi/fwyGoGxa
         dlRr4gXVPfVVAxqMHEp7Vf1YHOHoMV0RrKruE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Y+4QYKsOjQnwEWeU38Xz62KA5COFu9Z2lHktcaErdcI=;
        b=PQPBMw3XS+4r2ud1S9w+W912Y/SiNGg0UDVX5ivarXm5nGWe8hHVvkzIhhB6gZSkV2
         iQMcdmRj38HOfopeNaJ60K3yGiGPuR0L0VLP3Yj7QbC9p7pOsESFn6nMI3FXwFkdKYSa
         /0aQUqel8UHwdCFAW97lohHdAeMklGlOk5CobV75atalGlOV8JVFFAM/XCNfaV0XBxfH
         E5m3wFUGfGbmOvNsc9K4/FBIxjDflOBtaiAW00qA94TyYHi48eE2Bhe5qpFWOiWNJ7xC
         1X+/WPEgXzy9MChk+NViQiv0+fT/z7kCe74woS2yrDfSesKy5nuRinsxrBuCFuUGKvwa
         ANDg==
X-Gm-Message-State: APjAAAXacZsfqQZ76MYD1SkgVtb7DJ0iN7XDQ3xLeEFI+5w9N+2LIKFL
        9hRbqdAMeBSOuhaiPsPnc5yEGexbJ7Q=
X-Google-Smtp-Source: APXvYqzy/28jjeECtJngllNZoD5R5G2rx6MPwcbT9JT9zDQpQYiU4QTGNMk0gKLZT1aMIpRF3kDSxg==
X-Received: by 2002:adf:f20d:: with SMTP id p13mr53500417wro.325.1575054571413;
        Fri, 29 Nov 2019 11:09:31 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net. [212.51.149.96])
        by smtp.gmail.com with ESMTPSA id x10sm28148807wrv.60.2019.11.29.11.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2019 11:09:30 -0800 (PST)
Date:   Fri, 29 Nov 2019 20:09:28 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>, linux-tegra@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/9] drm/tegra: gem: Properly pin imported buffers
Message-ID: <20191129190928.GO624164@phenom.ffwll.local>
References: <20191128153741.2380419-1-thierry.reding@gmail.com>
 <20191128153741.2380419-3-thierry.reding@gmail.com>
 <20191129091038.GB624164@phenom.ffwll.local>
 <20191129101537.GB2771912@ulmo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191129101537.GB2771912@ulmo>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Nov 29, 2019 at 11:15:37AM +0100, Thierry Reding wrote:
> On Fri, Nov 29, 2019 at 10:10:38AM +0100, Daniel Vetter wrote:
> > On Thu, Nov 28, 2019 at 04:37:34PM +0100, Thierry Reding wrote:
> > > From: Thierry Reding <treding@nvidia.com>
> > > 
> > > Buffers that are imported from a DMA-BUF don't have pages allocated with
> > > them. At the same time an SG table for them can't be derived using the
> > > DMA API helpers because the necessary information doesn't exist. However
> > > there's already an SG table that was created during import, so this can
> > > simply be duplicated.
> > > 
> > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > > ---
> > >  drivers/gpu/drm/tegra/gem.c | 43 +++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 43 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
> > > index 746dae32c484..6dfad56eee2b 100644
> > > --- a/drivers/gpu/drm/tegra/gem.c
> > > +++ b/drivers/gpu/drm/tegra/gem.c
> > > @@ -27,6 +27,29 @@ static void tegra_bo_put(struct host1x_bo *bo)
> > >  	drm_gem_object_put_unlocked(&obj->gem);
> > >  }
> > >  
> > > +/* XXX move this into lib/scatterlist.c? */
> > > +static int sg_alloc_table_from_sg(struct sg_table *sgt, struct scatterlist *sg,
> > > +				  unsigned int nents, gfp_t gfp_mask)
> > > +{
> > > +	struct scatterlist *dst;
> > > +	unsigned int i;
> > > +	int err;
> > > +
> > > +	err = sg_alloc_table(sgt, nents, gfp_mask);
> > > +	if (err < 0)
> > > +		return err;
> > > +
> > > +	dst = sgt->sgl;
> > > +
> > > +	for (i = 0; i < nents; i++) {
> > > +		sg_set_page(dst, sg_page(sg), sg->length, 0);
> > > +		dst = sg_next(dst);
> > > +		sg = sg_next(sg);
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >  static struct sg_table *tegra_bo_pin(struct device *dev, struct host1x_bo *bo,
> > >  				     dma_addr_t *phys)
> > >  {
> > > @@ -52,11 +75,31 @@ static struct sg_table *tegra_bo_pin(struct device *dev, struct host1x_bo *bo,
> > >  		return ERR_PTR(-ENOMEM);
> > >  
> > >  	if (obj->pages) {
> > > +		/*
> > > +		 * If the buffer object was allocated from the explicit IOMMU
> > > +		 * API code paths, construct an SG table from the pages.
> > > +		 */
> > >  		err = sg_alloc_table_from_pages(sgt, obj->pages, obj->num_pages,
> > >  						0, obj->gem.size, GFP_KERNEL);
> > >  		if (err < 0)
> > >  			goto free;
> > > +	} else if (obj->sgt) {
> > > +		/*
> > > +		 * If the buffer object already has an SG table but no pages
> > > +		 * were allocated for it, it means the buffer was imported and
> > > +		 * the SG table needs to be copied to avoid overwriting any
> > > +		 * other potential users of the original SG table.
> > > +		 */
> > > +		err = sg_alloc_table_from_sg(sgt, obj->sgt->sgl, obj->sgt->nents,
> > > +					     GFP_KERNEL);
> > 
> > Why duplicate this instead of just handing out obj->sgt, and then in unpin
> > making sure you don't release it? You could also only map/unmap the
> > dma_buf here in your pin/unpin, but that's a pile of work plus the mapping
> > is cached anyway so won't change a thing.
> 
> The problem with just handing out obj->sgt is that these buffers may be
> used by several of the host1x engines in the same job. This means that
> they may end up getting dma_map()'ed by multiple devices. dma_map_*()
> stores the DMA addresses for the buffer in the SG entries, so subsequent
> calls would effectively overwrite the earlier mappings, so we need a new
> SG table for each device.

So strictly speaking, i.e. if you don't want to contribute to the living
mess that's called dma-buf, you're supposed to dma_buf_attach each and
every device (definitely those with different iommu/dma-api routing). That
entire "let me peak behind the abstraction" thing is kinda not how this
was meant to be used. But the first drm prime drivers did it really badly,
plus drm_prime.c is somewhat backwards in some regards by always attaching
for you right away to /something/, but maybe not the right thing.

Adding more dma-buf interface abuse doesn't feel like the right thing
really.

Also, you're not supposed to call dma_map_sg on the sg tables you get from
dma-buf, they're supposed to be mapped already.
-Daniel


> 
> Thierry
> 
> > -Daniel
> > 
> > > +		if (err < 0)
> > > +			goto free;
> > >  	} else {
> > > +		/*
> > > +		 * If the buffer object had no pages allocated and if it was
> > > +		 * not imported, it had to be allocated with the DMA API, so
> > > +		 * the DMA API helper can be used.
> > > +		 */
> > >  		err = dma_get_sgtable(dev, sgt, obj->vaddr, obj->iova,
> > >  				      obj->gem.size);
> > >  		if (err < 0)
> > > -- 
> > > 2.23.0
> > > 
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > 
> > -- 
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

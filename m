Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1553810DA6A
	for <lists+linux-tegra@lfdr.de>; Fri, 29 Nov 2019 21:06:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727110AbfK2UG2 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 29 Nov 2019 15:06:28 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:39284 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726926AbfK2UG2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 29 Nov 2019 15:06:28 -0500
Received: by mail-wr1-f67.google.com with SMTP id y11so33421928wrt.6
        for <linux-tegra@vger.kernel.org>; Fri, 29 Nov 2019 12:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jCyoaAQMX7Gsa+HCq3CNBhyjkL0+1cThNNjz6K0My80=;
        b=iGIk2rJm0d0oW/vJ50rIT6x1kOUQnmUMO2pLQOWVtdwVsigrCmdfEzJdjMiFdod5XQ
         frpZm4p8q+7eEIN+UGIdwLsmF3qRtwXo/F87vA0fRTDlIZN9ipVpu5D4lzaqK44rX6mG
         jRG0gzuzVX6q5sSfqAQLuKHyn+D2JviKeB4Iw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jCyoaAQMX7Gsa+HCq3CNBhyjkL0+1cThNNjz6K0My80=;
        b=dlJnRM1Ub2qQLgqRkRc/mqyyYg0AWY17OH1dP325sZFXSWqnlAQHGa5mXBkxA9gfXU
         fCQ/Y7OUE57E++yeZ7LokUOgWGy+LhUXSMaoz3JdSeqxGNTA8kqB2r9ZzhX02lHaN9lI
         1ri21yHv6Wl5qO4+gZKgapYlkJBJjUwAPcCdfah0NiYg0JcwlfAV82KoJMNucvIlY0Rv
         Ej0mrSCJIjBTAvwgQeKEgxQ+Bos8JdO1ZmuSeBmcUnhrBjvc1E7weW+WN0vsQHf+xb/f
         rpV8TQ8dVnGnDvYuUvZom4OMHjgFCtzCnd9I+bfTQNsTN13vf9Bf94ig8LH6jVzXr+Tm
         hJuQ==
X-Gm-Message-State: APjAAAXTQvxCSYBf4LrIfe6YPgYuaLVSDbbtMsZXLln0SpSbtL1RNJKP
        EgAMQUaXF4SfOikmJ74vXxR9tg==
X-Google-Smtp-Source: APXvYqzIWZ14TG7AL8doGQRUluKSZiQBpvHshpLn0UqzcXViDg8g6RM/K7tQWsfQ9aypZ9Ko8rXArA==
X-Received: by 2002:a5d:528e:: with SMTP id c14mr22105600wrv.308.1575057986030;
        Fri, 29 Nov 2019 12:06:26 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net. [212.51.149.96])
        by smtp.gmail.com with ESMTPSA id w17sm6030020wrt.89.2019.11.29.12.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2019 12:06:25 -0800 (PST)
Date:   Fri, 29 Nov 2019 21:06:23 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>, linux-tegra@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 3/9] drm/tegra: gem: Remove premature import restrictions
Message-ID: <20191129200623.GP624164@phenom.ffwll.local>
References: <20191128153741.2380419-1-thierry.reding@gmail.com>
 <20191128153741.2380419-4-thierry.reding@gmail.com>
 <20191129091244.GC624164@phenom.ffwll.local>
 <20191129103345.GC2771912@ulmo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191129103345.GC2771912@ulmo>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Nov 29, 2019 at 11:33:45AM +0100, Thierry Reding wrote:
> On Fri, Nov 29, 2019 at 10:12:44AM +0100, Daniel Vetter wrote:
> > On Thu, Nov 28, 2019 at 04:37:35PM +0100, Thierry Reding wrote:
> > > From: Thierry Reding <treding@nvidia.com>
> > > 
> > > It's not known at import time whether or not all users of a DMA-BUF will
> > > be able to deal with non-contiguous memory. Each user needs to verify at
> > > map-time whether it can access the buffer.
> > > 
> > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > 
> > I'm not seeing any other check for nents ... does this mean that there's
> > not actually any block that requires contig mem?
> 
> All the blocks require contiguous memory. However, they are all behind
> an IOMMU and in practice will always end up mapping the buffers through
> the IOMMU. Techically this check should now be in tegra_dc_pin(), which
> is called by the ->prepare_fb() callback. I didn't add it because there
> are no practical use-cases where this happens, although I guess you
> could come up with a kernel and DTB combination where this is actually
> possible by jumping through some hoops.
> 
> This fix here is to make Tegra DRM interoperation with Nouveau work
> again since that's currently broken after moving to the IOMMU-backed DMA
> API as an alternative to explicit IOMMU usage. With explicit IOMMU usage
> (that's the if corresponding to the else removed below) the IOMMU domain
> was shared between the display controllers at the driver level, so it
> was fine to make this determination in the else branch because this was
> the case where no IOMMU was in play. After the move to the DMA API, this
> else branch is also taken when the DMA API is backed by an IOMMU and at
> it is unfortunately not known at import time which display controller
> ends up scanning out the DMA BUF, nor if that display controller is
> behind an IOMMU. We only know that when the actual mapping takes place,
> so we'd need to look at sgt->nents after dma_map_sg() in in
> tegra_dc_pin().
> 
> I'll add that check there, just in case anyone manages to conjure up
> such a configuration.

Imo just paste the above explanation into the commit message and

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Or also add the check, but imo the explanation here is the important part.
-Daniel

> 
> Thierry
> 
> > -Daniel
> > 
> > > ---
> > >  drivers/gpu/drm/tegra/gem.c | 7 -------
> > >  1 file changed, 7 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
> > > index 6dfad56eee2b..bc15b430156d 100644
> > > --- a/drivers/gpu/drm/tegra/gem.c
> > > +++ b/drivers/gpu/drm/tegra/gem.c
> > > @@ -440,13 +440,6 @@ static struct tegra_bo *tegra_bo_import(struct drm_device *drm,
> > >  		err = tegra_bo_iommu_map(tegra, bo);
> > >  		if (err < 0)
> > >  			goto detach;
> > > -	} else {
> > > -		if (bo->sgt->nents > 1) {
> > > -			err = -EINVAL;
> > > -			goto detach;
> > > -		}
> > > -
> > > -		bo->iova = sg_dma_address(bo->sgt->sgl);
> > >  	}
> > >  
> > >  	bo->gem.import_attach = attach;
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

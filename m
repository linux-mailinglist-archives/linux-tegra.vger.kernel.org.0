Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3B4910D304
	for <lists+linux-tegra@lfdr.de>; Fri, 29 Nov 2019 10:12:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726143AbfK2JMu (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 29 Nov 2019 04:12:50 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:37037 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725892AbfK2JMt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 29 Nov 2019 04:12:49 -0500
Received: by mail-wr1-f66.google.com with SMTP id w15so3212692wru.4
        for <linux-tegra@vger.kernel.org>; Fri, 29 Nov 2019 01:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=LM5jSrF8nTgWs4oWxOr3SFgFxskZ6X+DU6VEEtg5wqw=;
        b=aaiPnOSIqcKQDUdopLJyPvbjE4YsaGKDV8KXbhx84uzfDXIf7RUl7KFNaUuMNAUzpw
         Kyzzm6lBU1o4i1ij1rNpemDp562ywxiWMDMtt2bNTjE7lnJWgQzP8eOskCzmy2QjHlKb
         fvvCu/oE/L+WzHRrqAU1r6VVvHWdcofEjkwYo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=LM5jSrF8nTgWs4oWxOr3SFgFxskZ6X+DU6VEEtg5wqw=;
        b=PwEoFq6RPJcJoeeFwDFs2ebe97pMtaOReLVvBSLVSUmyqm5vv/3ITYt2OmKXt6Hnnn
         qrgbWoJ8ZYE6H5sHk21TGU6FoqXZKIM5L2mBDIfDYoXAET3eiW+xv2Mw0htTnBb7aGB0
         dFBJQChRJ5JpQwtl14TmuUhXGytBnJYxBfbVlsEXkdmMYqY2MBgpJBlDSnkK3hAbcMjF
         ezd0NJ+28AOTQqzHFLCjELzAiAQ8PIRzOFvtbFS69lw3yFyZgWz4E2kNo+IxtiJFYXBj
         gIxtIxolZUFZNF9YZcq9lBdIgyW3mx4SCbpesBMBaWf+TMWt/fvd8eCGMfBy/AOCLDoh
         WupA==
X-Gm-Message-State: APjAAAWWQ5kcXh+hFxWEgee7jrqS1CpjRCf9VzicrxxQcNs3sGux9hfn
        yzlhSz00sB4UxqRrHVhHhIvMlg==
X-Google-Smtp-Source: APXvYqw+Z3QWUl2mSYoeyFqzkFQJ0jsPiiG6pisBsnX04UYrnTIoJL+E851+nxXPH8Z0+01EgcJBjQ==
X-Received: by 2002:a5d:6542:: with SMTP id z2mr54928895wrv.371.1575018767329;
        Fri, 29 Nov 2019 01:12:47 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net. [212.51.149.96])
        by smtp.gmail.com with ESMTPSA id k8sm4553994wrl.3.2019.11.29.01.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2019 01:12:46 -0800 (PST)
Date:   Fri, 29 Nov 2019 10:12:44 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 3/9] drm/tegra: gem: Remove premature import restrictions
Message-ID: <20191129091244.GC624164@phenom.ffwll.local>
References: <20191128153741.2380419-1-thierry.reding@gmail.com>
 <20191128153741.2380419-4-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191128153741.2380419-4-thierry.reding@gmail.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Nov 28, 2019 at 04:37:35PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> It's not known at import time whether or not all users of a DMA-BUF will
> be able to deal with non-contiguous memory. Each user needs to verify at
> map-time whether it can access the buffer.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>

I'm not seeing any other check for nents ... does this mean that there's
not actually any block that requires contig mem?
-Daniel

> ---
>  drivers/gpu/drm/tegra/gem.c | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
> index 6dfad56eee2b..bc15b430156d 100644
> --- a/drivers/gpu/drm/tegra/gem.c
> +++ b/drivers/gpu/drm/tegra/gem.c
> @@ -440,13 +440,6 @@ static struct tegra_bo *tegra_bo_import(struct drm_device *drm,
>  		err = tegra_bo_iommu_map(tegra, bo);
>  		if (err < 0)
>  			goto detach;
> -	} else {
> -		if (bo->sgt->nents > 1) {
> -			err = -EINVAL;
> -			goto detach;
> -		}
> -
> -		bo->iova = sg_dma_address(bo->sgt->sgl);
>  	}
>  
>  	bo->gem.import_attach = attach;
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

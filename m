Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C073E110371
	for <lists+linux-tegra@lfdr.de>; Tue,  3 Dec 2019 18:28:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726195AbfLCR2F (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 3 Dec 2019 12:28:05 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:53915 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726592AbfLCR2F (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 3 Dec 2019 12:28:05 -0500
Received: by mail-wm1-f65.google.com with SMTP id u18so3801423wmc.3
        for <linux-tegra@vger.kernel.org>; Tue, 03 Dec 2019 09:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=D8A7wkrhql6WKp7QUE2j3DPhuCaIOinsH690GSnBlRo=;
        b=MNxdE9+s7frhMLrwjm4fX3cJ3UT68IVlVeUELRTHCxKktgqrjDokR8nS2ROeXOAqUn
         oHyYsCGHSM/iqv3S24tu04yz+kbb0DKsYarTNYzJSDztf+cfrskgc+woZ72yyNv/di6L
         JCN2zjDFxOnCHiBGDOgl8ytbA2PfE8zY3m91Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=D8A7wkrhql6WKp7QUE2j3DPhuCaIOinsH690GSnBlRo=;
        b=Q6tH+jkhgia9sGu2eDF3IuzO78i+Ikn2NpjT8b9ZkXla7atZ5j3EWSjtjJjDqb4rLH
         27iKbQ+W8R9D5y7fZyh0rkfvtMN+eD8PcQcQCHVUEHihgg504xC26OwSWo5efHvzgi7i
         qpPeXXPJ4Xw67M7V+jiX6i2dkzhvw4yHefNQUScRuQKTi54/AYllFxlJmdv0o/3fWQYt
         C2Y0tLVmGQeuW86ntlFUA5DuFpiwIv0ESa0dfRlO9rdWogfQDoR9W+Bo9LNLo3bFUZI/
         3OBjg4wLOVC/DHMFO03WwKpzPivnF7DPOlMhgr9PZL3ubaSw2wk60Qd0HK3zPs7qjHuO
         e70w==
X-Gm-Message-State: APjAAAV6uNW50s1DW60Ld02IsLUs4LbCMeG4cZBrmRKbS+PazsOwhveH
        VzA5JxWkxQfW+STIr/XsEW+jCQ==
X-Google-Smtp-Source: APXvYqxe1dTXJobEAA2aYN5iowzW+UAv1FJbl3EGLloZcEJhKBb93RwSmCuojyPx0N2zVcKcfBI8vQ==
X-Received: by 2002:a1c:5603:: with SMTP id k3mr38150075wmb.150.1575394083288;
        Tue, 03 Dec 2019 09:28:03 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net. [212.51.149.96])
        by smtp.gmail.com with ESMTPSA id m10sm4529756wrx.19.2019.12.03.09.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2019 09:28:02 -0800 (PST)
Date:   Tue, 3 Dec 2019 18:28:00 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 2/3] drm/cma-helper: Use sgt_dma_contiguous() helper
Message-ID: <20191203172800.GJ624164@phenom.ffwll.local>
References: <20191203163203.1486837-1-thierry.reding@gmail.com>
 <20191203163203.1486837-2-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191203163203.1486837-2-thierry.reding@gmail.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Dec 03, 2019 at 05:32:02PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Functionality to count the number of contiguous DMA chunks in an SG
> table has been added to the scatterlist library. Use this functionality
> to replace an open-coded version in the GEM/CMA helpers.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>

On the first 2 patches:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/drm_gem_cma_helper.c | 22 ++--------------------
>  1 file changed, 2 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm_gem_cma_helper.c
> index 12e98fb28229..5bbae9654cc6 100644
> --- a/drivers/gpu/drm/drm_gem_cma_helper.c
> +++ b/drivers/gpu/drm/drm_gem_cma_helper.c
> @@ -471,26 +471,8 @@ drm_gem_cma_prime_import_sg_table(struct drm_device *dev,
>  {
>  	struct drm_gem_cma_object *cma_obj;
>  
> -	if (sgt->nents != 1) {
> -		/* check if the entries in the sg_table are contiguous */
> -		dma_addr_t next_addr = sg_dma_address(sgt->sgl);
> -		struct scatterlist *s;
> -		unsigned int i;
> -
> -		for_each_sg(sgt->sgl, s, sgt->nents, i) {
> -			/*
> -			 * sg_dma_address(s) is only valid for entries
> -			 * that have sg_dma_len(s) != 0
> -			 */
> -			if (!sg_dma_len(s))
> -				continue;
> -
> -			if (sg_dma_address(s) != next_addr)
> -				return ERR_PTR(-EINVAL);
> -
> -			next_addr = sg_dma_address(s) + sg_dma_len(s);
> -		}
> -	}
> +	if (!sgt_dma_contiguous(sgt))
> +		return ERR_PTR(-EINVAL);
>  
>  	/* Create a CMA GEM buffer. */
>  	cma_obj = __drm_gem_cma_create(dev, attach->dmabuf->size);
> -- 
> 2.23.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

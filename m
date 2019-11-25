Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5EC1108B3F
	for <lists+linux-tegra@lfdr.de>; Mon, 25 Nov 2019 10:59:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727266AbfKYJ7C (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 25 Nov 2019 04:59:02 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:38105 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727215AbfKYJ7B (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 25 Nov 2019 04:59:01 -0500
Received: by mail-wm1-f68.google.com with SMTP id z19so15177725wmk.3
        for <linux-tegra@vger.kernel.org>; Mon, 25 Nov 2019 01:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=RytT+Xlg2zwjd5/rWVHWfbTDAmStLDWv3M1yjnojE3U=;
        b=KgSNpWPVNIzk8oVGblVDJPIyLV8Tvg3NwMbmRA2iL/fkfjyFbK9mZhINTIKxcq5CRj
         jZqLQAHPsoYm6Y+5NOYrBwIEqCDXWhjU4AcBTegsTfOOTd0MGGd1EdEh7jj52ExTz9tO
         QYgykHpq7NpbW5YDMbppiNWBfYahp2KwNOloY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=RytT+Xlg2zwjd5/rWVHWfbTDAmStLDWv3M1yjnojE3U=;
        b=XjcF9lGDnueyx3O8iXOLIbmoXT+hiNFiBDAnbP2YJFjBjGsnSU4ZE04bEdj+DWme/N
         6n74cH/IdzgMNDoqZmovaHniRfJrhCrBN3h41iVFwtzsnG64BG4mnFopo8XS3bI3IsG4
         5Mfns4PWW5hPJbdE42SPneUOcZLLw3n7bSzhPCqZbl4E4DJYwoRFKeBRzZ2U2nACfG1i
         ywHlHnHDUFItTCxwIC20hitUHZIpoGduKkGioDpfiCZxT55Dagwo9pBjqfQbDtPcTNzl
         0ML3ER1ekHtTBXXH317PQlJTwDUX4AyK5WK9K+gvkHxOx+5LfKZiZLJN2e1m07V9RyOM
         byNQ==
X-Gm-Message-State: APjAAAUKankzqaGz7yO+XtmkvNXUOIlTWYNIpz9P39s45IT341jBR344
        AYAZc8hWK2JfAnyrv3LSLxCEcw==
X-Google-Smtp-Source: APXvYqzLDTJrNEwQ/ZrVL7+V6EZkvZPN4om4OnDUZ9ha6jvddPlXuAMyayJY8OMea5W5SSGJyj5MvA==
X-Received: by 2002:a05:600c:2105:: with SMTP id u5mr27068564wml.47.1574675939137;
        Mon, 25 Nov 2019 01:58:59 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net. [212.51.149.96])
        by smtp.gmail.com with ESMTPSA id z7sm7722026wma.46.2019.11.25.01.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2019 01:58:58 -0800 (PST)
Date:   Mon, 25 Nov 2019 10:58:56 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 01/15] drm/tegra: Map cmdbuf once for reloc processing
Message-ID: <20191125095856.GL29965@phenom.ffwll.local>
References: <20191118103536.17675-1-daniel.vetter@ffwll.ch>
 <20191118103536.17675-2-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191118103536.17675-2-daniel.vetter@ffwll.ch>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Nov 18, 2019 at 11:35:22AM +0100, Daniel Vetter wrote:
> A few reasons to drop kmap:
> 
> - For native objects all we do is look at obj->vaddr anyway, so might
>   as well not call functions for every page.
> 
> - Reloc-processing on dma-buf is ... questionable.
> 
> - Plus most dma-buf that bother kernel cpu mmaps give you at least
>   vmap, much less kmaps. And all the ones relevant for arm-soc are
>   again doing a obj->vaddr game anyway, there's no real kmap going on
>   on arm it seems.
> 
> Plus this seems to be the only real in-tree user of dma_buf_kmap, and
> I'd like to get rid of that.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: linux-tegra@vger.kernel.org

Ping for testing/review on these first 2 tegra patches. They're holding up
the entire series, and I got acks for all the other bits surprisingly
fast. So would like to land this rather sooner than later. I'm also
working on a lot more dma-buf patches ...

Thanks, Daniel

> ---
>  drivers/gpu/host1x/job.c | 21 +++++++--------------
>  1 file changed, 7 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
> index 25ca54de8fc5..60b2fedd0061 100644
> --- a/drivers/gpu/host1x/job.c
> +++ b/drivers/gpu/host1x/job.c
> @@ -244,8 +244,7 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
>  
>  static int do_relocs(struct host1x_job *job, struct host1x_job_gather *g)
>  {
> -	u32 last_page = ~0;
> -	void *cmdbuf_page_addr = NULL;
> +	void *cmdbuf_addr = NULL;
>  	struct host1x_bo *cmdbuf = g->bo;
>  	unsigned int i;
>  
> @@ -267,28 +266,22 @@ static int do_relocs(struct host1x_job *job, struct host1x_job_gather *g)
>  			goto patch_reloc;
>  		}
>  
> -		if (last_page != reloc->cmdbuf.offset >> PAGE_SHIFT) {
> -			if (cmdbuf_page_addr)
> -				host1x_bo_kunmap(cmdbuf, last_page,
> -						 cmdbuf_page_addr);
> +		if (!cmdbuf_addr) {
> +			cmdbuf_addr = host1x_bo_mmap(cmdbuf);
>  
> -			cmdbuf_page_addr = host1x_bo_kmap(cmdbuf,
> -					reloc->cmdbuf.offset >> PAGE_SHIFT);
> -			last_page = reloc->cmdbuf.offset >> PAGE_SHIFT;
> -
> -			if (unlikely(!cmdbuf_page_addr)) {
> +			if (unlikely(!cmdbuf_addr)) {
>  				pr_err("Could not map cmdbuf for relocation\n");
>  				return -ENOMEM;
>  			}
>  		}
>  
> -		target = cmdbuf_page_addr + (reloc->cmdbuf.offset & ~PAGE_MASK);
> +		target = cmdbuf_addr + reloc->cmdbuf.offset;
>  patch_reloc:
>  		*target = reloc_addr;
>  	}
>  
> -	if (cmdbuf_page_addr)
> -		host1x_bo_kunmap(cmdbuf, last_page, cmdbuf_page_addr);
> +	if (cmdbuf_addr)
> +		host1x_bo_munmap(cmdbuf, cmdbuf_addr);
>  
>  	return 0;
>  }
> -- 
> 2.24.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

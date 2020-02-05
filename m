Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74209153688
	for <lists+linux-tegra@lfdr.de>; Wed,  5 Feb 2020 18:31:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727129AbgBERbd (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 5 Feb 2020 12:31:33 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:39398 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726822AbgBERbc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 5 Feb 2020 12:31:32 -0500
Received: by mail-wm1-f66.google.com with SMTP id c84so3813836wme.4
        for <linux-tegra@vger.kernel.org>; Wed, 05 Feb 2020 09:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3+G4L0nu1D0Q6pMcq/IX3V+VgIqHzMV1kGIvbLHlTec=;
        b=Fy/1wO77sdjmG0zHBvfsHGI9IJ8C1CHba2/tz6D/aMBte2RAWpAj3IvS2Jl+c38rvO
         xv59AN5gXH6U3Bc49vm4TPTZb9gkx+eoQbEgRe0suIog9+r+SPENxuCUxu5cyx+ptCnL
         6hUmSk2uXwMkSaSvMb/TkrsFtA0G4VVYa/E4f1KbG4H9+ZOfrFIrh+Xbm6zzWucz0Hu/
         5DMBEqwVJMUWrrh1y3eZBnZZq6rMxY1rqAz/w9McvgxgKJIsEw3C9K2Ypj9tDFx+hikU
         QVFad8NRjNx1jXZpZB0Zelv+8gaOt5d+vwf4X9WqUogejm6s7Wl2o6Wr57TtpThqnuFv
         SBdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3+G4L0nu1D0Q6pMcq/IX3V+VgIqHzMV1kGIvbLHlTec=;
        b=KM0NZvDtLtd9ril59KsicQNQDFixi32CK3Dkb+QzpTpKRlBjqu8oYs9iSzyVBW0VKR
         h99XZMmTVXNP0JqHk7rwLV4YMze9Hxw+Exk6ligVq05xohLiWiL4HEU7LATPTkke0sML
         N1tJV53uNWJK6QFd/UOpH0MC7FZK05e6EywQ8kAOsIgrNatDNsOnjCAbVUs8FooQZBsS
         eB814kPi9lHZ/6FDHxxTc5eurtTTxvFIdRz1fOKj55MRf8SnYcPrchZeSuuLMGAZfAPv
         NV+BfrCgSVJ5VVqL35K1AT/FYR9S0bM6OeYBwnk4c7OMbkO0VcpG9u9uVKgdpQZod10B
         5j/g==
X-Gm-Message-State: APjAAAU7yT19852F4lNLAyjVzfrAhQKUVMTGVwuIBc+09qRirRRzsu+P
        KLJKR2ne3j7gqt7fejh/ZeA=
X-Google-Smtp-Source: APXvYqz5os9R/Em7Wqo9EBKwg7FPNUtmnxkdcKXSO8U2jaTJARDrd5wyX18IGgTzZbObowv/54BZQA==
X-Received: by 2002:a1c:688a:: with SMTP id d132mr7309480wmc.189.1580923890585;
        Wed, 05 Feb 2020 09:31:30 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id z3sm625034wrs.32.2020.02.05.09.31.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2020 09:31:30 -0800 (PST)
Subject: Re: [PATCH 3/3] gpu: host1x: Set DMA direction only for DMA-mapped
 buffer objects
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20200204135926.1156340-1-thierry.reding@gmail.com>
 <20200204135926.1156340-4-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <b3871ad5-39e6-9376-6631-30c1be4bc3dd@gmail.com>
Date:   Wed, 5 Feb 2020 20:31:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200204135926.1156340-4-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

04.02.2020 16:59, Thierry Reding пишет:
> From: Thierry Reding <treding@nvidia.com>
> 
> The DMA direction is only used by the DMA API, so there is no use in
> setting it when a buffer object isn't mapped with the DMA API.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/gpu/host1x/job.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
> index 8198a4d42c77..a10643aa89aa 100644
> --- a/drivers/gpu/host1x/job.c
> +++ b/drivers/gpu/host1x/job.c
> @@ -248,6 +248,7 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
>  				goto unpin;
>  			}
>  
> +			job->unpins[job->num_unpins].dir = DMA_TO_DEVICE;
>  			job->unpins[job->num_unpins].dev = host->dev;
>  			phys_addr = sg_dma_address(sgt->sgl);
>  		}
> @@ -255,7 +256,6 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
>  		job->addr_phys[job->num_unpins] = phys_addr;
>  		job->gather_addr_phys[i] = phys_addr;
>  
> -		job->unpins[job->num_unpins].dir = DMA_TO_DEVICE;
>  		job->unpins[job->num_unpins].bo = g->bo;
>  		job->unpins[job->num_unpins].sgt = sgt;
>  		job->num_unpins++;
> 


Reviewed-by: Dmitry Osipenko <digetx@gmail.com>

Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC6793A584
	for <lists+linux-tegra@lfdr.de>; Sun,  9 Jun 2019 14:49:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728496AbfFIMtB (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 9 Jun 2019 08:49:01 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:41160 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728319AbfFIMtB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 9 Jun 2019 08:49:01 -0400
Received: by mail-lj1-f194.google.com with SMTP id s21so5511867lji.8
        for <linux-tegra@vger.kernel.org>; Sun, 09 Jun 2019 05:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HTkijLgHpahbU8iPdZoCkCjwTACeSfhcFyc/UqmC25A=;
        b=KxJshuGvHEVpki2MbV+pkHZOdg2TWxsmTSYjfZtsluih4PmS3MDoQB1dvyK2g7GrrI
         AKeNl0WVOF8GF7wMOuRS9UwzFVt8or4KO9kRW30XCreXf5NmXRuEZx/G5mGb/YzXxIXR
         JomFEIAckOmu0lYL5UYpynZqgZGJxm+3c/nOjo09FnStWYfCiiKZLQoG3+/Yiv5TzzHR
         kaVmTMSHzJxEMoQu28lgk4Y9BBR0++deSiXH0cHljXCeCd0ljmfhRo7ZE59M83Pt5g2B
         0tvlvTXWFO42rTm1m+30ajkITwqPyUHYw4I9VlDK12X1rjeHqE5aZew+aImIyOHyQ7nb
         yxbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HTkijLgHpahbU8iPdZoCkCjwTACeSfhcFyc/UqmC25A=;
        b=daekFsnj6OsocWFqaPM9M9q3HGHqcrULTDQK1rIixUtGnPePmiF5IGQxoMoEZNd7W7
         3UCe0B+hlfecPJfXSkRb6R4l4533Wb2lEXFeOIQ1Efvjq0l814yWRWWQ9kxCPgCi669K
         FcYjtkJfdFgbQK0Bae3tZJV5egSgHwpqEWrPSNXHiD4i8lkAFo04dKRJZSj5pH3c331I
         bWEgHvJjSZKNydMNJpuQMcwGDgb9mqcB07NPf7sG5rNNf+31/qnBqgrdX5WEcuOdT1Ic
         0odot5mqHdRD7uKp+Zc3bBZhkn3128RLZEvSF2bDvlgfcQeqonyFDA60lmzOgJnxA1Jh
         H+QQ==
X-Gm-Message-State: APjAAAUOg/Bm8xldRIZdBHdH5S7Bbsf4f3m0K8XAFNShBgdcxAgQQrdq
        ggFCE5HIL0RiHg3sWHBYFVM=
X-Google-Smtp-Source: APXvYqzp5SzfrKd+porFnoOVyQH/+AhmpmjU35QDywWYnFsIU3oCoTHdsxV6HbGtXwJDQPo2m2f28Q==
X-Received: by 2002:a2e:8716:: with SMTP id m22mr33471188lji.128.1560084539423;
        Sun, 09 Jun 2019 05:48:59 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-79-162-197.pppoe.mtu-net.ru. [91.79.162.197])
        by smtp.googlemail.com with ESMTPSA id f4sm1367381ljm.13.2019.06.09.05.48.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 09 Jun 2019 05:48:58 -0700 (PDT)
Subject: Re: [PATCH] gpu: host1x: Increase maximum DMA segment size
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20190605084605.12225-1-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <db06ce74-6051-8bb4-555d-505f8d3baa85@gmail.com>
Date:   Sun, 9 Jun 2019 15:48:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190605084605.12225-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

05.06.2019 11:46, Thierry Reding пишет:
> From: Thierry Reding <treding@nvidia.com>
> 
> Recent versions of the DMA API debug code have started to warn about
> violations of the maximum DMA segment size. This is because the segment
> size defaults to 64 KiB, which can easily be exceeded in large buffer
> allocations such as used in DRM/KMS for framebuffers.
> 
> Technically the Tegra SMMU and ARM SMMU don't have a maximum segment
> size (they map individual pages irrespective of whether they are
> contiguous or not), so the choice of 4 MiB is a bit arbitrary here. The
> maximum segment size is a 32-bit unsigned integer, though, so we can't
> set it to the correct maximum size, which would be the size of the
> aperture.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/gpu/host1x/bus.c | 3 +++
>  include/linux/host1x.h   | 2 ++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
> index 9797ccb0a073..6387302c1245 100644
> --- a/drivers/gpu/host1x/bus.c
> +++ b/drivers/gpu/host1x/bus.c
> @@ -414,6 +414,9 @@ static int host1x_device_add(struct host1x *host1x,
>  
>  	of_dma_configure(&device->dev, host1x->dev->of_node, true);
>  
> +	device->dev.dma_parms = &device->dma_parms;
> +	dma_set_max_seg_size(&device->dev, SZ_4M);
> +
>  	err = host1x_device_parse_dt(device, driver);
>  	if (err < 0) {
>  		kfree(device);
> diff --git a/include/linux/host1x.h b/include/linux/host1x.h
> index cfff30b9a62e..e6eea45e1154 100644
> --- a/include/linux/host1x.h
> +++ b/include/linux/host1x.h
> @@ -297,6 +297,8 @@ struct host1x_device {
>  	struct list_head clients;
>  
>  	bool registered;
> +
> +	struct device_dma_parameters dma_parms;
>  };
>  
>  static inline struct host1x_device *to_host1x_device(struct device *dev)
> 

Just a very minor nit:

It may be worthwhile to include "dma-mapping.h" directly for consistency
here as well since nothing includes it directly. I noticed a build
breakage of the grate-driver's kernel on a rebase with "git --exec
'make..'" cause we have some of "iommu/iova" headers that are moved
around in the intermediate patches.

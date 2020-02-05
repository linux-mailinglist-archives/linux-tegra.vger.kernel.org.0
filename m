Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1FB01535F7
	for <lists+linux-tegra@lfdr.de>; Wed,  5 Feb 2020 18:11:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727054AbgBERLj (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 5 Feb 2020 12:11:39 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:36181 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726534AbgBERLj (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 5 Feb 2020 12:11:39 -0500
Received: by mail-wr1-f67.google.com with SMTP id z3so3700625wru.3
        for <linux-tegra@vger.kernel.org>; Wed, 05 Feb 2020 09:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=MTv2PSuf1Uc/JHb6LnA1Xxmg2Wdn+nQXuJIGsPAwmo4=;
        b=uWjs2v207Ck0qvvSxNqMlx3S/W+rqpHNhfcnIk4xvU4/BZfyiEbKzgB8Ob71VFtjnR
         b/yct4A74mghlneZ2JEmVqPUEpEfPhnX2RgU4POJulaGiF8fxHjDc1zaSeRT5BX3BHjt
         jV6CH0QtZe2HzlSnxiniylfpnXEp6pvA/Y4lAequl28H/lrNfsajI53eTb3HKd/MeLH7
         uZ8Ak0oO8o0lYFGM7Og5rM0zqepgh1vz7TOZbeZ8HVAwzxNBPI61NDxz0Nr1UaB3OAOB
         rtlOC/9Dj8uroq739ZbTDSKdE9ZkgogXHARXeeCXzabk1K8tB/9SYvXP544gPTL265C7
         LNCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MTv2PSuf1Uc/JHb6LnA1Xxmg2Wdn+nQXuJIGsPAwmo4=;
        b=SOjVPldRReKlhC9RRJGsbUeu1s8vO9xMXGCr2Yqgh2Y1DmXSK1FzrfIjkLkRW0bdGh
         umnhGIMsLJvAsTFh1b6KPqDL2mg6hbrslivyD8lAp4HNeCY6n7VUEVMwUz+SM/j21pok
         81lmGw1QwMNP06djnRHTvEtPJN1ONUsdcPdy5m8pJGOWZY+yZuUWh5782Xu0erLxmFy0
         HfiFR3Nyv7SQc7tHyF+0vil5tPSbISCI93zrgznOmaCQY7ewYCrXWjCFEw7HWIF8Xb2S
         /3jX0AU8Sz14yeCXBP7H1tah+qFNUoaQWpmCV2tuzb+7Qi4sBBV9LJrY/34alAwrFm+r
         Dbhw==
X-Gm-Message-State: APjAAAXDCTrFFkB5gu5T/fxXoIQJRB0SOyijKHbBYh6OiDBCAPlYwwYF
        tpCD004Ca9KB7RB+camSKD/mEYgI
X-Google-Smtp-Source: APXvYqxxqC1qYOGATMdi3kZeuh4fgfzDH0kf9FxlHYPQ71dXAAyaj36hCaGqFVz/GLvZadlpRpdLaQ==
X-Received: by 2002:adf:f3d1:: with SMTP id g17mr28021014wrp.378.1580922697098;
        Wed, 05 Feb 2020 09:11:37 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id t5sm540595wrr.35.2020.02.05.09.11.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2020 09:11:36 -0800 (PST)
Subject: Re: [PATCH 2/3] drm/tegra: Reuse IOVA mapping where possible
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20200204135926.1156340-1-thierry.reding@gmail.com>
 <20200204135926.1156340-3-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <85912bac-6c67-5865-e78e-444720669005@gmail.com>
Date:   Wed, 5 Feb 2020 20:11:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200204135926.1156340-3-thierry.reding@gmail.com>
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
> This partially reverts the DMA API support that was recently merged
> because it was causing performance regressions on older Tegra devices.
> Unfortunately, the cache maintenance performed by dma_map_sg() and
> dma_unmap_sg() causes performance to drop by a factor of 10.
> 
> The right solution for this would be to cache mappings for buffers per
> consumer device, but that's a bit involved. Instead, we simply revert to
> the old behaviour of sharing IOVA mappings when we know that devices can
> do so (i.e. they share the same IOMMU domain).
> 
> Reported-by: Dmitry Osipenko <digetx@gmail.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/gem.c   | 10 +++++++-
>  drivers/gpu/drm/tegra/plane.c | 44 ++++++++++++++++++++---------------
>  drivers/gpu/host1x/job.c      | 32 ++++++++++++++++++++++---
>  3 files changed, 63 insertions(+), 23 deletions(-)

Tested-by: Dmitry Osipenko <digetx@gmail.com>

Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 651F2153648
	for <lists+linux-tegra@lfdr.de>; Wed,  5 Feb 2020 18:23:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727079AbgBERXk (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 5 Feb 2020 12:23:40 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:36179 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726748AbgBERXk (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 5 Feb 2020 12:23:40 -0500
Received: by mail-wm1-f66.google.com with SMTP id p17so3805922wma.1
        for <linux-tegra@vger.kernel.org>; Wed, 05 Feb 2020 09:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=A2hArrIs7diojTAKvNGfoYfYB84gNwSigBSUOyxD8CM=;
        b=YB9BrGSv/ao+ZsAhPjoVM+z2X3+j3Aw+GZzcuNujO2RHfSHVk9OgVqkCjY7aYrjAUu
         WWK7L60M/On35jkTEESrH/ONg/mawslR6EX32XG9mKlQ1xpWWoACBYN3zox1I3/shEQI
         w+GoQuKWTprvB2EldWeDfrL7gR+YEpdiVHH3D3iaS6y2qfsUfVu5aARMVDp7EzL/BmYw
         hiUk43RHOpGCByJq9dE/R2OP5zXeKpLXj9LEQi9XkbLBNC3A4zZ0L41nTdwEWkTV20Pf
         uVx9rFBUU9e4J6HHHg5N5oVrHE+I1EoEuhiiUbSRaIyEFrCMnouPYS9mMi9uJ0RWSbWA
         LGKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=A2hArrIs7diojTAKvNGfoYfYB84gNwSigBSUOyxD8CM=;
        b=uhd/TrNtSjblKOzFls3dWrRlPBRwMk2PjJXBFhwVRfNU5BHYza/T+ztvR5WN6NfH30
         tbOUfCUxKKK4exDmlY2XCOSJsuR/4n73g+9z8zYBVR1EfECW/yD0j1c1JvcrYot3rQZO
         2fqief/c5qFyLZc4ELlEkju6/cpRE39HiCtOcWIoVJOyfQH75gCfHAne2PaREbK5MUIB
         RAHeclzjHUZzM/7F+mgauI11d2GYa6Hov73i9aFgz2OAxhmnFTopOoGq5U+ZDzYtByc2
         GW0lwQN0ZrqhEJzilpL+/N16sI7euGjp2NtfgjnR/PF6eqiCViQMpve55FTdsehdrJh5
         clNw==
X-Gm-Message-State: APjAAAWovje4KuO7PuB4kxC8atme8SZFpZt46wXjgvrvLF9pEv4FZBPe
        Sf2hk6wfz3PBgJmKl9evy2u1g58B
X-Google-Smtp-Source: APXvYqxxTkWHHEXJk5kLdF48f4JwITeLRM3BpM0/dhK/F4VNDkgzT8HlLw5TkeqFLc4OCSKgHiX5mw==
X-Received: by 2002:a05:600c:251:: with SMTP id 17mr6720398wmj.59.1580923418105;
        Wed, 05 Feb 2020 09:23:38 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id v14sm653022wrm.28.2020.02.05.09.23.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2020 09:23:37 -0800 (PST)
Subject: Re: [PATCH 2/3] drm/tegra: Reuse IOVA mapping where possible
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20200204135926.1156340-1-thierry.reding@gmail.com>
 <20200204135926.1156340-3-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <34fad3cf-b187-e80e-8654-d2a85b061734@gmail.com>
Date:   Wed, 5 Feb 2020 20:23:36 +0300
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

Needs a stable tag:

Cc: <stable@vger.kernel.org> # v5.5

> Reported-by: Dmitry Osipenko <digetx@gmail.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/gem.c   | 10 +++++++-
>  drivers/gpu/drm/tegra/plane.c | 44 ++++++++++++++++++++---------------
>  drivers/gpu/host1x/job.c      | 32 ++++++++++++++++++++++---
>  3 files changed, 63 insertions(+), 23 deletions(-)

Otherwise LGTM,

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>

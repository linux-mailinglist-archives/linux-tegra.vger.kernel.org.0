Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E25ED1421A7
	for <lists+linux-tegra@lfdr.de>; Mon, 20 Jan 2020 03:53:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728988AbgATCxL (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 19 Jan 2020 21:53:11 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:45280 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728949AbgATCxL (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 19 Jan 2020 21:53:11 -0500
Received: by mail-lf1-f68.google.com with SMTP id 203so22766139lfa.12
        for <linux-tegra@vger.kernel.org>; Sun, 19 Jan 2020 18:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=o99oVRR+Gozy0Lsfxk3TOE1JXeY9TtYm9oIacziyd+c=;
        b=Fmg3r5zJwmStvkvSE6CYIx5DAV7ue5NoH+pbDkw2RCK/0qIIm3L9yfzzr3AoIdLpz+
         G25EYju2wW16V0B7bO7QpaHdy/27UCuh0hEEHzX230R0aIITAzM8XCEVGBwNUySMd/Qp
         rSx1NPmEEErdn5/rG13XfVLV10ep8C0ggu+0X+Gfj9puUXRtuPm8+ZGJ96LpJCKfCnBi
         FqYgQlSG5mgj1St1XqDEbO+Xc3APjbg2KJ1CR7KpbuJmlTAl+5mMEMIKRq/BiS0enyXz
         5RI6jiU4Y9sdLgAF/Ze2Faq+njZdk+eKuKl8oeEHJAn2Pm79oITGdxlvsg1+ELeVmtjP
         tYog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=o99oVRR+Gozy0Lsfxk3TOE1JXeY9TtYm9oIacziyd+c=;
        b=oF65ncmgg5zg29/4Jiey1aqyxW3SNCXtj5rK26P8jClpu/sK8XFvV3cUVEE6QejQnF
         HewYbVHFdx25pFKYMK9b3fTwZvxkRl1Z+Sk8N0xKFQFXQD5Wuuus0DYxDBaHHjTT1ryG
         ZYKYxXlYAoI5TTN346A2w4kFh4kaHtj/+0BtoYESh7WGcZDngEIE4icQSYwTaCJk+Oit
         qM3DR3iFRRRWmfkxobcyNOhrp/Z6jZ8INsVikyIYuMVNNWgz5Eke74qFMeNs89ysrywd
         ohxEZabGh4G6jdbYLjE+jHwnuNpS9OUo0gkTJENUd2Pmk+u2Z5KkKbuIbsPkk0SjGaS1
         ZxMw==
X-Gm-Message-State: APjAAAXpRcdoa0gIJdVIW1KPEkEucV6/zEuKOzZzHjIdCc4rUezwCE3J
        v/xqgaUeVsr5W2DECxLVdvc=
X-Google-Smtp-Source: APXvYqzK9wX6F5+UIF2TOH7GYUJkjQCAQ7oXKTcxm1fHMOG1qsv0TifemPYWTMw5ZN0JpzXnVZTyZg==
X-Received: by 2002:a19:491a:: with SMTP id w26mr11569593lfa.98.1579488787677;
        Sun, 19 Jan 2020 18:53:07 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id b190sm15987206lfd.39.2020.01.19.18.53.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jan 2020 18:53:06 -0800 (PST)
Subject: Re: [Regression 5.5-rc1] Extremely low GPU performance on NVIDIA
 Tegra20/30
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>
References: <a2c9eb65-c600-bf49-2c32-bddf7b44f784@gmail.com>
 <20191213151045.GB222809@ulmo>
 <d03876b8-b0d1-850b-7ae8-a61302e23843@gmail.com>
Message-ID: <2f5c6fda-adf9-c6c3-7601-fa912813ce1f@gmail.com>
Date:   Mon, 20 Jan 2020 05:53:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <d03876b8-b0d1-850b-7ae8-a61302e23843@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

13.12.2019 18:35, Dmitry Osipenko пишет:
> 13.12.2019 18:10, Thierry Reding пишет:
>> On Fri, Dec 13, 2019 at 12:25:33AM +0300, Dmitry Osipenko wrote:
>>> Hello Thierry,
>>>
>>> Commit [1] introduced a severe GPU performance regression on Tegra20 and
>>> Tegra30 using.
>>>
>>> [1]
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v5.5-rc1&id=fa6661b7aa0b52073681b0d26742650c8cbd30f3
>>>
>>> Interestingly the performance is okay on Tegra30 if
>>> CONFIG_TEGRA_HOST1X_FIREWALL=n, but that doesn't make difference for
>>> Tegra20.
>>>
>>> I was telling you about this problem on the #tegra IRC sometime ago and
>>> you asked to report it in a trackable form, so finally here it is.
>>>
>>> You could reproduce the problem by running [2] like this
>>> `grate/texture-filter -f -s` which should produce over 100 FPS for 720p
>>> display resolution and currently it's ~11 FPS.
>>>
>>> [2]
>>> https://github.com/grate-driver/grate/blob/master/tests/grate/texture-filter.c
>>>
>>> Previously I was seeing some memory errors coming from Host1x DMA, but
>>> don't see any errors at all right now.
>>>
>>> I don't see anything done horribly wrong in the offending commit.
>>>
>>> Unfortunately I couldn't dedicate enough time to sit down and debug the
>>> problem thoroughly yet. Please let me know if you'll find a solution,
>>> I'll be happy to test it. Thanks in advance!
>>
>> I suspect that the problem here is that we're now using the DMA API,
>> which causes the 32-bit ARM DMA/IOMMU glue to be used. I vaguely recall
>> that that code doesn't coalesce entries in the SG table, so we may end
>> up calling iommu_map() a lot of times, and miss out on much of the
>> advantages that the ->iotlb_sync_map() gives us on Tegra20.
>>
>> At the same time dma_map_sg() will flush caches, which we didn't do
>> before. This we should be able to improve by passing the attribute
>> DMA_ATTR_SKIP_CPU_SYNC to dma_map_sg() when we know that the cache
>> maintenance isn't needed.
>>
>> And while thinking about it, one other difference is that with the DMA
>> API we actually map/unmap the buffers for every submission. This is
>> because the DMA API semantics require that buffers be mapped/unmapped
>> every time you use them. Previously we would basically only map each
>> buffer once (at allocation time) and only have to deal with cache
>> maintenance, so the overhead per submission was drastically lower.
>>
>> If DMA_ATTR_SKIP_CPU_SYNC doesn't give us enough of an improvement, we
>> may want to restore explicit IOMMU usage, at least on anything prior to
>> Tegra124 where we're unlikely to ever use different IOMMU domains anyway
>> (because they are such a scarce resource).
> 
> Tegra20 doesn't use IOMMU in a vanilla upstream kernel (yet), so I don't
> think that it's the root of the problem. Disabling IOMMU for Tegra30
> also didn't help (IIRC).
> 
> The offending patch shouldn't change anything in regards to the DMA API,
> if I'm not missing something. Strange..
> 
> Please keep me up-to-date!
> 

Hello Thierry,

I took another look at the problem and here what was found:

1) The "Optionally attach clients to the IOMMU" patch is wrong because:

    1. host1x_drm_probe() is invoked *before* any of the
       host1x_client_iommu_attach() happens, so there is no way
       on earth the 'use_explicit_iommu' could ever be true.

    2. Not attaching DRM clients to IOMMU if HOST1x isn't
       attached is wrong because it never attached in the case
       of CONFIG_TEGRA_HOST1X_FIREWALL=y [1] and this also
       makes no sense for T20/30 that do not support LPAE.

[1]
https://elixir.bootlin.com/linux/v5.5-rc6/source/drivers/gpu/host1x/dev.c#L205

2) Because of the above problems, the DRM clients are erroneously not
getting attached to IOMMU at all and thus CMA is getting used for the BO
allocations. Here comes the problems introduced by the "gpu: host1x:
Support DMA mapping of buffers" patch, which makes DMA API to perform
CPU cache maintenance on each job submission and apparently this is
super bad for performance. This also makes no sense in comparison to the
case of enabled IOMMU, where cache maintenance isn't performed at all
(like it should be).

Please let me know if you're going to fix the problems or if you'd
prefer me to create the patches.

Here is a draft of the fix for #2, it doesn't cover case of imported
buffers (which should be statically mapped, IIUC):

@@ -38,7 +38,7 @@ static struct sg_table *tegra_bo_pin(struct device
*dev, struct host1x_bo *bo,
         * If we've manually mapped the buffer object through the IOMMU,
make
         * sure to return the IOVA address of our mapping.
         */
-       if (phys && obj->mm) {
+       if (phys && (obj->mm || obj->vaddr)) {
                *phys = obj->iova;
                return NULL;
        }
diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
index 25ca54de8fc5..69adfd66196b 100644
--- a/drivers/gpu/host1x/job.c
+++ b/drivers/gpu/host1x/job.c
@@ -108,7 +108,7 @@ static unsigned int pin_job(struct host1x *host,
struct host1x_job *job)

        for (i = 0; i < job->num_relocs; i++) {
                struct host1x_reloc *reloc = &job->relocs[i];
-               dma_addr_t phys_addr, *phys;
+               dma_addr_t phys_addr;
                struct sg_table *sgt;

                reloc->target.bo = host1x_bo_get(reloc->target.bo);
@@ -117,12 +117,7 @@ static unsigned int pin_job(struct host1x *host,
struct host1x_job *job)
                        goto unpin;
                }

-               if (client->group)
-                       phys = &phys_addr;
-               else
-                       phys = NULL;
-
-               sgt = host1x_bo_pin(dev, reloc->target.bo, phys);
+               sgt = host1x_bo_pin(dev, reloc->target.bo, &phys_addr);
                if (IS_ERR(sgt)) {
                        err = PTR_ERR(sgt);
                        goto unpin;
@@ -184,7 +179,7 @@ static unsigned int pin_job(struct host1x *host,
struct host1x_job *job)
                        goto unpin;
                }

-               sgt = host1x_bo_pin(host->dev, g->bo, NULL);
+               sgt = host1x_bo_pin(host->dev, g->bo, &phys_addr);
                if (IS_ERR(sgt)) {
                        err = PTR_ERR(sgt);
                        goto unpin;
@@ -214,7 +209,7 @@ static unsigned int pin_job(struct host1x *host,
struct host1x_job *job)

                        job->unpins[job->num_unpins].size = gather_size;
                        phys_addr = iova_dma_addr(&host->iova, alloc);
-               } else {
+               } else if (sgt) {
                        err = dma_map_sg(host->dev, sgt->sgl, sgt->nents,
                                         DMA_TO_DEVICE);
                        if (!err) {

Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F1D514BD2A
	for <lists+linux-tegra@lfdr.de>; Tue, 28 Jan 2020 16:43:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726492AbgA1Pnk (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 28 Jan 2020 10:43:40 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:36742 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726384AbgA1Pnk (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 28 Jan 2020 10:43:40 -0500
Received: by mail-lf1-f67.google.com with SMTP id f24so9455083lfh.3
        for <linux-tegra@vger.kernel.org>; Tue, 28 Jan 2020 07:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=R5kBMh4d+jF6Iwky3860+MgFWMq82eO07pKtL2+tzsM=;
        b=a0Z8FyCOuJQvUGgNYXLxA+nsU5OiE2CApN7uYm1l2MMj+oLoMuD1Y4Dm2qLddOwL3U
         6y9LNcq4De2dvyrqkNpqYz30rmDHqy4ihIQ1DLsx/wyci8n9nJNyzynhGBG8nbHx1frl
         s9P7Y/RhODHOt5tugCfFjm7eSygyquDFqa/9dz8F4+JaOmJID6vaS4WMkCncnMfemrYF
         B4DurJqTDQhlA6usS0sDaRplkxl8k6DxD4pzhkq104NZKbYfK8VOxHdJ/+2BTdHvtVtR
         gRtu1FFZ4f/PsGclIIxlQ0M45/tZMn73eTGu59Yx0rcg5OINHONKBzoiFWnYaRFxIJjt
         hZvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=R5kBMh4d+jF6Iwky3860+MgFWMq82eO07pKtL2+tzsM=;
        b=LB1eB66ZGJDj9DRE5abftGKs9Al5Ej2DBgByoxJPr4H7Lluym27X4ar1BM3zk2qyjc
         U8bEslmvYLHnm4n0LkaBSw7iJaL+0jREH2b3fYyKIqKZQd2uDILojtyjFeOj8f4x52DC
         rxPmHVSuY27sZMJulwtHWzneEVeUnR7PdM4orQKM5ec3V6mhg12Po6bslu9yvotjg8yv
         k8NDWGvrWOK2wKHO6tkbERLGCv8JPmnrIrua5ISJ+6ceCXHpYgPVRRsBePCehWCIDl2f
         WYV5wi/RGsm1DBBEsFXPKboIZHE24yLfIlkndlFV0UTM6lBEvUPFvcaujuzCQHEJj9Uz
         k+qw==
X-Gm-Message-State: APjAAAVPLbnohi6U3biO6vg6BLeQSdqDkHi/8PP2y9hbyajvh4AuWA3U
        fU/N4taSoPnUJr8Fe8cBb60=
X-Google-Smtp-Source: APXvYqxF6M/0B/ST9lUthVvxoetkET/HLrNq11A1249kcdoCCadAHqoszgPAL/oVpnZHgMf2ehBP7A==
X-Received: by 2002:a19:3f07:: with SMTP id m7mr2748099lfa.61.1580226217514;
        Tue, 28 Jan 2020 07:43:37 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id f11sm12347370lfa.9.2020.01.28.07.43.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2020 07:43:36 -0800 (PST)
Subject: Re: [Regression 5.5-rc1] Extremely low GPU performance on NVIDIA
 Tegra20/30
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dave Airlie <airlied@gmail.com>
References: <a2c9eb65-c600-bf49-2c32-bddf7b44f784@gmail.com>
 <20191213151045.GB222809@ulmo>
 <d03876b8-b0d1-850b-7ae8-a61302e23843@gmail.com>
 <2f5c6fda-adf9-c6c3-7601-fa912813ce1f@gmail.com>
Message-ID: <8b1a4006-d680-e4a7-dc91-a746c30681e4@gmail.com>
Date:   Tue, 28 Jan 2020 18:43:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <2f5c6fda-adf9-c6c3-7601-fa912813ce1f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

20.01.2020 05:53, Dmitry Osipenko пишет:
> 13.12.2019 18:35, Dmitry Osipenko пишет:
>> 13.12.2019 18:10, Thierry Reding пишет:
>>> On Fri, Dec 13, 2019 at 12:25:33AM +0300, Dmitry Osipenko wrote:
>>>> Hello Thierry,
>>>>
>>>> Commit [1] introduced a severe GPU performance regression on Tegra20 and
>>>> Tegra30 using.
>>>>
>>>> [1]
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v5.5-rc1&id=fa6661b7aa0b52073681b0d26742650c8cbd30f3
>>>>
>>>> Interestingly the performance is okay on Tegra30 if
>>>> CONFIG_TEGRA_HOST1X_FIREWALL=n, but that doesn't make difference for
>>>> Tegra20.
>>>>
>>>> I was telling you about this problem on the #tegra IRC sometime ago and
>>>> you asked to report it in a trackable form, so finally here it is.
>>>>
>>>> You could reproduce the problem by running [2] like this
>>>> `grate/texture-filter -f -s` which should produce over 100 FPS for 720p
>>>> display resolution and currently it's ~11 FPS.
>>>>
>>>> [2]
>>>> https://github.com/grate-driver/grate/blob/master/tests/grate/texture-filter.c
>>>>
>>>> Previously I was seeing some memory errors coming from Host1x DMA, but
>>>> don't see any errors at all right now.
>>>>
>>>> I don't see anything done horribly wrong in the offending commit.
>>>>
>>>> Unfortunately I couldn't dedicate enough time to sit down and debug the
>>>> problem thoroughly yet. Please let me know if you'll find a solution,
>>>> I'll be happy to test it. Thanks in advance!
>>>
>>> I suspect that the problem here is that we're now using the DMA API,
>>> which causes the 32-bit ARM DMA/IOMMU glue to be used. I vaguely recall
>>> that that code doesn't coalesce entries in the SG table, so we may end
>>> up calling iommu_map() a lot of times, and miss out on much of the
>>> advantages that the ->iotlb_sync_map() gives us on Tegra20.
>>>
>>> At the same time dma_map_sg() will flush caches, which we didn't do
>>> before. This we should be able to improve by passing the attribute
>>> DMA_ATTR_SKIP_CPU_SYNC to dma_map_sg() when we know that the cache
>>> maintenance isn't needed.
>>>
>>> And while thinking about it, one other difference is that with the DMA
>>> API we actually map/unmap the buffers for every submission. This is
>>> because the DMA API semantics require that buffers be mapped/unmapped
>>> every time you use them. Previously we would basically only map each
>>> buffer once (at allocation time) and only have to deal with cache
>>> maintenance, so the overhead per submission was drastically lower.
>>>
>>> If DMA_ATTR_SKIP_CPU_SYNC doesn't give us enough of an improvement, we
>>> may want to restore explicit IOMMU usage, at least on anything prior to
>>> Tegra124 where we're unlikely to ever use different IOMMU domains anyway
>>> (because they are such a scarce resource).
>>
>> Tegra20 doesn't use IOMMU in a vanilla upstream kernel (yet), so I don't
>> think that it's the root of the problem. Disabling IOMMU for Tegra30
>> also didn't help (IIRC).
>>
>> The offending patch shouldn't change anything in regards to the DMA API,
>> if I'm not missing something. Strange..
>>
>> Please keep me up-to-date!
>>
> 
> Hello Thierry,
> 
> I took another look at the problem and here what was found:
> 
> 1) The "Optionally attach clients to the IOMMU" patch is wrong because:
> 
>     1. host1x_drm_probe() is invoked *before* any of the
>        host1x_client_iommu_attach() happens, so there is no way
>        on earth the 'use_explicit_iommu' could ever be true.
> 
>     2. Not attaching DRM clients to IOMMU if HOST1x isn't
>        attached is wrong because it never attached in the case
>        of CONFIG_TEGRA_HOST1X_FIREWALL=y [1] and this also
>        makes no sense for T20/30 that do not support LPAE.
> 
> [1]
> https://elixir.bootlin.com/linux/v5.5-rc6/source/drivers/gpu/host1x/dev.c#L205
> 
> 2) Because of the above problems, the DRM clients are erroneously not
> getting attached to IOMMU at all and thus CMA is getting used for the BO
> allocations. Here comes the problems introduced by the "gpu: host1x:
> Support DMA mapping of buffers" patch, which makes DMA API to perform
> CPU cache maintenance on each job submission and apparently this is
> super bad for performance. This also makes no sense in comparison to the
> case of enabled IOMMU, where cache maintenance isn't performed at all
> (like it should be).
> 
> Please let me know if you're going to fix the problems or if you'd
> prefer me to create the patches.
> 
> Here is a draft of the fix for #2, it doesn't cover case of imported
> buffers (which should be statically mapped, IIUC):
...

The v5.5 is released now with the unusable GPU driver. Thierry, could
please let me know if you're planning to do something about it? Should I
help?

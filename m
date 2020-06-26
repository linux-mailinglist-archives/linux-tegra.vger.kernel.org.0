Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4488320B306
	for <lists+linux-tegra@lfdr.de>; Fri, 26 Jun 2020 15:59:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728091AbgFZN7t (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 26 Jun 2020 09:59:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725864AbgFZN7t (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 26 Jun 2020 09:59:49 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3FF0C03E979
        for <linux-tegra@vger.kernel.org>; Fri, 26 Jun 2020 06:59:48 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id m26so5201668lfo.13
        for <linux-tegra@vger.kernel.org>; Fri, 26 Jun 2020 06:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=BTgjm1/Uo1UjiBvzl85JcjpsUjI/1gpOs7wPPQzwe9Y=;
        b=vgCs6TNe08tb7eIjiBF30Ufr+wiA4b4IyKvFzEof+cgdnTf/1EKrqK/QEUw5Vfdo/z
         bUcEtziVVOHmUypUGb5Y9Ymi0/PG3f+q2oEGAqCpE9KqpNAXL63ACsSSIzVULwmWpHXO
         b+mUDDTlOTWtHnM4ksWNvt3Yx10eKY7S6lFl8UOTKhSLb41xLUQIEzdW5cw67D9XvWn8
         WbeACF6/ANEev1ECd047bjdTknmPdtxtSO823GB5GYtd1g9yyhrYLlXzzntZ2EBYpblw
         fwJBWLQRt1qVD+I6BEpVM/27dGNbkG+YbQtqkmQH6L/Z59gHJDwgh0agdkRohAXnTyYJ
         q/Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BTgjm1/Uo1UjiBvzl85JcjpsUjI/1gpOs7wPPQzwe9Y=;
        b=Yp20foFNE+aKB/KvQ/PKr2kUJDN/1LYdJsWOfjOefRqbTA94etW6t5MZC+ztWRSPbD
         6bKuLF3yxCghHeEK7Y9egucY49aiix2206O2pWzSzPFyUZOlOLWgYyDzuMTDDPJdbG/e
         4p5AoMNEcNFavjjQy9qrpFehpxlpk+/ofg8yQJ2jZVS2EkdMUFQ3dmGmx31Xl3v3XWsx
         5rxfJ/d5wWg/OdvW1F1lUXGLntb+3Yzq6Mde7bTQOECxgvOelyL2vgkrRHp/ylP9Wj4C
         lsVF6DiVz6Gk0Xay4ZYhM4B7u09Pbm6wBlYHv+muh/hRadfqHb8BEXARR4fKf8Qqk7ns
         zu4Q==
X-Gm-Message-State: AOAM533dwYvqkDitgyGEY2b4MVzgrP67VnWGUUQgQiZ04svjnVJYzWMt
        /53MAqLfKg04kzcACNsheR0=
X-Google-Smtp-Source: ABdhPJz2TVL9rOK8hVAUH0vUXmMcdVxq0RO6Hu+BIQvYwoalcK0BLwZY1BgTsFDoZ//yFhjqY43Bqg==
X-Received: by 2002:a19:6a02:: with SMTP id u2mr1967899lfu.9.1593179987416;
        Fri, 26 Jun 2020 06:59:47 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru. [79.139.237.54])
        by smtp.googlemail.com with ESMTPSA id f21sm761497ljj.121.2020.06.26.06.59.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2020 06:59:46 -0700 (PDT)
Subject: Re: [RFC] Host1x/TegraDRM UAPI
To:     Daniel Vetter <daniel@ffwll.ch>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Karol Herbst <kherbst@redhat.com>,
        Mikko Perttunen <cyndis@kapsi.fi>,
        Jon Hunter <jonathanh@nvidia.com>,
        David Airlie <airlied@linux.ie>, sumit.semwal@linaro.org,
        gustavo@padovan.org,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        talho@nvidia.com, bhuntsman@nvidia.com,
        dri-devel <dri-devel@lists.freedesktop.org>
References: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
 <CACO55ttfwQDwnO8ep=YKBgo+HYBg=zLDLfBKtH67MrqKzMWw_w@mail.gmail.com>
 <20200626114040.GA3143884@ulmo> <20200626133837.GE3278063@phenom.ffwll.local>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <b46516eb-4077-c3ac-83d0-d8c57660dc3e@gmail.com>
Date:   Fri, 26 Jun 2020 16:59:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200626133837.GE3278063@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

26.06.2020 16:38, Daniel Vetter пишет:
> On Fri, Jun 26, 2020 at 01:40:40PM +0200, Thierry Reding wrote:
>> On Fri, Jun 26, 2020 at 01:06:58PM +0200, Karol Herbst wrote:
>>> On Tue, Jun 23, 2020 at 3:03 PM Mikko Perttunen <cyndis@kapsi.fi> wrote:
>>>>
>>>> # Host1x/TegraDRM UAPI proposal
>>>>
>>>> This is a proposal for a stable UAPI for Host1x and TegraDRM, to replace
>>>> the current TegraDRM UAPI that is behind `STAGING` and quite obsolete in
>>>> many ways.
>>>>
>>>> I haven't written any implementation yet -- I'll do that once there is
>>>> some agreement on the high-level design.
>>>>
>>>> Current open items:
>>>>
>>>> * The syncpoint UAPI allows userspace to create sync_file FDs with
>>>> arbitrary syncpoint fences. dma_fence code currently seems to assume all
>>>> fences will be signaled, which would not necessarily be the case with
>>>> this interface.
>>>> * Previously present GEM IOCTLs (GEM_CREATE, GEM_MMAP) are not present.
>>>> Not sure if they are still needed.
>>>>
>>>
>>> Hi, as this wasn't addressed here (and sorry if I missed it): is there
>>> an open source userspace making use of this UAPI? Because this is
>>> something which needs to be seen before it can be included at all.
>>
>> There's a set of commits that implement an earlier draft here:
>>
>>     https://github.com/thierryreding/linux/tree/for-5.6/drm-tegra-destage-abi
>>
>> and corresponding changes to libdrm to make use of that and implement
>> tests using the various generations of VIC here:
>>
>>     https://cgit.freedesktop.org/~tagr/drm/log/
>>
>> Before actually jumping to an implementation we wanted to go over the
>> design a bit more to avoid wasting a lot of work, like we've done in
>> the past. Turns out it isn't easy to get everyone to agree on a good
>> ABI. Who would've thought? =)
>>
>> I expect that once the discussion around the ABI settles Mikko will
>> start on implementing this ABI in the kernel and we'll update the
>> libdrm patches to make use of the new ABI as well.
> 
> Do we have more than libdrm and tests for this, like something somewhat
> functional? Since tegradrm landed years ago we've refined the criteria a
> bit in this regard, latest version is explicit in that it needs to be
> something that's functional (for end-users in some form), not just
> infrastructure and tests.

We have Opentegra [1] and VDPAU [2] userspace drivers for older Tegra
SoCs that have been using the staging UAPI for years now.

[1] https://github.com/grate-driver/xf86-video-opentegra
[2] https://github.com/grate-driver/libvdpau-tegra

The UAPI and the kernel driver updates are very needed for these drivers
because of the missing UAPI synchronization features and performance
problems of the kernel driver.

So we already have some real-world userspace for the testing!

It's not the first and not the second time we're discussing the Tegra
DRM UAPI changes, but this time it feels like there is a good chance
that it will finally materialize and I'm very happy about it :)

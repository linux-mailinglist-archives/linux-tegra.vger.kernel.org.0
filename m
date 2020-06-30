Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A840020F132
	for <lists+linux-tegra@lfdr.de>; Tue, 30 Jun 2020 11:09:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730001AbgF3JJP (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 30 Jun 2020 05:09:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726792AbgF3JJO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 30 Jun 2020 05:09:14 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 521D5C061755
        for <linux-tegra@vger.kernel.org>; Tue, 30 Jun 2020 02:09:14 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id 22so18058686wmg.1
        for <linux-tegra@vger.kernel.org>; Tue, 30 Jun 2020 02:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=v1q4QGXjMWZSBDrrcU4H5+qS7hC0O+sT9hyxnsYCcqE=;
        b=W4Z47FuaGv4onoJ956YWoCbld2K8uLJoAdXFtJUqNigpqzWR5e31o4wolvqY33vTyr
         dlLTVPKJo0VQP26UYJHw/Zwu2XMKywG5HTnXih9WQjpyzBff0POBSrbOTGsSr+zK+mzR
         uB72DqCvjrPkVp/j8yRs/8+hpbhc7bzH/JMKE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=v1q4QGXjMWZSBDrrcU4H5+qS7hC0O+sT9hyxnsYCcqE=;
        b=KELfMeU2zebbLacB7ImK1qkJi63RDETz+LC/UZJZyv8ox39AIU1yU47e1W5EEFIhp8
         mWCylJKLFsIU1dr3nPmRnvgq5zpuJRCdex0Fi4lzelBQvdfAzfNp820EolSmfku4FOR4
         S711MS2KqMuPteFShzkx9duFmEG0JpT6zyAT9i5ipBybYSygLNHO3A0ms6XH4DDcUEUa
         v8weHswfTY7921arWqoFn/9Yx7A/5q0Rwhe2pf/hLztPldV1XuVufKlxhUj++Hy6LM5F
         rO9Y74gXB7/2fnZZXlEcA32j7OQf6C2GMp7ltN5k6KFIkPgVI1g7RA6erf6x8dDFE7+9
         rXeA==
X-Gm-Message-State: AOAM5323zxsqguLmR4hxOMaZnB0crB8K4zHuFHB34ipQWHT/RcNWA6Q0
        blLViYXV4ktRnoZdjipUsGclU1Pao2k=
X-Google-Smtp-Source: ABdhPJz01ctYAQj52pCdpr7xZk/xPr+GlIMvpe/7+P5dm7xJPg++jrM25CX+IV6hRjPxU/B7ZotATw==
X-Received: by 2002:a1c:7f87:: with SMTP id a129mr21439003wmd.10.1593508152984;
        Tue, 30 Jun 2020 02:09:12 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id f14sm3298455wro.90.2020.06.30.02.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 02:09:12 -0700 (PDT)
Date:   Tue, 30 Jun 2020 11:09:10 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Thierry Reding <thierry.reding@gmail.com>,
        Karol Herbst <kherbst@redhat.com>,
        Mikko Perttunen <cyndis@kapsi.fi>,
        Jon Hunter <jonathanh@nvidia.com>,
        David Airlie <airlied@linux.ie>, sumit.semwal@linaro.org,
        gustavo@padovan.org,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        talho@nvidia.com, bhuntsman@nvidia.com,
        dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: [RFC] Host1x/TegraDRM UAPI
Message-ID: <20200630090910.GS3278063@phenom.ffwll.local>
References: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
 <CACO55ttfwQDwnO8ep=YKBgo+HYBg=zLDLfBKtH67MrqKzMWw_w@mail.gmail.com>
 <20200626114040.GA3143884@ulmo>
 <20200626133837.GE3278063@phenom.ffwll.local>
 <b46516eb-4077-c3ac-83d0-d8c57660dc3e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b46516eb-4077-c3ac-83d0-d8c57660dc3e@gmail.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Jun 26, 2020 at 04:59:45PM +0300, Dmitry Osipenko wrote:
> 26.06.2020 16:38, Daniel Vetter пишет:
> > On Fri, Jun 26, 2020 at 01:40:40PM +0200, Thierry Reding wrote:
> >> On Fri, Jun 26, 2020 at 01:06:58PM +0200, Karol Herbst wrote:
> >>> On Tue, Jun 23, 2020 at 3:03 PM Mikko Perttunen <cyndis@kapsi.fi> wrote:
> >>>>
> >>>> # Host1x/TegraDRM UAPI proposal
> >>>>
> >>>> This is a proposal for a stable UAPI for Host1x and TegraDRM, to replace
> >>>> the current TegraDRM UAPI that is behind `STAGING` and quite obsolete in
> >>>> many ways.
> >>>>
> >>>> I haven't written any implementation yet -- I'll do that once there is
> >>>> some agreement on the high-level design.
> >>>>
> >>>> Current open items:
> >>>>
> >>>> * The syncpoint UAPI allows userspace to create sync_file FDs with
> >>>> arbitrary syncpoint fences. dma_fence code currently seems to assume all
> >>>> fences will be signaled, which would not necessarily be the case with
> >>>> this interface.
> >>>> * Previously present GEM IOCTLs (GEM_CREATE, GEM_MMAP) are not present.
> >>>> Not sure if they are still needed.
> >>>>
> >>>
> >>> Hi, as this wasn't addressed here (and sorry if I missed it): is there
> >>> an open source userspace making use of this UAPI? Because this is
> >>> something which needs to be seen before it can be included at all.
> >>
> >> There's a set of commits that implement an earlier draft here:
> >>
> >>     https://github.com/thierryreding/linux/tree/for-5.6/drm-tegra-destage-abi
> >>
> >> and corresponding changes to libdrm to make use of that and implement
> >> tests using the various generations of VIC here:
> >>
> >>     https://cgit.freedesktop.org/~tagr/drm/log/
> >>
> >> Before actually jumping to an implementation we wanted to go over the
> >> design a bit more to avoid wasting a lot of work, like we've done in
> >> the past. Turns out it isn't easy to get everyone to agree on a good
> >> ABI. Who would've thought? =)
> >>
> >> I expect that once the discussion around the ABI settles Mikko will
> >> start on implementing this ABI in the kernel and we'll update the
> >> libdrm patches to make use of the new ABI as well.
> > 
> > Do we have more than libdrm and tests for this, like something somewhat
> > functional? Since tegradrm landed years ago we've refined the criteria a
> > bit in this regard, latest version is explicit in that it needs to be
> > something that's functional (for end-users in some form), not just
> > infrastructure and tests.
> 
> We have Opentegra [1] and VDPAU [2] userspace drivers for older Tegra
> SoCs that have been using the staging UAPI for years now.
> 
> [1] https://github.com/grate-driver/xf86-video-opentegra
> [2] https://github.com/grate-driver/libvdpau-tegra
> 
> The UAPI and the kernel driver updates are very needed for these drivers
> because of the missing UAPI synchronization features and performance
> problems of the kernel driver.
> 
> So we already have some real-world userspace for the testing!

Awesome! Maybe for future rounds include the links for the vdpau driver. I
didn't know about that one at all. -opentegra is probably not so relevant
anymore (and I flat out forgot it exists) ... Including the userspace side
links is good so that forgetful people like me don't nag :-)
-Daniel


> It's not the first and not the second time we're discussing the Tegra
> DRM UAPI changes, but this time it feels like there is a good chance
> that it will finally materialize and I'm very happy about it :)

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

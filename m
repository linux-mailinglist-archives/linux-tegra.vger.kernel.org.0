Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15C9420B29E
	for <lists+linux-tegra@lfdr.de>; Fri, 26 Jun 2020 15:38:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726169AbgFZNim (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 26 Jun 2020 09:38:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726013AbgFZNil (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 26 Jun 2020 09:38:41 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71F46C03E979
        for <linux-tegra@vger.kernel.org>; Fri, 26 Jun 2020 06:38:41 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id 17so9415079wmo.1
        for <linux-tegra@vger.kernel.org>; Fri, 26 Jun 2020 06:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VIDsXKhd3FsLdPrj7iNBfRAKJOl7dEgIgZhDmwJcgIA=;
        b=ZvIpsMiR3ItY9TwUnp047/SJ26E9IvAhE2ulCaxXXZACOGih6YCXTrosGUNCk5aJjQ
         JZFBmULt8EVtd0P9t4xXSX2JtEr5tUmOnpPs4VCv4KwNesBI8u5z2E1Yhx0sVBiLVito
         Xe5kfg92JFcjt5NfDDD5iZy/MXRB+x/EBZghU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VIDsXKhd3FsLdPrj7iNBfRAKJOl7dEgIgZhDmwJcgIA=;
        b=PNQOoKqE7ETTq1FfvKeC2XzXg4gul+dmiYXFbLqrG1Oj8xKrooZaLHvJJ89UFHNx4i
         QcQkpT6RKbt+QzP2a4yYRmOBQ9xrY+HBWNczn3GjZ3vKB+iFeb9Qg/ldQ8QLA9QxoQRx
         cGZHaP/UXyliiaVKmy8qcOASA48LkDmMS0rIAWCjub1G6Wuft/A8ZqaCHU/O2MSQrc2U
         N45gsNz3Dff57D1TvQUoOwGA2o6Z54XAL9qU1d/srlVD53fDyeg/FqCF1Gy3xcyjgNh/
         YP/81XXrxFzAirEQnrrW8h+xRGDf+EVD5VQLPvrDPJKTr0a0Ls5Cxd+dZfN4aHlgv/uE
         iRew==
X-Gm-Message-State: AOAM530g4hX+Uu1Zgb5yow0zkF9WtJy5ykdRuSRDd9CYF1yUwxiNLO5r
        jGacTI7Jbdp8sNN00EqRWbRuww==
X-Google-Smtp-Source: ABdhPJz7xIMEJg4LwGuWXWiNSiA2dSID+PoB6ZsRuM8wgQ0JcL9uDGFVJ4rSMXj0F7YagoLR7WgwxA==
X-Received: by 2002:a1c:4d11:: with SMTP id o17mr3441238wmh.134.1593178720233;
        Fri, 26 Jun 2020 06:38:40 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id d13sm21928052wrn.61.2020.06.26.06.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 06:38:39 -0700 (PDT)
Date:   Fri, 26 Jun 2020 15:38:37 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Karol Herbst <kherbst@redhat.com>,
        Mikko Perttunen <cyndis@kapsi.fi>,
        Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, sumit.semwal@linaro.org,
        gustavo@padovan.org,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        talho@nvidia.com, bhuntsman@nvidia.com,
        dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: [RFC] Host1x/TegraDRM UAPI
Message-ID: <20200626133837.GE3278063@phenom.ffwll.local>
References: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
 <CACO55ttfwQDwnO8ep=YKBgo+HYBg=zLDLfBKtH67MrqKzMWw_w@mail.gmail.com>
 <20200626114040.GA3143884@ulmo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200626114040.GA3143884@ulmo>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Jun 26, 2020 at 01:40:40PM +0200, Thierry Reding wrote:
> On Fri, Jun 26, 2020 at 01:06:58PM +0200, Karol Herbst wrote:
> > On Tue, Jun 23, 2020 at 3:03 PM Mikko Perttunen <cyndis@kapsi.fi> wrote:
> > >
> > > # Host1x/TegraDRM UAPI proposal
> > >
> > > This is a proposal for a stable UAPI for Host1x and TegraDRM, to replace
> > > the current TegraDRM UAPI that is behind `STAGING` and quite obsolete in
> > > many ways.
> > >
> > > I haven't written any implementation yet -- I'll do that once there is
> > > some agreement on the high-level design.
> > >
> > > Current open items:
> > >
> > > * The syncpoint UAPI allows userspace to create sync_file FDs with
> > > arbitrary syncpoint fences. dma_fence code currently seems to assume all
> > > fences will be signaled, which would not necessarily be the case with
> > > this interface.
> > > * Previously present GEM IOCTLs (GEM_CREATE, GEM_MMAP) are not present.
> > > Not sure if they are still needed.
> > >
> > 
> > Hi, as this wasn't addressed here (and sorry if I missed it): is there
> > an open source userspace making use of this UAPI? Because this is
> > something which needs to be seen before it can be included at all.
> 
> There's a set of commits that implement an earlier draft here:
> 
>     https://github.com/thierryreding/linux/tree/for-5.6/drm-tegra-destage-abi
> 
> and corresponding changes to libdrm to make use of that and implement
> tests using the various generations of VIC here:
> 
>     https://cgit.freedesktop.org/~tagr/drm/log/
> 
> Before actually jumping to an implementation we wanted to go over the
> design a bit more to avoid wasting a lot of work, like we've done in
> the past. Turns out it isn't easy to get everyone to agree on a good
> ABI. Who would've thought? =)
> 
> I expect that once the discussion around the ABI settles Mikko will
> start on implementing this ABI in the kernel and we'll update the
> libdrm patches to make use of the new ABI as well.

Do we have more than libdrm and tests for this, like something somewhat
functional? Since tegradrm landed years ago we've refined the criteria a
bit in this regard, latest version is explicit in that it needs to be
something that's functional (for end-users in some form), not just
infrastructure and tests.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

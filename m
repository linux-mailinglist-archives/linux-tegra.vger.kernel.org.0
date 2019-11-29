Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C388810D9E0
	for <lists+linux-tegra@lfdr.de>; Fri, 29 Nov 2019 20:03:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726980AbfK2TDP (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 29 Nov 2019 14:03:15 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:47075 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726926AbfK2TDP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 29 Nov 2019 14:03:15 -0500
Received: by mail-wr1-f67.google.com with SMTP id z7so32927409wrl.13
        for <linux-tegra@vger.kernel.org>; Fri, 29 Nov 2019 11:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1QZu4RGS+J5yqrMyWN6jTUeaD/ZNnaysfdlkpKKSsCc=;
        b=Ld6oBMZlsDrpYTFkWfX2nRy7QJe5aHfgFeywZeep+lUqZo9ieNoCDwe7ijWQU+iKyE
         Ric9R0wZEX4IFGGRX1nEjo+N2vM4wd0XsAh/PwV8uuSuTV+tR2Cmch0WFutksAvk3iHA
         kA1PQB58+ZVv6nrHrXMi7dN5chcxq07oHs7U8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1QZu4RGS+J5yqrMyWN6jTUeaD/ZNnaysfdlkpKKSsCc=;
        b=hz484USTYlYrHBpA/b6cf9TMmGAKDLeIXWBD5TxJE6EBknRuN/8L85Ym0ruDBpHra2
         FGzWUxVPcu9zomvA1FslrZ2BHwY2YivAkSGZUQcNcQ8D2YxxbdGcvChcamnMjlt/QCSG
         UolgU+bnCPgmxOSps4pjLrJjhT5JDD6DsGPzESXcgShvv7U/5B4c/omH4aYrAOCijxEA
         wNvdQR8xWQAHx4zGTpv9qRYO7BKXMGy5ZFMPq7ucBpwrMgY4aNK31FqgXeu0lOOhLnk1
         VaH0MqXEOaJVMZwmQ212xwPmlg7Yfdxv60mIRP6F+9fp1gco0jfJ65CgDyNCD309guB2
         jkGw==
X-Gm-Message-State: APjAAAWusvyBJgByuRdS5BHwF6ivPC7tHacPmoITkcQmMzIKKlRRgEMv
        BriV3zLxJNpN5WWmclEbOraoog==
X-Google-Smtp-Source: APXvYqwkXqOoa23FK2UWm7yNVnK2HSPgqLRWd4QnR/Kv93AMCRNwoH5jgs5SR2PlyilyqKiDr3o/ww==
X-Received: by 2002:a5d:50ce:: with SMTP id f14mr41102795wrt.219.1575054191703;
        Fri, 29 Nov 2019 11:03:11 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net. [212.51.149.96])
        by smtp.gmail.com with ESMTPSA id c144sm14301683wmd.1.2019.11.29.11.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2019 11:03:10 -0800 (PST)
Date:   Fri, 29 Nov 2019 20:03:09 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>, linux-tegra@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/9] drm/tegra: hub: Remove bogus connection mutex check
Message-ID: <20191129190309.GM624164@phenom.ffwll.local>
References: <20191128153741.2380419-1-thierry.reding@gmail.com>
 <20191128153741.2380419-2-thierry.reding@gmail.com>
 <20191129090643.GA624164@phenom.ffwll.local>
 <20191129101255.GA2771912@ulmo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191129101255.GA2771912@ulmo>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Nov 29, 2019 at 11:12:55AM +0100, Thierry Reding wrote:
> On Fri, Nov 29, 2019 at 10:06:43AM +0100, Daniel Vetter wrote:
> > On Thu, Nov 28, 2019 at 04:37:33PM +0100, Thierry Reding wrote:
> > > From: Thierry Reding <treding@nvidia.com>
> > > 
> > > I have no recollection why that check is there, but it seems to trigger
> > > all the time, so remove it. Everything works fine without.
> > > 
> > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > > ---
> > >  drivers/gpu/drm/tegra/hub.c | 3 ---
> > >  1 file changed, 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
> > > index 6aca0fd5a8e5..e56c0f7d3a13 100644
> > > --- a/drivers/gpu/drm/tegra/hub.c
> > > +++ b/drivers/gpu/drm/tegra/hub.c
> > > @@ -615,11 +615,8 @@ static struct tegra_display_hub_state *
> > >  tegra_display_hub_get_state(struct tegra_display_hub *hub,
> > >  			    struct drm_atomic_state *state)
> > >  {
> > > -	struct drm_device *drm = dev_get_drvdata(hub->client.parent);
> > >  	struct drm_private_state *priv;
> > >  
> > > -	WARN_ON(!drm_modeset_is_locked(&drm->mode_config.connection_mutex));
> > 
> > I suspect copypasta from the mst private state stuff, which relied on this
> > lock to protect it. Except your code never bothered to grab that lock (or
> > any other) so was technically broken until we added generic locking in
> > 
> > commit b962a12050a387e4bbf3a48745afe1d29d396b0d
> > Author: Rob Clark <robdclark@gmail.com>
> > Date:   Mon Oct 22 14:31:22 2018 +0200
> > 
> >     drm/atomic: integrate modeset lock with private objects
> > 
> > Hence this is now ok to drop, originally it wasnt.
> > 
> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> Great, thanks for pointing that out. I'll update the commit message with
> that explanation.
> 
> > Aside: You're single-thread all your atomic updates on the hub->lock,
> > which might not be what you want. At least updates to separate crtc should
> > go through in parallel. Usual way to fix this is to add a
> > tegra_crtc_state->hub_changed that your earlier code sets, and then you
> > walk the crtc states in the atomic commit (only those, not all, otherwise
> > you just rebuild that global lock again), and then only grab the hub state
> > when you need to update something.
> 
> I'm confused. Where do you see hub->lock? Did you mean wgrp->lock?

struct tegra_display_hub->base.lock I have no idea what wgrp->lock is
protecting - the functions seem to be only called from driver load/cleanup
code, and that is single-threaded. If I'm not missing anything then
wgrp->lock does nothing for you.

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

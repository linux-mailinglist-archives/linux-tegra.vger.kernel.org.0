Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5E0236084D
	for <lists+linux-tegra@lfdr.de>; Thu, 15 Apr 2021 13:33:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232279AbhDOLeP (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 15 Apr 2021 07:34:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230056AbhDOLeO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 15 Apr 2021 07:34:14 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18D24C061574
        for <linux-tegra@vger.kernel.org>; Thu, 15 Apr 2021 04:33:51 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id k128so12282143wmk.4
        for <linux-tegra@vger.kernel.org>; Thu, 15 Apr 2021 04:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=13k+njGV2uKvtcoZVwTEnL8TyFMpsUTPjBtwvKMVIn0=;
        b=FA7sBqmNPXF8L1IJzMBiC1C+03+99yGRO7xmwzxSHEiQO8dF+RyiqtUv473TRBl9DJ
         ofy6vPj3WsLHCTJkVa/VA3GEbj+z04eJQju/RlhR1oPO7IJ+o65MGBUxf1pKuQFxfVJw
         KoqsWiC/bAs3ilsn2Nalfni+TyiMXOfAvpvqc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=13k+njGV2uKvtcoZVwTEnL8TyFMpsUTPjBtwvKMVIn0=;
        b=Kn4XLESfU6xV3VlLAkt9omIaiwIxsHe2s3YhwyoYd26886Zdguyfhxn+69fabyqBFG
         fCZPZBbrYTDXTc/pTBb63YONDtNqrkrRSwCu2kkT3VFTwKs1JyEJEb9fSxIn5k+Xcct8
         DlEiq751tL3rL3xVRfn5Tcke7DsnNPB/MyQeNulfKCHIrh9bzV7fGFOyyBnyE/L1VsOk
         HUV4OtNkYl7DLTCcDBOKgej55NyXiMG8UjLZ9+e8+Dx1BWO7p91tzUuSzoKgxOSCx32w
         D8i2zojjCwbqfriTotLA6jNO3InACleSnUSWRLAtN1ssdPtOHjrTlJFLxq7xDLSVSqP6
         mbDg==
X-Gm-Message-State: AOAM532gWFazx/AR4OJKQC2E+ly/Iwv0sA92ZaIbDxxG40DmpuMdcAc4
        STPsSn2RjhjX1XslQvjumgMML23e7lwh7g==
X-Google-Smtp-Source: ABdhPJwTws/OP8YfTa+zhDBcdtMyEgxr2rTeY9T3TS8womfbkDSVJm6xM69NBHRm4ORd7JehhSwcVQ==
X-Received: by 2002:a1c:2985:: with SMTP id p127mr2679848wmp.165.1618486429812;
        Thu, 15 Apr 2021 04:33:49 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id a22sm2431649wrc.59.2021.04.15.04.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 04:33:48 -0700 (PDT)
Date:   Thu, 15 Apr 2021 13:33:46 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        stable@vger.kernel.org,
        Pekka Paalanen <pekka.paalanen@collabora.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 10/12] drm/tegra: Don't set allow_fb_modifiers explicitly
Message-ID: <YHgkmgsvBmMXiHTr@phenom.ffwll.local>
References: <20210413094904.3736372-1-daniel.vetter@ffwll.ch>
 <20210413094904.3736372-10-daniel.vetter@ffwll.ch>
 <YHWCgpq5fVpSGdSN@orome.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YHWCgpq5fVpSGdSN@orome.fritz.box>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Apr 13, 2021 at 01:37:38PM +0200, Thierry Reding wrote:
> On Tue, Apr 13, 2021 at 11:49:01AM +0200, Daniel Vetter wrote:
> > Since
> > 
> > commit 890880ddfdbe256083170866e49c87618b706ac7
> > Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > Date:   Fri Jan 4 09:56:10 2019 +0100
> > 
> >     drm: Auto-set allow_fb_modifiers when given modifiers at plane init
> > 
> > this is done automatically as part of plane init, if drivers set the
> > modifier list correctly. Which is the case here.
> > 
> > It was slightly inconsistently though, since planes with only linear
> > modifier support haven't listed that explicitly. Fix that, and cc:
> > stable to allow userspace to rely on this. Again don't backport
> > further than where Paul's patch got added.
> > 
> > Cc: stable@vger.kernel.org # v5.1 +
> > Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Thierry Reding <thierry.reding@gmail.com>
> > Cc: Jonathan Hunter <jonathanh@nvidia.com>
> > Cc: linux-tegra@vger.kernel.org
> > ---
> >  drivers/gpu/drm/tegra/dc.c  | 10 ++++++++--
> >  drivers/gpu/drm/tegra/drm.c |  2 --
> >  2 files changed, 8 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> > index c9385cfd0fc1..f9845a50f866 100644
> > --- a/drivers/gpu/drm/tegra/dc.c
> > +++ b/drivers/gpu/drm/tegra/dc.c
> > @@ -959,6 +959,11 @@ static const struct drm_plane_helper_funcs tegra_cursor_plane_helper_funcs = {
> >  	.atomic_disable = tegra_cursor_atomic_disable,
> >  };
> >  
> > +static const uint64_t linear_modifiers[] = {
> > +	DRM_FORMAT_MOD_LINEAR,
> > +	DRM_FORMAT_MOD_INVALID
> > +};
> > +
> >  static struct drm_plane *tegra_dc_cursor_plane_create(struct drm_device *drm,
> >  						      struct tegra_dc *dc)
> >  {
> > @@ -987,7 +992,7 @@ static struct drm_plane *tegra_dc_cursor_plane_create(struct drm_device *drm,
> >  
> >  	err = drm_universal_plane_init(drm, &plane->base, possible_crtcs,
> >  				       &tegra_plane_funcs, formats,
> > -				       num_formats, NULL,
> > +				       num_formats, linear_modifiers,
> >  				       DRM_PLANE_TYPE_CURSOR, NULL);
> >  	if (err < 0) {
> >  		kfree(plane);
> > @@ -1106,7 +1111,8 @@ static struct drm_plane *tegra_dc_overlay_plane_create(struct drm_device *drm,
> >  
> >  	err = drm_universal_plane_init(drm, &plane->base, possible_crtcs,
> >  				       &tegra_plane_funcs, formats,
> > -				       num_formats, NULL, type, NULL);
> > +				       num_formats, linear_modifiers,
> > +				       type, NULL);
> 
> I think we can do better than linear_modifiers for overlay planes, but
> given that this doesn't change existing behaviour, I'll do that in a
> separate patch.
> 
> Acked-by: Thierry Reding <treding@nvidia.com>

Applied to drm-misc-next, thanks for taking a look.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

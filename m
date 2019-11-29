Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A82910DA89
	for <lists+linux-tegra@lfdr.de>; Fri, 29 Nov 2019 21:20:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727051AbfK2UUb (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 29 Nov 2019 15:20:31 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:46408 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727040AbfK2UUb (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 29 Nov 2019 15:20:31 -0500
Received: by mail-wr1-f66.google.com with SMTP id z7so33120548wrl.13
        for <linux-tegra@vger.kernel.org>; Fri, 29 Nov 2019 12:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=BIHVMnDRHpjNCml4jPqzFB2OK7pWSwmT1STSuuYBBOA=;
        b=Yf/fzOsEtnQ4lytsvdu6jt8L5RaJ4DB3sjXD78cLgnwgTz+PMSjSW3ZbkFOu2198WU
         8WZoG6uCJJGGIQ1WK2C9pP7gs6eEvcQFlna4kKe3WM2mvFPT7icuJcHoFTzbHl0/dRf7
         YWp2vL1kHTk4wpavOOGZm2oXxI0sX+ikLmKoc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=BIHVMnDRHpjNCml4jPqzFB2OK7pWSwmT1STSuuYBBOA=;
        b=KNHFjGK++Ztg/q0/RTTcq1y3YIrGygnosETc/YsTYTrNBdQrXyIab9l/fYPDrUF3d3
         +roq4moBbdANQOTIBADx9aQZhOUvxkb67ed2sc21siq8KO/doBqWQ4s49IiUKNcGXgHh
         yzANkixqz3Svc0oH3jQmxfgVilcWg0UP952jDR7j67kwt+rrcI24MEG8JPcbFDhkONt1
         MWB5V1dshNyh1aL0x4pTLMLLKLWJc6TmJvuf6dxFrN9JEiV0ldTjbLUTXrM4TtSLOp5+
         Zv1AWO31yWOIhQwwbtIxLV7gk4LbouCnKeiIRUs6+kQKlezxSBh5ylXGnDBOKRvfwjJB
         /OtA==
X-Gm-Message-State: APjAAAUgKaPiqBcFgvNZeP6wgiJ1MVeXwh0uxxA4fji1mw2G/p5Ew2Ob
        pBa7iIVWb5r3sT0m07ocoIr6qw==
X-Google-Smtp-Source: APXvYqypcE2kphJ2D8dT23PtHoWK3EIq4PxqV55QJ80/nOA0PYQh5/NUYCsptfkzh4Vqsq9Z5Blkyg==
X-Received: by 2002:a5d:43c7:: with SMTP id v7mr3756645wrr.32.1575058828153;
        Fri, 29 Nov 2019 12:20:28 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net. [212.51.149.96])
        by smtp.gmail.com with ESMTPSA id c193sm15263460wma.8.2019.11.29.12.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2019 12:20:26 -0800 (PST)
Date:   Fri, 29 Nov 2019 21:20:25 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>, linux-tegra@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 8/9] drm/tegra: dpaux: Add missing runtime PM references
Message-ID: <20191129202025.GT624164@phenom.ffwll.local>
References: <20191128153741.2380419-1-thierry.reding@gmail.com>
 <20191128153741.2380419-9-thierry.reding@gmail.com>
 <20191129092319.GD624164@phenom.ffwll.local>
 <20191129104412.GD2771912@ulmo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191129104412.GD2771912@ulmo>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Nov 29, 2019 at 11:44:12AM +0100, Thierry Reding wrote:
> On Fri, Nov 29, 2019 at 10:23:19AM +0100, Daniel Vetter wrote:
> > On Thu, Nov 28, 2019 at 04:37:40PM +0100, Thierry Reding wrote:
> > > From: Thierry Reding <treding@nvidia.com>
> > > 
> > > Ensure that a runtime PM reference is acquired each time the DPAUX
> > > registers are accessed. Otherwise the code may end up running without
> > > the controller being powered, out-of-reset or clocked in some corner
> > > cases, resulting in a crash.
> > > 
> > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > 
> > On patches 4,5,7 in this series Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > 
> > On this one here I'm very confused.
> > 
> > - Why do you drop the runtime pm between enable and disable? Is that just
> >   how the hw works, i.e. the pad config stays, just the registers go away?
> 
> Now you've made me doubt this. I don't think the pad configuration stays
> across runtime suspend/resume, so you're right, this shouldn't work.
> I'll need to go retest this one specifically.
> 
> I had added these runtime PM references to ensure the device was
> properly configured at resume from suspend, but there ended up being an
> additional issue with the I2C driver that relies on this, so perhaps
> this may not be necessary in the end.
> 
> > - I'm not seeing any locking between the different users (dp aux and
> >   pinctrl). We might want to change drm_dp_aux->hw_mutex to a pointer to
> >   make this easier (but I'm not super fond of that pattern from i2c).
> 
> There should be no need to lock here. DP AUX transfers will only be used
> between drm_dp_aux_enable() and drm_dp_aux_disable().

So dp aux vs. dp aux aside (that's the next point below), there's
guaranteed no one else can get at that pinctrl mux? Since the other
setting is labelled I2C I assumed there's an i2c controller hanging of it,
exposed to userspace, and userspace might probe that whenever it feels
like (similar to the issue below). But I don't know your hw, nor do I
really know pinctrl. Just looked a bit strange.

Cheers, Daniel


> > - Your drm_dp_aux_enable/disable needs to be moved into the ->transfer
> >   callback, otherwise the various userspace interface (dp aux, but also
> >   i2c on top of that) won't work. Some pre/post_transfer functions like
> >   i2c has might be useful for stuff like this.
> 
> I suppose it would be possible for someone to attempt to use those
> userspace interfaces outside of drm_dp_aux_enable()/drm_dp_aux_disable()
> and then the locking would be required.
> 
> I'll look into that.
> 
> Thierry
> 
> > 
> > Cheers, Daniel
> > 
> > > ---
> > >  drivers/gpu/drm/tegra/dpaux.c | 16 ++++++++++++++--
> > >  1 file changed, 14 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c
> > > index 622cdf1ad246..4b2b86aed1a5 100644
> > > --- a/drivers/gpu/drm/tegra/dpaux.c
> > > +++ b/drivers/gpu/drm/tegra/dpaux.c
> > > @@ -434,8 +434,13 @@ static int tegra_dpaux_set_mux(struct pinctrl_dev *pinctrl,
> > >  			       unsigned int function, unsigned int group)
> > >  {
> > >  	struct tegra_dpaux *dpaux = pinctrl_dev_get_drvdata(pinctrl);
> > > +	int err;
> > > +
> > > +	pm_runtime_get_sync(dpaux->dev);
> > > +	err = tegra_dpaux_pad_config(dpaux, function);
> > > +	pm_runtime_put(dpaux->dev);
> > >  
> > > -	return tegra_dpaux_pad_config(dpaux, function);
> > > +	return err;
> > >  }
> > >  
> > >  static const struct pinmux_ops tegra_dpaux_pinmux_ops = {
> > > @@ -809,15 +814,22 @@ enum drm_connector_status drm_dp_aux_detect(struct drm_dp_aux *aux)
> > >  int drm_dp_aux_enable(struct drm_dp_aux *aux)
> > >  {
> > >  	struct tegra_dpaux *dpaux = to_dpaux(aux);
> > > +	int err;
> > > +
> > > +	pm_runtime_get_sync(dpaux->dev);
> > > +	err = tegra_dpaux_pad_config(dpaux, DPAUX_PADCTL_FUNC_AUX);
> > > +	pm_runtime_put(dpaux->dev);
> > >  
> > > -	return tegra_dpaux_pad_config(dpaux, DPAUX_PADCTL_FUNC_AUX);
> > > +	return err;
> > >  }
> > >  
> > >  int drm_dp_aux_disable(struct drm_dp_aux *aux)
> > >  {
> > >  	struct tegra_dpaux *dpaux = to_dpaux(aux);
> > >  
> > > +	pm_runtime_get_sync(dpaux->dev);
> > >  	tegra_dpaux_pad_power_down(dpaux);
> > > +	pm_runtime_put(dpaux->dev);
> > >  
> > >  	return 0;
> > >  }
> > > -- 
> > > 2.23.0
> > > 
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > 
> > -- 
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9488E10D2F0
	for <lists+linux-tegra@lfdr.de>; Fri, 29 Nov 2019 10:07:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726143AbfK2JHN (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 29 Nov 2019 04:07:13 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:34595 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725892AbfK2JHN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 29 Nov 2019 04:07:13 -0500
Received: by mail-wr1-f68.google.com with SMTP id t2so34107963wrr.1
        for <linux-tegra@vger.kernel.org>; Fri, 29 Nov 2019 01:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Idebi7aDiIoMw7jaPD0CLZqQMMLW9tREgDMduPZ4dyA=;
        b=XSdGLZ8ZlgNkq06U3t3aL5Y5HkM1bHV5PqzBxZl1Aw4kUy5rIHkNWObg2FnGz1zhLo
         LZwKV9X6hjB3PekoU3DQdo845xn0JtDjp+JKLWlkJpQKDLjI8m8gIxImV0TWdrWKuJ7b
         wwxw+ZjvEYjLxmJ0m7L9oGgGARdM28EHDAmt8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Idebi7aDiIoMw7jaPD0CLZqQMMLW9tREgDMduPZ4dyA=;
        b=favGD3MSo8DhkvGf5jSKrr7SCj69tEZBi6/yzZlZ8rfKeK3L/ko2sOKuH+U7q6JjeU
         OLcjGH+pBBNe6gpVuo5a80cM4Xfwsy/A9G0LeaZ8PUjTXoqLFcknw0XOSVtwKGxZs91x
         EzBvW0aQhGQbt9DsUhRE20mkZlqdIOKQn78aI65IvVVBK8t2wsCMrazLt48zEHhP8xzF
         4/HKrcXciEknXVP3JhTwyRL+E+y1MPVYMEmg/Mt6RueOP18keXOFBGxCX3KeqBl5rtNL
         l4d+wD0skT2Ui2sGBH7Eksw9UWOk5r3y226uzl5x6NyW5Op3gIR1h+w8sTpNtwKSsntS
         PJ8Q==
X-Gm-Message-State: APjAAAV8F2aLxXTUQtdbtOHE0lB1eXtv1yXa0K66rJUtgxGNzR8w5f2w
        cKt0Rk+F5WJ7x0TmbgLSfrISAp1duC8=
X-Google-Smtp-Source: APXvYqxAAzZDg8wPwIWoyjm+arnlJgyEQPm4OtB7PXELLnIVSX/SJh1uju9yOKzdZpsqNGL7bNJlFg==
X-Received: by 2002:a5d:4d06:: with SMTP id z6mr1813752wrt.339.1575018430314;
        Fri, 29 Nov 2019 01:07:10 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net. [212.51.149.96])
        by smtp.gmail.com with ESMTPSA id 72sm27374023wrl.73.2019.11.29.01.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2019 01:07:09 -0800 (PST)
Date:   Fri, 29 Nov 2019 10:06:43 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/9] drm/tegra: hub: Remove bogus connection mutex check
Message-ID: <20191129090643.GA624164@phenom.ffwll.local>
References: <20191128153741.2380419-1-thierry.reding@gmail.com>
 <20191128153741.2380419-2-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191128153741.2380419-2-thierry.reding@gmail.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Nov 28, 2019 at 04:37:33PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> I have no recollection why that check is there, but it seems to trigger
> all the time, so remove it. Everything works fine without.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/hub.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
> index 6aca0fd5a8e5..e56c0f7d3a13 100644
> --- a/drivers/gpu/drm/tegra/hub.c
> +++ b/drivers/gpu/drm/tegra/hub.c
> @@ -615,11 +615,8 @@ static struct tegra_display_hub_state *
>  tegra_display_hub_get_state(struct tegra_display_hub *hub,
>  			    struct drm_atomic_state *state)
>  {
> -	struct drm_device *drm = dev_get_drvdata(hub->client.parent);
>  	struct drm_private_state *priv;
>  
> -	WARN_ON(!drm_modeset_is_locked(&drm->mode_config.connection_mutex));

I suspect copypasta from the mst private state stuff, which relied on this
lock to protect it. Except your code never bothered to grab that lock (or
any other) so was technically broken until we added generic locking in

commit b962a12050a387e4bbf3a48745afe1d29d396b0d
Author: Rob Clark <robdclark@gmail.com>
Date:   Mon Oct 22 14:31:22 2018 +0200

    drm/atomic: integrate modeset lock with private objects

Hence this is now ok to drop, originally it wasnt.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Aside: You're single-thread all your atomic updates on the hub->lock,
which might not be what you want. At least updates to separate crtc should
go through in parallel. Usual way to fix this is to add a
tegra_crtc_state->hub_changed that your earlier code sets, and then you
walk the crtc states in the atomic commit (only those, not all, otherwise
you just rebuild that global lock again), and then only grab the hub state
when you need to update something.

Cheers, Daniel

> -
>  	priv = drm_atomic_get_private_obj_state(state, &hub->base);
>  	if (IS_ERR(priv))
>  		return ERR_CAST(priv);
> -- 
> 2.23.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

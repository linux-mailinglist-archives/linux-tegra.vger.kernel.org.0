Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BCD1610D32D
	for <lists+linux-tegra@lfdr.de>; Fri, 29 Nov 2019 10:23:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726878AbfK2JXZ (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 29 Nov 2019 04:23:25 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:37632 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725892AbfK2JXY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 29 Nov 2019 04:23:24 -0500
Received: by mail-wm1-f67.google.com with SMTP id f129so14198441wmf.2
        for <linux-tegra@vger.kernel.org>; Fri, 29 Nov 2019 01:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=UPhMA7LtdzKZF/X+3+RVMQIE96DG76giXq9Ubgc8NuU=;
        b=BombMQd90nM/pwQhyIN2iEc8mduaG+U83PWfD9tB1EFVNBcMs85duZtKHX0ln0P2Ax
         iiZi31wex7AN+lmley1gk17gJwMe6I4trzV3ZsC4h7YoeWx+c/Mae44KDt+aSwsaOqIq
         WP4FsEh7hxP/eV/ylaRwLb9dIp02Pge/2JF9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=UPhMA7LtdzKZF/X+3+RVMQIE96DG76giXq9Ubgc8NuU=;
        b=L53MS5Fn+h8b71ttgQM2ol5sph4HvQ2C/676rNiXJZJWa+bpb8Herg7uNTwD1jjGho
         EN6mgRl+hBQ4tAAcY2IUuILbnaEDcdt5vrsKOABOrNFMhd16T2pa/FgvfXQmYIM0OBhP
         3EDk7VdwTsEUHMBwgNCEJfJvdidjah0KJaesN99gWC1KqMSIQecXOEPidXCauZKSlrMo
         qRT3JbPo+MhBq/y3KZSTA0v39RycXCrI4e2jAnz3oRrfwCK1hjInVDY1xu06k433tQBj
         SpR5mrYPujih9NuPSs4fY0EWszRZUXjKN/0ixEhwBFoLdWRtsifXk91UQv0cTCLvlosz
         htxg==
X-Gm-Message-State: APjAAAWGmbp8CKgNrmuD5VvYlh2FV5wj4b5TmycTAO0H6rGZ/lbHejAi
        aeQNo3Rn+KAcvCFShkU22xeH9i1vvVc=
X-Google-Smtp-Source: APXvYqykcjxgG9Am1UrpLstCL2mUSTYo7aI4tATZN1BNOYGUWW1BELZB/f9WWEBWmD7KQylZBKYFHA==
X-Received: by 2002:a05:600c:218c:: with SMTP id e12mr13467534wme.30.1575019402206;
        Fri, 29 Nov 2019 01:23:22 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net. [212.51.149.96])
        by smtp.gmail.com with ESMTPSA id b185sm387735wme.36.2019.11.29.01.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2019 01:23:21 -0800 (PST)
Date:   Fri, 29 Nov 2019 10:23:19 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 8/9] drm/tegra: dpaux: Add missing runtime PM references
Message-ID: <20191129092319.GD624164@phenom.ffwll.local>
References: <20191128153741.2380419-1-thierry.reding@gmail.com>
 <20191128153741.2380419-9-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191128153741.2380419-9-thierry.reding@gmail.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Nov 28, 2019 at 04:37:40PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Ensure that a runtime PM reference is acquired each time the DPAUX
> registers are accessed. Otherwise the code may end up running without
> the controller being powered, out-of-reset or clocked in some corner
> cases, resulting in a crash.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>

On patches 4,5,7 in this series Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

On this one here I'm very confused.

- Why do you drop the runtime pm between enable and disable? Is that just
  how the hw works, i.e. the pad config stays, just the registers go away?

- I'm not seeing any locking between the different users (dp aux and
  pinctrl). We might want to change drm_dp_aux->hw_mutex to a pointer to
  make this easier (but I'm not super fond of that pattern from i2c).

- Your drm_dp_aux_enable/disable needs to be moved into the ->transfer
  callback, otherwise the various userspace interface (dp aux, but also
  i2c on top of that) won't work. Some pre/post_transfer functions like
  i2c has might be useful for stuff like this.

Cheers, Daniel

> ---
>  drivers/gpu/drm/tegra/dpaux.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c
> index 622cdf1ad246..4b2b86aed1a5 100644
> --- a/drivers/gpu/drm/tegra/dpaux.c
> +++ b/drivers/gpu/drm/tegra/dpaux.c
> @@ -434,8 +434,13 @@ static int tegra_dpaux_set_mux(struct pinctrl_dev *pinctrl,
>  			       unsigned int function, unsigned int group)
>  {
>  	struct tegra_dpaux *dpaux = pinctrl_dev_get_drvdata(pinctrl);
> +	int err;
> +
> +	pm_runtime_get_sync(dpaux->dev);
> +	err = tegra_dpaux_pad_config(dpaux, function);
> +	pm_runtime_put(dpaux->dev);
>  
> -	return tegra_dpaux_pad_config(dpaux, function);
> +	return err;
>  }
>  
>  static const struct pinmux_ops tegra_dpaux_pinmux_ops = {
> @@ -809,15 +814,22 @@ enum drm_connector_status drm_dp_aux_detect(struct drm_dp_aux *aux)
>  int drm_dp_aux_enable(struct drm_dp_aux *aux)
>  {
>  	struct tegra_dpaux *dpaux = to_dpaux(aux);
> +	int err;
> +
> +	pm_runtime_get_sync(dpaux->dev);
> +	err = tegra_dpaux_pad_config(dpaux, DPAUX_PADCTL_FUNC_AUX);
> +	pm_runtime_put(dpaux->dev);
>  
> -	return tegra_dpaux_pad_config(dpaux, DPAUX_PADCTL_FUNC_AUX);
> +	return err;
>  }
>  
>  int drm_dp_aux_disable(struct drm_dp_aux *aux)
>  {
>  	struct tegra_dpaux *dpaux = to_dpaux(aux);
>  
> +	pm_runtime_get_sync(dpaux->dev);
>  	tegra_dpaux_pad_power_down(dpaux);
> +	pm_runtime_put(dpaux->dev);
>  
>  	return 0;
>  }
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

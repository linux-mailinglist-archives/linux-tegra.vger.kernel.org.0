Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F065C1A28BA
	for <lists+linux-tegra@lfdr.de>; Wed,  8 Apr 2020 20:31:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728652AbgDHSbu (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 8 Apr 2020 14:31:50 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:38236 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726860AbgDHSbu (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 8 Apr 2020 14:31:50 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id 67DD280533;
        Wed,  8 Apr 2020 20:31:47 +0200 (CEST)
Date:   Wed, 8 Apr 2020 20:31:46 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/tegra: Use i2c_put_adapter() instead of put_device()
Message-ID: <20200408183146.GB21997@ravnborg.org>
References: <20200408180244.3079849-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200408180244.3079849-1-thierry.reding@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=Ikd4Dj_1AAAA:8
        a=e5mUnYsNAAAA:8 a=eg5VHCaRnQr2oHUEgTIA:9 a=CjuIK1q_8ugA:10
        a=Vxmtnl_E_bksehYqCbjh:22
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Thierry

On Wed, Apr 08, 2020 at 08:02:44PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> In order to properly release the I2C adapter used for DDC/CI, use the
> i2c_put_adapter() function provided by the I2C subsystem rather than the
> put_device() function which doesn't include code to drop a reference to
> the adapter's owner module.

Is this a problem for the other users too?

$ cd drivers/gpu/drm; git grep put_device | grep ddc

exynos/exynos_hdmi.c:	put_device(&hdata->ddc_adpt->dev);
exynos/exynos_hdmi.c:	put_device(&hdata->ddc_adpt->dev);
panel/panel-simple.c:		put_device(&panel->ddc->dev);
panel/panel-simple.c:		put_device(&panel->ddc->dev);
tegra/output.c:		put_device(&output->ddc->dev);
vc4/vc4_hdmi.c:	put_device(&hdmi->ddc->dev);
vc4/vc4_hdmi.c:	put_device(&hdmi->ddc->dev);

??

	Sam

> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/output.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
> index a264259b97a2..136fd2f56af0 100644
> --- a/drivers/gpu/drm/tegra/output.c
> +++ b/drivers/gpu/drm/tegra/output.c
> @@ -177,7 +177,7 @@ void tegra_output_remove(struct tegra_output *output)
>  		free_irq(output->hpd_irq, output);
>  
>  	if (output->ddc)
> -		put_device(&output->ddc->dev);
> +		i2c_put_adapter(output->ddc);
>  }
>  
>  int tegra_output_init(struct drm_device *drm, struct tegra_output *output)
> -- 
> 2.24.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

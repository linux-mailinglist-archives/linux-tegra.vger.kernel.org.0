Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39CE41AE5D2
	for <lists+linux-tegra@lfdr.de>; Fri, 17 Apr 2020 21:30:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730049AbgDQTad (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 17 Apr 2020 15:30:33 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:38808 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728826AbgDQTad (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 17 Apr 2020 15:30:33 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2EADB97D;
        Fri, 17 Apr 2020 21:30:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1587151831;
        bh=LT1fkzEiIU2SdM1Bf5osoUKh8u7+bnqSZLlDYNIAJjo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dE7ay/+HO41kMLRny/Fj7jxuxie/OQKooqir9nFALZiMdNGYalCu1GoKmXiqqh7L7
         38i1+wOMBgq6qJxSikUCmuDd7ULN0pkBmh9LJhAKQlG0QCbwu9EIwXahjdFfi2zT58
         xLDaG9Tfvl9oqB9XIlKNUieP97wQpA8DUXHjdS1E=
Date:   Fri, 17 Apr 2020 22:30:18 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v4 2/3] drm/tegra: output: Support DRM bridges
Message-ID: <20200417193018.GI5861@pendragon.ideasonboard.com>
References: <20200417175238.27154-1-digetx@gmail.com>
 <20200417175238.27154-3-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200417175238.27154-3-digetx@gmail.com>
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Dmitry,

Thank you for the patch.

On Fri, Apr 17, 2020 at 08:52:37PM +0300, Dmitry Osipenko wrote:
> Newer Tegra device-trees will specify a video output graph which involves
> a bridge. This patch adds initial support for the DRM bridges to the
> Tegra's DRM output.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/gpu/drm/tegra/drm.h    |  2 ++
>  drivers/gpu/drm/tegra/output.c | 13 ++++++++++++-
>  2 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
> index 804869799305..cccd368b6752 100644
> --- a/drivers/gpu/drm/tegra/drm.h
> +++ b/drivers/gpu/drm/tegra/drm.h
> @@ -12,6 +12,7 @@
>  #include <linux/of_gpio.h>
>  
>  #include <drm/drm_atomic.h>
> +#include <drm/drm_bridge.h>

You could add a forward declaration of struct drm_bridge instead, that
can lower the compilation time a little bit.

>  #include <drm/drm_edid.h>
>  #include <drm/drm_encoder.h>
>  #include <drm/drm_fb_helper.h>
> @@ -116,6 +117,7 @@ struct tegra_output {
>  	struct device_node *of_node;
>  	struct device *dev;
>  
> +	struct drm_bridge *bridge;
>  	struct drm_panel *panel;
>  	struct i2c_adapter *ddc;
>  	const struct edid *edid;
> diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
> index a6a711d54e88..ec0cd4a1ced1 100644
> --- a/drivers/gpu/drm/tegra/output.c
> +++ b/drivers/gpu/drm/tegra/output.c
> @@ -5,6 +5,7 @@
>   */
>  
>  #include <drm/drm_atomic_helper.h>
> +#include <drm/drm_of.h>
>  #include <drm/drm_panel.h>
>  #include <drm/drm_simple_kms_helper.h>
>  
> @@ -92,13 +93,23 @@ static irqreturn_t hpd_irq(int irq, void *data)
>  
>  int tegra_output_probe(struct tegra_output *output)
>  {
> -	struct device_node *ddc, *panel;
> +	struct device_node *ddc, *panel, *port;
>  	unsigned long flags;
>  	int err, size;
>  
>  	if (!output->of_node)
>  		output->of_node = output->dev->of_node;
>  
> +	port = of_get_child_by_name(output->of_node, "port");

Do you need to check for the presence of a port node first ? Can you
just check the return value of drm_of_find_panel_or_bridge(), and fall
back to "nvidia,panel" if it returns -ENODEV ?

> +	if (port) {
> +		err = drm_of_find_panel_or_bridge(output->of_node, 0, 0, NULL,
> +						  &output->bridge);
> +		of_node_put(port);
> +
> +		if (err)
> +			return err;
> +	}
> +
>  	panel = of_parse_phandle(output->of_node, "nvidia,panel", 0);
>  	if (panel) {
>  		output->panel = of_drm_find_panel(panel);

-- 
Regards,

Laurent Pinchart

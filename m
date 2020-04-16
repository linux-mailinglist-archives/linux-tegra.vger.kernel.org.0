Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E67451ACEB0
	for <lists+linux-tegra@lfdr.de>; Thu, 16 Apr 2020 19:27:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728925AbgDPR1m (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 16 Apr 2020 13:27:42 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:50116 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726514AbgDPR1m (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 16 Apr 2020 13:27:42 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2A838B23;
        Thu, 16 Apr 2020 19:27:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1587058059;
        bh=2oEsITlKsJY88YYqzsh6fJEmUOFQaNSHSjn/9Tj3WN0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Cz/mwzxPMTVQQmY/eHuOzRF4rb5ao5dK3ywKpwgzbEECiwCr3vRpv3b/zClKr/7g1
         M2/T33fgavzAzVRGiYWqxbZYlSF7WMJtJoy6IxTHf3hEdiTcB2gLZspbzzPOlLVS6A
         nhQueS3FFcR82qMioUu0uEXB0+eVj8HLw6d1nRgo=
Date:   Thu, 16 Apr 2020 20:27:27 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 1/2] drm/tegra: output: Don't leak OF node on error
Message-ID: <20200416172727.GN4796@pendragon.ideasonboard.com>
References: <20200416172405.5051-1-digetx@gmail.com>
 <20200416172405.5051-2-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200416172405.5051-2-digetx@gmail.com>
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Dmitry,

Thank you for the patch.

On Thu, Apr 16, 2020 at 08:24:04PM +0300, Dmitry Osipenko wrote:
> The OF node should be put before returning error in tegra_output_probe(),
> otherwise node's refcount will be leaked.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/tegra/output.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
> index e36e5e7c2f69..a6a711d54e88 100644
> --- a/drivers/gpu/drm/tegra/output.c
> +++ b/drivers/gpu/drm/tegra/output.c
> @@ -102,10 +102,10 @@ int tegra_output_probe(struct tegra_output *output)
>  	panel = of_parse_phandle(output->of_node, "nvidia,panel", 0);
>  	if (panel) {
>  		output->panel = of_drm_find_panel(panel);
> +		of_node_put(panel);
> +
>  		if (IS_ERR(output->panel))
>  			return PTR_ERR(output->panel);
> -
> -		of_node_put(panel);
>  	}
>  
>  	output->edid = of_get_property(output->of_node, "nvidia,edid", &size);
> @@ -113,13 +113,12 @@ int tegra_output_probe(struct tegra_output *output)
>  	ddc = of_parse_phandle(output->of_node, "nvidia,ddc-i2c-bus", 0);
>  	if (ddc) {
>  		output->ddc = of_find_i2c_adapter_by_node(ddc);
> +		of_node_put(ddc);
> +
>  		if (!output->ddc) {
>  			err = -EPROBE_DEFER;
> -			of_node_put(ddc);
>  			return err;
>  		}
> -
> -		of_node_put(ddc);
>  	}
>  
>  	output->hpd_gpio = devm_gpiod_get_from_of_node(output->dev,

-- 
Regards,

Laurent Pinchart

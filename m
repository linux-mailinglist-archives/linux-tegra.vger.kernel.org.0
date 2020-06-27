Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C07720C423
	for <lists+linux-tegra@lfdr.de>; Sat, 27 Jun 2020 22:43:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725819AbgF0Uno (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sat, 27 Jun 2020 16:43:44 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:37474 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725792AbgF0Uno (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 27 Jun 2020 16:43:44 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E6C18576;
        Sat, 27 Jun 2020 22:43:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1593290622;
        bh=jvH2aA/gigMXp4FM0R9jUn0zODDOAzaZorDcNJk2SfE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CuoXchm35zDuLxDDzAVCIbwMKI+DOD1CMoMR92qVNJ8JAlCrgNLIic0K+jMjQ1B2O
         O40aySE55l3R2GgS8DaZBT+At+Jn6E8jCBZR65dmMOt6VttK1HpFTKzxLSeRhJM+MV
         DbPesDiv173/IwTr7IBAw/T+Zal6MkceHN/H6dPc=
Date:   Sat, 27 Jun 2020 23:43:38 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] drm/panel-simple: Add missing BUS descriptions
 for some panels
Message-ID: <20200627204338.GL5966@pendragon.ideasonboard.com>
References: <20200621222742.25695-1-digetx@gmail.com>
 <20200621222742.25695-3-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200621222742.25695-3-digetx@gmail.com>
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Dmitry,

Thank you for the patch.

On Mon, Jun 22, 2020 at 01:27:42AM +0300, Dmitry Osipenko wrote:
> This patch adds missing BUS fields to the display panel descriptions of
> the panels which are found on NVIDIA Tegra devices:
> 
>   1. AUO B101AW03
>   2. Chunghwa CLAA070WP03XG
>   3. Chunghwa CLAA101WA01A
>   4. Chunghwa CLAA101WB01
>   5. Innolux N156BGE L21
>   6. Samsung LTN101NT05
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 87edd2bdf09a..986df9937650 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -698,6 +698,8 @@ static const struct panel_desc auo_b101aw03 = {
>  		.width = 223,
>  		.height = 125,
>  	},
> +	.bus_format = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,

Does DRM_BUS_FLAG_PIXDATA_DRIVE_* make sense for LVDS ?

The rest looks good, except the Samsung panel for which I haven't been
able to locate a datasheet.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  	.connector_type = DRM_MODE_CONNECTOR_LVDS,
>  };
>  
> @@ -1352,6 +1354,8 @@ static const struct panel_desc chunghwa_claa070wp03xg = {
>  		.width = 94,
>  		.height = 150,
>  	},
> +	.bus_format = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
>  	.connector_type = DRM_MODE_CONNECTOR_LVDS,
>  };
>  
> @@ -1375,6 +1379,8 @@ static const struct panel_desc chunghwa_claa101wa01a = {
>  		.width = 220,
>  		.height = 120,
>  	},
> +	.bus_format = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
>  	.connector_type = DRM_MODE_CONNECTOR_LVDS,
>  };
>  
> @@ -1398,6 +1404,8 @@ static const struct panel_desc chunghwa_claa101wb01 = {
>  		.width = 223,
>  		.height = 125,
>  	},
> +	.bus_format = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
>  	.connector_type = DRM_MODE_CONNECTOR_LVDS,
>  };
>  
> @@ -2071,6 +2079,8 @@ static const struct panel_desc innolux_n156bge_l21 = {
>  		.width = 344,
>  		.height = 193,
>  	},
> +	.bus_format = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
>  	.connector_type = DRM_MODE_CONNECTOR_LVDS,
>  };
>  
> @@ -3018,6 +3028,8 @@ static const struct panel_desc samsung_ltn101nt05 = {
>  		.width = 223,
>  		.height = 125,
>  	},
> +	.bus_format = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
>  	.connector_type = DRM_MODE_CONNECTOR_LVDS,
>  };
>  

-- 
Regards,

Laurent Pinchart

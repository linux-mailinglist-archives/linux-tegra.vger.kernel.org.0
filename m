Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05BC11F5449
	for <lists+linux-tegra@lfdr.de>; Wed, 10 Jun 2020 14:11:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728574AbgFJMK7 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 10 Jun 2020 08:10:59 -0400
Received: from mga03.intel.com ([134.134.136.65]:16683 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728558AbgFJMK6 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 10 Jun 2020 08:10:58 -0400
IronPort-SDR: LeKhUo50LQShADVJd9t5KRbVNA0SgG1HXxOcTCh6lIRn1pbVQpHUaY+U3geKlyD7m6PuRKp2gx
 DSZ2P2+xZ9JA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2020 05:10:57 -0700
IronPort-SDR: axW/UbekDqOIAY+Z+yJKbtZb+YfomVFr53IM8JQwshRf3H/uLvhEqFLfc6iE4N1j7so0NNI78C
 xWPXbU6B+C7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,495,1583222400"; 
   d="scan'208";a="314486572"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
  by FMSMGA003.fm.intel.com with SMTP; 10 Jun 2020 05:10:55 -0700
Received: by stinkbox (sSMTP sendmail emulation); Wed, 10 Jun 2020 15:10:54 +0300
Date:   Wed, 10 Jun 2020 15:10:54 +0300
From:   Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] drm/tegra: Add zpos property for cursor planes
Message-ID: <20200610121054.GV6112@intel.com>
References: <20200610113059.2164132-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200610113059.2164132-1-thierry.reding@gmail.com>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Jun 10, 2020 at 01:30:59PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> As of commit 4dc55525b095 ("drm: plane: Verify that no or all planes
> have a zpos property") a warning is emitted if there's a mix of planes
> with and without a zpos property.
> 
> On Tegra, cursor planes are always composited on top of all other
> planes, which is why they never had a zpos property attached to them.
> However, since the composition order is fixed, this is trivial to
> remedy by simply attaching an immutable zpos property to them.
> 
> Reported-by: Jonathan Hunter <jonathanh@nvidia.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/dc.c  | 10 ++++++++--
>  drivers/gpu/drm/tegra/hub.c |  2 +-
>  2 files changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> index 83f31c6e891c..e7a6eb952ece 100644
> --- a/drivers/gpu/drm/tegra/dc.c
> +++ b/drivers/gpu/drm/tegra/dc.c
> @@ -787,7 +787,7 @@ static struct drm_plane *tegra_primary_plane_create(struct drm_device *drm,
>  	}
>  
>  	drm_plane_helper_add(&plane->base, &tegra_plane_helper_funcs);
> -	drm_plane_create_zpos_property(&plane->base, plane->index, 0, 255);
> +	drm_plane_create_zpos_property(&plane->base, 1 + plane->index, 1, 255);
>  
>  	err = drm_plane_create_rotation_property(&plane->base,
>  						 DRM_MODE_ROTATE_0,
> @@ -957,6 +957,7 @@ static struct drm_plane *tegra_dc_cursor_plane_create(struct drm_device *drm,
>  	}
>  
>  	drm_plane_helper_add(&plane->base, &tegra_cursor_plane_helper_funcs);
> +	drm_plane_create_zpos_immutable_property(&plane->base, 0);

zpos==0 means the plane is at the bottom of the pile. Doesn't seem to
agree what you say in the commit msg.

>  
>  	return &plane->base;
>  }
> @@ -1074,7 +1075,12 @@ static struct drm_plane *tegra_dc_overlay_plane_create(struct drm_device *drm,
>  	}
>  
>  	drm_plane_helper_add(&plane->base, &tegra_plane_helper_funcs);
> -	drm_plane_create_zpos_property(&plane->base, plane->index, 0, 255);
> +
> +	if (!cursor)
> +		drm_plane_create_zpos_property(&plane->base, 1 + plane->index,
> +					       1, 255);
> +	else
> +		drm_plane_create_zpos_immutable_property(&plane->base, 0);
>  
>  	err = drm_plane_create_rotation_property(&plane->base,
>  						 DRM_MODE_ROTATE_0,
> diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
> index a2ef8f218d4e..697d75bbb9fa 100644
> --- a/drivers/gpu/drm/tegra/hub.c
> +++ b/drivers/gpu/drm/tegra/hub.c
> @@ -590,7 +590,7 @@ struct drm_plane *tegra_shared_plane_create(struct drm_device *drm,
>  	}
>  
>  	drm_plane_helper_add(p, &tegra_shared_plane_helper_funcs);
> -	drm_plane_create_zpos_property(p, 0, 0, 255);
> +	drm_plane_create_zpos_property(p, 1 + index, 1, 255);
>  
>  	return p;
>  }
> -- 
> 2.24.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Ville Syrjälä
Intel

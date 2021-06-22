Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B00963B08E2
	for <lists+linux-tegra@lfdr.de>; Tue, 22 Jun 2021 17:25:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231936AbhFVP2M (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 22 Jun 2021 11:28:12 -0400
Received: from foss.arm.com ([217.140.110.172]:51148 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231703AbhFVP2L (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 22 Jun 2021 11:28:11 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C068931B;
        Tue, 22 Jun 2021 08:25:55 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9F59C3F792;
        Tue, 22 Jun 2021 08:25:55 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
        id 63299683943; Tue, 22 Jun 2021 16:25:54 +0100 (BST)
Date:   Tue, 22 Jun 2021 16:25:54 +0100
From:   Liviu Dudau <liviu.dudau@arm.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     daniel@ffwll.ch, airlied@linux.ie, alexander.deucher@amd.com,
        christian.koenig@amd.com, Xinhui.Pan@amd.com,
        james.qian.wang@arm.com, mihail.atanassov@arm.com,
        brian.starkey@arm.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, inki.dae@samsung.com, jy0922.shim@samsung.com,
        sw0312.kim@samsung.com, kyungmin.park@samsung.com,
        krzysztof.kozlowski@canonical.com, xinliang.liu@linaro.org,
        tiantao6@hisilicon.com, john.stultz@linaro.org,
        kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
        laurentiu.palcu@oss.nxp.com, l.stach@pengutronix.de,
        p.zabel@pengutronix.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, chunkuang.hu@kernel.org, matthias.bgg@gmail.com,
        bskeggs@redhat.com, tomba@kernel.org, hjc@rock-chips.com,
        heiko@sntech.de, benjamin.gaignard@linaro.org,
        yannick.fertre@foss.st.com, philippe.cornu@foss.st.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        wens@csie.org, jernej.skrabec@gmail.com, thierry.reding@gmail.com,
        jonathanh@nvidia.com, jyri.sarha@iki.fi, emma@anholt.net,
        linux-graphics-maintainer@vmware.com, zackr@vmware.com,
        hyun.kwon@xilinx.com, laurent.pinchart@ideasonboard.com,
        michal.simek@xilinx.com, linux-samsung-soc@vger.kernel.org,
        nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org,
        linux-mediatek@lists.infradead.org, amd-gfx@lists.freedesktop.org,
        linux-tegra@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 05/22] drm/komeda: Don't set struct
 drm_device.irq_enabled
Message-ID: <20210622152554.vc7mnohj5u2trxpi@e110455-lin.cambridge.arm.com>
References: <20210622141002.11590-1-tzimmermann@suse.de>
 <20210622141002.11590-6-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210622141002.11590-6-tzimmermann@suse.de>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Jun 22, 2021 at 04:09:45PM +0200, Thomas Zimmermann wrote:
> The field drm_device.irq_enabled is only used by legacy drivers
> with userspace modesetting. Don't set it in komeda.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Acked-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  drivers/gpu/drm/arm/display/komeda/komeda_kms.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
> index ff45f23f3d56..52a6db5707a3 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
> @@ -301,8 +301,6 @@ struct komeda_kms_dev *komeda_kms_attach(struct komeda_dev *mdev)
>  	if (err)
>  		goto free_component_binding;
>  
> -	drm->irq_enabled = true;
> -
>  	drm_kms_helper_poll_init(drm);
>  
>  	err = drm_dev_register(drm, 0);
> @@ -313,7 +311,6 @@ struct komeda_kms_dev *komeda_kms_attach(struct komeda_dev *mdev)
>  
>  free_interrupts:
>  	drm_kms_helper_poll_fini(drm);
> -	drm->irq_enabled = false;
>  free_component_binding:
>  	component_unbind_all(mdev->dev, drm);
>  cleanup_mode_config:
> @@ -331,7 +328,6 @@ void komeda_kms_detach(struct komeda_kms_dev *kms)
>  	drm_dev_unregister(drm);
>  	drm_kms_helper_poll_fini(drm);
>  	drm_atomic_helper_shutdown(drm);
> -	drm->irq_enabled = false;
>  	component_unbind_all(mdev->dev, drm);
>  	drm_mode_config_cleanup(drm);
>  	komeda_kms_cleanup_private_objs(kms);
> -- 
> 2.32.0
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯

Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC66726B136
	for <lists+linux-tegra@lfdr.de>; Wed, 16 Sep 2020 00:27:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727643AbgIOW05 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 15 Sep 2020 18:26:57 -0400
Received: from mga09.intel.com ([134.134.136.24]:63167 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727644AbgIOQV1 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 15 Sep 2020 12:21:27 -0400
IronPort-SDR: IbtUr6bGrMTllGLr2qCYUQ3EixVxs0J+WVj4+HeKmKAIC4m+DqWuILk+HLcbx/TxbuPYzO0Ank
 jSMSxBpYZvQw==
X-IronPort-AV: E=McAfee;i="6000,8403,9745"; a="160229129"
X-IronPort-AV: E=Sophos;i="5.76,430,1592895600"; 
   d="scan'208";a="160229129"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2020 09:14:54 -0700
IronPort-SDR: 1NweJQ/LUpVMZGR2CNL7idgXNRkgQYlVvGnbjzV+v3epVrjgQ3OHB8LQ+g+ZsKRvdD4MQ7Rl1b
 B/J1ZOWPLOog==
X-IronPort-AV: E=Sophos;i="5.76,430,1592895600"; 
   d="scan'208";a="451484915"
Received: from oshaham-mobl.ger.corp.intel.com (HELO [10.214.241.3]) ([10.214.241.3])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2020 09:14:31 -0700
Subject: Re: [PATCH v2 06/21] drm/i915: Introduce GEM object functions
To:     Thomas Zimmermann <tzimmermann@suse.de>, alexander.deucher@amd.com,
        christian.koenig@amd.com, airlied@linux.ie, daniel@ffwll.ch,
        linux@armlinux.org.uk, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, l.stach@pengutronix.de,
        christian.gmeiner@gmail.com, inki.dae@samsung.com,
        jy0922.shim@samsung.com, sw0312.kim@samsung.com,
        kyungmin.park@samsung.com, kgene@kernel.org, krzk@kernel.org,
        patrik.r.jakobsson@gmail.com, jani.nikula@linux.intel.com,
        joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
        chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
        matthias.bgg@gmail.com, robdclark@gmail.com, sean@poorly.run,
        bskeggs@redhat.com, tomi.valkeinen@ti.com, eric@anholt.net,
        hjc@rock-chips.com, heiko@sntech.de, thierry.reding@gmail.com,
        jonathanh@nvidia.com, rodrigosiqueiramelo@gmail.com,
        hamohammed.sa@gmail.com, oleksandr_andrushchenko@epam.com,
        hyun.kwon@xilinx.com, laurent.pinchart@ideasonboard.com,
        michal.simek@xilinx.com, sumit.semwal@linaro.org,
        evan.quan@amd.com, Hawking.Zhang@amd.com, tianci.yin@amd.com,
        marek.olsak@amd.com, hdegoede@redhat.com,
        andrey.grodzovsky@amd.com, Felix.Kuehling@amd.com,
        xinhui.pan@amd.com, aaron.liu@amd.com, nirmoy.das@amd.com,
        chris@chris-wilson.co.uk, matthew.auld@intel.com,
        andi.shyti@intel.com, sam@ravnborg.org, miaoqinglang@huawei.com,
        emil.velikov@collabora.com
Cc:     amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        etnaviv@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
        xen-devel@lists.xenproject.org
References: <20200915145958.19993-1-tzimmermann@suse.de>
 <20200915145958.19993-7-tzimmermann@suse.de>
From:   Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <76e5eb2f-e324-8f56-866a-15b022abba8d@linux.intel.com>
Date:   Tue, 15 Sep 2020 17:14:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200915145958.19993-7-tzimmermann@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 15/09/2020 15:59, Thomas Zimmermann wrote:
> GEM object functions deprecate several similar callback interfaces in
> struct drm_driver. This patch replaces the per-driver callbacks with
> per-instance callbacks in i915.
> 
> v2:
> 	* move object-function instance to i915_gem_object.c (Jani)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_object.c    | 21 ++++++++++++++++---
>   drivers/gpu/drm/i915/gem/i915_gem_object.h    |  3 ---
>   drivers/gpu/drm/i915/i915_drv.c               |  4 ----
>   .../gpu/drm/i915/selftests/mock_gem_device.c  |  3 ---
>   4 files changed, 18 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> index c8421fd9d2dc..3389ac972d16 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> @@ -39,9 +39,18 @@ static struct i915_global_object {
>   	struct kmem_cache *slab_objects;
>   } global;
>   
> +static const struct drm_gem_object_funcs i915_gem_object_funcs;
> +
>   struct drm_i915_gem_object *i915_gem_object_alloc(void)
>   {
> -	return kmem_cache_zalloc(global.slab_objects, GFP_KERNEL);
> +	struct drm_i915_gem_object *obj;
> +
> +	obj = kmem_cache_zalloc(global.slab_objects, GFP_KERNEL);
> +	if (!obj)
> +		return NULL;
> +	obj->base.funcs = &i915_gem_object_funcs;
> +
> +	return obj;
>   }
>   
>   void i915_gem_object_free(struct drm_i915_gem_object *obj)
> @@ -101,7 +110,7 @@ void i915_gem_object_set_cache_coherency(struct drm_i915_gem_object *obj,
>   		!(obj->cache_coherent & I915_BO_CACHE_COHERENT_FOR_WRITE);
>   }
>   
> -void i915_gem_close_object(struct drm_gem_object *gem, struct drm_file *file)
> +static void i915_gem_close_object(struct drm_gem_object *gem, struct drm_file *file)
>   {
>   	struct drm_i915_gem_object *obj = to_intel_bo(gem);
>   	struct drm_i915_file_private *fpriv = file->driver_priv;
> @@ -264,7 +273,7 @@ static void __i915_gem_free_work(struct work_struct *work)
>   	i915_gem_flush_free_objects(i915);
>   }
>   
> -void i915_gem_free_object(struct drm_gem_object *gem_obj)
> +static void i915_gem_free_object(struct drm_gem_object *gem_obj)
>   {
>   	struct drm_i915_gem_object *obj = to_intel_bo(gem_obj);
>   	struct drm_i915_private *i915 = to_i915(obj->base.dev);
> @@ -403,6 +412,12 @@ int __init i915_global_objects_init(void)
>   	return 0;
>   }
>   
> +static const struct drm_gem_object_funcs i915_gem_object_funcs = {
> +	.free = i915_gem_free_object,
> +	.close = i915_gem_close_object,
> +	.export = i915_gem_prime_export,
> +};
> +
>   #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
>   #include "selftests/huge_gem_object.c"
>   #include "selftests/huge_pages.c"
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> index d46db8d8f38e..eaf3d4147be0 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> @@ -38,9 +38,6 @@ void __i915_gem_object_release_shmem(struct drm_i915_gem_object *obj,
>   
>   int i915_gem_object_attach_phys(struct drm_i915_gem_object *obj, int align);
>   
> -void i915_gem_close_object(struct drm_gem_object *gem, struct drm_file *file);
> -void i915_gem_free_object(struct drm_gem_object *obj);
> -
>   void i915_gem_flush_free_objects(struct drm_i915_private *i915);
>   
>   struct sg_table *
> diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
> index 94e00e450683..011a3fb41ece 100644
> --- a/drivers/gpu/drm/i915/i915_drv.c
> +++ b/drivers/gpu/drm/i915/i915_drv.c
> @@ -1750,12 +1750,8 @@ static struct drm_driver driver = {
>   	.lastclose = i915_driver_lastclose,
>   	.postclose = i915_driver_postclose,
>   
> -	.gem_close_object = i915_gem_close_object,
> -	.gem_free_object_unlocked = i915_gem_free_object,
> -
>   	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
>   	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
> -	.gem_prime_export = i915_gem_prime_export,
>   	.gem_prime_import = i915_gem_prime_import,
>   
>   	.dumb_create = i915_gem_dumb_create,
> diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> index f127e633f7ca..9244b5d6fb01 100644
> --- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> +++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> @@ -87,9 +87,6 @@ static struct drm_driver mock_driver = {
>   	.name = "mock",
>   	.driver_features = DRIVER_GEM,
>   	.release = mock_device_release,
> -
> -	.gem_close_object = i915_gem_close_object,
> -	.gem_free_object_unlocked = i915_gem_free_object,
>   };
>   
>   static void release_dev(struct device *dev)
> 

Looks obviously fine.

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko

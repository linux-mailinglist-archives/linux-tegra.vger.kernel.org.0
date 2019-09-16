Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71AA8B3DC1
	for <lists+linux-tegra@lfdr.de>; Mon, 16 Sep 2019 17:35:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389267AbfIPPfe (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 16 Sep 2019 11:35:34 -0400
Received: from imap1.codethink.co.uk ([176.9.8.82]:43961 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728303AbfIPPfe (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 16 Sep 2019 11:35:34 -0400
Received: from [167.98.27.226] (helo=[10.35.6.110])
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1i9t2J-00023P-4o; Mon, 16 Sep 2019 16:35:31 +0100
Subject: Re: [PATCH 04/11] drm/nouveau: gp10b: Add custom L2 cache
 implementation
To:     Thierry Reding <thierry.reding@gmail.com>,
        Ben Skeggs <bskeggs@redhat.com>
Cc:     nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org
References: <20190916150412.10025-1-thierry.reding@gmail.com>
 <20190916150412.10025-5-thierry.reding@gmail.com>
From:   Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <7d917275-0a2d-6de3-e837-6dfa4d9a29c8@codethink.co.uk>
Date:   Mon, 16 Sep 2019 16:35:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190916150412.10025-5-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 16/09/2019 16:04, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> There are extra registers that need to be programmed to make the level 2
> cache work on GP10B, such as the stream ID register that is used when an
> SMMU is used to translate memory addresses.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>   .../gpu/drm/nouveau/include/nvkm/subdev/ltc.h |  1 +
>   .../gpu/drm/nouveau/nvkm/engine/device/base.c |  2 +-
>   .../gpu/drm/nouveau/nvkm/subdev/ltc/Kbuild    |  1 +
>   .../gpu/drm/nouveau/nvkm/subdev/ltc/gp10b.c   | 69 +++++++++++++++++++
>   .../gpu/drm/nouveau/nvkm/subdev/ltc/priv.h    |  2 +
>   5 files changed, 74 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gp10b.c
> 
> diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/ltc.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/ltc.h
> index 644d527c3b96..d76f60d7d29a 100644
> --- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/ltc.h
> +++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/ltc.h
> @@ -40,4 +40,5 @@ int gm107_ltc_new(struct nvkm_device *, int, struct nvkm_ltc **);
>   int gm200_ltc_new(struct nvkm_device *, int, struct nvkm_ltc **);
>   int gp100_ltc_new(struct nvkm_device *, int, struct nvkm_ltc **);
>   int gp102_ltc_new(struct nvkm_device *, int, struct nvkm_ltc **);
> +int gp10b_ltc_new(struct nvkm_device *, int, struct nvkm_ltc **);
>   #endif
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
> index c3c7159f3411..d2d6d5f4028a 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
> @@ -2380,7 +2380,7 @@ nv13b_chipset = {
>   	.fuse = gm107_fuse_new,
>   	.ibus = gp10b_ibus_new,
>   	.imem = gk20a_instmem_new,
> -	.ltc = gp102_ltc_new,
> +	.ltc = gp10b_ltc_new,
>   	.mc = gp10b_mc_new,
>   	.mmu = gp10b_mmu_new,
>   	.secboot = gp10b_secboot_new,
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/ltc/Kbuild b/drivers/gpu/drm/nouveau/nvkm/subdev/ltc/Kbuild
> index 2b6d36ea7067..728d75010847 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/ltc/Kbuild
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/ltc/Kbuild
> @@ -6,3 +6,4 @@ nvkm-y += nvkm/subdev/ltc/gm107.o
>   nvkm-y += nvkm/subdev/ltc/gm200.o
>   nvkm-y += nvkm/subdev/ltc/gp100.o
>   nvkm-y += nvkm/subdev/ltc/gp102.o
> +nvkm-y += nvkm/subdev/ltc/gp10b.o
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gp10b.c b/drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gp10b.c
> new file mode 100644
> index 000000000000..4d27c6ea1552
> --- /dev/null
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gp10b.c
> @@ -0,0 +1,69 @@
> +/*
> + * Copyright (c) 2019 NVIDIA Corporation.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + *
> + * Authors: Thierry Reding
> + */
> +
> +#include "priv.h"
> +
> +static void
> +gp10b_ltc_init(struct nvkm_ltc *ltc)
> +{
> +	struct nvkm_device *device = ltc->subdev.device;
> +#ifdef CONFIG_IOMMU_API
> +	struct iommu_fwspec *spec;
> +#endif
> +
> +	nvkm_wr32(device, 0x17e27c, ltc->ltc_nr);
> +	nvkm_wr32(device, 0x17e000, ltc->ltc_nr);
> +	nvkm_wr32(device, 0x100800, ltc->ltc_nr);
> +
> +#ifdef CONFIG_IOMMU_API
> +	spec = dev_iommu_fwspec_get(device->dev);
> +	if (spec) {
> +		u32 sid = spec->ids[0] & 0xffff;
> +
> +		/* stream ID */
> +		nvkm_wr32(device, 0x160000, sid << 2);
> +	}
> +#endif

Could we get rid of the #ifdef blocks here if there was a NULL
inline version of dev_iommu_fwspec_get() in the include/linux/iommu.h
header? The compiler should then optimise the lot out if the config
is not set.

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

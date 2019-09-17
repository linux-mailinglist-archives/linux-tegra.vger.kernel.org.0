Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 995B0B4627
	for <lists+linux-tegra@lfdr.de>; Tue, 17 Sep 2019 05:50:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387692AbfIQDuK (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 16 Sep 2019 23:50:10 -0400
Received: from mail-vs1-f68.google.com ([209.85.217.68]:39669 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728010AbfIQDuK (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 16 Sep 2019 23:50:10 -0400
Received: by mail-vs1-f68.google.com with SMTP id f15so1112895vsq.6
        for <linux-tegra@vger.kernel.org>; Mon, 16 Sep 2019 20:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Wyh6i9l/RAW8OFou+gcY3YUkrJ7HYeG/xGRAb6hJuwA=;
        b=tDke3i4qh8Bl4wSK7wWf4Fn3m5WOu6eoClxmlIvAXT2G9sh+xnxSLIY4OcbdwD7VUt
         peXfN7lrow7XpzWSHOqbvkQy9JL27TmAWgBbRQkpmiuMmSwwdZfwV9MJFCytvCTjTM9h
         0pgpD/oZCNLuoaS5Vk6GNxmgQ4bdGuVj6839pXON7Ps/NCuXm1gCoJJBA8G5V1vj3WJO
         adgsb/xWMOhueTP/Q9E1uP8enlknzvBtq6xr2OPpen8kb13YK6YdudWmx7+2IJtL/nSI
         Yhmg0VviAKwzDBGe1qS5lRjhLwaBeuYrauHOyxGEKljWgXWHhJHOya8dIejiQngKPDWz
         6OPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Wyh6i9l/RAW8OFou+gcY3YUkrJ7HYeG/xGRAb6hJuwA=;
        b=B/MCqBHiEpSU283hZoiSL6l0UN1qKZvlXV9uj6aI2WnBor9xBsGvvBL/sv7mCbpe0z
         rtUsdni40KPQbPnJYjgXqbxfAdcu93zkB9V7g/0Y8/Jt8Hi2fHFdIkgwc7iOBnqoRCd9
         vkxBi9rq8ki1Wrv9u2/3hefdrRBHMyMYlGa3PIjb/OMcsEeopyxtP0ogaZ1EtysMynzp
         HoIlhiix+26uhfHwiksIyOyr9vIKifh/zrsfVR/tkf1qThKO32btshXMxTJrHxauULew
         gsjgK9astsH+hr1c1gc+aZKhE9dg8G1XP07Xt3IQe9k5nPtNh7ydEh0uauWACtTPcCVV
         wGkA==
X-Gm-Message-State: APjAAAXmE2FJbqJsyjAwGd+ftWARkckCDgZ3lyYxARZzQjgIl8IM1Lzw
        JQh5ggapobZlZxtKsH5OSJQBGhNywf2wZPIzC08=
X-Google-Smtp-Source: APXvYqxkuaY23gbqfyRIwAHRgdSM9PQsog4c4vqtJmpAgtKvqJ/M51RIkM2OrBpOMfVxMWubS9Bv1LXwdThepN+Yftc=
X-Received: by 2002:a67:cd95:: with SMTP id r21mr704572vsl.84.1568692208862;
 Mon, 16 Sep 2019 20:50:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190916150412.10025-1-thierry.reding@gmail.com> <20190916150412.10025-4-thierry.reding@gmail.com>
In-Reply-To: <20190916150412.10025-4-thierry.reding@gmail.com>
From:   Ben Skeggs <skeggsb@gmail.com>
Date:   Tue, 17 Sep 2019 13:49:57 +1000
Message-ID: <CACAvsv6AcwWW542AJNkyR-q+aQ0GLFc0C3Sior_bYPTEjBV4LA@mail.gmail.com>
Subject: Re: [PATCH 03/11] drm/nouveau: secboot: Read WPR configuration from
 GPU registers
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Ben Skeggs <bskeggs@redhat.com>, linux-tegra@vger.kernel.org,
        ML nouveau <nouveau@lists.freedesktop.org>,
        ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, 17 Sep 2019 at 01:04, Thierry Reding <thierry.reding@gmail.com> wrote:
>
> From: Thierry Reding <treding@nvidia.com>
>
> The GPUs found on Tegra SoCs have registers that can be used to read the
> WPR configuration. Use these registers instead of reaching into the
> memory controller's register space to read the same information.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../drm/nouveau/nvkm/subdev/secboot/gm200.h   |  2 +-
>  .../drm/nouveau/nvkm/subdev/secboot/gm20b.c   | 81 ++++++++++++-------
>  .../drm/nouveau/nvkm/subdev/secboot/gp10b.c   |  4 +-
>  3 files changed, 53 insertions(+), 34 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm200.h b/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm200.h
> index 62c5e162099a..280b1448df88 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm200.h
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm200.h
> @@ -41,6 +41,6 @@ int gm200_secboot_run_blob(struct nvkm_secboot *, struct nvkm_gpuobj *,
>                            struct nvkm_falcon *);
>
>  /* Tegra-only */
> -int gm20b_secboot_tegra_read_wpr(struct gm200_secboot *, u32);
> +int gm20b_secboot_tegra_read_wpr(struct gm200_secboot *);
>
>  #endif
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm20b.c b/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm20b.c
> index df8b919dcf09..f8a543122219 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm20b.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm20b.c
> @@ -23,39 +23,65 @@
>  #include "acr.h"
>  #include "gm200.h"
>
> -#define TEGRA210_MC_BASE                       0x70019000
> -
>  #ifdef CONFIG_ARCH_TEGRA
> -#define MC_SECURITY_CARVEOUT2_CFG0             0xc58
> -#define MC_SECURITY_CARVEOUT2_BOM_0            0xc5c
> -#define MC_SECURITY_CARVEOUT2_BOM_HI_0         0xc60
> -#define MC_SECURITY_CARVEOUT2_SIZE_128K                0xc64
> -#define TEGRA_MC_SECURITY_CARVEOUT_CFG_LOCKED  (1 << 1)
>  /**
>   * gm20b_secboot_tegra_read_wpr() - read the WPR registers on Tegra
>   *
> - * On dGPU, we can manage the WPR region ourselves, but on Tegra the WPR region
> - * is reserved from system memory by the bootloader and irreversibly locked.
> - * This function reads the address and size of the pre-configured WPR region.
> + * On dGPU, we can manage the WPR region ourselves, but on Tegra this region
> + * is allocated from system memory by the secure firmware. The region is then
> + * marked as a "secure carveout" and irreversibly locked. Furthermore, the WPR
> + * secure carveout is also configured to be sent to the GPU via a dedicated
> + * serial bus between the memory controller and the GPU. The GPU requests this
> + * information upon leaving reset and exposes it through a FIFO register at
> + * offset 0x100cd4.
> + *
> + * The FIFO register's lower 4 bits can be used to set the read index into the
> + * FIFO. After each read of the FIFO register, the read index is incremented.
> + *
> + * Indices 2 and 3 contain the lower and upper addresses of the WPR. These are
> + * stored in units of 256 B. The WPR is inclusive of both addresses.
> + *
> + * Unfortunately, for some reason the WPR info register doesn't contain the
> + * correct values for the secure carveout. It seems like the upper address is
> + * always too small by 128 KiB - 1. Given that the secure carvout size in the
> + * memory controller configuration is specified in units of 128 KiB, it's
> + * possible that the computation of the upper address of the WPR is wrong and
> + * causes this difference.
>   */
>  int
> -gm20b_secboot_tegra_read_wpr(struct gm200_secboot *gsb, u32 mc_base)
> +gm20b_secboot_tegra_read_wpr(struct gm200_secboot *gsb)
>  {
> +       struct nvkm_device *device = gsb->base.subdev.device;
>         struct nvkm_secboot *sb = &gsb->base;
> -       void __iomem *mc;
> -       u32 cfg;
> +       u64 base, limit;
> +       u32 value;
>
> -       mc = ioremap(mc_base, 0xd00);
> -       if (!mc) {
> -               nvkm_error(&sb->subdev, "Cannot map Tegra MC registers\n");
> -               return -ENOMEM;
> -       }
> -       sb->wpr_addr = ioread32_native(mc + MC_SECURITY_CARVEOUT2_BOM_0) |
> -             ((u64)ioread32_native(mc + MC_SECURITY_CARVEOUT2_BOM_HI_0) << 32);
> -       sb->wpr_size = ioread32_native(mc + MC_SECURITY_CARVEOUT2_SIZE_128K)
> -               << 17;
> -       cfg = ioread32_native(mc + MC_SECURITY_CARVEOUT2_CFG0);
> -       iounmap(mc);
> +       /* set WPR info register to point at WPR base address register */
> +       value = nvkm_rd32(device, 0x100cd4);
> +       value &= ~0xf;
> +       value |= 0x2;
> +       nvkm_wr32(device, 0x100cd4, value);
> +
> +       /* read base address */
> +       value = nvkm_rd32(device, 0x100cd4);
> +       base = (u64)(value >> 4) << 12;
> +
> +       /* read limit */
> +       value = nvkm_rd32(device, 0x100cd4);
> +       limit = (u64)(value >> 4) << 12;
acr_r352_wpr_is_set() does a similar readout to confirm the HS
firmware did its job on dGPU, perhaps this part of it could be
factored out into a function that could be used in both places?

> +
> +       /*
> +        * The upper address of the WPR seems to be computed wrongly and is
> +        * actually SZ_128K - 1 bytes lower than it should be. Adjust the
> +        * value accordingly.
> +        */
> +       limit += SZ_128K - 1;
> +
> +       sb->wpr_size = limit - base + 1;
> +       sb->wpr_addr = base;
> +
> +       nvkm_info(&sb->subdev, "WPR: %016llx-%016llx\n", sb->wpr_addr,
> +                 sb->wpr_addr + sb->wpr_size - 1);
>
>         /* Check that WPR settings are valid */
>         if (sb->wpr_size == 0) {
> @@ -63,11 +89,6 @@ gm20b_secboot_tegra_read_wpr(struct gm200_secboot *gsb, u32 mc_base)
>                 return -EINVAL;
>         }
>
> -       if (!(cfg & TEGRA_MC_SECURITY_CARVEOUT_CFG_LOCKED)) {
> -               nvkm_error(&sb->subdev, "WPR region not locked\n");
> -               return -EINVAL;
> -       }
> -
>         return 0;
>  }
>  #else
> @@ -85,7 +106,7 @@ gm20b_secboot_oneinit(struct nvkm_secboot *sb)
>         struct gm200_secboot *gsb = gm200_secboot(sb);
>         int ret;
>
> -       ret = gm20b_secboot_tegra_read_wpr(gsb, TEGRA210_MC_BASE);
> +       ret = gm20b_secboot_tegra_read_wpr(gsb);
>         if (ret)
>                 return ret;
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gp10b.c b/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gp10b.c
> index 28ca29d0eeee..d84e85825995 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gp10b.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gp10b.c
> @@ -23,15 +23,13 @@
>  #include "acr.h"
>  #include "gm200.h"
>
> -#define TEGRA186_MC_BASE                       0x02c10000
> -
>  static int
>  gp10b_secboot_oneinit(struct nvkm_secboot *sb)
>  {
>         struct gm200_secboot *gsb = gm200_secboot(sb);
>         int ret;
>
> -       ret = gm20b_secboot_tegra_read_wpr(gsb, TEGRA186_MC_BASE);
> +       ret = gm20b_secboot_tegra_read_wpr(gsb);
>         if (ret)
>                 return ret;
>
> --
> 2.23.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

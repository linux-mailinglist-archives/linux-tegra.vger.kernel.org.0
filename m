Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65CBFB5887
	for <lists+linux-tegra@lfdr.de>; Wed, 18 Sep 2019 01:28:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726311AbfIQX2h (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 17 Sep 2019 19:28:37 -0400
Received: from mail-vs1-f65.google.com ([209.85.217.65]:34368 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726227AbfIQX2h (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 17 Sep 2019 19:28:37 -0400
Received: by mail-vs1-f65.google.com with SMTP id d3so3272567vsr.1
        for <linux-tegra@vger.kernel.org>; Tue, 17 Sep 2019 16:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ghCmD2mjVWUh7rX/GA8Wd5n7+aTE42hvZmr5bSGoHUk=;
        b=f/x6qTEiLZDxCa6p9MV8mwDmSR1eJStEPv/0qIjzytz6p7soehLmF0+6ANT/lrMZ+0
         2kDUY/80gRFuaFvxgrCDDxcxoFYrakoNeRBGTMYobOZRhqBKIf1sWkBJzpTC+Gg+erky
         XYZuknbUXoF28rah36hTYAtWpLHyKlr9duN8an9B7pKxgwevX1bMnIW3FXbVRm5VWmMh
         zkMza9cnjzPLf7anGphTTjqB0U8qSywJ5FekZTO1gF9f+RGNf/0cp5D66yn0YjogiQXP
         /tTAPMZ5UZSOMl8zzOThcVoldlsSmPc2npbCSpcP9KIFR5tLItV3C+YfKP/IF00tw8SF
         +beg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ghCmD2mjVWUh7rX/GA8Wd5n7+aTE42hvZmr5bSGoHUk=;
        b=ruQd6vADbiA5hFwuB0esBhElfKToaPqxknxv3lizaMGv3M2vWgLvnaBAFvaxanvUK6
         rgA+y9ot3K9r1i/bSkwkZhVCfrHujX4OxKCxFu2Mu7c0jm/pmSrl0Jq1NQDmVGUIX1bT
         YU2QwOVB+uUJWeIFOlZBCVHQ3e3enn22Gtu4ULna/XUHTTwrU25QBefvr3huFzZWEwKV
         /14F5SZ0S/siRlbYsy+e7d9/W22HPzkV8t4HHSxxOBE/adbhXFM5XH1mJqoAppAbR+kR
         tmvgpYhxRSUQiKHqa6K7802DROqilzsw2kj05LCh4tIyXFpToDUEXIrMQeuGFe8pHmC7
         Qdhw==
X-Gm-Message-State: APjAAAXNYUoEckBBXFY3qY4fLvcqTJW7d0iOjpgfMxKKV/0ao0YjJz+o
        Pc1h+34WiDM4m2Z6xflXX0GRh+rRzb3gPWKbH9M=
X-Google-Smtp-Source: APXvYqzgLMqLgxAf/4X7CDhzWXdNsxRXhCFxGEJd0RhxTap+LNASZkKr6sZMO+TetZrEjPIFZZGm9HDVUQdbnzS5tak=
X-Received: by 2002:a67:cd95:: with SMTP id r21mr657097vsl.84.1568762915509;
 Tue, 17 Sep 2019 16:28:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190916150412.10025-1-thierry.reding@gmail.com>
 <20190916150412.10025-4-thierry.reding@gmail.com> <CACAvsv6AcwWW542AJNkyR-q+aQ0GLFc0C3Sior_bYPTEjBV4LA@mail.gmail.com>
 <20190917084041.GB17854@ulmo>
In-Reply-To: <20190917084041.GB17854@ulmo>
From:   Ben Skeggs <skeggsb@gmail.com>
Date:   Wed, 18 Sep 2019 09:28:24 +1000
Message-ID: <CACAvsv4zc7Ox-E+dDFxZCcueFNjHA2jNy6xHV+3UGs6w1oyg+Q@mail.gmail.com>
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

On Tue, 17 Sep 2019 at 18:40, Thierry Reding <thierry.reding@gmail.com> wrote:
>
> On Tue, Sep 17, 2019 at 01:49:57PM +1000, Ben Skeggs wrote:
> > On Tue, 17 Sep 2019 at 01:04, Thierry Reding <thierry.reding@gmail.com> wrote:
> > >
> > > From: Thierry Reding <treding@nvidia.com>
> > >
> > > The GPUs found on Tegra SoCs have registers that can be used to read the
> > > WPR configuration. Use these registers instead of reaching into the
> > > memory controller's register space to read the same information.
> > >
> > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > > ---
> > >  .../drm/nouveau/nvkm/subdev/secboot/gm200.h   |  2 +-
> > >  .../drm/nouveau/nvkm/subdev/secboot/gm20b.c   | 81 ++++++++++++-------
> > >  .../drm/nouveau/nvkm/subdev/secboot/gp10b.c   |  4 +-
> > >  3 files changed, 53 insertions(+), 34 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm200.h b/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm200.h
> > > index 62c5e162099a..280b1448df88 100644
> > > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm200.h
> > > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm200.h
> > > @@ -41,6 +41,6 @@ int gm200_secboot_run_blob(struct nvkm_secboot *, struct nvkm_gpuobj *,
> > >                            struct nvkm_falcon *);
> > >
> > >  /* Tegra-only */
> > > -int gm20b_secboot_tegra_read_wpr(struct gm200_secboot *, u32);
> > > +int gm20b_secboot_tegra_read_wpr(struct gm200_secboot *);
> > >
> > >  #endif
> > > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm20b.c b/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm20b.c
> > > index df8b919dcf09..f8a543122219 100644
> > > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm20b.c
> > > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm20b.c
> > > @@ -23,39 +23,65 @@
> > >  #include "acr.h"
> > >  #include "gm200.h"
> > >
> > > -#define TEGRA210_MC_BASE                       0x70019000
> > > -
> > >  #ifdef CONFIG_ARCH_TEGRA
> > > -#define MC_SECURITY_CARVEOUT2_CFG0             0xc58
> > > -#define MC_SECURITY_CARVEOUT2_BOM_0            0xc5c
> > > -#define MC_SECURITY_CARVEOUT2_BOM_HI_0         0xc60
> > > -#define MC_SECURITY_CARVEOUT2_SIZE_128K                0xc64
> > > -#define TEGRA_MC_SECURITY_CARVEOUT_CFG_LOCKED  (1 << 1)
> > >  /**
> > >   * gm20b_secboot_tegra_read_wpr() - read the WPR registers on Tegra
> > >   *
> > > - * On dGPU, we can manage the WPR region ourselves, but on Tegra the WPR region
> > > - * is reserved from system memory by the bootloader and irreversibly locked.
> > > - * This function reads the address and size of the pre-configured WPR region.
> > > + * On dGPU, we can manage the WPR region ourselves, but on Tegra this region
> > > + * is allocated from system memory by the secure firmware. The region is then
> > > + * marked as a "secure carveout" and irreversibly locked. Furthermore, the WPR
> > > + * secure carveout is also configured to be sent to the GPU via a dedicated
> > > + * serial bus between the memory controller and the GPU. The GPU requests this
> > > + * information upon leaving reset and exposes it through a FIFO register at
> > > + * offset 0x100cd4.
> > > + *
> > > + * The FIFO register's lower 4 bits can be used to set the read index into the
> > > + * FIFO. After each read of the FIFO register, the read index is incremented.
> > > + *
> > > + * Indices 2 and 3 contain the lower and upper addresses of the WPR. These are
> > > + * stored in units of 256 B. The WPR is inclusive of both addresses.
> > > + *
> > > + * Unfortunately, for some reason the WPR info register doesn't contain the
> > > + * correct values for the secure carveout. It seems like the upper address is
> > > + * always too small by 128 KiB - 1. Given that the secure carvout size in the
> > > + * memory controller configuration is specified in units of 128 KiB, it's
> > > + * possible that the computation of the upper address of the WPR is wrong and
> > > + * causes this difference.
> > >   */
> > >  int
> > > -gm20b_secboot_tegra_read_wpr(struct gm200_secboot *gsb, u32 mc_base)
> > > +gm20b_secboot_tegra_read_wpr(struct gm200_secboot *gsb)
> > >  {
> > > +       struct nvkm_device *device = gsb->base.subdev.device;
> > >         struct nvkm_secboot *sb = &gsb->base;
> > > -       void __iomem *mc;
> > > -       u32 cfg;
> > > +       u64 base, limit;
> > > +       u32 value;
> > >
> > > -       mc = ioremap(mc_base, 0xd00);
> > > -       if (!mc) {
> > > -               nvkm_error(&sb->subdev, "Cannot map Tegra MC registers\n");
> > > -               return -ENOMEM;
> > > -       }
> > > -       sb->wpr_addr = ioread32_native(mc + MC_SECURITY_CARVEOUT2_BOM_0) |
> > > -             ((u64)ioread32_native(mc + MC_SECURITY_CARVEOUT2_BOM_HI_0) << 32);
> > > -       sb->wpr_size = ioread32_native(mc + MC_SECURITY_CARVEOUT2_SIZE_128K)
> > > -               << 17;
> > > -       cfg = ioread32_native(mc + MC_SECURITY_CARVEOUT2_CFG0);
> > > -       iounmap(mc);
> > > +       /* set WPR info register to point at WPR base address register */
> > > +       value = nvkm_rd32(device, 0x100cd4);
> > > +       value &= ~0xf;
> > > +       value |= 0x2;
> > > +       nvkm_wr32(device, 0x100cd4, value);
> > > +
> > > +       /* read base address */
> > > +       value = nvkm_rd32(device, 0x100cd4);
> > > +       base = (u64)(value >> 4) << 12;
> > > +
> > > +       /* read limit */
> > > +       value = nvkm_rd32(device, 0x100cd4);
> > > +       limit = (u64)(value >> 4) << 12;
> > acr_r352_wpr_is_set() does a similar readout to confirm the HS
> > firmware did its job on dGPU, perhaps this part of it could be
> > factored out into a function that could be used in both places?
>
> I hadn't seen that function. It looks to me like these are now both
> doing exactly the same thing. The acr_r352_wpr_is_set() also seems to
> serve only to check that what's read from these WPR info registers
> matches what was configured as the WPR region previously. This is now
> rather pointless because, unless the computations differ, the result
> must be true.
Yeah, I believe its purpose is simply to confirm the HS firmware
executed correctly.

>
> Honestly, I'm not sure we really need to check this. My understanding is
> that these WPR info registers are the canonical way of obtaining the WPR
> region base and limit. The way that this works is that the GPU has a
> dedicated bus to the memory controller and it fetches these parameters
> from the MC when it leaves reset.
>
> One oddity here, though, is that the code in acr_r352_wpr_is_set() does
> not account for the strange way that the limit is encoded in these
> registers. I suspect that this is some weird hardware bug that happens
> during the transfer of the WPR information to the GPU. I came across
> some documentation that specifically defines the limit register to
> contain the upper limit of the WPR in units of 256 B with the WPR being
> inclusive of both the base and the limit. I'm not exactly sure why this
> has gone unnoticed, but I think nvgpu doesn't actually test for the WPR
> size when it loads the firmware. I only ran into this when implementing
> the WPR info register readout because Nouveau would refuse to load the
> firmware because it didn't fit into what it thought was the WPR.
>
> Anyway, I've tested this on all of gm20b, gp10b and gv11b and the above
> computations give me the same values that the (SoC) firmware claims that
> it configured the WPR with.
>
> Given the above, do you see any further use for acr_r352_wpr_is_set()?
> Should I follow up with a patch removing it?
You can leave it for now if you like, I'm reworking that entire
subsystem already anyway and can nuke it there.

Ben.

>
> Thierry
>
> >
> > > +
> > > +       /*
> > > +        * The upper address of the WPR seems to be computed wrongly and is
> > > +        * actually SZ_128K - 1 bytes lower than it should be. Adjust the
> > > +        * value accordingly.
> > > +        */
> > > +       limit += SZ_128K - 1;
> > > +
> > > +       sb->wpr_size = limit - base + 1;
> > > +       sb->wpr_addr = base;
> > > +
> > > +       nvkm_info(&sb->subdev, "WPR: %016llx-%016llx\n", sb->wpr_addr,
> > > +                 sb->wpr_addr + sb->wpr_size - 1);
> > >
> > >         /* Check that WPR settings are valid */
> > >         if (sb->wpr_size == 0) {
> > > @@ -63,11 +89,6 @@ gm20b_secboot_tegra_read_wpr(struct gm200_secboot *gsb, u32 mc_base)
> > >                 return -EINVAL;
> > >         }
> > >
> > > -       if (!(cfg & TEGRA_MC_SECURITY_CARVEOUT_CFG_LOCKED)) {
> > > -               nvkm_error(&sb->subdev, "WPR region not locked\n");
> > > -               return -EINVAL;
> > > -       }
> > > -
> > >         return 0;
> > >  }
> > >  #else
> > > @@ -85,7 +106,7 @@ gm20b_secboot_oneinit(struct nvkm_secboot *sb)
> > >         struct gm200_secboot *gsb = gm200_secboot(sb);
> > >         int ret;
> > >
> > > -       ret = gm20b_secboot_tegra_read_wpr(gsb, TEGRA210_MC_BASE);
> > > +       ret = gm20b_secboot_tegra_read_wpr(gsb);
> > >         if (ret)
> > >                 return ret;
> > >
> > > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gp10b.c b/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gp10b.c
> > > index 28ca29d0eeee..d84e85825995 100644
> > > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gp10b.c
> > > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gp10b.c
> > > @@ -23,15 +23,13 @@
> > >  #include "acr.h"
> > >  #include "gm200.h"
> > >
> > > -#define TEGRA186_MC_BASE                       0x02c10000
> > > -
> > >  static int
> > >  gp10b_secboot_oneinit(struct nvkm_secboot *sb)
> > >  {
> > >         struct gm200_secboot *gsb = gm200_secboot(sb);
> > >         int ret;
> > >
> > > -       ret = gm20b_secboot_tegra_read_wpr(gsb, TEGRA186_MC_BASE);
> > > +       ret = gm20b_secboot_tegra_read_wpr(gsb);
> > >         if (ret)
> > >                 return ret;
> > >
> > > --
> > > 2.23.0
> > >
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel

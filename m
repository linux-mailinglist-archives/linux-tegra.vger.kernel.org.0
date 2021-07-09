Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7E973C23EC
	for <lists+linux-tegra@lfdr.de>; Fri,  9 Jul 2021 15:02:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231701AbhGINFH (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 9 Jul 2021 09:05:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231453AbhGINFG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 9 Jul 2021 09:05:06 -0400
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com [IPv6:2607:f8b0:4864:20::e35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C97BC0613E5
        for <linux-tegra@vger.kernel.org>; Fri,  9 Jul 2021 06:02:22 -0700 (PDT)
Received: by mail-vs1-xe35.google.com with SMTP id h18so5542973vsj.2
        for <linux-tegra@vger.kernel.org>; Fri, 09 Jul 2021 06:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TAIZJVlH8Y2YqNZo8d2pJK9Ss3UycuHLJWPexBI7axE=;
        b=A16X2V42weuudBPxgonBeebw8re+EWAjOn3wZP98m7gV1L5RlqklKfjCFeKKq2vubB
         IZMArHgMAToqcWDiPDV8U5GBOm+SQE9hgTLxqyBdoAx+cNMx/wcDnOEpu5lxWAZh+s5J
         wDa+yhcRmrDI99UodVFIhL7bIhWqeHDr8vDbFkNd15DjrQo0ziTi6SiazD449lC6Tie1
         nEHy09WmaPxidVJ69xUj4MsCQD8zqtQ2+fpxJ2R4H19NZy0b+m+my5U7+cxvb1eefzPH
         GNTnhJQbcbTQtJYTJxYLQQfaup2gPfByEqRGlTbt5oC9A3nSSrj94KXk48ywk7cAhEqs
         eL/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TAIZJVlH8Y2YqNZo8d2pJK9Ss3UycuHLJWPexBI7axE=;
        b=PVFvdhmT6W2Dhz4J75B3eOknk5/cxoT+kRwYluWJprfeKfe9ejnWj9FQAktlZVBngV
         kjKYsi/aZBwNOHLofPtGI0cI6A8iytmBXm0E8NuZGvNRmZTRjCeGUbxwwQBX0Nh+Sxx/
         RCQrERMRKhiq4MiDt5WXOgg0b6KwP6RX3CbbWbxyItTWXSLxFG+GJlFVqZ3GrJLMRpBy
         +Rmof6S4E+F0PlB0w0EG9JLIMeZ4dPblOiH2roqQutR/5Kd/IVqngvPB2kPlZQpmA0yg
         Dtke3dx4YhLZpYN+Oh4wtJjZxmIQEQintEpDThBxMsxNFLamuDJr4LZ72X6iskB7VvVs
         2i5g==
X-Gm-Message-State: AOAM531/88f6meHNdNF0VuZEjBgphdR69mink/Y7oD5hvbDdGVPmSFpA
        KK6r0YlFgTA12gemdHHm1xbLynsguvVSxxbrFrRieQ==
X-Google-Smtp-Source: ABdhPJyEvDZ4fadDrPqh33c2U9yNN2X8cR1YJgisOMsbHDKd7A3qWQidNaZTN61mOdKuvkYE5Eav6Sub5yE7kPQoEGM=
X-Received: by 2002:a67:8c46:: with SMTP id o67mr35000628vsd.34.1625835741333;
 Fri, 09 Jul 2021 06:02:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210701232728.23591-1-digetx@gmail.com>
In-Reply-To: <20210701232728.23591-1-digetx@gmail.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 9 Jul 2021 15:01:45 +0200
Message-ID: <CAPDyKFry00yzp9upsVy+yb7oX-k-bBgfrff+Q7qbK0cGh8ishQ@mail.gmail.com>
Subject: Re: [PATCH v7 00/37] NVIDIA Tegra power management patches for 5.15
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, 2 Jul 2021 at 01:28, Dmitry Osipenko <digetx@gmail.com> wrote:
>
> Hello,
>
> This series continues the work on enabling voltage scaling of the core
> power domain for NVIDIA Tegra SoCs. All the previous grounding work around
> improving OPP API and adding the initial core power domain driver is now
> landing into 5.14 kernel and already available in linux-next.
>
> The biggest challenge left so far is the power management of the PLLs
> and system clocks which don't have a dedicated hardware unit. I made a lot
> of changes around it by going back to a variant where individual device
> drivers are responsible for the power management in oppose to a recent
> variant where the most of power management was done by the clk controller
> driver. This allowed to drop the need of having a special lockdep
> annotation for the power domain's mutex, which Ulf Hansson didn't like
> previously. We don't have situations of a nested GENPD accesses anymore.
> It also allowed to minimize the clk patch a lot. Now clk driver manages
> power of the internal clocks only.
>
> This series enables a full power management for Tegra20 and Tegra30 SoCs.
> It doesn't include all the device-tree binding patches. I'll try to split
> this series into a smaller parts that could be applied individually. For
> now I want to get a feedback at least on the first six patches.
>
> Example /sys/kernel/debug/pm_genpd/pm_genpd_summary from Tegra20 Acer A500:
>
> domain                          status          children                           performance
>     /device                                             runtime status
> ----------------------------------------------------------------------------------------------
> mpe                             off-0                                              0
>     /devices/soc0/50000000.host1x/54040000.mpe          suspended                  0
> vdec                            off-0                                              0
>     /devices/soc0/6001a000.vde                          suspended                  0
> venc                            off-0                                              0
>     /devices/soc0/50000000.host1x/54080000.vi           suspended                  0
>     /devices/soc0/50000000.host1x/54100000.isp          suspended                  0
> 3d                              off-0                                              0
>     /devices/soc0/50000000.host1x/54180000.gr3d         suspended                  0
> core-domain                     on                                                 1100000
>                                                 3d, venc, vdec, mpe
>     /devices/soc0/50000000.host1x                       active                     1100000
>     /devices/soc0/50000000.host1x/540c0000.epp          suspended                  0
>     /devices/soc0/50000000.host1x/54140000.gr2d         suspended                  0
>     /devices/soc0/50000000.host1x/54280000.hdmi         suspended                  0
>     /devices/soc0/c5000000.usb                          active                     1100000
>     /devices/soc0/c5008000.usb                          active                     1100000
>     /devices/soc0/c8000000.mmc                          active                     1000000
>     /devices/soc0/c8000400.mmc                          active                     1000000
>     /devices/soc0/c8000600.mmc                          active                     1000000
>     /devices/soc0/7000f400.memory-controller            active                     1000000
>     /devices/platform/tegra_clk_sclk                    active                     950000
>     /devices/soc0/50000000.host1x/54200000.dc           active                     950000
>     /devices/soc0/50000000.host1x/54240000.dc           suspended                  0
>
>
> Example /sys/kernel/debug/pm_genpd/pm_genpd_summary from Tegra30 Nexus 7:
>
> domain                          status          children                           performance
>     /device                                             runtime status
> ----------------------------------------------------------------------------------------------
> heg                             on                                                 1000000
>     /devices/soc0/50000000.host1x                       active                     1000000
>     /devices/soc0/50000000.host1x/540c0000.epp          suspended                  0
>     /devices/soc0/50000000.host1x/54140000.gr2d         suspended                  0
> mpe                             off-0                                              0
>     /devices/soc0/50000000.host1x/54040000.mpe          suspended                  0
> vdec                            off-0                                              0
>     /devices/soc0/6001a000.vde                          suspended                  0
> venc                            off-0                                              0
>     /devices/soc0/50000000.host1x/54080000.vi           suspended                  0
>     /devices/soc0/50000000.host1x/54100000.isp          suspended                  0
> 3d1                             off-0                                              0
>     /devices/genpd:1:54180000.gr3d                      suspended                  0
> 3d0                             off-0                                              0
>     /devices/genpd:0:54180000.gr3d                      suspended                  0
> core-domain                     on                                                 1000000
>                                                 3d0, 3d1, venc, vdec, mpe, heg
>     /devices/soc0/7d000000.usb                          active                     1000000
>     /devices/soc0/78000400.mmc                          active                     950000
>     /devices/soc0/7000f400.memory-controller            active                     1000000
>     /devices/soc0/7000a000.pwm                          active                     1000000
>     /devices/platform/tegra_clk_pll_c                   active                     1000000
>     /devices/platform/tegra_clk_pll_e                   suspended                  0
>     /devices/platform/tegra_clk_pll_m                   active                     1000000
>     /devices/platform/tegra_clk_sclk                    active                     1000000
>     /devices/soc0/7000f800.fuse                         suspended                  0
>     /devices/soc0/50000000.host1x/54240000.dc           suspended                  0
>     /devices/soc0/50000000.host1x/54200000.dc           active                     1000000
>
> Dmitry Osipenko (37):
>   soc/tegra: pmc: Temporarily disable PMC state syncing
>   soc/tegra: pmc: Implement attach_dev() of power domain drivers
>   soc/tegra: Don't print error message when OPPs not available
>   soc/tegra: Add devm_tegra_core_dev_init_opp_table_simple()
>   dt-bindings: clock: tegra-car: Document new tegra-clocks node
>   clk: tegra: Support runtime PM and power domain
>   dt-bindings: host1x: Document OPP and power domain properties
>   dt-bindings: host1x: Document Memory Client resets of Host1x, GR2D and
>     GR3D
>   gpu: host1x: Add host1x_channel_stop()
>   gpu: host1x: Add runtime PM support
>   gpu: host1x: Add stub driver for MPE, VI, EPP and ISP
>   drm/tegra: dc: Support OPP and SoC core voltage scaling
>   drm/tegra: hdmi: Add OPP support
>   drm/tegra: gr2d: Support OPP and power management
>   drm/tegra: gr3d: Support OPP and power management
>   drm/tegra: vic: Stop channel before suspending
>   usb: chipidea: tegra: Add runtime PM support
>   bus: tegra-gmi: Add runtime PM support
>   pwm: tegra: Add runtime PM and OPP support
>   mmc: sdhci-tegra: Add runtime PM and OPP support
>   mtd: rawnand: tegra: Add runtime PM support
>   soc/tegra: fuse: Clear fuse->clk on driver probe failure
>   soc/tegra: fuse: Add runtime PM support
>   soc/tegra: fuse: Enable fuse clock on suspend
>   clk: tegra: Remove CLK_IS_CRITICAL flag from fuse clock
>   spi: tegra20-slink: Improve runtime PM usage
>   spi: tegra20-slink: Add OPP support
>   memory: tegra20-emc: Add minimal runtime PM support
>   memory: tegra30-emc: Add minimal runtime PM support
>   media: dt: bindings: tegra-vde: Convert to schema
>   media: dt: bindings: tegra-vde: Document OPP and power domain
>   media: staging: tegra-vde: Support generic power domain
>   ARM: tegra: Add OPP tables and power domains to Tegra20 device-trees
>   ARM: tegra: Add OPP tables and power domains to Tegra30 device-trees
>   ARM: tegra: Add Memory Client resets to Tegra20 GR2D, GR3D and Host1x
>   ARM: tegra: Add Memory Client resets to Tegra30 GR2D, GR3D and Host1x
>   soc/tegra: pmc: Enable core domain support on Tegra20 and Tegra30
>
>  .../bindings/clock/nvidia,tegra20-car.yaml    |   51 +
>  .../display/tegra/nvidia,tegra20-host1x.txt   |   53 +
>  .../bindings/media/nvidia,tegra-vde.txt       |   64 -
>  .../bindings/media/nvidia,tegra-vde.yaml      |  119 ++
>  .../boot/dts/tegra20-acer-a500-picasso.dts    |    1 +
>  arch/arm/boot/dts/tegra20-colibri.dtsi        |    3 +-
>  arch/arm/boot/dts/tegra20-harmony.dts         |    3 +-
>  arch/arm/boot/dts/tegra20-paz00.dts           |    1 +
>  .../arm/boot/dts/tegra20-peripherals-opp.dtsi |  941 +++++++++++
>  arch/arm/boot/dts/tegra20-seaboard.dts        |    3 +-
>  arch/arm/boot/dts/tegra20-tamonten.dtsi       |    3 +-
>  arch/arm/boot/dts/tegra20-trimslice.dts       |    9 +
>  arch/arm/boot/dts/tegra20-ventana.dts         |    1 +
>  arch/arm/boot/dts/tegra20.dtsi                |  115 +-
>  .../tegra30-asus-nexus7-grouper-common.dtsi   |    1 +
>  arch/arm/boot/dts/tegra30-beaver.dts          |    1 +
>  arch/arm/boot/dts/tegra30-cardhu.dtsi         |    1 +
>  arch/arm/boot/dts/tegra30-colibri.dtsi        |   17 +-
>  arch/arm/boot/dts/tegra30-ouya.dts            |    1 +
>  .../arm/boot/dts/tegra30-peripherals-opp.dtsi | 1412 +++++++++++++++++
>  arch/arm/boot/dts/tegra30.dtsi                |  170 +-
>  drivers/bus/tegra-gmi.c                       |   44 +-
>  drivers/clk/tegra/Makefile                    |    1 +
>  drivers/clk/tegra/clk-device.c                |  222 +++
>  drivers/clk/tegra/clk-pll.c                   |    2 +-
>  drivers/clk/tegra/clk-super.c                 |    2 +-
>  drivers/clk/tegra/clk-tegra-periph.c          |    6 +-
>  drivers/clk/tegra/clk-tegra20.c               |   39 +-
>  drivers/clk/tegra/clk-tegra30.c               |   70 +-
>  drivers/clk/tegra/clk.c                       |   66 +
>  drivers/clk/tegra/clk.h                       |    2 +
>  drivers/gpu/drm/tegra/dc.c                    |   69 +
>  drivers/gpu/drm/tegra/dc.h                    |    2 +
>  drivers/gpu/drm/tegra/gr2d.c                  |  156 +-
>  drivers/gpu/drm/tegra/gr3d.c                  |  401 ++++-
>  drivers/gpu/drm/tegra/hdmi.c                  |    9 +-
>  drivers/gpu/drm/tegra/vic.c                   |   15 +
>  drivers/gpu/host1x/channel.c                  |    8 +
>  drivers/gpu/host1x/debug.c                    |   15 +
>  drivers/gpu/host1x/dev.c                      |  184 ++-
>  drivers/gpu/host1x/dev.h                      |    3 +-
>  drivers/gpu/host1x/hw/channel_hw.c            |   44 +-
>  drivers/gpu/host1x/intr.c                     |    3 -
>  drivers/gpu/host1x/syncpt.c                   |    5 +-
>  drivers/memory/tegra/tegra20-emc.c            |   31 +
>  drivers/memory/tegra/tegra30-emc.c            |   31 +
>  drivers/mmc/host/sdhci-tegra.c                |   81 +-
>  drivers/mtd/nand/raw/tegra_nand.c             |   44 +-
>  drivers/pwm/pwm-tegra.c                       |  104 +-
>  drivers/soc/tegra/common.c                    |    4 +-
>  drivers/soc/tegra/fuse/fuse-tegra.c           |   62 +
>  drivers/soc/tegra/fuse/fuse-tegra20.c         |   10 +-
>  drivers/soc/tegra/fuse/fuse-tegra30.c         |   10 +-
>  drivers/soc/tegra/fuse/fuse.h                 |    2 +
>  drivers/soc/tegra/pmc.c                       |  164 ++
>  drivers/spi/spi-tegra20-slink.c               |   76 +-
>  drivers/staging/media/tegra-vde/vde.c         |   59 +-
>  drivers/usb/chipidea/ci_hdrc_tegra.c          |   50 +-
>  include/linux/host1x.h                        |    1 +
>  include/soc/tegra/common.h                    |   13 +
>  60 files changed, 4710 insertions(+), 370 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/nvidia,tegra-vde.txt
>  create mode 100644 Documentation/devicetree/bindings/media/nvidia,tegra-vde.yaml
>  create mode 100644 drivers/clk/tegra/clk-device.c
>

Dmitry, I am happy to help to review this, but unfortunately(?) I am
moving into holiday mode for a couple of weeks, very soon. I will do
my best to move forward with the review, but please be patient.

Kind regards
Uffe

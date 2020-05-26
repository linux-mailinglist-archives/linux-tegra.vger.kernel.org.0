Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B31AB1DD1A7
	for <lists+linux-tegra@lfdr.de>; Thu, 21 May 2020 17:27:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730190AbgEUPZa (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 21 May 2020 11:25:30 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:35001 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729977AbgEUPZ3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 21 May 2020 11:25:29 -0400
Received: by mail-oi1-f196.google.com with SMTP id z9so1668421oid.2;
        Thu, 21 May 2020 08:25:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D0uWGFCD5V34lH8VbU4HglTn4XGZ0Xtya8FxjiL3tQs=;
        b=iuvaiZEVuNWpi7op0mAKu2ftRLLYgUXDtg6JN+452XA1lMwry4Jm+RLgFd3tQXqXYF
         nYGgnjqZ6vgWkIQTHIcES9xz0Az/aSFshHUrRHY0xZ5WQhdgmvYVobl8ymEOCzaTdI7i
         Tx7BCY8kJHZebXSkQcWrfzKNgHW+fQ47vdMpbd3uuBIeqKcBgfFuLwUisXlMhdfSCdRd
         8V89Odll0vMNuI1YyTtAk7QBCiJyF3Qlo9OrSotVlawHEPtCvubEwa3GJe37+6U5SnR+
         FrpjFRcctrGW4HEHVnfFlXZ8JK8WTOXHnK2TDnVTGQ1GiUgGMvwfa8hzfd3k8zt5CPKA
         U9Yw==
X-Gm-Message-State: AOAM532bfjpjACXuf7JvYfC37LGA+A9uba9JiBl1RyxSDxoyivCJ7CWP
        tIFRkuSupf6pr8gb4GPRXShle45NtTzkTZyvGPw=
X-Google-Smtp-Source: ABdhPJzx65YPgki0LhoHsio0Vu+PQ4w0tRMbmKkwz5UC1wTNSZn2a2KZQZdxQKh4XLArhWOniQwE0ntdBIMKQ3qvU94=
X-Received: by 2002:aca:4254:: with SMTP id p81mr6799233oia.68.1590074728219;
 Thu, 21 May 2020 08:25:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200521031355.7022-1-dinghao.liu@zju.edu.cn> <20200521151620.GA1135365@bjorn-Precision-5520>
In-Reply-To: <20200521151620.GA1135365@bjorn-Precision-5520>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Thu, 21 May 2020 17:25:14 +0200
Message-ID: <CAJZ5v0g1-WrBskdBHQ0vpWEk2E-dSaZcQsZngn84rcjcemoAAA@mail.gmail.com>
Subject: Re: [PATCH] [v2] PCI: tegra194: Fix runtime PM imbalance on error
To:     Bjorn Helgaas <helgaas@kernel.org>,
        Dinghao Liu <dinghao.liu@zju.edu.cn>
Cc:     Kangjie Lu <kjlu@umn.edu>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Rob Herring <robh@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>,
        Andrew Murray <amurray@thegoodpenguin.co.uk>,
        Linux PCI <linux-pci@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Linux PM <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, May 21, 2020 at 5:16 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> [+cc Rafael, linux-pm]
>
> On Thu, May 21, 2020 at 11:13:49AM +0800, Dinghao Liu wrote:
> > pm_runtime_get_sync() increments the runtime PM usage counter even
> > when it returns an error code. Thus a pairing decrement is needed on
> > the error handling path to keep the counter balanced.
>
> I didn't realize there were so many drivers with the exact same issue.
> Can we just squash these all into a single patch so we can see them
> all together?
>
> Hmm.  There are over 1300 callers of pm_runtime_get_sync(), and it
> looks like many of them have similar issues, i.e., they have a pattern
> like this
>
>   ret = pm_runtime_get_sync(dev);
>   if (ret < 0)
>     return;
>
>   pm_runtime_put(dev);
>
> where there is not a pm_runtime_put() to match every
> pm_runtime_get_sync().  Random sample:
>
>   nds32_pmu_reserve_hardware
>   sata_rcar_probe
>   exynos_trng_probe
>   ks_sa_rng_probe
>   omap_aes_probe
>   sun8i_ss_probe
>   omap_aes_probe
>   zynq_gpio_probe
>   amdgpu_hwmon_show_power_avg
>   mtk_crtc_ddp_hw_init
>   ...
>
> Surely I'm missing something and these aren't all broken, right?

If they do what you've said, they are all broken I'm afraid.

They should all be doing something like

    ret = pm_runtime_get_sync(dev);
    if (ret < 0)
        goto out;

    ...

out:
    pm_runtime_put(dev);

> Maybe we could put together a coccinelle script to scan the tree for
> this issue?
>
> > Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
> > ---
> >  drivers/pci/controller/dwc/pcie-tegra194.c | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
> > index ae30a2fd3716..2c0d2ce16b47 100644
> > --- a/drivers/pci/controller/dwc/pcie-tegra194.c
> > +++ b/drivers/pci/controller/dwc/pcie-tegra194.c
> > @@ -1623,7 +1623,7 @@ static int tegra_pcie_config_rp(struct tegra_pcie_dw *pcie)
> >       ret = pinctrl_pm_select_default_state(dev);
> >       if (ret < 0) {
> >               dev_err(dev, "Failed to configure sideband pins: %d\n", ret);
> > -             goto fail_pinctrl;
> > +             goto fail_pm_get_sync;
> >       }
> >
> >       tegra_pcie_init_controller(pcie);
> > @@ -1650,9 +1650,8 @@ static int tegra_pcie_config_rp(struct tegra_pcie_dw *pcie)
> >
> >  fail_host_init:
> >       tegra_pcie_deinit_controller(pcie);
> > -fail_pinctrl:
> > -     pm_runtime_put_sync(dev);
> >  fail_pm_get_sync:
> > +     pm_runtime_put_sync(dev);

Why not pm_runtime_put()?

> >       pm_runtime_disable(dev);
> >       return ret;
> >  }
> > --
> > 2.17.1
> >

Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4603E1181FC
	for <lists+linux-tegra@lfdr.de>; Tue, 10 Dec 2019 09:15:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727143AbfLJIPn (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 10 Dec 2019 03:15:43 -0500
Received: from mail-vs1-f67.google.com ([209.85.217.67]:33505 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726062AbfLJIPn (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 10 Dec 2019 03:15:43 -0500
Received: by mail-vs1-f67.google.com with SMTP id n27so12435959vsa.0
        for <linux-tegra@vger.kernel.org>; Tue, 10 Dec 2019 00:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DSBHJGZv/Ck/e1RdMtefgHGkJsjc54RUFKjHrEKkQpE=;
        b=cTrWOtCDqZLsnRwsF+oyUucWl/NqFzTEN+GkbazPxvRb4KzvkxK7NARNiIMb58kjbQ
         aIa9Ufv/Q5LpT+Ey8xqB50Oev4fi2PbJAKgPT+k5RR1zzjm9Rh207vXyYGgDVVcvH6AO
         deo3rX4CjtNnh1SDquyG9ULJucc6DbjvPuPy2rXW7BIrGhpKqJwtAC+RASAHvnyL+dsA
         IFAJQfOFM6GebBf01orH/S6Qk4nC34atXHXpJwbeksQDz7saKXzSC6vdJp/vhZjXg+1M
         7ZzoJcMoWTHzUB5p0RJmjdRAPs91dKqDQx/0W51i7hVPIRj0tqUEZLy6YP7/8Ubbo8Is
         sRfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DSBHJGZv/Ck/e1RdMtefgHGkJsjc54RUFKjHrEKkQpE=;
        b=r9DjLMpPGVU6Si4OGcMFjX5PaQaftjujCro+X1CRNilMI/vpAWSdaafTDZG0cdIxW4
         TZP+TSUAr9Twv3pUNNFJ23YURy8NDfcZpH7EDXuCkOw3pxDjIlAKkZjb+q8xFmE9CIgx
         BavLMHa4UXxAAaqMRwEj342vyozlu20D3w5mkakpbOsRD86rfeB2W+Z1ZVgVqhi3s8PY
         dYPBiyeMEmfDXVD1I8ixMxsA/gvzwsSWpXCq2muwDHgvj3Q/klS/VDF0jyBbErrq43sm
         Mt2VDLLiSoL5ufcFIggDm3NdLJse3QdBR+nIHTKZth+TRYPDPTakNI1j2UbT+C/sKlau
         WdTQ==
X-Gm-Message-State: APjAAAXJovxpZqUE3CBDY2cmRbOtR1W6P/g4x19dPG68ZgH+8yink++F
        o037uJhmvJEWWmAgyyFIva746l654bxQdy/Mdts=
X-Google-Smtp-Source: APXvYqxLYqHDrZ6EowjFsDR8K0gK+VBe4GrEnGBexmziQ3qWTw85y0mfg8VgkTirFewxsRMIRD4r3H/tTR9Kh9KdHbs=
X-Received: by 2002:a67:6345:: with SMTP id x66mr22693510vsb.132.1575965741983;
 Tue, 10 Dec 2019 00:15:41 -0800 (PST)
MIME-Version: 1.0
References: <20191209120005.2254786-1-thierry.reding@gmail.com>
In-Reply-To: <20191209120005.2254786-1-thierry.reding@gmail.com>
From:   Ben Skeggs <skeggsb@gmail.com>
Date:   Tue, 10 Dec 2019 18:15:30 +1000
Message-ID: <CACAvsv4NX7jvZb5_X5auU4-KKk9PfmtJvmnQNjY7ihqgXaRS6A@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH v3 0/9] drm/nouveau: Various fixes for GP10B
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Ben Skeggs <bskeggs@redhat.com>, linux-tegra@vger.kernel.org,
        ML nouveau <nouveau@lists.freedesktop.org>,
        Joerg Roedel <joro@8bytes.org>,
        ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, 9 Dec 2019 at 22:00, Thierry Reding <thierry.reding@gmail.com> wrote:
>
> From: Thierry Reding <treding@nvidia.com>
>
> Hi Ben,
>
> here's a revised subset of the patches I had sent out a couple of weeks
> ago. I've reworked the BAR2 accesses in the way that you had suggested,
> which at least for GP10B turned out to be fairly trivial to do. I have
> not looked in detail at this for GV11B yet, but a cursory look showed
> that BAR2 is accessed in more places, so the equivalent for GV11B might
> be a bit more involved.
>
> Other than that, not a lot has changed since then. I've added a couple
> of precursory patches to add IOMMU helper dummies for the case where
> IOMMU is disabled (as suggested by Ben Dooks).
>
> Joerg has given an Acked-by on the first two patches, so I think it'd be
> easiest if you picked those up into the Nouveau tree because of the
> build dependency of subsequent patches on them.
I've merged all the patches in my tree, after fixing a small build
issue on !TEGRA in the WPR config readout patch.

Thanks Thierry!
Ben.

>
> Thierry
>
> Thierry Reding (9):
>   iommu: Document iommu_fwspec::flags field
>   iommu: Add dummy dev_iommu_fwspec_get() helper
>   drm/nouveau: fault: Add support for GP10B
>   drm/nouveau: tegra: Do not try to disable PCI device
>   drm/nouveau: tegra: Avoid pulsing reset twice
>   drm/nouveau: tegra: Set clock rate if not set
>   drm/nouveau: secboot: Read WPR configuration from GPU registers
>   drm/nouveau: gp10b: Add custom L2 cache implementation
>   drm/nouveau: gp10b: Use correct copy engine
>
>  .../drm/nouveau/include/nvkm/subdev/fault.h   |  1 +
>  .../gpu/drm/nouveau/include/nvkm/subdev/ltc.h |  1 +
>  drivers/gpu/drm/nouveau/nouveau_drm.c         |  3 +-
>  .../gpu/drm/nouveau/nvkm/engine/device/base.c |  6 +-
>  .../drm/nouveau/nvkm/engine/device/tegra.c    | 24 ++++--
>  .../gpu/drm/nouveau/nvkm/subdev/fault/Kbuild  |  1 +
>  .../gpu/drm/nouveau/nvkm/subdev/fault/base.c  |  2 +-
>  .../gpu/drm/nouveau/nvkm/subdev/fault/gp100.c | 17 ++--
>  .../gpu/drm/nouveau/nvkm/subdev/fault/gp10b.c | 53 ++++++++++++
>  .../gpu/drm/nouveau/nvkm/subdev/fault/gv100.c |  1 +
>  .../gpu/drm/nouveau/nvkm/subdev/fault/priv.h  | 10 +++
>  .../gpu/drm/nouveau/nvkm/subdev/ltc/Kbuild    |  1 +
>  .../gpu/drm/nouveau/nvkm/subdev/ltc/gp10b.c   | 65 +++++++++++++++
>  .../gpu/drm/nouveau/nvkm/subdev/ltc/priv.h    |  2 +
>  .../drm/nouveau/nvkm/subdev/secboot/gm200.h   |  2 +-
>  .../drm/nouveau/nvkm/subdev/secboot/gm20b.c   | 81 ++++++++++++-------
>  .../drm/nouveau/nvkm/subdev/secboot/gp10b.c   |  4 +-
>  include/linux/iommu.h                         | 47 ++++++-----
>  18 files changed, 249 insertions(+), 72 deletions(-)
>  create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/fault/gp10b.c
>  create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/ltc/gp10b.c
>
> --
> 2.23.0
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau

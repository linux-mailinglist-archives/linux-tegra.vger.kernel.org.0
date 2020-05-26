Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D29DF1DEB97
	for <lists+linux-tegra@lfdr.de>; Fri, 22 May 2020 17:14:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730050AbgEVPOu (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 22 May 2020 11:14:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730028AbgEVPOt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 22 May 2020 11:14:49 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CAFFC061A0E;
        Fri, 22 May 2020 08:14:49 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id se13so13412258ejb.9;
        Fri, 22 May 2020 08:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ONv7RAIjy3Q1K3aQ2Xg+iraooQhVfbeZiSLj80jauQQ=;
        b=E9Ss0UujEI0SYEcs9cZxxQ+rVts6XZQWRj9MT51aZTaG8pSD3LPME1uFBZadyZshz5
         f5Jawl6ZKk8cAbf7kR6Iistvz3xnXVpkl6RHBUKWnIWaWZdq6VAueDrAJX0T6hZCLeZZ
         jynlv5iBzeXKmp97a/1JvntICi7W/mf0F4aV7ll/8IyJjcXPBlRq6iWc+KPb3Tg2w5bS
         tWMrVoZmRA4NyC+hYrL37yl0OHNtDWDL1OMQ5PwRSdSDxEPo3eDASQsMGIUN7KgPdIKj
         Hi7hl2BtCz9G29tYWzi7L9iq9aLqyF4HC8Vn9cCx8uf404MCMBlcQxsZbzEzdiYky3r/
         gi1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ONv7RAIjy3Q1K3aQ2Xg+iraooQhVfbeZiSLj80jauQQ=;
        b=dR6Hd4UD1MO9TdQgrxtvRTehCYNKLFef7rvW2Tc54MjJvoVxzOo9gZNtXsQRhLFWMa
         nwopiPyYGEag1MUWjGQX6Ixw/zwL3BPChrNsKbXhDO3gtRQsvyvm1nutUw6ZB5lYbiJ7
         UXCsFUynDPC4rHd6ftt86y0M269uqdOMYXufUaaoG87PRcriQexq7naUbQLcvD7rxwwx
         +Mj7MvwX5r6h0V9DCqOpQNiwHqx0rJOFmNcdW0bnFab5v+q0/IBpe5aLlPSD28LZFZ3e
         FwjKjR2wJ6FFhfYUwhY3ZJizPvRgKv1sQ6n1QQ1NXmbTWFkVqugQUXKs5xKCyDK8HkbX
         9JEQ==
X-Gm-Message-State: AOAM530I2XlisWWYM0fsPIq5zUXb1aozRTEa0f4dG1iNwTAFXEls6Y2q
        ec65FjFnsB1OsMuw7kssKrI=
X-Google-Smtp-Source: ABdhPJwFomesbG5Rf+3D/dsKeFvJkgRXSIEwijrfEx8OUFlSYmcx29sWUdyUjEAtHHUBMHgtwm7Y1A==
X-Received: by 2002:a17:906:951:: with SMTP id j17mr8408199ejd.352.1590160488196;
        Fri, 22 May 2020 08:14:48 -0700 (PDT)
Received: from localhost (pd9e51079.dip0.t-ipconnect.de. [217.229.16.121])
        by smtp.gmail.com with ESMTPSA id jp17sm7815410ejb.23.2020.05.22.08.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2020 08:14:45 -0700 (PDT)
Date:   Fri, 22 May 2020 17:14:44 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Krishna Reddy <vdumpa@nvidia.com>
Cc:     snikam@nvidia.com, mperttunen@nvidia.com, bhuntsman@nvidia.com,
        will@kernel.org, joro@8bytes.org, linux-kernel@vger.kernel.org,
        praithatha@nvidia.com, talho@nvidia.com,
        iommu@lists.linux-foundation.org, nicolinc@nvidia.com,
        linux-tegra@vger.kernel.org, yhsu@nvidia.com, treding@nvidia.com,
        robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org,
        bbiswas@nvidia.com
Subject: Re: [PATCH v5 0/5] Nvidia Arm SMMUv2 Implementation
Message-ID: <20200522151444.GB2374603@ulmo>
References: <20200521233107.11968-1-vdumpa@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="i9LlY+UWpKt15+FH"
Content-Disposition: inline
In-Reply-To: <20200521233107.11968-1-vdumpa@nvidia.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--i9LlY+UWpKt15+FH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2020 at 04:31:02PM -0700, Krishna Reddy wrote:
> Changes in v5:
> Rebased on top of git://git.kernel.org/pub/scm/linux/kernel/git/joro/iomm=
u.git next
>=20
> v4 - https://lkml.org/lkml/2019/10/30/1054
> v3 - https://lkml.org/lkml/2019/10/18/1601
> v2 - https://lkml.org/lkml/2019/9/2/980
> v1 - https://lkml.org/lkml/2019/8/29/1588
>=20
> Krishna Reddy (5):
>   iommu/arm-smmu: add NVIDIA implementation for dual ARM MMU-500 usage
>   dt-bindings: arm-smmu: Add binding for Tegra194 SMMU
>   iommu/arm-smmu: Add global/context fault implementation hooks

For the record: I don't think we should apply these because we don't
have a good way of testing them. We currently have three problems that
prevent us from enabling SMMU on Tegra194:

  1) If we enable SMMU support, then the DMA API will automatically try
     to use SMMU domains for allocations. This means that translations
     will happen as soon as a device's IOMMU operations are initialized
     and that is typically a long time (in kernel time at least) before
     a driver is bound and has a chance of configuring the device.

     This causes problems for non-quiesced devices like display
     controllers that the bootloader might have set up to scan out a
     boot splash.

     What we're missing here is a way to:

     a) advertise reserved memory regions for boot splash framebuffers
     b) map reserved memory regions early during SMMU setup

     Patches have been floating on the public mailing lists for b) but
     a) requires changes to the bootloader (both proprietary ones and
     U-Boot for SoCs prior to Tegra194).

  2) Even if we don't enable SMMU for a given device (by not hooking up
     the iommus property), with a default kernel configuration we get a
     bunch of faults during boot because the ARM SMMU driver faults by
     default (rather than bypass) for masters which aren't hooked up to
     the SMMU.

     We could work around that by changing the default configuration or
     overriding it on the command-line, but that's not really an option
     because it decreases security and means that Tegra194 won't work
     out-of-the-box.

  3) We don't properly describe the DMA hierarchy, which causes the DMA
     masks to be improperly set. As a bit of background: Tegra194 has a
     special address bit (bit 39) that causes some swizzling to happen
     within the memory controller. As a result, any I/O virtual address
     that has bit 39 set will cause this swizzling to happen on access.
     The DMA/IOMMU allocator always starts allocating from the top of
     the IOVA space, which means that the first couple of gigabytes of
     allocations will cause most devices to fail because of the
     undesired swizzling that occurs.

     We had an initial patch for SDHCI merged that hard-codes the DMA
     mask to DMA_BIT_MASK(39) on Tegra194 to work around that. However,
     the devices all do support addressing 40 bits and the restriction
     on bit 39 is really a property of the bus rather than a capability
     of the device. This means that we would have to work around this
     for every device driver by adding similar hacks. A better option is
     to properly describe the DMA hierarchy (using dma-ranges) because
     that will then automatically be applied as a constraint on each
     device's DMA mask.

     I have been working on patches to address this, but they are fairly
     involved because they require device tree bindings changes and so
     on.

So before we solve all of the above issues we can't really enable SMMU
on Tegra194 and hence won't be able to test it. As such we don't know if
these patches even work, nor can we validate that they continue to work.

As such, I don't think there's any use in applying these patches
upstream since they will be effectively dead code until all of the above
issues are resolved.

>   arm64: tegra: Add DT node for T194 SMMU
>   arm64: tegra: enable SMMU for SDHCI and EQOS on T194

This one is going to cause EQOS to break because of 3) above. It might
work for SDHCI because of the workaround we currently have in that
driver. However, I do have a local patch that reverts the workaround
and replaces it with the proper fix, which uses dma-ranges as mentioned
above.

That said, I have tested earlier versions of this patchset on top of my
local branch with fixes for the above and they do seem to work as
expected.

So I'll leave it up to the IOMMU maintainers whether they're willing to
merge the driver patches as is. But I want to clarify that I won't be
applying the DTS patches until we've solved all of the above issues and
therefore it should be clear that these won't be runtime tested until
then.

I expect it will take at least until v5.9-rc1 before we have all the
changes merged that would allow us to enable SMMU support.

Thierry

>  .../devicetree/bindings/iommu/arm,smmu.yaml   |   5 +
>  MAINTAINERS                                   |   2 +
>  arch/arm64/boot/dts/nvidia/tegra194.dtsi      |  81 ++++++
>  drivers/iommu/Makefile                        |   2 +-
>  drivers/iommu/arm-smmu-impl.c                 |   3 +
>  drivers/iommu/arm-smmu-nvidia.c               | 261 ++++++++++++++++++
>  drivers/iommu/arm-smmu.c                      |  11 +-
>  drivers/iommu/arm-smmu.h                      |   4 +
>  8 files changed, 366 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/iommu/arm-smmu-nvidia.c
>=20
>=20
> base-commit: 365f8d504da50feaebf826d180113529c9383670
> --=20
> 2.26.2
>=20
>=20
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--i9LlY+UWpKt15+FH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7H7GIACgkQ3SOs138+
s6ElqQ/+JBjV0XEuyUSw2d7Jz7F2AdG1VGitmIgCcLapsei88OHPW3BCoLB0iMpo
aIpVGYKX2fT7Rq2hkg4VeNFCSnFeA0MoNtdOcGLZ3/JYsT4SgZpBTKSL1jy4pVmY
oc+NfkmnuAumMDKIa6GNc/K6uhRtNGCxqW05ynR5Mzvp8/hdmJPm5KAlZ40PEvw3
zk6SUxQ94pPjg3dHAZqMh7C7SpTrSEQzkUV3DSQpDSi2YlLTKjnLmApKRVEpNgJj
ugFjySpPpLdTPM7vuooKLv8q34Ya7FAS91DOWzfbSwCEeL8vsuVOZ1ZMG9YZ/T+5
5uOlVWJcOjWF8hNvHop2lkO64VYFr593pkyz2rMKqteapE/xzadOHvo3ov0awjzO
B9wp/VqKJGHKWaA6BW7Z9gXnIb4oVh2Ej2vH7a6HnEzjEOWwaaTCj3iqZ1n5A7Mk
FZUNlcmqTQS+NUxDPKLbB9h5kkiw1pdHI0RJavzFH3iukRPCQ82huSsbcLTjDWMk
Q9+Kox0o3iBBJ9mCGleDL+yXIW5/44uX26fxGGLyWQ1AHyIBPMNuNJxHzknYr4TN
CurNIXwSC/ZmB1YE/RUtR6fOy3/HQf/tatUCLhDcU6z0Zr6wS7xAZfAW4MF/hcCm
a5KxqmF2MQpns0TfB+gB2trhcevp1/0S+wHa1Nx27JWRXJpHiw4=
=L2CZ
-----END PGP SIGNATURE-----

--i9LlY+UWpKt15+FH--

Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A4A12A82CD
	for <lists+linux-tegra@lfdr.de>; Thu,  5 Nov 2020 16:57:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731089AbgKEP5X (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 5 Nov 2020 10:57:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730854AbgKEP5X (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 5 Nov 2020 10:57:23 -0500
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D04FC0613CF;
        Thu,  5 Nov 2020 07:57:23 -0800 (PST)
Received: by mail-ed1-x544.google.com with SMTP id e18so2072297edy.6;
        Thu, 05 Nov 2020 07:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ia5NEOe87vNOy0ZgqCVooZx6zp/+bRdWBBHwpgo1/c8=;
        b=sh+daJ5lD54vppNqvnDYA1yMJc3lYLq7eZQ6XsG3cT3JNgp7OE403v4J3pfLjsDziW
         iYbZ8wJ7KFuISgCacc1KNoHCMSTQTwdvREnDcACSfxg7FEvy5+4g5dtr7UR29sM2tMt+
         ZkQrujsqRAHogb7vV/Fqy5dLcyFnptRNfoCGeMvVx6FibWRISDLhNc17stuISMjqv3SV
         eH+0A9+I/flv4w0kXKFEYa4brZwEKszuXY+n+0xG8LGH693hrXccYd2gzipkPT5f+Am0
         y4xU/b/K09lw8BBgOx4Us+GUFMwerH6LISKusYdjxbI6yK4vRu+nvTFtowIbF6s551KY
         oQfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ia5NEOe87vNOy0ZgqCVooZx6zp/+bRdWBBHwpgo1/c8=;
        b=RCL09/G9qeqWjvnTc8dD8XFQ1f/uYpEArdovwz23Ak/rEob5Kp65Q9obFMuGVLzMwl
         C2dtIqAgf5BLr311SwFBFyGPltjxopsiq9KKsJFROuqUvzT8d9shbKY2X3v1kkmCtI7Y
         RMIadv7zFm8W323kiNw16ixdoLQI52PvLglPJZb/RW7z82C2Im9PFascwwkzqxQyaLiP
         XjSn3qYQHnEvghNaJw+NHnLTi4txxXAAg4pGxJ3vHAm+5kPNEpdNywA+BO0qjLE3LBED
         AMfhRH76MrA2aCgAOKVZvpnQcxO4oA4X5F1OUFjsF8vd69ZnTp0ZqtSudb57AZjwsyHs
         iejw==
X-Gm-Message-State: AOAM5300yGhOj6SMYC2AZXM3km4TklDqq0erKGrRJibYtM98siEaaHlM
        4Fn4VDgjLpDaLAHD/ONumZo=
X-Google-Smtp-Source: ABdhPJxmf71ZwzHgHkRuCyOkwL2B5tRhFBugyl2vXpVzPnvheofIEUvp29xukIwBHvmToZv4ZpZTNQ==
X-Received: by 2002:a50:bc04:: with SMTP id j4mr3120000edh.316.1604591841658;
        Thu, 05 Nov 2020 07:57:21 -0800 (PST)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id u23sm1230958ejy.87.2020.11.05.07.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 07:57:20 -0800 (PST)
Date:   Thu, 5 Nov 2020 16:57:19 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Will Deacon <will@kernel.org>,
        iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: reserved-memory: Document "active"
 property
Message-ID: <20201105155719.GB485884@ulmo>
References: <20200904130000.691933-1-thierry.reding@gmail.com>
 <d3d69cb4-b0f9-40b0-b526-52fdc1a4b876@gmail.com>
 <20200924140130.GA2527337@ulmo>
 <ba16b795-34df-8f8c-3376-3d629cc30f8b@gmail.com>
 <484b9e90-7395-6161-577c-4d3f3716997e@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="TRYliJ5NKNqkz5bu"
Content-Disposition: inline
In-Reply-To: <484b9e90-7395-6161-577c-4d3f3716997e@arm.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--TRYliJ5NKNqkz5bu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2020 at 01:39:07PM +0100, Robin Murphy wrote:
> On 2020-09-24 17:23, Dmitry Osipenko wrote:
> > 24.09.2020 17:01, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > > On Thu, Sep 24, 2020 at 04:23:59PM +0300, Dmitry Osipenko wrote:
> > > > 04.09.2020 15:59, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > > > > From: Thierry Reding <treding@nvidia.com>
> > > > >=20
> > > > > Reserved memory regions can be marked as "active" if hardware is
> > > > > expected to access the regions during boot and before the operati=
ng
> > > > > system can take control. One example where this is useful is for =
the
> > > > > operating system to infer whether the region needs to be identity-
> > > > > mapped through an IOMMU.
> > > > >=20
> > > > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > > > > ---
> > > > >   .../bindings/reserved-memory/reserved-memory.txt           | 7 =
+++++++
> > > > >   1 file changed, 7 insertions(+)
> > > > >=20
> > > > > diff --git a/Documentation/devicetree/bindings/reserved-memory/re=
served-memory.txt b/Documentation/devicetree/bindings/reserved-memory/reser=
ved-memory.txt
> > > > > index 4dd20de6977f..163d2927e4fc 100644
> > > > > --- a/Documentation/devicetree/bindings/reserved-memory/reserved-=
memory.txt
> > > > > +++ b/Documentation/devicetree/bindings/reserved-memory/reserved-=
memory.txt
> > > > > @@ -63,6 +63,13 @@ reusable (optional) - empty property
> > > > >         able to reclaim it back. Typically that means that the op=
erating
> > > > >         system can use that region to store volatile or cached da=
ta that
> > > > >         can be otherwise regenerated or migrated elsewhere.
> > > > > +active (optional) - empty property
> > > > > +    - If this property is set for a reserved memory region, it i=
ndicates
> > > > > +      that some piece of hardware may be actively accessing this=
 region.
> > > > > +      Should the operating system want to enable IOMMU protectio=
n for a
> > > > > +      device, all active memory regions must have been identity-=
mapped
> > > > > +      in order to ensure that non-quiescent hardware during boot=
 can
> > > > > +      continue to access the memory.
> > > > >   Linux implementation note:
> > > > >   - If a "linux,cma-default" property is present, then Linux will=
 use the
> > > > >=20
> > > >=20
> > > > Hi,
> > > >=20
> > > > Could you please explain what devices need this quirk? I see that y=
ou're
> > > > targeting Tegra SMMU driver, which means that it should be some pre=
-T186
> > > > device.
> > >=20
> > > Primarily I'm looking at Tegra210 and later, because on earlier devic=
es
> > > the bootloader doesn't consistently initialize display. I know that it
> > > does on some devices, but not all of them.
> >=20
> > AFAIK, all tablet devices starting with Tegra20 that have display panel
> > are initializing display at a boot time for showing splash screen. This
> > includes all T20/T30/T114 tablets that are already supported by upstream
> > kernel.
> >=20
> > > This same code should also
> > > work on Tegra186 and later (with an ARM SMMU) although the situation =
is
> > > slightly more complicated there because IOMMU translations will fault=
 by
> > > default long before these identity mappings can be established.
> > >=20
> > > > Is this reservation needed for some device that has display
> > > > hardwired to a very specific IOMMU domain at the boot time?
> > >=20
> > > No, this is only used to convey information about the active framebuf=
fer
> > > to the kernel. In practice the DMA/IOMMU code will use this informati=
on
> > > to establish a 1:1 mapping on whatever IOMMU domain that was picked f=
or
> > > display.
> > >=20
> > > > If you're targeting devices that don't have IOMMU enabled by defaul=
t at
> > > > the boot time, then this approach won't work for the existing devic=
es
> > > > which won't ever get an updated bootloader.
> > >=20
> > > If the devices don't use an IOMMU, then there should be no problem. T=
he
> > > extra reserved-memory nodes would still be necessary to ensure that t=
he
> > > kernel doesn't reuse the framebuffer memory for the slab allocator, b=
ut
> > > if no IOMMU is used, then the display controller accessing the memory
> > > isn't going to cause problems other than perhaps scanning out data th=
at
> > > is no longer a framebuffer.
> > >=20
> > > There should also be no problem for devices with an old bootloader
> > > because this code is triggered by the presence of a reserved-memory n=
ode
> > > referenced via the memory-region property. Devices with an old
> > > bootloader should continue to work as they did before. Although I
> > > suppose they would start faulting once we enable DMA/IOMMU integration
> > > for Tegra SMMU if they have a bootloader that does initialize display=
 to
> > > actively scan out during boot.
> > >=20
> > > > I think Robin Murphy already suggested that we should simply create
> > > > a dummy "identity" IOMMU domain by default for the DRM/VDE devices =
and
> > > > then replace it with an explicitly created domain within the driver=
s.
> > >=20
> > > I don't recall reading about that suggestion. So does this mean that =
for
> > > certain devices we'd want to basically passthrough by default and then
> > > at some point during boot take over with a properly managed IOMMU
> > > domain?
> >=20
> > Yes, my understanding that this is what Robin suggested here:
> >=20
> > https://lore.kernel.org/linux-iommu/cb12808b-7316-19db-7413-b7f852a6f8a=
e@arm.com/
>=20
> Just to clarify, what I was talking about there is largely orthogonal to =
the
> issue here. That was about systems with limited translation resources
> letting translation be specifically opt-in by IOMMU-aware drivers. It
> probably *would* happen to obviate the issue of disrupting live DMA at bo=
ot
> time on these particular Tegra platforms, but we still need something like
> Thierry's solution in general, since IOMMU drivers may have no other way =
to
> determine whether devices are active at boot and they have to take care to
> avoid breaking anything - e.g. SMMUv3 will at a bare minimum need to set =
up
> *some* form of valid stream table entry for the relevant device(s) right =
at
> the beginning where we first probe and reset the SMMU itself, regardless =
of
> what happens with domains and addresses later down the line.
>=20
> > > The primary goal here is to move towards using the DMA API rather than
> > > the IOMMU API directly, so we don't really have the option of replaci=
ng
> > > with an explicitly created domain. Unless we have code in the DMA/IOM=
MU
> > > code that does this somehow.
> > >=20
> > > But I'm not sure what would be a good way to mark certain devices as
> > > needing an identity domain by default. Do we still use the reserved-
> > > memory node for that?
> >=20
> > The reserved-memory indeed shouldn't be needed for resolving the
> > implicit IOMMU problem since we could mark certain devices within the
> > kernel IOMMU driver.
> >=20
> > I haven't got around to trying to implement the implicit IOMMU support
> > yet, but I suppose we could implement the def_domain_type() hook in the
> > SMMU driver and then return IOMMU_DOMAIN_IDENTITY for the Display/VDE
> > devices. Then the Display/VDE drivers will take over the identity domain
> > and replace it with the explicit domain.
>=20
> FWIW I've already cooked up identity domain support for tegra-gart; I was
> planning on tackling it for tegra-smmu as well for the next version of my
> arm default domains series (which will be after the next -rc1 now since I=
'm
> just about to take some long-overdue holiday).
>=20
> > > That would still require some sort of flag to
> > > specify which reserved-memory regions would need this identity mapping
> > > because, as was pointed out in earlier review, some devices may have
> > > reserved-memory regions that are not meant to be identity mapped.
> >=20
> > Please note that the reserved-memory approach also creates problem for
> > selection of a large CMA region if FB is located somewhere in a middle
> > of DRAM.
> >=20
> > I already see that the FB's reserved-memory will break CMA for Nexus 7
> > and Acer A500 because CMA area overlaps with the bootloader's FB :)
> >=20
> > Also keep in mind that initrd needs a location too and location usually
> > hardwired in a bootloader. Hence it increases pressure on the CMA selec=
tion.
> >=20
> > > > Secondly, all NVIDIA bootloaders are passing tegra_fbmem=3D... via
> > > > kernel's cmdline with the physical location of the framebuffer in
> > > > memory. Maybe we could support this option?
> > >=20
> > > I'm not a big fan of that command-line option, but I also realize that
> > > for older bootloaders that's probably the only option we have. I don't
> > > suppose all of the devices support U-Boot?
> >=20
> > Majority of devices in a wild don't use u-boot and they have a
> > locked-down bootloader. Still it's possible to chain-load u-boot or
> > bypass the "security" and replace the bootloader, but these approaches
> > aren't widely supported because they take a lot of effort to be
> > implemented and maintained.
> >=20
> > Even those devices that use proper u-boot usually never updating it and
> > are running some ancient version. You can't ignore all those people :)
> >=20
> > > Because ideally we'd just
> > > translate from tegra_fbmem=3D... to reserved-memory region there so t=
hat
> > > we don't have to carry backwards-compatibility code for these purely
> > > downstream bootloaders.
> >=20
> > IIRC, in the past Robin Murphy was suggesting to read out hardware state
> > early during kernel boot in order to find what regions are in use by
> > hardware.
>=20
> I doubt I suggested that in general, because I've always firmly believed =
it
> to be a terrible idea. I've debugged too many cases where firmware or kex=
ec
> has inadvertently left DMA running and corrupted kernel memory, so in
> general we definitely *don't* want to blindly trust random hardware state.
> Anything I may have said in relation to Qualcomm's fundamentally broken
> hypervisor/bootloader setup should not be considered outside that specific
> context ;)

I agree with this. I have no doubt that it could be done, technically,
but at the same time this is code that would have to run very early on
and therefore would have to be built-in. So even if that's just a couple
of hundred lines of code, it still means that we'd need that couple of
hundred lines of code for potentially each platform supported by a given
multi-platform kernel, and that's quickly going to add up.

So I think transporting this knowledge in device tree is a fair
compromise. The bootloader knows exactly whether the display hardware
was left active, so it's easy to update the device tree accordingly
before passing it to the kernel and it allows us to use generic code to
perform this quirking.

For Tegra specifically I'm not even sure this would work on all
generations. For example on Tegra186, the BPMP provides access to
clocks, resets and powergates. So the BPMP is needed to determine
whether or not the display hardware is active (you need to query clocks,
resets and powergates before accessing registers, because accessing
registers of an unclocked, in-reset or powergated hardware block
crashes). However, the BPMP is also typically behind the SMMU, so that
would make for a nice cyclic dependency.

Thierry

--TRYliJ5NKNqkz5bu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl+kIN8ACgkQ3SOs138+
s6FZgBAAixSYWgHqruhPisNdncFoaXCTAyyWbZdGNX0S5jD6xqzz42WvzWcytnnS
LRMPixZruRylaDVK2VxNdZIweWBi78Wj3xcMvTgbGkNWKQHKxqLDV9BQ58FFPT/g
y2L7d1aO3CeJGDAQrLEeDxvqaKPBfIXojupUe/T1GSOHBpGtE+MkYSlr6IMyUQuK
e3yoi/L9RUzQz7Sof5npPVhH7UJC3I61PPZlW7X7oPTXcq8Yy67A3iG6VFtGWAof
vb40/1od+NIMo8DnHxJAQ34cd9Ap1fuxQRKc+FwrST82EZdvaZ3GNEjbYjpgin7b
e6ITs9tdV0BfvG5oYZOxr3yzfZflGZxDyEWz97JdsTUpXdW5BnlrLdHj0FdIwnHj
DBsVxbdYTRYNOgT51ii1AEOsrK26/oU9zgqDm1FLCl0uyxkc4nHINg3xmH/TavlI
LOZGxNa1rEiRQejiqJZd4UpimarFE3eQKorwF6GirSFo9Kvh4FkU7ac1KVNAKKUD
tlYYLNa3A9Ie4t7AfsfBWcRQ4YPXI4FmvnPjp+F64J6m5lQZN2yezExUxUPbjH+a
1Jp+TnlpexABs8EhUatR86oRjzNCrHXQrRWn6kmBlJ3xuhMrYatJ6wc+3Mb7657L
ig0Zp0ZchLk0S4j1nCWm0BcTRih072zQv08TGtzr+f7sbldBSEg=
=tvlX
-----END PGP SIGNATURE-----

--TRYliJ5NKNqkz5bu--

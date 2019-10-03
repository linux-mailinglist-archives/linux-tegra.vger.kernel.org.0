Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3FADC9995
	for <lists+linux-tegra@lfdr.de>; Thu,  3 Oct 2019 10:12:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728061AbfJCIMC (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 3 Oct 2019 04:12:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:55722 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727831AbfJCIMB (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 3 Oct 2019 04:12:01 -0400
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7970121A4C;
        Thu,  3 Oct 2019 08:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570090321;
        bh=O5XOqVtI749lX0kLTXsizlwyJ9jF3EZNAzgZ3Tj2D4A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YZaBTrmPZzkfsvkluHP0PQmgfB/mq+/dWelyLwPf0GVh7Q3OJfNLZjjv6SAcoERTC
         cZ0QWTzebb8L6n6es43dgA4s3rvh3bGjNxZp6l9W8J92j/ErUx8pYBq7liCOClYlXp
         tCpVLRlx8fuqIGiUsb7iaMfTppeMIGRLwyUGX128=
Date:   Thu, 3 Oct 2019 10:11:58 +0200
From:   Maxime Ripard <mripard@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Georgi Djakov <georgi.djakov@linaro.org>
Subject: Re: [PATCH] arm64: tegra: Set dma-ranges for memory subsystem
Message-ID: <20191003081158.v72o3rilgg2bhncn@gilmour>
References: <20191002154654.225690-1-thierry.reding@gmail.com>
 <20191002154946.GA225802@ulmo>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bengp4ayl5pew25c"
Content-Disposition: inline
In-Reply-To: <20191002154946.GA225802@ulmo>
User-Agent: NeoMutt/20180716
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--bengp4ayl5pew25c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 02, 2019 at 05:49:46PM +0200, Thierry Reding wrote:
> On Wed, Oct 02, 2019 at 05:46:54PM +0200, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >
> > On Tegra194, all clients of the memory subsystem can generally address
> > 40 bits of system memory. However, bit 39 has special meaning and will
> > cause the memory controller to reorder sectors for block-linear buffer
> > formats. This is primarily useful for graphics-related devices.
> >
> > Use of bit 39 must be controlled on a case-by-case basis. Buffers that
> > are used with bit 39 set by one device may be used with bit 39 cleared
> > by other devices.
> >
> > Care must be taken to allocate buffers at addresses that do not require
> > bit 39 to be set. This is normally not an issue for system memory since
> > there are no Tegra-based systems with enough RAM to exhaust the 39-bit
> > physical address space. However, when a device is behind an IOMMU, such
> > as the ARM SMMU on Tegra194, the IOMMUs input address space can cause
> > IOVA allocations to happen in this region. This is for example the case
> > when an operating system implements a top-down allocation policy for IO
> > virtual addresses.
> >
> > To account for this, describe the path that memory accesses take through
> > the system. Memory clients will send requests to the memory controller,
> > which forwards bits [38:0] of the address either to the external memory
> > controller or the SMMU, depending on the stream ID of the access. A good
> > way to describe this is using the interconnects bindings, see:
> >
> > 	Documentation/devicetree/bindings/interconnect/interconnect.txt
> >
> > The standard "dma-mem" path is used to describe the path towards system
> > memory via the memory controller. A dma-ranges property in the memory
> > controller's device tree node limits the range of DMA addresses that the
> > memory clients can use to bits [38:0], ensuring that bit 39 is not used.
> >
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> > Arnd, Rob, Robin,
> >
> > This is what I came up with after our discussion on this thread:
> >
> > 	[PATCH 00/11] of: dma-ranges fixes and improvements
> >
> > Please take a look and see if that sounds reasonable. I'm slightly
> > unsure about the interconnects bindings as I used them here. According
> > to the bindings there's always supposed to be a pair of interconnect
> > paths, so this patch is not exactly compliant. It does work fine with
> > the __of_get_dma_parent() code that Maxime introduced a couple of months
> > ago and really very neatly describes the hardware. Interestingly this
> > will come in handy very soon now since we're starting work on a proper
> > interconnect provider (the memory controller driver is the natural fit
> > for this because it has additional knobs to configure latency and
> > priorities, etc.) to implement external memory frequency scaling based
> > on bandwidth requests from memory clients. So this all fits together
> > very nicely. But as I said, I'm not exactly sure what to add as a second
> > entry in "interconnects" to make this compliant with the bindings.

It definitely sounds reasonable to me :)

Maxime

--bengp4ayl5pew25c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXZWtTgAKCRDj7w1vZxhR
xaNSAQDPvQ0Eg3wgAsW+NG/VGPUeXTGz5HZ2S7wOq83jBXQOjwD+Mxiz+DDez9yR
wEL8S5X8NUb7rZUsz+nnZoo4Dh142g4=
=0yH4
-----END PGP SIGNATURE-----

--bengp4ayl5pew25c--

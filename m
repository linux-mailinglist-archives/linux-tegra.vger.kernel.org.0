Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3972F4B1943
	for <lists+linux-tegra@lfdr.de>; Fri, 11 Feb 2022 00:16:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345555AbiBJXPt (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 10 Feb 2022 18:15:49 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:34416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbiBJXPs (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 10 Feb 2022 18:15:48 -0500
Received: from soltyk.jannau.net (soltyk.jannau.net [144.76.91.90])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C33D5F4E;
        Thu, 10 Feb 2022 15:15:46 -0800 (PST)
Received: by soltyk.jannau.net (Postfix, from userid 1000)
        id B7CA126E3C2; Fri, 11 Feb 2022 00:15:44 +0100 (CET)
Date:   Fri, 11 Feb 2022 00:15:44 +0100
From:   Janne Grunau <j@jannau.net>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh@kernel.org>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Sven Peter <sven@svenpeter.dev>,
        Dmitry Osipenko <digetx@gmail.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>, devicetree@vger.kernel.org,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/5] dt-bindings: reserved-memory: Document memory
 region specifier
Message-ID: <20220210231544.GC1848@jannau.net>
References: <YS+Ke4Ip0InHSnHR@orome.fritz.box>
 <CAL_Jsq+TQeb56UbrO1xKFSb1yo0d8U29DPynw3_jQ6gH6Peatw@mail.gmail.com>
 <YTIogpQDJjqJUTkG@orome.fritz.box>
 <CAL_JsqKG4+n_eNj+at3m7WuAbeJ1Kyi0mYD=8-MaVjfhzdPwkA@mail.gmail.com>
 <YTJA2xARFuNUMgMc@orome.fritz.box>
 <CAL_JsqJWt6ZELEpMi+tS6S6S4MYyMHysAC2ce_CfDQFqjfgnGQ@mail.gmail.com>
 <YTelDHx2REIIvV/N@orome.fritz.box>
 <YUIPCxnyRutMS47/@orome.fritz.box>
 <20220206222700.GA1848@jannau.net>
 <YgPsVAsEcUYKHNIj@orome>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YgPsVAsEcUYKHNIj@orome>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 2022-02-09 17:31:16 +0100, Thierry Reding wrote:
> On Sun, Feb 06, 2022 at 11:27:00PM +0100, Janne Grunau wrote:
> > On 2021-09-15 17:19:39 +0200, Thierry Reding wrote:
> > > On Tue, Sep 07, 2021 at 07:44:44PM +0200, Thierry Reding wrote:
> > > > On Tue, Sep 07, 2021 at 10:33:24AM -0500, Rob Herring wrote:
> > > > > On Fri, Sep 3, 2021 at 10:36 AM Thierry Reding <thierry.reding@gmail.com> wrote:
> > > > > >
> > > > > > On Fri, Sep 03, 2021 at 09:36:33AM -0500, Rob Herring wrote:
> > > > > > > On Fri, Sep 3, 2021 at 8:52 AM Thierry Reding <thierry.reding@gmail.com> wrote:
> > > > > > > >
> > > > > > > > On Fri, Sep 03, 2021 at 08:20:55AM -0500, Rob Herring wrote:
> > > > > > > > >
> > > > > > > > > Couldn't we keep this all in /reserved-memory? Just add an iova
> > > > > > > > > version of reg. Perhaps abuse 'assigned-address' for this purpose. The
> > > > > > > > > issue I see would be handling reserved iova areas without a physical
> > > > > > > > > area. That can be handled with just a iova and no reg. We already have
> > > > > > > > > a no reg case.
> > > > > > > >
> > > > > > > > I had thought about that initially. One thing I'm worried about is that
> > > > > > > > every child node in /reserved-memory will effectively cause the memory
> > > > > > > > that it described to be reserved. But we don't want that for regions
> > > > > > > > that are "virtual only" (i.e. IOMMU reservations).
> > > > > > >
> > > > > > > By virtual only, you mean no physical mapping, just a region of
> > > > > > > virtual space, right? For that we'd have no 'reg' and therefore no
> > > > > > > (physical) reservation by the OS. It's similar to non-static regions.
> > > > > > > You need a specific handler for them. We'd probably want a compatible
> > > > > > > as well for these virtual reservations.
> > > > > >
> > > > > > Yeah, these would be purely used for reserving regions in the IOVA so
> > > > > > that they won't be used by the IOVA allocator. Typically these would be
> > > > > > used for cases where those addresses have some special meaning.
> > > > > >
> > > > > > Do we want something like:
> > > > > >
> > > > > >         compatible = "iommu-reserved";
> > > > > >
> > > > > > for these? Or would that need to be:
> > > > > >
> > > > > >         compatible = "linux,iommu-reserved";
> > > > > >
> > > > > > ? There seems to be a mix of vendor-prefix vs. non-vendor-prefix
> > > > > > compatible strings in the reserved-memory DT bindings directory.
> > > > > 
> > > > > I would not use 'linux,' here.
> > > > > 
> > > > > >
> > > > > > On the other hand, do we actually need the compatible string? Because we
> > > > > > don't really want to associate much extra information with this like we
> > > > > > do for example with "shared-dma-pool". The logic to handle this would
> > > > > > all be within the IOMMU framework. All we really need is for the
> > > > > > standard reservation code to skip nodes that don't have a reg property
> > > > > > so we don't reserve memory for "virtual-only" allocations.
> > > > > 
> > > > > It doesn't hurt to have one and I can imagine we might want to iterate
> > > > > over all the nodes. It's slightly easier and more common to iterate
> > > > > over compatible nodes rather than nodes with some property.
> > > > > 
> > > > > > > Are these being global in DT going to be a problem? Presumably we have
> > > > > > > a virtual space per IOMMU. We'd know which IOMMU based on a device's
> > > > > > > 'iommus' and 'memory-region' properties, but within /reserved-memory
> > > > > > > we wouldn't be able to distinguish overlapping addresses from separate
> > > > > > > address spaces. Or we could have 2 different IOVAs for 1 physical
> > > > > > > space. That could be solved with something like this:
> > > > > > >
> > > > > > > iommu-addresses = <&iommu1 <address cells> <size cells>>;
> > > > > >
> > > > > > The only case that would be problematic would be if we have overlapping
> > > > > > physical regions, because that will probably trip up the standard code.
> > > > > >
> > > > > > But this could also be worked around by looking at iommu-addresses. For
> > > > > > example, if we had something like this:
> > > > > >
> > > > > >         reserved-memory {
> > > > > >                 fb_dc0: fb@80000000 {
> > > > > >                         reg = <0x80000000 0x01000000>;
> > > > > >                         iommu-addresses = <0xa0000000 0x01000000>;
> > > > > >                 };
> > > > > >
> > > > > >                 fb_dc1: fb@80000000 {
> > > > > 
> > > > > You can't have 2 nodes with the same name (actually, you can, they
> > > > > just get merged together). Different names with the same unit-address
> > > > > is a dtc warning. I'd really like to make that a full blown
> > > > > overlapping region check.
> > > > 
> > > > Right... so this would be a lot easier to deal with using that earlier
> > > > proposal where the IOMMU regions were a separate thing and referencing
> > > > the reserved-memory nodes. In those cases we could just have the
> > > > physical reservation for the framebuffer once (so we don't get any
> > > > duplicates or overlaps) and then have each IOVA reservation reference
> > > > that to create the mapping.
> > > > 
> > > > > 
> > > > > >                         reg = <0x80000000 0x01000000>;
> > > > > >                         iommu-addresses = <0xb0000000 0x01000000>;
> > > > > >                 };
> > > > > >         };
> > > > > >
> > > > > > We could make the code identify that this is for the same physical
> > > > > > reservation (maybe make it so that reg needs to match exactly for this
> > > > > > to be recognized) but with different virtual allocations.
> > > > > >
> > > > > > On a side-note: do we really need to repeat the size? I'd think if we
> > > > > > want mappings then we'd likely want them for the whole reservation.
> > > > > 
> > > > > Humm, I suppose not, but dropping it paints us into a corner if we
> > > > > come up with wanting a different size later. You could have a carveout
> > > > > for double/triple buffering your framebuffer, but the bootloader
> > > > > framebuffer is only single buffered. So would you want actual size?
> > > > 
> > > > Perhaps this needs to be a bit more verbose then. If we want the ability
> > > > to create a mapping for only a partial reservation, I could imagine we
> > > > may as well want one that doesn't start at the beginning. So perhaps an
> > > > ever better solution would be to have a complete mapping, something that
> > > > works similar to "ranges" perhaps, like so:
> > > > 
> > > > 	fb@80000000 {
> > > > 		reg = <0x80000000 0x01000000>;
> > > > 		iommu-ranges = <0x80000000 0x01000000 0x80000000>;
> > > > 	};
> > > > 
> > > > That would be for a full identity mapping, but we could also have
> > > > something along the lines of this:
> > > > 
> > > > 	fb@80000000 {
> > > > 		reg = <0x80000000 0x01000000>;
> > > > 		iommu-ranges = <0x80100000 0x00100000 0xa0000000>;
> > > > 	};
> > > > 
> > > > So that would only map a 1 MiB chunk at offset 1 MiB (of the physical
> > > > reservation) to I/O virtual address 0xa0000000.
> > > > 
> > > > > > I'd like to keep references to IOMMUs out of this because they would be
> > > > > > duplicated. We will only use these nodes if they are referenced by a
> > > > > > device node that also has an iommus property. Also, the IOMMU reference
> > > > > > itself isn't enough. We'd also need to support the complete specifier
> > > > > > because you can have things like SIDs in there to specify the exact
> > > > > > address space that a device uses.
> > > > > >
> > > > > > Also, for some of these they may be reused independently of the IOMMU
> > > > > > address space. For example the Tegra framebuffer identity mapping can
> > > > > > be used by either of the 2-4 display controllers, each with (at least
> > > > > > potentially) their own address space. But we don't want to have to
> > > > > > describe the identity mapping separately for each display controller.
> > > > > 
> > > > > Okay, but I'd rather have to duplicate things in your case than not be
> > > > > able to express some other case.
> > > > 
> > > > The earlier "separate iov-reserved-memory" proposal would be a good
> > > > compromise here. It'd allow us to duplicate only the necessary bits
> > > > (i.e. the IOVA mappings) but keep the common bits simple. And even
> > > > the IOVA mappings could be shared for cases like identity mappings.
> > > > See below for more on that.
> > > > 
> > > > > > Another thing to consider is that these nodes will often be added by
> > > > > > firmware (e.g. firmware will allocate the framebuffer and set up the
> > > > > > corresponding reserved memory region in DT). Wiring up references like
> > > > > > this would get very complicated very quickly.
> > > > > 
> > > > > Yes.
> > > > > 
> > > > > The using 'iommus' property option below can be optional and doesn't
> > > > > have to be defined/supported now. Just trying to think ahead and not
> > > > > be stuck with something that can't be extended.
> > > > 
> > > > One other benefit of the separate iov-reserved-memory node would be that
> > > > the iommus property could be simplified. If we have a physical
> > > > reservation that needs to be accessed by multiple different display
> > > > controllers, we'd end up with something fairly complex, such as this:
> > > > 
> > > > 	fb: fb@80000000 {
> > > > 		reg = <0x80000000 0x01000000>;
> > > > 		iommus = <&dc0_iommu 0xa0000000 0x01000000>,
> > > > 			 <&dc1_iommu 0xb0000000 0x01000000>,
> > > > 			 <&dc2_iommu 0xc0000000 0x01000000>;
> > > > 	};
> > > > 
> > > > This would get even worse if we want to support partial mappings. Also,
> > > > it'd become quite complicated to correlate this with the memory-region
> > > > references:
> > > > 
> > > > 	dc0: dc@40000000 {
> > > > 		...
> > > > 		memory-region = <&fb>;
> > > > 		iommus = <&dc0_iommu>;
> > > > 		...
> > > > 	};
> > > > 
> > > > So now you have to go match up the phandle (and potentially specifier)
> > > > in the iommus property of the disp0 node with an entry in the fb node's
> > > > iommus property. That's all fairly complicated stuff.
> > > > 
> > > > With separate iov-reserved-memory, this would be a bit more verbose, but
> > > > each individual node would be simpler:
> > > > 
> > > > 	reserved-memory {
> > > > 		fb: fb@80000000 {
> > > > 			reg = <0x80000000 0x01000000>;
> > > > 		};
> > > > 	};
> > > > 
> > > > 	iov-reserved-memory {
> > > > 		fb0: fb@80000000 {
> > > > 			/* identity mapping, "reg" optional? */
> > > > 			reg = <0x80000000 0x01000000>;
> > > > 			memory-region = <&fb>;
> > > > 		};
> > > > 
> > > > 		fb1: fb@90000000 {
> > > > 			/* but doesn't have to be */
> > > > 			reg = <0x90000000 0x01000000>;
> > > > 			memory-region = <&fb>;
> > > > 		};
> > > > 
> > > > 		fb2: fb@a0000000 {
> > > > 			/* can be partial, too */
> > > > 			ranges = <0x80000000 0x00800000 0xa0000000>;
> > > > 			memory-region = <&fb>;
> > > > 		};
> > > > 	}
> > > > 
> > > > 	dc0: dc@40000000 {
> > > > 		iov-memory-regions = <&fb0>;
> > > > 		/* optional? */
> > > > 		memory-region = <&fb>;
> > > > 		iommus = <&dc0_iommu>;
> > > > 	};
> > > > 
> > > > Alternatively, if we want to support partial mappings, we could replace
> > > > those reg properties by ranges properties that I showed earlier. We may
> > > > even want to support both. Use "reg" for virtual-only reservations and
> > > > identity mappings, or "simple partial mappings" (that map a sub-region
> > > > starting from the beginning). Identity mappings could still be
> > > > simplified by just omitting the "reg" property. For more complicated
> > > > mappings, such as the ones on M1, the "ranges" property could be used.
> > > > 
> > > > Note how this looks a bit boilerplate-y, but it's actually really quite
> > > > simple to understand, even for humans, I think.
> > > > 
> > > > Also, the phandles in this are comparatively easy to wire up because
> > > > they can all be generated in a hierarchical way: generate physical
> > > > reservation and store phandle, then generate I/O virtual reservation
> > > > to reference that phandle and store the new phandle as well. Finally,
> > > > wire this up to the display controller (using either the IOV phandle or
> > > > both).
> > > > 
> > > > Granted, this requires the addition of a new top-level node, but given
> > > > how expressive this becomes, I think it might be worth a second
> > > > consideration.
> > > 
> > > I guess as a middle-ground between your suggestion and mine, we could
> > > also move the IOV nodes back into reserved-memory. If we make sure the
> > > names (together with unit-addresses) are unique, to support cases where
> > > we want to identity map, or have multiple mappings at the same address.
> > > So it'd look something like this:
> > > 
> > > 	reserved-memory {
> > > 		fb: fb@80000000 {
> > > 			reg = <0x80000000 0x01000000>;
> > > 		};
> > > 
> > > 		audio-firmware@ff000000 {
> > > 			/* perhaps add "iommu-reserved" for this case */
> > > 			compatible = "iommu-mapping";
> > > 			/*
> > > 			 * no memory-region referencing a physical
> > > 			 * reservation, indicates that this is an
> > > 			 * IOMMU reservation, rather than a mapping
> > > 			 /
> > > 			reg = <0xff000000 0x01000000>;
> > > 		};
> > > 
> > > 		fb0: fb-mapping@80000000 {
> > > 			compatible = "iommu-mapping";
> > > 			/* identity mapping, "reg" optional? */
> > > 			reg = <0x80000000 0x01000000>;
> > > 			memory-region = <&fb>;
> > > 		};
> > > 
> > > 		fb1: fb-mapping@90000000 {
> > > 			compatible = "iommu-mapping";
> > > 			/* but doesn't have to be */
> > > 			reg = <0x90000000 0x01000000>;
> > > 			memory-region = <&fb>;
> > > 		};
> > > 
> > > 		fb2: fb-mapping@a0000000 {
> > > 			compatible = "iommu-mapping";
> > > 			/* can be partial, too */
> > > 			ranges = <0xa0000000 0x00800000 0x80000000>;
> > > 			memory-region = <&fb>;
> > > 		};
> > > 	}
> > > 
> > > 	dc0: dc@40000000 {
> > > 		memory-region = <&fb0>;
> > > 		iommus = <&dc0_iommu>;
> > > 	};
> > > 
> > > What do you think?
> > 
> > I converted the Apple M1 display controller driver to using reserved 
> > regions using these bindings. It is sufficient for the needs of the M1 
> > display controller which is so far the only device requiring this.
> 
> Thanks for trying this out. I've been meaning to resume this discussion
> to finally get closure because we really want to enable this for various
> Tegra SoCs.
> 
> > I encountered two problems with this bindings proposal:
> > 
> > 1) It is impossible to express which iommu needs to be used if a device 
> > has multiple "iommus" specified. This is on the M1 only a theoretical 
> > problem as the display co-processor devices use a single iommu.
> 
> From what I recall this is something that we don't fully support either
> way. If you've got a struct device and you want to allocate DMA'able
> memory, you can only pass that struct device to the DMA API upon
> allocation but you have no way of specifying separate instances
> depending on use-case.

Ok, let's us ignore then my complicated proposal. It is not a problem we 
need to solve for the M1.

> > 2) The reserved regions can not easily looked up at iommu probe 
> > time.  The Apple M1 iommu driver resets the iommu at probe. This 
> > breaks the framebuffer. The display controller appears to crash then 
> > an active scan-out framebuffer is unmapped. Resetting the iommu 
> > looks like a sensible approach though.
> > 
> > To work around this I added custom property to the affected iommu node 
> > to avoid the reset. This doesn't feel correct since the reason to avoid 
> > the reset is that we have to maintain the reserved regions mapping until 
> > the display controller driver takes over.
> > As far as I can see the only method to retrieve devices with reserved 
> > memory from the iommu is to iterate over all devices. This looks 
> > impractical. The M1 has over 20 distinct iommus.
> 
> Do I understand correctly that on the M1, the firmware sets up a mapping
> in the IOMMU already and then you want to recreate that mapping after
> the IOMMU driver has reset the IOMMU?

The mappings are already set up by firmware as it uses the frame buffer 
already itself. We need to make the kernel aware of the existing mapping 
so it can use the IOMMU. Using reserved memory regions and mappings 
seems to be clean way to do this. We want to reset IOMMUs without 
pre-existing mappings (the M1 has over 20 IOMMUs). We need a way to 
identify the two IOMMUs which must not be reseted at driver probe time.  
A simple property in the IOMMU node would be enough. It would duplicate 
information though since the only reason why we can't reset the IOMMU is 
the pre-existing mapping

> In that case, how do you make sure that you atomically transition from
> the firmware mapping to the kernel mapping? As soon as you reset the
> IOMMU, the display controller will cause IOMMU faults because its now
> scanning out from an unmapped buffer, right?

We are replacing the entire firmware managed page table with a kernel 
managed one with a TTBR MMIO register write. The second IOMMU with 
pre-existing mapping has unfortunately the TTBR locked. Dealing with 
this is more complicated but the device using this IOMMU appears to
sleep.

> So that approach of avoiding the reset doesn't seem wrong to me.
> Obviously that's not altogether trivial to do either. Typically the
> IOMMU mappings would be contained in system memory, so you'd have to
> reserve those via reserved-memory nodes as well, etc.

The system memory is currently not expressed as reserved-memory but 
simply outside of the specified memory.
 
> > One way to avoid both problems would be to move the mappings to the 
> > iommu node as sub nodes. The device would then reference those.  
> > This way the mapping is readily available at iommu probe time and 
> > adding iommu type specific parameters to map the region correctly is 
> > possible.
> > 
> > The sample above would transfor to:
> > 
> > 	reserved-memory {
> > 		fb: fb@80000000 {
> > 			reg = <0x80000000 0x01000000>;
> > 		};
> > 	};
> > 
> > 	dc0_iommu: iommu@20000000 {
> > 		#iommu-cells = <1>;
> > 
> > 		fb0: fb-mapping@80000000 {
> > 			compatible = "iommu-mapping";
> > 			/* identity mapping, "reg" optional? */
> > 			reg = <0x80000000 0x01000000>;
> > 			memory-region = <&fb>;
> > 			device-id = <0>; /* for #iommu-cells*/
> > 		};
> > 
> > 		fb1: fb-mapping@90000000 {
> > 			compatible = "iommu-mapping";
> > 			/* but doesn't have to be */
> > 			reg = <0x90000000 0x01000000>;
> > 			memory-region = <&fb>;
> > 			device-id = <1>; /* for #iommu-cells*/
> > 		};
> > 	};
> > 
> > 	dc0: dc@40000000 {
> > 		iommu-region = <&fb0>;
> > 		iommus = <&dc0_iommu 0>;
> > 	};
> > 
> > Does anyone see problems with this approach or can think of something 
> > better?
> 
> The device tree description of this looks a bit weird because it
> sprinkles things all around. For instance now we've got the "stream ID"
> (i.e. what you seem to be referring to as "device-id") in two places,
> once in the iommus property of the DC node and once in the mapping.

Yes, stream_id would be the device-id. It is the term used in the 
apple-dart IOMMU driver. It is duplicated to deal with the multiple 
IOMMU problem. Let's ignore that and scrape my proposal.
 
> Would it work if you added back-references to the devices that are
> active on boot to the IOMMU node? Something along these lines:
> 
> 	reserved-memory {
> 		fb: fb@80000000 {
> 			reg = <0x80000000 0x01000000>;
> 		};
> 	};
> 
> 	dc0_iommu: iommu@20000000 {
> 		#iommu-cells = <1>;
> 
> 		mapped-devices = <&dc0>;
> 	};
> 
> 	dc0: dc@40000000 {
> 		memory-region = <&fb0>;
> 		iommus = <&dc0_iommu 0>;
> 	};
> 
> Depending on how you look at it that's a circular dependency, but it
> won't be in practice. It makes things a bit more compact and puts the
> data where it belongs.

Yes, this works for the Apple M1 display co-processor. I've changed the 
dts and my apple-dart private parsing code to use "mapped-devices" 
back-references and it works as before. We probably need an automated 
check to ensure the references between device and IOMMU remains 
consistent.

thanks
Janne

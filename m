Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 811369225E
	for <lists+linux-tegra@lfdr.de>; Mon, 19 Aug 2019 13:29:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727208AbfHSL3D (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 19 Aug 2019 07:29:03 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:53414 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727039AbfHSL3D (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 19 Aug 2019 07:29:03 -0400
Received: by mail-wm1-f65.google.com with SMTP id 10so1283924wmp.3
        for <linux-tegra@vger.kernel.org>; Mon, 19 Aug 2019 04:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=BwCkwVnYdLsdqLjxQ0pfBOiD1gbMLbLHE2ZYXngi7M0=;
        b=jIA4XAKNMgKdsKoqB+LJ3F2e/Hwt+Hv02sxXOM4WkVsfELkQUlNPvA6/TbY3Ehb2Io
         pdmlpZ8464RtIbgm/LF+wzj3sVtMBtzWefDvIm1pFqvLYQyQwBsLl0kVBkl5HUXgtl9F
         BNNVxAUSty+ibZLfbsRpxFbjgWD4xLwHiDA3m3Br/QgdLom/RttHLAFdE/VJJRvXCKUz
         uD6IUr0H9SMEx6znF09ggqH1SHDqU/yIeeQHtNztpepTrARfe1guYCYIX+c53ZBZ00Qr
         +0aUTuezyywu+1ofYQDAkEALd1HvAghD7ldo0N3hBmlts96rPvwIpfsaUzQc9oMrkLMS
         ymvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=BwCkwVnYdLsdqLjxQ0pfBOiD1gbMLbLHE2ZYXngi7M0=;
        b=AEj0Q3GlfYa3hHHADz9sIt+0N+PHRPkQrc2o3wzEKNEMx7UCra0Qm7xFIcRMwNRbUT
         yq1wkzF+3VGV5TwpcKtV1M+EjqmsT7lqam8huJ/xvYMG9z0jl/cNsR5Cc3B9f11uEWDR
         RBLOQSqPN+dxoZXEGQGRL3dvpyUcBnPWMxmClqjwO8jwl4+Cn/gJr79hlImVKgsArOhQ
         QGPE+QDFoxAxuabQvvIdkXenAP0W+Px6EV2YgdbfGlWmsNnv/7pPCctjD7XhNlV9OEKd
         l9N1bO++opl3Y+th/WTZAUc1yzo85Y6juQAznEH2OOSOkyvbC6RSy12WDLEjjIc9DNA8
         HOhQ==
X-Gm-Message-State: APjAAAUdcl8ehu2OVrtVJ1wGsby9Y9UP7qhfY9De/cNfd26uMHJTiTfR
        dlRuzu15FJNCbQBqv+Uxf/c=
X-Google-Smtp-Source: APXvYqxhItfDA8At3OVhpCbf9NaQcO4FAw75/K+npVZcmqYypAuJxk4pooztnjczy0xw/l0UCyJ8oA==
X-Received: by 2002:a1c:80d0:: with SMTP id b199mr19585589wmd.31.1566214139534;
        Mon, 19 Aug 2019 04:28:59 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
        by smtp.gmail.com with ESMTPSA id x20sm32028449wrg.10.2019.08.19.04.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2019 04:28:57 -0700 (PDT)
Date:   Mon, 19 Aug 2019 13:28:56 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Will Deacon <will.deacon@arm.com>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Joerg Roedel <joro@8bytes.org>,
        Douglas Anderson <dianders@chromium.org>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2] iommu/arm-smmu: Break insecure users by disabling
 bypass by default
Message-ID: <20190819112856.GA28102@ulmo>
References: <20190301192017.39770-1-dianders@chromium.org>
 <20190404145957.GA25912@fuggles.cambridge.arm.com>
 <4754bcf1-6423-f1fe-64d4-da4a35b164ad@free.fr>
 <20190424115231.GA14829@fuggles.cambridge.arm.com>
 <20190502105912.GA943@ulmo>
 <20190502110821.GD30966@fuggles.cambridge.arm.com>
 <20190502124525.GA3579@ulmo>
 <94cf6d56-5dcb-051a-06da-5edfacde1655@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="45Z9DzgjV8m4Oswq"
Content-Disposition: inline
In-Reply-To: <94cf6d56-5dcb-051a-06da-5edfacde1655@arm.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--45Z9DzgjV8m4Oswq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 02, 2019 at 03:27:55PM +0100, Robin Murphy wrote:
> On 02/05/2019 13:45, Thierry Reding wrote:
> > On Thu, May 02, 2019 at 12:08:21PM +0100, Will Deacon wrote:
> > > On Thu, May 02, 2019 at 12:59:12PM +0200, Thierry Reding wrote:
> > > > On Wed, Apr 24, 2019 at 12:52:31PM +0100, Will Deacon wrote:
> > > > > On Wed, Apr 24, 2019 at 01:36:58PM +0200, Marc Gonzalez wrote:
> > > > > > On 04/04/2019 17:00, Will Deacon wrote:
> > > > > >=20
> > > > > > > On Fri, Mar 01, 2019 at 11:20:17AM -0800, Douglas Anderson wr=
ote:
> > > > > > >=20
> > > > > > > > If you're bisecting why your peripherals stopped working, i=
t's
> > > > > > > > probably this CL.  Specifically if you see this in your dme=
sg:
> > > > > > > >    Unexpected global fault, this could be serious
> > > > > > > > ...then it's almost certainly this CL.
> > > > > > > >=20
> > > > > > > > Running your IOMMU-enabled peripherals with the IOMMU in by=
pass mode
> > > > > > > > is insecure and effectively disables the protection they pr=
ovide.
> > > > > > > > There are few reasons to allow unmatched stream bypass, and=
 even fewer
> > > > > > > > good ones.
> > > > > > > >=20
> > > > > > > > This patch starts the transition over to make it much harde=
r to run
> > > > > > > > your system insecurely.  Expected steps:
> > > > > > > >=20
> > > > > > > > 1. By default disable bypass (so anyone insecure will notic=
e) but make
> > > > > > > >     it easy for someone to re-enable bypass with just a KCo=
nfig change.
> > > > > > > >     That's this patch.
> > > > > > > >=20
> > > > > > > > 2. After people have had a little time to come to grips wit=
h the fact
> > > > > > > >     that they need to set their IOMMUs properly and have ha=
d time to
> > > > > > > >     dig into how to do this, the KConfig will be eliminated=
 and bypass
> > > > > > > >     will simply be disabled.  Folks who are truly upset and=
 still
> > > > > > > >     haven't fixed their system can either figure out how to=
 add
> > > > > > > >     'arm-smmu.disable_bypass=3Dn' to their command line or =
revert the
> > > > > > > >     patch in their own private kernel.  Of course these fol=
ks will be
> > > > > > > >     less secure.
> > > > > > > >=20
> > > > > > > > Suggested-by: Robin Murphy <robin.murphy@arm.com>
> > > > > > > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > > > > > > ---
> > > > > > > >=20
> > > > > > > > Changes in v2:
> > > > > > > > - Flipped default to 'yes' and changed comments a lot.
> > > > > > > >=20
> > > > > > > >   drivers/iommu/Kconfig    | 25 +++++++++++++++++++++++++
> > > > > > > >   drivers/iommu/arm-smmu.c |  3 ++-
> > > > > > > >   2 files changed, 27 insertions(+), 1 deletion(-)
> > > > > > >=20
> > > > > > > Cheers, I'll pick this one up for 5.2.
> > > > > >=20
> > > > > > Hello Will,
> > > > > >=20
> > > > > > You haven't pushed this patch out to linux-next AFAICT.
> > > > > >=20
> > > > > > Is that expected?
> > > > >=20
> > > > > It's on my branch for Joerg:
> > > > >=20
> > > > > https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/lo=
g/?h=3Dfor-joerg/arm-smmu/updates
> > > > >=20
> > > > > which I'll send to him today. My SMMU stuff doesn't go directly i=
nto -next.
> > > >=20
> > > > This made it to linux-next yesterday (less than a week before the m=
erge
> > > > window opens) and deliberately breaks existing configurations. That=
's a
> > > > little rude.
> > > >=20
> > > > At least give people a fair heads-up and a chance to fix things bef=
ore
> > > > you start break things.
> > >=20
> > > Sorry about the inconvenience here.
> > >=20
> > > This patch has been floating around for a while (albeit not in -next,=
 since
> > > I send my stuff via Joerg)
> >=20
> > You can't expect people to test random patches from the list if they're
> > not on Cc. I don't think it's safe to claim that patches have been well
> > tested until they've been in linux-next for at least a couple of days.
> >=20
> > >                             and is heading for 5.3, so you have ages =
to fix
> > > up your config!
> >=20
> > Last I checked, Joerg applied this for 5.2 because you sent it as part
> > of your "Updates for 5.2" pull request.
> >=20
> > >                  It would, of course, be better to configure the IOMM=
U to
> > > provide mappings for your DMA peripherals, but the trivial config cha=
nge
> > > will be enough to keep things working. We won't remove that as long as
> > > people are relying on it.
> >=20
> > I don't think the Kconfig option is really useful. People nowadays want
> > to run standard distribution kernels on their devices, and distribution
> > maintainers will often rely on kernel developers' guidance on what good
> > defaults are. This patch suggests that the default should be to disable
> > bypass, so if this hits 5.2 final and distributions create their kernel
> > packages, they're likely going to go with this default and potentially
> > break things for many of their users.
> >=20
> > Luckily this seems like it's fairly easy to fix, but given that we're
> > past v5.1-rc6, fixes for this now need to get special treatment. That
> > would've been okay if this was a pressing issues, but this is changing
> > something that's worked this way for ages, so it's hardly urgent.
> >=20
> > > I don't expect most people to run into problems with this change (the=
 new
> > > behaviour matches what SMMUv3 does already).
> >=20
> > I see the ARM SMMU v2 used in quite a few DTS files. Not all of these
> > may be problematic, but I'd be somewhat surprised if Tegra was the only
> > one impacted.
>=20
> If people have real technical reasons for needing unmatched stream bypass,
> then we'll probably need to consider some sort of per-SMMU override anywa=
y,
> since well-meaning users rendering the system unusable by enabling a
> security option isn't ideal. I'm in the middle of a big rework to
> accommodate platform-specific extensions more easily, so that's certainly=
 an
> angle I can try to plan for.
>=20
> On the other hand, if it's merely that nobody's yet got round to filling =
out
> the DT properly, then AIUI that's pretty much exactly what Doug wanted to
> motivate, so that the option *can* be used more widely by users who might
> want it. Hence the provocative title :)

I was just rebasing a set of patches that I've been working on for some
time that will eventually allow seamlessly transitioning display from a
firmware-controlled framebuffer to a DRM/KMS framebuffer.

The idea is to mark firmware-allocated buffers as reserved via the
standard reserved-memory DT bindings and hook them up in device tree to
the display controller nodes via memory-region properties. I've got this
working from a firmware/bootloader point of view, but I'm running into a
couple of issues during early boot.

I should mention that as part of this work I've also been meaning to
transition the Tegra SMMU driver that we use on Tegra210 and earlier to
register DMA IOMMU domains and then transition over the display driver
to use that instead of explicit IOMMU usage. One of the issues that I
ran into early on was that the Tegra SMMU would start faulting as soon
as the display controllers had been attached to the DMA IOMMU domain.
This is because the display hardware is still scanning out the frame-
buffer that firmware had set up when the DMA API hooks up to the IOMMU
domain. Currently we don't run into that because we explicitly only
attach to the IOMMU after the display hardware has been reinitialized.

This particular problem was fairly easy to fix by implementing the
IOMMU's ->get_resv_regions() and ->put_resv_regions() callbacks that
parse the memory-region properties for a device and create 1:1 mappings
for each region before "enabling" the domain.

I have patches to implement the same mechanism on Tegra186 where an ARM
SMMU is used. Unfortunately, with this patch to disable bypass by
default, this approach no longer works. The problem is that the ARM SMMU
starts faulting immediately after it's bound to the driver because all
stream IDs will now fault by default (and like I mentioned, the display
controller is still busy scanning out the framebuffer set up by the
firmware). The faults cause a massive amount of interrupt, slowing down
the boot process significantly, and cause the display hardware to read
the framebuffer as all-ones, so the display goes to complete white early
during boot.

Now, I realize that this is precisely what this patch intended. It's
quite nasty for the display hardware to just keep scanning stuff out
=66rom where it may not be allowed to. On the other hand, if we're careful
about marking the firmware framebuffer region reserved, Linux won't be
touching it and it'd be fine for the hardware to keep reading from it.
We do need to make sure to establish that 1:1 mapping, though, to fix
these faults.

So, since you mentioned "real technical reasons", I'm wondering if you
have any ideas how to fix this. I understand that, strictly speaking, we
do violate the Linux boot requirements here (display hardware is not
quiesced), but surely seamless transition from a firmware boot splash to
the kernel display driver is a feature that we want to support.

I suppose an easy way would be to let the firmware add a command-line
argument to enable bypass, but that seems a little coarse and it would
enable bypass in general, again opening up the security issues that you
wanted to close with this.

Perhaps an alternative would be to add a property to the SMMU node that
lists a set of stream IDs for which to enable bypass by default. We
could let the firmware set that when the display hardware has been set
up. That way when the kernel boots we can keep scanning from the
reserved memory and the ARM SMMU driver would not disable bypass for the
display hardware. Only when the display hardware is actually attached to
the IOMMU domain, and the 1:1 mappings have been created would bypass be
disabled, and at that point there should be no SMMU faults anymore, so
we have cleanly transitioned to the kernel.

Any thoughts?

Thierry

--45Z9DzgjV8m4Oswq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1ah/MACgkQ3SOs138+
s6G7bRAApPrCz8qAHK9aKwhVH0dVahij0CFk8n0D1+ynw9xFI95qeHn+EO9IZ9+J
1J+5Pvk/jS+zfXvRoz+FNM7VsKBjeAd6hdAH43Ci7TuksgYVxh4sHS4xfu20hTn3
uZF6Q4xzLP7VAP1lYtgUulCV9YApqs/JRlEJYf+u0VwlQgaKr4QBPpgr+L3QF9/C
0qkUMJS8sWXLV/i8eiy46IPOwuQMFzExzsScwdU+irpgP07qTcKha7SZZltDB3pP
vC/C13+ttlzz1ID2S2J+rl8+KhIk38yEJPPzBzxDQ3jEzo13VMnu42wrV1vbcI2F
nz244YlCTiGbVGFVDKS/A0xFliSXQthCAxQzXlL5inQKYdSsOLiwOshaCw5OrRWT
/18J2flHotTud2MuJSxpUJR9c9yJfa75FgCm9kxpGY0KCa5T0X1P4FHTtPmAiR4H
vBgYjDxYyX5D7RbIE1V6XMOV3s90OD93lRqnVw2BQaBcTzaN9VtIy2gcgIazTS7d
GeIVLyc08s5L2HisP1atmPp3Z4KcZ62QZntK8+PDAtnFKuGuI5TVSJ963ItGi6dz
zebe1+4huD4nC2WMkHuywdG4wo/itDm51IDZAPS4CEv6d5RaSyEuniRsY2/1kEU4
rYoGCybx2lUfVUhcASI+rV4ZwE0Gjs/nsuoUP5sivygtCsuaSWg=
=N5PZ
-----END PGP SIGNATURE-----

--45Z9DzgjV8m4Oswq--

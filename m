Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C0B211AD8
	for <lists+linux-tegra@lfdr.de>; Thu,  2 May 2019 16:08:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726278AbfEBOI6 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 2 May 2019 10:08:58 -0400
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:46460 "EHLO
        foss.arm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726197AbfEBOI6 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 2 May 2019 10:08:58 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D2F3374;
        Thu,  2 May 2019 07:08:57 -0700 (PDT)
Received: from fuggles.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.72.51.249])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 07E833F220;
        Thu,  2 May 2019 07:08:55 -0700 (PDT)
Date:   Thu, 2 May 2019 15:08:50 +0100
From:   Will Deacon <will.deacon@arm.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Joerg Roedel <joro@8bytes.org>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Douglas Anderson <dianders@chromium.org>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2] iommu/arm-smmu: Break insecure users by disabling
 bypass by default
Message-ID: <20190502140850.GA9500@fuggles.cambridge.arm.com>
References: <20190301192017.39770-1-dianders@chromium.org>
 <20190404145957.GA25912@fuggles.cambridge.arm.com>
 <4754bcf1-6423-f1fe-64d4-da4a35b164ad@free.fr>
 <20190424115231.GA14829@fuggles.cambridge.arm.com>
 <20190502105912.GA943@ulmo>
 <20190502110821.GD30966@fuggles.cambridge.arm.com>
 <20190502124525.GA3579@ulmo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190502124525.GA3579@ulmo>
User-Agent: Mutt/1.11.1+86 (6f28e57d73f2) ()
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, May 02, 2019 at 02:45:25PM +0200, Thierry Reding wrote:
> On Thu, May 02, 2019 at 12:08:21PM +0100, Will Deacon wrote:
> > On Thu, May 02, 2019 at 12:59:12PM +0200, Thierry Reding wrote:
> > > This made it to linux-next yesterday (less than a week before the merge
> > > window opens) and deliberately breaks existing configurations. That's a
> > > little rude.
> > > 
> > > At least give people a fair heads-up and a chance to fix things before
> > > you start break things.
> > 
> > Sorry about the inconvenience here.
> > 
> > This patch has been floating around for a while (albeit not in -next, since
> > I send my stuff via Joerg)
> 
> You can't expect people to test random patches from the list if they're
> not on Cc. I don't think it's safe to claim that patches have been well
> tested until they've been in linux-next for at least a couple of days.

I didn't claim it had been well tested. I also don't think being in
linux-next implies a patch has been well tested, to be honest with you.
What I can say is that this has been discussed on the public mailing list
for some time, and the outcome of that discussion is this patch.

> >                            and is heading for 5.3, so you have ages to fix
> > up your config!
> 
> Last I checked, Joerg applied this for 5.2 because you sent it as part
> of your "Updates for 5.2" pull request.

Sorry, I meant 5.2: the kernel that will be released in ~2 months time,
during which you'll be able to fix issues like this one. If we're having
unresolvable issues late in the cycle, then we can clearly revert this
patch.

> >                 It would, of course, be better to configure the IOMMU to
> > provide mappings for your DMA peripherals, but the trivial config change
> > will be enough to keep things working. We won't remove that as long as
> > people are relying on it.
> 
> I don't think the Kconfig option is really useful. People nowadays want
> to run standard distribution kernels on their devices, and distribution
> maintainers will often rely on kernel developers' guidance on what good
> defaults are. This patch suggests that the default should be to disable
> bypass, so if this hits 5.2 final and distributions create their kernel
> packages, they're likely going to go with this default and potentially
> break things for many of their users.

I'd say that people nowadays also want security by default, so it's a tough
crowd to please. You can still fix your .dts (I see there's a patch from Jon
doing that), or pass "arm-smmu.disable_bypass=0" on the cmdline to fix
things if you're not in a position to change the .config for your kernel
image.

> Luckily this seems like it's fairly easy to fix, but given that we're
> past v5.1-rc6, fixes for this now need to get special treatment. That
> would've been okay if this was a pressing issues, but this is changing
> something that's worked this way for ages, so it's hardly urgent.

Why the special treatment? You can continue to merge fixes after the merge
window, no? I feel like I'm missing something in your workflow here.

> > I don't expect most people to run into problems with this change (the new
> > behaviour matches what SMMUv3 does already).
> 
> I see the ARM SMMU v2 used in quite a few DTS files. Not all of these
> may be problematic, but I'd be somewhat surprised if Tegra was the only
> one impacted.

I didn't say this was specific to Tegra, only that I don't expect most
people to see any issue. I'm sure there will be others, and we can fix
them up as they appear. I can't think of a better way of toggling the
default behaviour.

Will

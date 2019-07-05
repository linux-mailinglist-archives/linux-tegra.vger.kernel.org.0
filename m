Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28806604B4
	for <lists+linux-tegra@lfdr.de>; Fri,  5 Jul 2019 12:48:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726978AbfGEKso (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 5 Jul 2019 06:48:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:41038 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726107AbfGEKso (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 5 Jul 2019 06:48:44 -0400
Received: from localhost (83-84-126-242.cable.dynamic.v4.ziggo.nl [83.84.126.242])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B98E721850;
        Fri,  5 Jul 2019 10:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1562323723;
        bh=XGd2vLAzlJ2Z3kAJjKznoeYo95wGYnVMbCTDtwaU5Ag=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=w9/iVsEr6JYLEqlyP5l3NxovSo0ESzIEDStw0jl6b7ykJeWhnRxFv0Fr7Yt8ayrJp
         COJNmch6l3cVP7ppqKJZqgamXhti9GNRkRhNsN+c38wz620JuyG3sOrjximFJrtO8e
         yZMI8eKryyhTS/X+eIYQSiN3tEqkfagA7WZTrcqU=
Date:   Fri, 5 Jul 2019 12:48:40 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, Vidya Sagar <vidyas@nvidia.com>,
        bhelgaas@google.com, treding@nvidia.com, swarren@nvidia.com,
        linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org,
        kthota@nvidia.com, mmaddireddy@nvidia.com, sagar.tv@gmail.com
Subject: Re: [PATCH V3] PCI: tegra: Enable Relaxed Ordering only for Tegra20
 & Tegra30
Message-ID: <20190705104840.GB11541@kroah.com>
References: <20190704150428.4035-1-vidyas@nvidia.com>
 <20190704160948.GA28058@e121166-lin.cambridge.arm.com>
 <310ce6f7-9379-9857-ac7c-53118b80966b@nvidia.com>
 <20190705093859.GA17491@e121166-lin.cambridge.arm.com>
 <20190705102330.GA11541@kroah.com>
 <20190705103506.GC17491@e121166-lin.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190705103506.GC17491@e121166-lin.cambridge.arm.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Jul 05, 2019 at 11:35:06AM +0100, Lorenzo Pieralisi wrote:
> On Fri, Jul 05, 2019 at 12:23:30PM +0200, Greg Kroah-Hartman wrote:
> > On Fri, Jul 05, 2019 at 10:38:59AM +0100, Lorenzo Pieralisi wrote:
> > > [+Greg]
> > > 
> > > On Fri, Jul 05, 2019 at 09:57:25AM +0100, Jon Hunter wrote:
> > > > Hi Lorenzo,
> > > > 
> > > > On 04/07/2019 17:09, Lorenzo Pieralisi wrote:
> > > > > On Thu, Jul 04, 2019 at 08:34:28PM +0530, Vidya Sagar wrote:
> > > > >> Currently Relaxed Ordering bit in the configuration space is enabled for
> > > > >> all PCIe devices as the quirk uses PCI_ANY_ID for both Vendor-ID and
> > > > >> Device-ID, but, as per the Technical Reference Manual of Tegra20 which is
> > > > >> available at https://developer.nvidia.com/embedded/downloads#?search=tegra%202
> > > > >> in Sec 34.1, it is mentioned that Relexed Ordering bit needs to be enabled in
> > > > >> its root ports to avoid deadlock in hardware. The same is applicable for
> > > > >> Tegra30 as well though it is not explicitly mentioned in Tegra30 TRM document,
> > > > >> but the same must not be extended to root ports of other Tegra SoCs or
> > > > >> other hosts as the same issue doesn't exist there.
> > > > >>
> > > > >> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> > > > > 
> > > > > You forgot Thierry's ACK, I added it back but next time pay more
> > > > > attention please.
> > > > > 
> > > > > You should link the versions through eg git send-email
> > > > > --in-reply-to=Message-Id so that it is easier to follow.
> > > > > 
> > > > >> ---
> > > > >> V3:
> > > > >> * Modified commit message to make it more precise and explicit
> > > > >>
> > > > >> V2:
> > > > >> * Modified commit message to include reference to Tegra20 TRM document.
> > > > >>
> > > > >>  drivers/pci/controller/pci-tegra.c | 7 +++++--
> > > > >>  1 file changed, 5 insertions(+), 2 deletions(-)
> > > > > 
> > > > > I applied it to pci/tegra after rewriting the whole commit log and
> > > > > adding a Fixes: tag that you or someone at Nvidia will follow up;
> > > > > I will check.
> > > > 
> > > > I had a chat with Vidya last night to understand the issue, so now I
> > > > have a good understanding of the problem this has caused, which is very
> > > > unfortunate indeed!
> > > > 
> > > > Vidya mentioned that you would like us to get this backported to stable
> > > > branches. Please correct me if I am wrong here. We can certainly do
> > > > that, but I do have concerns about doing so, for non-Tegra devices
> > > > inparticularly, given that this has been around for sometime now. Hence,
> > > > I was wondering if we should leave this soak in the mainline for at
> > > > least a kernel release cycle before doing so. I really don't want to
> > > > break stable for anyone. What are your thoughts on this?
> > > 
> > > I looped in Greg to pick his brain, since it is unclear how we should
> > > apply the stable kernel rules on this specific patch. Basically, this
> > > technically is not a bug, it is just bad code that forces a feature on
> > > ALL kernels that compile the PCI Tegra Controller driver in the kernel.
> > > I would really really want to have this patch applied to all stable
> > > kernels but first as you said it is better to apply it to mainline and
> > > check it does not cause any issues on any other arch/platform then
> > > we can think about backporting it to stable kernels.
> > 
> > You all have read the stable kernel rules, right:
> >     https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
> > 
> > Patches have to be upstream first.
> > 
> > After it is merged in Linus's tree, post the patches with the git commit
> > ids to stable@vger and we will be glad to review them there.
> 
> Hi Greg,
> 
> thanks, it was just to understand if the "Fixes:" tag would
> automatically make it a stable kernel candidate when it hits Linus'
> tree;

No it will not.  It _might_ get picked up by the "autobot" tool we have,
but it might not as well.  Never rely on that for a patch you know you
want into the stable tree.  Always put a specific cc: stable on it.

> I will drop it from the patch and we will post the patches to
> stable@vger when/if we want it considered for stable, we just do not
> want it to be automatically picked up, that's it.

Good idea.

thanks,

greg k-h

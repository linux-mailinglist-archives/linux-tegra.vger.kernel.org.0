Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA824387485
	for <lists+linux-tegra@lfdr.de>; Tue, 18 May 2021 11:00:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347649AbhERJB3 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 18 May 2021 05:01:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:34254 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1347630AbhERJBV (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 18 May 2021 05:01:21 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 75FAD61285;
        Tue, 18 May 2021 09:00:00 +0000 (UTC)
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78] helo=why.misterjones.org)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <maz@kernel.org>)
        id 1liva1-0021hj-CR; Tue, 18 May 2021 09:59:57 +0100
Date:   Tue, 18 May 2021 09:59:56 +0100
Message-ID: <87a6osv2lv.wl-maz@kernel.org>
From:   Marc Zyngier <maz@kernel.org>
To:     Jeremy Linton <jeremy.linton@arm.com>
Cc:     Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Frank Wunderlich <frank-w@public-files.de>,
        Thierry Reding <treding@nvidia.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh@kernel.org>, Will Deacon <will@kernel.org>,
        "K. Y. Srinivasan" <kys@microsoft.com>,
        Haiyang Zhang <haiyangz@microsoft.com>,
        Stephen Hemminger <sthemmin@microsoft.com>,
        Michael Kelley <mikelley@microsoft.com>,
        Wei Liu <wei.liu@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Ryder Lee <ryder.lee@mediatek.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Bharat Kumar Gogada <bharatku@xilinx.com>,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v3 13/14] PCI/MSI: Document the various ways of ending up with NO_MSI
In-Reply-To: <b5a5a6d8-6ffc-8c5c-c5b1-fb4f5616069f@arm.com>
References: <20210330151145.997953-1-maz@kernel.org>
        <20210330151145.997953-14-maz@kernel.org>
        <b5a5a6d8-6ffc-8c5c-c5b1-fb4f5616069f@arm.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/27.1
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: jeremy.linton@arm.com, lorenzo.pieralisi@arm.com, bhelgaas@google.com, frank-w@public-files.de, treding@nvidia.com, tglx@linutronix.de, robh@kernel.org, will@kernel.org, kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com, mikelley@microsoft.com, wei.liu@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com, ryder.lee@mediatek.com, marek.vasut+renesas@gmail.com, yoshihiro.shimoda.uh@renesas.com, michal.simek@xilinx.com, paul.walmsley@sifive.com, bharatku@xilinx.com, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org, linux-tegra@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, kernel-team@android.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Jeremy,

On Tue, 18 May 2021 05:28:56 +0100,
Jeremy Linton <jeremy.linton@arm.com> wrote:
> 
> Hi,
> 
> 
> On 3/30/21 10:11 AM, Marc Zyngier wrote:
> > We have now three ways of ending up with NO_MSI being set.
> > Document them.
> > 
> > Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> > Signed-off-by: Marc Zyngier <maz@kernel.org>
> > ---
> >   drivers/pci/msi.c | 11 +++++++++--
> >   1 file changed, 9 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/pci/msi.c b/drivers/pci/msi.c
> > index d9c73c173c14..217dc9f0231f 100644
> > --- a/drivers/pci/msi.c
> > +++ b/drivers/pci/msi.c
> > @@ -871,8 +871,15 @@ static int pci_msi_supported(struct pci_dev *dev, int nvec)
> >   	 * Any bridge which does NOT route MSI transactions from its
> >   	 * secondary bus to its primary bus must set NO_MSI flag on
> >   	 * the secondary pci_bus.
> > -	 * We expect only arch-specific PCI host bus controller driver
> > -	 * or quirks for specific PCI bridges to be setting NO_MSI.
> > +	 *
> > +	 * The NO_MSI flag can either be set directly by:
> > +	 * - arch-specific PCI host bus controller drivers (deprecated)
> > +	 * - quirks for specific PCI bridges
> > +	 *
> > +	 * or indirectly by platform-specific PCI host bridge drivers by
> > +	 * advertising the 'msi_domain' property, which results in
> > +	 * the NO_MSI flag when no MSI domain is found for this bridge
> > +	 * at probe time.
> 
> I have an ACPI machine with a gicv2 (no m), and a MSI region that
> isn't described by ACPI because its non-standard. In the past this
> tended to work because PCIe device drivers would fall back to legacy
> pci intx silently. But, with 5.13, it seems this series now triggers
> the WARN_ON_ONCE() in arch_setup_msi_irq, because duh, no MSI support.

This is nothing new, and you could get the exact same warning if you
didn't have legacy drivers compiled in (any of the 3 drivers that were
fixed in this series).

This series now makes sure you definitely know about this issue. And
look, it worked! :-)

> Everything of course continues to work, it just gets this ugly splat
> on bootup telling me basically the machine doesn't support MSIs. So, I
> considered a few patches, including just basically setting nomsi if
> gicv2 && acpi, or eek a host bridge quirk.
> 
> None of these seem great, so how can this be fixed?

The host bridge quirk seems the most likely route to address this, but
you could just as well advertise msi_domain in the ACPI PCI path,
*and* check for IORT mappings in pci_register_host_bridge(), similarly
to what Jean-Philippe has proposed for DT in [1].

Thanks,

	M.

[1] https://lore.kernel.org/r/20210510173129.750496-1-jean-philippe@linaro.org


-- 
Without deviation from the norm, progress is not possible.

Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3D1D1324F3
	for <lists+linux-tegra@lfdr.de>; Tue,  7 Jan 2020 12:34:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727896AbgAGLeB (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 7 Jan 2020 06:34:01 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:40545 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727658AbgAGLd7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 7 Jan 2020 06:33:59 -0500
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1ion7T-0002sF-BX; Tue, 07 Jan 2020 12:33:55 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1ion7S-0007gx-AY; Tue, 07 Jan 2020 12:33:54 +0100
Date:   Tue, 7 Jan 2020 12:33:54 +0100
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-pwm@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Richard Weinberger <richard@nod.at>,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        Thierry Reding <thierry.reding@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-rpi-kernel@lists.infradead.org, kernel@pengutronix.de,
        linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-riscv@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] pwm: Enable compile testing for some of drivers
Message-ID: <20200107113354.ggq6zarewq5ip354@pengutronix.de>
References: <20191230172113.17222-1-krzk@kernel.org>
 <20191230172113.17222-2-krzk@kernel.org>
 <20200107072645.ko247bwhh3ibdu73@pengutronix.de>
 <20200107082539.GA31827@pi3>
 <20200107104234.wq74fska3szrg4ii@pengutronix.de>
 <20200107110359.GA32423@pi3>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200107110359.GA32423@pi3>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-tegra@vger.kernel.org
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Jan 07, 2020 at 12:03:59PM +0100, Krzysztof Kozlowski wrote:
> On Tue, Jan 07, 2020 at 11:42:34AM +0100, Uwe Kleine-K�nig wrote:
> > > I guess other solution would be to add stubs for few clk functions...
> > > 
> > > > Also HAS_IOMEM is a typical requirement, but I tested with an ARCH=um
> > > > config (which does't have HAS_IOMEM) and they all compile fine.
> > > 
> > > Because of !HAS_IOMEM, since some time ARCH=um does not support
> > > COMPILE_TEST. Therefore HAS_IOMEM dependency is not needed for compile
> > > testing (and for regular build it is selected by ARCH).
> > 
> > Hehe, I didn't notice because for testing I just dropped the "depends on
> > ..." lines in Kconfig instead of adding "|| COMPILE_TEST" :-) Still they
> > compile fine on UML.
> > 
> > Ah, since bc083a64b6c0 ("init/Kconfig: make COMPILE_TEST depend on
> > !UML") == v4.8-rc1~52^2~83 COMPILE_TEST cannot be enabled on UML, but
> > later 1bcbfbfdeb00 ("um: add dummy ioremap and iounmap functions")
> > == v4.13-rc1~8^2~6 UM got a dummy implementation. So maybe we could
> > revert bc083a64b6c0 today? (And if not, a comment about why near the
> > "depends on !UML" in init/Kconfig would be great.)
> > 
> > Orthogonal to that, I wonder if depending on HAS_IOMEM is right even
> > though the compile testers won't notice it missing. Or should HAS_IOMEM
> > be dropped?
> 
> I think yes, it can be dropped, but this would require:
> 1. Fixing any dependencies on HAS_IOMEM, e.g.:
>     WARNING: unmet direct dependencies detected for MFD_SYSCON
>       Depends on [n]: HAS_IOMEM [=n]
>       Selected by [y]:
>       - PHY_DA8XX_USB [=y] && (ARCH_DAVINCI_DA8XX || COMPILE_TEST [=y])

I don't understand that warning. What did you modify to trigger that?
Probably related to the big "if HAS_IOMEM" in drivers/mfd/Kconfig?!

> 2. Checking if all of stubs are implemented (not only IOMEM but maybe
>    DMA as well). Also 1bcbfbfdeb00 brought only few stubs. Still we
>    need devm_ioremap_resource() and others.

A problem is that it's unclear (to me at least) what the presence of
HAS_IOMEM actually implies. I thought it's about ioremap + readl +
writel (including their respective variants). Does it really include dma
stuff, too?

> Quick test shows mentioned "unmet direct dependencies" and:
>     phy-pxa-usb.c:(.text+0x2f5): undefined reference to `devm_ioremap_resource'
>     dma-iommu.c:(.text+0x179): undefined reference to `dma_pgprot'

dma_pgprot seems to depend on HAS_DMA though, not HAS_IOMEM.

(Oh, HAS_DMA is defined using "depends on !NO_DMA" + "default y".
NO_DMA has three different definitions. Two of them (in
drivers/crypto/ccree/cc_hw_queue_defs.h and arch/arm/include/asm/dma.h)
unrelated.)

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-K�nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

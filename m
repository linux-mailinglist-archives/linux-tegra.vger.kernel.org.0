Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7DEF74DCB3
	for <lists+linux-tegra@lfdr.de>; Mon, 10 Jul 2023 19:46:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230363AbjGJRqc (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 10 Jul 2023 13:46:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230133AbjGJRqa (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 10 Jul 2023 13:46:30 -0400
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D743D106
        for <linux-tegra@vger.kernel.org>; Mon, 10 Jul 2023 10:46:26 -0700 (PDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 98C306003006;
        Mon, 10 Jul 2023 18:46:24 +0100 (WEST)
X-Virus-Scanned: by amavisd-new-2.11.0 (20160426) (Debian) at
        tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
        by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavisd-new, port 10025)
        with LMTP id NX7aAD5yL1jm; Mon, 10 Jul 2023 18:46:22 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 0B4F46003002;
        Mon, 10 Jul 2023 18:46:22 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tecnico.ulisboa.pt;
        s=mail; t=1689011182;
        bh=JCEr7WFJRchirfVUojABffXbNkagDopoNdWi2fxaHfk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To;
        b=tVAVKsg+PxZuiK6JflyLq4XNZyWn/VghUtdH+cOxOf65JRYJdGpmiFqcu4hedtDFp
         jMqnx26zq7gtPJT3I1njrPXvcU86sGCENAUOaE0buZuxFYAifD8FCCFHEAzRpOIvD3
         V6XU4bX7NybmqOO6e73h+ewhorQeiGBEBlDakIPo=
Received: from diogo-gram (unknown [176.95.43.196])
        (Authenticated sender: ist187313)
        by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 2CF28360075;
        Mon, 10 Jul 2023 18:46:21 +0100 (WEST)
Date:   Mon, 10 Jul 2023 18:46:17 +0100
From:   Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jonathanh@nvidia.com, arnd@arndb.de, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: smaug: Add EMC frequency change tables
Message-ID: <6dw4vphyvsqmc7smzqchxjhyn2qpw7lfqhjb5woppcmg7ploww@myniahrlnzz4>
References: <20230319194255.124589-1-diogo.ivo@tecnico.ulisboa.pt>
 <ZC11H7mXfHX_mGXh@orome>
 <pn6jovxrx7bkxfxq6qarlo357mvsf3ggxznzidz7pfdteefvvd@rqwbx4onwnky>
 <ZKwkf7hJzuR4FEDj@orome>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZKwkf7hJzuR4FEDj@orome>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Jul 10, 2023 at 05:32:15PM +0200, Thierry Reding wrote:
> On Mon, Apr 10, 2023 at 10:17:56AM +0100, Diogo Ivo wrote:
> > On Wed, Apr 05, 2023 at 03:18:23PM +0200, Thierry Reding wrote:
> > > On Sun, Mar 19, 2023 at 07:42:55PM +0000, Diogo Ivo wrote:
> > > > Add the reserved-memory regions of the nominal and derated tables setup by
> > > > the bootloader so that the EMC frequency change code can access them.
> > > > 
> > > > Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> > > > ---
> > > >  arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 21 +++++++++++++++++++
> > > >  1 file changed, 21 insertions(+)
> > > > 
> > > > diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
> > > > index 709f3f417a19..a74826ae97b4 100644
> > > > --- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
> > > > +++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
> > > > @@ -30,6 +30,22 @@ memory {
> > > >  		reg = <0x0 0x80000000 0x0 0xc0000000>;
> > > >  	};
> > > >  
> > > > +	reserved-memory {
> > > > +		#address-cells = <2>;
> > > > +		#size-cells = <2>;
> > > > +		ranges;
> > > > +
> > > > +		nominal: emc-table@f67cc000 {
> > > > +			compatible = "nvidia,tegra210-emc-table";
> > > > +			reg = <0x0 0xf67cc000 0x0 0xbea0>;
> > > > +		};
> > > > +
> > > > +		derated: emc-table@f67d7ea0 {
> > > > +			compatible = "nvidia,tegra210-emc-table";
> > > > +			reg = <0x0 0xf67d7ea0 0x0 0xbea0>;
> > > > +		};
> > > > +	};
> > > > +
> > > 
> > > These tables are typically generated by the firmware/bootloader at
> > > runtime. Often they'll use heap allocations for these, so the addresses
> > > are not guaranteed to be static.
> > > 
> > > Can you share a few details about what set of components you've used to
> > > set this up? If we add these we want to be as specific as possible that
> > > people use exactly the same set of firmware files.
> > > 
> > > Thierry
> > 
> > In the case of the Pixel C, coreboot takes care of copying these tables
> > into a static cbmem region. The actual function taking care of this is
> > tegra210_run_mtc(), found in [1], and from here it is possible to
> > construct the cbmem memory layout. I have confirmed that the device is
> > actually running this version of coreboot from the cbmem_console logs,
> > where the commits are explicitly stated. These logs also indicate where
> > the tables are located,
> > 
> > Wrote coreboot table at: 00000000f66ca000, 0x2c0 bytes, checksum 3601
> > coreboot table: 728 bytes.
> > CBMEM ROOT  0. f67ff000 00001000
> > CONSOLE     1. f67ef000 00010000
> > TIME STAMP  2. f67ee000 00001000
> > VBOOT       3. f67ed000 00001000
> > VPD         4. f67e4000 00009000
> > MTC         5. f67cc000 00018000
> > RAMOOPS     6. f66cc000 00100000
> > COREBOOT    7. f66ca000 00002000
> > 
> > and
> > 
> > MTC: Copied 0x17d40 bytes from 0000000081008b70 to 00000000f67cc000
> 
> Okay, so this sounds good. My only worry is what could happen if
> somebody were to run a slightly different version of coreboot that puts
> these tables elsewhere. It's been a long time since I looked at
> coreboot, but do you think perhaps it would be possible to update
> coreboot to update the DTB at runtime to always point at the correct
> location?

As far as I know it is only possible to replace coreboot on the device 
after disconnecting a hard to access ribbon cable that sits behind the
screen, which combined with then every user having to do it makes this 
option suboptimal from my point of view.

> Alternatively, do we have an easy way of checking that the tables are
> valid? Looking at the data structure that we're mapping, there's very
> limited data there that could be used for validation, so garbage could
> easily be mistaken for an actual table and mess things up.
>
> Thierry

The kernel already does some validation on these tables by checking that
the revision field is the same across the table as well as veryfing the
voltages and rates are monotonically increasing. The revision check can
be made stronger by checking for a particular revision and not just the
same across the table. This is actually something I did as part of adding
downstream upstream since the Pixel C has revision 6 tables and the kernel
only supports revision 7 currently which in essence means that as of now
the tables in this patch will be ignored by the emc scaling driver.

Diogo


Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0DF65EF3AD
	for <lists+linux-tegra@lfdr.de>; Thu, 29 Sep 2022 12:47:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234738AbiI2Krt (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 29 Sep 2022 06:47:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234299AbiI2Krr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 29 Sep 2022 06:47:47 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2733213F296
        for <linux-tegra@vger.kernel.org>; Thu, 29 Sep 2022 03:47:46 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B81C1A9A;
        Thu, 29 Sep 2022 03:47:52 -0700 (PDT)
Received: from FVFF77S0Q05N (unknown [10.57.81.100])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 679493F73B;
        Thu, 29 Sep 2022 03:47:44 -0700 (PDT)
Date:   Thu, 29 Sep 2022 11:47:39 +0100
From:   Mark Rutland <mark.rutland@arm.com>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     linux-arm-kernel@lists.infradead.org, ardb@kernel.org,
        catalin.marinas@arm.com, james.morse@arm.com, joey.gouly@arm.com,
        maz@kernel.org, will@kernel.org,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v2 6/8] arm64: alternatives: have callbacks take a cap
Message-ID: <YzV3y361Mj9N+CcW@FVFF77S0Q05N>
References: <20220912162210.3626215-1-mark.rutland@arm.com>
 <20220912162210.3626215-7-mark.rutland@arm.com>
 <3cecc3a5-30b0-f0bd-c3de-9e09bd21909b@nvidia.com>
 <dc53c62d-58e4-ce20-edc6-969c71801c9a@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dc53c62d-58e4-ce20-edc6-969c71801c9a@nvidia.com>
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Sep 29, 2022 at 10:53:56AM +0100, Jon Hunter wrote:
> 
> On 27/09/2022 10:31, Jon Hunter wrote:
> 
> ...
> 
> > > diff --git a/arch/arm64/include/asm/alternative-macros.h
> > > b/arch/arm64/include/asm/alternative-macros.h
> > > index 7e157ab6cd505..189c31be163ce 100644
> > > --- a/arch/arm64/include/asm/alternative-macros.h
> > > +++ b/arch/arm64/include/asm/alternative-macros.h
> > > @@ -2,10 +2,16 @@
> > >   #ifndef __ASM_ALTERNATIVE_MACROS_H
> > >   #define __ASM_ALTERNATIVE_MACROS_H
> > > +#include <linux/const.h>
> > > +
> > >   #include <asm/cpucaps.h>
> > >   #include <asm/insn-def.h>
> > > -#define ARM64_CB_PATCH ARM64_NCAPS
> > > +#define ARM64_CB_BIT    (UL(1) << 15)
> > > +
> > > +#if ARM64_NCAPS >= ARM64_CB_BIT
> > > +#error "cpucaps have overflown ARM64_CB_BIT"
> > > +#endif
> > 
> > 
> > Some of our builders are failing and bisect is pointing to this commit.
> > Looks like they don't like the above and I see the following errors ...
> > 
> >    CC      arch/arm64/kvm/hyp/vhe/debug-sr.o
> > /tmp/ccY3kbki.s: Assembler messages:
> > /tmp/ccY3kbki.s:1600: Error: found 'L', expected: ')'
> > /tmp/ccY3kbki.s:1600: Error: found 'L', expected: ')'
> > /tmp/ccY3kbki.s:1600: Error: found 'L', expected: ')'
> > /tmp/ccY3kbki.s:1600: Error: found 'L', expected: ')'
> > /tmp/ccY3kbki.s:1600: Error: junk at end of line, first unrecognized
> > character is `L'
> > /tmp/ccY3kbki.s:1723: Error: found 'L', expected: ')'
> > /tmp/ccY3kbki.s:1723: Error: found 'L', expected: ')'
> > /tmp/ccY3kbki.s:1723: Error: found 'L', expected: ')'
> > /tmp/ccY3kbki.s:1723: Error: found 'L', expected: ')'
> > /tmp/ccY3kbki.s:1723: Error: junk at end of line, first unrecognized
> > character is `L'
> > scripts/Makefile.build:249: recipe for target
> > 'arch/arm64/kvm/hyp/vhe/debug-sr.o' failed
> > 
> > Seems that it does not like the 'UL' macro for some reason. Any thoughts?
> 
> 
> FYI, this issue is seen with GCC6 but GCC7 and beyond appear to work fine.

Hmm... IIRC there was an issue with some older binutils here not liking the UL
suffix, but I thought we'd moved beyond those versions now; can you tell me
exactly which binutils version you're using?

I currently can't run the kernel.org crosstool GCC 5.5.0 release on my machine
since something's going wrong looking for an older version of libisl.so than my
system provides; I'll see if I can get that going and test locally.

I suspect we can bodge around this with something like the diff below.

Thanks,
Mark.

---->8----
diff --git a/arch/arm64/include/asm/alternative-macros.h b/arch/arm64/include/asm/alternative-macros.h
index 966767debaa3..4dd23bdbfb9e 100644
--- a/arch/arm64/include/asm/alternative-macros.h
+++ b/arch/arm64/include/asm/alternative-macros.h
@@ -2,12 +2,14 @@
 #ifndef __ASM_ALTERNATIVE_MACROS_H
 #define __ASM_ALTERNATIVE_MACROS_H
 
+#include <linux/bits.h>
 #include <linux/const.h>
 
 #include <asm/cpucaps.h>
 #include <asm/insn-def.h>
 
-#define ARM64_CB_BIT	(UL(1) << 15)
+#define ARM64_CB_SHIFT	15
+#define ARM64_CB_BIT	BIT(ARM64_CB_SHIFT)
 
 #if ARM64_NCAPS >= ARM64_CB_BIT
 #error "cpucaps have overflown ARM64_CB_BIT"
@@ -80,7 +82,7 @@
 	__ALTERNATIVE_CFG(oldinstr, newinstr, feature, IS_ENABLED(cfg))
 
 #define ALTERNATIVE_CB(oldinstr, feature, cb) \
-	__ALTERNATIVE_CFG_CB(oldinstr, ARM64_CB_BIT | (feature), 1, cb)
+	__ALTERNATIVE_CFG_CB(oldinstr, (1 << ARM64_CB_SHIFT) | (feature), 1, cb)
 #else
 
 #include <asm/assembler.h>
@@ -150,7 +152,7 @@
 .macro alternative_cb cap, cb
 	.set .Lasm_alt_mode, 0
 	.pushsection .altinstructions, "a"
-	altinstruction_entry 661f, \cb, ARM64_CB_BIT | \cap, 662f-661f, 0
+	altinstruction_entry 661f, \cb, (1 << ARM64_CB_SHIFT) | \cap, 662f-661f, 0
 	.popsection
 661:
 .endm

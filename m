Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 615CF155575
	for <lists+linux-tegra@lfdr.de>; Fri,  7 Feb 2020 11:18:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726901AbgBGKSK (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 7 Feb 2020 05:18:10 -0500
Received: from merlin.infradead.org ([205.233.59.134]:42766 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726890AbgBGKSK (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 7 Feb 2020 05:18:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=ypl9z4B5D6l7aVshFyhX5ciNOsuU7Z/E9Sh5yIf10D8=; b=yzh3nf4sl/Yurdo+8PVzgD5f7v
        9mw8YCDxQuMneHR6Fp4/QqjYud59rKrxmeG3t7sKAwMrMlT3V3M0+lOACMJ6h1pZrP/IgU3BToD4P
        TTeHzOCwyJVPi4qXl8J4+kDBDdo5Kihm7CRTG9/Bj+52qlckXR61htcO3HO6dp4d7W0G7GZHvSdJ/
        oRZbdrxFYd+nqGleiYdYuZit1BuRvGRcn3FyDDWfZzkef5eYBAweYy3v+wieQ2uDmDAof3qtF9jer
        /sRaJ9M3CHMMw2pMPlTJDrUCowmMqawiFTDIpeNjtRR9H+Zo3umNS8vbc3R8Am4Ce/7LgvFYDNvUe
        cGMDkZzw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1j00hr-0004sR-5p; Fri, 07 Feb 2020 10:17:51 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 3F447304C21;
        Fri,  7 Feb 2020 11:16:00 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 10CBC2B834460; Fri,  7 Feb 2020 11:17:47 +0100 (CET)
Date:   Fri, 7 Feb 2020 11:17:47 +0100
From:   Peter Zijlstra <peterz@infradead.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     linux-kernel@vger.kernel.org,
        tip-bot2 for Peter Zijlstra <tip-bot2@linutronix.de>,
        linux-tip-commits@vger.kernel.org, Will Deacon <will@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Andy Lutomirski <luto@kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        Brian Gerst <brgerst@gmail.com>,
        Denys Vlasenko <dvlasenk@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        ard.biesheuvel@linaro.org, james.morse@arm.com, rabin@rab.in,
        Ingo Molnar <mingo@kernel.org>, x86 <x86@kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [tip: core/kprobes] arm/ftrace: Use __patch_text()
Message-ID: <20200207101747.GE14914@hirez.programming.kicks-ass.net>
References: <20191113092636.GG4131@hirez.programming.kicks-ass.net>
 <157544841563.21853.2859696202562513480.tip-bot2@tip-bot2>
 <10cbfd9e-2f1f-0a0c-0160-afe6c2ccbebd@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10cbfd9e-2f1f-0a0c-0160-afe6c2ccbebd@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Jan 23, 2020 at 12:26:46AM +0300, Dmitry Osipenko wrote:

> > @@ -97,10 +94,7 @@ static int ftrace_modify_code(unsigned long pc, unsigned long old,
> >  			return -EINVAL;
> >  	}
> >  
> > -	if (probe_kernel_write((void *)pc, &new, MCOUNT_INSN_SIZE))
> > -		return -EPERM;
> > -
> > -	flush_icache_range(pc, pc + MCOUNT_INSN_SIZE);
> > +	__patch_text((void *)pc, new);
> >  
> >  	return 0;
> >  }
> > 
> 
> Hello,
> 
> NVIDIA Tegra20/30 are not booting with CONFIG_FTRACE=y, but even with
> CONFIG_FTRACE=n things are not working well.

> [   13.363523] 8<--- cut here ---
> [   13.366887] Unable to handle kernel paging request at virtual address 3e24fca3
> [   13.370342] pgd = f9397380
> [   13.373625] [3e24fca3] *pgd=00000000
> [   13.377274] Internal error: Oops: 5 [#1] SMP THUMB2
> [   13.381086] Modules linked in:
> [   13.384372] CPU: 1 PID: 209 Comm: systemd-journal Not tainted 5.5.0-rc7-next-20200122-00177-g9b7833ca2e7a #983
> [   13.387929] Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
> [   13.391500] PC is at __seccomp_filter+0x86/0x370
> [   13.395103] LR is at __seccomp_filter+0x77/0x370
> [   13.398584] pc : [<c0194d56>]    lr : [<c0194d47>]    psr: 600e0033
> [   13.402211] sp : ee6f3ee0  ip : ee6f3f20  fp : ee6f2000
> [   13.405769] r10: ffff0000  r9 : 7fff0000  r8 : ee6f3f20
> [   13.409844] r7 : 7fff0000  r6 : ee6b7280  r5 : 00000014  r4 : 7fff0000
> [   13.413776] r3 : 3e24fc7f  r2 : 00000000  r1 : 3e24fca7  r0 : ee6f3f20
> [   13.417382] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA Thumb Segment none
> [   13.420991] Control: 50c5387d  Table: 2e76404a  DAC: 00000051
> [   13.424667] Process systemd-journal (pid: 209, stack limit = 0x90194d37)
> [   13.428331] Stack: (0xee6f3ee0 to 0xee6f4000)
> [   13.432082] 3ee0: 00000008 00000000 c0fa23a8 c0c65958 00000008 000000c5 00000006 00000000
> [   13.435959] 3f00: 00000004 00000002 00000000 00000000 00000014 b6f5d4d0 edc96ee8 ee600908
> [   13.439786] 3f20: 00000006 40000028 b6e3cd56 00000000 00000014 00000000 00000002 00000000
> [   13.444285] 3f40: 00000000 00000000 00000000 00000000 00000014 00000000 b6f5d4d0 00000000
> [   13.448432] 3f60: 00000000 9445a58a 00000000 00000014 ffffe000 00000000 00000006 c01011e4
> [   13.452202] 3f80: ee6f2000 00000080 00000000 c01080d5 00000014 b6f5d4d0 00000000 00000006
> [   13.456025] 3fa0: c01011e4 c0101195 00000014 b6f5d4d0 00000014 00000002 00000000 00000000
> [   13.459872] 3fc0: 00000014 b6f5d4d0 00000000 00000006 b6f5d4e0 befa5610 00000002 00000000
> [   13.463736] 3fe0: 00000006 befa5518 b6eb6c7d b6e3cd56 800e0030 00000014 00000000 00000000
> [   13.467570] [<c0194d56>] (__seccomp_filter) from [<c01080d5>] (syscall_trace_enter+0x45/0xac)
> [   13.471520] [<c01080d5>] (syscall_trace_enter) from [<c0101195>] (__sys_trace+0x9/0x34)
> [   13.475592] Exception stack(0xee6f3fa8 to 0xee6f3ff0)
> [   13.480012] 3fa0:                   00000014 b6f5d4d0 00000014 00000002 00000000 00000000
> [   13.484127] 3fc0: 00000014 b6f5d4d0 00000000 00000006 b6f5d4e0 befa5610 00000002 00000000
> [   13.488248] 3fe0: 00000006 befa5518 b6eb6c7d b6e3cd56
> [   13.492318] Code: 68f3 4640 f103 0128 (6a5b) 4798
> [   13.496597] ---[ end trace 2190b04c04a417a2 ]---

Is that crash with FTRACE=y or =n ?

This really isn't making much sense to me, Will, Mark, any clues?

Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06D7A51579A
	for <lists+linux-tegra@lfdr.de>; Sat, 30 Apr 2022 00:01:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378010AbiD2WEL (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 29 Apr 2022 18:04:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379096AbiD2WDu (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 29 Apr 2022 18:03:50 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B74B013FBA;
        Fri, 29 Apr 2022 15:00:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AED0962275;
        Fri, 29 Apr 2022 22:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDC10C385A7;
        Fri, 29 Apr 2022 22:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651269624;
        bh=yNgvZ1w6j0wn0gJjn3Jaaz8UA8LJOCaxNlCblYsp6Fs=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Ey/m78Y6tu0GBqTH6NyWHzaC7vgRNJhEY6Vw+hMPcj4Fiq4wF8lLbYXSJID6UbS61
         3qfdckpr3iC4r/Day5Vxaq6phJAcWANrxyoTmiYG1UpeUOvuCECA8JWjDSUmjQNVeX
         //qNOhJwNmYbbQLZRcm0DHusz0JaLv/dWrmLzW2Wgv1yO4UhSlC4XbHTgdaXFO+dOB
         K8/k23uG5cTkWPZKYDhSGFzjNLXWZHlHJLxc5WmfxL+dYPfyClhuAsqZafdYrm47Su
         hkvrUQWMqSJRPNSqY6gnHqelGJDkuHvsu0DZZC5HFsjW59Ot7eIOwvaowmb9LaKSuE
         kes/J6RG3f/Hw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=why.misterjones.org)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <maz@kernel.org>)
        id 1nkYez-0082vp-Lb; Fri, 29 Apr 2022 23:00:21 +0100
Date:   Fri, 29 Apr 2022 23:00:21 +0100
Message-ID: <87ilqr8s96.wl-maz@kernel.org>
From:   Marc Zyngier <maz@kernel.org>
To:     "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc:     "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        "Michael Kelley (LINUX)" <mikelley@microsoft.com>,
        akpm@linux-foundation.org, bhe@redhat.com, pmladek@suse.com,
        kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com,
        linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
        linux-hyperv@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-s390@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org,
        netdev@vger.kernel.org, openipmi-developer@lists.sourceforge.net,
        rcu@vger.kernel.org, sparclinux@vger.kernel.org,
        xen-devel@lists.xenproject.org, x86@kernel.org,
        kernel-dev@igalia.com, kernel@gpiccoli.net, halves@canonical.com,
        fabiomirmar@gmail.com, alejandro.j.jimenez@oracle.com,
        andriy.shevchenko@linux.intel.com, arnd@arndb.de, bp@alien8.de,
        corbet@lwn.net, d.hatayama@jp.fujitsu.com,
        dave.hansen@linux.intel.com, dyoung@redhat.com,
        feng.tang@intel.com, gregkh@linuxfoundation.org,
        hidehiro.kawai.ez@hitachi.com, jgross@suse.com,
        john.ogness@linutronix.de, keescook@chromium.org, luto@kernel.org,
        mhiramat@kernel.org, mingo@redhat.com, paulmck@kernel.org,
        peterz@infradead.org, rostedt@goodmis.org,
        senozhatsky@chromium.org, stern@rowland.harvard.edu,
        tglx@linutronix.de, vgoyal@redhat.com, vkuznets@redhat.com,
        will@kernel.org
Subject: Re: [PATCH 02/30] ARM: kexec: Disable IRQs/FIQs also on crash CPUs shutdown path
In-Reply-To: <Ymxcaqy6DwhoQrZT@shell.armlinux.org.uk>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
        <20220427224924.592546-3-gpiccoli@igalia.com>
        <87mtg392fm.wl-maz@kernel.org>
        <71d829c4-b280-7d6e-647d-79a1baf9408b@igalia.com>
        <Ymxcaqy6DwhoQrZT@shell.armlinux.org.uk>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/27.1
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux@armlinux.org.uk, gpiccoli@igalia.com, mikelley@microsoft.com, akpm@linux-foundation.org, bhe@redhat.com, pmladek@suse.com, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-leds@vger.kernel.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, linux-tegra@vger.kernel.org, linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org, netdev@vger.kernel.org, openipmi-developer@lists.sourceforge.net, rcu@vger.kernel.org, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org, kernel-dev@igalia.com, kernel@gpiccoli.net, halves@canonical.com, fabiomirmar@gmail.com, alejandro.j.jimenez@oracle.com, andriy.shevchenko@linux.intel.com, arnd@arndb.de, 
 bp@alien8.de, corbet@lwn.net, d.hatayama@jp.fujitsu.com, dave.hansen@linux.intel.com, dyoung@redhat.com, feng.tang@intel.com, gregkh@linuxfoundation.org, hidehiro.kawai.ez@hitachi.com, jgross@suse.com, john.ogness@linutronix.de, keescook@chromium.org, luto@kernel.org, mhiramat@kernel.org, mingo@redhat.com, paulmck@kernel.org, peterz@infradead.org, rostedt@goodmis.org, senozhatsky@chromium.org, stern@rowland.harvard.edu, tglx@linutronix.de, vgoyal@redhat.com, vkuznets@redhat.com, will@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, 29 Apr 2022 22:45:14 +0100,
"Russell King (Oracle)" <linux@armlinux.org.uk> wrote:
> 
> On Fri, Apr 29, 2022 at 06:38:19PM -0300, Guilherme G. Piccoli wrote:
> > Thanks Marc and Michael for the review/discussion.
> > 
> > On 29/04/2022 15:20, Marc Zyngier wrote:
> > > [...]
> > 
> > > My expectations would be that, since we're getting here using an IPI,
> > > interrupts are already masked. So what reenabled them the first place?
> > > 
> > > Thanks,
> > > 
> > > 	M.
> > > 
> > 
> > Marc, I did some investigation in the code (and tried/failed in the ARM
> > documentation as well heh), but this is still not 100% clear for me.
> > 
> > You're saying IPI calls disable IRQs/FIQs by default in the the target
> > CPUs? Where does it happen? I'm a bit confused if this a processor
> > mechanism, or it's in code.
> 
> When we taken an IRQ, IRQs will be masked, FIQs will not. IPIs are
> themselves interrupts, so IRQs will be masked while the IPI is being
> processed. Therefore, there should be no need to re-disable the
> already disabled interrupts.
> 
> > But crash_smp_send_stop() is different, it seems to IPI the other CPUs
> > with the flag IPI_CALL_FUNC, which leads to calling
> > generic_smp_call_function_interrupt() - does it disable interrupts/FIQs
> > as well? I couldn't find it.
> 
> It's buried in the architecture behaviour. When the CPU takes an
> interrupt and jumps to the interrupt vector in the vectors page, it is
> architecturally defined that interrupts will be disabled. If they
> weren't architecturally disabled at this point, then as soon as the
> first instruction is processed (at the interrupt vector, likely a
> branch) the CPU would immediately take another jump to the interrupt
> vector, and this process would continue indefinitely, making interrupt
> handling utterly useless.
> 
> So, you won't find an explicit instruction in the code path from the
> vectors to the IPI handler that disables interrupts - because it's
> written into the architecture that this is what must happen.
> 
> IRQs are a lower priority than FIQs, so FIQs remain unmasked.

Ah, you're of course right. That's one of the huge differences between
AArch32 and AArch64, where the former has per target mode masking
rules, and the later masks everything on entry...

	M.

-- 
Without deviation from the norm, progress is not possible.

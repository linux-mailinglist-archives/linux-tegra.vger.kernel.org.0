Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7ED9533AFD
	for <lists+linux-tegra@lfdr.de>; Wed, 25 May 2022 12:53:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230326AbiEYKxK (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 25 May 2022 06:53:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231492AbiEYKxH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 25 May 2022 06:53:07 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 646CAB1EC
        for <linux-tegra@vger.kernel.org>; Wed, 25 May 2022 03:53:06 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 19CFBB81BF6
        for <linux-tegra@vger.kernel.org>; Wed, 25 May 2022 10:53:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEAA3C34118
        for <linux-tegra@vger.kernel.org>; Wed, 25 May 2022 10:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653475983;
        bh=MCDgV0cNVEWWgFh5t+LxBCVXE06Nyg1weF2nZ+Ssebg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=eL1cxN6v+nO1bRZ97CJbAaW4txDpinMEBXfGiu1B8aBbJCxprxszP1w0BWOtS2GXW
         CBOhfCeMrZyBv461wous0FYvvwVt3p1/wmDa2Q8hr79mOzyXSj/sm0tDXFBeu+meec
         1aQXow6wMLAd8C2pDNNIRCOz/pNWjAamoqWcfqo/d/gIzyK7BXa0101dJNav5YiHXA
         YTi3qpkbJd/W6sSKh4/rHtr2VjUQl5ixmRtdcf4kD3jFKvxOnN7L3Jn92MU1KxT+By
         25HiPiaWUd1zUAbcP/RWZOZtxpSADLcRQDHTpQU5BrB3plWisvzM9FEr5iE+IUjdTk
         WvpfYXn4nUwuQ==
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-e5e433d66dso25560349fac.5
        for <linux-tegra@vger.kernel.org>; Wed, 25 May 2022 03:53:03 -0700 (PDT)
X-Gm-Message-State: AOAM533kxpRQCoMOEHwiMhaL2jr1Pl0ajD60UNF8nu8MfMoEjDGC/wlL
        Go36JmqSQ+7sN1vfVoVzGlNElIAnQom9d/hgBD8=
X-Google-Smtp-Source: ABdhPJylHKe+yTJXVWe4gzYwcRX64rt86BxalLl0Kg3OYr523unsELdpoK+v6uD6885mQAC9AiV7gV9XNYwB0vFvCqk=
X-Received: by 2002:a05:6870:218c:b0:f2:b910:f6a5 with SMTP id
 l12-20020a056870218c00b000f2b910f6a5mr2301643oae.126.1653475982860; Wed, 25
 May 2022 03:53:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220328134714.205342-1-ardb@kernel.org> <20220328134714.205342-2-ardb@kernel.org>
 <a589f56d-a0e1-328d-e4be-9427342d46b8@nvidia.com> <Yo0PzCkBLK5U1nB2@shell.armlinux.org.uk>
 <b7f9d04b-db90-4dc2-4a52-7e637dc7a2ad@nvidia.com> <CAMj1kXFPwRkMu9Lc=vSyPwYMnMXNmv3LdHsSMfZk56m8cAJzMQ@mail.gmail.com>
 <d35a3d03-8ee9-7242-9b92-bad3a44d2c4c@nvidia.com>
In-Reply-To: <d35a3d03-8ee9-7242-9b92-bad3a44d2c4c@nvidia.com>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Wed, 25 May 2022 12:52:51 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHb2u43Ls+4TdyvkWfWCw3wUdPPqnHci-+EEmDHg4krhQ@mail.gmail.com>
Message-ID: <CAMj1kXHb2u43Ls+4TdyvkWfWCw3wUdPPqnHci-+EEmDHg4krhQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] ARM: spectre-bhb: enable for Cortex-A15
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     "Russell King (Oracle)" <linux@armlinux.org.uk>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, 25 May 2022 at 12:48, Jon Hunter <jonathanh@nvidia.com> wrote:
>
>
> On 25/05/2022 08:09, Ard Biesheuvel wrote:
> > On Tue, 24 May 2022 at 19:49, Jon Hunter <jonathanh@nvidia.com> wrote:
> >>
> >>
> >> On 24/05/2022 18:03, Russell King (Oracle) wrote:
> >>> On Tue, May 24, 2022 at 03:50:17PM +0100, Jon Hunter wrote:
> >>>> Hi Ard,
> >>>>
> >>>> On 28/03/2022 14:47, Ard Biesheuvel wrote:
> >>>>> The Spectre-BHB mitigations were inadvertently left disabled for
> >>>>> Cortex-A15, due to the fact that cpu_v7_bugs_init() is not called in
> >>>>> that case. So fix that.
> >>>>>
> >>>>> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> >>>>> ---
> >>>>>     arch/arm/mm/proc-v7-bugs.c | 1 +
> >>>>>     1 file changed, 1 insertion(+)
> >>>>>
> >>>>> diff --git a/arch/arm/mm/proc-v7-bugs.c b/arch/arm/mm/proc-v7-bugs.c
> >>>>> index 06dbfb968182..fb9f3eb6bf48 100644
> >>>>> --- a/arch/arm/mm/proc-v7-bugs.c
> >>>>> +++ b/arch/arm/mm/proc-v7-bugs.c
> >>>>> @@ -288,6 +288,7 @@ void cpu_v7_ca15_ibe(void)
> >>>>>     {
> >>>>>      if (check_spectre_auxcr(this_cpu_ptr(&spectre_warned), BIT(0)))
> >>>>>              cpu_v7_spectre_v2_init();
> >>>>> +   cpu_v7_spectre_bhb_init();
> >>>>>     }
> >>>>>     void cpu_v7_bugs_init(void)
> >>>>
> >>>>
> >>>> Since this patch has been merged, I am seeing a ton of messages when booting
> >>>> Linux on tegra124-jetson-tk1 ...
> >>>>
> >>>> [ 1233.327547] CPU0: Spectre BHB: using loop workaround
> >>>> [ 1233.327795] CPU1: Spectre BHB: using loop workaround
> >>>> [ 1233.328270] CPU1: Spectre BHB: using loop workaround
> >>>
> >>> Now that you mention this, I vaguely remember some email on the list a
> >>> while ago about this being caused by something like cpuidle - but I'm
> >>> unable to find it now.
> >>>
> >>>> [0] https://lore.kernel.org/linux-arm-kernel/20220519161310.1489625-1-dmitry.osipenko@collabora.com/T/
> >>>
> >>> That was probably it.
> >>
> >>
> >> I am seeing ...
> >>
> >> [    4.415167] CPU0: Spectre BHB: using loop workaround
> >> [    4.417621] [<c01109a0>] (unwind_backtrace) from [<c010b7ac>] (show_stack+0x10/0x14)
> >> [    4.430291] [<c010b7ac>] (show_stack) from [<c09c2b38>] (dump_stack+0xc0/0xd4)
> >> [    4.437512] [<c09c2b38>] (dump_stack) from [<c011a6c8>] (cpu_v7_spectre_bhb_init+0xd8/0x190)
> >> [    4.445943] [<c011a6c8>] (cpu_v7_spectre_bhb_init) from [<c010dee8>] (cpu_suspend+0xac/0xc8)
> >> [    4.454377] [<c010dee8>] (cpu_suspend) from [<c011e7e4>] (tegra114_idle_power_down+0x74/0x78)
> >> [    4.462898] [<c011e7e4>] (tegra114_idle_power_down) from [<c06d3b44>] (cpuidle_enter_state+0x130/0x524)
> >> [    4.472286] [<c06d3b44>] (cpuidle_enter_state) from [<c0164a30>] (do_idle+0x1b0/0x200)
> >> [    4.480199] [<c0164a30>] (do_idle) from [<c0164d28>] (cpu_startup_entry+0x18/0x1c)
> >> [    4.487762] [<c0164d28>] (cpu_startup_entry) from [<801018cc>] (0x801018cc)
> >>
> >>
> >> So definitely CPU idle.
> >>
> >>> We can't really do this for the other print, because the system status
> >>> can change as a result of CPUs being brought online. :(
> >>
> >>
> >> How about making this a pr_debug as opposed to pr_info?
> >>
> >
> > We should pull the pr_info() into the conditional so that it only
> > executes the first time around:
> >
> > --- a/arch/arm/mm/proc-v7-bugs.c
> > +++ b/arch/arm/mm/proc-v7-bugs.c
> > @@ -209,10 +209,10 @@ static int spectre_bhb_install_workaround(int method)
> >                          return SPECTRE_VULNERABLE;
> >
> >                  spectre_bhb_method = method;
> > -       }
> >
> > -       pr_info("CPU%u: Spectre BHB: using %s workaround\n",
> > -               smp_processor_id(), spectre_bhb_method_name(method));
> > +               pr_info("CPU%u: Spectre BHB: using %s workaround\n",
> > +                       smp_processor_id(), spectre_bhb_method_name(method));
> > +       }
> >
> >          return SPECTRE_MITIGATED;
> >   }
> >
> > If you can confirm that this fixes the issue, I can send it out as a
> > proper patch.
>
> That works for me.
>
> Tested-by: Jon Hunter <jonathanh@nvidia.com>
>

Thanks Jon.

The only downside here is that the message is only printed once for
all CPUs, unless we are enabling two different methods on ab
big.little system, in which case we print an error.

Personally, I think that is fine, but I'll need to tweak the message
to clarify this.

Russell, any thoughts?

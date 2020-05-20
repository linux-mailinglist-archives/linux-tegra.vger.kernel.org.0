Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F1511DB934
	for <lists+linux-tegra@lfdr.de>; Wed, 20 May 2020 18:21:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726812AbgETQVj (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 20 May 2020 12:21:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:57014 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726439AbgETQVj (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 20 May 2020 12:21:39 -0400
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 71D5A20759;
        Wed, 20 May 2020 16:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589991698;
        bh=cf7SnoUKILsXfk6nREe49uTGqNz+I83kLsELCZ8YnpE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=LZZTAr53m//LKawBCmnf0HO0GxEnlOU3TFFQMIZFrguGjqevjEhgTSk++89t0RcYe
         G04rBH8Zsg0OISut2kAs1tn4qewUkwkF9E5W20czBHlFFv8xsZfqEptT7BkzRkgG54
         G9aLso6sJsL8CzRD6ihCbooDGdAbhJkXu69fNS6U=
Received: by mail-oi1-f178.google.com with SMTP id w4so3483620oia.1;
        Wed, 20 May 2020 09:21:38 -0700 (PDT)
X-Gm-Message-State: AOAM533nwLjVaUmhIEXERBUGXkEoPqVO+seVEIZli4bow3MxmKmyPf9M
        vbAIf9K9cNEdvtomMST/SIo6Zxqyc8qrgu7p1A==
X-Google-Smtp-Source: ABdhPJyHaWOJ7qDGphT10pEe3j+PbsubndR2qktwtkhzM2CkrB1ImoFPzV72dJWpXtFyHEyBcJYaQPw91qc8h1Wk0yY=
X-Received: by 2002:a05:6808:24f:: with SMTP id m15mr3860137oie.152.1589991697632;
 Wed, 20 May 2020 09:21:37 -0700 (PDT)
MIME-Version: 1.0
References: <1575394348-17649-1-git-send-email-sumitg@nvidia.com>
 <20191203174229.GA1721849@ulmo> <9404232d-84ce-a117-89dd-f2d8de80993e@kapsi.fi>
 <20191204091703.d32to5omdm3eynon@vireshk-i7> <20191204093339.GA2784830@ulmo>
 <20191204095138.rrul5vxnkprfwmku@vireshk-i7> <20200407100520.GA1720957@ulmo>
 <CAL_Jsq+rMYAZ=ub0U7qdHSsWgbQugodhvigFCxrFm49HwrCmAQ@mail.gmail.com> <20200520153854.GA2154237@ulmo>
In-Reply-To: <20200520153854.GA2154237@ulmo>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 20 May 2020 10:21:25 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJOPzD_3+bygrMB+JSkDOZo=m0R28LDXSOU_Z=quTNeRw@mail.gmail.com>
Message-ID: <CAL_JsqJOPzD_3+bygrMB+JSkDOZo=m0R28LDXSOU_Z=quTNeRw@mail.gmail.com>
Subject: Re: [TEGRA194_CPUFREQ Patch 1/3] firmware: tegra: adding function to
 get BPMP data
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Mikko Perttunen <cyndis@kapsi.fi>,
        Sumit Gupta <sumitg@nvidia.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Timo Alho <talho@nvidia.com>,
        "open list:THERMAL" <linux-pm@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        bbasu@nvidia.com, Mikko Perttunen <mperttunen@nvidia.com>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, May 20, 2020 at 9:39 AM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> On Wed, May 20, 2020 at 08:43:03AM -0600, Rob Herring wrote:
> > On Tue, Apr 7, 2020 at 4:05 AM Thierry Reding <thierry.reding@gmail.com> wrote:
> > >
> > > On Wed, Dec 04, 2019 at 03:21:38PM +0530, Viresh Kumar wrote:
> > > > On 04-12-19, 10:33, Thierry Reding wrote:
> > > > > Yeah, the code that registers this device is in drivers/base/cpu.c in
> > > > > register_cpu(). It even retrieves the device tree node for the CPU from
> > > > > device tree and stores it in cpu->dev.of_node, so we should be able to
> > > > > just pass &cpu->dev to tegra_bpmp_get() in order to retrieve a reference
> > > > > to the BPMP.
> > > > >
> > > > > That said, I'm wondering if perhaps we could just add a compatible
> > > > > string to the /cpus node for cases like this where we don't have an
> > > > > actual device representing the CPU complex. There are a number of CPU
> > > > > frequency drivers that register dummy devices just so that they have
> > > > > something to bind a driver to.
> > > > >
> > > > > If we allow the /cpus node to represent the CPU complex (if no other
> > > > > "device" does that yet), we can add a compatible string and have the
> > > > > cpufreq driver match on that.
> > > > >
> > > > > Of course this would be slightly difficult to retrofit into existing
> > > > > drivers because they'd need to remain backwards compatible with existing
> > > > > device trees. But it would allow future drivers to do this a little more
> > > > > elegantly. For some SoCs this may not matter, but especially once you
> > > > > start depending on additional resources this would come in handy.
> > > > >
> > > > > Adding Rob and the device tree mailing list for feedback on this idea.
> > > >
> > > > Took some time to find this thread, but something around this was
> > > > suggested by Rafael earlier.
> > > >
> > > > https://lore.kernel.org/lkml/8139001.Q4eV8YG1Il@vostro.rjw.lan/
> > >
> > > I gave this a try and came up with the following:
> > >
> > > --- >8 ---
> > > diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> > > index f4ede86e32b4..e4462f95f0b3 100644
> > > --- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> > > +++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> > > @@ -1764,6 +1764,9 @@ bpmp_thermal: thermal {
> > >         };
> > >
> > >         cpus {
> > > +               compatible = "nvidia,tegra194-ccplex";
> > > +               nvidia,bpmp = <&bpmp>;
> >
> > Is there more than 1 bpmp? If not you don't need this. Just lookup the
> > node by compatible.
>
> There no SoCs currently than need to differentiate between multiple
> BPMPs, so yes, it would be possible to look up the node by compatible.
> But we also used to assume that PCs would only ever come with a single
> GPU or audio card and that's always caused a lot of work to clean up
> when it turned out to no longer be true.

Job security. ;)

> Also, we already have a couple of devices referencing the BPMP by
> phandle like this, so having this in a CCPLEX node would keep things
> consistent.
>
> One of the reasons why we initially did it this way was also so that we
> could make the dependencies explicit within device tree. If we look up
> by compatible string, then the driver is the only one with the knowledge
> about where to get at it. If we have the explicit reference we at least
> have a chance of determining the dependency by just looking at the
> device tree.

This case probably makes sense, but then driver dependencies can
evolve and you'd be updating the DT for every dependency. There's just
this general mindset that a driver can't look at the DT outside of its
own node.

> > >                 #address-cells = <1>;
> > >                 #size-cells = <0>;
> > >
> > > --- >8 ---
> > >
> > > Now I can do something rougly like this, although I have a more complete
> > > patch locally that also gets rid of all the global variables because we
> > > now actually have a struct platform_device that we can anchor everything
> > > at:
> > >
> > > --- >8 ---
> > > static const struct of_device_id tegra194_cpufreq_of_match[] = {
> > >         { .compatible = "nvidia,tegra194-ccplex", },
> > >         { /* sentinel */ }
> > > };
> > > MODULE_DEVICE_TABLE(of, tegra194_cpufreq_of_match);
> > >
> > > static struct platform_driver tegra194_ccplex_driver = {
> > >         .driver = {
> > >                 .name = "tegra194-cpufreq",
> > >                 .of_match_table = tegra194_cpufreq_of_match,
> > >         },
> > >         .probe = tegra194_cpufreq_probe,
> > >         .remove = tegra194_cpufreq_remove,
> > > };
> > > module_platform_driver(tegra194_ccplex_driver);
> > > --- >8 ---
> > >
> > > I don't think that's exactly what Rafael (Cc'ed) had in mind, since the
> > > above thread seems to have mostly talked about binding a driver to each
> > > individual CPU.
> > >
> > > But this seems a lot better than having to instantiate a device from
> > > scratch just so that a driver can bind to it and it allows additional
> > > properties to be associated with the CCPLEX device.
> >
> > What additional properties? A continual stream of properties added 1
> > by 1 would negatively affect my opinion of this.
>
> I don't expect there would be many. I think there's an earlier
> generation of Tegra that requires a regulator and I can imagine that's
> pretty common. But other than that I would expect this to be a fairly
> narrow set of properties.
>
> > > Rob, any thoughts on this from a device tree point of view? The /cpus
> > > bindings don't mention the compatible property, but there doesn't seem
> > > to be anything in the bindings that would prohibit its use.
> >
> > What happens when you have more than one cpu related driver in
> > addition to cpufreq? You may still have to end up creating child
> > platform devices and then gained very little.
>
> That's only if you absolutely want to stick with the "one driver per
> subsystem" model. I personally think that's completely obsolete these
> days. If you have a CPU complex device that can do both CPU frequency
> scaling and put the CPU into idle states, for example, then there is
> really no reason to artificially split that into two separate drivers
> just to match the subsystems that we have.
>
> Most subsystems that I've come across work just fine if a single driver
> registers with multiple subsystems.

Yes exactly. If only everyone thought this way...

> I also know that some people like it better when things are nicely split
> up into multiple drivers. But I really don't see how that simplifies
> things. In fact in my opinion that makes things only more complicated
> because you have additional boilerplate and then you need to be extra
> careful about how these different drivers are ordered, and you need to
> take extra precautions when sharing things like clocks and register
> regions.

I just cleaned up this exact mess with VExpress drivers...

It's just a constant issue to deal with.

> > You could solve this without DT changes. You can bind on node names.
> > The driver probe can then check the parent compatible and return if
> > not matching. I'm not sure if you could get module auto loading to
> > work in that case. It would have to be based on the root compatible
> > (rather than the driver match table) and be able to load multiple
> > matching modules.
>
> That sounds like it would get very complicated for something this
> simple. Having a compatible string in /cpus seemed like the most logical
> option because it would basically just work out of the box and the same
> way we're used to from other devices.

That's also why I get the node per driver...


That said, I'm fine with adding the compatible. I hope I don't regret it.

Rob

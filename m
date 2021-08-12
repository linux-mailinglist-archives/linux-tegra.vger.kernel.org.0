Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E854B3EA360
	for <lists+linux-tegra@lfdr.de>; Thu, 12 Aug 2021 13:17:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236770AbhHLLSG (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 12 Aug 2021 07:18:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236700AbhHLLSE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 12 Aug 2021 07:18:04 -0400
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com [IPv6:2607:f8b0:4864:20::933])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 172D5C0613D5
        for <linux-tegra@vger.kernel.org>; Thu, 12 Aug 2021 04:17:38 -0700 (PDT)
Received: by mail-ua1-x933.google.com with SMTP id b7so2638417uav.11
        for <linux-tegra@vger.kernel.org>; Thu, 12 Aug 2021 04:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=L0gyU3vJVuWPU21UXGdxDw4I761rPxaanXf3QMxUC1A=;
        b=GR9CTz3qnI0sEDXS4Vz2dqqHPs12gPFKs+J+rdjPq/NqF1uywGom54qf5zP5DspdeQ
         g7ZkfP/SFrc/cxUPSKthVQsTmV0dFWi2OxuJ+7QlubIPUOEkSyMLF/GBvZ5S1vDWtTGh
         sa+m5oIMYu+5e9fGhuvZIedBm3enJquHi0Anmq6zHo1T/ms2N2i7FQ/1edif0N8YYffS
         ue56lhAwZ5qvG46WVvcf4bdbanAVY27pKUsweEg9jnSO07vRfyVLi4xAFIY11bFyeauC
         BU2lBXgG5d7/ddoZSgzVZEkqrroVUBYlqGeLhAL1cnwf4VXqnRsqK4WqPfko9em7W+mZ
         dMPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=L0gyU3vJVuWPU21UXGdxDw4I761rPxaanXf3QMxUC1A=;
        b=iHVHXwGRNL6oBTL7iLj7yVlup2yQSUASKRgS3ZD73SbP5tY/CYMK2nWOj/kVec9qtR
         OFdfOe7eALkOYgPRuXnQqPyZPGRLh7vXu2iFidGsgBO8ThVyZKDOgJANycQ3ABjSC1Zo
         VXjYI+P7JeA4HIZec9IbMmxtB51jMjH8h98D5VrSgkyrc95wFN0f/8RKl+1ItPm/P+1u
         u7V8AaFPE8BP5FzpS2KOvLfuIY7djf4wjx1PEXpcvORw40VXHkMpQmymEfITs4RPK+A/
         wweP9392nIXcUQy/A9GhOU1ce1CiKUZf9rZ1MF0Uto7Dq6vsu/ju5ZogFLo36Y3qKK7n
         sr+Q==
X-Gm-Message-State: AOAM532VuaLQT3UyNtGXUKigFWPaMpEMxqzs7MCiPFE5ALpP8/NWVrnZ
        +WRTWFe8fmnXVPEb85o2oxThAkKcTxSjl1SUF9tjVw==
X-Google-Smtp-Source: ABdhPJyv6jhv7hsGxlvOXJ+PV6QFW4oGZxDyU7JGoVmm+PciCTwcwMITfVEp6nsx1+OUCwZN0NL2GzejpGySs3XeGIY=
X-Received: by 2002:ab0:6695:: with SMTP id a21mr1572928uan.19.1628767057184;
 Thu, 12 Aug 2021 04:17:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210701232728.23591-1-digetx@gmail.com> <20210701232728.23591-3-digetx@gmail.com>
 <CAPDyKFrtWDYJo_NjS8306Z9ykbg7XZ55jC9hKEBMGkcrx1=4kQ@mail.gmail.com>
 <1034458d-78e0-5036-e278-6fee5d0d75ac@gmail.com> <CAPDyKFoafAk72Kw6X7626Niduaii0V5VM4dGSWmq+e3JTh7VRg@mail.gmail.com>
 <a5dfdf59-f5b5-d28e-6b02-b0c860ba8d80@gmail.com> <CAPDyKFq+ExjbGrN=yUUXPKfN_fGrwY6EAYn9a6VUFFU_VjhC=g@mail.gmail.com>
 <6741262b-386b-7635-fd42-ebd4f877fddd@gmail.com> <CAPDyKFpJhX51rOnvbYTmj9Akd+xX+b7xcSWt87UDrvMEfYOZ7Q@mail.gmail.com>
 <aab38f90-f7b2-900f-897b-470b81d473f2@gmail.com> <8e110e08-1268-464c-6edb-0a3f640d43d6@gmail.com>
 <e21106ab-95ef-fc97-1744-dc58180e321a@gmail.com>
In-Reply-To: <e21106ab-95ef-fc97-1744-dc58180e321a@gmail.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 12 Aug 2021 13:17:00 +0200
Message-ID: <CAPDyKFpgoBsFOiCGEpgAyeYJyEZQAXSN_2iEJcVJbfV+7rvdMw@mail.gmail.com>
Subject: Re: [PATCH v7 02/37] soc/tegra: pmc: Implement attach_dev() of power
 domain drivers
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, 12 Aug 2021 at 03:40, Dmitry Osipenko <digetx@gmail.com> wrote:
>
> 12.08.2021 01:41, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>> I am not saying you should change the clock rate. The current code
> >>> path that runs via devm_tegra_core_dev_init_opp_table() just calls
> >>> clk_get_rate and then dev_pm_opp_set_rate() with the current rate to
> >>> vote for the corresponding OPP level. Right?
> >>>
> >>> Isn't this exactly what you want? No?
> >> I see now what you meant, it's actually a simpler variant and it works
> >> too. Thank you for the suggestion, I'll prepare v8.
> >>
> > My bad, it doesn't work at all. I actually need to use the rpm_pstate o=
r
> > something else because performance state is coupled with the enable
> > state of the device. If device is never rpm-suspended by consumer
> > driver, then the initialized performance state is never dropped. Hence =
I
> > want to initialize the state which is set only when device is resumed.
> >
> > I'll need to think more about it.
>
> GENPD core has these false assumptions:
>
> 1. It assumes that by default all devices are at zero performance level
> at a boot time. This is not true for Tegra because hardware is
> pre-initialized independently from GENPD.

Right, which is similar to other SoCs.

>
> 2. It assumes that nothing depends on performance level and devices can
> operate at any level at any time. Not true for Tegra and other platforms
> where performance level is coupled with clocks state of attached
> devices. OPP framework glues clock and performance level together for
> us, which works good so far.

Right, OPPs need to be managed differently depending on the SoC.
That's why genpd is there to help and to model this as "performance
states" and to allow operations to be set through SoC specific
callabacks, for example.

More importantly, the assumption is that in general, consumer drivers
should use the OPP library to vote/set OPP levels, they shouldn't call
dev_pm_genpd_set_performance_state() - unless they know exactly what
they are doing.

>
> Hence I either need to patch every driver to use dev_pm_opp_set_rate in
> order to sync clk rate with the perf level at device runtime, or I need
> to preset the rpm perf level to allow GENPD core to set the level before
> device is resumed.

When the device is getting attached to its genpd (during the probe
sequence and for a single PM domain case), runtime PM is disabled for
the device. If you would call dev_pm_opp_set_rate() from a genpd
callback during attach (without changing the rate), this means you
would update/synchronize the vote. In this way, the vote is set before
the device is runtime resumed by the driver, right?

On the other hand, patching the driver should also be quite simple and
you need to do that anyways, don't you?

Kind regards
Uffe

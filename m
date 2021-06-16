Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8594F3A950D
	for <lists+linux-tegra@lfdr.de>; Wed, 16 Jun 2021 10:30:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232195AbhFPIdB (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 16 Jun 2021 04:33:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231358AbhFPIdB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 16 Jun 2021 04:33:01 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F141C061767
        for <linux-tegra@vger.kernel.org>; Wed, 16 Jun 2021 01:30:55 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id c11so2652952ljd.6
        for <linux-tegra@vger.kernel.org>; Wed, 16 Jun 2021 01:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Xtx0D/JQrf9peJgocm4/e4qMNluWA8H4pEhH1El3BzQ=;
        b=Qvm89n4LVQwKeGewmMIEPJ1PlvtmWGAwftSotHUv7x7O9RfZMXC9T29Rlla2HxSb55
         egZqJNE0Jhw0VcP/XKW/0E7Iu/hAoSqyMEoc7IcZUGOax4T6mgqVZCYKE20kUKU9jXo4
         lxQoOhXPkPRlF60OYw78Hvs94dlrN/2/LsiS8Tr5EK5ibCCfPzss7xKCcwGzypj+IWlu
         tXc+Sxfsm+Hweg0l8ASZ2Sl6Qw/2ibBD+XRH7dHwnT8qZFxCu3UlPQ+IhzlvlYztHCAg
         G5khlJQoN2QiSm5MP3nethiPx1BV9+CIcRAVb5OmIax7UcI7opkTU8ebeUKI+lt2TMw3
         O0vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Xtx0D/JQrf9peJgocm4/e4qMNluWA8H4pEhH1El3BzQ=;
        b=CIDw1NJYIINW+yHrbqte5ILSWPH1VTz01KqX53y1k2eRcK+qUWgHGS2KS4BOnAO4M1
         yyeTL+1bUBaBdWhUsMYhw8LHgVdQC9d1P0EO5DwxPrM8PAWyoQC563BrKX1MPqPV0F4Y
         y0Tq9IYhTr7F8BeF8/dSBM0cwg2PU+RsHMmJw5PRyli+n40X0gwg2W/YDVwhGbP8n4rd
         MX829Z1x4u1WHrpwqlVcn4BvlFrvqOuEfh75n8uzHBmxtt8pO4CLR0ELjS5eybHjIN4M
         RBDfu5GbCP3oXIlZRGL8yoWDkKfn4i1vdo29wgFQfC5qC03p5d2+XGsVOVy5Mzt1dMKk
         qvxw==
X-Gm-Message-State: AOAM532ilXdcNcX5puDKWJhhylNILf59HwHRln0MkbwK1h8g8A4J5024
        3WHiTzSWOM8zReZYHH+0ZrJHJs+QHkRV4RQpwXRYcA==
X-Google-Smtp-Source: ABdhPJyvTNRjOx83HPsiqhcRq2/Bk3bODAfL45ZU+TbpCvmtO9pDNtfz8UpZbD5cL08fxjHc/6TUVqte0AC1nPwPO1k=
X-Received: by 2002:a2e:8046:: with SMTP id p6mr3393629ljg.401.1623832253740;
 Wed, 16 Jun 2021 01:30:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210529170955.32574-1-digetx@gmail.com> <20210529170955.32574-5-digetx@gmail.com>
 <6f2b6290-095a-bd39-c160-1616a0ff89b1@linaro.org> <20210615102626.dja3agclwzxv2sj4@vireshk-i7>
 <595f5e53-b872-bcc6-e886-ed225e26e9fe@gmail.com> <fbdc3b56-4465-6d3e-74db-1d5082813b9c@linaro.org>
 <4c7b23c4-cf6a-0942-5250-63515be4a219@gmail.com> <20210616080310.vhvauvo5y6m2sekz@vireshk-i7>
In-Reply-To: <20210616080310.vhvauvo5y6m2sekz@vireshk-i7>
From:   Vincent Guittot <vincent.guittot@linaro.org>
Date:   Wed, 16 Jun 2021 10:30:42 +0200
Message-ID: <CAKfTPtAxvj4_TBpFesjQxcVzvEi3QVUThccfSAJXwwrLtOH-xg@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] thermal/drivers/tegra: Add driver for Tegra30
 thermal sensor
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Amit Kucheria <amitk@kernel.org>,
        Andreas Westman Dorcsak <hedmoo@yahoo.com>,
        Maxim Schwalm <maxim.schwalm@gmail.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Ihor Didenko <tailormoon@rambler.ru>,
        Ion Agorria <ion@agorria.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-tegra@vger.kernel.org,
        "open list:THERMAL" <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, 16 Jun 2021 at 10:03, Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> +Vincent.
>
> On 15-06-21, 22:32, Dmitry Osipenko wrote:
> > IIUC, the cpufreq already should be prepared for the case where firmware
> > may override frequency. Viresh, could you please clarify what are the
> > possible implications of the frequency overriding?
>
> The only implication is software would think hardware is running at
> some other frequency, while it is not. Not sure if something may break
> as a result of this.
>
> The scheduler's view of CPUs will not be same though, i.e. scheduler
> will see capacity as X, while in reality it has changed to Y.

thermal_pressure is used by scheduler to balance the load between CPUs
according to the actual max frequency. If the thermal pressure doesn't
reflect reality, scheduler will end up enqueuing too many  tasks on a
throttle CPU.

>
> --
> viresh

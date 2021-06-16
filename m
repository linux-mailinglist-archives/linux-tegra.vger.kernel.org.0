Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BF343A955D
	for <lists+linux-tegra@lfdr.de>; Wed, 16 Jun 2021 10:52:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231336AbhFPIyE (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 16 Jun 2021 04:54:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231335AbhFPIyE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 16 Jun 2021 04:54:04 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A8C0C061767
        for <linux-tegra@vger.kernel.org>; Wed, 16 Jun 2021 01:51:58 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 131so2756293ljj.3
        for <linux-tegra@vger.kernel.org>; Wed, 16 Jun 2021 01:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=DZDMGpM/sEHWM6yNpUmf6M64y/NSXleNdKOJA1uMKLI=;
        b=fGqU8FcHMc5nhX9YA09lytW4ocrMvWagjh+D0iOpv5voy1NDMeKfNbo7o49QGG29K4
         C8LGuNL7+bKT5WAwiH5ktQ5nsRXtYhiPqtsmyfBwr26gKiTRJRMrWenvtCmWVPanuoJZ
         9r8pcULfIWF9pw90Ut3uKKgLfeEWRup6CzMUGyxP1hpKUa+CHvYnU/JdjpzD+kVCagmv
         exNxfypeksvlZQ2JB+X5uHdEQxUgMck/B6VGyamOFnnw8vZZ7N/NX3EXt11+vLM/Dnz2
         u2I9y0sKGcOtnvzSMJ1Gx/5d2HFzQvHwoWQBxavbl4ht2l4W3UggtgeVEedDaMLFNly8
         iCrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=DZDMGpM/sEHWM6yNpUmf6M64y/NSXleNdKOJA1uMKLI=;
        b=ZU0T6PihnvTih6vftirEk4AeaJW1uV4kmr7oAQQKiuhMgPHxE+rUAuOWb8Rtwq8a+y
         3u34wA6oy+ppJtaMo3VHGOpuZ5x178NhoOus6GxBxj9eo6tpV9oTyRmOuF08fOxTHLHc
         GDXNJKmtE5u4j6sd1iSG2a5Nl4o2082k7xebqB9jX1qO4/tSHzmr25CU3rKztZ+c3iEx
         QSTqOYz+WUfGcm+Bonn+AraMbT76boSHJsP0TNjDm8CXOFhGlfts80yuNRkm03qrGdPy
         MT6RYvPBq9ud8fYJeF0Tps/CRFdeknXFi9IQ0YzuFbAjtx1Y6ZL61cIS5f6cHWTwJst7
         Wfjw==
X-Gm-Message-State: AOAM532BbmLtgPb1nmeWQIgAzQFm3jkKchBm6sT0ZE0hbtT0txtu2S9Z
        wHJDQpSDvnMK65lVHaj059n2yT/1Z6a/M0D9yR+QmA==
X-Google-Smtp-Source: ABdhPJz9EoAtDokg2cYr0siX/A4JmnXVGOJYXURswjVbIR4Ek3x3IVr0+h8/PD8YRFSVZodERoyXmxvK+JU2XOECDbg=
X-Received: by 2002:a2e:96d1:: with SMTP id d17mr3534161ljj.221.1623833516943;
 Wed, 16 Jun 2021 01:51:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210529170955.32574-1-digetx@gmail.com> <20210529170955.32574-5-digetx@gmail.com>
 <6f2b6290-095a-bd39-c160-1616a0ff89b1@linaro.org> <20210615102626.dja3agclwzxv2sj4@vireshk-i7>
 <595f5e53-b872-bcc6-e886-ed225e26e9fe@gmail.com> <fbdc3b56-4465-6d3e-74db-1d5082813b9c@linaro.org>
 <4c7b23c4-cf6a-0942-5250-63515be4a219@gmail.com> <20210616080310.vhvauvo5y6m2sekz@vireshk-i7>
 <CAKfTPtAxvj4_TBpFesjQxcVzvEi3QVUThccfSAJXwwrLtOH-xg@mail.gmail.com> <96bf59af-20b6-b706-5ff0-fe70f9eba827@gmail.com>
In-Reply-To: <96bf59af-20b6-b706-5ff0-fe70f9eba827@gmail.com>
From:   Vincent Guittot <vincent.guittot@linaro.org>
Date:   Wed, 16 Jun 2021 10:51:45 +0200
Message-ID: <CAKfTPtBDzFaFKuYgY5XC+-vFxFSJvxKunGFwY50E98bYn0VE5Q@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] thermal/drivers/tegra: Add driver for Tegra30
 thermal sensor
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
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
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, 16 Jun 2021 at 10:39, Dmitry Osipenko <digetx@gmail.com> wrote:
>
> 16.06.2021 11:30, Vincent Guittot =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Wed, 16 Jun 2021 at 10:03, Viresh Kumar <viresh.kumar@linaro.org> wr=
ote:
> >>
> >> +Vincent.
> >>
> >> On 15-06-21, 22:32, Dmitry Osipenko wrote:
> >>> IIUC, the cpufreq already should be prepared for the case where firmw=
are
> >>> may override frequency. Viresh, could you please clarify what are the
> >>> possible implications of the frequency overriding?
> >>
> >> The only implication is software would think hardware is running at
> >> some other frequency, while it is not. Not sure if something may break
> >> as a result of this.
> >>
> >> The scheduler's view of CPUs will not be same though, i.e. scheduler
> >> will see capacity as X, while in reality it has changed to Y.
> >
> > thermal_pressure is used by scheduler to balance the load between CPUs
> > according to the actual max frequency. If the thermal pressure doesn't
> > reflect reality, scheduler will end up enqueuing too many  tasks on a
> > throttle CPU.
>
> What if all CPUs are throttled equally and running on the same
> frequency, will throttling have any effect on the scheduler decisions?

Yes, the capacity is also used to detect when CPUs have spare capacity
or are already overloaded. We usually try to fill the spare capacity
of a CPU (CPU's max capacity - current utilization) but he max
capacity is reduced when the CPU is throttled, and the spare capacity
doesn't exist but scheduler could try to it

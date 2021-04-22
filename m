Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5229367A23
	for <lists+linux-tegra@lfdr.de>; Thu, 22 Apr 2021 08:47:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234927AbhDVGsC (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 22 Apr 2021 02:48:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234911AbhDVGsB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 22 Apr 2021 02:48:01 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A149FC06174A
        for <linux-tegra@vger.kernel.org>; Wed, 21 Apr 2021 23:47:26 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id u80so11277012oia.0
        for <linux-tegra@vger.kernel.org>; Wed, 21 Apr 2021 23:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wTjjN5jAG5wIij1DihAnfF2YGoCBK9l6YKfTSDtQuuw=;
        b=lA/wdfNnxbUzsB2aSrzU1nhguY4+P6Aj7qnVqkf5OhF3sIXJOlTSGd9kiMXUAzxysb
         W9QxSlfFJL7eB48TdEIbZwylUsW48RfPkIAqFU/rp2hCT5QWBBzk8WEoWFAagDOwQM/e
         Vrf8OGXAY/yBa15JsD4ffNk5Yq521ogLASDGN+9A73YZBNVlqNihiexcQD9WoaQ67iJR
         TgLFSLgTG6X7ptC8ZGmhj9i5I1DB7ubEaF0JWBSUgGG1mljq/HcUXyo9XgxL9gMNrINK
         2XsvC7sxwvCG4Rb/UT4z60h0z7UJ36wu/Uh+Ls0nO6/f21RJ61u0O+KXLP+C5dPrvvs4
         eLHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wTjjN5jAG5wIij1DihAnfF2YGoCBK9l6YKfTSDtQuuw=;
        b=L+tZX0lrdvFYabFHNr9Gx1FpM8PEkyl7utoqh3bhRcb/uYeFAXfjZiImBLKsIOLJ0l
         T2aMgOnd1ShszUzZLIN/73zcDZEjLuVfffmx37hqslxxOc4zYr5WorUuin/ppVnGT/SL
         SNJCSkZd6yY9lk20GZxXFIXM2c9ng34Q0TP+zPm+niS3LTrJEv5n+C95QXbjrNPDO/cy
         9Nch9yYWkWtmRrQrTHEo9sXXtiQ1JFj294VjwQzGxe9N1mjMItUDRadUn8iUx7RguHhZ
         X6PB6mxwYomS7m5hBCglMn6Gim++9Mr7FmppPb198pDL+EmVHnFJPrDGk95qn9fUP/z2
         ibxg==
X-Gm-Message-State: AOAM5328XlCcgadmUN9LC5O2fjiutu008NoJDxw743IwwSYqWeWdgr+6
        PevcDnQuOmSaPzgrSuDP+xjLURW0gTx4tf67fuJl4w==
X-Google-Smtp-Source: ABdhPJz+a6SHZEXyLt9Z7/nm+V2v7tz51a75rL/rIBsZOOdAAJeD+/znnbrUP8V+l4NnAp+N+L56r3GGMKmOwrilkZY=
X-Received: by 2002:aca:408a:: with SMTP id n132mr1231205oia.70.1619074045847;
 Wed, 21 Apr 2021 23:47:25 -0700 (PDT)
MIME-Version: 1.0
References: <CANpmjNM8wEJngK=J8Lt9npkZgrSWoRsqkdajErWEoY_=M1GW5A@mail.gmail.com>
 <43f8a3bf-34c5-0fc9-c335-7f92eaf23022@samsung.com> <dccaa337-f3e5-08e4-fe40-a603811bb13e@samsung.com>
 <CANpmjNP6-yKpxHqYFiA8Up-ujBQaeP7xyq1BrsV-NqMjJ-uHAQ@mail.gmail.com>
 <740077ce-efe1-b171-f807-bc5fd95a32ba@samsung.com> <f114ff4a-6612-0935-12ac-0e2ac18d896c@samsung.com>
 <CANpmjNM6bQpc49teN-9qQhCXoJXaek5stFGR2kPwDroSFBc0fw@mail.gmail.com>
 <cf6ed5cd-3202-65ce-86bc-6f1eba1b7d17@samsung.com> <CANpmjNPr_JtRC762ap8PQVmsFNY5YhHvOk0wNcPHq=ZQt-qxYg@mail.gmail.com>
 <YIBSg7Vi+U383dT7@elver.google.com> <CGME20210421182355eucas1p23b419002936ab5f1ffc25652135cc152@eucas1p2.samsung.com>
 <YIBtr2w/8KhOoiUA@elver.google.com> <dd99b921-3d79-a21f-8942-40fa5bf53190@samsung.com>
In-Reply-To: <dd99b921-3d79-a21f-8942-40fa5bf53190@samsung.com>
From:   Marco Elver <elver@google.com>
Date:   Thu, 22 Apr 2021 08:47:13 +0200
Message-ID: <CANpmjNPbMOUd_Wh5aHGdH8WLrYpyBFUpwx6g3Kj2D6eevvaU8w@mail.gmail.com>
Subject: Re: [PATCH v4 05/10] signal: Introduce TRAP_PERF si_code and si_perf
 to siginfo
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@redhat.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Alexander Potapenko <glider@google.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Christian Brauner <christian@brauner.io>,
        Dmitry Vyukov <dvyukov@google.com>,
        Jann Horn <jannh@google.com>, Jens Axboe <axboe@kernel.dk>,
        Matt Morehouse <mascasa@google.com>,
        Peter Collingbourne <pcc@google.com>,
        Ian Rogers <irogers@google.com>,
        Oleg Nesterov <oleg@redhat.com>,
        kasan-dev <kasan-dev@googlegroups.com>,
        linux-arch <linux-arch@vger.kernel.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-tegra@vger.kernel.org, jonathanh@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, 22 Apr 2021 at 08:12, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
[...]
> > So I think we just have to settle on 'unsigned long' here. On many
> > architectures, like 32-bit Arm, the alignment of a structure is that of
> > its largest member. This means that there is no portable way to add
> > 64-bit integers to siginfo_t on 32-bit architectures.
> >
> > In the case of the si_perf field, word size is sufficient since the data
> > it contains is user-defined. On 32-bit architectures, any excess bits of
> > perf_event_attr::sig_data will therefore be truncated when copying into
> > si_perf.
> >
> > Feel free to test the below if you have time, but the below lets me boot
> > 32-bit arm which previously timed out. It also passes all the
> > static_asserts() I added (will send those as separate patches).
> >
> > Once I'm convinced this passes all others tests too, I'll send a patch.
>
> This fixes the issue I've observed on my test systems. Feel free to add:
>
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

Thank you for testing! It's been sent:
https://lkml.kernel.org/r/20210422064437.3577327-1-elver@google.com

Thanks,
-- Marco

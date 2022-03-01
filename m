Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0991B4C7F66
	for <lists+linux-tegra@lfdr.de>; Tue,  1 Mar 2022 01:41:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231618AbiCAAmP (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 28 Feb 2022 19:42:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231605AbiCAAmO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 28 Feb 2022 19:42:14 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4269FB7C4
        for <linux-tegra@vger.kernel.org>; Mon, 28 Feb 2022 16:41:33 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id hw13so28189512ejc.9
        for <linux-tegra@vger.kernel.org>; Mon, 28 Feb 2022 16:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cUh7YOptqnvj33mIS3WykOaibv0ctq8lQu0USbAcExo=;
        b=gduPBw6Te4zeyjZyaNuQQxqABiMq6fHp34ckrObT/FmzNLnDhHL/6KerjIgP5i0R8H
         Vm0a8HwZ8W8PnRRZRxnIsSc7yENLFtSGfKUqeeqvjpp8888PKIgF8NBwqM5k9ZzIrQCZ
         iYuicfiGesL4zlgkSDywOQeUUhyrP2kMozUBc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cUh7YOptqnvj33mIS3WykOaibv0ctq8lQu0USbAcExo=;
        b=yCHhm0TeLLFBO3x4/uNPZQ3UlONQohY9Zw/1PWGUKaDOrE6MRR1JzYW9pP98epQhVH
         R+4KhC9sx/eVRHrBXP2Byg3CZD+ha1O5NKk7TzXJGar4jf/iE1wPx1+mRGnQ4hTD5+MJ
         iILv6+IaHxNgJNkEYQOkcF7zvraYeBJX7Br8PElNeB5sE//kvaXvH5fA5n3E3B5/nOCE
         V8ZrosF6bEy/wM3RIr2Q6slRbDvMxrfTFqLg8RfJSPIo0N2b2GR6VUddEjH+BA/qQ3XZ
         LyRZf6nJb3CjGfEGC7stuPnWUB5rTBQvzANcOv8osQDf/+kxPWlywT3WJ67iCExe3gNS
         G8hA==
X-Gm-Message-State: AOAM530TMMO7sAoKQay1Eo+sQjv7gzDUf9FfcX1lNlQeU0YqX8APyWOv
        tc5kQ6+qc/dSkuVvMWqkpZe13XsC4yGEBnMRYuk=
X-Google-Smtp-Source: ABdhPJzTs8zJD1StWLrnIk7Y2yNrzwW3LMAnOFRm4vU0KEbuj+zauwY4fXU45gXtVBfs4NgDjqW9fw==
X-Received: by 2002:a17:906:1ec3:b0:6cf:d118:59e2 with SMTP id m3-20020a1709061ec300b006cfd11859e2mr17503006ejj.767.1646095291897;
        Mon, 28 Feb 2022 16:41:31 -0800 (PST)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id gs39-20020a1709072d2700b006d3ed4f51c6sm4916932ejc.0.2022.02.28.16.41.31
        for <linux-tegra@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Feb 2022 16:41:31 -0800 (PST)
Received: by mail-ej1-f52.google.com with SMTP id dr20so3530019ejc.6
        for <linux-tegra@vger.kernel.org>; Mon, 28 Feb 2022 16:41:31 -0800 (PST)
X-Received: by 2002:ac2:4d91:0:b0:443:127b:558a with SMTP id
 g17-20020ac24d91000000b00443127b558amr14552706lfe.542.1646095280878; Mon, 28
 Feb 2022 16:41:20 -0800 (PST)
MIME-Version: 1.0
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-3-jakobkoschel@gmail.com> <2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
 <CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
 <CAHk-=wj8fkosQ7=bps5K+DDazBXk=ypfn49A0sEq+7-nZnyfXA@mail.gmail.com>
 <CAHk-=wiTCvLQkHcJ3y0hpqH7FEk9D28LDvZZogC6OVLk7naBww@mail.gmail.com> <FC710A1A-524E-481B-A668-FC258F529A2E@gmail.com>
In-Reply-To: <FC710A1A-524E-481B-A668-FC258F529A2E@gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 28 Feb 2022 16:41:04 -0800
X-Gmail-Original-Message-ID: <CAHk-=whLK11HyvpUtEftOjc3Gup2V77KpAQ2fycj3uai=qceHw@mail.gmail.com>
Message-ID: <CAHk-=whLK11HyvpUtEftOjc3Gup2V77KpAQ2fycj3uai=qceHw@mail.gmail.com>
Subject: Re: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
To:     Jakob Koschel <jakobkoschel@gmail.com>
Cc:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        alsa-devel@alsa-project.org, linux-aspeed@lists.ozlabs.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-iio@vger.kernel.org, nouveau@lists.freedesktop.org,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Cristiano Giuffrida <c.giuffrida@vu.nl>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        samba-technical@lists.samba.org,
        linux1394-devel@lists.sourceforge.net, drbd-dev@lists.linbit.com,
        linux-arch <linux-arch@vger.kernel.org>,
        CIFS <linux-cifs@vger.kernel.org>,
        KVM list <kvm@vger.kernel.org>,
        linux-scsi <linux-scsi@vger.kernel.org>,
        linux-rdma <linux-rdma@vger.kernel.org>,
        linux-staging@lists.linux.dev, "Bos, H.J." <h.j.bos@vu.nl>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        intel-wired-lan@lists.osuosl.org,
        kgdb-bugreport@lists.sourceforge.net,
        bcm-kernel-feedback-list@broadcom.com,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Arnd Bergman <arnd@arndb.de>,
        Linux PM <linux-pm@vger.kernel.org>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
        Nathan Chancellor <nathan@kernel.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        v9fs-developer@lists.sourceforge.net,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-sgx@vger.kernel.org,
        linux-block <linux-block@vger.kernel.org>,
        Netdev <netdev@vger.kernel.org>, linux-usb@vger.kernel.org,
        linux-wireless <linux-wireless@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux F2FS Dev Mailing List 
        <linux-f2fs-devel@lists.sourceforge.net>,
        tipc-discussion@lists.sourceforge.net,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        dma <dmaengine@vger.kernel.org>,
        linux-mediatek@lists.infradead.org,
        Andrew Morton <akpm@linux-foundation.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Feb 28, 2022 at 1:47 PM Jakob Koschel <jakobkoschel@gmail.com> wrote:
>
> The goal of this is to get compiler warnings right? This would indeed be great.

Yes, so I don't mind having a one-time patch that has been gathered
using some automated checker tool, but I don't think that works from a
long-term maintenance perspective.

So if we have the basic rule being "don't use the loop iterator after
the loop has finished, because it can cause all kinds of subtle
issues", then in _addition_ to fixing the existing code paths that
have this issue, I really would want to (a) get a compiler warning for
future cases and (b) make it not actually _work_ for future cases.

Because otherwise it will just happen again.

> Changing the list_for_each_entry() macro first will break all of those cases
> (e.g. the ones using 'list_entry_is_head()).

So I have no problems with breaking cases that we basically already
have a patch for due to  your automated tool. There were certainly
more than a handful, but it didn't look _too_ bad to just make the
rule be "don't use the iterator after the loop".

Of course, that's just based on that patch of yours. Maybe there are a
ton of other cases that your patch didn't change, because they didn't
match your trigger case, so I may just be overly optimistic here.

But basically to _me_, the important part is that the end result is
maintainable longer-term. I'm more than happy to have a one-time patch
to fix a lot of dubious cases if we can then have clean rules going
forward.

> I assumed it is better to fix those cases first and then have a simple
> coccinelle script changing the macro + moving the iterator into the scope
> of the macro.

So that had been another plan of mine, until I actually looked at
changing the macro. In the one case I looked at, it was ugly beyond
belief.

It turns out that just syntactically, it's really nice to give the
type of the iterator from outside the way we do now. Yeah, it may be a
bit odd, and maybe it's partly because I'm so used to the
"list_for_each_list_entry()" syntax, but moving the type into the loop
construct really made it nasty - either one very complex line, or
having to split it over two lines which was even worse.

Maybe the place I looked at just happened to have a long typename, but
it's basically always going to be a struct, so it's never a _simple_
type. And it just looked very odd adn unnatural to have the type as
one of the "arguments" to that list_for_each_entry() macro.

So yes, initially my idea had been to just move the iterator entirely
inside the macro. But specifying the type got so ugly that I think
that

        typeof (pos) pos

trick inside the macro really ends up giving us the best of all worlds:

 (a) let's us keep the existing syntax and code for all the nice cases
that did everything inside the loop anyway

 (b) gives us a nice warning for any normal use-after-loop case
(unless you explicitly initialized it like that
sgx_mmu_notifier_release() function did for no good reason

 (c) also guarantees that even if you don't get a warning,
non-converted (or newly written) bad code won't actually _work_

so you end up getting the new rules without any ambiguity or mistaken

> With this you are no longer able to set the 'outer' pos within the list
> iterator loop body or am I missing something?

Correct. Any assignment inside the loop will be entirely just to the
local loop case. So any "break;" out of the loop will have to set
another variable - like your updated patch did.

> I fail to see how this will make most of the changes in this
> patch obsolete (if that was the intention).

I hope my explanation above clarifies my thinking: I do not dislike
your patch, and in fact your patch is indeed required to make the new
semantics work.

What I disliked was always the maintainability of your patch - making
the rules be something that isn't actually visible in the source code,
and letting the old semantics still work as well as they ever did, and
having to basically run some verification pass to find bad users.

(I also disliked your original patch that mixed up the "CPU
speculation type safety" with the actual non-speculative problems, but
that was another issue).

                Linus

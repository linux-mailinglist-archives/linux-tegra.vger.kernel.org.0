Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64C5AA80E5
	for <lists+linux-tegra@lfdr.de>; Wed,  4 Sep 2019 13:11:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727787AbfIDLIt (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 4 Sep 2019 07:08:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:41562 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725966AbfIDLIs (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 4 Sep 2019 07:08:48 -0400
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B18E723401
        for <linux-tegra@vger.kernel.org>; Wed,  4 Sep 2019 11:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567595327;
        bh=Rw5G8I9W6+X3QvVnriq0yfX9y6Jd+a/7KwN5rNAvWQU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=docciwJ43EBHB2LFg5xFooV3CoU+7eCvboNIV/I5J+YoyRNNx/5VCMQFJppEgfiK2
         nMsZAmO6AUGuW5aP1goEnkMpU9u3BmEQ9HqeCyg6ED2M5mNFvCLy7XQQFhi7sdeOXl
         ioe30KeztDfDhz8yynamNU0vGF5d6WlEfX1qPAG0=
Received: by mail-qt1-f181.google.com with SMTP id k10so13599965qth.2
        for <linux-tegra@vger.kernel.org>; Wed, 04 Sep 2019 04:08:47 -0700 (PDT)
X-Gm-Message-State: APjAAAWUCSQd9bEVZeGG6RkrIWMKXyGogbNcMjVJIPzNOcZrpkKcjDkK
        APfa8bQeKFdonX588bvgN1Xz27nCPnZR4mIhfnA=
X-Google-Smtp-Source: APXvYqwF0u/VdRLwitfoHvg4HvKmH1Uvn6hJROc6Bs4VU83JEd8ICAsdpuUeMcFkzArpQgDiilSrs2A3P2P6ul8qer8=
X-Received: by 2002:ac8:540e:: with SMTP id b14mr33258702qtq.231.1567595326857;
 Wed, 04 Sep 2019 04:08:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190830103350.8273-1-thierry.reding@gmail.com>
 <s5h1rx2270k.wl-tiwai@suse.de> <20190902074718.GB930@ulmo> <s5htv9uykrg.wl-tiwai@suse.de>
In-Reply-To: <s5htv9uykrg.wl-tiwai@suse.de>
From:   Josh Boyer <jwboyer@kernel.org>
Date:   Wed, 4 Sep 2019 07:08:35 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7VVe995b7K+=+WKBpC3-dfL2W_524dmXkWLaAD8-Oiyw@mail.gmail.com>
Message-ID: <CA+5PVA7VVe995b7K+=+WKBpC3-dfL2W_524dmXkWLaAD8-Oiyw@mail.gmail.com>
Subject: Re: [PATCH] Add symlinks for Tegra VIC firmware binaries
To:     Takashi Iwai <tiwai@suse.de>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Linux Firmware <linux-firmware@kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Sep 2, 2019 at 7:56 AM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Mon, 02 Sep 2019 09:47:18 +0200,
> Thierry Reding wrote:
> >
> > On Fri, Aug 30, 2019 at 02:05:15PM +0200, Takashi Iwai wrote:
> > > On Fri, 30 Aug 2019 12:33:50 +0200,
> > > Thierry Reding wrote:
> > > >
> > > > I've noticed that the current Link: mechanism completely ignores the
> > > > target part of the link. Was this intended to allow creating symlinks
> > > > dynamically when copying the firmware, rather than just copying any
> > > > existing symlinks themselves?
> > >
> > > That's a kind of intentional; the script doesn't validate by itself
> > > but just installs to the target directory.  And the cp -d option
> > > preserves the symlink as-is, so it should work as long as the original
> > > symlink is correctly set up.
> >
> > Perhaps some code could be added to create the symlinks if the "-> foo"
> > part was specified and no symlink exists.
>
> Yeah, it sounds like a good idea.
>
> > Not a big deal, I just think it's a bit redundant to basically have all
> > the symlink information in the WHENCE file and in the filesystem. That's
> > especially annoying if both get out of sync.
> >
> > I'll volunteer to write that patch if you think it'd be a worthwhile
> > addition.
>
> I'm for it but leave the decision to Josh :)

I think this sounds good as well.  Would love to have a patch.

josh

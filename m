Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FD8AC87F6
	for <lists+linux-tegra@lfdr.de>; Wed,  2 Oct 2019 14:07:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727194AbfJBMH4 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 2 Oct 2019 08:07:56 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:40687 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726329AbfJBMH4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 2 Oct 2019 08:07:56 -0400
Received: by mail-qt1-f194.google.com with SMTP id f7so25958721qtq.7
        for <linux-tegra@vger.kernel.org>; Wed, 02 Oct 2019 05:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BlcqtV6db7QVERnyVS7LXFxoWCMHXchHPZtJsdNvvaU=;
        b=qYViIxag/ZDQAsCOr8dPsHJsCbLrBCbuzTAmFRrLIx1aUMbC2z0ANbiOjSGkaBuVcv
         YJSw5IXIxmsm3TNoUIIhlqSeRpNayS1nJRoyRX0ZqrpALyS/TTTZtGfANELS1DkzeXJM
         MG0In8OWExul0mKBlhCG4eP65phP9E72yzKUFiwIwfvGpf6jaKpY8ninxqaQZi2vuW6c
         CHssIQ50gHpsT7jFKz2/MnSXVp/3mI1A125RsPRgTS5j9pr0/yQzi35zQRH2QW7X+ndb
         jvoIqPE3e4NhOWG2PG4D75ItxlpVsps+Ja7IGocW5Jgt1YbrPn6ymIUGLaJ0uIX6IBPD
         VKfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BlcqtV6db7QVERnyVS7LXFxoWCMHXchHPZtJsdNvvaU=;
        b=rQ8HLOUZ/etnPa4HHKyft5ntjx2+D3VnSV+qKst0JOAXMMzdfAoxrGDmFGUIkxPNC6
         ArphKdole7+i+zAEsxGg9u60CrzEYZv23Y5dqVihhueCgALDiOQHkResMcT7XaWuDM5u
         1kdH4aCycEhOherrdFJVnID0f0NwJoQC9V9jU7i/3P/vZAK/kh61pc0FvhyGrLaQOWqz
         8uceCbVbz3XsHh3ijn96Vb12j3NVOjlNPdjP+E0cdqY3Ij2nsD9ASeg+Uv/SFhX/JsjO
         UGkFFIYr6Yml35Gjur23ou4mSdDF99zGJh5GB/R7WwiyO8QhKS/bh7EGaoIfdlPP8OrI
         Gzig==
X-Gm-Message-State: APjAAAV1DUgwRrDKSuf1U1ewcwa1SYpwi138xC9HmOE6H92y7AiFPNvA
        5afCFYGOBAwY8w6bV1tbsX7MHszKFJROKdtvq3EZBS1F3Sw=
X-Google-Smtp-Source: APXvYqx0a54nYVCAl5kZIaApYqhyFSf9WPfxlPzRPegU8rmEHHyfcQWARoAjYBUROrS8DTWe1Pe7xa4eX63ZzIXjQ58=
X-Received: by 2002:a0c:eb89:: with SMTP id x9mr2605119qvo.18.1570018073939;
 Wed, 02 Oct 2019 05:07:53 -0700 (PDT)
MIME-Version: 1.0
References: <20191002014153.29831-1-pgwipeout@gmail.com> <20191002014153.29831-5-pgwipeout@gmail.com>
 <20191002112631.GN3716706@ulmo>
In-Reply-To: <20191002112631.GN3716706@ulmo>
From:   Peter Geis <pgwipeout@gmail.com>
Date:   Wed, 2 Oct 2019 08:07:37 -0400
Message-ID: <CAMdYzYpXdVPXSJ7w5eRhOkgmg_cfyj+Yr_agbimn__zfMBsDCw@mail.gmail.com>
Subject: Re: [PATCH 4/5] usb: chipidea: tegra: add the tegra specific bits
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Peter Chen <peter.chen@nxp.com>, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Oct 2, 2019 at 7:26 AM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> On Tue, Oct 01, 2019 at 09:41:52PM -0400, Peter Geis wrote:
> > As Tegra requires special handlers for resets and dma alignment, add
> > those functions to a header.
> >
> > Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> > ---
> >  drivers/usb/chipidea/tegra.h | 159 +++++++++++++++++++++++++++++++++++
> >  1 file changed, 159 insertions(+)
> >  create mode 100644 drivers/usb/chipidea/tegra.h
>
> Can't you move these into the ci_hdrc_tegra.c file? It's kind of odd to
> have large functions like this implemented in a header.
>
> Thierry

I put this into a header since the chipidea host driver uses it
exclusively and it doesn't export most of its functions.
The other ways involved significant changes to the host driver or
duplicating a lot of functionality in the tegra-udc driver.
Neither method seemed good to me, and I couldn't figure out a better
way to do it.

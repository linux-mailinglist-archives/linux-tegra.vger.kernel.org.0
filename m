Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90F884B377
	for <lists+linux-tegra@lfdr.de>; Wed, 19 Jun 2019 09:58:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731065AbfFSH6C (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 19 Jun 2019 03:58:02 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:43789 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730418AbfFSH6C (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 19 Jun 2019 03:58:02 -0400
Received: by mail-lj1-f196.google.com with SMTP id 16so2245394ljv.10
        for <linux-tegra@vger.kernel.org>; Wed, 19 Jun 2019 00:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=UYXQ8ORQAtuliQYo9/TvRwHxArXDs2AP/hpE8FcllZk=;
        b=NCv3ZoWAGJtU7GIADPpPY3/1luv0podsGDANGlNUgxCq6hj3bdfpRh1yHBmWoNpPHG
         kAE8ed9fToOV/cTtHWp0D+V9Jb8avi5LQI5pZOd+XXwxUYlmopjhMzPDa63SSrvTkycA
         ADLQvHuYghv3jU6NM4n1lZPp9uVpbCk/3dLZys1NRdN5TRQmtzW75qIbImXTXAnM2Rct
         /TbMb6BOhGZsu6fZMd7f2JACUIdCbk9qBos/WwikaZ+Gv2RzUwLP56X/ScCTHVVaLtCM
         SMWnhyRrv9VxUkL/iAWtP6TJ5oAkHTl/AIUuVC9hRYva9A91Oq1LAcJ6NAxllzYZZeQG
         0Agg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=UYXQ8ORQAtuliQYo9/TvRwHxArXDs2AP/hpE8FcllZk=;
        b=b2Q5uo8VLsbRTzl/GyTANmDZfxlB7ncFs2fZprt4ng7mdbQ0EzlTD1zUTsFW4g7R/F
         2l3JZ5kpCBzIz5AWjrPSFrOvNgrPUoIiW+sIyOTHGJPmurt5a1tr8zVovyTA788VNB+I
         +aVIwp22yIyQg0uvdGM40C34kZrCSL5MV9PWR6Z/FHlaq8pC75JodLh54iiLuyVLnnUp
         kaaoCyxbe8NKAHrNzVi+xKJpYoJfdwlo1Y9YUegxA0hn4m6WSgJoZV9/xghTebQfVag8
         C2GywXTjoSuLvywPqTp1I7YHgZFNxDxH6cWcc5fjZQmSikWOId/Vu9s6SLyks85GyEUn
         umbQ==
X-Gm-Message-State: APjAAAXUzz7l+jYbgJXf2Es+PBueUM/0vax/oJHR5/nZwrbO2bTRuYs2
        QuNf8nPeCKzG285RVHq8sUHTE/JBAE5DloyxrnUI6w==
X-Google-Smtp-Source: APXvYqwO7kM+IPzZZWHTy4NJqVwYpImHEjNOFU1wjg54Z/smwwYuX0kB/6CJlJDWBcgz1AFTUM+rKeBYM/4nFCVyWng=
X-Received: by 2002:a2e:5d46:: with SMTP id r67mr35872518ljb.187.1560931080308;
 Wed, 19 Jun 2019 00:58:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190108143713.15120-1-anders.roxell@linaro.org>
 <20190110081615.GD5213@ulmo> <CADYN=9LtpcJMbcUHN0Eg4bsYoX7f+xm_KiJ_3fE15-5k6mwC5g@mail.gmail.com>
In-Reply-To: <CADYN=9LtpcJMbcUHN0Eg4bsYoX7f+xm_KiJ_3fE15-5k6mwC5g@mail.gmail.com>
From:   Anders Roxell <anders.roxell@linaro.org>
Date:   Wed, 19 Jun 2019 09:57:49 +0200
Message-ID: <CADYN=9KUXdnmpEHRY7CGCpQa3H4C0M=a3wyNueXkgpssSdik6A@mail.gmail.com>
Subject: Re: [PATCH] mailbox: tegra-hsp: mark PM functions as __maybe_unused
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     jassisinghbrar@gmail.com, jonathanh@nvidia.com,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, 19 Jun 2019 at 09:56, Anders Roxell <anders.roxell@linaro.org> wrot=
e:
>
> On Thu, 10 Jan 2019 at 09:16, Thierry Reding <thierry.reding@gmail.com> w=
rote:
> >
> > On Tue, Jan 08, 2019 at 03:37:13PM +0100, Anders Roxell wrote:
> > > Without CONFIG_PM_SLEEP, we get annoying warnings about unused
> > > functions:
> > >
> > > drivers/mailbox/tegra-hsp.c:782:12: warning: =E2=80=98tegra_hsp_resum=
e=E2=80=99 defined but not used [-Wunused-function]
> > >  static int tegra_hsp_resume(struct device *dev)
> > >             ^~~~~~~~~~~~~~~~
> > >
> > > Mark them as __maybe_unused to shut up the warning and silently drop =
the
> > > functions without having to add ugly #ifdefs.
> > >
> > > Fixes: 9a63f0f40599 ("mailbox: tegra-hsp: Add suspend/resume support"=
)
> > > Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> > > ---
> > >  drivers/mailbox/tegra-hsp.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > Acked-by: Thierry Reding <treding@nvidia.com>
>
> Will this be picked up ?

its already solved.

Sorry for the noice. =3D/

Anders

>
> Cheers,
> Anders

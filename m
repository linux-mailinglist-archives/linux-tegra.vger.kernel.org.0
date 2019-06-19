Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE2164B36D
	for <lists+linux-tegra@lfdr.de>; Wed, 19 Jun 2019 09:56:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731062AbfFSH40 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 19 Jun 2019 03:56:26 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:45959 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726142AbfFSH4Z (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 19 Jun 2019 03:56:25 -0400
Received: by mail-lj1-f196.google.com with SMTP id m23so2228585lje.12
        for <linux-tegra@vger.kernel.org>; Wed, 19 Jun 2019 00:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ay8I7XJ9iCOvh0M9Fd42oOlQR4wemxkRFmtvtAGMWPE=;
        b=jF1jLJIMjj62N1sJ/CeWes0b/z3GjaG3HiDI20T0YQdCmP6e6VUjjIPaoanpdpYeD1
         oyOKbIViVeufbYehdZ2oxsUTHxmoD6kPcKZdlyW3q04HpdT+ICakz5JZxME10w5v1MzS
         gN5AZJzt61T+WDruBbbUOnKO4p2HujxsPXsNvXZ1yp9K4IcCLdeZbMAPjAPw6aGLZJK6
         Sr2MG72KAG9m/k6x3Bo4KAQtefacuvQbWqWzAdbdFD/+rELTYjZh39PyHkcUwnAe8lYx
         pTCczbloa5W3cr9OIol0bg88q0wLkTYk5Lgb8qYs5jXnZcich6NWQs7/VmcJY8Ztna4z
         rOtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ay8I7XJ9iCOvh0M9Fd42oOlQR4wemxkRFmtvtAGMWPE=;
        b=FvDnRI5n3YM4ntl42sx7S+wFW9pgblUHN2hiQsd5GnScbAxOcj2+dQTEIocggZMBtu
         9zRuByi4ZcCyxkiVxXFammIaySUDwKrQiRzFQb146JiAjBdfnA4wOWq9GBbiKM89e6HC
         ZfcCip9F4wV/Hj8st2/5RuoCgtD9f38LGT8Yctj675RxSs5U42DLCaug1WFeGX4/5ovy
         M9YqvqvXW4puVcVBAhtcm3zw/Pq0zbIu9wCUhFHUCv4xR97NTv2589/iYhr5MXazmoDV
         yV3puHAykFqAPaN1fQNlJDLbZZ5UKgctZ88I+JhoQdT9f4zih62/m8puIQm8Dhi1rZa3
         bZvA==
X-Gm-Message-State: APjAAAWcYKMeSYTPIc1AcmqGDYNtnGx8NZaznCY4j4NQhkx5YqHMmJCU
        8hHCgwP150PQfK4Yx9Q3kxCkEFJouN8OGP5agHVsqg==
X-Google-Smtp-Source: APXvYqwjfWxX+EG4Xqz7eu0QZY2s9wB/HAP4nhdPGeG9Hus7luuLwMAdoDJTs+YfuKobg/C2mU9tsnW1VzFiwiyNjrA=
X-Received: by 2002:a2e:9284:: with SMTP id d4mr66873430ljh.26.1560930983583;
 Wed, 19 Jun 2019 00:56:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190108143713.15120-1-anders.roxell@linaro.org> <20190110081615.GD5213@ulmo>
In-Reply-To: <20190110081615.GD5213@ulmo>
From:   Anders Roxell <anders.roxell@linaro.org>
Date:   Wed, 19 Jun 2019 09:56:12 +0200
Message-ID: <CADYN=9LtpcJMbcUHN0Eg4bsYoX7f+xm_KiJ_3fE15-5k6mwC5g@mail.gmail.com>
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

On Thu, 10 Jan 2019 at 09:16, Thierry Reding <thierry.reding@gmail.com> wro=
te:
>
> On Tue, Jan 08, 2019 at 03:37:13PM +0100, Anders Roxell wrote:
> > Without CONFIG_PM_SLEEP, we get annoying warnings about unused
> > functions:
> >
> > drivers/mailbox/tegra-hsp.c:782:12: warning: =E2=80=98tegra_hsp_resume=
=E2=80=99 defined but not used [-Wunused-function]
> >  static int tegra_hsp_resume(struct device *dev)
> >             ^~~~~~~~~~~~~~~~
> >
> > Mark them as __maybe_unused to shut up the warning and silently drop th=
e
> > functions without having to add ugly #ifdefs.
> >
> > Fixes: 9a63f0f40599 ("mailbox: tegra-hsp: Add suspend/resume support")
> > Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> > ---
> >  drivers/mailbox/tegra-hsp.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Acked-by: Thierry Reding <treding@nvidia.com>

Will this be picked up ?

Cheers,
Anders

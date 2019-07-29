Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 590B579B5F
	for <lists+linux-tegra@lfdr.de>; Mon, 29 Jul 2019 23:43:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388034AbfG2Vni (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 29 Jul 2019 17:43:38 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:39316 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726351AbfG2Vni (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 29 Jul 2019 17:43:38 -0400
Received: by mail-oi1-f194.google.com with SMTP id m202so46411325oig.6
        for <linux-tegra@vger.kernel.org>; Mon, 29 Jul 2019 14:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WZrILgpa4AKgcRajNVzS+1FQKo+u6yPOmDkj0+rqZcw=;
        b=ZFEec3wSLtGbbrDQ1+bbDsdv8hZ8eQ880KdtrrmyvHHI5sgNabU2D6chgtYNGPANiN
         8H04C3WuuotjrlC7DOtQA2o8PQa8zBNp1e4UQVUqWcGdwP82qLJXsQ4mQIq4yXnuQZiJ
         XTOYzIHj1NFiFilHL4y1RKEJ7sL5/v+cqaRPK8qOu85Rk9k/NzZvAlyn6x2qw/4ai2Vc
         2HZwoqk2buYSd9lv5Z3Ku64JsRviMmvXR27FNBrxCH1WWy+9RPHsuQaI/d0zsWEhUyxa
         ljiiDwrJksK6/i87hBb5C66jBM11FO0nN3eBtUjpqDq/O/M5BuZ3/URvsMSequZVVYVh
         9SVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WZrILgpa4AKgcRajNVzS+1FQKo+u6yPOmDkj0+rqZcw=;
        b=UBiRVvNgRMUbkySCWrSUckAKwEz2vvSkWv6uGwHQ987O3GvXuBCaBQLh3TUb+KxsRH
         4h75XtVciTWXXObCL3F2q3Wcru1i1/7NF+JPo5y51WXMKt6X5bbss5IXlupGVTaZzmIG
         X6iOw9WfJYgo/1H5U2kfe6f4WsNqFDd9RNNFckiAczvuIwmO7YdyjJawEUGZ/CV/9Bi7
         SN/uYh+Kso52qc5yRGZ7V4H1kwRCJF4Foc1j6dDsKccN7yJ3MQ2aLUzF5pmjrvsyu7qr
         3VTu+QqkxAgoGF8ixYtF2lYnS2VwdfCYOhieRG5+Z+JDzrL/BxY2SKp4PUzWDFc72v5f
         LD6w==
X-Gm-Message-State: APjAAAXug4HN4dMHoHKTC5MKjtqKR+AoYthWFmqlloUPEpA2owVX4oZT
        VdWIbfHe16DzL6RTM1tXNo1Wy7pu0m4jsz6PJUpHWA==
X-Google-Smtp-Source: APXvYqwP/ykdlMeRsU2Gq8pfzTrfU3Dr7i6Tx76kbnWXoF796AB41GSTAHyHI5iP1r1tN1hWduFG6XsQ/QkpwiBSmts=
X-Received: by 2002:aca:d8c2:: with SMTP id p185mr57283637oig.30.1564436617403;
 Mon, 29 Jul 2019 14:43:37 -0700 (PDT)
MIME-Version: 1.0
References: <2305283.AStDPdUUnE@kreacher> <c8960d91-4446-9acf-5575-e442a652bd05@gmail.com>
 <CAGETcx_+i6_0Q2rf-UdzZ3bCPUos9Tu4JmvvO0zUoy5gB8_ESQ@mail.gmail.com> <CAJZ5v0h5U60yCyaHeHVbWmwWDa4NBnuhgsV022nZm5HuGgV7ow@mail.gmail.com>
In-Reply-To: <CAJZ5v0h5U60yCyaHeHVbWmwWDa4NBnuhgsV022nZm5HuGgV7ow@mail.gmail.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Mon, 29 Jul 2019 14:43:01 -0700
Message-ID: <CAGETcx9oqAJ-VoJnD0Y8k+W8cCGPDz--=amktSgW_sB4MEngDA@mail.gmail.com>
Subject: Re: [PATCH v2] driver core: Remove device link creation limitation
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        Lukas Wunner <lukas@wunner.de>,
        Jon Hunter <jonathanh@nvidia.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Jul 29, 2019 at 2:25 PM Rafael J. Wysocki <rafael@kernel.org> wrote:
>
> On Mon, Jul 29, 2019 at 10:47 PM Saravana Kannan <saravanak@google.com> wrote:
> >
> > Rafael,
> >
> > This is the fix you need. Or something link this.
> >
> > I had asked you to reject DL_FLAG_MANAGED as an input flag if you are
> > marking it as internal (in the comments). But looks like you were also
> > trying to check for "undefined" bit positions. However, the check
> > isn't correct because DL_MANAGED_FLAGS doesn't include (rightfully so)
> > DL_FLAG_PM_RUNTIME and DL_FLAG_RPM_ACTIVE .
> >
> > I tried to write a DL_FLAG_EXTERNAL to include all the external flags,
> > but that felt like a maintenance headache that's not worth carrying. I
> > think it's simpler to just error out when internal flags being passed
> > in and ignore any undefined bit positions.
>
> Well, IMO it is better to prevent people from passing unrecognized
> flags to device_link_add() at all, even if that means some extra
> effort when adding new flags.

It isn't so much the extra effort that's a concern, but people might
miss updating whatever grouping macro we use.

>
> I'll post an alternative fix shortly.

You might want to move the MANAGED_FLAGs and other grouping macros
into the header file then? So that if someone is adding new flags,
it'll be less likely they'll forget to update the grouping macro?

-Saravana

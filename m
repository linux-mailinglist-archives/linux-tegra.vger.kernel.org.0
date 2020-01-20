Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8BE7142787
	for <lists+linux-tegra@lfdr.de>; Mon, 20 Jan 2020 10:44:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726935AbgATJoI (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 20 Jan 2020 04:44:08 -0500
Received: from mail-vk1-f196.google.com ([209.85.221.196]:33719 "EHLO
        mail-vk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726635AbgATJoH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 20 Jan 2020 04:44:07 -0500
Received: by mail-vk1-f196.google.com with SMTP id i78so8370572vke.0
        for <linux-tegra@vger.kernel.org>; Mon, 20 Jan 2020 01:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=8WXD++puZRBDfX+XovxCYxezYIYsgF4bFnxytu5iD+I=;
        b=RZHZvJdKK+liUUkELaYnw7PGaEroFf9bWYekXdHa0nKjOWN1cV6Cs1e09zCuchePzu
         RijCqeXtUHanoE2AIw5XN23OfQwNyKbfztEp2OtpSMASCijrurE07e2dKXVxsyCWVEPs
         FWZ+WLM/N+K0H92fquLbaCGqfEj23QyGNxICFJJN+fa9gGLppp/qEiQorEXFSC6szQDG
         xGtnebS9HNjcCQiiFhJdJxZECbi+meO5SGl50HCnbJjPJFvhh5ru4R0X++MQ+sap0bVH
         fqWYqYINlrp62H/fNGfi/JgDYS74n82ogq5FiUOnZ0de3oJZDIs57MqeT3ZH4AVoczYX
         KuZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=8WXD++puZRBDfX+XovxCYxezYIYsgF4bFnxytu5iD+I=;
        b=t2MwAnotxiucxF7xNBCCrJEjLM2eqom9W0HBJnp5yAwxNAVmiyt/40/QuC/gM9TnXM
         XFkptEjKMEiF6Gcj2hdYe6RKUtNbBx8Gh9MEyBeBfE1vBLkvd5jB66MTYqUdCbWunR4l
         g8j0l7M5QJdj0zJD1G/kq4M261FDi/aIA1JscDs8ynS6y5iH0N+U5Cn3w7r+d7CA3wdV
         ybC7RaWFrYKSOIoTIz9VDEZf30dcmHL/Bk0zYmGgxCIIo6MCor9GXQKjvRYfjjGSvdch
         5Sexde49DKZm5ZsFIuy2Gi4PhpcZQ4V3mZAZbLx/9KpvRuPnIxqzM5vQj0pD4a37VLgH
         XOYg==
X-Gm-Message-State: APjAAAUzuSd9hi2Np2/3+FQl54vMJ83KXJEzhW/00YotWEqssQj96or+
        niE8J2jyQrFLoxehpLBHASKPfAD8+tKHgwm4RcTlBw==
X-Google-Smtp-Source: APXvYqx+cHz8q5EP3Nl248rDH5+9yKyZOEZH6I3T1+KhPmpO6mTORqbQWVIORQg+2MtPoXgeClbCG0k4xhRdmPE3Nqc=
X-Received: by 2002:ac5:cde3:: with SMTP id v3mr378521vkn.43.1579513446738;
 Mon, 20 Jan 2020 01:44:06 -0800 (PST)
MIME-Version: 1.0
References: <9aff1d859935e59edd81e4939e40d6c55e0b55f6.1578390388.git.mirq-linux@rere.qmqm.pl>
 <CAPDyKFqXmbnH_NWZZTHHCE+Lt-f3JHAhJ8-=aoKNEPyQed44YA@mail.gmail.com> <20200117141145.GD26135@qmqm.qmqm.pl>
In-Reply-To: <20200117141145.GD26135@qmqm.qmqm.pl>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 20 Jan 2020 10:43:28 +0100
Message-ID: <CAPDyKFqmXiv75XCK6-tNJn5xTxyYpZcKRGKhvg-G0ycSZ_xw7g@mail.gmail.com>
Subject: Re: [PATCH v3] mmc: tegra: fix SDR50 tuning override
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Lucas Stach <dev@lynxeye.de>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, 17 Jan 2020 at 15:11, Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qm=
qm.pl> wrote:
>
> On Thu, Jan 16, 2020 at 03:39:54PM +0100, Ulf Hansson wrote:
> > On Tue, 7 Jan 2020 at 10:47, Micha=C5=82 Miros=C5=82aw <mirq-linux@rere=
.qmqm.pl> wrote:
> > >
> > > Commit 7ad2ed1dfcbe inadvertently mixed up a quirk flag's name and
> > > broke SDR50 tuning override. Use correct NVQUIRK_ name.
> > >
> > > Fixes: 7ad2ed1dfcbe ("mmc: tegra: enable UHS-I modes")
> > > Cc: <stable@vger.kernel.org> # 4f6aa3264af4: mmc: tegra: Only adverti=
se UHS modes if IO regulator is present
> >
> > I am dropping this tag, simply because I don't understand what it shoul=
d tell.
>
> It tells the maintainer that he needs to cherry-pick this commit if
> its not in particular stable version already. I guess this is only
> for v4.4, as v4.9+ already have it, and v3.16 does not include the
> Fixed commit.

Alright, I updated myself on stable rules and found this, thanks!

So I have amended the patch to add back the tag, let's give this a try.

Kind regards
Uffe

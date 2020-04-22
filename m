Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08EA51B488A
	for <lists+linux-tegra@lfdr.de>; Wed, 22 Apr 2020 17:25:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725980AbgDVPZo (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 22 Apr 2020 11:25:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725779AbgDVPZn (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 22 Apr 2020 11:25:43 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84038C03C1A9
        for <linux-tegra@vger.kernel.org>; Wed, 22 Apr 2020 08:25:43 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id u15so2748798ljd.3
        for <linux-tegra@vger.kernel.org>; Wed, 22 Apr 2020 08:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kcC+pbj4ZcfvbHCLZqUFTY0hzVPPKZG0teLtba1dQ4g=;
        b=E2AAI5RpkkNKxi6Kdo3QSl4i9u76CqtAS/il9w4uN0XNf3BZtYgkpj7Hr0PYHYchVA
         HaNeWUiG2uz6gUVpqUoUhRMnbtvxNXypxZ1F7yMYT3SXJbBwMvaxmMIf5cx9LCDHN/KO
         vVTaJthejojxugzarXvDN87O9Sya36OqRxYyUjiYVA49Fwt7+vwJbQO5Z6I8cqwG6MFc
         sKAlJGsRINwJAn3lB0icezjqH2Pz9JBU279E/7VUeXvcgfJsAHtrspsn/NRUKhFq05pR
         RPc+7LOQg2qmeZTCZaYV07gLixHJQslJX01xBFwf4oCLreHvIHg4f/zyxdi6qjSRInD3
         DKaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kcC+pbj4ZcfvbHCLZqUFTY0hzVPPKZG0teLtba1dQ4g=;
        b=DeI+0XmO7mSkZGXEzrJD0RhbpRivXcHQWWWHguJUhKJ0omnl0zpkGXPCgMXT8t4u35
         cx2m4q1FvfYB1OGzuAsR7N2akSM4P2fAaiqVljVI0hv23uSpiFFc3bACQQneIuPOxgi0
         J/XdRQ9RqwxrXZCGJS8G4Mr14ZC/xntf2uUHc8II8t9jwBDr4g9dXQ35k2sLpF3fnzpM
         lQt+UMaw4xfr6jnRJKt8Ld9cpvcMiBjiqV2J7KMjhxMPizoBhgln8exnqdju0e2u3e9n
         fNoTRJiOGoTqawT5+nqUqBQWL9K3xkGE2D+IEJrBXTptiDT7Dj1+hr7lkT/ejCrimk8M
         3u9A==
X-Gm-Message-State: AGi0PubdJ6N8i7/QuYSV1zdmjFufsxBGyelDorbWK+UKLwgHKkOjNg3k
        ozcuJxPY6Pdqyd8URoDYofWBkl4oD4Flmj7t0LpAEg==
X-Google-Smtp-Source: APiQypKP6nTQvKryk4pIL89bVUoyZiSqb5qF0boxlZav5xddJylw/En7b2au24RdQWtP46OYGuZ5g65rs3VOD5+WDWA=
X-Received: by 2002:a05:651c:32e:: with SMTP id b14mr16632111ljp.277.1587569141996;
 Wed, 22 Apr 2020 08:25:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200415122427.111769-1-linus.walleij@linaro.org> <20200421221503.GA3445172@ulmo>
In-Reply-To: <20200421221503.GA3445172@ulmo>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 22 Apr 2020 17:25:29 +0200
Message-ID: <CACRpkdZ2OBmejaGwjdpmJpZ0=30W2aoUgXrrX8xkmwps=MX3kQ@mail.gmail.com>
Subject: Re: [PATCH] drm/tegra: Clean up GPIO includes
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Apr 22, 2020 at 12:15 AM Thierry Reding
<thierry.reding@gmail.com> wrote:
> On Wed, Apr 15, 2020 at 02:24:27PM +0200, Linus Walleij wrote:
> > The Tegra DRM drivers includes the legacy GPIO headers
> > <linux/gpio.h> and <linux/of_gpio.h> but what it really
> > uses is <linux/gpio/consumer.h> since only gpio_desc
> > structs are ever referenced.
> >
> > Include the right header on the top level tegra/drm.h
> > file and drop all the surplus includes.
> >
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> > ---
> >  drivers/gpu/drm/tegra/dpaux.c | 2 --
> >  drivers/gpu/drm/tegra/drm.h   | 2 +-
> >  drivers/gpu/drm/tegra/hdmi.c  | 1 -
> >  drivers/gpu/drm/tegra/sor.c   | 1 -
> >  4 files changed, 1 insertion(+), 5 deletions(-)
>
> Applied, thanks.

I think I already applied it to the drm misc tree the other day,
sorry if that wasn't clear. If tegra has a separate tree I suppose
git will figure it all out in the end.

Yours,
Linus Walleij

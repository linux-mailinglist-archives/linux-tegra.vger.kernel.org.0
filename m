Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24588C9E69
	for <lists+linux-tegra@lfdr.de>; Thu,  3 Oct 2019 14:29:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728172AbfJCM3c (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 3 Oct 2019 08:29:32 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:46471 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727242AbfJCM3c (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 3 Oct 2019 08:29:32 -0400
Received: by mail-lj1-f193.google.com with SMTP id d1so2489337ljl.13
        for <linux-tegra@vger.kernel.org>; Thu, 03 Oct 2019 05:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WgYHmS7r859NIqwhlMr/aL4WtqMOd17kdDoCkThN2rw=;
        b=Nrf54SkH0pudOf3El9LkAkbdn4/X2GHAUtdkKMhjLr3GN7HXTz/V5k27kCd1nqf00a
         KQDsslm7RlVi3kQ7l4cbrcU7CmKgomrNi3KkUmgvc6clvnFZd75iEYE1YVMOgNNDEuZt
         7JeGUAkevH2yNlsulrkE780HktNRwyq839ofIWWdla+E1xaTd7vHDJbKJdpERCqXSiaS
         +ItuJNN02WITahRYVjaC2Pegvluj2uxb9/cksEAhVE1Xg/5xXxqs8iI5FG3NAlcSlIUF
         Im3aM65FANzrx0+jtvbxF678h3A5Ynt7IlhgySUiqreCOo6M1UzuRIHk94s/eyKe3MhR
         ipqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WgYHmS7r859NIqwhlMr/aL4WtqMOd17kdDoCkThN2rw=;
        b=VxG5AENwt3540lNG0z52ZG/lx5DvwEaiRf+JRViVDixHxQCPIJcYNNVu+V+be/8NMQ
         TAQnKjLw7y68B55H8W7zSLhnA20xY6/05mvQZv36PztMLzOVgGAFuGu7ScPrRmi2Wruw
         lr5n6ZnNFe0ttATdVRryMPH7StUUKVEP22GkJ0SsnmZmQtF7WS35uPc4VZGLPjQ8j9br
         EsjG1wYGwjD6rRjz1tGrClzdil15EG8xUlO3HxV5SCnYQql5jynraYQcF2tVIDyou8AC
         vtoxSwF8ijy59v4zn+ZZqEpf303Me8mxXxgAl6DFCNJT5TJ2qy53yCU/I7G+eyYjmoTH
         6NxQ==
X-Gm-Message-State: APjAAAV36RhCO04RyjTCMacJWZeUFFyVEJwnQswDB29kiV3C/6V2RIC+
        3MnEHtJDjjQ4Qc/w2343GrgHwr+tW6WLcTllLi8XLw==
X-Google-Smtp-Source: APXvYqxn5ElC8Y0ybDygjnv3KnDwo73oAd9wux/8cgfWp4cClYs65yIXnw/qzm1HYBbt7J7/ZGxIStbWKt4M09ACNi8=
X-Received: by 2002:a2e:5dc3:: with SMTP id v64mr6127763lje.118.1570105770223;
 Thu, 03 Oct 2019 05:29:30 -0700 (PDT)
MIME-Version: 1.0
References: <20191002144502.156393-1-thierry.reding@gmail.com> <30cf4ef7-f2d1-23f3-7018-5288b77e95c4@nvidia.com>
In-Reply-To: <30cf4ef7-f2d1-23f3-7018-5288b77e95c4@nvidia.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 3 Oct 2019 14:29:18 +0200
Message-ID: <CACRpkdZUri47C4nBMufkVcDd-GP1FjVm9wvfk4hfPWOMytMxVw@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: tegra186: Implement system suspend/resume support
To:     Bitan Biswas <bbiswas@nvidia.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Oct 3, 2019 at 1:59 PM Bitan Biswas <bbiswas@nvidia.com> wrote:

> I see jetson Xavier RTC wakeup test fail with this patch. It no longer
> reaches the UART shell after suspend exit. Jetson-TX2 works fine with
> this patch. There seems to be some hang on Xavier.

That sounds like some very typical situation where you need proper
wakeup handling, so that the chip does not suspend if any irq lines
are flagged as wakeup-capable and in use.

Yours,
Linus Walleij

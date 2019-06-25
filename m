Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29A3555075
	for <lists+linux-tegra@lfdr.de>; Tue, 25 Jun 2019 15:35:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727457AbfFYNft (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 25 Jun 2019 09:35:49 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:43189 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727217AbfFYNft (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 25 Jun 2019 09:35:49 -0400
Received: by mail-lj1-f194.google.com with SMTP id 16so16271704ljv.10
        for <linux-tegra@vger.kernel.org>; Tue, 25 Jun 2019 06:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LNNmQTfIlzQuDgTC5ei3H9ETde7eJzjmzMbU2CxKSjE=;
        b=ntZynf9bcH8jGjDwIUy0JRD+6Gp17iGbsypuqzn5XroShu4Yp/Kfx8Uj28d8lmrvUN
         0146jfRJdVcMppZyb2iWTsqX0hddsNEqzlN8ZxsibGEk63m6Gg18huHb61J5Y3E6VA2V
         pS6ojXsG3yvypTPmtR0ydZpHFsJY+qJIM76/OSKvicRA7UolsgIYpCL+3E0ge4FQeUgg
         hcW5WZbSOZCWwcMIBMucNdU/0UfQCGpyaFU5YZl9KEUlFQbXOprRNQy3zFpqf4OZoFKm
         tEbLUKN28/4xaQzYjfDnBps+7nTHcLA+u4zboIBF4gBU+GRYmkx5HcdqEcyNr9pEZIsV
         ARXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LNNmQTfIlzQuDgTC5ei3H9ETde7eJzjmzMbU2CxKSjE=;
        b=cFa/eKTe5Xdtw1RPjG2kNPNh+nPtW03En3Zbhu3uL3bPkhAiRTzBGK0qNuac0V3Pyj
         QJS1zdyuux4bAbfPS1O+0dSiO1oBBa0Dy0BIc+n0EszRwClbSk24+1ALJocgHgItPU9r
         itV8BWJKlOTvD5yJ6GU6EVLsyP5qBMeCdlDfaaJgRwtafo+qN4YrLPbJLMxvUjtvQ7Xa
         zRR/ZlWBIMJYsrHbd6qsJOlXjFc8sGo8BEUphg5ox6Na0vL6GGM/G9kVJyBkMCR265Fj
         wWZnqrTvwQm3jr8m4XIsYJ4qwdhu6VWNKWpkoBKHz/MF1wo0UpQ7bcgwQtdhoBxZBLdK
         YUFg==
X-Gm-Message-State: APjAAAUyaqHQ+gheIvERfNmorFvrNlESDBKfpvhikxcopz9PXqa8eeB2
        qz01sE8fWaFoyWnToBOPlZ0RusI3KFD0L5roZAEvQw==
X-Google-Smtp-Source: APXvYqypYw1IIjnPFxEylpmpLMGT1V68vGpGqQOvfoBHBYBtnsJiGwhJLZContp+UfuiOeyPx2/CtaujN2XPNAd81qw=
X-Received: by 2002:a2e:650a:: with SMTP id z10mr44534332ljb.28.1561469747585;
 Tue, 25 Jun 2019 06:35:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190621151932.20662-1-thierry.reding@gmail.com>
In-Reply-To: <20190621151932.20662-1-thierry.reding@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 25 Jun 2019 15:35:34 +0200
Message-ID: <CACRpkdZ+3Cz4mSjNO3fgHRyguvbNhwfP+iES__e83SpNADL57w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] pinctrl: tegra: Set specific GPIO compatible string
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Stephen Warren <swarren@wwwdotorg.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Stefan Agner <stefan@agner.ch>,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-tegra@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Jun 21, 2019 at 5:19 PM Thierry Reding <thierry.reding@gmail.com> wrote:

> From: Thierry Reding <treding@nvidia.com>
>
> Rather than reuse the nvidia,tegra30-gpio compatible string to find the
> GPIO controller on Tegra30, Tegra114, Tegra124 and Tegra210, use the
> most specific compatible string for each SoC generation for consistency.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Patch applied with Dmitry's ACK.

Yours,
Linus Walleij

Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE9865507A
	for <lists+linux-tegra@lfdr.de>; Tue, 25 Jun 2019 15:37:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728484AbfFYNhP (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 25 Jun 2019 09:37:15 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:43306 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726421AbfFYNhO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 25 Jun 2019 09:37:14 -0400
Received: by mail-lf1-f67.google.com with SMTP id j29so12639168lfk.10
        for <linux-tegra@vger.kernel.org>; Tue, 25 Jun 2019 06:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+YW/KvD21S7dTueZqvi4PzPDxvm5Nz0P8icQCvj/V/Y=;
        b=xnIGqs6POFy9pHKSDX+/OlmWZQJ30txkC6JeLn+0DGczGQNMFl9bAb2gXDgBzeTHo5
         uGR2NTk4YPf6AfO6wBQ2cBdT2ZoFNgZ+3cYRAlZvxQYtLhEcE5wPlfURQ+fgb0WFVBGf
         HvBAiHtZWO/8CdwZS2j/agXVoTeUSD50Zcr4DS2Kpgc0/3impfScBTAwJWbLAnp4nY5s
         fPxyCsph/uKPgKyG7fOJx+TZx1a7F12KGG2JNzlZ2z2rLY99bQLVbuJHLwDoUKYXVldz
         E34P5NUg1Q0yUV8yUNN0Pe4anWJTogA2yNFaBwrhvCCdRyJ9iJ0eQlpNhqt+HRxRTA0R
         oqOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+YW/KvD21S7dTueZqvi4PzPDxvm5Nz0P8icQCvj/V/Y=;
        b=ANFl3o6tCx3LRKK49vUwIHkCYqCVF7SrSCnDbCbKCCE/tOyLSqbYarF/C+ey/hmesg
         xlPE2kYfb8wK/Q83nnVww2h5HtJKXszHnvldHmbosL8HnvC/cUKdwKi+T/R+qUB1ptTW
         EAIVhdrWQAI6jgdMs2W3WP9ubj++GdZQ9kn4do7PyIXMlw6W7rke4G1JZjwc+cFKrvso
         +L62VqwN+tYTw9VwHyTVolYsSjFEJ2sCRmFFiqDfN6YFUsxTHEKskC44+WonGbdQnv1A
         /pYnKxYr688GNYa8K/Xqe3OTr77lzZsdmhSYZZWvRh2L7W3ttF0F+qd7fGxaBRkzunG3
         Yk1A==
X-Gm-Message-State: APjAAAWX8v/h5hKx1zyQ5qqnitjdvVsro/gUQ4+4lGFQbsIrYObJd8OF
        Bgis+YG6RJJQd8B9417rGQNu9AL+nJqZBm/TirleXA==
X-Google-Smtp-Source: APXvYqw/dcdizd0Y2/ndPTSsA7zRCo9nBDtU4Gk2oprHrhR0QAXEdcjOtjZAGAqCZjwHo4lc2JEtUJQbkmnoZCtFSls=
X-Received: by 2002:ac2:598d:: with SMTP id w13mr206035lfn.165.1561469832888;
 Tue, 25 Jun 2019 06:37:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190621151932.20662-1-thierry.reding@gmail.com> <20190621151932.20662-2-thierry.reding@gmail.com>
In-Reply-To: <20190621151932.20662-2-thierry.reding@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 25 Jun 2019 15:37:00 +0200
Message-ID: <CACRpkdby=J4OjJcuyzRrKEbqGL2vG04_ygrOKdHpYF9M63y2Cg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pinctrl: tegra: Add bitmask support for parked bits
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
> Some pin groups have park bits for multiple pins in one register.
> Support this by turning the parked bit field into a parked bitmask
> field. If no parked bits are supported, the bitmask can be 0.
>
> Update the pingroup table on Tegra210, which is the only generation
> where this is supported, with the parked bitmask.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v2:
> - write to mux_bank/mux_reg or drv_bank/drv_reg depending on pin

Patch applied with Dmitry's ACK.

Yours,
Linus Walleij

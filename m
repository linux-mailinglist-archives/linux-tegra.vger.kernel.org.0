Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BD45195578
	for <lists+linux-tegra@lfdr.de>; Fri, 27 Mar 2020 11:41:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726333AbgC0KlK (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 27 Mar 2020 06:41:10 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:42498 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726612AbgC0KlJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 27 Mar 2020 06:41:09 -0400
Received: by mail-lf1-f66.google.com with SMTP id t21so7419881lfe.9
        for <linux-tegra@vger.kernel.org>; Fri, 27 Mar 2020 03:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JKXUGTWGrmrzZouTGYvdipQ1oDPszingLmWAZ3pe6+Q=;
        b=E37mXowJedBN3g7r4CBzWhSnSZsCAkLpZTZ6JsVNWEVVEi8K7WFf3usHnuCOO0FMYh
         VhBUGJqNGrrV65byul0K5xtnPlw/jBJ0sNOnejM5QdMM4ISJvRXtZro4WZpq/5aF+aUi
         iJm+27yueChoBvjEY+HCe+LtL0WKyGtILZCbtSjAD6zDuOheOiUNUE2MAoEnVlCUo10r
         8GDNJ2CZarWXpDek0HWK+bHhAYnzYT6W17nmn9IkDzWFtcALq9cFrtb8AzuCrTmdv5fx
         Sxc5FgbrzIqTGfSCczcQuXRoJHpbgJx/PwIV2q2O7pxa+KSHPT83+xaBqmHj48s7qmWk
         X/FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JKXUGTWGrmrzZouTGYvdipQ1oDPszingLmWAZ3pe6+Q=;
        b=lFDhUqmKu+H3jB+Fro18rBEYoisB9zo8hyaG5LJtPUU8QBPZqJIvD4A6itTymIBGIU
         hOmGK1pwlPx4KRyEAW0zvWTXpVmKtMvypu7sXVQJCNelsOYbMRhf8LBHrecQ8cEY6gdd
         D/qSZ4CTfqZZkoHXheDNKWlYLRwIhDNkjrPKWHc7QIwH9SjIL5z16h+5xFgIPtd75Z0e
         X4DhPY0s3IyL5sT4TV4cgBHec2B/ZZu6h2cwI5Yp2xUAAweJCyWi24VvMAvJbnUcbXQx
         QKexUsRfgcaSbNiEJZdIYYO6DrU1j76TFGnqgD82Z204VRjSG0oVlDTIwqbvXNK3km3f
         AoIA==
X-Gm-Message-State: ANhLgQ0lq3xbUDpJsx+Qw5xK5MCJjIyMsTGnELycIsk9pRf1TxZpJAdx
        2c2XdZLEU6MOZGYZ2Z91iMl1dsLmeNUHNy20Nt26cw==
X-Google-Smtp-Source: ADFU+vsrY2h9eWO2RrILLXv3LgMODO5xOQkA7pw+YJNyEjo8ENEKgfJVKuZgee4wlNZbvBdRczOR5cilisGDjNot9rU=
X-Received: by 2002:a19:ac8:: with SMTP id 191mr8729171lfk.77.1585305667253;
 Fri, 27 Mar 2020 03:41:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200319122737.3063291-1-thierry.reding@gmail.com> <20200319122737.3063291-5-thierry.reding@gmail.com>
In-Reply-To: <20200319122737.3063291-5-thierry.reding@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 27 Mar 2020 11:40:56 +0100
Message-ID: <CACRpkdYfc3XHTdffbRWQmK9eOB=FtSX0iE59yFgdp=zRhWgtfw@mail.gmail.com>
Subject: Re: [PATCH 4/9] pinctrl: tegra: Fix whitespace issues for improved readability
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Mar 19, 2020 at 1:27 PM Thierry Reding <thierry.reding@gmail.com> wrote:

> From: Thierry Reding <treding@nvidia.com>
>
> Fix a few whitespace inconsistencies to make the code easier to read.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Patch applied!

Yours,
Linus Walleij

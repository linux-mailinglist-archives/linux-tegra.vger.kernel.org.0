Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 552FF61325
	for <lists+linux-tegra@lfdr.de>; Sun,  7 Jul 2019 00:34:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726673AbfGFWet (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sat, 6 Jul 2019 18:34:49 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:42376 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726734AbfGFWet (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 6 Jul 2019 18:34:49 -0400
Received: by mail-lj1-f195.google.com with SMTP id t28so12363269lje.9
        for <linux-tegra@vger.kernel.org>; Sat, 06 Jul 2019 15:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dLgw/xR00Rr0ulhIzOABkbpz/zSiCLJleiWD8vd5tcg=;
        b=jEQXswWhcYyBI2kICuWjcqZ8qlrjejgxySrCHGjgjHLp8PnD7krqad3WkJ8xReW61Y
         1hQNCTuxFppFbD4mgAFO5nQicCKWYeNOB2OO/NVOFdNyF6tzkjozA2ul0ShgJc/Zyo9n
         N8+H0zy3Ze7bt+RXNx/9lBBo5nNXommXKO0LwwEqMYF1BAu5hJkZMp9UHAp6m6czyDuY
         Ax6y0NoSPrOhMImI0xTL8ML6u3sFnuGsaD/f8q+7Rx3/rM/eNZyK1pIO/p4nj98HRgL3
         DgRt9NeDYk86uzsxaUhglTNrZVZ8T3CVvZ8zNNyQqPdWVlV7ett6l9A511QUhbnduseu
         srJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dLgw/xR00Rr0ulhIzOABkbpz/zSiCLJleiWD8vd5tcg=;
        b=V7gwssagYCZ/pFwrZpvKs7dAO3pdjT2jUa/qmkZEf4YuTWO9YGY/Og0eWzu8ac/2fD
         izrUDlTIBZSuJ+ldTBUDyAuLfAa+lqGxMV0v+wUp5KFcleJEHgeblEmlRlTnc4VJJFwl
         OMUGEhNPfcAM/nanFsk00tObeq9fnS+ol0D7faYLvydkjoyydrIknn86GY1DHWqNrtYx
         kKmlw8DNx2lwwDhNg4oQHOceYrJRMwJmoBnT4MNAN3RtzNGeCjAhS+SM403Md84Ccxv6
         Gsmaq675rvNYBqM2ohTXeeoZIVhQgcQU6xYZZFLRjYszXhduXZ2dLu3LekXz4d2mUq9n
         Dgow==
X-Gm-Message-State: APjAAAX+KZ63r6YMzYFccB/jzVXziRFZ2GsB1V7DYC68ly6ksvFY2+F2
        iUv5bQeihB2mtmt9OTf/XU1g6KrECCKLWva2l34CFA==
X-Google-Smtp-Source: APXvYqx13cF2PlmOp1PXhyDx6OecBtpXWBZN1yq1vnMDfsUTnM3Hdprtb3l623OoOJwZ/o/YlJlhAo+9QwKz/g+KDGw=
X-Received: by 2002:a2e:a0cf:: with SMTP id f15mr5997493ljm.180.1562452487644;
 Sat, 06 Jul 2019 15:34:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190705123220.54008-1-yuehaibing@huawei.com> <CAMpxmJVZHJKQ7bbHo=T9R99qguF315bZ=YVRrCdqti2SyzAnDg@mail.gmail.com>
 <74ffe8ea-e6fb-bd2a-42bd-08392eb27c69@huawei.com> <CAMpxmJUeg1jVZdCeiRqTZykBZNPGAeQkaNfA7qc1zt+sL9HPjA@mail.gmail.com>
 <CAMpxmJU0=w=htiY3CL9GDBU+waBjV0X7yh1UG6ip5BiV3J7nXA@mail.gmail.com>
In-Reply-To: <CAMpxmJU0=w=htiY3CL9GDBU+waBjV0X7yh1UG6ip5BiV3J7nXA@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 7 Jul 2019 00:34:36 +0200
Message-ID: <CACRpkdZikRyZtbYajc7gN0N6xRoCQpGGVO9rivwuG6-AeVo1xw@mail.gmail.com>
Subject: Re: [PATCH] gpio: tegra: Fix build error without CONFIG_DEBUG_FS
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Yuehaibing <yuehaibing@huawei.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Jul 5, 2019 at 2:59 PM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:

> Wait, nevermind. I think that commit a4de43049a1d ("gpio: tegra:
> Clean-up debugfs initialisation") is wrong and we missed that. Linus
> what do you think about reverting it?

OK I reverted it.

Linus

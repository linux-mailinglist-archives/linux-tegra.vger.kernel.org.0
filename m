Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E95A52FA511
	for <lists+linux-tegra@lfdr.de>; Mon, 18 Jan 2021 16:46:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404949AbhARPqs (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 18 Jan 2021 10:46:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405984AbhARPd2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 18 Jan 2021 10:33:28 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01EA2C061757
        for <linux-tegra@vger.kernel.org>; Mon, 18 Jan 2021 07:32:46 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id n11so18653875lji.5
        for <linux-tegra@vger.kernel.org>; Mon, 18 Jan 2021 07:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bBQOG7vxoM6QNk6U3xhAhy3xS9YtkVdNjMmBgzCoLbA=;
        b=Cuhm6Se308oUzIL+drXDZ+cwNnuIbBlps5d6xsRssecTHpjtgiuTXzQNDMhO0JY8bt
         YszIfLR3A3eKvExUZO7VBnhwcWQLm4D59sAQxyW/hIP/kQgjZCk8tQ5PDNc13t6+Pjq2
         Vh2K46SLjz1jIHAb14v74cfZz5YTawi+sTQT0gvsUXqFXvPCWOb8sojcejX4G7GTL5js
         Bd/uigPucj6wczJhxvWhiZVIXVP0bGt43r5NBfHeB5VzWWXtgTsFR5ONsoTUhbOBSSTR
         Yqyr/24gdZ0l4L5em2Zv2771xtQG3Twi+luFDeUk6OY04kZGRj5BKfmldGwrSqYUNl98
         X2lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bBQOG7vxoM6QNk6U3xhAhy3xS9YtkVdNjMmBgzCoLbA=;
        b=D251V43uS8IHQVTp8YEzlmxfPnKivQDUdee98+npJNvx4OqhkkE4cljrBnIU5taDO1
         KM6A2htjEbFO9kuWWZsdyMZQZJ2reMmmijip1oDbGcl1g85ANltvGJni8SOflYkZN4JU
         xk6hPCEeyrlCWC4/esUo9T+nbwdSHD5JkSxR0H3Xp3oPw/j/QxdZEvfPrevpoVC7uiQp
         3IKWy01X8o9DCSIKvvhEBfZkI6Vf2SLIyUBbkzw13AkFgNZfz8mUa2U5DAqA+qVGvlMP
         JZ5flT+Rv1Q12r2Iya6xjnZqoXK5VXlfzIY8n36dTok5IbQ7eyD8QSVXw4U3JsssfEWz
         UTkA==
X-Gm-Message-State: AOAM5319QIyMT/S/eBfu3+U4h1WgEcpG8KkmHpNkbbg4IUsnzaBvmFxu
        CAy3A4ajzxyocd3RGu5t2xHwtvq9qM+JCtYEZz7+Xw==
X-Google-Smtp-Source: ABdhPJx4ZdzRD10FhfCcqPFhhRv+irScAwpmWxe4JltyATFb4F/WmkBfnmVNpRmz04RW1/5GvimIWM/NJ/EbS4tq3uM=
X-Received: by 2002:a2e:586:: with SMTP id 128mr85874ljf.273.1610983965379;
 Mon, 18 Jan 2021 07:32:45 -0800 (PST)
MIME-Version: 1.0
References: <20210115210159.3090203-1-saravanak@google.com>
In-Reply-To: <20210115210159.3090203-1-saravanak@google.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 18 Jan 2021 16:32:34 +0100
Message-ID: <CACRpkdYrzaFuWkbTe7Fmos4Bk4Ojt6wbqayDjyrS7sf98P-Rbg@mail.gmail.com>
Subject: Re: [PATCH v1] of: property: Add fw_devlink support for "gpio" and
 "gpios" binding
To:     Saravana Kannan <saravanak@google.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jon Hunter <jonathanh@nvidia.com>, kernel-team@android.com,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Jan 15, 2021 at 10:02 PM Saravana Kannan <saravanak@google.com> wrote:

> To provide backward compatibility for boards that use deprecated DT
> bindings, we need to add fw_devlink support for "gpio" and "gpios".
>
> Cc: linux-tegra <linux-tegra@vger.kernel.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Fixes: e590474768f1 ("driver core: Set fw_devlink=on by default")
> Tested-by: Jon Hunter <jonathanh@nvidia.com>
> Signed-off-by: Saravana Kannan <saravanak@google.com>

"gpios" is a valid non legacy property I think.

Anyways:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A893195580
	for <lists+linux-tegra@lfdr.de>; Fri, 27 Mar 2020 11:42:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726275AbgC0KmY (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 27 Mar 2020 06:42:24 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:44760 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726215AbgC0KmY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 27 Mar 2020 06:42:24 -0400
Received: by mail-lf1-f65.google.com with SMTP id j188so7421564lfj.11
        for <linux-tegra@vger.kernel.org>; Fri, 27 Mar 2020 03:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Gz4qI8nVDNtgAJIn3APdRtkA9hlMMni4Oiu4B88S9gQ=;
        b=sQQVS0qi0De31oG2mZZcsnRlccamh9SBU/YMlszwhQAgraBAaMWwmlz0gm5N2nLF71
         UvfRQVItizDv0yu1x/jGUq7URTuAP7B0uoVZkHhdPD5cY8ZS2tb9suImw8K0F17c12QI
         cgF2sNtAFc45GmNb9pVFJgg76N4YSARCOVR/6/uT9Ub2IJXWUq9LoTvN9h9mWM41Yk3H
         CnQZmiQwNvr++SCDqE6Lo56gSII7mjL2/A93yJrWufvNCuX/uVrO1e7YYe16dacUnxRI
         y2GlsolAkTTkK5OgaKypiZxToDRjeM8P3bllCrYnobZ8DgKNPPLZ0WH6i3OKSQbw7TqQ
         Uf6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Gz4qI8nVDNtgAJIn3APdRtkA9hlMMni4Oiu4B88S9gQ=;
        b=JgBRCdjsuEfAUip8SnX2kmfQ0q4aAe/kslwQ1ufEaf38udNqTFb3HUY+tZB7YMfCln
         3BddKEDm3qaO4qjCkYL/LNEEf0LGuy1CjT6+rdH6VdsVkxw8E/akHZkJxuPjEclYWY4J
         swMOQmNSW+8SPE7UltUGEOA+lrG7sX02XKS8XPLrMai7YRdMprMAAFbm+gOSsuxkQnW+
         mDoQuH2ObQFHxFa+qnU/pkm5JIa7fagQXcatIZsMJCb60Ga7gq4fyVFttJlyzyNUxVTA
         PyajAileKMG/CSMv5K5K0pacytA+vj4dyh2N/x4U2iKDdgBnI+gxUpm4W+mYaiv/8aSK
         uOcA==
X-Gm-Message-State: ANhLgQ2tZ2biz0jrRLnzv7jRazDNtZy/n5vMZTDvxw0Rm8KI/Ae20bzO
        OkHdT7FnF8T9/PolG76QmfMJu96AlsFGFqfaVkcWcWTMuKU=
X-Google-Smtp-Source: ADFU+vvOV9nZ6aMz+8cfpoSBwzxsI5xEKGvfY4juq3Xc509inDqGUOyApfWhmV/t0OdQbUxH+yUD/rg9O6tRKRJQi68=
X-Received: by 2002:ac2:5b49:: with SMTP id i9mr8781324lfp.21.1585305741942;
 Fri, 27 Mar 2020 03:42:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200319122737.3063291-1-thierry.reding@gmail.com> <20200319122737.3063291-6-thierry.reding@gmail.com>
In-Reply-To: <20200319122737.3063291-6-thierry.reding@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 27 Mar 2020 11:42:10 +0100
Message-ID: <CACRpkdYnk4yqqSj23FersOYZSLdExAyjV=UbwKGcDMBcxJBKDw@mail.gmail.com>
Subject: Re: [PATCH 5/9] pinctrl: tegra: Fix "Scmitt" -> "Schmitt" typo
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
> Properly spell "Schmitt" in the kerneldoc for pin group definitions.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Patch applied!

Yours,
Linus Walleij

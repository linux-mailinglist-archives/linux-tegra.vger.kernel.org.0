Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B95881556
	for <lists+linux-tegra@lfdr.de>; Mon,  5 Aug 2019 11:22:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726423AbfHEJWH (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 5 Aug 2019 05:22:07 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:46888 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728077AbfHEJWH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 5 Aug 2019 05:22:07 -0400
Received: by mail-lf1-f66.google.com with SMTP id z15so53073792lfh.13
        for <linux-tegra@vger.kernel.org>; Mon, 05 Aug 2019 02:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i+z4lSjOxQUNDZN2mh51y0IZWLo2k0BanjlxnQYRJuA=;
        b=Gnj63riKfzJsrzh8xPg3aqiNZgDp/vGc88L93J5Pa2q0LD/65jeCf2QdkuyKph90B9
         YhiRUsFlshUfddljpw9qXc//8xZ4c0vcNXw96pjPia27pyKC81Bzgz//TgPLoEFh/36I
         RmwXOIFzF2nE4ltwyH7Ho7G8NnhCszXfpXAzNQLm6NG6Q1jGFeOjqYQtLwVI6lo6jXwP
         vZF5herXZs+vTfhzk5n7Kp8CPf1MzdYVZ3W/ZBhSsMwiuV4JgooA6du2iD8NYKKE57im
         RIlS1yKpCXNOGc2rqW7ndzlW9dJAzrWN4aGfiVhMphXElTC24RjXL8ZcY+93gnhAxt1B
         Rzsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i+z4lSjOxQUNDZN2mh51y0IZWLo2k0BanjlxnQYRJuA=;
        b=WawxAQZxZui0+wFC3/HhCdgHbs5eNPfx2iwQ9l9Oxdxc0KCexlYwldfp5Q3ZqDAB+1
         y0f3+QezYCDWhhKyro1QvYdUmVhTrq6ZJ4aWFCZgajSWKqMOZE90nzjVpW4VaoZU9Qem
         9qOUnpB6CGHE2b/08252wdDb9taZUwQ7XO7gaLqi3a+PqLMEEg1UION9WQZgsOlzW21a
         M79qapEm8rpve5E5FSpCyW54kQIhFLkphEV6LbVDlN7nCwxvaU+rVTh8Gx2qSYJ9Fe1O
         AP5WpenfGSAG2/2yeI0ts7anSmwn9ipsZIkEh8AVGoDnADJvvI2oNHUWcAEA3NilB0iO
         XPxA==
X-Gm-Message-State: APjAAAUJdhBKfdJM9ZqJyN108m0Nm+uv7iYreZzEXTBKR8iyOomLWuaU
        Ww3ZAu4e2rHXcUuV8wVZUrbnb4uCBM3krz1W5by2ug==
X-Google-Smtp-Source: APXvYqz2gBmde6Dsxx99OmimcqgsMkcb001POQdrR+SnSHDBMNEIgv6BbXV64CZhlMwRFUz56G6ingA+UAUFVlhMbw0=
X-Received: by 2002:a19:ed11:: with SMTP id y17mr1689568lfy.141.1564996925905;
 Mon, 05 Aug 2019 02:22:05 -0700 (PDT)
MIME-Version: 1.0
References: <1564607463-28802-1-git-send-email-skomatineni@nvidia.com> <1564607463-28802-3-git-send-email-skomatineni@nvidia.com>
In-Reply-To: <1564607463-28802-3-git-send-email-skomatineni@nvidia.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 5 Aug 2019 11:21:53 +0200
Message-ID: <CACRpkdZ3FnF75DLH0+0sfKf3JKY=1=OOZVDpmYjTHNqN5yNP_w@mail.gmail.com>
Subject: Re: [PATCH v7 02/20] pinctrl: tegra210: Add Tegra210 pinctrl pm ops
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Stefan Agner <stefan@agner.ch>,
        Mark Rutland <mark.rutland@arm.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        jckuo@nvidia.com, Joseph Lo <josephl@nvidia.com>, talho@nvidia.com,
        linux-tegra@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>, spatra@nvidia.com,
        Rob Herring <robh+dt@kernel.org>,
        Dmitry Osipenko <digetx@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        viresh kumar <viresh.kumar@linaro.org>,
        Linux PM list <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Jul 31, 2019 at 11:11 PM Sowjanya Komatineni
<skomatineni@nvidia.com> wrote:

> This patch adds suspend and resume functionality to Tegra210 pinctrl.
>
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>

Patch applied to the pinctrl tree.

Yours,
Linus Walleij

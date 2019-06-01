Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65EB832019
	for <lists+linux-tegra@lfdr.de>; Sat,  1 Jun 2019 19:25:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726246AbfFARY7 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sat, 1 Jun 2019 13:24:59 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:43085 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726143AbfFARY7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 1 Jun 2019 13:24:59 -0400
Received: by mail-lf1-f68.google.com with SMTP id d7so896389lfb.10
        for <linux-tegra@vger.kernel.org>; Sat, 01 Jun 2019 10:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cuie0203UXl1EhtYs+4s8DTcltYAks3UNrsXRKDCuXo=;
        b=XPmBq1NBztKl9h2OOkgjFr670HW0d3Fst639RYgRfAhNmUKHRr1yLI55TperxgF7X4
         E0E3jutauutH4fLPWST1kn6JgAE1DFEJq+Je90Abqu8BJFPnB1bherfdKjCg+uM4D+iq
         /HuKazRmqtZrXX3SzlpM9g2ITI4NicyvVjjY81FB3/2aE/A/NrknoQlIA5483bcccQVZ
         SEvSxugbl5JWwRlrnWQr10as0cXiJ0ASRkHk0HdqsmJDQV+m+HaIh9PeY2scc+MguR5A
         3jgGQl3QNPPz4XZjk0KliN9m0qSfgR7TM4yIe0VaA2PnjAOYIWUoEcjl9xp3kvQwgjhj
         E43w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cuie0203UXl1EhtYs+4s8DTcltYAks3UNrsXRKDCuXo=;
        b=dWQ8zOlzjCq7D3Kt3mkfgJiR6MrLQtC6hgzTalCFMgnchg43K6WQhE1GR3rVB6C2r4
         tV1GH1rfCJ5zYSyyhsZY+WB+UJyJMnXRq5iwO1hoWxwsHdHQ5n/r/4NaaCr4/mAXbObY
         d7RT5BfA1yD3zi8ebyL4cLvDQnVkFUsG4kNI6sO67xiAU8oooykjpS6oj5+m16iWLibz
         LUXsDZExExGjl3+C7Z67uOFig1XUJzL2yoUhP79/UUxgYaaGjj0LcC1pTRAhxu6yz3eG
         VjqCPYidkApozW4fKXMiorqFKqDWx5+g2NSCA5slaw9Tsz5LvmCWd7IzO1Oo8dQ2Q7UB
         NJSg==
X-Gm-Message-State: APjAAAWFFPXF/NfIAIn0HoLBnTE9iv/pFWjg1pg93T7w3/PNHCdr5d0N
        Vf1LRFzDGj3o0D4rO8e0wnSjWmRxmav1s3xourjGow==
X-Google-Smtp-Source: APXvYqxb3y703ROFiT/Kq4eV8XekHFlVPe2tMH65/jmgknO5EWQZHb0HYAaMXHfSQqrbXmFPvFCj9gTMQrSPEx37/HQ=
X-Received: by 2002:ac2:5382:: with SMTP id g2mr8983626lfh.92.1559409897755;
 Sat, 01 Jun 2019 10:24:57 -0700 (PDT)
MIME-Version: 1.0
References: <1558007594-14824-1-git-send-email-kyarlagadda@nvidia.com> <1558007594-14824-3-git-send-email-kyarlagadda@nvidia.com>
In-Reply-To: <1558007594-14824-3-git-send-email-kyarlagadda@nvidia.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 1 Jun 2019 19:24:46 +0200
Message-ID: <CACRpkdYyOxYkiYXufUVVm3-v2a6xUGxS=DnqzAR_bdARspW5Sg@mail.gmail.com>
Subject: Re: [PATCH V3 3/4] pinctrl: tegra: Add Tegra194 pinmux driver
To:     Krishna Yarlagadda <kyarlagadda@nvidia.com>
Cc:     "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Joseph Lo <josephl@nvidia.com>,
        Suresh Mangipudi <smangipudi@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>, vidyas@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, May 16, 2019 at 1:54 PM Krishna Yarlagadda
<kyarlagadda@nvidia.com> wrote:

> Tegra194 has PCIE L5 rst and clkreq pins which need to be controlled
> dynamically at runtime. This driver supports change pinmux for these
> pins. Pinmux for rest of the pins is set statically by bootloader and
> will not be changed by this driver
>
> Signed-off-by: Krishna Yarlagadda <kyarlagadda@nvidia.com>
> Signed-off-by: Suresh Mangipudi <smangipudi@nvidia.com>
> ---
> Changes in V3:
> Fix build issue observed with previous version

Patch applied with Vidya's Test tag.

If the maintainers have comments they had two weeks to answer
to the patch and if there are still issues I am pretty sure they can
be fixed with follow-up patches in that case.

Yours,
Linus Walleij

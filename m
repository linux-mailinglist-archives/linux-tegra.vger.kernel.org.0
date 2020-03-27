Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03492195582
	for <lists+linux-tegra@lfdr.de>; Fri, 27 Mar 2020 11:43:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726215AbgC0KnY (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 27 Mar 2020 06:43:24 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:41055 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726165AbgC0KnY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 27 Mar 2020 06:43:24 -0400
Received: by mail-lj1-f196.google.com with SMTP id n17so9662914lji.8
        for <linux-tegra@vger.kernel.org>; Fri, 27 Mar 2020 03:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gGweN2r8TjMFH3IfIvty58V3F7Ai81F341U0IcKR6Hc=;
        b=nxfsSmbAb/4Pd+x7PPLTtw039k5lKuqneDUS4F7ft1vmWB9yhvZgHRCz1i4i38OIaN
         EyAX3tEGLo6/TFeYEqpzfvKWt9iGrPNINWd+KoypkiGxKUFH1Zrqc/1QprwyNzOjZOjk
         iwCdoyRVlegzitWEOqbQ6ZzBmNN460j/tMkuRIvrVLAHAQQW6KiNw4R3eC2vA19X+LYr
         e241HNbRGvW6egBYPbvNOgbylRize7sht9t59neLzG5RHZGkCqca8NBBNnoRBqGP+UM3
         3WXaBzf3BsTMemNiwdG9dtzBfxNvbyv8elQ5W+B2Sp7IKc+LbsphbTLWR56n4ml1JMlp
         I/pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gGweN2r8TjMFH3IfIvty58V3F7Ai81F341U0IcKR6Hc=;
        b=lYk0aOhq3+182sJwFSpglw8VpGKJMG5Ul3haRqAKPeeg6VuQeGtJxicKx73gpK9JLJ
         V30pHHFDxXdtYN8dewPIbiX/28hMjTLmsGEj/8IyMv+UHExMM1zyf8L3yKNdpYElxoNi
         1TjO7tKSSJ2feE13MUD/aSjkxQTwEx43oA7W2PqpkDu1Sgu44lAZfzEa/VHGcQP+n22r
         2/IVunXhVP+mnYp8hogwXZybuuhPdq9lW56KuWb6GLi2jbtFigEU9TG76x2WVKPd6BQ5
         3NrpnDOdgg/hPotLbIVhROLTyzfupglJa2li1YWcuqkgM4B30crav+fXro83EQ0Tiy4T
         yYJQ==
X-Gm-Message-State: AGi0PubBv5vqVd76ICsfmLktSh/RWHZGd7C02h4SbIShWMBaeFHZ2Etl
        Vi2fKBzyQWDinciN3vpW0hVV9pWRQ/VwLOtIoGfIBg==
X-Google-Smtp-Source: APiQypLh7fBV9NQWImaezbfOsDrV0O12vQmwwdxFflIcJocKHieUYtp/LlNpuMnKTTd+U1ITc+ub5x3qcrQfQrJoMtA=
X-Received: by 2002:a2e:9084:: with SMTP id l4mr3160955ljg.277.1585305802208;
 Fri, 27 Mar 2020 03:43:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200319122737.3063291-1-thierry.reding@gmail.com> <20200319122737.3063291-7-thierry.reding@gmail.com>
In-Reply-To: <20200319122737.3063291-7-thierry.reding@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 27 Mar 2020 11:43:11 +0100
Message-ID: <CACRpkdb4y1MKp1+6MD1YOPf6iD3wWYnE2O4r+Ho4tzb9bJsvaA@mail.gmail.com>
Subject: Re: [PATCH 6/9] pinctrl: tegra: Pass struct tegra_pmx for pin range check
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
> Pass the struct tegra_pmx when checking for the pin range in device
> tree. This makes the call site a bit easier to read and will help keep
> that readability in a subsequent patch.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Patch applied!

Yours,
Linus Walleij

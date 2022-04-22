Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B35050C3CF
	for <lists+linux-tegra@lfdr.de>; Sat, 23 Apr 2022 01:11:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233065AbiDVWbk (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 22 Apr 2022 18:31:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233062AbiDVWb0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 22 Apr 2022 18:31:26 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34A222B97F8
        for <linux-tegra@vger.kernel.org>; Fri, 22 Apr 2022 14:24:34 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id x9so9624101ybe.11
        for <linux-tegra@vger.kernel.org>; Fri, 22 Apr 2022 14:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SOU4gw2OndPAHlyb0Yx1jIvLcwnBW7WU3bDm4X/+Fi4=;
        b=YfsZ4tU3PuYgqcdjIDeQeP3YRzUO5ivIGgFF1ltC/6cArnKzaw0zeJWVYikoKwMjOE
         OdEykxqICO7B5JcdxEsqUmyHPybbUs/wGZaO8WggpZlsChK/8OwwojOgf1BsBMku+PLG
         MAtb2fgJpkzrfqNAIEezByuUWj1P12+quEESjC9NqSMK3lSlcD47ha1lp12du7h/IiM9
         FDye+1z8JpkXsYNIIFUjATBQPXD1WBJ6fAmgYdNWG36EvLkWWB5Iqb8FzcwT3TpPcJGv
         ntzQ1/nuCBAT00gA8Shal5DE+qEmWahWgq3yXj3gk7VaHYOto1+FcB+rijHPlvSV+dM8
         TjcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SOU4gw2OndPAHlyb0Yx1jIvLcwnBW7WU3bDm4X/+Fi4=;
        b=C3geUJIpp2e+7gInsgW2UaeJQuaHPXIPVxmT+EbpxdX9AThuPd7/MUiS28hM/6wPHY
         gouKWxsGd2IoxGhdBaQ+watJhbbfUT1r3hqevzmP74VASuSXebNHs8dqPENu/ScAPXWy
         3I/v/bNQj5EFuYsgdibeDbAGnPWwOdPHUC+8xhA7HpEB/9znPTZqzA8n5zrDOK7MrwBW
         vBdq8wuV5ktMGk8w+tMuoUf7XCVNbNYDiy87OXJeYqZ2+2sQwGbsuOuAwiGU0EWmH0fI
         Fuvx14jhb2JYBMXn7CBliDTBaX6IamgByBs9an/C+FqF4vQN9WBJyFslkc210zkxRYKw
         9+Qw==
X-Gm-Message-State: AOAM533DPvMdAV+EWBvA1gh9QJ2rwiHWC0vpPnVMVSNAb2JQg+n1lXL0
        2afGML9e4M3NJ7b/+k3c9RmCQFQGHMfc8b7t2MVVog==
X-Google-Smtp-Source: ABdhPJxsXcP45rrTkuqz2IOlfWfxSn7HO8ecvoT5emKdoiPaqAi9KObKULKewKrgsbOq2XjWVK/mAr4bUvR0dK/u9is=
X-Received: by 2002:a5b:dc5:0:b0:624:f16d:7069 with SMTP id
 t5-20020a5b0dc5000000b00624f16d7069mr6530719ybr.295.1650662673435; Fri, 22
 Apr 2022 14:24:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220419141846.598305-1-maz@kernel.org>
In-Reply-To: <20220419141846.598305-1-maz@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 22 Apr 2022 23:24:22 +0200
Message-ID: <CACRpkda3L_itpqcnPq6xDoJtNHt8NuvE1MZk1bCNR+u2KKUpBA@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] gpiolib: Handle immutable irq_chip structures
To:     Marc Zyngier <maz@kernel.org>
Cc:     linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        Thierry Reding <thierry.reding@gmail.com>,
        Joey Gouly <joey.gouly@arm.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Hector Martin <marcan@marcan.st>,
        Sven Peter <sven@svenpeter.dev>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Apr 19, 2022 at 4:19 PM Marc Zyngier <maz@kernel.org> wrote:

> This is a followup from [2].
>
> I recently realised that the gpiolib play ugly tricks on the
> unsuspecting irq_chip structures by patching the callbacks.
>
> Not only this breaks when an irq_chip structure is made const (which
> really should be the default case), but it also forces this structure
> to be copied at nauseam for each instance of the GPIO block, which is
> a waste of memory.
>
> My current approach is to add a new irq_chip flag (IRQCHIP_IMMUTABLE)
> which does what it says on the tin: don't you dare writing to them.
> Gpiolib is further updated not to install its own callbacks, and it
> becomes the responsibility of the driver to call into the gpiolib when
> required. This is similar to what we do for other subsystems such as
> PCI-MSI.
>
> 5 drivers are updated to this new model: M1, QC, Tegra, pl061 and AMD
> (as I actively use them) keeping a single irq_chip structure, marking
> it const, and exposing the new flag.
>
> Nothing breaks, the volume of change is small, the memory usage goes
> down and we have fewer callbacks that can be used as attack vectors.
> What's not to love?
>
> Since there wasn't any objection in the previous round of review, I'm
> going to take this series into -next to see if anything breaks at
> scale.

The series:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Bartosz: if you're happy with this can you apply it to an immutable branch
from v5.18-rc1 and merge that into the GPIO for-next and then I can also
pull that into pinctrl?

Yours,
Linus Walleij

Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9FD538868
	for <lists+linux-tegra@lfdr.de>; Fri,  7 Jun 2019 13:03:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728328AbfFGLDD (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 7 Jun 2019 07:03:03 -0400
Received: from mail-ua1-f66.google.com ([209.85.222.66]:41284 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728236AbfFGLDD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 7 Jun 2019 07:03:03 -0400
Received: by mail-ua1-f66.google.com with SMTP id n2so470342uad.8
        for <linux-tegra@vger.kernel.org>; Fri, 07 Jun 2019 04:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iJJw6aC2zrJqZeFVWgJP7Dr4v9Y0eA3RoR5pHTOrcqI=;
        b=H8eAe0vTztkXtwjhsPaMpNGSkMiaddBzCx/Vq1WfpBiNSRGFSwlpsSaTjiquKYmzMz
         Jxfi38jkECxmHgCJKrQ+qtSfKcs7yK8Lp+dHTeMRXpJr3YoFeRTUiCkf1KKd1mYB+Zyw
         81W5PTQtMw8TY+Eemc2yq3lK1ee9Uas9X3mmoSdzmAjJcJ9/6Ob5iAfaGSh/Mb81VMe/
         KNnZYj1uVy/UhdawY2yesrxBSXgl4YCceGt/+a8hog53gogHFkbxkmXCspz0lXJpuL+k
         K+TfWmNshj6P+dGivLRSJgzO+lynp5hDexPzC1mqkpAPJXoFivDaSOy+1glMujlsQs8S
         9oJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iJJw6aC2zrJqZeFVWgJP7Dr4v9Y0eA3RoR5pHTOrcqI=;
        b=qXVeqjHUmcjgRi8DqLkXMs1+h2PXJ5JWPJx4Wjt7yc5G5RSX5351j77fSNeSCkSyPF
         sFN5KZMe0Q81bIUIcseWaBE0jjBEeSYDV9NEduav/BdzjJQlcGkOafnO4wmaVktyQA7w
         kHbukyyp9haqiz93/DIf6xe1GAvG57BPQgl++772RoimYI4QgBavPSXAroLPbK2KM2D6
         sgDAtjJEymQ4ut18YqnKwNe5gJuB2MZzGkmLm0HbQ/qwJ2YYC8Hv/gNTidk01rovv/t4
         6S5k6rQ5U532ZtJofhGJ6XvmqPE8PfkLmGdCQ/ImQBBHm7LeU273F7z5ykb32Czk/8T5
         K+Bg==
X-Gm-Message-State: APjAAAXCdK0YS/rtvVH9/uGbdAo6UbfFuMZ2h4i+R75VYas4tsnGtiOq
        h6HvcFLNIGw8voWL5VmnHFC3GBu313yDKGyArEV4lg==
X-Google-Smtp-Source: APXvYqxK4vX+YhsfVfiEfzvya7UpMW8vcQyQqrPY3OflJIwIaRrwyirvvkzTJN1qbWq8qFZJSUmyPgfsgx3hjeJHh2Q=
X-Received: by 2002:ab0:2488:: with SMTP id i8mr13481086uan.104.1559905382439;
 Fri, 07 Jun 2019 04:03:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190604153446.22857-1-thierry.reding@gmail.com> <20190604153809.GA23360@ulmo>
In-Reply-To: <20190604153809.GA23360@ulmo>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 7 Jun 2019 13:02:26 +0200
Message-ID: <CAPDyKFotaOnCYzWGh35rGsH3EDCXFPn0iaK7cb3xKjccsTfKzA@mail.gmail.com>
Subject: Re: [PATCH] sdhci: tegra: Do not log error message on deferred probe
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, 4 Jun 2019 at 17:38, Thierry Reding <thierry.reding@gmail.com> wrote:
>
> On Tue, Jun 04, 2019 at 05:34:46PM +0200, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >
> > Recent changes have made it much more probably that clocks are not
>
> Ugh... s/probably/probable/. Adrian, Ulf, do you want me to resend just
> for that if there are no further comments, or could you ammend that when
> applying?

No worries, I amended the changelog.

>
> Thierry
>
> > available yet when the SDHCI driver is first probed. However, that
> > is a situation that the driver can cope with just fine.
> >
> > To avoid confusion, don't output an error when this happens.
> >
> > Signed-off-by: Thierry Reding <treding@nvidia.com>

Applied for next, thanks!

Kind regards
Uffe


> > ---
> >  drivers/mmc/host/sdhci-tegra.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/mmc/host/sdhci-tegra.c b/drivers/mmc/host/sdhci-tegra.c
> > index 10d7aaf68bab..8a6a51bc038b 100644
> > --- a/drivers/mmc/host/sdhci-tegra.c
> > +++ b/drivers/mmc/host/sdhci-tegra.c
> > @@ -1550,8 +1550,11 @@ static int sdhci_tegra_probe(struct platform_device *pdev)
> >
> >       clk = devm_clk_get(mmc_dev(host->mmc), NULL);
> >       if (IS_ERR(clk)) {
> > -             dev_err(mmc_dev(host->mmc), "clk err\n");
> >               rc = PTR_ERR(clk);
> > +
> > +             if (rc != -EPROBE_DEFER)
> > +                     dev_err(&pdev->dev, "failed to get clock: %d\n", rc);
> > +
> >               goto err_clk_get;
> >       }
> >       clk_prepare_enable(clk);
> > --
> > 2.21.0
> >

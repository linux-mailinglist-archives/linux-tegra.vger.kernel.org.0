Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 333681D910E
	for <lists+linux-tegra@lfdr.de>; Tue, 19 May 2020 09:29:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728248AbgESH3V (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 19 May 2020 03:29:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727057AbgESH3V (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 19 May 2020 03:29:21 -0400
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com [IPv6:2607:f8b0:4864:20::942])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAB57C05BD0A
        for <linux-tegra@vger.kernel.org>; Tue, 19 May 2020 00:29:20 -0700 (PDT)
Received: by mail-ua1-x942.google.com with SMTP id f9so2274017uaq.2
        for <linux-tegra@vger.kernel.org>; Tue, 19 May 2020 00:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MGKa+ni4azruYMg4t2OX9ZfrcsxATG1wfkYBrvmx3ac=;
        b=ppCH2waksv32s+VVjjgoMAHZCn1L6IO+CmDuUgCw0Ah8QKNmJsagxzjFwL1icKfVL6
         GMFWWLDxgqUgXutFVVzJi3VAwC3XUqmxCY6DikqwItRz2Z+sxzMOxZUIuGbPS7LMLFAo
         2CrhGUnvrHNzcOhTf6J0cWp5Wo3JPer7NcqIN4d26PORoOmIKbmdOgEqFUpk8WacxsAB
         sb+1PA2XFj/jrKGRv1/6lcfY4xY1zeXqbaeFMama6eAdHX+1zaVPRgJV0L6RpsaTdRae
         i4ngUbPx2AjAShzmkOh4EQOybvPQ8BhHHrNYB7CrCeeFd2fNUK/+ptg132X2WpNow7o3
         laUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MGKa+ni4azruYMg4t2OX9ZfrcsxATG1wfkYBrvmx3ac=;
        b=mj9/o9HYdPqfApuXIWhVclP0Cw9xC6Y3vF6MR+vLmIxemkNhK2iVJB1Im8pbxhy7N8
         AqPJaNOrsB+dKfE13Iz1iqe0rQivwXbA7csEwY8kvPXOiz9sW7+jGo2EiTnjrI3C9dYj
         /L575o9FOIvUefQ+NKiXnfJjVV8E2v01snWMJ+r5Fz4dWsdytw5w0Max3UzDbrtPV7uT
         RWgLxQ4ADUWq9CqW1DYA3z6dVJM0VDIwwUyFyzIFdIHTcd16xWkt9a/PuCECeiWA/vU3
         hNa0riED5Mg7aKhYasawFlm9WWgTZgzTdJHndNfu/SvzW0VIoHr5gNbE0nVPIc4XDicP
         5ZKw==
X-Gm-Message-State: AOAM531FcWLdeNCJddvtcQ8HecBCUEJV+GI+k8G1wpCybv//CwUwMH7P
        +AH1zCcptam2Cldg1+olx2g8wp3/IPHj6uYt0MVQow==
X-Google-Smtp-Source: ABdhPJziq/dAaaMSV1g+QUyl2hxCAINBzMD1C8r8rFdoRyfZhqRSKCVUBriAlDSydtj6W9Tb1GcQRCiaHtbeQ3upsjw=
X-Received: by 2002:ab0:5ca:: with SMTP id e68mr13796837uae.19.1589873359897;
 Tue, 19 May 2020 00:29:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200516154314.14769-1-digetx@gmail.com>
In-Reply-To: <20200516154314.14769-1-digetx@gmail.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 19 May 2020 09:28:43 +0200
Message-ID: <CAPDyKFo_Xp-zipqE26iMv4CFwUoMCQZy3Zr63Cp=uzePgWX7BA@mail.gmail.com>
Subject: Re: [PATCH v1] sdhci: tegra: Remove warnings about missing
 device-tree properties
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sat, 16 May 2020 at 17:44, Dmitry Osipenko <digetx@gmail.com> wrote:
>
> Several people asked me about the MMC warnings in the KMSG log and
> I had to tell to ignore them because these warning are irrelevant to
> pre-Tegra210 SoCs.

Why are the warnings irrelevant?

> It should be up to a board's device-tree writer to
> properly describe all the necessary properties. Secondly, eventually all
> device-tree bindings will be converted to YAML, which allows to validate
> board DT files, giving a warning about missing properties. Hence let's
> remove the noisy warnings to stop the confusion.

Yep, makes sense. However, perhaps we should do this conversion then,
rather than first drop the warnings?

Kind regards
Uffe

>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/mmc/host/sdhci-tegra.c | 28 ++++------------------------
>  1 file changed, 4 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-tegra.c b/drivers/mmc/host/sdhci-tegra.c
> index 3e2c5101291d..83867629013d 100644
> --- a/drivers/mmc/host/sdhci-tegra.c
> +++ b/drivers/mmc/host/sdhci-tegra.c
> @@ -607,46 +607,26 @@ static void tegra_sdhci_parse_pad_autocal_dt(struct sdhci_host *host)
>         err = device_property_read_u32(host->mmc->parent,
>                         "nvidia,pad-autocal-pull-up-offset-3v3-timeout",
>                         &autocal->pull_up_3v3_timeout);
> -       if (err) {
> -               if (!IS_ERR(tegra_host->pinctrl_state_3v3) &&
> -                       (tegra_host->pinctrl_state_3v3_drv == NULL))
> -                       pr_warn("%s: Missing autocal timeout 3v3-pad drvs\n",
> -                               mmc_hostname(host->mmc));
> +       if (err)
>                 autocal->pull_up_3v3_timeout = 0;
> -       }
>
>         err = device_property_read_u32(host->mmc->parent,
>                         "nvidia,pad-autocal-pull-down-offset-3v3-timeout",
>                         &autocal->pull_down_3v3_timeout);
> -       if (err) {
> -               if (!IS_ERR(tegra_host->pinctrl_state_3v3) &&
> -                       (tegra_host->pinctrl_state_3v3_drv == NULL))
> -                       pr_warn("%s: Missing autocal timeout 3v3-pad drvs\n",
> -                               mmc_hostname(host->mmc));
> +       if (err)
>                 autocal->pull_down_3v3_timeout = 0;
> -       }
>
>         err = device_property_read_u32(host->mmc->parent,
>                         "nvidia,pad-autocal-pull-up-offset-1v8-timeout",
>                         &autocal->pull_up_1v8_timeout);
> -       if (err) {
> -               if (!IS_ERR(tegra_host->pinctrl_state_1v8) &&
> -                       (tegra_host->pinctrl_state_1v8_drv == NULL))
> -                       pr_warn("%s: Missing autocal timeout 1v8-pad drvs\n",
> -                               mmc_hostname(host->mmc));
> +       if (err)
>                 autocal->pull_up_1v8_timeout = 0;
> -       }
>
>         err = device_property_read_u32(host->mmc->parent,
>                         "nvidia,pad-autocal-pull-down-offset-1v8-timeout",
>                         &autocal->pull_down_1v8_timeout);
> -       if (err) {
> -               if (!IS_ERR(tegra_host->pinctrl_state_1v8) &&
> -                       (tegra_host->pinctrl_state_1v8_drv == NULL))
> -                       pr_warn("%s: Missing autocal timeout 1v8-pad drvs\n",
> -                               mmc_hostname(host->mmc));
> +       if (err)
>                 autocal->pull_down_1v8_timeout = 0;
> -       }
>
>         err = device_property_read_u32(host->mmc->parent,
>                         "nvidia,pad-autocal-pull-up-offset-sdr104",
> --
> 2.26.0
>

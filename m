Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BD4F1E0949
	for <lists+linux-tegra@lfdr.de>; Mon, 25 May 2020 10:48:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389294AbgEYIsZ (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 25 May 2020 04:48:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389289AbgEYIsY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 25 May 2020 04:48:24 -0400
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com [IPv6:2607:f8b0:4864:20::e42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 676BAC08C5C0
        for <linux-tegra@vger.kernel.org>; Mon, 25 May 2020 01:48:24 -0700 (PDT)
Received: by mail-vs1-xe42.google.com with SMTP id 62so9541803vsi.2
        for <linux-tegra@vger.kernel.org>; Mon, 25 May 2020 01:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PgoGKBAveUpNLnIgQcx75kKaH5k5+uJlCEKBpDn1ehg=;
        b=tdGsAmBcL08JRMs+nYm8YpHBTOpij3fZk+r9MXovn+wfyDMMbkBpQlOFfdPsB3W1n1
         +eTZplU85wrUMVjRqEzqZr3rMJ4Ix6HfL28ktBCWfFBDgFTF8iwHQTO51kAPJnRzwWwU
         q6g0X9H989G9DPhSRJ7ZX1PNDShY/2DUxSQbtENhrPGjI4tfhhplwNskUt3Yed/f4k1B
         g5OD0XtBtM8gtLo8wmjyidjxzrEzhun+enD1dv6A75BbCmLIKkC+NqIr7jg0FQINxvzC
         MkwzQsUygNX9Pt7OmsLVoKzoVQN9pgRkRpv/+iLeODFQjBBMT41z8O6j7wsuF+V1m7Wu
         QuSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PgoGKBAveUpNLnIgQcx75kKaH5k5+uJlCEKBpDn1ehg=;
        b=MIvhu55zhPSHS1epuoP4nDvXiC/N6ezNWjoD6cdVs6Xx6LsjqoaHSqrwHVJm52CdDj
         GiV6yzj3J0k2okeg/bjQaE4N0y39uQSqTeVYvU21s0ErfWLoW8fwutQErkR0hFagxQvy
         wRdB+jsaXlyBq1afpkz0W7T+DMjBtD3afT57/HDyl4uq5THYorkIPeSmVUhCRBnpxH3n
         okKLpf7nP8NvUfjTsFhxGUBHDOBkHaUTiaDkIw+EOFoPgG1MRlAoqXQTC9jgEWn0Q4uD
         313kZRTFRt7mbMWGInbMJqbaTfjRQVRADxdR8cW61EsRCzWnz7ByzCPfvcVC8rodjmy2
         WR2w==
X-Gm-Message-State: AOAM530IxuMTdNXcrta7VxFHX5BwzOdSFXTmA2Mt1EQaYLVpOy1Ttbka
        EHv49VLL+T2Hg8YLh7nsWKAtrGyJBvLKIQcebP3cmMctZCA=
X-Google-Smtp-Source: ABdhPJz/2B30euWiWchhGIeeUoF37uMCLF0YLBKETXSYWThkUgvYPD7ALh48YAC5IyTjWbETQujZNpRuwz2LoyiuuRE=
X-Received: by 2002:a67:690e:: with SMTP id e14mr18180245vsc.34.1590396503592;
 Mon, 25 May 2020 01:48:23 -0700 (PDT)
MIME-Version: 1.0
References: <1590005337-1087-1-git-send-email-skomatineni@nvidia.com>
In-Reply-To: <1590005337-1087-1-git-send-email-skomatineni@nvidia.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 25 May 2020 10:47:47 +0200
Message-ID: <CAPDyKFoV93OdjfuupYgFDegqBVjJpTnSeR3s8WOUaUmM19S4EA@mail.gmail.com>
Subject: Re: [PATCH] sdhci: tegra: Avoid reading autocal timeout values when
 not applicable
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, 20 May 2020 at 22:09, Sowjanya Komatineni
<skomatineni@nvidia.com> wrote:
>
> When auto calibration timeouts, calibration is disabled and fail-safe
> drive strength values are programmed based on the signal voltage.
>
> Different fail-safe drive strength values based on voltage are
> applicable only for SoCs supporting 3V3 and 1V8 pad controls.
>
> So, this patch avoids reading these properties from the device tree
> for SoCs not using pad controls and the warning of missing properties
> will not show up on these SoC platforms.
>
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>

Applied for next and by fixing the misspelled "properies", thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/sdhci-tegra.c | 57 ++++++++++++++++++++++++------------------
>  1 file changed, 33 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-tegra.c b/drivers/mmc/host/sdhci-tegra.c
> index 3e2c510..141b49b 100644
> --- a/drivers/mmc/host/sdhci-tegra.c
> +++ b/drivers/mmc/host/sdhci-tegra.c
> @@ -605,6 +605,39 @@ static void tegra_sdhci_parse_pad_autocal_dt(struct sdhci_host *host)
>                 autocal->pull_down_1v8 = 0;
>
>         err = device_property_read_u32(host->mmc->parent,
> +                       "nvidia,pad-autocal-pull-up-offset-sdr104",
> +                       &autocal->pull_up_sdr104);
> +       if (err)
> +               autocal->pull_up_sdr104 = autocal->pull_up_1v8;
> +
> +       err = device_property_read_u32(host->mmc->parent,
> +                       "nvidia,pad-autocal-pull-down-offset-sdr104",
> +                       &autocal->pull_down_sdr104);
> +       if (err)
> +               autocal->pull_down_sdr104 = autocal->pull_down_1v8;
> +
> +       err = device_property_read_u32(host->mmc->parent,
> +                       "nvidia,pad-autocal-pull-up-offset-hs400",
> +                       &autocal->pull_up_hs400);
> +       if (err)
> +               autocal->pull_up_hs400 = autocal->pull_up_1v8;
> +
> +       err = device_property_read_u32(host->mmc->parent,
> +                       "nvidia,pad-autocal-pull-down-offset-hs400",
> +                       &autocal->pull_down_hs400);
> +       if (err)
> +               autocal->pull_down_hs400 = autocal->pull_down_1v8;
> +
> +       /*
> +        * Different fail-safe drive strength values based on the signaling
> +        * voltage are applicable for SoCs supporting 3V3 and 1V8 pad controls.
> +        * So, avoid reading below device tree properies for SoCs that don't
> +        * have NVQUIRK_NEEDS_PAD_CONTROL.
> +        */
> +       if (!(tegra_host->soc_data->nvquirks & NVQUIRK_NEEDS_PAD_CONTROL))
> +               return;
> +
> +       err = device_property_read_u32(host->mmc->parent,
>                         "nvidia,pad-autocal-pull-up-offset-3v3-timeout",
>                         &autocal->pull_up_3v3_timeout);
>         if (err) {
> @@ -647,30 +680,6 @@ static void tegra_sdhci_parse_pad_autocal_dt(struct sdhci_host *host)
>                                 mmc_hostname(host->mmc));
>                 autocal->pull_down_1v8_timeout = 0;
>         }
> -
> -       err = device_property_read_u32(host->mmc->parent,
> -                       "nvidia,pad-autocal-pull-up-offset-sdr104",
> -                       &autocal->pull_up_sdr104);
> -       if (err)
> -               autocal->pull_up_sdr104 = autocal->pull_up_1v8;
> -
> -       err = device_property_read_u32(host->mmc->parent,
> -                       "nvidia,pad-autocal-pull-down-offset-sdr104",
> -                       &autocal->pull_down_sdr104);
> -       if (err)
> -               autocal->pull_down_sdr104 = autocal->pull_down_1v8;
> -
> -       err = device_property_read_u32(host->mmc->parent,
> -                       "nvidia,pad-autocal-pull-up-offset-hs400",
> -                       &autocal->pull_up_hs400);
> -       if (err)
> -               autocal->pull_up_hs400 = autocal->pull_up_1v8;
> -
> -       err = device_property_read_u32(host->mmc->parent,
> -                       "nvidia,pad-autocal-pull-down-offset-hs400",
> -                       &autocal->pull_down_hs400);
> -       if (err)
> -               autocal->pull_down_hs400 = autocal->pull_down_1v8;
>  }
>
>  static void tegra_sdhci_request(struct mmc_host *mmc, struct mmc_request *mrq)
> --
> 2.7.4
>

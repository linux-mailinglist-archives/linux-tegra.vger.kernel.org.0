Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14A0E24F305
	for <lists+linux-tegra@lfdr.de>; Mon, 24 Aug 2020 09:20:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726354AbgHXHUp (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 24 Aug 2020 03:20:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726119AbgHXHUp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 24 Aug 2020 03:20:45 -0400
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com [IPv6:2607:f8b0:4864:20::e42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38C64C061574
        for <linux-tegra@vger.kernel.org>; Mon, 24 Aug 2020 00:20:45 -0700 (PDT)
Received: by mail-vs1-xe42.google.com with SMTP id a127so3922339vsd.1
        for <linux-tegra@vger.kernel.org>; Mon, 24 Aug 2020 00:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eaT6ZpVnYcO23xeg/lu0Nhu8kAcIVMz0J5y75t8rIj8=;
        b=XIyhPB/n685+4pfsehSeIJnQGn+mn/wx/PGufkNW2qkHyJQBm6bD6g/tZrMDy9oqb/
         zleBCHtR9ZwLEgFype2fNYCvzr822DoFzYvKOYqaJMJtr05srZy6lvqd4GyZGFKNlI11
         YReAawC9roCXvbgHa5OZ8v1xSB40EJXDqAJ3j9PyR20kX3hoM2n4K1c76j3TfUgNcsX6
         YmwepHlupZl4/MCbGtzO7OZvjJqjTEp6APKJRqVqRQSw3JdNqS1vva1TDeLw1TFSPQ3f
         kh3EYSEh9jDW1vSXTBal8ySr+SuA2rejv6s9omXoI9XZuLLGKihelaDinntX3Zhs6A9X
         cBRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eaT6ZpVnYcO23xeg/lu0Nhu8kAcIVMz0J5y75t8rIj8=;
        b=BPM1qXyHWtBuKlJQ4kwMP8LePyrtVOLNdKT9vjfpQZJy1UAKDvxvk2B3T98o0dnrl7
         4rP1U45g/ZVDxFyI0IUTMHIWlOMGC9i+T0Am6O3L3EM0iw2DQioQXZh9Gv+75tsr5nyV
         hevmosXefybXE7xq6zmWNcwf5snb1WzXF1F/aJqRdzQ3wL3pclxHhriqqz+FMy0e+D8H
         hemMoIXbLkWy4AFECi+hbODSOXGEP8z0druW3SGFclEUmENiiSzC2WiWtJQJ2iyL2ooh
         KO1tGi+ZeBIXO6N7hDwdm6EEQFkaf3Q0tmcGMrP2YLitOi7HVETQ60+ZMnk3JpitUXHk
         WLzw==
X-Gm-Message-State: AOAM530+AzhFfE/GMGb9SvEWstX+fSiBzE49w3GIOXYWkrPzhpwk+7zL
        CdR503dNLMV0R8Jp0OjQqJR8ZVS+UgRYGYQk9yMyfQ==
X-Google-Smtp-Source: ABdhPJxLWHtQvlu1QPMP0YIlNkor+BVOiAxP3JIFg+wYR5I8gslFVM6ywgWF3rYEbAQMY/Is9klukrMCVQusMT03IKg=
X-Received: by 2002:a67:fd0a:: with SMTP id f10mr1494683vsr.35.1598253641430;
 Mon, 24 Aug 2020 00:20:41 -0700 (PDT)
MIME-Version: 1.0
References: <1595854036-15434-1-git-send-email-anrao@nvidia.com>
In-Reply-To: <1595854036-15434-1-git-send-email-anrao@nvidia.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 24 Aug 2020 09:20:04 +0200
Message-ID: <CAPDyKFp1K1+J-urcdcOstDqVMnTaEUfc_jJri0ZgNkWB8cpuKQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: tegra: Add Runtime PM callbacks
To:     Aniruddha Rao <anrao@nvidia.com>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

[...]

> @@ -1622,7 +1699,6 @@ static int sdhci_tegra_probe(struct platform_device *pdev)
>
>                 goto err_clk_get;
>         }
> -       clk_prepare_enable(clk);
>         pltfm_host->clk = clk;
>
>         tegra_host->rst = devm_reset_control_get_exclusive(&pdev->dev,
> @@ -1645,16 +1721,29 @@ static int sdhci_tegra_probe(struct platform_device *pdev)
>
>         usleep_range(2000, 4000);
>
> +       pm_runtime_enable(&pdev->dev);
> +       rc = pm_runtime_get_sync(&pdev->dev);
> +       if (rc < 0)
> +               goto pm_disable;
> +       pm_runtime_set_autosuspend_delay(&pdev->dev,
> +                                        SDHCI_TEGRA_RTPM_MSEC_TMOUT);
> +       pm_runtime_use_autosuspend(&pdev->dev);
> +
>         rc = sdhci_tegra_add_host(host);
>         if (rc)
>                 goto err_add_host;
>
> +       pm_runtime_mark_last_busy(&pdev->dev);
> +       pm_runtime_put_autosuspend(&pdev->dev);
> +
>         return 0;
>
>  err_add_host:
>         reset_control_assert(tegra_host->rst);
> +       pm_runtime_put_autosuspend(&pdev->dev);
> +pm_disable:
> +       pm_runtime_disable(&pdev->dev);
>  err_rst_get:
> -       clk_disable_unprepare(pltfm_host->clk);
>  err_clk_get:
>  err_power_req:
>  err_parse_dt:
> @@ -1679,6 +1768,41 @@ static int sdhci_tegra_remove(struct platform_device *pdev)
>         return 0;
>  }
>
> +static int sdhci_tegra_runtime_suspend(struct device *dev)
> +{
> +       struct sdhci_host *host = dev_get_drvdata(dev);
> +
> +       /* Disable SDMMC internal clock */
> +       sdhci_set_clock(host, 0);
> +
> +       /* Disable SDMMC host CAR clock and BG trimmer supply */
> +       return tegra_sdhci_set_host_clock(host, false);

Shouldn't you also call sdhci_runtime_suspend_host() somewhere around
here, to mask IRQs etc.

> +}
> +
> +static int sdhci_tegra_runtime_resume(struct device *dev)
> +{
> +       struct sdhci_host *host = dev_get_drvdata(dev);
> +       unsigned int clk;
> +       int err = 0;
> +
> +       /* Clock enable should be invoked with a non-zero freq */
> +       if (host->clock)
> +               clk = host->clock;
> +       else if (host->mmc->ios.clock)
> +               clk = host->mmc->ios.clock;
> +       else
> +               clk = SDHCI_TEGRA_FALLBACK_CLK_HZ;
> +
> +       /* Enable SDMMC host CAR clock and BG trimmer supply */

I don't know the Tegra controller very well, but to me, looks odd that
the BG trimmer supply hasn't been handled before. Looks like you need
to enable that, even if you don't use runtime PM, no?

> +       err = tegra_sdhci_set_host_clock(host, true);
> +       if (!err) {
> +               /* Re-enable SDMMC internal clock */
> +               sdhci_set_clock(host, clk);
> +       }

Maybe you need to call sdhci_runtime_resume_host() somewhere around here?

> +
> +       return err;
> +}
> +
>  #ifdef CONFIG_PM_SLEEP
>  static int __maybe_unused sdhci_tegra_suspend(struct device *dev)
>  {
> @@ -1686,6 +1810,12 @@ static int __maybe_unused sdhci_tegra_suspend(struct device *dev)
>         struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>         int ret;
>
> +       if (pm_runtime_status_suspended(dev)) {
> +               ret = tegra_sdhci_set_host_clock(host, true);
> +               if (ret)
> +                       return ret;
> +       }

So you need to re-enable the clock above, if it's been turned off in
runtime suspend, to complete the below operations.

That makes me wonder about the below operations. Why don't you need to
call cqhci_suspend() at runtime suspend?

> +
>         if (host->mmc->caps2 & MMC_CAP2_CQE) {
>                 ret = cqhci_suspend(host->mmc);
>                 if (ret)
> @@ -1698,8 +1828,7 @@ static int __maybe_unused sdhci_tegra_suspend(struct device *dev)
>                 return ret;
>         }
>
> -       clk_disable_unprepare(pltfm_host->clk);
> -       return 0;
> +       return tegra_sdhci_set_host_clock(host, false);
>  }
>
>  static int __maybe_unused sdhci_tegra_resume(struct device *dev)
> @@ -1708,7 +1837,7 @@ static int __maybe_unused sdhci_tegra_resume(struct device *dev)
>         struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>         int ret;
>
> -       ret = clk_prepare_enable(pltfm_host->clk);
> +       ret = tegra_sdhci_set_host_clock(host, true);
>         if (ret)
>                 return ret;
>
> @@ -1727,13 +1856,15 @@ static int __maybe_unused sdhci_tegra_resume(struct device *dev)
>  suspend_host:
>         sdhci_suspend_host(host);
>  disable_clk:
> -       clk_disable_unprepare(pltfm_host->clk);
> -       return ret;
> +       return tegra_sdhci_set_host_clock(host, false);
>  }
>  #endif
>
> -static SIMPLE_DEV_PM_OPS(sdhci_tegra_dev_pm_ops, sdhci_tegra_suspend,
> -                        sdhci_tegra_resume);
> +const struct dev_pm_ops sdhci_tegra_dev_pm_ops = {
> +       SET_SYSTEM_SLEEP_PM_OPS(sdhci_tegra_suspend, sdhci_tegra_resume)
> +       SET_RUNTIME_PM_OPS(sdhci_tegra_runtime_suspend,
> +                          sdhci_tegra_runtime_resume, NULL)
> +};
>
>  static struct platform_driver sdhci_tegra_driver = {
>         .driver         = {
> --
> 2.7.4
>

Kind regards
Uffe

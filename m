Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1EC4C97E48
	for <lists+linux-tegra@lfdr.de>; Wed, 21 Aug 2019 17:12:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728333AbfHUPMR (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 21 Aug 2019 11:12:17 -0400
Received: from mail-vk1-f194.google.com ([209.85.221.194]:45233 "EHLO
        mail-vk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726478AbfHUPMR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 21 Aug 2019 11:12:17 -0400
Received: by mail-vk1-f194.google.com with SMTP id r13so625367vke.12
        for <linux-tegra@vger.kernel.org>; Wed, 21 Aug 2019 08:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hKEtoel2h/x4hDnWnhY9qfx+YUzTSEXD8xKqnIyHogA=;
        b=yYdkVsx9q5KkA1Q/V3gWf7EJK3xA5NdhEa1zOfwWyUl3xdw0gh7cwfY52CkwuqlnnF
         SkS3kYWPA8XhE1ABbEuTLE4yA54rzHHW7Zhgl3ZN6cI9Ek1GibUPdnGEHrp6nW/BfguK
         8Q8f6wjQoKEgWCZHoWO05ph0nVKJ6Q15b+kRWDeJhpGxYQBQ3WVqR8AFRpi9Vofi5z0/
         CyPguiYpGdNtHZ63Uij63fkWKkJmsnYCjZxrzDO6rOoATCO1Cneza+w7e+WRA1CoPHbP
         4vGkIgcVH25yKKgrxqeBLrTBFDVtVuQZGJgsmHdrlp9lPtd+QKwcC51LhN+Ri6v+W+GL
         FjeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hKEtoel2h/x4hDnWnhY9qfx+YUzTSEXD8xKqnIyHogA=;
        b=qoWY8gt3nk4JKx4UAbfG35ZuUKfbBnc81dREjPyI9DuDdH8aH+4shUD5Hk5hoh+qhY
         S9lkzGamHfUCkmeHLXqc4eBWPV6WT7vC0zVNbr6I8br3moC/AyNa7WGthNCXZAVuewkK
         B/8Gl7p2IzSasL9dhTC+le07kQtECxEgeoD63D7hMo3jTRYt0Btg+YA8hOsqVe6vNFM/
         pzuqWyEO3MhqZK4rAyrLSQ2DT+I72TmQCVx0LXygv3XtVvUD6xQuD63M3P91TKR/8ZYG
         XCHHCWr8XLLraxRqkWhFNnVP+Cf1aBbmAn63bw9HZxMDKXIMn3JQ/K+leBpK+jGRQSia
         jwcg==
X-Gm-Message-State: APjAAAX6h0OIRWzrOTZlDApTP/sXCl4UW86lj59xedKKJP2R+My5Lz4G
        c4Zc05t0VIPNDGJq7IVCXaMiFWWKtkCD7gAtGbhYYuLd
X-Google-Smtp-Source: APXvYqxtlscJ8dXQyaX0YociSYwwEReTd/3YWWYYohOpyWgHzKm0z9v54biFqCNjdZObl+yGfYnUiack1hGdImu+9bI=
X-Received: by 2002:ac5:c4f7:: with SMTP id b23mr5310274vkl.17.1566400335753;
 Wed, 21 Aug 2019 08:12:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190808222430.28477-1-digetx@gmail.com>
In-Reply-To: <20190808222430.28477-1-digetx@gmail.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 21 Aug 2019 17:11:39 +0200
Message-ID: <CAPDyKFqtAc_PK+yg4ev=-vm4-OPjhUdD2F9t+-ATJHO6y41G2w@mail.gmail.com>
Subject: Re: [PATCH v1] Revert "mmc: sdhci-tegra: drop ->get_ro() implementation"
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

On Fri, 9 Aug 2019 at 00:25, Dmitry Osipenko <digetx@gmail.com> wrote:
>
> The WRITE_PROTECT bit is always in a "protected mode" on Tegra and
> WP-GPIO state need to be used instead. In a case of the GPIO absence,
> write-enable should be assumed. External SD is writable once again as
> a result of this patch because the offending commit changed behaviour for
> the case of a missing WP-GPIO to fall back to WRITE_PROTECT bit-checking,
> which is incorrect for Tegra.
>
> Cc: stable@vger.kernel.org # v5.1+
> Fixes: e8391453e27f ("mmc: sdhci-tegra: drop ->get_ro() implementation")
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/sdhci-tegra.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/drivers/mmc/host/sdhci-tegra.c b/drivers/mmc/host/sdhci-tegra.c
> index f4d4761cf20a..02d8f524bb9e 100644
> --- a/drivers/mmc/host/sdhci-tegra.c
> +++ b/drivers/mmc/host/sdhci-tegra.c
> @@ -258,6 +258,16 @@ static void tegra210_sdhci_writew(struct sdhci_host *host, u16 val, int reg)
>         }
>  }
>
> +static unsigned int tegra_sdhci_get_ro(struct sdhci_host *host)
> +{
> +       /*
> +        * Write-enable shall be assumed if GPIO is missing in a board's
> +        * device-tree because SDHCI's WRITE_PROTECT bit doesn't work on
> +        * Tegra.
> +        */
> +       return mmc_gpio_get_ro(host->mmc);
> +}
> +
>  static bool tegra_sdhci_is_pad_and_regulator_valid(struct sdhci_host *host)
>  {
>         struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> @@ -1224,6 +1234,7 @@ static const struct cqhci_host_ops sdhci_tegra_cqhci_ops = {
>  };
>
>  static const struct sdhci_ops tegra_sdhci_ops = {
> +       .get_ro     = tegra_sdhci_get_ro,
>         .read_w     = tegra_sdhci_readw,
>         .write_l    = tegra_sdhci_writel,
>         .set_clock  = tegra_sdhci_set_clock,
> @@ -1279,6 +1290,7 @@ static const struct sdhci_tegra_soc_data soc_data_tegra30 = {
>  };
>
>  static const struct sdhci_ops tegra114_sdhci_ops = {
> +       .get_ro     = tegra_sdhci_get_ro,
>         .read_w     = tegra_sdhci_readw,
>         .write_w    = tegra_sdhci_writew,
>         .write_l    = tegra_sdhci_writel,
> @@ -1332,6 +1344,7 @@ static const struct sdhci_tegra_soc_data soc_data_tegra124 = {
>  };
>
>  static const struct sdhci_ops tegra210_sdhci_ops = {
> +       .get_ro     = tegra_sdhci_get_ro,
>         .read_w     = tegra_sdhci_readw,
>         .write_w    = tegra210_sdhci_writew,
>         .write_l    = tegra_sdhci_writel,
> @@ -1366,6 +1379,7 @@ static const struct sdhci_tegra_soc_data soc_data_tegra210 = {
>  };
>
>  static const struct sdhci_ops tegra186_sdhci_ops = {
> +       .get_ro     = tegra_sdhci_get_ro,
>         .read_w     = tegra_sdhci_readw,
>         .write_l    = tegra_sdhci_writel,
>         .set_clock  = tegra_sdhci_set_clock,
> --
> 2.22.0
>

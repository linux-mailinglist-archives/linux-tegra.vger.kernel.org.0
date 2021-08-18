Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 599F33F010C
	for <lists+linux-tegra@lfdr.de>; Wed, 18 Aug 2021 11:55:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232954AbhHRJ4R (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 18 Aug 2021 05:56:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231910AbhHRJ4Q (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 18 Aug 2021 05:56:16 -0400
Received: from mail-vk1-xa2c.google.com (mail-vk1-xa2c.google.com [IPv6:2607:f8b0:4864:20::a2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AE77C061764
        for <linux-tegra@vger.kernel.org>; Wed, 18 Aug 2021 02:55:42 -0700 (PDT)
Received: by mail-vk1-xa2c.google.com with SMTP id d30so507269vkl.12
        for <linux-tegra@vger.kernel.org>; Wed, 18 Aug 2021 02:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UE1ZTunj85bBLaOVPgVzFrgAkXUTIPxal603EckMVls=;
        b=iKTfgRdRXOmx/sOahVTwCapr7MC/22GQTxOdxPXHtXxX5b1qiVKwohG7Ti03LlgS9P
         g244S8lqHoLFaLlVuEj2RWmFzy9UO1ZqmnnJ8ygMJs5EbEu2YfdocMyZ9DFfV/U3jXRK
         p59Gv181SP/LMvSlrFmgvKCl5w24eEe2RvSFnpLcRSRf7SZQciSnZ20J13H0ALLorHFK
         o0lBY3ebeoy3bpcgvcKZaAiYkA3ST9rEm/9xilT3TqbYlN6NNmhe+oRGCnaCacYpF3NY
         ZdGAlRZghXZrhvTIeTd3nMZN0+AH9oOxzuGD8DxM4cEKm/2Nq90S8pvqddX3i68GBj9Q
         mgnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UE1ZTunj85bBLaOVPgVzFrgAkXUTIPxal603EckMVls=;
        b=edzSGmKuLdBDlya65BeM0bAAuP+UOnZc5Xi3rMlulziXSYo05+HkHUMeRALajqBlug
         TDTRdzfg0tgljMMuwWSybwdTIcGiM+pV0zGy78Z2+x9LOFZYbOMRqVm/g1Pxq+Eoa+to
         Sg0QMeGRQV2SI8V9riiEDydICTnZXzL0jFlkdAFGPC6YCbXG9OFM2SwotcIHGQw53iHq
         GAr6Y4aZxtw1LVP6K2ffopHxi+v8uivq1JYdYPrXrOSM6/AHJX9qmiMqdCvzyKurk5o1
         IVJx4ND22cU/H8kYhuZz/Wlv9RvigIi4IJisPZNTah6rVuLwqbQa0d89N+WIhBOGBhLf
         lssg==
X-Gm-Message-State: AOAM530WDqe+Uf99LGy8D9NtK3nlEq6C/WwOqcsjjtUWCRI/lp5Xv2Ha
        JC2xe8wAl0FxhiOwUsnctgoaGd3BJ/wL9xF6xH9Z2w==
X-Google-Smtp-Source: ABdhPJxqwWxK6SNBwzcoH8hGd0N017XbtcK08OfcWNGrOciAFJMnS0ZaskKVPUDUd3kPJh9u2Nm3zvzottNuF5jxH24=
X-Received: by 2002:a1f:a555:: with SMTP id o82mr6132378vke.8.1629280541373;
 Wed, 18 Aug 2021 02:55:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210818005547.14497-1-digetx@gmail.com> <20210818005547.14497-5-digetx@gmail.com>
In-Reply-To: <20210818005547.14497-5-digetx@gmail.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 18 Aug 2021 11:55:05 +0200
Message-ID: <CAPDyKFqQbe4k-Sem436Fzsr6mbvwZr83VtEaEZTF8oWYoHHQwg@mail.gmail.com>
Subject: Re: [PATCH v5 4/5] mmc: sdhci-tegra: Implement alternative_gpt_sector()
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jens Axboe <axboe@kernel.dk>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        David Heidelberg <david@ixit.cz>,
        Peter Geis <pgwipeout@gmail.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Christoph Hellwig <hch@infradead.org>,
        Davidlohr Bueso <dave@stgolabs.net>,
        Rob Herring <robh+dt@kernel.org>,
        Ion Agorria <AG0RRIA@yahoo.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        linux-block <linux-block@vger.kernel.org>,
        linux-efi <linux-efi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, 18 Aug 2021 at 02:57, Dmitry Osipenko <digetx@gmail.com> wrote:
>
> Tegra20/30/114/124 Android devices place GPT at a non-standard location.
> Implement alternative_gpt_sector() callback of the MMC host ops which
> specifies that GPT location for the partition scanner.
>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/mmc/host/sdhci-tegra.c | 42 ++++++++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
>
> diff --git a/drivers/mmc/host/sdhci-tegra.c b/drivers/mmc/host/sdhci-tegra.c
> index 387ce9cdbd7c..24a713689d5b 100644
> --- a/drivers/mmc/host/sdhci-tegra.c
> +++ b/drivers/mmc/host/sdhci-tegra.c
> @@ -116,6 +116,8 @@
>   */
>  #define NVQUIRK_HAS_TMCLK                              BIT(10)
>
> +#define NVQUIRK_HAS_ANDROID_GPT_SECTOR                 BIT(11)
> +
>  /* SDMMC CQE Base Address for Tegra Host Ver 4.1 and Higher */
>  #define SDHCI_TEGRA_CQE_BASE_ADDR                      0xF000
>
> @@ -1361,6 +1363,7 @@ static const struct sdhci_tegra_soc_data soc_data_tegra20 = {
>         .pdata = &sdhci_tegra20_pdata,
>         .dma_mask = DMA_BIT_MASK(32),
>         .nvquirks = NVQUIRK_FORCE_SDHCI_SPEC_200 |
> +                   NVQUIRK_HAS_ANDROID_GPT_SECTOR |
>                     NVQUIRK_ENABLE_BLOCK_GAP_DET,
>  };
>
> @@ -1390,6 +1393,7 @@ static const struct sdhci_tegra_soc_data soc_data_tegra30 = {
>         .nvquirks = NVQUIRK_ENABLE_SDHCI_SPEC_300 |
>                     NVQUIRK_ENABLE_SDR50 |
>                     NVQUIRK_ENABLE_SDR104 |
> +                   NVQUIRK_HAS_ANDROID_GPT_SECTOR |
>                     NVQUIRK_HAS_PADCALIB,
>  };
>
> @@ -1422,6 +1426,7 @@ static const struct sdhci_pltfm_data sdhci_tegra114_pdata = {
>  static const struct sdhci_tegra_soc_data soc_data_tegra114 = {
>         .pdata = &sdhci_tegra114_pdata,
>         .dma_mask = DMA_BIT_MASK(32),
> +       .nvquirks = NVQUIRK_HAS_ANDROID_GPT_SECTOR,
>  };
>
>  static const struct sdhci_pltfm_data sdhci_tegra124_pdata = {
> @@ -1438,6 +1443,7 @@ static const struct sdhci_pltfm_data sdhci_tegra124_pdata = {
>  static const struct sdhci_tegra_soc_data soc_data_tegra124 = {
>         .pdata = &sdhci_tegra124_pdata,
>         .dma_mask = DMA_BIT_MASK(34),
> +       .nvquirks = NVQUIRK_HAS_ANDROID_GPT_SECTOR,
>  };
>
>  static const struct sdhci_ops tegra210_sdhci_ops = {
> @@ -1590,6 +1596,38 @@ static int sdhci_tegra_add_host(struct sdhci_host *host)
>         return ret;
>  }
>
> +static int sdhci_tegra_alternative_gpt_sector(struct mmc_card *card,
> +                                             sector_t *gpt_sector)
> +{
> +       unsigned int boot_sectors_num;
> +
> +       /* filter out unrelated cards */
> +       if (card->ext_csd.rev < 3 ||
> +           !mmc_card_mmc(card) ||
> +           !mmc_card_is_blockaddr(card) ||
> +            mmc_card_is_removable(card->host))
> +               return -ENOENT;
> +
> +       /*
> +        * eMMC storage has two special boot partitions in addition to the
> +        * main one.  NVIDIA's bootloader linearizes eMMC boot0->boot1->main
> +        * accesses, this means that the partition table addresses are shifted
> +        * by the size of boot partitions.  In accordance with the eMMC
> +        * specification, the boot partition size is calculated as follows:
> +        *
> +        *      boot partition size = 128K byte x BOOT_SIZE_MULT
> +        *
> +        * Calculate number of sectors occupied by the both boot partitions.
> +        */
> +       boot_sectors_num = card->ext_csd.raw_boot_mult * SZ_128K /
> +                          SZ_512 * MMC_NUM_BOOT_PARTITION;
> +
> +       /* Defined by NVIDIA and used by Android devices. */
> +       *gpt_sector = card->ext_csd.sectors - boot_sectors_num - 1;
> +
> +       return 0;
> +}

I suggest you move this code into the mmc core/block layer instead (it
better belongs there).

Additionally, let's add a new host cap, MMC_CAP_ALTERNATIVE_GPT, to
let the core know when it should use the code above.

> +
>  static int sdhci_tegra_probe(struct platform_device *pdev)
>  {
>         const struct of_device_id *match;
> @@ -1616,6 +1654,10 @@ static int sdhci_tegra_probe(struct platform_device *pdev)
>         tegra_host->pad_control_available = false;
>         tegra_host->soc_data = soc_data;
>
> +       if (soc_data->nvquirks & NVQUIRK_HAS_ANDROID_GPT_SECTOR)
> +               host->mmc_host_ops.alternative_gpt_sector =
> +                               sdhci_tegra_alternative_gpt_sector;
> +
>         if (soc_data->nvquirks & NVQUIRK_NEEDS_PAD_CONTROL) {
>                 rc = tegra_sdhci_init_pinctrl_info(&pdev->dev, tegra_host);
>                 if (rc == 0)
> --
> 2.32.0
>

Kind regards
Uffe

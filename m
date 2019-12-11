Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5466411A5A8
	for <lists+linux-tegra@lfdr.de>; Wed, 11 Dec 2019 09:12:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728008AbfLKIMg (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 11 Dec 2019 03:12:36 -0500
Received: from mail-ua1-f66.google.com ([209.85.222.66]:33223 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726845AbfLKIMg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 11 Dec 2019 03:12:36 -0500
Received: by mail-ua1-f66.google.com with SMTP id v19so7676083uap.0
        for <linux-tegra@vger.kernel.org>; Wed, 11 Dec 2019 00:12:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GtKVKDZi0VP0KMRK8Y+gNO3Imp+CGwWjCF0fDrTXDao=;
        b=bX56WYwtKBMtTK5pNvlI5AtcGpRDzQRovMOrFy3YeM2uxlvX6JCydED9c4Un6GulSX
         TkNKvo8jeVSC7el9iO5u7RXWEVuAnZ7tZ7+cU0zywqzRSZlLCaPse0K7Op3Qfb9j845r
         ZR2i0SYA3DRgCbtD7U1ur8Jdu6SM4T9fdMCzacALTG0ULoR4ikfKm1VsNEyChnWmhWIX
         pnD2RRxNLWc8jSys7JsYVpdi52ciREyzlJiJqvCrOn/OZNGhHTsxKG0d/PcbeVeEG83+
         Wxz/1pP50t5rL9diWjdXncfue+HhjuJXYxL0fi4xJ6iuCrqykfwCSS8uTnko7Dd9Zjl/
         rcHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GtKVKDZi0VP0KMRK8Y+gNO3Imp+CGwWjCF0fDrTXDao=;
        b=kfP7sAKSrBUcTFQViZQt3+q3mjpOe/Tyrm0M7peZGXXjakFEtEaeYtI62Yw06xai5Q
         pih1YCsjW0WpNboiRMcTiafQwreOndNNO/EeIV3bq27UZNb+JPk6X9yzGUWQ5N64thEo
         NeQ5w6HiYBkEI8ZY2qjtlZ0AQxHTFEYBfwtLim2WjfIrO6dGcruXy/VIHkCDQuRUSziJ
         NWmqVxQIkFxBYHidm089afbQi6qGUsZH3Yu+01SwiUOb+FU5J1fsmguK2pQm+PJ+ogic
         kdikJmhaklfPi4D15qrixDcXMriitoClr9p19Tsu+zSxkl2rAOBNGFDedgRtbYKw9LBn
         sP2Q==
X-Gm-Message-State: APjAAAXgOcAw8aivq15s2NTmdTIVb0Ny2tZvf5Ngd3eTJwCDdU8Bi+0x
        iZKxIZGzyL9mjKuyX7Wa2qqofWwT+hWKWx4J0k2hUg==
X-Google-Smtp-Source: APXvYqwfkNjUyB25iTUQMolGQ75pWlGE1AA8Foce2npbbSq1gGxdbvJgtoyGR9ofkrupXXwWj4q55/MChMTBsq0UKtM=
X-Received: by 2002:ab0:5510:: with SMTP id t16mr1773149uaa.15.1576051955460;
 Wed, 11 Dec 2019 00:12:35 -0800 (PST)
MIME-Version: 1.0
References: <20191210014011.21987-1-digetx@gmail.com>
In-Reply-To: <20191210014011.21987-1-digetx@gmail.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 11 Dec 2019 09:11:59 +0100
Message-ID: <CAPDyKFpMe09PNQqinvvidF+wfASx2nuvgf7=Hx5+cGni8pdcRA@mail.gmail.com>
Subject: Re: [PATCH v1] sdhci: tegra: Add workaround for Broadcom WiFi
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

On Tue, 10 Dec 2019 at 02:40, Dmitry Osipenko <digetx@gmail.com> wrote:
>
> All Tegra20 boards that have embedded Broadcom WiFi SDIO chip are affected
> by a problem where WiFi chip reports CCCR v1.10, while it should v1.20.
> In a result high-speed mode isn't enabled for the WiFi card and this
> results in a malfunctioning SDIO communication.

Does that also mean SDIO_SPEED_SHS bit is set when reading SDIO_CCCR_SPEED?

>
>  brcmfmac: brcmf_sdio_readframes: read 304 bytes from channel 1 failed: -84
>  brcmfmac: brcmf_sdio_rxfail: abort command, terminate frame, send NAK
>
> Downstream kernels are overriding card's CCCR info in SDHCI driver to fix
> the problem, let's do the same in upstream.
>
> The change is inspired by omap_hsmmc_init_card() of OMAP's HSMMC driver,
> which overrides card's info for the TI wl1251 WiFi.

This is a temporary solution and should be replaced by doing the DT
parsing during

So, yes, let's see if we can use a card quirk instead. That's the first option.

A second option is simply to parse the DT subnode for a new DT
property during mmc_sdio_init_card(). Along the lines of what we do
for the broken-hpi DT binding for eMMC.

Kind regards
Uffe

>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/mmc/host/sdhci-tegra.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/drivers/mmc/host/sdhci-tegra.c b/drivers/mmc/host/sdhci-tegra.c
> index 7bc950520fd9..2ad87da98f2c 100644
> --- a/drivers/mmc/host/sdhci-tegra.c
> +++ b/drivers/mmc/host/sdhci-tegra.c
> @@ -1501,6 +1501,32 @@ static int sdhci_tegra_add_host(struct sdhci_host *host)
>         return ret;
>  }
>
> +static void sdhci_tegra_init_card(struct mmc_host *mmc, struct mmc_card *card)
> +{
> +       if (card->type == MMC_TYPE_SDIO) {
> +               struct device_node *np = mmc_dev(mmc)->of_node;
> +
> +               np = of_get_compatible_child(np, "brcm,bcm4329-fmac");
> +               if (np) {
> +                       dev_info(mmc_dev(mmc), "found bcm4329\n");
> +
> +                       /*
> +                        * All Tegra20 boards that have embedded BCM4329
> +                        * chip need to enable high speed for SDIO, otherwise
> +                        * further communication with the card doesn't work
> +                        * well.
> +                        *
> +                        * Later BCM43xx chips do not need this workaround,
> +                        * but there is no good way to differentiate chip's
> +                        * version at this stage and it doesn't cause any
> +                        * harm for the later chips.
> +                        */
> +                       card->cccr.high_speed = 1;
> +                       of_node_put(np);
> +               }
> +       }
> +}
> +
>  static int sdhci_tegra_probe(struct platform_device *pdev)
>  {
>         const struct of_device_id *match;
> @@ -1545,6 +1571,8 @@ static int sdhci_tegra_probe(struct platform_device *pdev)
>                 host->mmc_host_ops.execute_tuning =
>                                 tegra_sdhci_execute_hw_tuning;
>
> +       host->mmc_host_ops.init_card = sdhci_tegra_init_card;
> +
>         rc = mmc_of_parse(host->mmc);
>         if (rc)
>                 goto err_parse_dt;
> --
> 2.24.0
>

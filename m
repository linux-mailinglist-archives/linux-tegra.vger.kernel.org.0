Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14C95BBE2E
	for <lists+linux-tegra@lfdr.de>; Mon, 23 Sep 2019 23:55:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503188AbfIWVzk (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 23 Sep 2019 17:55:40 -0400
Received: from mail-ua1-f68.google.com ([209.85.222.68]:42855 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387520AbfIWVzj (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 23 Sep 2019 17:55:39 -0400
Received: by mail-ua1-f68.google.com with SMTP id r19so4860521uap.9
        for <linux-tegra@vger.kernel.org>; Mon, 23 Sep 2019 14:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=chLsHS+rww9VOJ+4+ZlUrIcMk6ujc1iz91pxKfVDj2o=;
        b=GbKasonaukEyeDSvZqImXsXhF7FEcJBm73IYysk8tlqhlP6TkMQ/xuz7I2EseiYpxd
         L/EW0QscQOPSN3Io/npZLMX9Af8DT2QImi8Hm/wEmwDltLawSzwb2T7+a6ZErr9GTn1P
         W24s+aK00wH3V1RHTPHSAsRollbU4NJkycO1r7ZzlxT3ndyejn8k5bpPoGphIn9RlWR3
         /RgUt0eIOXLrV1aSraWwz7jzj+DBCvlP5iY4mD5rzZY4aJt+skBkxEtVmEdWueG0a7XJ
         QSAycBjBZPLXZXOhNfcghQY/2Mh/pP5udRMCFu3k88Moyeub3a3xQgjQcBZTxGlCHKmf
         YVkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=chLsHS+rww9VOJ+4+ZlUrIcMk6ujc1iz91pxKfVDj2o=;
        b=ZSPXT0u/UF3fEqjgThaOCHQuvWjATRLVzQvvBGNMUggda/RvpvEG8bwMTD8GFjC5Ym
         OffmrQpMOMD8BrLJTJ1r7zSAEsPzFNfH5tp/QEDbvq4uzZtV/GWl4LAYeXwKHx4I+udo
         9TmoUOSTu3VVcfX8sONNP5WdzxICyCkhpEX7jtUSar0ZZFIVpO0p8dGVEGDUSNc7Vvgf
         7y4qa6kW0esbCqO614xzIQgL1u3HxetcdS60TBzdrX1zN9Foa++io5fVdDRJmvXNHKKw
         Hj6Z2K5C2ydTIjWPZunOUBgGlICpvoCqAVJJUuc/y04U0+n6CBl7xWS1GQiKB4bIU7ga
         vMlw==
X-Gm-Message-State: APjAAAWAuq0ner5Y2DDc77H91DIZNYCFr25vTLJ7nBqKeLv/14P8vD9l
        4O6UWnenlIKQeI30LiblQyW8StM1lqdOoDETO621dA==
X-Google-Smtp-Source: APXvYqz4iIXGmMQ7GQjPHlkyIOceqOjMc/9i2txQuv+z91S0r9kbY9dAZcF9aKFJmhskeZv/2NJ8LqrNj6K21Jk4KA8=
X-Received: by 2002:ab0:d8f:: with SMTP id i15mr13181uak.15.1569275737172;
 Mon, 23 Sep 2019 14:55:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190923100810.12698-1-thierry.reding@gmail.com>
In-Reply-To: <20190923100810.12698-1-thierry.reding@gmail.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 23 Sep 2019 23:55:01 +0200
Message-ID: <CAPDyKForzWMVVWRNRk6dhTVt-13M11=vktBJn8Rzxk0yZtNJNA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] mmc: sdhci: Let drivers define their DMA mask
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, 23 Sep 2019 at 12:08, Thierry Reding <thierry.reding@gmail.com> wrote:
>
> From: Adrian Hunter <adrian.hunter@intel.com>
>
> Add host operation ->set_dma_mask() so that drivers can define their own
> DMA masks.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> Tested-by: Nicolin Chen <nicoleotsuka@gmail.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Applied for fixes and adding a stable tag, thanks!

Kind regards
Uffe


> ---
> Changes in v2:
> - add Tested-by tag from Nicolin
>
>  drivers/mmc/host/sdhci.c | 12 ++++--------
>  drivers/mmc/host/sdhci.h |  1 +
>  2 files changed, 5 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
> index d814dc004bad..cf38ff09bef0 100644
> --- a/drivers/mmc/host/sdhci.c
> +++ b/drivers/mmc/host/sdhci.c
> @@ -3782,18 +3782,14 @@ int sdhci_setup_host(struct sdhci_host *host)
>                 host->flags &= ~SDHCI_USE_ADMA;
>         }
>
> -       /*
> -        * It is assumed that a 64-bit capable device has set a 64-bit DMA mask
> -        * and *must* do 64-bit DMA.  A driver has the opportunity to change
> -        * that during the first call to ->enable_dma().  Similarly
> -        * SDHCI_QUIRK2_BROKEN_64_BIT_DMA must be left to the drivers to
> -        * implement.
> -        */
>         if (sdhci_can_64bit_dma(host))
>                 host->flags |= SDHCI_USE_64_BIT_DMA;
>
>         if (host->flags & (SDHCI_USE_SDMA | SDHCI_USE_ADMA)) {
> -               ret = sdhci_set_dma_mask(host);
> +               if (host->ops->set_dma_mask)
> +                       ret = host->ops->set_dma_mask(host);
> +               else
> +                       ret = sdhci_set_dma_mask(host);
>
>                 if (!ret && host->ops->enable_dma)
>                         ret = host->ops->enable_dma(host);
> diff --git a/drivers/mmc/host/sdhci.h b/drivers/mmc/host/sdhci.h
> index cf3d1ed91909..61018e7fb0b6 100644
> --- a/drivers/mmc/host/sdhci.h
> +++ b/drivers/mmc/host/sdhci.h
> @@ -623,6 +623,7 @@ struct sdhci_ops {
>
>         u32             (*irq)(struct sdhci_host *host, u32 intmask);
>
> +       int             (*set_dma_mask)(struct sdhci_host *host);
>         int             (*enable_dma)(struct sdhci_host *host);
>         unsigned int    (*get_max_clock)(struct sdhci_host *host);
>         unsigned int    (*get_min_clock)(struct sdhci_host *host);
> --
> 2.23.0
>

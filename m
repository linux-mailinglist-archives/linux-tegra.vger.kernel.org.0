Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C77016C46E
	for <lists+linux-tegra@lfdr.de>; Tue, 25 Feb 2020 15:53:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730884AbgBYOxo (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 25 Feb 2020 09:53:44 -0500
Received: from mail-vs1-f67.google.com ([209.85.217.67]:36523 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730264AbgBYOxn (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 25 Feb 2020 09:53:43 -0500
Received: by mail-vs1-f67.google.com with SMTP id a2so8146610vso.3
        for <linux-tegra@vger.kernel.org>; Tue, 25 Feb 2020 06:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AWz4wDeiQ+dMtZmMMfMTReHPvDQ7FFlWV1iEIBtaea4=;
        b=SuGnhr4P2blA3x8jlYXg1G0+xqxyloO0I0ugkiAJtHLnx4kXvSifw31EVLq2SK/Imy
         2hdmZhH8m1eQGZW9mUMi4W4fNCztO2ho0S0dXBRKKuz1bPMbFwzhCknrSFHgSOQTc42a
         T5drEFsRvR+NK8V85+HGQ7XeEvAZCym6MS+YPy04fHNBycaAbC3Mzvv6OB0fzvM0da5G
         rIp9QLeu1itsiEtR6gwAZl7hjMp7rK9J17wzW8x+X+Q7Luefyys7cJ1To6wCCPLri6pU
         rHeEaeQNrzcYAyx+IVw9GojNBe/mkc1PMKz0Hjff0SLKcio+KAmnAefTm5bJwBRVYT91
         HW/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AWz4wDeiQ+dMtZmMMfMTReHPvDQ7FFlWV1iEIBtaea4=;
        b=mp18aJFZD4w6oX6tS1GcA3jMNvmyVv68ZIkt+E8CT4qsq4yTQSf/Wznc8bnVqN69ca
         xkKKqwbuii8kCWq9+nZto8sAllsZsk60GZPjZL3R1UPcktgapiQcshYHw5m131148Tan
         PlTMHARlYekSWFYAmvawr61KTLEaDAuFcske57TrIap7ccI7e0cOcB3YI+Ga+gYkqRS1
         ChO0kEhOZ1GHXUo+ZNyzCdFHBYmPwTB8VoG94MWWziN+unk290KukJD3svk4CUFks85J
         nQ9/xdk4BIYPm2lcw8dmYPH0N19gIlAC+fmBJcmRIeUdEapXw+tVt7Qjsq3FfqqJEGMb
         qXnQ==
X-Gm-Message-State: APjAAAXL1eBH0xTQllBGZORGJiLOxh0+zaqtMxmzcBJycvmMtdIsuUQ2
        oNLqBFVB6WqyUKlE+7ZIcb9I5dSUKX+VcE6z4auDwQ==
X-Google-Smtp-Source: APXvYqzlsHIb9YP3hCpfGA3Rdvg18zkDRP+rQoidSvkbh7QnCla2LkAkAEyvsQqyTzNbdgy/e8+g60oi0oH2Qq7EHJk=
X-Received: by 2002:a05:6102:757:: with SMTP id v23mr30298970vsg.35.1582642420792;
 Tue, 25 Feb 2020 06:53:40 -0800 (PST)
MIME-Version: 1.0
References: <20200224231841.26550-1-digetx@gmail.com> <20200224231841.26550-3-digetx@gmail.com>
In-Reply-To: <20200224231841.26550-3-digetx@gmail.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 25 Feb 2020 15:53:04 +0100
Message-ID: <CAPDyKFoSwjkOX85jjA-Q-ScdC0aUozroOu3_-FO4yBE8pgtCow@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] mmc: block: Add mmc_bdev_to_card() helper
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jens Axboe <axboe@kernel.dk>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        David Heidelberg <david@ixit.cz>,
        Peter Geis <pgwipeout@gmail.com>,
        Stephen Warren <swarren@wwwdotorg.org>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Billy Laws <blaws05@gmail.com>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        linux-block <linux-block@vger.kernel.org>,
        Andrey Danin <danindrey@mail.ru>,
        Gilles Grandou <gilles@grandou.net>,
        Ryan Grachek <ryan@edited.us>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, 25 Feb 2020 at 00:22, Dmitry Osipenko <digetx@gmail.com> wrote:
>
> NVIDIA Tegra Partition Table takes into account MMC card's BOOT_SIZE_MULT
> parameter, and thus, the partition parser needs to retrieve that EXT_CSD
> value from the block device. This patch introduces new helper which takes
> block device for the input argument and returns corresponding MMC card.

Rather than returning the card, why not return the value you are
looking for instead? That sound more straightforward, but also allows
mmc core code to stay closer to the mmc core.

Kind regards
Uffe

>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/mmc/core/block.c | 14 ++++++++++++++
>  include/linux/mmc/card.h |  3 +++
>  2 files changed, 17 insertions(+)
>
> diff --git a/drivers/mmc/core/block.c b/drivers/mmc/core/block.c
> index 663d87924e5e..5d853450c764 100644
> --- a/drivers/mmc/core/block.c
> +++ b/drivers/mmc/core/block.c
> @@ -301,6 +301,20 @@ static ssize_t force_ro_store(struct device *dev, struct device_attribute *attr,
>         return ret;
>  }
>
> +struct mmc_card *mmc_bdev_to_card(struct block_device *bdev)
> +{
> +       struct mmc_blk_data *md;
> +
> +       if (bdev->bd_disk->major != MMC_BLOCK_MAJOR)
> +               return NULL;
> +
> +       md = mmc_blk_get(bdev->bd_disk);
> +       if (!md)
> +               return NULL;
> +
> +       return md->queue.card;
> +}
> +
>  static int mmc_blk_open(struct block_device *bdev, fmode_t mode)
>  {
>         struct mmc_blk_data *md = mmc_blk_get(bdev->bd_disk);
> diff --git a/include/linux/mmc/card.h b/include/linux/mmc/card.h
> index 90b1d83ce675..daccb0cc25f8 100644
> --- a/include/linux/mmc/card.h
> +++ b/include/linux/mmc/card.h
> @@ -7,6 +7,7 @@
>  #ifndef LINUX_MMC_CARD_H
>  #define LINUX_MMC_CARD_H
>
> +#include <linux/blkdev.h>
>  #include <linux/device.h>
>  #include <linux/mod_devicetable.h>
>
> @@ -324,4 +325,6 @@ bool mmc_card_is_blockaddr(struct mmc_card *card);
>  #define mmc_card_sd(c)         ((c)->type == MMC_TYPE_SD)
>  #define mmc_card_sdio(c)       ((c)->type == MMC_TYPE_SDIO)
>
> +struct mmc_card *mmc_bdev_to_card(struct block_device *bdev);
> +
>  #endif /* LINUX_MMC_CARD_H */
> --
> 2.24.0
>

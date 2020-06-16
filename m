Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28B721FAF3D
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Jun 2020 13:33:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728597AbgFPLdQ (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 Jun 2020 07:33:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728536AbgFPLdH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Jun 2020 07:33:07 -0400
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com [IPv6:2607:f8b0:4864:20::a44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E36FBC08C5D1
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 04:33:05 -0700 (PDT)
Received: by mail-vk1-xa44.google.com with SMTP id q10so4714638vka.4
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 04:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yS/6e/WCxZenWj9cO6UlgV0ZueHyZ1C28NWHU0JWvMY=;
        b=zSO1xWCI7V3fwY5yJE/kKH0xluZrLvP7XojSc1tZbMaxWYatHTVYF3xmiua7boWXoQ
         /wmEZPVlEr/tPhzegCZ5DxYQ7kTp0NxPET9S0BJS6uPYFScnVoisZn5YVXpfZFNAUPVe
         E261x3yvjxDsM3DozkKtKAak3Ps0rPg1kks78JL+0S7dkM7+huylVU2hj1k7RYrYSn0W
         aLqmQtxDiwlmZQ9aUreicXQd0w1ft5kij+p7/1U9CLhZTpwtFdp8Xue8d5zuYsvjQZgW
         VEmTchuBWyxG7IoGARTHIREuPFp1i3Nysx26MqL1+I/CnPrCjVpGumurwyKDfNzn1F4K
         DByg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yS/6e/WCxZenWj9cO6UlgV0ZueHyZ1C28NWHU0JWvMY=;
        b=mF2FRSeDvzxwHCetGiCO90fIs8e9H1/tw8ahwArSQqTlwnnC8iDZli44UlXbvP9sVY
         nTFtCk4ZR8+z6fzOf4K22nQbXC8035t+Qk2whvXl0G0zkmCzQ9+xrOzsSAdTpgXopCm8
         qgExtfItyXaz3QX30lGDxhwEsKh7AT1SlDO6+rHKx9zhBAK8MDb9IVaO76NPIwO5VYEO
         Wc48SKqcHdaGA5iSvCV3FctcY5sTj/o2TUYrONCXGJTH2br45XLbmDenoylrj+5A8Hwz
         /i2uM6rAb8P8BmGo7TTnwxH53utjW4aEuRVGTcKkrYLk7NJ4Lqjse4Eq5m1a69QDChLx
         igSw==
X-Gm-Message-State: AOAM530eOeG1qUqGmpBXp/0hyHm2qXzRLKvWxRoue+zHUtUB/vkrYxBu
        aSbDcvsHIoLbji0bStMAS+VEYg6KNxXuDt5JJQ/x3A==
X-Google-Smtp-Source: ABdhPJyjMOjyUc4A/bFC2IEyahD8R1FiPDEbgPyOZ0ntp/23TwR+c4zzqMGiaNpEh5hEfDmfBPnYKmBSY9C6UP9z80A=
X-Received: by 2002:a1f:9511:: with SMTP id x17mr1128044vkd.101.1592307185187;
 Tue, 16 Jun 2020 04:33:05 -0700 (PDT)
MIME-Version: 1.0
References: <1591326240-28928-1-git-send-email-skomatineni@nvidia.com>
In-Reply-To: <1591326240-28928-1-git-send-email-skomatineni@nvidia.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 16 Jun 2020 13:32:27 +0200
Message-ID: <CAPDyKFpscyQXYF+WQ98_sRvonCL+ZbddX+ctw3umQ8HLAqvxmA@mail.gmail.com>
Subject: Re: [PATCH] sdhci: tegra: Add comment for PADCALIB and PAD_CONTROL NVQUIRKS
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, 5 Jun 2020 at 05:04, Sowjanya Komatineni <skomatineni@nvidia.com> wrote:
>
> This patch adds comments about NVQUIRKS HAS_PADCALIB and NEEDS_PAD_CONTROL.
>
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/sdhci-tegra.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/mmc/host/sdhci-tegra.c b/drivers/mmc/host/sdhci-tegra.c
> index 3a372ab..0a3f9d0 100644
> --- a/drivers/mmc/host/sdhci-tegra.c
> +++ b/drivers/mmc/host/sdhci-tegra.c
> @@ -96,7 +96,16 @@
>  #define NVQUIRK_ENABLE_SDR50                           BIT(3)
>  #define NVQUIRK_ENABLE_SDR104                          BIT(4)
>  #define NVQUIRK_ENABLE_DDR50                           BIT(5)
> +/*
> + * HAS_PADCALIB NVQUIRK is for SoC's supporting auto calibration of pads
> + * drive strength.
> + */
>  #define NVQUIRK_HAS_PADCALIB                           BIT(6)
> +/*
> + * NEEDS_PAD_CONTROL NVQUIRK is for SoC's having separate 3V3 and 1V8 pads.
> + * 3V3/1V8 pad selection happens through pinctrl state selection depending
> + * on the signaling mode.
> + */
>  #define NVQUIRK_NEEDS_PAD_CONTROL                      BIT(7)
>  #define NVQUIRK_DIS_CARD_CLK_CONFIG_TAP                        BIT(8)
>  #define NVQUIRK_CQHCI_DCMD_R1B_CMD_TIMING              BIT(9)
> --
> 2.7.4
>

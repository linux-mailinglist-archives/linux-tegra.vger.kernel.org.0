Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A3941830D7
	for <lists+linux-tegra@lfdr.de>; Thu, 12 Mar 2020 14:08:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727265AbgCLNIx (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 12 Mar 2020 09:08:53 -0400
Received: from mail-vs1-f68.google.com ([209.85.217.68]:35132 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726632AbgCLNIx (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 12 Mar 2020 09:08:53 -0400
Received: by mail-vs1-f68.google.com with SMTP id m9so3634438vso.2
        for <linux-tegra@vger.kernel.org>; Thu, 12 Mar 2020 06:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LCpLsjhLXqr8ggz/g7xy6/f16tUDkY6B6Kn6YoYqpUE=;
        b=SE5CYPIzIyid17hSGz1XcILHYzJtY8UUO98gqgEp4CJnYHME3htfnaICAfLF5FgNqM
         qOw4RnCvaSmVbCnCuBp1xms7EHt5OUHz5MGB+yQFX86jBpJ2tJ3TErluuvyefoQLcRT3
         2NQmpjTa3CrDs1eTaEuQoNZCn5RNOFtblECM6Cpqaaot1jZd0LG3AJ6fE7cX/LTAOCrH
         dw4svMTbd2gqpgR1scyiOSn1uc9ivxqPdVjQLXUq7xeqipU5JRU++MFycq4H/YG4zi/y
         WnjaeE5r+sJgpgw+8bOpjbrfBYSbu6k63Vv6duO2LuP3QZSTiBe1JO3QiUBBmZyXHhTg
         sUeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LCpLsjhLXqr8ggz/g7xy6/f16tUDkY6B6Kn6YoYqpUE=;
        b=Nv4QH+EWAW21bpBZ65EtON7l3AZYQILLmghLeTPoDoLt0OECOTy34gpUyiNs/hd8nl
         I+lL1JvJfl8URGsFafRHtkSb5E+d26/bSVdRPIb9de40KC9IaNC51OrbRv7LpvLFL4en
         TsLVabwd3DcM76Ou8mvwmnx4/EtyMXFAJxszGWm3Bll90MrjU5X6GNzpNBaf7eDv70Op
         lD6eeMdd+lIOBsJnpSpGlv1D9KFxjqQuswzILjz6EdrPC5QZfDQBbYD4HUqpgHykN72h
         vwSnsx+oXFv3BQweSJVJF5F84bUGw4VmDyGkaEI1i0UqEKKoJ3yNPOLNoEErxPxi2uEd
         I97A==
X-Gm-Message-State: ANhLgQ0E6Ck3miopuVKu06ZzibB7wbusikh7Yita27tBb3bzO2TA2LkF
        0ZVonFuCG1S3AXQXDTJC9gZEuaAPfytMM64KSHyXDQ==
X-Google-Smtp-Source: ADFU+vuqWI1okeIEKVWttizSEM5+86jFnLV1WXerjvGWOLaY7prRU7aBOXi7RzasPCbo3bmZNaNLqK66zhw+3WtGSdQ=
X-Received: by 2002:a67:646:: with SMTP id 67mr4966608vsg.34.1584018532247;
 Thu, 12 Mar 2020 06:08:52 -0700 (PDT)
MIME-Version: 1.0
References: <1583916962-9467-1-git-send-email-skomatineni@nvidia.com> <1583916962-9467-2-git-send-email-skomatineni@nvidia.com>
In-Reply-To: <1583916962-9467-2-git-send-email-skomatineni@nvidia.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 12 Mar 2020 14:08:16 +0100
Message-ID: <CAPDyKFrF4EahPZ3VxEGYBbxCGXAEHFZHtte79CW=2-jEpvLvTA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] sdhci: tegra: Enable MMC_CAP_WAIT_WHILE_BUSY host capability
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Bradley Bolen <bradleybolen@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Aniruddha Tvs Rao <anrao@nvidia.com>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

-trimmed cc list

On Thu, 12 Mar 2020 at 00:51, Sowjanya Komatineni
<skomatineni@nvidia.com> wrote:
>
> Tegra sdhci host supports HW busy detection of the device busy
> signaling over data0 lane.
>
> So, this patch enables host capability MMC_CAP_wAIT_WHILE_BUSY.
>
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>

Applied for next, thanks!

Kind regards
Uffe



> ---
>  drivers/mmc/host/sdhci-tegra.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/mmc/host/sdhci-tegra.c b/drivers/mmc/host/sdhci-tegra.c
> index fa8f6a4..1c381f8 100644
> --- a/drivers/mmc/host/sdhci-tegra.c
> +++ b/drivers/mmc/host/sdhci-tegra.c
> @@ -1580,6 +1580,8 @@ static int sdhci_tegra_probe(struct platform_device *pdev)
>         if (rc)
>                 goto err_parse_dt;
>
> +       host->mmc->caps |= MMC_CAP_WAIT_WHILE_BUSY;
> +
>         if (tegra_host->soc_data->nvquirks & NVQUIRK_ENABLE_DDR50)
>                 host->mmc->caps |= MMC_CAP_1_8V_DDR;
>
> --
> 2.7.4
>

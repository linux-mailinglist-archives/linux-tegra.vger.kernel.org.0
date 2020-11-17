Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B98782B5EB0
	for <lists+linux-tegra@lfdr.de>; Tue, 17 Nov 2020 12:51:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728249AbgKQLvD (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 17 Nov 2020 06:51:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727214AbgKQLvD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 17 Nov 2020 06:51:03 -0500
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com [IPv6:2607:f8b0:4864:20::942])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E10D8C0613CF
        for <linux-tegra@vger.kernel.org>; Tue, 17 Nov 2020 03:51:01 -0800 (PST)
Received: by mail-ua1-x942.google.com with SMTP id a10so6405532uan.12
        for <linux-tegra@vger.kernel.org>; Tue, 17 Nov 2020 03:51:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XPZaXdzLxU9pyn3jcVctcpIkUwaKDaKf29Avrgf9YS8=;
        b=ld8RtgzGdlxu7IjY/LhumFyHzpD2rpk0ZPCMr1DnMf9xiNeSkp0MXET243/U6METnH
         bpT8H0PMRyQaOGy7bQM8MCUciiiCXhuiSAtYZ4Y6pqLLayAY7hFlgCCE1Gl6/93mlGBt
         8s+dylUzhgSqBlZuot9ALTEUu3xrsyifYpvMTcIdzrL6C5C60WU7qSd6oOoUufGIDiY1
         Px9stLHcjG/DDHu8Zn6ExjVxvzZXzJytUCFmbX09B91uGZxHMYs4AxzqmuIgCOzctcr8
         vsHJcFMH8ZXd2C1MKTcL+jUzOq9oXR5m1kGaEyBnh/2RbsRBt4vITEfYXC0m9+kziiCo
         nKiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XPZaXdzLxU9pyn3jcVctcpIkUwaKDaKf29Avrgf9YS8=;
        b=eJqNCCHfulN7FXpEDIrPTBlbYS90p6LjZmt2Db9z55kTsJPyyZqXoaYBsL83dtH8lk
         +/1X5smSGtNNL+3c/lWWTAE79V8YASuvh77pGHLS/cxQT1NAoa/H0DXri3YxBXbdnoEf
         dA6Y+vpW4d/J05zL6kPNUPQ3dFWmOzkuirRSNrL+ibw9Aapq7/XOx4U1SwUvHOUahLEc
         ZXb50xz8IdJFvkpxEFNomm9xGRpgo741bSZsj9iJNqij2AA4UnOVnZg7juAf0EpHeH5c
         jzvLtywbuVXdN6N1Gp1wt3LysN/k/8KfFzbYw6DFyRZJu33MilcxxHuTTiUav6nSIKfa
         lkbg==
X-Gm-Message-State: AOAM532/qKKBLWbyWaP8JOLDEPWKAc828VAzcZvNrHUnWk7HuMci2Zyg
        PhfdFJdHQi3BkKrCmGgb1cFrIN8A69LaFn2xUahfMQpSSE0H3Q==
X-Google-Smtp-Source: ABdhPJzUKuJPTbOyA0Ba1p7c3TlmtTuVlQvDMeGXTYXoSomYc2DkGe4Wp4Hn+nyILPbmQRgtAWE0fbRur7Q0YHdIcSQ=
X-Received: by 2002:ab0:7103:: with SMTP id x3mr10786144uan.100.1605613861159;
 Tue, 17 Nov 2020 03:51:01 -0800 (PST)
MIME-Version: 1.0
References: <20201116132206.23518-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20201116132206.23518-1-wsa+renesas@sang-engineering.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 17 Nov 2020 12:50:23 +0100
Message-ID: <CAPDyKFpV4jxuwqhP3tezhJex02Ou9A+NAq+P_jVELW68cKzPtg@mail.gmail.com>
Subject: Re: [PATCH] mmc: sdhci: tegra: fix wrong unit with busy_timeout
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, 16 Nov 2020 at 14:22, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> 'busy_timeout' is in msecs, not in jiffies. Use the correct factor.
>
> Fixes: 5e958e4aacf4 ("sdhci: tegra: Implement Tegra specific set_timeout callback")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Acked-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> Acked-by: Thierry Reding <treding@nvidia.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>
> Changes since RFC:
>
> * added acks
> * fixed typo causing build failure ("MSECS" instead of "MSEC")
>
>  drivers/mmc/host/sdhci-tegra.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/sdhci-tegra.c b/drivers/mmc/host/sdhci-tegra.c
> index ed12aacb1c73..41d193fa77bb 100644
> --- a/drivers/mmc/host/sdhci-tegra.c
> +++ b/drivers/mmc/host/sdhci-tegra.c
> @@ -1272,7 +1272,7 @@ static void tegra_sdhci_set_timeout(struct sdhci_host *host,
>          * busy wait mode.
>          */
>         val = sdhci_readl(host, SDHCI_TEGRA_VENDOR_MISC_CTRL);
> -       if (cmd && cmd->busy_timeout >= 11 * HZ)
> +       if (cmd && cmd->busy_timeout >= 11 * MSEC_PER_SEC)
>                 val |= SDHCI_MISC_CTRL_ERASE_TIMEOUT_LIMIT;
>         else
>                 val &= ~SDHCI_MISC_CTRL_ERASE_TIMEOUT_LIMIT;
> --
> 2.28.0
>

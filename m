Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6FFB1F0C9
	for <lists+linux-tegra@lfdr.de>; Wed, 15 May 2019 13:47:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732023AbfEOLrR (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 15 May 2019 07:47:17 -0400
Received: from mail-vs1-f68.google.com ([209.85.217.68]:33323 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732081AbfEOLrR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 15 May 2019 07:47:17 -0400
Received: by mail-vs1-f68.google.com with SMTP id y6so1498112vsb.0
        for <linux-tegra@vger.kernel.org>; Wed, 15 May 2019 04:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8CaNTciGEsHBR+UTd+uCW4xRoPEY0Ah8mRVVm+sOGOk=;
        b=GW5qLT99fTjNxKbhvCZACauQJBvVRAlAQnNaIkPUUN1ClwMaXyk9V097k7+3sNUuF4
         vpRCYbi+Drt9IdY1MS/kyaVQg9t1z7QRLFqlM7IrPYGXQpbM+XFKEzTg3n+iuzgL6m3K
         Rp7n56F8iafdDVh6oftWvNNQyColmbSKHggU+T7ylrtdaSJR8nXLI3FkujJ78KlQozUH
         M+CTtfjUJdzm0c1JXx5+SHtrxSvufnxFRt/mQ4v9zTv+40VJfvEwFb7NJHsioVxZM8IZ
         b+Cm3xSSvCbUrIM6MRaPYq6reo5b9q7kSFUaHenagtAsF68BV5pYFEntMYDwXSX+irPs
         mMtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8CaNTciGEsHBR+UTd+uCW4xRoPEY0Ah8mRVVm+sOGOk=;
        b=VIGyF6xZQUQd01rF2nWSUByHNKDjpSonFibd73D05RLWPgUmJ8ljxqH0URRvEHhG3J
         hVQh0/FdO+hMuMpoBIXWhSMatu+kgiDVyyxQ4BDOFFg/AyLLxNvEQHrhVPOqglJSzwNk
         b0rQEQRdsp1LJZ1/4NJkItmU2afjBD0pakeosYgtv23ADnBxqzhrX0vJ8rxIvp26ZG8+
         VqmDEW53XpkhJ6kPcEm0jVzHUwSsY+tJq/p/RF/ynRU86TeXiMb4+mWd8qYBlSkqozDd
         W06pySv2Hxrpt2EzuMFWrayhKUxX31TggHParodjY93QuU/k+ADsxEmTCIK+2p9rxQW/
         GgQw==
X-Gm-Message-State: APjAAAVYpoR3DD9QAETiBocHrTuCUAhi2zlstIZkw9I918VYaQWSmLqb
        d6c6qTOxVZs9erMy3Aacb+S5EogW7/+ni7faZpcZRQ==
X-Google-Smtp-Source: APXvYqxv3EjsB/HLoWV0JoOdPbs8OtLIh/Pa3Lms7B8RBJhHyMns7p3zd86ZrsKz4XVdkXUFCKsYY3ajS2OzVB9UAZk=
X-Received: by 2002:a67:7c58:: with SMTP id x85mr657717vsc.191.1557920836166;
 Wed, 15 May 2019 04:47:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190515093512.GD3409@mwanda>
In-Reply-To: <20190515093512.GD3409@mwanda>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 15 May 2019 13:46:40 +0200
Message-ID: <CAPDyKFpm9dB55aCUQkDHgyfcJdniNG9jCbdQ4ezYgQ=L8Rxfhw@mail.gmail.com>
Subject: Re: [PATCH] mmc: tegra: Fix a warning message
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, 15 May 2019 at 11:35, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The WARN_ON() macro takes a condition, not a warning message.  I've
> changed this to use WARN(1, "msg...
>
> Fixes: ea8fc5953e8b ("mmc: tegra: update hw tuning process")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/mmc/host/sdhci-tegra.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/sdhci-tegra.c b/drivers/mmc/host/sdhci-tegra.c
> index f608417ae967..10d7aaf68bab 100644
> --- a/drivers/mmc/host/sdhci-tegra.c
> +++ b/drivers/mmc/host/sdhci-tegra.c
> @@ -865,7 +865,7 @@ static void tegra_sdhci_tap_correction(struct sdhci_host *host, u8 thd_up,
>         }
>
>         if (!first_fail) {
> -               WARN_ON("no edge detected, continue with hw tuned delay.\n");
> +               WARN(1, "no edge detected, continue with hw tuned delay.\n");

Not sure why this is a WARN*() in the first place.

Seems like a dev_warn() or possibly a dev_warn_once() should be used instead.

>         } else if (first_pass) {
>                 /* set tap location at fixed tap relative to the first edge */
>                 edge1 = first_fail_tap + (first_pass_tap - first_fail_tap) / 2;
> --
> 2.20.1
>

Kind regards
Uffe

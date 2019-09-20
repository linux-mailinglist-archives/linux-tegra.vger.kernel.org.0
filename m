Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44D58B9929
	for <lists+linux-tegra@lfdr.de>; Fri, 20 Sep 2019 23:48:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726309AbfITVsk (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 20 Sep 2019 17:48:40 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:40156 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726190AbfITVsk (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 20 Sep 2019 17:48:40 -0400
Received: by mail-pg1-f194.google.com with SMTP id w10so4559241pgj.7;
        Fri, 20 Sep 2019 14:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=cOjgGJkyJP6zsyOzGyTZLAba7fauSCLYEeNHZNyuj6c=;
        b=YZ5qfjEYvpWX+YTO596k5Omho/xNo/Jy0vDIcsOQShlWyRkgbIrMrJusl2sUFUmNm9
         lZx7sGPdAjsfmmsRmj8VSOojWQt7Kx8tJVzUl7oVay8c1cSGei9keRAK9yKcjf5Tl1XX
         C5yXB5uLdaez7pUVAFuVVrLHZLT/IULgRcHgKnshagUJWRDKt+x/NmMLzMgTSDNLr2l0
         G3oDp7SpE7QCN39wS6l8KiRG2BkRy/bYpnNk4apJSqi6SLX0lN4aDD5dNZWqQ0p/pPBY
         GlJ5/WD7VGD9lxzcQhxhzGiutAwlbRxDLHhOcznO6o58cPZSSO4bF/mpu1sjldmve2z/
         ErLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=cOjgGJkyJP6zsyOzGyTZLAba7fauSCLYEeNHZNyuj6c=;
        b=e4E+6feve0P72wqQSjkdyCv2K928hxgBBhl3OY0kNSqxRmwqTc/quuo+BF867RS9gO
         f8OY+mwNnphbF71CjRa65T9EHGbzPLnSHamHhJg1XqCQCZ3fcE7+6ifeSMJwiVnJulps
         24HuhjTaJO1TxSmRLjqI0jBOflzuBRvQ4JbzNrOYwgKFCV80hN/brhZpv72VFnzCWqSF
         6e73HDwRoNV7db8TAtP0UtuhErmDnwZZkH9yV5sXSoj6LDYYCvDMif0KWdaJPWlk6BLy
         5Gb7vpxKcMg3Y4c6oOa6ClEo3UZweEfhqTNH5vXaJI+A3zfyX4MNj5fgPvkdU6JvC8AP
         KAGA==
X-Gm-Message-State: APjAAAV8BKA1F91ixqYkseaY7p1UWDEazA16/aBHmeQ2a9tXrL20Xd3W
        PSVHdWkitUwg8naNGgNc+vY=
X-Google-Smtp-Source: APXvYqwq30FwhkOXtw91IJSWNz6Ti1LQPyO8qH7HV1RkI5ss/197xZ9/ak5A01tnaXW3r15Gy2LR1Q==
X-Received: by 2002:a65:6903:: with SMTP id s3mr17286927pgq.269.1569016119264;
        Fri, 20 Sep 2019 14:48:39 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id w11sm6092481pfd.116.2019.09.20.14.48.38
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Sep 2019 14:48:38 -0700 (PDT)
Date:   Fri, 20 Sep 2019 14:47:47 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Jon Hunter <jonathanh@nvidia.com>, inux-mmc@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] mmc: sdhci: Let drivers define their DMA mask
Message-ID: <20190920214746.GA21389@Asurada-Nvidia.nvidia.com>
References: <20190920145317.11972-1-thierry.reding@gmail.com>
 <20190920145317.11972-2-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190920145317.11972-2-thierry.reding@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Sep 20, 2019 at 04:53:16PM +0200, Thierry Reding wrote:
> From: Adrian Hunter <adrian.hunter@intel.com>
> 
> Add host operation ->set_dma_mask() so that drivers can define their own
> DMA masks.
> 
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Tested-by: Nicolin Chen <nicoleotsuka@gmail.com>

Ran a boot test with both patches on a Tegra186 board.

Thanks!

> ---
>  drivers/mmc/host/sdhci.c | 12 ++++--------
>  drivers/mmc/host/sdhci.h |  1 +
>  2 files changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
> index a5dc5aae973e..bc04c3180477 100644
> --- a/drivers/mmc/host/sdhci.c
> +++ b/drivers/mmc/host/sdhci.c
> @@ -3756,18 +3756,14 @@ int sdhci_setup_host(struct sdhci_host *host)
>  		host->flags &= ~SDHCI_USE_ADMA;
>  	}
>  
> -	/*
> -	 * It is assumed that a 64-bit capable device has set a 64-bit DMA mask
> -	 * and *must* do 64-bit DMA.  A driver has the opportunity to change
> -	 * that during the first call to ->enable_dma().  Similarly
> -	 * SDHCI_QUIRK2_BROKEN_64_BIT_DMA must be left to the drivers to
> -	 * implement.
> -	 */
>  	if (sdhci_can_64bit_dma(host))
>  		host->flags |= SDHCI_USE_64_BIT_DMA;
>  
>  	if (host->flags & (SDHCI_USE_SDMA | SDHCI_USE_ADMA)) {
> -		ret = sdhci_set_dma_mask(host);
> +		if (host->ops->set_dma_mask)
> +			ret = host->ops->set_dma_mask(host);
> +		else
> +			ret = sdhci_set_dma_mask(host);
>  
>  		if (!ret && host->ops->enable_dma)
>  			ret = host->ops->enable_dma(host);
> diff --git a/drivers/mmc/host/sdhci.h b/drivers/mmc/host/sdhci.h
> index 902f855efe8f..8285498c0d8a 100644
> --- a/drivers/mmc/host/sdhci.h
> +++ b/drivers/mmc/host/sdhci.h
> @@ -622,6 +622,7 @@ struct sdhci_ops {
>  
>  	u32		(*irq)(struct sdhci_host *host, u32 intmask);
>  
> +	int		(*set_dma_mask)(struct sdhci_host *host);
>  	int		(*enable_dma)(struct sdhci_host *host);
>  	unsigned int	(*get_max_clock)(struct sdhci_host *host);
>  	unsigned int	(*get_min_clock)(struct sdhci_host *host);
> -- 
> 2.23.0
> 

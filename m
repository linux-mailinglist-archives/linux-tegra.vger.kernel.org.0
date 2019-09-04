Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42610A940B
	for <lists+linux-tegra@lfdr.de>; Wed,  4 Sep 2019 22:47:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729968AbfIDUqz (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 4 Sep 2019 16:46:55 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:36193 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727900AbfIDUqz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 4 Sep 2019 16:46:55 -0400
Received: by mail-pf1-f195.google.com with SMTP id y22so45518pfr.3
        for <linux-tegra@vger.kernel.org>; Wed, 04 Sep 2019 13:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=7FpVgaIhgimDRqpweFDbMiGBjSsk/JazcD80okKL/K8=;
        b=B3ZwBoxDNj5wp/W0+6EgPLtyn42FRM4lKEPuGul/INFNVDV0d6vrjAfI74kiYbBjwb
         RtwOAFpFkp8ULzlYQBnaGau4RSDKiK2Sdq8Hjs6JHKbU5On8H56ARMSYggt77ImaOAXR
         Phja5i1TBR6bjGzSRWjJc8EZqzoOHCuT1G+iocES8UWBNVeoOYiRY6HkgRLZvKh5M6Sb
         WHzguaFI/2ByIIVLDKt6nFLW+FJbEXZiBcnjB+VvF1jsWXutZ6GLiXNq+3ly3QHxD/gn
         UhmFNW0RtNQQoSqk6dbh3isqFmSp5AkCvUY6fi5kmUt8vL3neywbb2V1USK8/dnNvSiJ
         Cxug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7FpVgaIhgimDRqpweFDbMiGBjSsk/JazcD80okKL/K8=;
        b=ls1VBoKKK+9sOzi3GHaMbQN5XjVijVtob5NYWFXI1ZKZF10W1egHOmqaWZvw99yre1
         yStAOHoAjGGt37i6g5aUYsmve6sJnLReEzISeGafObYyfDOeM7FFR4mueZdgX/VTRBJS
         vcPeiMPm36tSD1oiVtL5HjyVe8zfVMuEvdKZkFEeAfDdjybonnUJQIEPZkjf5n6OEl4a
         gKRBhRQS1E1y+3ea4cJkNbnV1cqqTHMO0sNTLsphKq83BBfWyKp1clnv7rTYSUyM+Mm6
         3D0vptWcM7QMbKFo+7CU1qDa9JgafutUV8MkXhz2kIm0tQfAEoRJenuxSJTtHp/WqKF5
         sIWA==
X-Gm-Message-State: APjAAAWKTHp34htEktDsnhj5QckGcW4lfNYsnI3USTNk5vQ+wHpjS9AC
        sa22BzMumgUrOvh5vgqGPKneBQ==
X-Google-Smtp-Source: APXvYqx6p9POXMCXKO+7CZNt3OeG669blGTjX7rgKqWleU9xBmKU6iit1LtXZOmDeIMaYc7+Sw+ZcA==
X-Received: by 2002:a63:66c5:: with SMTP id a188mr49168pgc.127.1567630014448;
        Wed, 04 Sep 2019 13:46:54 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id br18sm3019455pjb.20.2019.09.04.13.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2019 13:46:53 -0700 (PDT)
Date:   Wed, 4 Sep 2019 13:46:49 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     broonie@kernel.org, f.fainelli@gmail.com, rjui@broadcom.com,
        sbranden@broadcom.com, eric@anholt.net, wahrenst@gmx.net,
        shc_work@mail.ru, agross@kernel.org, khilman@baylibre.com,
        matthias.bgg@gmail.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, avifishman70@gmail.com, tmaimon77@gmail.com,
        tali.perry1@gmail.com, venture@google.com, yuenn@google.com,
        benjaminfair@google.com, kgene@kernel.org, krzk@kernel.org,
        andi@etezian.org, palmer@sifive.com, paul.walmsley@sifive.com,
        baohua@kernel.org, mripard@kernel.org, wens@csie.org,
        ldewangan@nvidia.com, thierry.reding@gmail.com,
        jonathanh@nvidia.com, yamada.masahiro@socionext.com,
        michal.simek@xilinx.com, bcm-kernel-feedback-list@broadcom.com,
        linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org,
        linux-samsung-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH -next 23/36] spi: spi-qcom-qspi: use
 devm_platform_ioremap_resource() to simplify code
Message-ID: <20190904204649.GF580@tuxbook-pro>
References: <20190904135918.25352-1-yuehaibing@huawei.com>
 <20190904135918.25352-24-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190904135918.25352-24-yuehaibing@huawei.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed 04 Sep 06:59 PDT 2019, YueHaibing wrote:

> Use devm_platform_ioremap_resource() to simplify the code a bit.
> This is detected by coccinelle.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/spi/spi-qcom-qspi.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/spi/spi-qcom-qspi.c b/drivers/spi/spi-qcom-qspi.c
> index a0ad73f..250fd60 100644
> --- a/drivers/spi/spi-qcom-qspi.c
> +++ b/drivers/spi/spi-qcom-qspi.c
> @@ -424,7 +424,6 @@ static int qcom_qspi_probe(struct platform_device *pdev)
>  {
>  	int ret;
>  	struct device *dev;
> -	struct resource *res;
>  	struct spi_master *master;
>  	struct qcom_qspi *ctrl;
>  
> @@ -440,8 +439,7 @@ static int qcom_qspi_probe(struct platform_device *pdev)
>  
>  	spin_lock_init(&ctrl->lock);
>  	ctrl->dev = dev;
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	ctrl->base = devm_ioremap_resource(dev, res);
> +	ctrl->base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(ctrl->base)) {
>  		ret = PTR_ERR(ctrl->base);
>  		goto exit_probe_master_put;
> -- 
> 2.7.4
> 
> 

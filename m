Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E10A71518EB
	for <lists+linux-tegra@lfdr.de>; Tue,  4 Feb 2020 11:35:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727170AbgBDKf3 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 4 Feb 2020 05:35:29 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:12534 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727156AbgBDKf3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 4 Feb 2020 05:35:29 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e3948e20000>; Tue, 04 Feb 2020 02:35:14 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 04 Feb 2020 02:35:28 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 04 Feb 2020 02:35:28 -0800
Received: from [10.21.133.51] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 4 Feb
 2020 10:35:27 +0000
Subject: Re: [PATCH 2/3] drm/tegra: sor: Disable runtime PM on probe failure
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-tegra@vger.kernel.org>
References: <20200131165910.3443936-1-thierry.reding@gmail.com>
 <20200131165910.3443936-2-thierry.reding@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <a250f64f-3576-027c-9cb9-1919609af7b3@nvidia.com>
Date:   Tue, 4 Feb 2020 10:35:25 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200131165910.3443936-2-thierry.reding@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1580812514; bh=R/bOJCKfYHCp6nctoU4DJr7fDBKkRehmzeL/oA7JShk=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=k+4rwTdo2ZZyCYyovyabm2qYHUvCJ2eI8x+m/H6YaRonf3GESNKers68nd4LJM0M3
         /ic5oTQv+fAME4nP0QGKz3uL1buf5G4NE4FL9mFhNCE2S6Bnnj9NgCYKGYc4Lwx/pD
         WAnvis93JY1vM7+qlDYYxXxQGs++LwDDkwzJm6DkNDlfLl1NFEzW+r0feXDRY3pEih
         GNIxDsiAqVooZy4/hoTtBAVR2idZKDDfeBynII1gyRfyOEdBC4JhQOKvwdQc8PxJ13
         0h0LNbHn71QHLk1+VQfwth4tyXAOW+lo0js28bNaOCqOd4mgPv7hg6AmUZvkWkJ/qr
         9nVqhuScWQySg==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 31/01/2020 16:59, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> If the driver fails to probe, make sure to disable runtime PM again.
> 
> While at it, make the cleanup code in ->remove() symmetric.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/sor.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
> index 96cd89bb2e82..aa4e1695b537 100644
> --- a/drivers/gpu/drm/tegra/sor.c
> +++ b/drivers/gpu/drm/tegra/sor.c
> @@ -3926,13 +3926,13 @@ static int tegra_sor_probe(struct platform_device *pdev)
>  				      sor->index);
>  		if (!name) {
>  			err = -ENOMEM;
> -			goto remove;
> +			goto rpm_disable;
>  		}
>  
>  		err = host1x_client_resume(&sor->client);
>  		if (err < 0) {
>  			dev_err(sor->dev, "failed to resume: %d\n", err);
> -			goto remove;
> +			goto rpm_disable;
>  		}
>  
>  		sor->clk_pad = tegra_clk_sor_pad_register(sor, name);
> @@ -3943,7 +3943,7 @@ static int tegra_sor_probe(struct platform_device *pdev)
>  		err = PTR_ERR(sor->clk_pad);
>  		dev_err(&pdev->dev, "failed to register SOR pad clock: %d\n",
>  			err);
> -		goto remove;
> +		goto rpm_disable;
>  	}
>  
>  	INIT_LIST_HEAD(&sor->client.list);
> @@ -3954,11 +3954,13 @@ static int tegra_sor_probe(struct platform_device *pdev)
>  	if (err < 0) {
>  		dev_err(&pdev->dev, "failed to register host1x client: %d\n",
>  			err);
> -		goto remove;
> +		goto rpm_disable;
>  	}
>  
>  	return 0;
>  
> +rpm_disable:
> +	pm_runtime_disable(&pdev->dev);
>  remove:
>  	if (sor->ops && sor->ops->remove)
>  		sor->ops->remove(sor);
> @@ -3972,8 +3974,6 @@ static int tegra_sor_remove(struct platform_device *pdev)
>  	struct tegra_sor *sor = platform_get_drvdata(pdev);
>  	int err;
>  
> -	pm_runtime_disable(&pdev->dev);
> -
>  	err = host1x_client_unregister(&sor->client);
>  	if (err < 0) {
>  		dev_err(&pdev->dev, "failed to unregister host1x client: %d\n",
> @@ -3981,6 +3981,8 @@ static int tegra_sor_remove(struct platform_device *pdev)
>  		return err;
>  	}
>  
> +	pm_runtime_disable(&pdev->dev);
> +
>  	if (sor->ops && sor->ops->remove) {
>  		err = sor->ops->remove(sor);
>  		if (err < 0)
> 

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
Tested-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic

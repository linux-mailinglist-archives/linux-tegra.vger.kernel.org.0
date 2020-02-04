Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A51721518FF
	for <lists+linux-tegra@lfdr.de>; Tue,  4 Feb 2020 11:47:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726596AbgBDKrv (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 4 Feb 2020 05:47:51 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:13045 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726574AbgBDKrv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 4 Feb 2020 05:47:51 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e394bc80000>; Tue, 04 Feb 2020 02:47:36 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 04 Feb 2020 02:47:50 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 04 Feb 2020 02:47:50 -0800
Received: from [10.21.133.51] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 4 Feb
 2020 10:47:49 +0000
Subject: Re: [PATCH 3/3] drm/tegra: sor: Initialize runtime PM before use
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-tegra@vger.kernel.org>
References: <20200131165910.3443936-1-thierry.reding@gmail.com>
 <20200131165910.3443936-3-thierry.reding@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <24e03844-0c2f-4e2a-8886-9211c28e97c3@nvidia.com>
Date:   Tue, 4 Feb 2020 10:47:47 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200131165910.3443936-3-thierry.reding@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1580813256; bh=mkxIxmN71Y28rCQE0GypfXE2TVPh0ZiIwH11Yn1Q6rI=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=L3WUgcFbMIT77+hE5LuUjl7uajaUek90lZcefqTVib9zePdJKdLMJgubKNKnWy706
         6fKIrOG/RuUgdcpxoNLdEJCfOSa1zuJPM06xWLDRdwt0YoHW8+XEwDH946iSFvksHE
         tO/19aSJEjNh4n+IRsJBMDsUfn9PA78ZZIS7WSQCIt13iZcnb84fDCvZBzVAInw5ip
         o6ftn8pkeeE5DFDL0E/GnY/AFZu3gX/t3QBv6P5uNaHiB976A0PN/9+uTBVXUjwjFd
         cH9miaCVEp9ZHnFq1EVPGerm6Gmm/rdu+9UcYbPO7r0CW7ZJM5MnaaCyLvxFiUHyTr
         tXfIceQQOtbSA==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 31/01/2020 16:59, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Commit fd67e9c6ed5a ("drm/tegra: Do not implement runtime PM") replaced
> the generic runtime PM usage by a host1x bus-specific implementation in
> order to work around some assumptions baked into runtime PM that are in
> conflict with the requirements in the Tegra DRM driver.
> 
> Unfortunately the new runtime PM callbacks are not setup yet at the time
> when the SOR driver first needs to resume the device to register the SOR
> pad clock, and accesses to register will cause the system to hang.
> 
> Note that this only happens on Tegra124 and Tegra210 because those are
> the only SoCs where the SOR pad clock is registered from the SOR driver.
> Later generations use a SOR pad clock provided by the BPMP.
> 
> Fix this by moving the registration of the SOR pad clock after the
> host1x client has been registered. That's somewhat suboptimal because
> this could potentially, though it's very unlikely, cause the Tegra DRM
> to be probed if the SOR happens to be the last subdevice to register,
> only to be immediately removed again if the SOR pad output clock fails
> to register. That's just a minor annoyance, though, and doesn't justify
> implementing a workaround.
> 
> Fixes: fd67e9c6ed5a ("drm/tegra: Do not implement runtime PM")
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/sor.c | 32 +++++++++++++++++---------------
>  1 file changed, 17 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
> index aa4e1695b537..81226a4953c1 100644
> --- a/drivers/gpu/drm/tegra/sor.c
> +++ b/drivers/gpu/drm/tegra/sor.c
> @@ -3915,6 +3915,17 @@ static int tegra_sor_probe(struct platform_device *pdev)
>  	platform_set_drvdata(pdev, sor);
>  	pm_runtime_enable(&pdev->dev);
>  
> +	INIT_LIST_HEAD(&sor->client.list);
> +	sor->client.ops = &sor_client_ops;
> +	sor->client.dev = &pdev->dev;
> +
> +	err = host1x_client_register(&sor->client);
> +	if (err < 0) {
> +		dev_err(&pdev->dev, "failed to register host1x client: %d\n",
> +			err);
> +		goto rpm_disable;
> +	}
> +
>  	/*
>  	 * On Tegra210 and earlier, provide our own implementation for the
>  	 * pad output clock.
> @@ -3926,13 +3937,13 @@ static int tegra_sor_probe(struct platform_device *pdev)
>  				      sor->index);
>  		if (!name) {
>  			err = -ENOMEM;
> -			goto rpm_disable;
> +			goto unregister;
>  		}
>  
>  		err = host1x_client_resume(&sor->client);
>  		if (err < 0) {
>  			dev_err(sor->dev, "failed to resume: %d\n", err);
> -			goto rpm_disable;
> +			goto unregister;
>  		}
>  
>  		sor->clk_pad = tegra_clk_sor_pad_register(sor, name);
> @@ -3941,24 +3952,15 @@ static int tegra_sor_probe(struct platform_device *pdev)
>  
>  	if (IS_ERR(sor->clk_pad)) {
>  		err = PTR_ERR(sor->clk_pad);
> -		dev_err(&pdev->dev, "failed to register SOR pad clock: %d\n",
> +		dev_err(sor->dev, "failed to register SOR pad clock: %d\n",
>  			err);
> -		goto rpm_disable;
> -	}
> -
> -	INIT_LIST_HEAD(&sor->client.list);
> -	sor->client.ops = &sor_client_ops;
> -	sor->client.dev = &pdev->dev;
> -
> -	err = host1x_client_register(&sor->client);
> -	if (err < 0) {
> -		dev_err(&pdev->dev, "failed to register host1x client: %d\n",
> -			err);
> -		goto rpm_disable;
> +		goto unregister;
>  	}
>  
>  	return 0;
>  
> +unregister:
> +	host1x_client_unregister(&sor->client);
>  rpm_disable:
>  	pm_runtime_disable(&pdev->dev);
>  remove:
> 

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
Tested-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic

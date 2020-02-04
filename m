Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EF161518D4
	for <lists+linux-tegra@lfdr.de>; Tue,  4 Feb 2020 11:31:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726230AbgBDKbf (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 4 Feb 2020 05:31:35 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:14184 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726479AbgBDKbf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 4 Feb 2020 05:31:35 -0500
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e3947ef0000>; Tue, 04 Feb 2020 02:31:11 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 04 Feb 2020 02:31:34 -0800
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 04 Feb 2020 02:31:34 -0800
Received: from [10.21.133.51] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 4 Feb
 2020 10:31:34 +0000
Subject: Re: [PATCH 1/3] drm/tegra: sor: Suspend on clock registration failure
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-tegra@vger.kernel.org>
References: <20200131165910.3443936-1-thierry.reding@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <ac6cbd0c-d2ea-c085-ecfc-3fd761649f1b@nvidia.com>
Date:   Tue, 4 Feb 2020 10:31:31 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200131165910.3443936-1-thierry.reding@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1580812271; bh=rXHNiqCbOxTvbgB7x3hcEzgvUWKKzxQ6kktM8ngyKhw=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=LiIKVj3q7XMRqjd5tXYQUmJ4ItXBDEDo0UQgwW/2Fn0smkkkwetYrDB5nRLgCQSa3
         a6B9hCjv/GFHOhKrcHZPCm2PVJFKZ89EwxV7cV8ffYE6rHSJDdeG/jsYXZUSpWTR8/
         5wtkRnKD2CFVwcEAEvzwBxOnc0J75CR7SCXwq8s14aHay+NkccmB+Ok6gLtOOG+1tk
         iv1X//DbC1Iq4vkuE/K4CujRPsaquSsjdWQdOSJ1Hryi1q9FMQNY7z80z8HA++bk/0
         HZwBsabhkIkyvq2B/DxaNK+xTxpoG7Rr0hlzky0s2vVlSx339W22vzT0r6f+vRVehK
         4T0t1I4Hr23Yg==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 31/01/2020 16:59, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Make sure the SOR module is suspenden after we fail to register the SOR
> pad output clock.

s/suspenden/suspended/

> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/sor.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
> index 41d24949478e..96cd89bb2e82 100644
> --- a/drivers/gpu/drm/tegra/sor.c
> +++ b/drivers/gpu/drm/tegra/sor.c
> @@ -3922,15 +3922,16 @@ static int tegra_sor_probe(struct platform_device *pdev)
>  	if (!sor->clk_pad) {
>  		char *name;
>  
> -		err = host1x_client_resume(&sor->client);
> -		if (err < 0) {
> -			dev_err(sor->dev, "failed to resume: %d\n", err);
> +		name = devm_kasprintf(sor->dev, GFP_KERNEL, "sor%u_pad_clkout",
> +				      sor->index);
> +		if (!name) {
> +			err = -ENOMEM;
>  			goto remove;
>  		}
>  
> -		name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "sor%u_pad_clkout", sor->index);
> -		if (!name) {
> -			err = -ENOMEM;
> +		err = host1x_client_resume(&sor->client);
> +		if (err < 0) {
> +			dev_err(sor->dev, "failed to resume: %d\n", err);
>  			goto remove;
>  		}
>  
> 

Otherwise ...

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
Tested-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic

Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A8C31B0EC3
	for <lists+linux-tegra@lfdr.de>; Mon, 20 Apr 2020 16:43:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726067AbgDTOnn (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 20 Apr 2020 10:43:43 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:1138 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725971AbgDTOnn (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 20 Apr 2020 10:43:43 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e9db4ac0000>; Mon, 20 Apr 2020 07:41:48 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Mon, 20 Apr 2020 07:43:42 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Mon, 20 Apr 2020 07:43:42 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 20 Apr
 2020 14:43:42 +0000
Received: from [10.26.73.5] (172.20.13.39) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 20 Apr
 2020 14:43:41 +0000
Subject: Re: [PATCH 1/2] soc/tegra: pmc: Enable PMIC wake event on Tegra186
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-tegra@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20200417171117.2556374-1-thierry.reding@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <ad9192c3-9835-0fb4-e4c5-9d719ba92d84@nvidia.com>
Date:   Mon, 20 Apr 2020 15:43:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200417171117.2556374-1-thierry.reding@gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1587393708; bh=GDcM0WjtKn4CMjkOnt2tPavdqktD1Z7rMLK1tu/JR0A=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=mGU/x2zkEg8aeIUk9eMSpFR/iIhKdZtSG+eNzkd4HZ6fAAPEKgWxKqefHZY78+BJQ
         mu6fLtWI6U1e/r4BxBaFK9jDJYmXtEzKtGxJCejCiUphAlqFiTtf4017GzufMyVBj9
         xRJ827Yh01KDVsmeeEP8D2RhiiZBZnHTm+d3X5eWqnqg+vGtvfdcDlmDb2OHBIc1vi
         FdmwLAhZTXRH9sSHgiwigvYXjcx05G16R5YbuwaSNnG/M1gsk5CsZq72I3Gx5IMeaG
         tYJegRNbGYOyvcYwKJnFjt5T80MZHgo5as54cMfY9VkFOZXfIrTjdYgNUIcC97hnDS
         5dRz4ocaSJ9GA==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 17/04/2020 18:11, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The PMIC wake event can be used to bring the system out of suspend based
> on certain events happening on the PMIC (such as an RTC alarm).
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/soc/tegra/pmc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index 1c533a969f54..72cfda7305d5 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
> @@ -3193,6 +3193,7 @@ static void tegra186_pmc_setup_irq_polarity(struct tegra_pmc *pmc,
>  }
>  
>  static const struct tegra_wake_event tegra186_wake_events[] = {
> +	TEGRA_WAKE_IRQ("pmu", 24, 209),
>  	TEGRA_WAKE_GPIO("power", 29, 1, TEGRA186_AON_GPIO(FF, 0)),
>  	TEGRA_WAKE_IRQ("rtc", 73, 10),
>  };
> 

Acked-by: Jon Hunter <jonathanh@nvidia.com>
Tested-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic

Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3FAE30B61
	for <lists+linux-tegra@lfdr.de>; Fri, 31 May 2019 11:24:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726376AbfEaJYc (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 31 May 2019 05:24:32 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:1195 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726240AbfEaJYc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 31 May 2019 05:24:32 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cf0f2ce0003>; Fri, 31 May 2019 02:24:31 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 31 May 2019 02:24:31 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 31 May 2019 02:24:31 -0700
Received: from [10.21.132.148] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 31 May
 2019 09:24:29 +0000
Subject: Re: [PATCH 1/2] soc/tegra: pmc: Fail to allocate more than one wake
 IRQ
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     Bitan Biswas <bbiswas@nvidia.com>, <linux-tegra@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20190529102654.14665-1-thierry.reding@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <f7b6923f-4e27-83ae-8ef9-3488d1720416@nvidia.com>
Date:   Fri, 31 May 2019 10:24:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190529102654.14665-1-thierry.reding@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL104.nvidia.com (172.18.146.11) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1559294671; bh=KLwRN9Cn3fxaHjxsKpmVMqhjSDH7QSAFdgUSmjgRLG4=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=N3g6PmTj2TAUP+nROQzxQRTjIe72QGmTl1JJzFwIYbqfW4v4X9fesTsSQl5yTL3ao
         KxOG71EKZvYLgHnuDp3JWFnva/HxCXjLg27v4ws6ThLjnWwmawWAU4c5IuUXpitPYs
         5pmUgcFy79hFmd3bi4QWYARYORFCEZhxYDIKd2liR6P2eLTfFKIVo8NQrgZQWMtpiV
         yyEHbVAtT8jpefVdu/EaE+VjtGsw7hjNNr4V32gsne3QGzgMSCShVMB6HMXt1ySl7C
         Ix6xqc9aJRa1DyDyFXtuYyD7OUd5Vp83VloMVvotKqbyBApNTUOdt1cnFMrghN8OFt
         4CMKifKr4tKqw==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 29/05/2019 11:26, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The code currently doesn't support allocating more than one wake IRQ at
> a time. Detect this situation and error out. Also make sure to output a
> warning when that happens to help track down callers.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/soc/tegra/pmc.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index 5648e5c09ef5..653fe2c466f6 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
> @@ -1863,6 +1863,9 @@ static int tegra_pmc_irq_alloc(struct irq_domain *domain, unsigned int virq,
>  	unsigned int i;
>  	int err = 0;
>  
> +	if (WARN_ON(num_irqs > 1))
> +		return -EINVAL;
> +
>  	for (i = 0; i < soc->num_wake_events; i++) {
>  		const struct tegra_wake_event *event = &soc->wake_events[i];

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic

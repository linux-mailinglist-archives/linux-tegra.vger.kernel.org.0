Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B83334D83
	for <lists+linux-tegra@lfdr.de>; Tue,  4 Jun 2019 18:32:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727491AbfFDQb7 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 4 Jun 2019 12:31:59 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:9934 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727463AbfFDQb6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 4 Jun 2019 12:31:58 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cf69cf10000>; Tue, 04 Jun 2019 09:31:45 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 04 Jun 2019 09:31:58 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 04 Jun 2019 09:31:58 -0700
Received: from [10.26.11.65] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 4 Jun
 2019 16:31:56 +0000
Subject: Re: [PATCH v2 3/3] soc/tegra: pmc: Add comments clarifying wake
 events
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-tegra@vger.kernel.org>, Bitan Biswas <bbiswas@nvidia.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20190604155135.25390-1-thierry.reding@gmail.com>
 <20190604155135.25390-3-thierry.reding@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <dc233c45-ca13-7a75-02a7-ebdd41a730a5@nvidia.com>
Date:   Tue, 4 Jun 2019 17:31:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190604155135.25390-3-thierry.reding@gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1559665905; bh=Rlldz+L4DSGAGwyFBCca76UxT7hl6blZ1Oap3fqgSGQ=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=TqnHNeIdjhRMM+zpvBnhfSg6NkTxpP4fz1aJdVNPT4FEXy6PXSrbaQi3NBgDGy2gG
         pa+/n9w3mmil3RC5HsqZhpXMP70lu/d7kVBTFnt7nKGMzKQqg7gkCoGhUJbkeJCtGy
         0Ui7t+gYexND7CNHCxP9YjiEoQgHTOBXvqc2tnDuwsAglh+TSV6DjyjtLimynFq11u
         XFo/ce/DgUM6XVODecjwEd83YXj/xICJ4/z/cX5cnJn28uajBdoIqoTi/AMKy/CWch
         R4yzjOlWKfrVQsHc05P4R6z4/vVPdgeNRg66oaqivwn2nIYX+2ARPeyOlBs3QyJYwI
         Y2weqTXRmLz4w==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 04/06/2019 16:51, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Add some comments to clarify the purpose of the wake event support
> implemented in the PMC driver.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/soc/tegra/pmc.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index 6e66b5e293be..af8f63a844cd 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
> @@ -241,6 +241,11 @@ struct tegra_pmc_soc {
>  	const char * const *reset_levels;
>  	unsigned int num_reset_levels;
>  
> +	/*
> +	 * These describe events that can wake the system from sleep (i.e.
> +	 * LP0 or SC7). Wakeup from other sleep states (such as LP1 or LP2)
> +	 * are dealt with in the LIC.
> +	 */
>  	const struct tegra_wake_event *wake_events;
>  	unsigned int num_wake_events;
>  };
> @@ -1906,6 +1911,11 @@ static int tegra_pmc_irq_alloc(struct irq_domain *domain, unsigned int virq,
>  		}
>  	}
>  
> +	/*
> +	 * For interrupts that don't have associated wake events, assign a
> +	 * dummy hardware IRQ number. This is used in the ->irq_set_type()
> +	 * and ->irq_set_wake() callbacks to return early for these IRQs.
> +	 */
>  	if (i == soc->num_wake_events)
>  		err = irq_domain_set_hwirq_and_chip(domain, virq, ULONG_MAX,
>  						    &pmc->irq, pmc);
> @@ -1924,6 +1934,7 @@ static int tegra_pmc_irq_set_wake(struct irq_data *data, unsigned int on)
>  	unsigned int offset, bit;
>  	u32 value;
>  
> +	/* nothing to do if there's no associated wake event */
>  	if (WARN_ON(data->hwirq == ULONG_MAX))
>  		return 0;
>  
> @@ -1954,6 +1965,7 @@ static int tegra_pmc_irq_set_type(struct irq_data *data, unsigned int type)
>  	struct tegra_pmc *pmc = irq_data_get_irq_chip_data(data);
>  	u32 value;
>  
> +	/* nothing to do if there's no associated wake event */
>  	if (data->hwirq == ULONG_MAX)
>  		return 0;
>  

For the series ...

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon


-- 
nvpublic

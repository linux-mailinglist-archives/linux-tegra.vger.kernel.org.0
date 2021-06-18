Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5E913AC5D2
	for <lists+linux-tegra@lfdr.de>; Fri, 18 Jun 2021 10:18:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229848AbhFRIUc (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 18 Jun 2021 04:20:32 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:58440 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232432AbhFRIU3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 18 Jun 2021 04:20:29 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
        (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id B86E81FDAE;
        Fri, 18 Jun 2021 08:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1624004299; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=pa7b7Pw8sA8zwHZDxho7/WUN3oKYPtEDei9SP6EGwf4=;
        b=0d9+14AcmNFaXYFo2vHJn1fbyloCp3Y29Lhk1cjfTfUVqe5jOXZZQKPMX8rz4JQuEi7RdK
        31S+9x6BRuQXd62oKuZUXl4rsmg/7hoDS27n8vad/6Jhhqfs1r3R6DDde1K523gopZeBrr
        et62Lq2bnI/INkIu4dbv0K9+WAXjWls=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1624004299;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=pa7b7Pw8sA8zwHZDxho7/WUN3oKYPtEDei9SP6EGwf4=;
        b=kpmCUledRWLBhwIpqwKQzLM9bjB/mQy2YlQjljprPxlL/wkOvSMciO610edYzfUAgKifXy
        lhTNM0ZRebO1CYAA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
        by imap.suse.de (Postfix) with ESMTP id 82281118DD;
        Fri, 18 Jun 2021 08:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1624004299; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=pa7b7Pw8sA8zwHZDxho7/WUN3oKYPtEDei9SP6EGwf4=;
        b=0d9+14AcmNFaXYFo2vHJn1fbyloCp3Y29Lhk1cjfTfUVqe5jOXZZQKPMX8rz4JQuEi7RdK
        31S+9x6BRuQXd62oKuZUXl4rsmg/7hoDS27n8vad/6Jhhqfs1r3R6DDde1K523gopZeBrr
        et62Lq2bnI/INkIu4dbv0K9+WAXjWls=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1624004299;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=pa7b7Pw8sA8zwHZDxho7/WUN3oKYPtEDei9SP6EGwf4=;
        b=kpmCUledRWLBhwIpqwKQzLM9bjB/mQy2YlQjljprPxlL/wkOvSMciO610edYzfUAgKifXy
        lhTNM0ZRebO1CYAA==
Received: from director2.suse.de ([192.168.254.72])
        by imap3-int with ESMTPSA
        id mu12HstWzGDHcwAALh3uQQ
        (envelope-from <ykaukab@suse.de>); Fri, 18 Jun 2021 08:18:19 +0000
Date:   Fri, 18 Jun 2021 10:18:11 +0200
From:   Mian Yousaf Kaukab <ykaukab@suse.de>
To:     Mikko Perttunen <mperttunen@nvidia.com>
Cc:     arnd@arndb.de, gregkh@linuxfoundation.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] misc: sram: Only map reserved areas in Tegra SYSRAM
Message-ID: <20210618081811.GA81946@suse.de>
References: <20210617094804.667716-1-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210617094804.667716-1-mperttunen@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Jun 17, 2021 at 12:48:04PM +0300, Mikko Perttunen wrote:
> On Tegra186 and later, a portion of the SYSRAM may be reserved for use
> by TZ. Non-TZ memory accesses to this portion, including speculative
> accesses, trigger SErrors that bring down the system. This does also
> happen in practice occasionally (due to speculative accesses).
> 
> To fix the issue, add a flag to the SRAM driver to only map the
> device tree-specified reserved areas depending on a flag set
> based on the compatibility string. This would not affect non-Tegra
> systems that rely on the entire thing being memory mapped.
> 
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  drivers/misc/sram.c | 108 +++++++++++++++++++++++++++++++-------------
>  drivers/misc/sram.h |   9 ++++
>  2 files changed, 86 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/misc/sram.c b/drivers/misc/sram.c
> index 93638ae2753a..a27ffb3dbea8 100644
> --- a/drivers/misc/sram.c
> +++ b/drivers/misc/sram.c
> @@ -97,7 +97,24 @@ static int sram_add_partition(struct sram_dev *sram, struct sram_reserve *block,
>  	struct sram_partition *part = &sram->partition[sram->partitions];
>  
>  	mutex_init(&part->lock);
> -	part->base = sram->virt_base + block->start;
> +
> +	if (sram->config->map_only_reserved) {
> +		void *virt_base;
> +
> +		if (sram->no_memory_wc)
> +			virt_base = devm_ioremap_resource(sram->dev, &block->res);
> +		else
> +			virt_base = devm_ioremap_resource_wc(sram->dev, &block->res);
> +
> +		if (IS_ERR(virt_base)) {
> +			dev_err(sram->dev, "could not map SRAM at %pr\n", &block->res);
> +			return PTR_ERR(virt_base);
> +		}
> +
> +		part->base = virt_base;
> +	} else {
> +		part->base = sram->virt_base + block->start;
> +	}
>  
>  	if (block->pool) {
>  		ret = sram_add_pool(sram, block, start, part);
> @@ -198,6 +215,7 @@ static int sram_reserve_regions(struct sram_dev *sram, struct resource *res)
>  
>  		block->start = child_res.start - res->start;
>  		block->size = resource_size(&child_res);
> +		block->res = child_res;
>  		list_add_tail(&block->list, &reserve_list);
>  
>  		if (of_find_property(child, "export", NULL))
> @@ -295,15 +313,17 @@ static int sram_reserve_regions(struct sram_dev *sram, struct resource *res)
>  		 */
>  		cur_size = block->start - cur_start;
>  
> -		dev_dbg(sram->dev, "adding chunk 0x%lx-0x%lx\n",
> -			cur_start, cur_start + cur_size);
> +		if (sram->pool) {
> +			dev_dbg(sram->dev, "adding chunk 0x%lx-0x%lx\n",
> +				cur_start, cur_start + cur_size);
>  
> -		ret = gen_pool_add_virt(sram->pool,
> -				(unsigned long)sram->virt_base + cur_start,
> -				res->start + cur_start, cur_size, -1);
> -		if (ret < 0) {
> -			sram_free_partitions(sram);
> -			goto err_chunks;
> +			ret = gen_pool_add_virt(sram->pool,
> +					(unsigned long)sram->virt_base + cur_start,
> +					res->start + cur_start, cur_size, -1);
> +			if (ret < 0) {
> +				sram_free_partitions(sram);
> +				goto err_chunks;
> +			}
>  		}
>  
>  		/* next allocation after this reserved block */
> @@ -331,40 +351,66 @@ static int atmel_securam_wait(void)
>  					10000, 500000);
>  }
>  
> +static const struct sram_config default_config = {
> +};
> +
> +static const struct sram_config atmel_securam_config = {
> +	.init = atmel_securam_wait
> +};
> +
> +/*
> + * SYSRAM contains areas that are not accessible by the
> + * kernel, such as the first 256K that is reserved for TZ.
> + * Accesses to those areas (including speculative accesses)
> + * trigger SErrors. As such we must map only the areas of
> + * SYSRAM specified in the device tree.
> + */
> +static const struct sram_config tegra_sysram_config = {
> +	.map_only_reserved = true,

In case of Tegra sram base is 64K aligned and the reserved partitions
are 4K aligned. How this flag will work if the kernel is using 64K
page size?

> +};
> +
>  static const struct of_device_id sram_dt_ids[] = {
> -	{ .compatible = "mmio-sram" },
> -	{ .compatible = "atmel,sama5d2-securam", .data = atmel_securam_wait },
> +	{ .compatible = "mmio-sram", .data = &default_config },
> +	{ .compatible = "atmel,sama5d2-securam", .data = &atmel_securam_config },
> +	{ .compatible = "nvidia,tegra186-sysram", .data = &tegra_sysram_config },
> +	{ .compatible = "nvidia,tegra194-sysram", .data = &tegra_sysram_config },
>  	{}
>  };
>  
>  static int sram_probe(struct platform_device *pdev)
>  {
> +	const struct sram_config *config;
>  	struct sram_dev *sram;
>  	int ret;
>  	struct resource *res;
> -	int (*init_func)(void);
> +
> +	config = of_device_get_match_data(&pdev->dev);
>  
>  	sram = devm_kzalloc(&pdev->dev, sizeof(*sram), GFP_KERNEL);
>  	if (!sram)
>  		return -ENOMEM;
>  
>  	sram->dev = &pdev->dev;
> +	sram->no_memory_wc = of_property_read_bool(pdev->dev.of_node, "no-memory-wc");
> +	sram->config = config;
> +
> +	if (!config->map_only_reserved) {
> +		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +		if (sram->no_memory_wc)
> +			sram->virt_base = devm_ioremap_resource(&pdev->dev, res);
> +		else
> +			sram->virt_base = devm_ioremap_resource_wc(&pdev->dev, res);
> +		if (IS_ERR(sram->virt_base)) {
> +			dev_err(&pdev->dev, "could not map SRAM registers\n");
> +			return PTR_ERR(sram->virt_base);
> +		}
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (of_property_read_bool(pdev->dev.of_node, "no-memory-wc"))
> -		sram->virt_base = devm_ioremap_resource(&pdev->dev, res);
> -	else
> -		sram->virt_base = devm_ioremap_resource_wc(&pdev->dev, res);
> -	if (IS_ERR(sram->virt_base)) {
> -		dev_err(&pdev->dev, "could not map SRAM registers\n");
> -		return PTR_ERR(sram->virt_base);
> +		sram->pool = devm_gen_pool_create(sram->dev, ilog2(SRAM_GRANULARITY),
> +						  NUMA_NO_NODE, NULL);
> +		if (IS_ERR(sram->pool))
> +			return PTR_ERR(sram->pool);
>  	}
>  
> -	sram->pool = devm_gen_pool_create(sram->dev, ilog2(SRAM_GRANULARITY),
> -					  NUMA_NO_NODE, NULL);
> -	if (IS_ERR(sram->pool))
> -		return PTR_ERR(sram->pool);
> -
>  	sram->clk = devm_clk_get(sram->dev, NULL);
>  	if (IS_ERR(sram->clk))
>  		sram->clk = NULL;
> @@ -378,15 +424,15 @@ static int sram_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, sram);
>  
> -	init_func = of_device_get_match_data(&pdev->dev);
> -	if (init_func) {
> -		ret = init_func();
> +	if (config->init) {
> +		ret = config->init();
>  		if (ret)
>  			goto err_free_partitions;
>  	}
>  
> -	dev_dbg(sram->dev, "SRAM pool: %zu KiB @ 0x%p\n",
> -		gen_pool_size(sram->pool) / 1024, sram->virt_base);
> +	if (sram->pool)
> +		dev_dbg(sram->dev, "SRAM pool: %zu KiB @ 0x%p\n",
> +			gen_pool_size(sram->pool) / 1024, sram->virt_base);
>  
>  	return 0;
>  
> @@ -405,7 +451,7 @@ static int sram_remove(struct platform_device *pdev)
>  
>  	sram_free_partitions(sram);
>  
> -	if (gen_pool_avail(sram->pool) < gen_pool_size(sram->pool))
> +	if (sram->pool && gen_pool_avail(sram->pool) < gen_pool_size(sram->pool))
>  		dev_err(sram->dev, "removed while SRAM allocated\n");
>  
>  	if (sram->clk)
> diff --git a/drivers/misc/sram.h b/drivers/misc/sram.h
> index 9c1d21ff7347..d2058d8c8f1d 100644
> --- a/drivers/misc/sram.h
> +++ b/drivers/misc/sram.h
> @@ -5,6 +5,11 @@
>  #ifndef __SRAM_H
>  #define __SRAM_H
>  
> +struct sram_config {
> +	int (*init)(void);
> +	bool map_only_reserved;
> +};
> +
>  struct sram_partition {
>  	void __iomem *base;
>  
> @@ -15,8 +20,11 @@ struct sram_partition {
>  };
>  
>  struct sram_dev {
> +	const struct sram_config *config;
> +
>  	struct device *dev;
>  	void __iomem *virt_base;
> +	bool no_memory_wc;
>  
>  	struct gen_pool *pool;
>  	struct clk *clk;
> @@ -29,6 +37,7 @@ struct sram_reserve {
>  	struct list_head list;
>  	u32 start;
>  	u32 size;
> +	struct resource res;
>  	bool export;
>  	bool pool;
>  	bool protect_exec;
> -- 
> 2.30.1

BR,
Yousaf

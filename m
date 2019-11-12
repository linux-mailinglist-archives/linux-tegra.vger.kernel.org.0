Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B7C9F878D
	for <lists+linux-tegra@lfdr.de>; Tue, 12 Nov 2019 05:44:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726924AbfKLEoH (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 11 Nov 2019 23:44:07 -0500
Received: from rere.qmqm.pl ([91.227.64.183]:32916 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726923AbfKLEoH (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 11 Nov 2019 23:44:07 -0500
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 47Bw7c1cXmzLy;
        Tue, 12 Nov 2019 05:41:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1573533708; bh=tqOyVLWUac6OOO3gR+cgMNIN+eibE6PTzrGvhWVWDmM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RrQoYJa+WJ/FCzjbenAqwPl8GpLssAPP+0XQuS65VFq/16ngZL5eA1LL3etWJFrsd
         vU6g6i/uFawkcLDSwO5hXchAehUzeQFE1hn5R/O3WYsyklUNaXE7B4reaSAdyhYTX0
         S1s3aLnRCIrQsah0sr01ywekJkjtyg1J3yGFr9XLzk1j6dNg6TTXR6DUchvh+NPn86
         gnhnkCpHWrsVJwG+CeaoZ19E5Gv28q8zAERkUrJIH0JFzIxptVUXOi7BipFCNQXyxt
         W7JpAX/xlAXZk2PxJk9wdTRtM1Srp6I3XIaeQm6LIqKvWIxUTAzazEbhjXx8aUCr6T
         3tMJvuk1QY+uA==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.101.4 at mail
Date:   Tue, 12 Nov 2019 05:44:01 +0100
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 1/3] soc/tegra: fuse: Cache values of straps and Chip
 ID registers
Message-ID: <20191112044401.GA13124@qmqm.qmqm.pl>
References: <20191111212637.22648-1-digetx@gmail.com>
 <20191111212637.22648-2-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191111212637.22648-2-digetx@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Nov 12, 2019 at 12:26:35AM +0300, Dmitry Osipenko wrote:
> There is no need to re-read Chip ID and HW straps out from hardware each
> time, it is a bit nicer to cache the values in memory.
[...]
> @@ -103,6 +97,7 @@ void __init tegra_init_revision(void)
>  
>  void __init tegra_init_apbmisc(void)
>  {
> +	void __iomem *apbmisc_base, *strapping_base;
>  	struct resource apbmisc, straps;
>  	struct device_node *np;
>  
> @@ -162,10 +157,14 @@ void __init tegra_init_apbmisc(void)
>  	apbmisc_base = ioremap_nocache(apbmisc.start, resource_size(&apbmisc));
>  	if (!apbmisc_base)
>  		pr_err("failed to map APBMISC registers\n");
> +	else
> +		chipid = readl_relaxed(apbmisc_base + 4);
>  
>  	strapping_base = ioremap_nocache(straps.start, resource_size(&straps));
>  	if (!strapping_base)
>  		pr_err("failed to map strapping options registers\n");
> +	else
> +		strapping = readl_relaxed(strapping_base);
>  
>  	long_ram_code = of_property_read_bool(np, "nvidia,long-ram-code");
>  }

Since this no longer uses the mappings after init, you could iounmap()
them here.

Best Regards,
Micha³ Miros³aw 

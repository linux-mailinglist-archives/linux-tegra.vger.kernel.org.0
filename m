Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98E5D100415
	for <lists+linux-tegra@lfdr.de>; Mon, 18 Nov 2019 12:28:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726518AbfKRL1o (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 18 Nov 2019 06:27:44 -0500
Received: from hqemgate16.nvidia.com ([216.228.121.65]:5079 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726464AbfKRL1o (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 18 Nov 2019 06:27:44 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5dd280300000>; Mon, 18 Nov 2019 03:27:44 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 18 Nov 2019 03:27:43 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 18 Nov 2019 03:27:43 -0800
Received: from [10.26.11.241] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 18 Nov
 2019 11:27:42 +0000
Subject: Re: [PATCH v1] memory: tegra30-emc: Fix panic on suspend
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-tegra@vger.kernel.org>
References: <20191115162642.11397-1-digetx@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <e94db40c-9084-231a-385b-8f49762c8889@nvidia.com>
Date:   Mon, 18 Nov 2019 11:27:39 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191115162642.11397-1-digetx@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1574076464; bh=9e6kluJK5G79AaxwH0IyKVSI7xgRBhP3aqlRH4nONZA=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=UmOKxvoaHb3PAInUsTTY962NAA3N9+YszpHOIMbOLQm9t0U1HHOkj05FgfX5VyDgW
         U7anhuccYghk9lVv7nC7rL1a6ILWu1nHJzRkf9CcULXxDHdgoOnGghZQsbt4fAKL1/
         kY+A4FdoreH4YOqHdau30WAhQMSzf6Yv/x25PluBi3jLTamwRZMe+ecr7QVHn2X3AN
         wiBKsxl3sqJIbcdZg+zD2tb1kBbwxnvwmUZetNGgYrHoRdeLIg3BGd/tD1Rh8jphVo
         Pzzy2F/y+ImJo/Hnwg1ieRS7efjhln8frt4EnlN+B10LnQy3W6V7+LSBkLzPXF0XsX
         meqmFC6V/LmBw==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 15/11/2019 16:26, Dmitry Osipenko wrote:
> Trying to suspend driver results in a crash if timings aren't available in
> device-tree.
> 
> Reported-by: Jon Hunter <jonathanh@nvidia.com>
> Fixes: e34212c75a68 ("memory: tegra: Introduce Tegra30 EMC driver")
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/memory/tegra/tegra30-emc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/memory/tegra/tegra30-emc.c b/drivers/memory/tegra/tegra30-emc.c
> index 6929980bf907..0b6a5e451ea3 100644
> --- a/drivers/memory/tegra/tegra30-emc.c
> +++ b/drivers/memory/tegra/tegra30-emc.c
> @@ -1093,7 +1093,7 @@ static int tegra_emc_probe(struct platform_device *pdev)
>  	if (of_get_child_count(pdev->dev.of_node) == 0) {
>  		dev_info(&pdev->dev,
>  			 "device-tree node doesn't have memory timings\n");
> -		return 0;
> +		return -ENODEV;
>  	}
>  
>  	np = of_parse_phandle(pdev->dev.of_node, "nvidia,memory-controller", 0);
> 

Thanks for the fix!

Acked-by: Jon Hunter <jonathanh@nvidia.com>
Tested-by: Jon Hunter <jonathanh@nvidia.com>

Jon

-- 
nvpublic

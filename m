Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 778001CA72F
	for <lists+linux-tegra@lfdr.de>; Fri,  8 May 2020 11:31:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726083AbgEHJbW (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 8 May 2020 05:31:22 -0400
Received: from smtp08.smtpout.orange.fr ([80.12.242.130]:50045 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbgEHJbV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 8 May 2020 05:31:21 -0400
Received: from [192.168.42.210] ([93.23.14.114])
        by mwinf5d16 with ME
        id c9XK2200B2Tev1p039XKrP; Fri, 08 May 2020 11:31:20 +0200
X-ME-Helo: [192.168.42.210]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 08 May 2020 11:31:20 +0200
X-ME-IP: 93.23.14.114
Subject: Re: [PATCH] memory: tegra: Fix an error handling path in
 'tegra186_emc_probe()'
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <20200506200907.195502-1-christophe.jaillet@wanadoo.fr>
 <20200508084941.GE9365@kadam>
From:   Marion & Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <b4b55c4b-1aff-6272-b15c-67466ee1706e@wanadoo.fr>
Date:   Fri, 8 May 2020 11:31:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200508084941.GE9365@kadam>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: fr
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


Le 08/05/2020 à 10:49, Dan Carpenter a écrit :
> On Wed, May 06, 2020 at 10:09:07PM +0200, Christophe JAILLET wrote:
>> @@ -237,7 +239,7 @@ static int tegra186_emc_probe(struct platform_device *pdev)
>>   			"failed to set rate range [%lu-%lu] for %pC\n",
>>   			emc->debugfs.min_rate, emc->debugfs.max_rate,
>>   			emc->clk);
>> -		return err;
>> +		goto err_put_bpmp;
>>   	}
>>   
>>   	emc->debugfs.root = debugfs_create_dir("emc", NULL);
> Not really related to this patch but the error handling on this
> debugfs_create_dir() call is wrong.  It never returns NULL.  The error
> should just be ignored.  It shouldn't try print a message when debugfs
> is deliberately disabled.
>
> As in the correct code looks like:
>
>   
>          emc->debugfs.root = debugfs_create_dir("emc", NULL);
> -       if (!emc->debugfs.root) {
> -               dev_err(&pdev->dev, "failed to create debugfs directory\n");
> -               return 0;
> -       }
> -
>          debugfs_create_file("available_rates", S_IRUGO, emc->debugfs.root,
>                              emc, &tegra186_emc_debug_available_rates_fops);
>          debugfs_create_file("min_rate", S_IRUGO | S_IWUSR, emc->debugfs.root,
>
> debugfs_create_file() will return an error pointer if debugfs_create_dir()
> fails or if debugfs is disabled.  (It is a no-op).
>
> regards,
> dan carpenter

LGTM.

I let you propose a patch for it,.

CJ


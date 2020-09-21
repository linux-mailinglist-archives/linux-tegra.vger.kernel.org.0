Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B77C2724F3
	for <lists+linux-tegra@lfdr.de>; Mon, 21 Sep 2020 15:12:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727665AbgIUNMl (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 21 Sep 2020 09:12:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727685AbgIUNMk (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 21 Sep 2020 09:12:40 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B53BC061755;
        Mon, 21 Sep 2020 06:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=vqonmA7dPy+5LJkip5U9O8/KVJ5XsAg9XSTuRLG/KXs=; b=JD6xVeVxsOz4IkiHbEEq8fJLKg
        1lp+tGyn9dMv2L+Zsn9fX9+3bS01+iLnNGvXjZV0dzAFFDg+jSOmL3vB1xpnIPgTCLfsnQXx0yU3E
        QYAnZF01X36VYRCpHR3jmSPxIcAW5pcD3qjUN5dT3Kzc4tFQKzGBB8C7lJKYIOCxwhZtkEzBitet7
        CRkz2G43h9ZQ0/PsRhDOPcGX0JsBm9kECOoMhuSRuWNL+4aNllEQOVaEshlqPI3DdtJliHBs0CUYa
        beBO76OHhmZYeaUQ3TGPVRmnkmRr84tb9rjcMwmbpGOXSX1XHWIyMxfhR0kzfZMV2VPH1ZB9TDxSn
        KiE/pwMA==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1kKLcR-00068D-5n; Mon, 21 Sep 2020 16:12:35 +0300
Subject: Re: [PATCH -next] gpu: host1x: simplify the return expression of
 host1x_cdma_init()
To:     Qinglang Miao <miaoqinglang@huawei.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200921131032.91972-1-miaoqinglang@huawei.com>
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <4378d69a-2338-779f-ab4d-3c64fbf7dfd3@kapsi.fi>
Date:   Mon, 21 Sep 2020 16:12:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200921131032.91972-1-miaoqinglang@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 9/21/20 4:10 PM, Qinglang Miao wrote:
> Simplify the return expression.
> 
> Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
> ---
>   drivers/gpu/host1x/cdma.c | 8 +-------
>   1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/host1x/cdma.c b/drivers/gpu/host1x/cdma.c
> index e8d3fda91..08a0f9e10 100644
> --- a/drivers/gpu/host1x/cdma.c
> +++ b/drivers/gpu/host1x/cdma.c
> @@ -448,8 +448,6 @@ void host1x_cdma_update_sync_queue(struct host1x_cdma *cdma,
>    */
>   int host1x_cdma_init(struct host1x_cdma *cdma)
>   {
> -	int err;
> -
>   	mutex_init(&cdma->lock);
>   	init_completion(&cdma->complete);
>   
> @@ -459,11 +457,7 @@ int host1x_cdma_init(struct host1x_cdma *cdma)
>   	cdma->running = false;
>   	cdma->torndown = false;
>   
> -	err = host1x_pushbuffer_init(&cdma->push_buffer);
> -	if (err)
> -		return err;
> -
> -	return 0;
> +	return host1x_pushbuffer_init(&cdma->push_buffer);

IMHO, this makes it less readable since now it kind of looks like 
host1x_pushbuffer_init is returning some meaningful value, instead of 
the code just handling error values in a sequence.

Mikko

>   }
>   
>   /*
> 

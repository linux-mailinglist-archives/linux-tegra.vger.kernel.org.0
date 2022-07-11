Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5779D56B48C
	for <lists+linux-tegra@lfdr.de>; Fri,  8 Jul 2022 10:35:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237780AbiGHIeK (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 8 Jul 2022 04:34:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237217AbiGHIeK (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 8 Jul 2022 04:34:10 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16DFC15824
        for <linux-tegra@vger.kernel.org>; Fri,  8 Jul 2022 01:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
        s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=ixFXV+1Qd2iJruE4p7B4EgS2FeqpAuYVVZqEbaMEXRg=; b=M1z8RFrv3wFxAs4w7HTugkhoLr
        S76u1qClQ+NphECxpbgHLG4vYIYkJyS8a5YasaQqP+7VkUhYcp6RNFicg7QS5y52pfppDsSIezYye
        HXGNLI2Xt8vMONKFa0Z6gd2mzUyW9dqx8QabAJ1omH7XNz7sOeUnWeEsqomQELifnMI5W2vNkWRR1
        wmJB5AXGJxyUGFnTDjuIShnkXgVL1x2Dy6x9DenFzR8979g8zWV1tsgBlzs44fUBYwyxm5oW+aMfS
        qSlmXeAYDBhvlVYzLMN4eX9kLE7UiVU5VzlDiCKT/BpmUFti+tmNHBxZUUACo5QC8V5dErLbmwZcg
        8f9wCR7g==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <cyndis@kapsi.fi>)
        id 1o9jR2-008aYH-P7; Fri, 08 Jul 2022 11:33:59 +0300
Message-ID: <14151873-8334-7a97-63c2-01cf700a95bd@kapsi.fi>
Date:   Fri, 8 Jul 2022 11:33:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH] gpu: host1x: Register context bus unconditionally
Content-Language: en-US
To:     Robin Murphy <robin.murphy@arm.com>, thierry.reding@gmail.com,
        mperttunen@nvidia.com
Cc:     iommu@lists.linux.dev, linux-tegra@vger.kernel.org,
        dri-devel@lists.freedesktop.org
References: <503bffe670b24aac0dfb03c8fc16437b8f0cca58.1657215044.git.robin.murphy@arm.com>
From:   Mikko Perttunen <cyndis@kapsi.fi>
In-Reply-To: <503bffe670b24aac0dfb03c8fc16437b8f0cca58.1657215044.git.robin.murphy@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 7/7/22 20:30, Robin Murphy wrote:
> Conditional registration is a problem for other subsystems which may
> unwittingly try to interact with host1x_context_device_bus_type in an
> uninitialised state on non-Tegra platforms. A look under /sys/bus on a
> typical system already reveals plenty of entries from enabled but
> otherwise irrelevant configs, so lets keep things simple and register
> our context bus unconditionally too.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>   drivers/gpu/host1x/context_bus.c | 5 -----
>   1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/gpu/host1x/context_bus.c b/drivers/gpu/host1x/context_bus.c
> index b0d35b2bbe89..d9421179d7b4 100644
> --- a/drivers/gpu/host1x/context_bus.c
> +++ b/drivers/gpu/host1x/context_bus.c
> @@ -15,11 +15,6 @@ static int __init host1x_context_device_bus_init(void)
>   {
>   	int err;
>   
> -	if (!of_machine_is_compatible("nvidia,tegra186") &&
> -	    !of_machine_is_compatible("nvidia,tegra194") &&
> -	    !of_machine_is_compatible("nvidia,tegra234"))
> -		return 0;
> -
>   	err = bus_register(&host1x_context_device_bus_type);
>   	if (err < 0) {
>   		pr_err("bus type registration failed: %d\n", err);

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>

Cheers,
Mikko

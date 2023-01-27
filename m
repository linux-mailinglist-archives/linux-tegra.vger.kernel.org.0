Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C594167F229
	for <lists+linux-tegra@lfdr.de>; Sat, 28 Jan 2023 00:18:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232898AbjA0XS1 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 27 Jan 2023 18:18:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232828AbjA0XS0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 27 Jan 2023 18:18:26 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C1B993FD;
        Fri, 27 Jan 2023 15:18:25 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 19922B82147;
        Fri, 27 Jan 2023 23:18:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDCC3C433EF;
        Fri, 27 Jan 2023 23:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674861502;
        bh=CXUhXt0vaAEeA5azgtYG8dHIkQ0F6fZe8brBxX+dbzw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RdC12Sna/LXNHYtASD7sP87NEW4wwxX8Vz0EVtsPp7oAEug9P8HXexyVQX2M9Yizf
         EmDCljirqWn6Ft2hO/w7PHtTWitdILR4YImeiDGo4haJZtl8kFs0bsssh1B2AQl1+f
         0eo0rLTSHbhLnSkgKnRaR3AnIDhlSH/dDc/rnT4apOoCPqPhljGUkdRp+OgXvInV/b
         GkHuz10SIfqHsv6YWvl9gh6VV/BbdtYFBlfwonDhXgtNcJCUy17esH5uetnzSlFLOP
         ESbEUs6re68CcDB4BlQrZunygZNWjXA7tBDJ1aXZP9b8rGkwoaKLClk7Bgn+VGVhO2
         Hi4NA8mERmjGg==
Date:   Fri, 27 Jan 2023 16:18:20 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, Arnd Bergmann <arnd@arndb.de>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Robin Murphy <robin.murphy@arm.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] gpu: host1x: fix uninitialized variable use
Message-ID: <Y9RbvPRP5Yw/fUMM@dev-arch.thelio-3990X>
References: <20230127221418.2522612-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230127221418.2522612-1-arnd@kernel.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Jan 27, 2023 at 11:14:00PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The error handling for platform_get_irq() failing no longer
> works after a recent change, clang now points this out with
> a warning:
> 
> drivers/gpu/host1x/dev.c:520:6: error: variable 'syncpt_irq' is uninitialized when used here [-Werror,-Wuninitialized]
>         if (syncpt_irq < 0)
>             ^~~~~~~~~~
> 
> Fix this by removing the variable and checking the correct
> error status.
> 
> Fixes: 625d4ffb438c ("gpu: host1x: Rewrite syncpoint interrupt handling")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

I had the same diff pending but civic duty called today :)

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  drivers/gpu/host1x/dev.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
> index 4872d183d860..aae2efeef503 100644
> --- a/drivers/gpu/host1x/dev.c
> +++ b/drivers/gpu/host1x/dev.c
> @@ -487,7 +487,6 @@ static int host1x_get_resets(struct host1x *host)
>  static int host1x_probe(struct platform_device *pdev)
>  {
>  	struct host1x *host;
> -	int syncpt_irq;
>  	int err;
>  
>  	host = devm_kzalloc(&pdev->dev, sizeof(*host), GFP_KERNEL);
> @@ -517,8 +516,8 @@ static int host1x_probe(struct platform_device *pdev)
>  	}
>  
>  	host->syncpt_irq = platform_get_irq(pdev, 0);
> -	if (syncpt_irq < 0)
> -		return syncpt_irq;
> +	if (host->syncpt_irq < 0)
> +		return host->syncpt_irq;
>  
>  	mutex_init(&host->devices_lock);
>  	INIT_LIST_HEAD(&host->devices);
> -- 
> 2.39.0
> 

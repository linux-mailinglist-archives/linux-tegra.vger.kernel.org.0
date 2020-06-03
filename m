Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B2281ED098
	for <lists+linux-tegra@lfdr.de>; Wed,  3 Jun 2020 15:13:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725859AbgFCNNl (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 3 Jun 2020 09:13:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725780AbgFCNNl (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 3 Jun 2020 09:13:41 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1AC5C08C5C0
        for <linux-tegra@vger.kernel.org>; Wed,  3 Jun 2020 06:13:39 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id d128so2013341wmc.1
        for <linux-tegra@vger.kernel.org>; Wed, 03 Jun 2020 06:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YvTYA3i3ql71PlM8AImNAHj0MEK/O19mMWzQp9IXa1c=;
        b=B+sJbp19CMkL1IePV7SRjLL3NuueuIDnhgcTjsWMypxSEFEsr4Xi3kdwOgDaCnhtja
         v29EADJmF0KGTZpbhsDR3QCgYXtMEc+HiHQ6Wn4GSp6Bbh3D2zyfB1Ah9AaTYU5/wFSv
         uO4p5rj3+oMPLRlfhLADZ8bsB4BoiRx0kAKBS9fHGAVJ/q5UqIZOzOqTSWvV/ZytASMH
         06f4JyIz/jAyxn5a1WoqF9OWvMLLOeAzMm5aAI19ioVk8O5JEYxbFFksq5eCtWkcD7AJ
         GDEfI7umcefJunD1gNX8h/Mn+DQ/JzAmVulGKhFhb9DmnjcdaYGG7smoXTBZPlGdmA/o
         l/yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YvTYA3i3ql71PlM8AImNAHj0MEK/O19mMWzQp9IXa1c=;
        b=tYaMt2MSDLkK6jZJYsMyNFgenp221lM0z0ausiCWaeQDC7ZLHGUHWqIv4AYYHF4MOb
         uYbVy51ViZ3ofsX1yVcES0amQWedPrtSw4diuElHCDl1BnuFLIGvnKDZOQr5M6t5yn7N
         /IrV0GiP0i78VXuR6w3hqwSBhrn3YBadgZj3lHLB2wJVT0neWZUfovN92aXL8iTx11gt
         +KskTo0uWBQFViZTX/fWlVZJwrrwYHD2TefIAdpP6GHfkV3+bVpOy65l+T7zR6tJAGDB
         wj4BaFo0yMUmwYO3SrmO5/DaJQAmWfvKWD5iI2tvbLUxRmuN6PZ/6iQfpGs6JvCiSwyO
         a2IA==
X-Gm-Message-State: AOAM5337CchC2qSPwDEYU5GR5/dDhn1JStJ2/dr/SGvfBt/3e282ABQv
        krvQroYIaPvBljxX8hK16qBUmQ==
X-Google-Smtp-Source: ABdhPJz+8uZwZ5cW2ShXPRloMcUIcKMg45z3XnlS1ugHLPn7vS7DyOPoTzg6JGlGZfSiZeZmIvoBFQ==
X-Received: by 2002:a05:600c:1:: with SMTP id g1mr8478525wmc.142.1591190018583;
        Wed, 03 Jun 2020 06:13:38 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:2e56:dcff:fed2:c6d6])
        by smtp.googlemail.com with ESMTPSA id l204sm3103888wmf.19.2020.06.03.06.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2020 06:13:37 -0700 (PDT)
Date:   Wed, 3 Jun 2020 15:13:35 +0200
From:   LABBE Corentin <clabbe@baylibre.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: tegra: Always program PLL_E when enabled
Message-ID: <20200603131335.GA3597@Red>
References: <20200603111923.3545261-1-thierry.reding@gmail.com>
 <20200603111923.3545261-2-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200603111923.3545261-2-thierry.reding@gmail.com>
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Jun 03, 2020 at 01:19:23PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Commit bff1cef5f23a ("clk: tegra: Don't enable already enabled PLLs")
> added checks to avoid enabling PLLs that have already been enabled by
> the bootloader. However, the PLL_E configuration inherited from the
> bootloader isn't necessarily the one that is needed for the kernel.
> 
> This can cause SATA to fail like this:
> 
>     [    5.310270] phy phy-sata.6: phy poweron failed --> -110
>     [    5.315604] tegra-ahci 70027000.sata: failed to power on AHCI controller: -110
>     [    5.323022] tegra-ahci: probe of 70027000.sata failed with error -110
> 
> Fix this by always programming the PLL_E. This ensures that any mis-
> configuration by the bootloader will be overwritten by the kernel.
> 
> Fixes: bff1cef5f23a ("clk: tegra: Don't enable already enabled PLLs")
> Reported-by: LABBE Corentin <clabbe@baylibre.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/clk/tegra/clk-pll.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
> index 583d2ac61e9e..b2d39a66f0fa 100644
> --- a/drivers/clk/tegra/clk-pll.c
> +++ b/drivers/clk/tegra/clk-pll.c
> @@ -1601,9 +1601,6 @@ static int clk_plle_tegra114_enable(struct clk_hw *hw)
>  	unsigned long flags = 0;
>  	unsigned long input_rate;
>  
> -	if (clk_pll_is_enabled(hw))
> -		return 0;
> -
>  	input_rate = clk_hw_get_rate(clk_hw_get_parent(hw));
>  
>  	if (_get_table_rate(hw, &sel, pll->params->fixed_rate, input_rate))
> -- 
> 2.24.1
> 

Tested-by: Corentin Labbe <clabbe@baylibre.com>

Thanks

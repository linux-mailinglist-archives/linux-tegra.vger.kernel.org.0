Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92090F1E2D
	for <lists+linux-tegra@lfdr.de>; Wed,  6 Nov 2019 20:03:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727376AbfKFTDr (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 6 Nov 2019 14:03:47 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:34009 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732001AbfKFTDq (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 6 Nov 2019 14:03:46 -0500
Received: by mail-lf1-f66.google.com with SMTP id f5so18899535lfp.1
        for <linux-tegra@vger.kernel.org>; Wed, 06 Nov 2019 11:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Pn/Xyc+VP1qLB2kROo+T7K/pZXqgwpJ8ZY7Udz7Bct8=;
        b=tvjrD+GuPLFteMTpIQhagDorD0WEAPUldV9N54QN0VY3PePaEKbvaBOgMcyEiXmGcM
         KiOXwCNTcsZTpFnwcKeMGyXL5U2BPgGCLSI7WNjipuCwN6qt1MmcebI6+pKxp345s45J
         EqEAjm275h91aIA0jT9MYBnhFbVOmsdQjZI2/4lcgvsNxkyTiTC6XVW4VvbcaGK2Jjug
         zaL8lyNDLSi+Lgkcdpc52ZCBT+e5pGQX2AJmN3XI5W0uf3rdVz8uQjfj+ddD191L2CgM
         siM346D7kBpB8t7IxrBbQ2PZEJbcea/vsh5tdMoAN68aUnQj0NW3kiQuIB55zRONsOuw
         XQXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Pn/Xyc+VP1qLB2kROo+T7K/pZXqgwpJ8ZY7Udz7Bct8=;
        b=MP7hVOtXWVZ8wIicSjAPrCwfXkpW75jESsT4Vvnp//zmprUV0DuA/gFJbZSEVjySvZ
         B3C0G8OCeahaQxkwEzk4D4o4cHsPwKJnV/Uzc+rHwKutdHdPseyOhzLm9Io2N7BX9FxN
         54WEX8TVdOFQFR4EhJZy/GOWSvCQ26ig0s4K6cTed8NBriBmUgNGxQ3MHKP6Vp+Oz41D
         sz7Al7f7yVjiXLHt++gKrmGuSa2eh0cvWvN5o/RWKEs1nfwY3PSuFG0ncpLpYWYqwZUY
         4YBSyza3E+NsSxgsPrziQ5WtxVNDa5zP6mpyX6ZbQN1uCvWTw8grLhzAGqs/HXT2r+ky
         E3nA==
X-Gm-Message-State: APjAAAWZwTScBXVfPIDabjUjHb9RSGysgm2X4SnK6TFyRgCqEdJUnLpL
        yDSjJ+/hEWSoIZDOMeirAzst3pKg
X-Google-Smtp-Source: APXvYqxx76kyyqv9MAyZOlnI92ISQp0FEyliv0SEiGJqd7HjkN+lvLTdZYRsB3EM8NPvit0XqIxHyw==
X-Received: by 2002:a05:6512:146:: with SMTP id m6mr24703657lfo.98.1573067023655;
        Wed, 06 Nov 2019 11:03:43 -0800 (PST)
Received: from [192.168.2.145] (94-29-10-250.dynamic.spd-mgts.ru. [94.29.10.250])
        by smtp.googlemail.com with ESMTPSA id r12sm19073279lfp.63.2019.11.06.11.03.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Nov 2019 11:03:42 -0800 (PST)
Subject: Re: [PATCH v1 2/3] soc/tegra: fuse: Warn if straps and not ready
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-tegra@vger.kernel.org
References: <20191103131023.17342-1-digetx@gmail.com>
 <20191103131023.17342-3-digetx@gmail.com>
Message-ID: <6e5ea5a7-139a-19e4-5085-cfa5978995d0@gmail.com>
Date:   Wed, 6 Nov 2019 22:03:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191103131023.17342-3-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

03.11.2019 16:10, Dmitry Osipenko пишет:
> Now both Chip ID and HW straps are becoming available at the same time,
> thus we could simply check the availability of the ID in order to check
> the availability of the straps. We couldn't check straps for 0x0 because
> it could be a correct value.
> 
> This change didn't uncover any problems, but anyways it is nicer to have
> straps verified for consistency with the Chip ID verification.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/soc/tegra/fuse/tegra-apbmisc.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/tegra/fuse/tegra-apbmisc.c b/drivers/soc/tegra/fuse/tegra-apbmisc.c
> index 54aeea1b4500..f580b3116bea 100644
> --- a/drivers/soc/tegra/fuse/tegra-apbmisc.c
> +++ b/drivers/soc/tegra/fuse/tegra-apbmisc.c
> @@ -27,7 +27,7 @@ static u32 chipid;
>  
>  u32 tegra_read_chipid(void)
>  {
> -	WARN(!chipid, "Tegra Chip ID not yet available\n");
> +	WARN(!chipid, "Tegra ABP MISC not yet available\n");
>  
>  	return chipid;
>  }
> @@ -39,6 +39,8 @@ u8 tegra_get_chip_id(void)
>  
>  u32 tegra_read_straps(void)
>  {
> +	WARN(!chipid, "Tegra ABP MISC not yet available\n");
> +
>  	return strapping;
>  }
>  
> 

Darn autocorrection. I'll fix the commit's title in v2.

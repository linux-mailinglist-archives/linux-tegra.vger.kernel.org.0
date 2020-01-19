Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F9DD141EB6
	for <lists+linux-tegra@lfdr.de>; Sun, 19 Jan 2020 16:05:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726982AbgASPEt (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 19 Jan 2020 10:04:49 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:34219 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726778AbgASPEt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 19 Jan 2020 10:04:49 -0500
Received: by mail-lj1-f194.google.com with SMTP id z22so31268514ljg.1;
        Sun, 19 Jan 2020 07:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9VNghwXuw2TCLa0rtdbPjJ8tOH6v56j1WENS326EONY=;
        b=oFFzQbKqj9h7E9kWXr2KRXnYniIgcPEjHN628/Ar/DxI9gzm2x2rip6S4eJZsh5ZVg
         i7kIvArClESXcQpvgarxsmm9BzSlKTn54ZMUPgAB/os6EnTopmf3OArHx4rQKtSkDoJg
         u/AQ6f3XLJC/7ra9Xm3h9cX2sauj+fN3xVnKIS1WPJLv245zO5ya0zeX4ZLierAzDv5i
         /7E3QEIFVVtgX3LWgxRmzpeBNmAlRPoJtvfJZndH746PU5V9Eq7wsrq3v+v3dFJqtQS/
         3sHIF7iBC+jledrZjzJXHXWdZ6VIy5XeSbJjxPYgPZnKN62LyAIhT92sPwN/EA5abw0+
         woBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9VNghwXuw2TCLa0rtdbPjJ8tOH6v56j1WENS326EONY=;
        b=N6+DQ39CbPkifJWAJGDEnmaWVvDKr51R0mHk7qZTqJ3vvNZKvR/uzBoTIXsu5U/9HL
         l7V0j1fuDPyvcSbr7vS8mWePFM2odZ11xzujVpLU40elRJX2A9MX3xA+N1O3LAkysphy
         57BetPrXkVGJo2XnjjvCpjgsc6adX2ZiK8LXw4ScGAao2Xxl6/rGCFC9ihSgw8IaVuWR
         NyrY0UqcZZiYcLm+NMG8sXLmuVerfXzwssEuqumb5Uz0jvEndxLnDOuvpvbwPxyWf8ww
         x3J37kLJEBmrGgnitthg5RGk+l6+bir1pRPlNwC/cNIoYkwBZgfFBaydMkuPMGxpkHq9
         6bVg==
X-Gm-Message-State: APjAAAWXuOGSai91cHair2XJfFe5IfTetp75BFwITLoeQyv0kOJpk1r5
        EfZeTEtUtuQ4eTyhcw0uSuAoYo4a
X-Google-Smtp-Source: APXvYqz+9zpXnHmALemXTEO72nrluxayIDyd/Y5iJ7IZz+t6l9mxFixXpJJcGbXffWeUbBGWIk6Qpg==
X-Received: by 2002:a2e:7313:: with SMTP id o19mr11208964ljc.131.1579446286929;
        Sun, 19 Jan 2020 07:04:46 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id l64sm15254291lfd.30.2020.01.19.07.04.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jan 2020 07:04:46 -0800 (PST)
Subject: Re: [PATCH v8 22/22] clk: tegra: Remove audio clocks configuration
 from clock driver
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, broonie@kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        mperttunen@nvidia.com, gregkh@linuxfoundation.org,
        sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc:     pdeschrijver@nvidia.com, pgaikwad@nvidia.com, spujar@nvidia.com,
        josephl@nvidia.com, daniel.lezcano@linaro.org,
        mmaddireddy@nvidia.com, markz@nvidia.com,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1578986667-16041-1-git-send-email-skomatineni@nvidia.com>
 <1578986667-16041-23-git-send-email-skomatineni@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <d69fe7a8-71cc-c560-a567-f89b936753ad@gmail.com>
Date:   Sun, 19 Jan 2020 18:04:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <1578986667-16041-23-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

14.01.2020 10:24, Sowjanya Komatineni пишет:

[snip]

> diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
> index 5732fdbe20db..53d1c48532ae 100644
> --- a/drivers/clk/tegra/clk-tegra30.c
> +++ b/drivers/clk/tegra/clk-tegra30.c
> @@ -1221,9 +1221,8 @@ static struct tegra_clk_init_table init_table[] __initdata = {
>  	{ TEGRA30_CLK_UARTC, TEGRA30_CLK_PLL_P, 408000000, 0 },
>  	{ TEGRA30_CLK_UARTD, TEGRA30_CLK_PLL_P, 408000000, 0 },
>  	{ TEGRA30_CLK_UARTE, TEGRA30_CLK_PLL_P, 408000000, 0 },
> -	{ TEGRA30_CLK_PLL_A, TEGRA30_CLK_CLK_MAX, 564480000, 1 },
> -	{ TEGRA30_CLK_PLL_A_OUT0, TEGRA30_CLK_CLK_MAX, 11289600, 1 },
> -	{ TEGRA30_CLK_EXTERN1, TEGRA30_CLK_PLL_A_OUT0, 0, 1 },
> +	{ TEGRA30_CLK_PLL_A, TEGRA30_CLK_CLK_MAX, 564480000, 0 },
> +	{ TEGRA30_CLK_PLL_A_OUT0, TEGRA30_CLK_CLK_MAX, 11289600, 0 },
>  	{ TEGRA30_CLK_I2S0, TEGRA30_CLK_PLL_A_OUT0, 11289600, 0 },
>  	{ TEGRA30_CLK_I2S1, TEGRA30_CLK_PLL_A_OUT0, 11289600, 0 },
>  	{ TEGRA30_CLK_I2S2, TEGRA30_CLK_PLL_A_OUT0, 11289600, 0 },
> 

What about to use the assigned-clock-rates in device-tree and thus to
remove those PLL_A entries?

Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E43289EFBC
	for <lists+linux-tegra@lfdr.de>; Tue, 27 Aug 2019 18:08:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727089AbfH0QI5 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 27 Aug 2019 12:08:57 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:42268 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726537AbfH0QI5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 27 Aug 2019 12:08:57 -0400
Received: by mail-pg1-f195.google.com with SMTP id p3so12931296pgb.9
        for <linux-tegra@vger.kernel.org>; Tue, 27 Aug 2019 09:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wCLtDL9jGX/Zx5p4hJqqfPWUMhnwlxTC9vpxw/XksH0=;
        b=uTmfQyq/Wkk1gZ7481aq3UHJE2ZxDzjrHUyYDQMObXjOadhmxDq5Y5V+e/7EPDDAeT
         t7MJ/hmq4eHO37ajW6ioT2Aa7Pdn0YkCKZplPTtZgtUyPP4IG0Ka30XHbPXq8Xn2NClv
         raN1D9no4UjdZ/7okGzS3sYIwd6zY/hDDEDfSSAHnqUJDJvi+z92lNdh9TZTzrPbCAhc
         1+M/6v39VPkPPJ49kDGkErgba+GELjeSNkh4/KdEBB9UNVhN4HVsRkw5YM69qQhD7doa
         sH3lsrr6L3u8okIp07ZnKHqCnDiZ0cgIA8uHoZIabFfEQoekypMjVnqA7WLiuzL6w18W
         RXqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wCLtDL9jGX/Zx5p4hJqqfPWUMhnwlxTC9vpxw/XksH0=;
        b=IXD0Xw2lsvwo1+CqBPWaYF+qshU+lu2X2vkFYo6G9EYO6EvOKMXD0xz6i3er9/cwqm
         7VOjtHzElZNIqFHEPuDIUxdlHS2DuJkKx1ULOeNfhwlM/yimOj5fq2yEmv5a5HcZE53b
         3YDkTXV6Kmsm/4wwKJBWV5P5iRTVENMwahJR7jnO8hZwaFDbboz08KLJyaTnPsu2Q+p+
         xPn7zpOT1baX8CI9LJZXEvij5z10sIknKseqAR70W4oQlmkzQaVcAk4YxtuNiPwr+YSH
         VPRxtfxDqgKZ25pThc+pscy4fqM9VB0C44KXnP665NDNeC70PzbEg/Qmd1tFSZbzOVh5
         tm2A==
X-Gm-Message-State: APjAAAVFguBI34J7eKHtsYtENHO74aMvdYH/2PhVdnhwJdqimPyjIOhj
        jE5Faf2aziQNOz/zIfdp/CLoRA==
X-Google-Smtp-Source: APXvYqwsi6y8ZJOqDpN2UOOCj1Ddq1uMFMOCyvB7AxZMsoXn1GBeg6/36H03jejQzsNeowN0NvZm6g==
X-Received: by 2002:a62:ce0e:: with SMTP id y14mr27196287pfg.73.1566922136363;
        Tue, 27 Aug 2019 09:08:56 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id y188sm16120592pfb.115.2019.08.27.09.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2019 09:08:55 -0700 (PDT)
Date:   Tue, 27 Aug 2019 09:10:45 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc:     soc@kernel.org, gwendal@chromium.org, bleung@chromium.org,
        linux-kernel@vger.kernel.org, groeck@chromium.org,
        kernel@collabora.com, lee.jones@linaro.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-tegra@vger.kernel.org,
        Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
        Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        linux-samsung-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        linux-arm-kernel@lists.infradead.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Kukjin Kim <kgene@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Fabrice Gasnier <fabrice.gasnier@st.com>,
        Daniel Mack <daniel@zonque.org>,
        Russell King <linux@armlinux.org.uk>,
        Shawn Guo <shawnguo@kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Yannick Fertr? <yannick.fertre@st.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Tony Lindgren <tony@atomide.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH] arm/arm64: defconfig: Update configs to use the new
 CROS_EC options
Message-ID: <20190827161045.GC26807@tuxbook-pro>
References: <20190827154851.10486-1-enric.balletbo@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190827154851.10486-1-enric.balletbo@collabora.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue 27 Aug 08:48 PDT 2019, Enric Balletbo i Serra wrote:

> Recently we refactored the CrOS EC drivers moving part of the code from
> the MFD subsystem to the platform chrome subsystem. During this change
> we needed to rename some config options, so, update the defconfigs
> accordingly.
> 
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
> Reviewed-by: Gwendal Grignou <gwendal@chromium.org>
> Tested-by: Gwendal Grignou <gwendal@chromium.org>

Can we make the entries in the generic arm64 defconfig modules?

Regards,
Bjorn

> ---
> Dear all,
> 
> This is basically a resend of [1] in order to get patch into the arm-soc
> patchwork and can be merged independently of the series. The patch was
> originally sent as part of the these series [2] but as defconfig changes
> often cause merge conflicts the maintainers prefer to have this merged
> through the arm-soc tree. My bad was not including the soc ML from the
> begining, so sorry about that.
> 
> Thanks,
>  Enric
> 
> [1] https://lkml.org/lkml/2019/8/23/518
> [2] https://lkml.org/lkml/2019/8/23/475
> 
>  arch/arm/configs/exynos_defconfig   | 6 +++++-
>  arch/arm/configs/multi_v7_defconfig | 6 ++++--
>  arch/arm/configs/pxa_defconfig      | 4 +++-
>  arch/arm/configs/tegra_defconfig    | 2 +-
>  arch/arm64/configs/defconfig        | 6 ++++--
>  5 files changed, 17 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
> index 2e6a863d25aa..d29029f534ec 100644
> --- a/arch/arm/configs/exynos_defconfig
> +++ b/arch/arm/configs/exynos_defconfig
> @@ -154,7 +154,11 @@ CONFIG_CPU_THERMAL=y
>  CONFIG_THERMAL_EMULATION=y
>  CONFIG_WATCHDOG=y
>  CONFIG_S3C2410_WATCHDOG=y
> -CONFIG_MFD_CROS_EC=y
> +CONFIG_MFD_CROS_EC_DEV=y
> +CONFIG_CHROME_PLATFORMS=y
> +CONFIG_CROS_EC=y
> +CONFIG_CROS_EC_I2C=y
> +CONFIG_CROS_EC_SPI=y
>  CONFIG_MFD_MAX14577=y
>  CONFIG_MFD_MAX77686=y
>  CONFIG_MFD_MAX77693=y
> diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
> index 6a40bc2ef271..0e9e70badf88 100644
> --- a/arch/arm/configs/multi_v7_defconfig
> +++ b/arch/arm/configs/multi_v7_defconfig
> @@ -511,10 +511,12 @@ CONFIG_MFD_BCM590XX=y
>  CONFIG_MFD_AC100=y
>  CONFIG_MFD_AXP20X_I2C=y
>  CONFIG_MFD_AXP20X_RSB=y
> -CONFIG_MFD_CROS_EC=m
> +CONFIG_MFD_CROS_EC_DEV=m
> +CONFIG_CHROME_PLATFORMS=y
> +CONFIG_CROS_EC=m
>  CONFIG_CROS_EC_I2C=m
>  CONFIG_CROS_EC_SPI=m
> -CONFIG_MFD_CROS_EC_CHARDEV=m
> +CONFIG_CROS_EC_CHARDEV=m
>  CONFIG_MFD_DA9063=m
>  CONFIG_MFD_MAX14577=y
>  CONFIG_MFD_MAX77686=y
> diff --git a/arch/arm/configs/pxa_defconfig b/arch/arm/configs/pxa_defconfig
> index 787c3f9be414..635bf7dec53c 100644
> --- a/arch/arm/configs/pxa_defconfig
> +++ b/arch/arm/configs/pxa_defconfig
> @@ -393,7 +393,9 @@ CONFIG_SA1100_WATCHDOG=m
>  CONFIG_MFD_AS3711=y
>  CONFIG_MFD_BCM590XX=m
>  CONFIG_MFD_AXP20X=y
> -CONFIG_MFD_CROS_EC=m
> +CONFIG_MFD_CROS_EC_DEV=m
> +CONFIG_CHROME_PLATFORMS=y
> +CONFIG_CROS_EC=m
>  CONFIG_CROS_EC_I2C=m
>  CONFIG_CROS_EC_SPI=m
>  CONFIG_MFD_ASIC3=y
> diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_defconfig
> index 8f5c6a5b444c..061037012335 100644
> --- a/arch/arm/configs/tegra_defconfig
> +++ b/arch/arm/configs/tegra_defconfig
> @@ -147,7 +147,7 @@ CONFIG_SENSORS_LM95245=y
>  CONFIG_WATCHDOG=y
>  CONFIG_TEGRA_WATCHDOG=y
>  CONFIG_MFD_AS3722=y
> -CONFIG_MFD_CROS_EC=y
> +CONFIG_MFD_CROS_EC_DEV=y
>  CONFIG_MFD_MAX8907=y
>  CONFIG_MFD_STMPE=y
>  CONFIG_MFD_PALMAS=y
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 0e58ef02880c..c4df1999fe0d 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -457,8 +457,7 @@ CONFIG_MFD_ALTERA_SYSMGR=y
>  CONFIG_MFD_BD9571MWV=y
>  CONFIG_MFD_AXP20X_I2C=y
>  CONFIG_MFD_AXP20X_RSB=y
> -CONFIG_MFD_CROS_EC=y
> -CONFIG_MFD_CROS_EC_CHARDEV=m
> +CONFIG_MFD_CROS_EC_DEV=y
>  CONFIG_MFD_EXYNOS_LPASS=m
>  CONFIG_MFD_HI6421_PMIC=y
>  CONFIG_MFD_HI655X_PMIC=y
> @@ -668,8 +667,11 @@ CONFIG_VIRTIO_BALLOON=y
>  CONFIG_VIRTIO_MMIO=y
>  CONFIG_XEN_GNTDEV=y
>  CONFIG_XEN_GRANT_DEV_ALLOC=y
> +CONFIG_CHROME_PLATFORMS=y
> +CONFIG_CROS_EC=y
>  CONFIG_CROS_EC_I2C=y
>  CONFIG_CROS_EC_SPI=y
> +CONFIG_CROS_EC_CHARDEV=m
>  CONFIG_COMMON_CLK_RK808=y
>  CONFIG_COMMON_CLK_SCPI=y
>  CONFIG_COMMON_CLK_CS2000_CP=y
> -- 
> 2.20.1
> 

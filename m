Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1980E339FC
	for <lists+linux-tegra@lfdr.de>; Mon,  3 Jun 2019 23:43:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726303AbfFCVnR (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 3 Jun 2019 17:43:17 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:42330 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726141AbfFCVnR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 3 Jun 2019 17:43:17 -0400
Received: by mail-pg1-f196.google.com with SMTP id e6so7765411pgd.9
        for <linux-tegra@vger.kernel.org>; Mon, 03 Jun 2019 14:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=VW42IbBxqCmygzQCFpcjeZ/PAiP/LWUNMoAtneJfK2o=;
        b=UADAZlD/U4M9EA2LgPMh0NCp9/idKYyxD+RCHyD+rCimp189pdksYDd1PMRUAMCjlU
         ihQMXalred1RCZECuXHReDSJ2ZwVZh81D5d+ybstt6rXcZKYgz0h1qo4AipPnt0JHPoV
         4BgiYGdZrKXeOmDCu2PDhkMkPdJEH6STm5foll0ExNTJ9+puHLNi5icPYiXvJF4SqE8+
         trc/g0e6Nv3/AGNi9NV4ZkDhKI3i/tq3khW7V8iBwom65HmpSGFrpz9kQ6N24W41aPqz
         O4drF3OIPLcEL1b3MNoIV/cKBAQZN49cCOmiXtti2OYlcQBJ6AbnEz2Khs5odxgqU18m
         RSbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=VW42IbBxqCmygzQCFpcjeZ/PAiP/LWUNMoAtneJfK2o=;
        b=TYxPVja5J1HrL5KcvFNlf2EaDdrGZyfCBKinZYKN3sP736QvDAAjYMxRPoqJ+NE9FC
         8XzSKMzcP+nCZNib0DbQs35+kjlMg4QtjGW1ISlrGZC2SEW6Hu/SGz4Yonyec9B78Kjz
         QIUjE3Zl//N6kau4elWETq0BbiccPs4ABIyyfsN4QF3Pq/zdDf8VHwwpsLtTOnpY+MY4
         otYSid8vAdF7JoA//PwFndPDmeZZUdxF3bgsaCTSN17+0+cTtJxWqfsy3OIIkIBsCNJk
         /DTlYOvIpX7vOkMS9yJMdXdh+3q7MEsyLWw9jqsFNijgc/aEivXf/D/s364QAPKwibmy
         gqGA==
X-Gm-Message-State: APjAAAVpSHF05x1n5eZew+yjrCNaGLzni+VIE9EB0FAi1kkSO6Ade0WD
        acV2KG7ZD7S1a+BM+eGthjioUHO8Z/E=
X-Google-Smtp-Source: APXvYqyWT1CJYwKeIjOmJnZ9a08Bvsxu6peLGr1qXHSuhy5ICDJNIjDxSz5L6+ZduK/bzCREbYvnig==
X-Received: by 2002:a62:5801:: with SMTP id m1mr34555449pfb.32.1559596667303;
        Mon, 03 Jun 2019 14:17:47 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id 132sm3227541pfz.83.2019.06.03.14.17.46
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Jun 2019 14:17:46 -0700 (PDT)
Date:   Mon, 3 Jun 2019 14:17:46 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     treding@nvidia.com
Cc:     catalin.marinas@arm.com, will.deacon@arm.com,
        linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] arm64: defconfig: Add HWMON INA3221 support
Message-ID: <20190603211745.GA21855@Asurada-Nvidia.nvidia.com>
References: <20190424181010.28950-1-nicoleotsuka@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190424181010.28950-1-nicoleotsuka@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Apr 24, 2019 at 11:10:10AM -0700, Nicolin Chen wrote:
> Tegra186 board under arm64 is using this device, according to
> its dts file. So this patch enables its driver with a "=m" as
> the other HWMON drivers.
> 
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>

Sorry to ping this patch. But I am wondering if I sent it wrong
-- had been missing some other reviewers or maillists. May some
one kindly remind me?

Thank you
Nicolin

> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 04cc2a2adc39..00043e706399 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -424,6 +424,7 @@ CONFIG_SENSORS_LM90=m
>  CONFIG_SENSORS_PWM_FAN=m
>  CONFIG_SENSORS_RASPBERRYPI_HWMON=m
>  CONFIG_SENSORS_INA2XX=m
> +CONFIG_SENSORS_INA3221=m
>  CONFIG_THERMAL_GOV_POWER_ALLOCATOR=y
>  CONFIG_CPU_THERMAL=y
>  CONFIG_THERMAL_EMULATION=y
> -- 
> 2.17.1
> 

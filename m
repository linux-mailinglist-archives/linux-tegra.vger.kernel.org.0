Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 050671FD1DA
	for <lists+linux-tegra@lfdr.de>; Wed, 17 Jun 2020 18:21:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726496AbgFQQVf (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 17 Jun 2020 12:21:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726763AbgFQQVe (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 17 Jun 2020 12:21:34 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B37DC06174E
        for <linux-tegra@vger.kernel.org>; Wed, 17 Jun 2020 09:21:33 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id 9so3596002ljc.8
        for <linux-tegra@vger.kernel.org>; Wed, 17 Jun 2020 09:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=IRiK2UUVRAsIPqcMgasRPg24vJVeAUpdnyR9861AUZo=;
        b=u4GPDiiQRz2ATonnih1RGhxWuD9iVyOFZ9P85BYBXNXYhl0LtvhqgxB2XsOLLc66Co
         kL7UaNQTtlZL/ynZ4MAj29AR/Rs1Fc4yCor+n9CS5+eaT8sChwdALidi79f4wx4LYdyn
         RBHlUJjzY6YaE50XJ3vGjQfDNtT9UkDx0IcS4TR74nPfbMW1nkmVZegZexSUud/6cPxf
         1Yn5/0rMfuIWfE7C8StZt+ls5aoJcCMmsDl3/OVgS3DAz3B0BBhoPvvmDFrTjmmHODTz
         6Kftx8xhp8XftMSCed6XkrhJbPg/6NFotH2li0APja/99VPDVKQv5G1gpUr3iw4FKJ0N
         Sw0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IRiK2UUVRAsIPqcMgasRPg24vJVeAUpdnyR9861AUZo=;
        b=n938l89qlvORfgfPUwcMNar4uS8EhFfzjLYVZqeypzFHUb7c7E7Qh2Ec566yS4oKD5
         NkDp/a+NPsaxXCz3PYSon/ZdVBK2WQxzjm4h8mUylP4CyFZ4iruLScuMU6BdibvgUHd8
         RJR6H3xNw1K0N2Aj3pcg/izI8yAQMaYEMNPkv+MbW0g4kMPYOpupX4r08bTekE8yb4s8
         e5Skeap7FzgBpS1jLrwP0NSwlMO+izevDDBxH4gU4gnCNwg6eJljnWUl9c0gTDTWH+wt
         isXnPu3nZ17QtiqjIPOaDDOtNSeg+kqycvou37YomP9bVm0xg5dG1moF94VBuNC9CKtL
         xc7g==
X-Gm-Message-State: AOAM530WsmDTfsBgTzlDRYTP/7mdkAIM6WaVc5kNgUu/QKZT/6jlzbKr
        mSahBukjLVZ/+wVYotseQ30=
X-Google-Smtp-Source: ABdhPJz3aiPxKTjef7ws1Wk0kCPVBhHmctYWL0jMJEPomcZI7gJIPON3eEZiqN7mZyOpvLO4P8eWqA==
X-Received: by 2002:a2e:9a08:: with SMTP id o8mr42939lji.126.1592410891870;
        Wed, 17 Jun 2020 09:21:31 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru. [79.139.237.54])
        by smtp.googlemail.com with ESMTPSA id 1sm51530lft.95.2020.06.17.09.21.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2020 09:21:31 -0700 (PDT)
Subject: Re: [PATCH 09/73] ARM: tegra: gr2d is not backwards-compatible
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Jon Hunter <jonathanh@nvidia.com>
References: <20200616135238.3001888-1-thierry.reding@gmail.com>
 <20200616135238.3001888-10-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <9f56be9a-1a79-07cc-371f-f3abcd20701e@gmail.com>
Date:   Wed, 17 Jun 2020 19:21:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200616135238.3001888-10-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

16.06.2020 16:51, Thierry Reding пишет:
> From: Thierry Reding <treding@nvidia.com>
> 
> The instantiation of gr2d in Tegra114 is not backwards-compatible with
> the version found on earlier chips. Remove the misleading compatible
> string.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  arch/arm/boot/dts/tegra114.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi
> index a0ac9ea9ec9d..d583dfba688f 100644
> --- a/arch/arm/boot/dts/tegra114.dtsi
> +++ b/arch/arm/boot/dts/tegra114.dtsi
> @@ -35,7 +35,7 @@ host1x@50000000 {
>  		ranges = <0x54000000 0x54000000 0x01000000>;
>  
>  		gr2d@54140000 {
> -			compatible = "nvidia,tegra114-gr2d", "nvidia,tegra20-gr2d";
> +			compatible = "nvidia,tegra114-gr2d";
>  			reg = <0x54140000 0x00040000>;
>  			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&tegra_car TEGRA114_CLK_GR2D>;
> 

Could you please explain what's the difference? AFAIK, the 2D HW is
identical on T20/30/114.

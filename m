Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38299203091
	for <lists+linux-tegra@lfdr.de>; Mon, 22 Jun 2020 09:22:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731379AbgFVHWv (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 22 Jun 2020 03:22:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731362AbgFVHWu (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 22 Jun 2020 03:22:50 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F732C061795
        for <linux-tegra@vger.kernel.org>; Mon, 22 Jun 2020 00:22:50 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id g12so7195519pll.10
        for <linux-tegra@vger.kernel.org>; Mon, 22 Jun 2020 00:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=s6AtoZ2N3qnBaqcBnXYlsgS78ytdv7QMgwZrT52IUbs=;
        b=Ls2onvJ4PrwRbkHYIS3ZoYzddLbLpZ9cTW+5I2MDmsxTT58+bsaGaA9d7a/fp/UixK
         3N23jX9SfTWDJiKGV59vw/AeVKpJFoehbEv/nUuqi63RalUNqFZWhDAUCSm+bKXjEgWV
         iB1ILi3yGtzwkXAdEDRxfCiXgdFTGBVFHS1kbOXCH2apTpPAPDShaj5UfiOVX78ePdp+
         tS8s6bqENSpgFA0gJqVLWDaU/yKgWlYoofIyOHI1cBv/DkXJUX9e3H3csCXheXxAn5vF
         nPKwLqouf0CmgOf4+6bpDNZtOBd0cLoWjxOdAwUdCZcrwWK5LZ9aBMKPsEW8wxDCXiha
         ++lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=s6AtoZ2N3qnBaqcBnXYlsgS78ytdv7QMgwZrT52IUbs=;
        b=sRK7Qu5K+S/QLhDOnAYVWEwImb33D3cKAgUp3a/jQ0d5x8Wkq4lOVu3OfNw8sR8XQx
         qSt7OEVEalR57fhKRtU1Lt6XhVirvXJiMiR1PYG0+Al2k2epeasFWbzQZa9opvzmFLo/
         S9ppfbFYvMayJPh3j7q7JFFoDQTqJCF2K5+8KjlyNvzl6lxy91Avlhvsp2q2Mk3GWIuD
         GAGahEHqrKuRM1CmZhJf4JU6KOKDK0AkJbXwVNL7ot5L23cBo/WTG5az4WR9osHZUgra
         +rvkWjmUAz9Ij/mHmt/w13R/zzmUMmVsuXsKjZj7CUfzGPkpAENwyN2LbyaXcI3k7RsZ
         g0ew==
X-Gm-Message-State: AOAM53146rZyKta9zA8dz0NvIUKqZr+QlYK72LylHUCohk8ia30ZROcS
        tqM637vXuFp3x/HKDXEycyXifw==
X-Google-Smtp-Source: ABdhPJx4Q4lWtmnNUv6boj5NY4zFqsipmmb2rPBmbMWdUlL6KNoQZXYHmpSMqsNrKKkxl3o+0+tGow==
X-Received: by 2002:a17:90b:915:: with SMTP id bo21mr17033324pjb.52.1592810569677;
        Mon, 22 Jun 2020 00:22:49 -0700 (PDT)
Received: from localhost ([122.172.111.76])
        by smtp.gmail.com with ESMTPSA id w5sm12579883pfn.22.2020.06.22.00.22.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jun 2020 00:22:48 -0700 (PDT)
Date:   Mon, 22 Jun 2020 12:52:47 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Sumit Gupta <sumitg@nvidia.com>
Cc:     rjw@rjwysocki.net, catalin.marinas@arm.com, will@kernel.org,
        thierry.reding@gmail.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, jonathanh@nvidia.com, talho@nvidia.com,
        linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        bbasu@nvidia.com, mperttunen@nvidia.com
Subject: Re: [TEGRA194_CPUFREQ Patch v3 1/4] dt-bindings: arm: Add t194
 ccplex compatible and bpmp property
Message-ID: <20200622072247.agrvmw6sl3jwgjkz@vireshk-i7>
References: <1592775274-27513-1-git-send-email-sumitg@nvidia.com>
 <1592775274-27513-2-git-send-email-sumitg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1592775274-27513-2-git-send-email-sumitg@nvidia.com>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 22-06-20, 03:04, Sumit Gupta wrote:
> To do frequency scaling on all CPUs within T194 CPU Complex, we need
> to query BPMP for data on valid operating points. Document a compatible
> string under 'cpus' node to represent the CPU Complex for binding drivers
> like cpufreq which don't have their node or CPU Complex node to bind to.
> Also, document a property to point to the BPMP device that can be queried
> for all CPUs.

You shouldn't be putting how linux is going to use this information and entries
shouldn't be made just so cpufreq can bind to a driver.

Though I see that this is a real hardware register which you can use to interact
with the firmware ? And so it makes sense to have it, maybe in different form
though.

I will let Rob explain what would be the right way of doing this though.

> 
> Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
> ---
>  Documentation/devicetree/bindings/arm/cpus.yaml | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
> index a018147..737b55e 100644
> --- a/Documentation/devicetree/bindings/arm/cpus.yaml
> +++ b/Documentation/devicetree/bindings/arm/cpus.yaml
> @@ -162,6 +162,7 @@ properties:
>        - nvidia,tegra132-denver
>        - nvidia,tegra186-denver
>        - nvidia,tegra194-carmel
> +      - nvidia,tegra194-ccplex
>        - qcom,krait
>        - qcom,kryo
>        - qcom,kryo260
> @@ -255,6 +256,14 @@ properties:
>  
>        where voltage is in V, frequency is in MHz.
>  
> +  nvidia,bpmp:
> +    $ref: '/schemas/types.yaml#/definitions/phandle'
> +    descrption: |
> +      Specifies the bpmp node that needs to be queried to get
> +      operating point data for all CPUs.
> +
> +      Optional for NVIDIA Tegra194 Carmel CPUs
> +
>    power-domains:
>      $ref: '/schemas/types.yaml#/definitions/phandle-array'
>      description:
> -- 
> 2.7.4

-- 
viresh

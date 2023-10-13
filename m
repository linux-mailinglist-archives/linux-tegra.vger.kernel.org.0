Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15C687C894E
	for <lists+linux-tegra@lfdr.de>; Fri, 13 Oct 2023 17:58:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232372AbjJMP5T (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 13 Oct 2023 11:57:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232448AbjJMP5S (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 13 Oct 2023 11:57:18 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD326BD
        for <linux-tegra@vger.kernel.org>; Fri, 13 Oct 2023 08:57:15 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-31427ddd3fbso2041633f8f.0
        for <linux-tegra@vger.kernel.org>; Fri, 13 Oct 2023 08:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697212634; x=1697817434; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8LAXrLJ2lcRFW09jUVSADWHxU251/uo5zq+bUMsrf4Y=;
        b=yioa1HuLG6pe/lfSyDIcSMKlzNW3Bf4RUG1a7S4xHkXhNuKCTdvwn4W0muDd/2X7HK
         KW+nknYD+6QeUm7M/VsIQ6OBlWovtKHipGb8fAuLdgmUJBYLYGOx1o2JrFGSMErg35ay
         RiL3NPubxamQfzFDRe6m01CEVDhlS2JMjGk4OCuC0kiyi+fpkg7JRA9UsuswT3uQqU9C
         QDrIgBB4i86bywbpxNFN74H14i5X3AxCE6y3nNG5zpuuPPPFYMY+M3EQiIRZdZgbQ54Q
         LIEaBlgxpRJ2VooCnfs5Ut+Ywt4dm4iQOmBGQHYsdsTiIUGyui/6ZgYlp/ixxXtgtJN2
         y5gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697212634; x=1697817434;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8LAXrLJ2lcRFW09jUVSADWHxU251/uo5zq+bUMsrf4Y=;
        b=BOUKhqSWJjfNf+GQUt6bzC5dNa1+eyCDxGEGjAdELRLj5LhKKlBkyyK/rWfRyVbm/d
         LHJ3TMXX92CRJ1ZItNIxDG05tuTbi1p2mCkuvdQVp/vFtcKkQT8ECk7FdwlfHIVQK8yO
         J2rJAmY9nwEhEknjGYxH3I2ps7bpzPbBgzdlyl6Q99q+jcwEi5YGh4pdAvvbKKH1X5Pm
         6eI6v90aLJJAt6woyVS4HryRaXytArZTPH3fBwNEN1u7RCSUdd/37O4hCck/d6Aja1iS
         1ulRxq+MgL9hqIJzHTlOgmrNgvSKpu0lX7vV0Zfs9pJSs8Niqum1hqmoZ78mWUVW5MyV
         m1vw==
X-Gm-Message-State: AOJu0YxsWkV6OD8G7DnYfvy4oTvVdumhxnUJMOJ5X7vpzuQ2V3ii/jbP
        IsIlBipdSfD9q4B2I7PWk+xt6w==
X-Google-Smtp-Source: AGHT+IEdcvcROHXymY8k3U3zBL4YWhy8WSXHNikbBAaMbWzhaR2J7dU+GMvl7wYK5y6A9d0B+d8aWQ==
X-Received: by 2002:a05:6000:1946:b0:327:e073:d604 with SMTP id e6-20020a056000194600b00327e073d604mr21446330wry.45.1697212634245;
        Fri, 13 Oct 2023 08:57:14 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:c49e:e1a5:3210:b8c0? ([2a05:6e02:1041:c10:c49e:e1a5:3210:b8c0])
        by smtp.googlemail.com with ESMTPSA id j11-20020a05600c42cb00b0040652e8ca13sm468988wme.43.2023.10.13.08.57.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Oct 2023 08:57:13 -0700 (PDT)
Message-ID: <ea6c4056-9e7c-4aa3-b207-a97436682b8e@linaro.org>
Date:   Fri, 13 Oct 2023 17:57:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/13] thermal: tegra: Do not register cooling device
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20231012175836.3408077-1-thierry.reding@gmail.com>
 <20231012175836.3408077-7-thierry.reding@gmail.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20231012175836.3408077-7-thierry.reding@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 12/10/2023 19:58, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The SOCTHERM's built-in throttling mechanism doesn't map well to the
> concept of a cooling device because it will automatically start to
> throttle when the programmed temperature threshold is crossed.
> 
> Remove the cooling device implementation and instead unconditionally
> program the throttling for the CPU and GPU thermal zones.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---

[ ... ]

> +	ret = of_property_read_u32(np, "temperature-millicelsius",
> +				   &stc->temperature);
> +	if (ret < 0)
> +		goto err;
> +
> +	ret = of_property_read_u32(np, "hysteresis-millicelsius",
> +				   &stc->hysteresis);
> +	if (ret < 0)
> +		goto err;
> +
> +	stc->num_zones = of_count_phandle_with_args(np, "nvidia,thermal-zones",
> +						    NULL);
> +	if (stc->num_zones > 0) {
> +		struct device_node *zone;
> +		unsigned int i;
> +
> +		stc->zones = devm_kcalloc(ts->dev, stc->num_zones, sizeof(zone),
> +					  GFP_KERNEL);
> +		if (!stc->zones)
> +			return -ENOMEM;
> +
> +		for (i = 0; i < stc->num_zones; i++) {
> +			zone = of_parse_phandle(np, "nvidia,thermal-zones", i);
> +			stc->zones[i] = zone;
> +		}
> +	}

What is the connection between the temperature sensor and the hardware 
limiter?

I mean, one hand there is the hardware limiter which is not connected to 
the sensor neither a thermal zone and it could be self contained in a 
separate driver. And then there is the temperature sensor.

The thermal zone phandle things connected with the throttling bindings 
sounds like strange to me.

What prevents to split the throttling and the sensor into separate code?

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


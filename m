Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CEB316D0090
	for <lists+linux-tegra@lfdr.de>; Thu, 30 Mar 2023 12:03:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231143AbjC3KDn (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 30 Mar 2023 06:03:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230519AbjC3KDi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 30 Mar 2023 06:03:38 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12A4235A2
        for <linux-tegra@vger.kernel.org>; Thu, 30 Mar 2023 03:03:30 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id r29so18436104wra.13
        for <linux-tegra@vger.kernel.org>; Thu, 30 Mar 2023 03:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680170608;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q67EYAzBTnF6htS4gaHY2CH+LDikgDT6oFHAac/m+GY=;
        b=RN/ot4R7RmNmAaM2OAPxwQSFp+Q763rHDL1x+xeDIuQi4lbkpQdf2+WOA5OnrkybOd
         56UDkV0MmIMEkrNGSjYlTdmN4v6SGFstQM5OP08ld/3dcImAwVp0CSwaxHFPDuYaqGzD
         4+u+DPQFIyBm0zypYa81LarDCpsLq64yfgL0li8yHl6YKhKkqRJYX5sAuN2v4PcChWxm
         cZdEvaLD1DEko3bwsvqkaqhHvUi8XjaXMhr6lgrMKHPMNQqB4hBslVDcC/m03/0rilAP
         zXiF8oXQNPbBDqjzheOYS9MhroYeesANlFfSCvBI6DW4ZkHPI3jta4MmgOe8DgrN/jjK
         6rEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680170608;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q67EYAzBTnF6htS4gaHY2CH+LDikgDT6oFHAac/m+GY=;
        b=wAK4fJL8zx3HYPvAzgPX5DnNGAkw0zTXm+TSCicAbqGJ+U98KHv4ZEWlKosjS7KGW8
         jeKeL+ZWHGJiQ48Nn2/oRwhwE3/9q3/AgYwUCagImZViWH/EvnVw2mJrC/HkDryWKrTB
         +1+FLGGlAA/LL9DGiIAz7Zs1Ji/YqWo1lTuAdaeOCxq/GbpZOioYXpPKycDN3hzzrEqo
         lVbUwu3zLeQRfmDZFRoEKbXeLYYpyhv/mZr33E27SPQDWH8eleH9vpLJulCGXiF/PQGr
         +2iKlvqLPUxlwDBKwHwx0sTXXzfD1GfKfT5bglZ54uuLyc2g788fOn4tYFZI4MRnL10P
         MmWA==
X-Gm-Message-State: AAQBX9e0hv4vxF+76OCWyE+IPbBysGxEqz1icEqEZIL31A7bxrQDwzgp
        w10mhW/WZNYUExO00ulXn9GciA==
X-Google-Smtp-Source: AKy350a5vtUxYvnrl3dUR+T0f1fGPMCgyWDl0eAgDoDenODoHABeaFsgi1LNWO+C7Ug/2Wg75ysSvQ==
X-Received: by 2002:a5d:56d2:0:b0:2c7:46f:c410 with SMTP id m18-20020a5d56d2000000b002c7046fc410mr18275289wrw.36.1680170608333;
        Thu, 30 Mar 2023 03:03:28 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:9ee7:40a0:eee0:62cc? ([2a05:6e02:1041:c10:9ee7:40a0:eee0:62cc])
        by smtp.googlemail.com with ESMTPSA id q18-20020a7bce92000000b003ef71d541cbsm5273793wmj.1.2023.03.30.03.03.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 03:03:27 -0700 (PDT)
Message-ID: <a09d8edf-9db1-0037-15a4-7ce329b82bf2@linaro.org>
Date:   Thu, 30 Mar 2023 12:03:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2] thermal: tegra-bpmp: Handle offline zones
Content-Language: en-US
To:     Mikko Perttunen <cyndis@kapsi.fi>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     Mikko Perttunen <mperttunen@nvidia.com>, linux-pm@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230330094904.2589428-1-cyndis@kapsi.fi>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230330094904.2589428-1-cyndis@kapsi.fi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 30/03/2023 11:49, Mikko Perttunen wrote:
> From: Mikko Perttunen <mperttunen@nvidia.com>
> 
> Thermal zones located in power domains may not be accessible when
> the domain is powergated. In this situation, reading the temperature
> will return -BPMP_EFAULT. When evaluating trips, BPMP will internally
> use -256C as the temperature for offline zones.

> For smooth operation, for offline zones, return -EAGAIN when reading
> the temperature and allow registration of zones even if they are
> offline during probe.

I think it makes more sense to check if the power domain associated with 
the device is powered up and if not return -EPROBE_DEFER.


> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
> v2:
> * Adjusted commit message.
> * Patch 2/2 dropped for now since it is more controversial,
>    and this patch is more critical.
> 
>   drivers/thermal/tegra/tegra-bpmp-thermal.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/thermal/tegra/tegra-bpmp-thermal.c b/drivers/thermal/tegra/tegra-bpmp-thermal.c
> index f5fd4018f72f..4ffc3bb3bf35 100644
> --- a/drivers/thermal/tegra/tegra-bpmp-thermal.c
> +++ b/drivers/thermal/tegra/tegra-bpmp-thermal.c
> @@ -52,6 +52,8 @@ static int __tegra_bpmp_thermal_get_temp(struct tegra_bpmp_thermal_zone *zone,
>   	err = tegra_bpmp_transfer(zone->tegra->bpmp, &msg);
>   	if (err)
>   		return err;
> +	if (msg.rx.ret == -BPMP_EFAULT)
> +		return -EAGAIN;
>   	if (msg.rx.ret)
>   		return -EINVAL;
>   
> @@ -259,7 +261,12 @@ static int tegra_bpmp_thermal_probe(struct platform_device *pdev)
>   		zone->tegra = tegra;
>   
>   		err = __tegra_bpmp_thermal_get_temp(zone, &temp);
> -		if (err < 0) {
> +
> +		/*
> +		 * Sensors in powergated domains may temporarily fail to be read
> +		 * (-EAGAIN), but will become accessible when the domain is powered on.
> +		 */
> +		if (err < 0 && err != -EAGAIN) {
>   			devm_kfree(&pdev->dev, zone);
>   			continue;
>   		}

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


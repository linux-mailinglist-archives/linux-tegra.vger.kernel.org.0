Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 204132E18B8
	for <lists+linux-tegra@lfdr.de>; Wed, 23 Dec 2020 07:02:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727744AbgLWGBp (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 23 Dec 2020 01:01:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727160AbgLWGBp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 23 Dec 2020 01:01:45 -0500
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 072D4C06179C
        for <linux-tegra@vger.kernel.org>; Tue, 22 Dec 2020 22:01:05 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id x18so8603637pln.6
        for <linux-tegra@vger.kernel.org>; Tue, 22 Dec 2020 22:01:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4NTrNWSzSRmqwCvEQTSp0+nnEx8m/nIQOMiO0uIjc1c=;
        b=WvDRkmfxJVkbMxrPHfQO3jIIP0y/4x9UMXb4LToUg0c0YVvY1v4RZrwNlueMl3TxUA
         LhGgJdJ92dhnRdqfHs6g8anfNRbf1l3Kmc9/pX6fAPYlRtoT262w08UsgSlWlqjwupim
         2rTRdJaJfAcBRk7WFZGXpnHhMzcnnfOVRchCFyriNz+u0XQ8rIHPtECtKub6jjl2X1+5
         u0ItXOKm5ZnduCP8Cm7CrIEnXL9xd920+5LPpI6GbeLhPSxVFzdGqmDFUxmXoFqjPlZL
         qvMtwOzbFqkFpFexgWWO5Tdjz5PhXaRJUfKZ1KFBLp0LcE39lWeRM19YL0vgg7wtne1B
         Yrtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4NTrNWSzSRmqwCvEQTSp0+nnEx8m/nIQOMiO0uIjc1c=;
        b=ckoYYdSzQo8T9Hzq0MQEmmJDVbIkipu7CI3RRpOmAAURG9N9/3CkPDez3UgCftY/oR
         pqQeCBRrQzOK/SPnxKd91agfQXHbdHyW+u30y+dL9cRt4dBPg81pzR8T+3TseRjf4OE2
         PEjZvCCxSvtbLyfu/l9W5AjV2gVWM1EN4+TRDg5RlA4ZkJINo6nRItSLzuWzk+kZqDFo
         XHLz2LpdrVrjiKR+tgtLblFtQGL8QsaJTNOt3vpV36gFxvaAMNxDN/L9oqc0Ar7rHJ+Z
         idijkcAIF4SDIhOuc/hww/IzIUCFkAh7DJGL4E8OvpxN5KfcDfH58Vmo7pG9V5BeMsoi
         Vk+w==
X-Gm-Message-State: AOAM530WZZEeeFya6snkxL9wEWTqGMQx36wNrjGxMkrbTB2RIButLQ8L
        kcAVC2XdRKz0XevpdUGqjkIjtQ==
X-Google-Smtp-Source: ABdhPJyh2KPTGU4ayTa1XNiz400Y+zyRHMud7qFaV0QD/t+nRNJvznyZNbPeqd5VSc3ukQwC7r4DkA==
X-Received: by 2002:a17:90b:16cd:: with SMTP id iy13mr24835386pjb.182.1608703264363;
        Tue, 22 Dec 2020 22:01:04 -0800 (PST)
Received: from localhost ([122.172.20.109])
        by smtp.gmail.com with ESMTPSA id y27sm22645455pfr.78.2020.12.22.22.01.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Dec 2020 22:01:03 -0800 (PST)
Date:   Wed, 23 Dec 2020 11:31:01 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Kevin Hilman <khilman@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 15/48] opp: Support set_opp() customization without
 requiring to use regulators
Message-ID: <20201223060101.v2qihvvgsmpahg24@vireshk-i7>
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-16-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201217180638.22748-16-digetx@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 17-12-20, 21:06, Dmitry Osipenko wrote:
> Support set_opp() customization without requiring to use regulators. This
> is needed by drivers which want to use dev_pm_opp_set_rate() for changing
> rates of a multiple clocks and don't need to touch regulator.
> 
> One example is NVIDIA Tegra30/114 SoCs which have two sibling 3D hardware
> units which should be use to the same clock rate, meanwhile voltage
> scaling is done using a power domain. In this case OPP table doesn't have
> a regulator, causing a NULL dereference in _set_opp_custom().
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/opp/core.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/opp/core.c b/drivers/opp/core.c
> index 3d02fe33630b..625dae7a5ecb 100644
> --- a/drivers/opp/core.c
> +++ b/drivers/opp/core.c
> @@ -828,17 +828,25 @@ static int _set_opp_custom(const struct opp_table *opp_table,
>  			   struct dev_pm_opp_supply *old_supply,
>  			   struct dev_pm_opp_supply *new_supply)
>  {
> -	struct dev_pm_set_opp_data *data;
> +	struct dev_pm_set_opp_data *data, tmp_data;
> +	unsigned int regulator_count;
>  	int size;
>  
> -	data = opp_table->set_opp_data;
> +	if (opp_table->set_opp_data) {
> +		data = opp_table->set_opp_data;
> +		regulator_count = opp_table->regulator_count;
> +	} else {
> +		data = &tmp_data;
> +		regulator_count = 0;
> +	}
> +

We should use the same structure, you can add some checks but not replace the
structure altogether.

>  	data->regulators = opp_table->regulators;
> -	data->regulator_count = opp_table->regulator_count;
> +	data->regulator_count = regulator_count;
>  	data->clk = opp_table->clk;
>  	data->dev = dev;
>  
>  	data->old_opp.rate = old_freq;
> -	size = sizeof(*old_supply) * opp_table->regulator_count;
> +	size = sizeof(*old_supply) * regulator_count;
>  	if (!old_supply)
>  		memset(data->old_opp.supplies, 0, size);
>  	else

-- 
viresh

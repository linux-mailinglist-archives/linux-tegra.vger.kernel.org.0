Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19EB72E07CD
	for <lists+linux-tegra@lfdr.de>; Tue, 22 Dec 2020 10:15:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726313AbgLVJOw (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 22 Dec 2020 04:14:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726035AbgLVJOv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 22 Dec 2020 04:14:51 -0500
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D3D3C0613D3
        for <linux-tegra@vger.kernel.org>; Tue, 22 Dec 2020 01:14:11 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id h186so8130288pfe.0
        for <linux-tegra@vger.kernel.org>; Tue, 22 Dec 2020 01:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=MVpnGnCFYtu4ycJzZf+LSk9hEI84NI49MudCxGCR+HM=;
        b=MH/242BQ7qGA/c7ZKFlxo9k35H+BRyW2M9A5zqCbM7dzzv0lHpYdUkBpCj7oEZp13m
         Ffv/YsG7ikpYjSZ/eEGKTEqY8LO+IwgxlNhlguzw31ez4ZqJJXcjZLoVnBXGWPC6ErWp
         C4MMWo1PjKz1dR7jRL3QB8SQVMUTHXfciaZm6EDwN6BotFowAPQcOqN9+kpF0OvIKtTd
         1qrZG5oeRJU/1gmMrD39Gfgd5fELI6zV4kIgaf3rqokdN4f26P7QJMe8AgrauAKTYpgV
         F65EaKqCccbzS16iksFwGpcNQ/HNxaTyiClovDAv6TCiG96SWFf14Mxu2pqAyQ6WpN2l
         eGbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=MVpnGnCFYtu4ycJzZf+LSk9hEI84NI49MudCxGCR+HM=;
        b=cNelTg3iHiEKbwHyaOgMZfS3+70anmlr6YJ96zNCNbmZLZ4iYj0eAymOn9o0/7I6pG
         Vq52LNiuFD97yUjfoCu25mCrpvhGVzufCFs+mbqgB9FOlju956eWe672jwAuDk+3DKS4
         fCycYtRUQi4J5sEf6RSRQ6YgI2PvBj8SZ2USfLIMCvkQ6h1AykkY7R7d4/YXIgjyw0IB
         4XpZwG5TEM8rJRyFvq7nL/phPjrVp6oXsymn71xQVcr56kRmGrZvdOstWf+XivMQ8dKO
         MOhwkuP4ZtzH4kzRKnJoBbAPje0ujak5mZJ9D8ApvPvGm3fSivM0cXn0pPTSs0H1a9pQ
         oI/A==
X-Gm-Message-State: AOAM533axtWAzFf+AkXWT8sof5Pulxg+o2eof8Y5YiKLxrqKMFMBnKuY
        VZRJoBwiCRCMSW/tDcifhbpbJw==
X-Google-Smtp-Source: ABdhPJxR442Its0VhdjNxmES11BozYg6f4jsASsSW6TfWxeI3592psXLb9CuQTRVoVKmE/eJsKTU5A==
X-Received: by 2002:a05:6a00:230d:b029:18b:9cb:dead with SMTP id h13-20020a056a00230db029018b09cbdeadmr18667524pfh.24.1608628450994;
        Tue, 22 Dec 2020 01:14:10 -0800 (PST)
Received: from localhost ([122.172.20.109])
        by smtp.gmail.com with ESMTPSA id t5sm18222978pjr.22.2020.12.22.01.14.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Dec 2020 01:14:10 -0800 (PST)
Date:   Tue, 22 Dec 2020 14:44:08 +0530
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
Subject: Re: [PATCH v2 44/48] ARM: tegra: Add OPP tables and power domains to
 Tegra30 device-tree
Message-ID: <20201222091408.vvputqs27olywdxq@vireshk-i7>
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-45-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201217180638.22748-45-digetx@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 17-12-20, 21:06, Dmitry Osipenko wrote:
> diff --git a/arch/arm/boot/dts/tegra30-peripherals-opp.dtsi b/arch/arm/boot/dts/tegra30-peripherals-opp.dtsi
> index cbe84d25e726..983db1a06682 100644
> --- a/arch/arm/boot/dts/tegra30-peripherals-opp.dtsi
> +++ b/arch/arm/boot/dts/tegra30-peripherals-opp.dtsi
> @@ -1,6 +1,56 @@
>  // SPDX-License-Identifier: GPL-2.0
>  
>  / {
> +	core_opp_table: core-power-domain-opp-table {
> +		compatible = "operating-points-v2";
> +		opp-shared;
> +
> +		core_opp_950: opp@950000 {
> +			opp-microvolt = <950000 950000 1350000>;
> +			opp-level = <950000>;

Perhaps you don't need to exactly copy the voltage value into the level field.
The level field can just be kept to 0, 1,2, 3, etc..

> +		};
> +
> +		core_opp_1000: opp@1000000 {
> +			opp-microvolt = <1000000 1000000 1350000>;
> +			opp-level = <1000000>;
> +		};
> +
> +		core_opp_1050: opp@1050000 {
> +			opp-microvolt = <1050000 1050000 1350000>;
> +			opp-level = <1050000>;
> +		};
> +
> +		core_opp_1100: opp@1100000 {
> +			opp-microvolt = <1100000 1100000 1350000>;
> +			opp-level = <1100000>;
> +		};
> +
> +		core_opp_1150: opp@1150000 {
> +			opp-microvolt = <1150000 1150000 1350000>;
> +			opp-level = <1150000>;
> +		};
> +
> +		core_opp_1200: opp@1200000 {
> +			opp-microvolt = <1200000 1200000 1350000>;
> +			opp-level = <1200000>;
> +		};
> +
> +		core_opp_1250: opp@1250000 {
> +			opp-microvolt = <1250000 1250000 1350000>;
> +			opp-level = <1250000>;
> +		};
> +
> +		core_opp_1300: opp@1300000 {
> +			opp-microvolt = <1300000 1300000 1350000>;
> +			opp-level = <1300000>;
> +		};
> +
> +		core_opp_1350: opp@1350000 {
> +			opp-microvolt = <1350000 1350000 1350000>;
> +			opp-level = <1350000>;
> +		};
> +	};

-- 
viresh

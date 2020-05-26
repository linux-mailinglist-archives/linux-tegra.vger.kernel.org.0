Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 396A21A3D07
	for <lists+linux-tegra@lfdr.de>; Fri, 10 Apr 2020 01:44:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726859AbgDIXoV (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 9 Apr 2020 19:44:21 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:43195 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726327AbgDIXoV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Apr 2020 19:44:21 -0400
Received: by mail-lj1-f193.google.com with SMTP id h25so343169lja.10;
        Thu, 09 Apr 2020 16:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=eplP7HigK8Ewza+SjO81i9tb9swgjSdpeTM2vE+t2FI=;
        b=Z+OFqTSEtWD+OR0/pzr+dM8ugXHWeikyhxm/KgbzcPr0hpv7bgSSKGq1REFh393r9Y
         +cjiNaten3HWmd7TxIHO3zqw54SrSOcpfrZFCIrd6ZPeX8z3tuYZGZybmwKgVsYzYMZv
         eaHQahH+nMqmL8ymsrSYu0pUiacrioYnJ+jb4B6zLDyFv07S2Qenm395qW5Z3Ua0fx6y
         zL6ESY9Mh8/zrOc1NJEE1+dZEp9WaL/bG8glG3/JD0+fyAPuMQSuHsCUVj0MRqVMxj9o
         VmddSw5J9OruFahcTsOUaNrxs4X1GoXvMZIfHrSbUf+tKQtQIkzoFZvCZDQ5jUc14PLx
         nViw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=eplP7HigK8Ewza+SjO81i9tb9swgjSdpeTM2vE+t2FI=;
        b=EOnMeZe7c9xA2nP2VytTEEU3JPgaHLGV2ZEpRo2Hc6gfVeHJy1Ad5h3vmbEXg+m5J8
         5nJaPXUuobpIgh6UVB3zyZ7fNMKm88tkMoXK1g8B2RUo/io3YWqgQj0cy47IZDEqJR3x
         EMyePe8wGGSmFyuhSLMEJJl0kaRfMJjBHBd87H4qgHUP861v5DZxqQO3vp3+TpAbYjPx
         nKEjE6Ark+3aFgWCJMo940P6xR0Y7wUYplAiHJoUaSh01yulmkHJP+nKUdFImQGMyO00
         SMVVYdsn/Ghfse57Y12+KtazSuAkYeGT/Pm0pRl9Qpt2GSlXDX7bGdnwFBlsF86dGyOi
         AKfg==
X-Gm-Message-State: AGi0PuaEQF5Vi8aC0E7bfXrGubTANfFSuWM9W4wjZhj/QYfrf7yBw3JX
        EyGTHfYF56gnhHlEm+qWGkM=
X-Google-Smtp-Source: APiQypKOjhusE3Y7SNrXp1CXEoE/mqfoQN6rYgf5UIc2VAPmQ3PefCXTqRsbwrmhttzvDhBHDOpurA==
X-Received: by 2002:a2e:8511:: with SMTP id j17mr1356714lji.292.1586475858785;
        Thu, 09 Apr 2020 16:44:18 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id 64sm283254lfh.32.2020.04.09.16.44.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2020 16:44:17 -0700 (PDT)
Subject: Re: [PATCH v6 11/14] memory: tegra: Support derated timings on
 Tegra210
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Joseph Lo <josephl@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20200409175238.3586487-1-thierry.reding@gmail.com>
 <20200409175238.3586487-12-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <7f23f140-4c56-3d9a-946e-f29bc569f40c@gmail.com>
Date:   Fri, 10 Apr 2020 02:44:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200409175238.3586487-12-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

09.04.2020 20:52, Thierry Reding пишет:
...
>  	tegra210_emc_debugfs_init(emc);
>  
> +	cd = devm_thermal_of_cooling_device_register(emc->dev, np, "emc", emc,
> +						     &tegra210_emc_cd_ops);
> +	if (IS_ERR(cd)) {
> +		err = PTR_ERR(cd);
> +		dev_err(emc->dev, "failed to register cooling device: %d\n",
> +			err);

> +		goto detach;

I think it's not really worthwhile to fail whole EMC driver because of
the failed CDEV.

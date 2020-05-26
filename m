Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 130DC19DBC1
	for <lists+linux-tegra@lfdr.de>; Fri,  3 Apr 2020 18:33:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404545AbgDCQd3 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 3 Apr 2020 12:33:29 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:38321 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403834AbgDCQd3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 3 Apr 2020 12:33:29 -0400
Received: by mail-lj1-f194.google.com with SMTP id v16so7599103ljg.5;
        Fri, 03 Apr 2020 09:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4fDqTfkx4s/hoWco9IqQyOBi9hVMRkMxaYHCSQZz32M=;
        b=vF6AKxYepfMhz5KpdLRqBl8CgNcVtORl6kJUjZJayifDV6bxqGps7ImjAQKwJbOlrS
         k9ciAI3kr7UIjYuY9SqAtT5xDq1BodDkf7WV3d21RDhw/vUSDU/R/+vfp28LJOUGiVvf
         9jM0Rkjyv77OPDhsRQnGiiF//0durL6UxULWWmZ01e8nrXST2Ey/59OLk1nLbuBDZzRB
         h/8JsxtPQlyMjNEOlpHkSSmmC1zOvWMk5wpQgn9FbYxYHosCmve8tpWc094QOW40l03j
         ks9QMZz8Y2CNsMaaJl7qgKmpmXaCDxzqYOSG4C61U2rX64kF6mfmrw/cx8DxobcthKhA
         nBfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4fDqTfkx4s/hoWco9IqQyOBi9hVMRkMxaYHCSQZz32M=;
        b=ZCDvz9iRGIiYhia6IVQjuq9YWFgs/dzpyjK5qSAqype3Xi68tEqHrkumOlvHcanBEK
         S/QfsYQEsXiqzxp9WZXkEKvnOZLT8Eo0jfeazAfw1pBUxQoIgna14FEJ3FzdifiExUTO
         m8VRcqHBuYOLxaJnXewupCSyZoBg9zcbrAgJkFVbaumrYgdLvt2p+hzxPhLw2kU/AyDW
         sw/QiauUFG6vGg3W4S7Cp3JizdmVj3mTWvmjs5X0h04RxbGkbImgGdGFvEqcabTExLu5
         s4odCrm8htOaM/5bZKBC/SGcruFolafZ0vz67ZR4di45hwyp3XwYtDkvH5Jlatir72Sg
         7hDA==
X-Gm-Message-State: AGi0PuYrUhLd0mMxGRSgpe0kfjhXY/lWxKC85uVP3Tc2pP0iryp+zQw6
        Lj1suLB69Ad7GAkAbCJFDR72hAv5
X-Google-Smtp-Source: APiQypLnWZ1KmknHBadkRmdgO5AzNTC3XSpWvhGXSGcwm9CpVCHEEsqOzJu59kBa5vQS7OIIbP/ZEA==
X-Received: by 2002:a2e:8015:: with SMTP id j21mr5128664ljg.165.1585931606195;
        Fri, 03 Apr 2020 09:33:26 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id d12sm6007971lfi.86.2020.04.03.09.33.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2020 09:33:25 -0700 (PDT)
Subject: Re: [PATCH v2 2/7] clocksource: Add Tegra186 timers support
To:     Thierry Reding <thierry.reding@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200331221914.2966407-1-thierry.reding@gmail.com>
 <20200331221914.2966407-3-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a982d831-fc59-f705-8f8a-9370b897adb8@gmail.com>
Date:   Fri, 3 Apr 2020 19:33:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200331221914.2966407-3-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

01.04.2020 01:19, Thierry Reding пишет:
...
> +static int tegra186_timer_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct tegra186_timer *tegra;
> +	int err;
> +
> +	tegra = devm_kzalloc(dev, sizeof(*tegra), GFP_KERNEL);
> +	if (!tegra)
> +		return -ENOMEM;
> +
> +	tegra->soc = of_device_get_match_data(dev);
> +	dev_set_drvdata(dev, tegra);
> +	tegra->dev = dev;
> +
> +	tegra->regs = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(tegra->regs))
> +		return PTR_ERR(tegra->regs);
> +
> +	err = platform_get_irq(pdev, 0);
> +	if (err < 0) {
> +		dev_err(dev, "failed to get interrupt #0: %d\n", err);
> +		return err;
> +	}
> +
> +	tegra->irq = err;
> +
> +	err = devm_request_irq(dev, tegra->irq, tegra186_timer_irq,
> +			       IRQF_ONESHOT | IRQF_TRIGGER_HIGH,
> +			       "tegra186-timer", tegra);

Looks like there is no need to store tegra->irq in the struct
tegra186_timer.

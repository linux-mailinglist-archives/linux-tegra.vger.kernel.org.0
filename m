Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A46C183245
	for <lists+linux-tegra@lfdr.de>; Thu, 12 Mar 2020 15:04:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727502AbgCLOEA (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 12 Mar 2020 10:04:00 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:36562 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727498AbgCLOEA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 12 Mar 2020 10:04:00 -0400
Received: by mail-lj1-f195.google.com with SMTP id g12so6586514ljj.3
        for <linux-tegra@vger.kernel.org>; Thu, 12 Mar 2020 07:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qKTaqDytagD0O2wTlbTJF0/J9uHzNIR8oj4ra9daOM8=;
        b=aYkSLnFFgjnfOwrnv1bkZJXAllGNQlS1h6LL+vuczIMAuxlDl2vzOZOZLFaJOF0RYU
         ZnfUwBXFh7vUDzXX4pN6iG9h2dRbP7yHFjQxx4Mjr6894lhMr5dOVGhZ9ja/envyBRJL
         BNC9Dx3ZqJYdAYEfAUoT0ZwrMvEPT1Z5DBDAeoZfXldt3Ghez4olv5UyazN5BIXANt8C
         svsL/tnDl+SXMh7nyyDc3FID0Ze7xXuv2Ql5USUaHgHtiLvetPqSXJqtqyH8/qL1yQCu
         WZsP7G5juEDROdknu2q0lZc8MugXUtk8335LKZWhGwRgmkd4oZlorV1YYEqHb/Q2kPLm
         WKfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qKTaqDytagD0O2wTlbTJF0/J9uHzNIR8oj4ra9daOM8=;
        b=G7ZT10xe1PchzYeQ+srj4bffEQaJd0zvwr9ZvvfU1NqY90QbGFXarHkPlKKlp8HC5H
         kE3qxXUbi8U9GoBIxmN9MNL08M7rd+FqLm1PihSPQEONhZler8DsejKthPIR6cs5mXB2
         +rUOTNf3AAYXXXlD8OQj0pDaZ+ULvnRIqz2Kff251GgaPDfT2yhLajF1zX6g+saOCTjV
         kdqk1UBfgas+HJ5YPOT09z+hS53KvMjyoi3YkIVs4ls5nLeb5ukCNevKGBs1Jbzr6YvA
         Dsw/mEz+VshnUAXe2e6/1fCYb31mFg7lm6XWqCMbVECMU6vdgM6x4z95YIAZvT5kngi2
         1XxA==
X-Gm-Message-State: ANhLgQ1z7J52XZmY+B1XQK2Mcd34W/H8maAKj47pLdHhdSp5Vh3oEdAQ
        Xmo80HtO9EXk+sRnCsesdO4m2IOM
X-Google-Smtp-Source: ADFU+vvCITbN/jgqfAHTW4GEJzjWjtUzEGnY8Gksa/EjYHKp9ufrbjJ1E03okV+xVPt7OOVh9jI1dA==
X-Received: by 2002:a2e:9ac5:: with SMTP id p5mr5386486ljj.200.1584021837662;
        Thu, 12 Mar 2020 07:03:57 -0700 (PDT)
Received: from [192.168.2.145] (94-29-39-224.dynamic.spd-mgts.ru. [94.29.39.224])
        by smtp.googlemail.com with ESMTPSA id c22sm21261599lfi.41.2020.03.12.07.03.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2020 07:03:57 -0700 (PDT)
Subject: Re: [PATCH v1 3/3] drm/tegra: dc: Silence RGB output deferred-probe
 error
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20200308223809.23549-1-digetx@gmail.com>
 <20200308223809.23549-3-digetx@gmail.com> <20200312093353.GB1199023@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <d2f72b22-59d1-ed0e-c22c-756091723415@gmail.com>
Date:   Thu, 12 Mar 2020 17:03:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200312093353.GB1199023@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

12.03.2020 12:33, Thierry Reding пишет:
> On Mon, Mar 09, 2020 at 01:38:09AM +0300, Dmitry Osipenko wrote:
>> Driver fails to probe with -EPROBE_DEFER if display output isn't ready
>> yet. This produces a bit noisy error message in KMSG during kernel's boot
>> up on Tegra20 and Tegra30 because RGB output tends to be probed earlier
>> than a corresponding voltage regulator driver.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/gpu/drm/tegra/dc.c | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
>> index 56d933e81797..d7f2c4654b6b 100644
>> --- a/drivers/gpu/drm/tegra/dc.c
>> +++ b/drivers/gpu/drm/tegra/dc.c
>> @@ -2571,7 +2571,11 @@ static int tegra_dc_probe(struct platform_device *pdev)
>>  
>>  	err = tegra_dc_rgb_probe(dc);
>>  	if (err < 0 && err != -ENODEV) {
>> -		dev_err(&pdev->dev, "failed to probe RGB output: %d\n", err);
>> +		if (err == -EPROBE_DEFER)
>> +			dev_dbg(&pdev->dev, "RGB output probe deferred\n");
>> +		else
>> +			dev_err(&pdev->dev, "failed to probe RGB output: %d\n",
>> +				err);
>>  		return err;
>>  	}
> 
> I'd prefer if we had just a single message and only differentiate on the
> kernel message level, something more along these lines:
> 
> 	if (err < 0 && err != -ENODEV) {
> 		const char *level = KERN_ERR;
> 
> 		if (err == -EPROBE_DEFER)
> 			level = KERN_DEBUG;
> 
> 		dev_printk(level, dc->dev, "failed to probe RGB output: %d\n",
> 			   err);
> 		return err;
> 	}
> 
> Do you mind if I squash that into your patch?

I don't mind, thanks :)

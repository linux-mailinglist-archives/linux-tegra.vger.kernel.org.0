Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D67F732CFEB
	for <lists+linux-tegra@lfdr.de>; Thu,  4 Mar 2021 10:44:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237800AbhCDJn1 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 4 Mar 2021 04:43:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237808AbhCDJnN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 4 Mar 2021 04:43:13 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B0A2C061574;
        Thu,  4 Mar 2021 01:42:32 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id q25so21881088lfc.8;
        Thu, 04 Mar 2021 01:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=bEHZ/Frn9iwzx4diKW6uN1aBQ3lfmU4krVx1yJhDOA4=;
        b=MoIboQDU+NHyjg+PGQjitOqCTdZNe7jYETiwVCov73FkhT/WyUvCnqjTZlx4A8GmF0
         OIWew0saIIX+QnCvMdjsg7wKg+BlbKxOcfCGALVX9LG5HPd1mrb3/865f4wnWHriQ7Ez
         0RZHySAEchv/sekCYdT1+HrvImzUFLj2art5hVnN/BL9u2qLynJd1T3aQYyFJnhMPZX1
         wTvXT1dpo7nkiJmBhLmGmWZcuy2l5UkomZP0TqXkuu9CazCfi/IEMlqGPVCi062NE5L8
         msK4XEFkZzFbK1yvts1H5IJAOde4tE8I9PL2qYmv9vUTOJ0sFCmIbh7lx68Jx8oqElwL
         ROQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bEHZ/Frn9iwzx4diKW6uN1aBQ3lfmU4krVx1yJhDOA4=;
        b=Ma6zruhz1QMhiG/I1k8vjW0wpiqQDseYOgXqshTzhFO0aawXxyhu4+gyj37NJ69WP7
         I1U9AnfJ5tSSBb92K0R7G11Xa2b5ljkDAVgqOyEQvTK9qBra+l3T8OHxup2NZjZwj+6S
         3fNn3wgdsHOp8nAstQT59DE+jFijsn51SeWDpj6WY8mis//HjLUCXNX5p9+geKr59QD4
         OjBtPJ4UgZnhoBRnvJoty8RzAsSl9bs0gPZYNsGWaMTFZmnF2m/Z2S/WbHbv4ryJsbOq
         Pf9o4+zZZB6EdTUtdK+IbAQtn58uOGtsVMBc2SMNrqXoAbYcFh/CZzLgNki/vFwwklNn
         kJ6A==
X-Gm-Message-State: AOAM530XwOT/xGRkWfSqFFfsA7i9SKM+N89idW/QpBi/D4hkG+PTnTSJ
        Z8jfCo9zaAwwI2AM4yfTDjv6nVPTdMs=
X-Google-Smtp-Source: ABdhPJxiTZQIWODAtj6+oKhwC7rv65S7mwjUAbzllukSkqBegigEZuay9DFOE/w38bc9b6Ft8KD7PQ==
X-Received: by 2002:ac2:4ecd:: with SMTP id p13mr1730346lfr.421.1614850950963;
        Thu, 04 Mar 2021 01:42:30 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.googlemail.com with ESMTPSA id r11sm1638373lfn.30.2021.03.04.01.42.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Mar 2021 01:42:30 -0800 (PST)
Subject: Re: [PATCH v1 5/5] ASoC: tegra30: i2s: Add reset control
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Paul Fertser <fercerpav@gmail.com>
Cc:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210302112123.24161-1-digetx@gmail.com>
 <20210302112123.24161-6-digetx@gmail.com>
 <cbb1f0d4-ddc5-733d-896d-dd76ce01ca69@gmail.com>
 <f581865a299091371a8450349e23ffdc8abb7b37.camel@pengutronix.de>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <26e504b7-1077-d43b-07c7-abe2bcf50cc4@gmail.com>
Date:   Thu, 4 Mar 2021 12:42:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <f581865a299091371a8450349e23ffdc8abb7b37.camel@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

03.03.2021 15:09, Philipp Zabel пишет:
> Hi Dmitry,
> 
> On Wed, 2021-03-03 at 11:28 +0300, Dmitry Osipenko wrote:
>> 02.03.2021 14:21, Dmitry Osipenko пишет:
>>> The I2S reset may be asserted at a boot time. Tegra30 I2S driver doesn't
>>> manage the reset control and currently it happens to work because reset
>>> is implicitly deasserted by the Tegra AHUB driver, but the reset of I2C
>>> controller should be synchronous and I2S clock is disabled when AHUB is
>>> reset. Add reset control to the Tegra30 I2S driver.
>>>
>>> Note that I2S reset was always specified in Tegra30+ device-trees, hence
>>> DTB ABI changes aren't required. Also note that AHUB touches I2S resets,
>>> hence AHUB resets are now requested in a released state, allowing both
>>> drivers to control the I2S resets together.
>>>
>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>> ---
>>>  sound/soc/tegra/tegra30_ahub.c | 14 ++++++++++---
>>>  sound/soc/tegra/tegra30_i2s.c  | 36 +++++++++++++++++++++++++++++++++-
>>>  sound/soc/tegra/tegra30_i2s.h  |  1 +
>>>  3 files changed, 47 insertions(+), 4 deletions(-)
>>
>> ...
>>> @@ -579,7 +587,7 @@ static int tegra30_ahub_probe(struct platform_device *pdev)
>>>  	if (ret)
>>>  		return ret;
>>>  
>>> -	ahub->reset = devm_reset_control_array_get_exclusive(&pdev->dev);
>>> +	ahub->reset = devm_reset_control_array_get_exclusive_released(&pdev->dev);
>>
>> Thinking a bit more about this, it looks like we actually want something
>> like:
>>
>> 	devm_reset_control_array_get_exclusive_released_named()
>>
>> that will request resets by given names and in a given order, similarly
>> to devm_clk_bulk_get(). This will be very handy for both Tegra audio and
>> GPU drivers. I'll prepare a v2 if there are no objections.
> 
> I do have an untested reset control bulk API patch that I've just never
> finished, because I had no user. I'll send you an RFC, let me know if
> you can build on that.

Hello, Philipp! Thank you very much for sharing the patch, it should be
very useful!

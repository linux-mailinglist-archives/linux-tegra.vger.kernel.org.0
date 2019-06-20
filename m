Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C52814DD75
	for <lists+linux-tegra@lfdr.de>; Fri, 21 Jun 2019 00:40:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725864AbfFTWkG (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 20 Jun 2019 18:40:06 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:43314 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbfFTWkF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 20 Jun 2019 18:40:05 -0400
Received: by mail-lf1-f67.google.com with SMTP id j29so3549624lfk.10
        for <linux-tegra@vger.kernel.org>; Thu, 20 Jun 2019 15:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qRURbsnCqTMEE5kr1Wm5Z1remitWDe9pKMbzHhK3ld0=;
        b=NupzzUHLSN93CI3WzQMh9slNwUYKlVXQ1IlaGA3gZflaAgVUHDY5CGL6qAjXwjwrC+
         /gaL1syZtUsyJzT7jzKzoWuPOhms8G/FFJnd0iMRWTDtrzhxiRGjZbC2pdROh6movkWa
         cpfakuz62zA06u/+6PHAPta+p7jDK5lzc9r6Q9U29AHNNPFYwIbV1jvX521iTB21xfdu
         tNUw9H/OIqOsrRMs0ctX4hHxWk8stbGZQxqU4HJouUBkpRRagusoiL1WWBF4D7UoTZLe
         51+TAdxRr7GBrccGuGnGoVYrzr0c3tggTSIRQpfb5/KNKwfmRk93YQXKbS3kzsDnJp3+
         E6hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qRURbsnCqTMEE5kr1Wm5Z1remitWDe9pKMbzHhK3ld0=;
        b=ebNLsQGblklSabdKzlZhgh/Zm/iPwLCj84l970IY8BXzuy+g8UGTXWxt3U8sWgnyjt
         kNl9H4adEMUS7JiAe7KHxMoD1HWumrK4YTA55VZERm3mKGDtq8saktoi7E9bV1BZYNOh
         IF6iVBoA5iD2Ff5zjiXO24v6Rn7GTqhmgA1/V3N6dtk7smVVsK6nWR0zKt8R6wNV5+BH
         7O1O3AXalTUZ9SLj2qgggdGUkQS45qG6+nxlYo1R6iumRnUody2MKA53suInm1tBEEit
         mIKTBxpgC2lpgZgtUoQe+7aItHuk2wBqAiPS5UY4oW14eNaZEFymvKbh8hs6+JS04ZRS
         7qGQ==
X-Gm-Message-State: APjAAAW0aN7EJLxJjlioZxirtKHWCUufKId3A8NyRqsyTP9noBPTXPpQ
        O+B9/UYqkERYA/TSsSOYaHc4hH/e
X-Google-Smtp-Source: APXvYqyy13H3Z2Hf5hSuf+UnLcPw719vaTIn/1IIgc6Y+/Yh/9R+/n1ftmdrpnozfKG1affqIr6T7A==
X-Received: by 2002:a19:ed07:: with SMTP id y7mr69966314lfy.56.1561070402821;
        Thu, 20 Jun 2019 15:40:02 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-79-162-197.pppoe.mtu-net.ru. [91.79.162.197])
        by smtp.googlemail.com with ESMTPSA id x19sm130361ljb.6.2019.06.20.15.40.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Jun 2019 15:40:02 -0700 (PDT)
Subject: Re: [pinmux scripts PATCH 1/3] Update kernel driver template
To:     Thierry Reding <thierry.reding@gmail.com>,
        Stephen Warren <swarren@wwwdotorg.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        linux-tegra@vger.kernel.org
References: <20190620170055.19771-1-thierry.reding@gmail.com>
 <20190620170831.GA20367@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <0fbdbbe8-f170-0d91-d8c1-bc76af4e9ff3@gmail.com>
Date:   Fri, 21 Jun 2019 01:40:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190620170831.GA20367@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

20.06.2019 20:08, Thierry Reding пишет:
> On Thu, Jun 20, 2019 at 07:00:53PM +0200, Thierry Reding wrote:
>> From: Thierry Reding <treding@nvidia.com>
>>
>> Some changes in recent years have modified the upstream kernel driver in
>> some ways that make it incompatible with the current template. Update
>> the template to take into account changes introduced by the following
>> commits:
>>
>> 	commit e3d2160f12d6aa7a87d9db09d8458b4a3492cd45
>> 	Author: Paul Gortmaker <paul.gortmaker@windriver.com>
>> 	Date:   Mon May 22 16:56:47 2017 -0400
>>
>> 	    pinctrl: tegra: clean up modular vs. non-modular distinctions
>>
>> 	    None of the Kconfigs for any of these drivers are tristate,
>> 	    meaning that they currently are not being built as a module by anyone.
>>
>> 	    Lets remove the modular code that is essentially orphaned, so that
>> 	    when reading the drivers there is no doubt they are builtin-only.  All
>> 	    drivers get similar changes, so they are handled in batch.
>>
>> 	    We remove module.h from code that isn't doing anything modular at
>> 	    all;  if they have __init sections, then replace it with init.h.
>>
>> 	    A couple drivers have module_exit() code that is essentially orphaned,
>> 	    and so we remove that.
>>
>> 	    Quite a few bool drivers (hence non-modular) are converted over to
>> 	    to builtin_platform_driver().
>>
>> 	    Since module_platform_driver() uses the same init level priority as
>> 	    builtin_platform_driver() the init ordering remains unchanged with
>> 	    this commit.
>>
>> 	    Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.
>>
>> 	    We also delete the MODULE_LICENSE tag etc. since all that information
>> 	    was (or is now) contained at the top of the file in the comments.
>>
>> 	    Cc: Linus Walleij <linus.walleij@linaro.org>
>> 	    Cc: Stephen Warren <swarren@wwwdotorg.org>
>> 	    Cc: Thierry Reding <thierry.reding@gmail.com>
>> 	    Cc: Alexandre Courbot <gnurou@gmail.com>
>> 	    Cc: Pritesh Raithatha <praithatha@nvidia.com>
>> 	    Cc: Ashwini Ghuge <aghuge@nvidia.com>
>> 	    Cc: linux-gpio@vger.kernel.org
>> 	    Cc: linux-tegra@vger.kernel.org
>> 	    Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
>> 	    Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>>
>> 	commit 3c94d2d08a032d911bbe34f2edb24cb63a63644a
>> 	Author: Stefan Agner <stefan@agner.ch>
>> 	Date:   Thu Jul 26 17:40:24 2018 +0200
>>
>> 	    pinctrl: tegra: define GPIO compatible node per SoC
>>
>> 	    Tegra 2 uses a different GPIO controller which uses "tegra20-gpio" as
>> 	    compatible string.
>>
>> 	    Make the compatible string the GPIO node is using a SoC specific
>> 	    property. This prevents the kernel from registering the GPIO range
>> 	    twice in case the GPIO range is specified in the device tree.
>>
>> 	    Fixes: 9462510ce31e ("pinctrl: tegra: Only set the gpio range if needed")
>> 	    Signed-off-by: Stefan Agner <stefan@agner.ch>
>> 	    Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>>
>> 	commit 1e0813ee5599932c856bda64a568895ed7a33d3a
>> 	Author: Dmitry Osipenko <digetx@gmail.com>
>> 	Date:   Thu Aug 2 14:11:43 2018 +0300
>>
>> 	    pinctrl: tegra: Move drivers registration to arch_init level
>>
>> 	    There is a bug in regards to deferred probing within the drivers core
>> 	    that causes GPIO-driver to suspend after its users. The bug appears if
>> 	    GPIO-driver probe is getting deferred, which happens after introducing
>> 	    dependency on PINCTRL-driver for the GPIO-driver by defining "gpio-ranges"
>> 	    property in device-tree. The bug in the drivers core is old (more than 4
>> 	    years now) and is well known, unfortunately there is no easy fix for it.
>> 	    The good news is that we can workaround the deferred probe issue by
>> 	    changing GPIO / PINCTRL drivers registration order and hence by moving
>> 	    PINCTRL driver registration to the arch_init level and GPIO to the
>> 	    subsys_init.
>>
>> 	    Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> 	    Acked-by: Stefan Agner <stefan@agner.ch>
>> 	    Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>>
>> Note that the last one is something that we probably should fix
>> correctly by using device links rather than working around it by playing
>> init level tricks.

I'd leave the init level as-is because it also resolves deferred probing
of the drivers which may come back if you'll move all drivers to the
default boot level. Drivers core should be aware of the hardware
topology to be able to probe drivers in the right order, but that's not
supported for the device tree.

Indeed, will be nice to have an explicit dependency on the PINCTRL
driver for the GPIO.

>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>> ---
>>  soc-to-kernel-pinctrl-driver.py | 27 +++++++++++----------------
>>  1 file changed, 11 insertions(+), 16 deletions(-)
> 
> There was supposed to be a cover letter for this... Anyway, patches 1
> and 2 basically get the kernel driver template up to date with the
> latest kernel driver. Patch 3 is Sowjanya's patch from yesterday but
> with one suggestion worked in to make the parked_bitmask field take 0
> as the special value meaning "unsupported".
> 
> I've also sent out two patches that are the result of regenerating the
> various SoC drivers from the updated script and tables.

This all is looking good to me! Thank you very much!

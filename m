Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C7A34FD46
	for <lists+linux-tegra@lfdr.de>; Sun, 23 Jun 2019 19:17:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726603AbfFWRR5 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 23 Jun 2019 13:17:57 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:36100 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726399AbfFWRR5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 23 Jun 2019 13:17:57 -0400
Received: by mail-qk1-f195.google.com with SMTP id g18so8121186qkl.3;
        Sun, 23 Jun 2019 10:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=oTQJHiQOFJX9TMuzD6eUCrwJJpcVrl2yW+goXQfQCj8=;
        b=YagS2PXc8FqOqNX+u/fWdMCITgu5lEhgaubB8vuu7uzFL0gXqZagiKIZKs075Bf/xm
         UHpjfEf41FZ8dknsiecZ79jJeMoFBiROnJHZYhKwdUoh1iVHiwxiZU2QgyWmNTCw4BB+
         AgzsP/ZA8K3p9NnzDJtG0nCHUxj9YdooaiInEB3skusuIqQV+tDcLsY/pU97SeAFFM/q
         MscnELUrEvzYMnj4gkr3gSTqr+jUwjE1dwAxknAEmnAyvmQgR+UD+e/eLzPmFieM/uJr
         gQVWp86juxDTV78xq7Seil+VANoXj2A4vXNtra5tasImp5I+qJQL0JXco9ozFZCbkvPw
         wISw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=oTQJHiQOFJX9TMuzD6eUCrwJJpcVrl2yW+goXQfQCj8=;
        b=p165nftV5SLY3PwwV5Nb2gQOgEu+O5kRoG6hbiioqdckIY3hc+Wne93q9aFyfQ+GEp
         GjbsfdBrukx/Ef204nsaAxzSss00vqKuLRrVlnjVwNQBxgSf6A1jYYNFCnrVrsqn+d//
         g5zqDdhpYhPb0eGFEIvXdRsMWAsSKinMAQf+Ia+/jtIDAqYThs/+hb65wiQgAVGXssS5
         xGh5lHfWl82ITvzGS9UXKfR/uoN28axv2W6nWL8P0RzAruFJOucifHE7nq/LDISd839Z
         fA/wwF9ou45Mo2l7G/dJ5CwAGkK+0Wbd2S2zkK7okNP25kv0IDwLeXasm3yOn2slqLj+
         55JA==
X-Gm-Message-State: APjAAAWCygLvcdOa1yLDiCsFViQelmnHZ9IYV+ziOIO4Ascy75il1o8R
        tzN9HrqTbq06MFigrHdStYzOOaru
X-Google-Smtp-Source: APXvYqyJTClxclnIYTcifSFy9E8UhzxwdPcRWT3uKf1e8+ma/aVZZm2fuvEjrIt4gaiVaAwmgwk2Cw==
X-Received: by 2002:a37:4e8f:: with SMTP id c137mr82739150qkb.127.1561310276502;
        Sun, 23 Jun 2019 10:17:56 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-79-162-197.pppoe.mtu-net.ru. [91.79.162.197])
        by smtp.googlemail.com with ESMTPSA id g5sm5631799qta.77.2019.06.23.10.17.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 23 Jun 2019 10:17:55 -0700 (PDT)
Subject: Re: [PATCH v4 00/16] NVIDIA Tegra devfreq improvements and Tegra20/30
 support
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Chanwoo Choi <cw00.choi@samsung.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <CGME20190501234148epcas5p1cc9a8dafa9ee6d8d046d1292b8270727@epcas5p1.samsung.com>
 <20190501233815.32643-1-digetx@gmail.com>
 <60ef6e47-e61b-3a92-e90d-90debedfcfc4@samsung.com>
 <fa061a65-f108-6c5e-1f87-950a9a8caafc@gmail.com>
 <0fb50eb1-a173-1756-6889-2526a10ac707@gmail.com>
 <683b343a-e64f-8345-ac44-10f5c00521bd@samsung.com>
 <5c2a7c32-a98c-3930-14ae-beb0241908d0@gmail.com>
Message-ID: <389cc71d-8f0b-fa39-1325-433d27c75dc8@gmail.com>
Date:   Sun, 23 Jun 2019 20:17:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <5c2a7c32-a98c-3930-14ae-beb0241908d0@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

05.06.2019 2:09, Dmitry Osipenko пишет:
> 04.06.2019 3:49, Chanwoo Choi пишет:
>> On 19. 6. 4. 오전 1:52, Dmitry Osipenko wrote:
>>> 03.05.2019 3:52, Dmitry Osipenko пишет:
>>>> 03.05.2019 3:31, Chanwoo Choi пишет:
>>>>> Hi Dmitry,
>>>>>
>>>>> On 19. 5. 2. 오전 8:37, Dmitry Osipenko wrote:
>>>>>> Changelog:
>>>>>>
>>>>>> v4: Addressed all review comments that were made by Chanwoo Choi to v3:
>>>>>>
>>>>>>     - changed the driver removal order to match the probe exactly
>>>>>>     - added clarifying comment for 1/8 ratio to the Tegra20 driver
>>>>>>
>>>>>>     Chanwoo, please also note that the clk patch that should fix
>>>>>>     compilation problem that was reported the kbuild-test-robot is already
>>>>>>     applied and available in the recent linux-next.
>>>>>
>>>>> I knew that Stephen picked up your path about clock.
>>>>
>>>> Hi Chanwoo,
>>>>
>>>> Okay, good. Thank you very much for reviewing this series! I assume it's
>>>> too late now for v5.2, but it should be good to go for v5.3.
>>>>
>>>
>>> Hello Chanwoo,
>>>
>>> Will be nice to see the patches in the linux-next before they'll hit mainline. We have tested that
>>> everything works fine on a selective devices, but won't hurt to get some extra testing beforehand.
>>> AFAIK, at least NVIDIA people are regularly testing -next on theirs dev boards. Please note that
>>> this not very important, so don't bother if there is some hurdle with pushing to the tracking branch
>>> for now. Also please let me know if you're expecting to see some ACK's on the patches, I'm sure
>>> we'll be able to work out that with Thierry and Jon if necessary.
>>>
>>>
>>
>> Hi Dmitry,
>> I think that it is enough for applying to mainline branch.
>> The devfreq.git is maintained by Myungjoo. He will be merged or
>> reviewed if there are th remained review point.
> 
> Thank you very much!
> 
>>
>> Hi Myungjoo,
>> I reviewed the Dmitry's patches from v1 to v4 patches.
>> And then I tested them on my testing branch[1] for catching
>> the build warning and error. In result, it is clean.
>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/linux.git/log/?h=devfreq-testing
>>
>> Please review or apply these patches for v5.3.
>>
> 
> Hello Myungjoo,
> 
> I think this patchset should be completed now. Thierry has some extra
> comments to the patches, but seems nothing critical so far and all the
> concerns could be addressed in a follow-up series. Please let me know if
> you're fine with this, I can re-spin v5 as well if necessary.
> 

Hello Chanwoo,

It looks like Myungjoo is inactive at the moment. Do you know if he'll
be back to the time of the merge window opening or you'll be curating
the pull request for 5.3 this time?

Secondly, I'll send a few more patches on top of this series, addressing
Thierry's comments and making more improvements. Please let me know if
this causes any problems and I should re-spin the whole series.

Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45AB7224525
	for <lists+linux-tegra@lfdr.de>; Fri, 17 Jul 2020 22:25:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728612AbgGQUZS (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 17 Jul 2020 16:25:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726510AbgGQUZR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 17 Jul 2020 16:25:17 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E14DC0619D2
        for <linux-tegra@vger.kernel.org>; Fri, 17 Jul 2020 13:25:17 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id q7so14121158ljm.1
        for <linux-tegra@vger.kernel.org>; Fri, 17 Jul 2020 13:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=BieDlEuylZbO2Y6aXzjl3upkddpy44BtEPCHYThqJlI=;
        b=reZLYmbTX3gRsvYIs5ghOy+EzBxvkUTb4fWkdCK4B78P8ia4+5AmXAmdBNeTklPhYP
         G5BjOHAQY3bFVfhzLgbXfKpstneJOIul2yizEdJfoFcTnMm6zC8z+XTZcnRtdyls1Kh3
         tX4Oa10Jw44stj7ugwyRncg2ugKuuFyYeScmLZZkUnu9UGwW7g+JxdU7DxnIKP0TkAPh
         nSpncp+uus3SWkBQEV4inTdaFvqw4Td6RFDlI9vasczxZoqU3/5qilqnFBVa5NXT8SYH
         2IkS6foXzs6FlHW+d2LrIvosyOpUmXQ5H2AqYdas9IdDMj22FyaL9CP7KUVwhnoWPEqu
         hYog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BieDlEuylZbO2Y6aXzjl3upkddpy44BtEPCHYThqJlI=;
        b=li8+8uF2aHWXfVTkN31g6314aPXNJL0dRZTM9DtyGY52S6gSwXalQWTrA/FUgwY+Mn
         7zaJ1BZyVxcB9I3NqfxzRFYJFqfIZgBh7YT0jbX4twMPKIl85cg6PXANGDm+fa2iv0Dl
         TuIOZCcSKuxbcq9VyTn5/LT6qn6gzuHRD+FONhLTqqT7eD3Tzq1j/QSoVinhyL3q2XF8
         XEnysF+En/fby0PMVxI8bHIvVNPtpD/Qc4fEOT+LnFqGJTDFs7tUasTWycekGb7Wh/eT
         Evzif0uue7w4vXahUWan8C9/OpW4hWTke/moDkODzDh5FOKQBjKBR1BX6YYK2hCA1SxD
         0Iiw==
X-Gm-Message-State: AOAM531nTr7YQw6ubTApGJpx9Cp50T4auwNNG41WDjtOc16kqeZFWvV7
        On6OVi2QZmuv31aW/I9uuGQ=
X-Google-Smtp-Source: ABdhPJxdoNaj+h7JpH/dyndrqeHso5vASWaP8g+VZdxdzL/aKHj0gqAxNvMcPgxEfzt0Crq4UNqzJQ==
X-Received: by 2002:a2e:7208:: with SMTP id n8mr4884954ljc.315.1595017516025;
        Fri, 17 Jul 2020 13:25:16 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-76-4-184.pppoe.mtu-net.ru. [91.76.4.184])
        by smtp.googlemail.com with ESMTPSA id z1sm1821074ljn.88.2020.07.17.13.25.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2020 13:25:15 -0700 (PDT)
Subject: Re: [GIT PULL 6/7] ARM: tegra: Default configuration changes for
 v5.9-rc1
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
References: <20200717161300.1661002-1-thierry.reding@gmail.com>
 <20200717161300.1661002-6-thierry.reding@gmail.com>
 <CAK8P3a1niUF7xK_bmz=8NJbRGxs7iFzNnRgRS9H=bXpMqarsWg@mail.gmail.com>
 <a6f83a03-3a8f-47d0-6770-fe0e2595cde5@gmail.com>
 <CAK8P3a3nSYfotK=0ZL9XqeMi-v0nqxFZnFKy4OAbvnc9qzN8Xw@mail.gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <e89ba7b4-9711-3ddd-8eda-cf761e179c2b@gmail.com>
Date:   Fri, 17 Jul 2020 23:25:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a3nSYfotK=0ZL9XqeMi-v0nqxFZnFKy4OAbvnc9qzN8Xw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

17.07.2020 23:23, Arnd Bergmann пишет:
> On Fri, Jul 17, 2020 at 10:13 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>> 17.07.2020 22:24, Arnd Bergmann пишет:
>>> On Fri, Jul 17, 2020 at 6:13 PM Thierry Reding <thierry.reding@gmail.com> wrote:
>>>> ARM: tegra: Default configuration changes for v5.9-rc1
>>>>
>>>> Enables a few new configuration options that are useful on the new Nexus
>>>> 7 and Acer A500 devices, as well as the userspace CPU frequency governor
>>>> that's mainly used for testing.
>>>
>>> I've pulled all the other branches, but I'm a little bit wary about
>>> this one since
>>> Dmitry's patch enables a number of options that would increase the kernel
>>> size, and I see no indication that it has been reviewed by anyone else.
>>>
>>> I think the changes all make sense, but I would prefer to have a wider
>>> audience for that patch and get some Acks. If you like, you can send the
>>> tegra specific changes in a new pull request in the meantime, and then
>>> send the remaining additions to the usual suspects as an RFC, with
>>> Cc:soc@kernel.org, so I can apply it later if everyone is happy enough
>>> with it.
>>
>> Hello, Arnd!
>>
>> But these are already the tegra specific changes. The patch changes
>> tegra_defconfig and not the multi_v7_defconfig.
>>
>> Could you please clarify from whom would you expect to get more Acks if
>> not from the tegra maintainers?
>>
>> In practice nobody uses upstream defconfig as-is, it's only used as
>> initial template. So I'm not sure why tegra-kernel size makes you to
>> worry. Could you please explain?
> 
> It was a mistake on my end, for some reason I thought you were
> changing the arm64 defconfig, which does not have per-platform
> files.
> 
> The patch is good, and I'll pull the branch as soon as I get to it
> (it's a bit late for today).

Awesome, thank you!

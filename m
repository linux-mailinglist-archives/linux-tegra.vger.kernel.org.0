Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B162AC3A19
	for <lists+linux-tegra@lfdr.de>; Tue,  1 Oct 2019 18:12:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726034AbfJAQMH (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 1 Oct 2019 12:12:07 -0400
Received: from mail-lf1-f51.google.com ([209.85.167.51]:38734 "EHLO
        mail-lf1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725988AbfJAQMH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 1 Oct 2019 12:12:07 -0400
Received: by mail-lf1-f51.google.com with SMTP id u28so10341161lfc.5
        for <linux-tegra@vger.kernel.org>; Tue, 01 Oct 2019 09:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=pbj1/EalAYVBDBs+Ko2u6dTdZXaToOG5JEA0j0UDD7Q=;
        b=KMvSpuIOSRm9DvcNJR4MW81x+WcxqTsZIHuPvthir16pRSTYOfewAuJdvfxzzUY4j6
         7tOMxKEnVSmzgXUp8gNPj0SptCFH3cqqzJ1Eeouc2H+h6gj7xinCTYVWuGHxbFIkSSw4
         CK5obk2qUKUT5sP8CovVIYKWNmofe70e9LY0IB2rAgTNZuzty6dLHcDAHhCmkacdRwSe
         RLroGWEpDQ6i8FILsmR6uC5AxAeXPdZBxytCwzjofD3r2zY1GnlR59mnW/pe1Dl5F8z2
         iXlUXD0RRFjRZQKnYDWmJtoFS9U6e6gYDZAKhiMYfp7XLlcd8EIrPEhAPJ8uxLBZaDKw
         widw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pbj1/EalAYVBDBs+Ko2u6dTdZXaToOG5JEA0j0UDD7Q=;
        b=IwS5yCGMCZpFGTmrAbTe2su6TNZs/nlZ4qleF6r9EhcqlR15RmI9MkRvLvNYfo0HHd
         bwyztkUylPPWkHGj3MUENxBl8HGWfC8z1gL0MHynCDJpWEt60HnTzjBfzqp+e0tVJnN+
         qGCBsAk/sBrF0h0LYjs8q5qF481nsNK8TWZCzEtNFOgrb10+srL49O1YKcj5vIcyQM97
         94d0aQEIXTgwpkqAkfzlrRqm4fQ4BJAGiJvWjxTu4J0niRZ9NLVxCjh/IMcPATZTVMin
         LhCM3kQ0QwBmdsbcyhgC/YqU4jSBihqRYhiOms+uNnCRku6hhHN/oo4pkz807Zji6bV2
         F7bg==
X-Gm-Message-State: APjAAAX7dWbfYBfNiaxQkljcq/JjJTlpIOEq3sJ4GwUH76RWiIMU63HK
        wLtNpk2dz3WCrVlAVp2I5iOpTSY9
X-Google-Smtp-Source: APXvYqxqVbnFLDwW9ICqjyYyk5wAxy3ZiZPJqPVQgNImv0acXDvIeLgo//jeJb93DVjhzh85J5SJpA==
X-Received: by 2002:a05:6512:6c:: with SMTP id i12mr15560886lfo.40.1569946323589;
        Tue, 01 Oct 2019 09:12:03 -0700 (PDT)
Received: from [192.168.2.145] (ppp94-29-32-67.pppoe.spdop.ru. [94.29.32.67])
        by smtp.googlemail.com with ESMTPSA id c18sm5245166ljd.27.2019.10.01.09.12.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Oct 2019 09:12:02 -0700 (PDT)
Subject: Re: ci_hdrc_tegra hard locks kernel when set to dr_mode = "otg"
To:     Peter Geis <pgwipeout@gmail.com>
Cc:     Peter Chen <peter.chen@nxp.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <CAMdYzYqUg+zCyD6zaFLyWjbYL0t_EzYb5nHM6jTdsOu75P2hvw@mail.gmail.com>
 <VI1PR04MB532769D934068302F58299598B830@VI1PR04MB5327.eurprd04.prod.outlook.com>
 <CAMdYzYoC19vOQOoyO0qGBCOTv5ofQyuuX5gEa2G+16THO8QiZw@mail.gmail.com>
 <CAMdYzYq9ovn3JnSmRks2WHJe3haF8kGEkVpO_UShQLCkX8vgJA@mail.gmail.com>
 <33559f3b-780a-1e37-3d7c-d61357d32e43@gmail.com>
 <CAMdYzYoT6ZG0Qaj9FxgnjLhzwFmo0580F4JgSH2-o9B-Ei-ciw@mail.gmail.com>
 <7b20bd86-08a9-a4de-cb8c-a7624d7df6cb@gmail.com>
 <CAMdYzYqOWsD8ypmANJ32m0A=qYmoaWbPKNB_xRuVS34Fjo1wGA@mail.gmail.com>
 <2e3bb349-fb62-180b-5f07-402500d4e427@gmail.com>
 <CAMdYzYr3MikMF721PCZmAhFxrmJHt6ZtmYruF_i8tbhpkGPq2g@mail.gmail.com>
 <9f9939ba-e28b-74f6-a852-8a76ce9a6b42@gmail.com>
 <f61aea11-47b5-ec00-9e4f-3938b0e78694@gmail.com>
 <CAMdYzYr7irO-qLKws2cFZm6y1iuBj7RQRmUA4Zzx7vO-QoEKVw@mail.gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <980e7e6e-97e4-4b44-f273-677cbd777cf7@gmail.com>
Date:   Tue, 1 Oct 2019 19:12:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAMdYzYr7irO-qLKws2cFZm6y1iuBj7RQRmUA4Zzx7vO-QoEKVw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

01.10.2019 15:49, Peter Geis пишет:
> On Mon, Sep 30, 2019 at 5:27 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>>
>> 30.09.2019 23:55, Dmitry Osipenko пишет:
>>> 30.09.2019 23:05, Peter Geis пишет:
>>>> Good Afternoon,
>>>>
>>>> I have prepped the patch for the tegra-udc driver to fail out in host
>>>> mode and load as a peripheral in otg mode.
>>
>> Just to be clear, this part is good to me. Although, doesn't CI driver
>> operates by default in a peripheral mode when drm_mode=otg?
>>
> The code sets OTG mode in the case of mode is unknown.
> Based off the code path and behavior on my devices, I'm pretty sure it
> defaults to host unless something intervenes in the process, such as
> extcon.

Okay! It definitely defaults to the peripheral mode in my case, sounds
like sensing is working for the OTG mode in yours case.

> I'll see if I can get host mode working, as I'd really like to see
> your Tegra30 cpufreq drivers land.
> 

Please let us know if you'll have any progress, I'll also try to look at
it sometime soon.

It will be very nice if all of the pending patches could get into next
release. You could also help with that by testing the patches, usually
it helps to get some more attention from maintainers.

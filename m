Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02B0BE3DFA
	for <lists+linux-tegra@lfdr.de>; Thu, 24 Oct 2019 23:10:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728857AbfJXVKy (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 24 Oct 2019 17:10:54 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:42710 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727838AbfJXVKy (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Oct 2019 17:10:54 -0400
Received: by mail-lj1-f193.google.com with SMTP id a21so193018ljh.9
        for <linux-tegra@vger.kernel.org>; Thu, 24 Oct 2019 14:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=16Ta175oqbnUMTD4O3/CWW9VGngBsZ+cneUn7RAxpRQ=;
        b=SIrXt0kXvhlShAHoeckeqV0exC0jKVcan9jUbkvgxim87CjFer1UV0sYBKTag9rckf
         jnbnhLj+g8SzSzwU5ZWDV91cpSjH8ZNqcf0tlMJv7k5mhD3agINvrvW3SktOnBFa+aC8
         iTgAOmkNjsbtj+ptJ6e5oDYGxpSpkX4oE1IbjRQHbY0MDdcOkA+7dlKHfdzeCxHjp48K
         87KTCFoMox9a4yL+VyBON2x33CAWrRdMhURn9J8lj1Cl7BQbEGZ1praany4v0J2hVEe4
         NRzVQPwdcZT+RPHwr1hnBrNQAwCMkVryTMDBSXZu6kiqZXnOOwbHGqh9fJI0GSeUB6b8
         s2tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=16Ta175oqbnUMTD4O3/CWW9VGngBsZ+cneUn7RAxpRQ=;
        b=ErAzGbXSPzXyT/m/mZ8PYdVFau+eU3Grsq2xnzWAxhAFrRrD16kYfUMjrl/AViMxAq
         4ce67CO9TY26KcsDJLKnzs6e62/uQciC8HG3owGl0ObvUyzOngjhnpfBAP8Al/K1Lcqp
         bH2PJDxDEMWcMVGia63zKohgFfYR1ehQGSHzOdtbWjeqYxfoqY4dAdzLkI5Pi4dYOoLV
         HEvsXYpKCbhlRsKBLyz0OxKeDRdI5pQFKb8JuGLX1gJQP8HilO1M9rdfdw3zZqfjqZiP
         4Gi9sS+qU9PaPfYA8Ne9Un993eaeMYC5v/c4MVWj2xkeXAkRx/1FOM/aof3Kk8uLRX1b
         IOOQ==
X-Gm-Message-State: APjAAAUSdsq5V89s2t/cmnO2y6tZ1+Ra1TgVixkn8FGRUyoyS7E2XPqz
        uwLnoGPjcmjmO93iLB7hL4VOIbxQ
X-Google-Smtp-Source: APXvYqwoatQlYxF+uFontTC3REB5T52VXPsFP21rjlbIkZ1UY8vmhkmDG3n0zjAIqRhNFZk4vpBNUQ==
X-Received: by 2002:a2e:2bc7:: with SMTP id r68mr4132733ljr.27.1571951451641;
        Thu, 24 Oct 2019 14:10:51 -0700 (PDT)
Received: from [192.168.2.145] (94-29-10-250.dynamic.spd-mgts.ru. [94.29.10.250])
        by smtp.googlemail.com with ESMTPSA id g12sm1123334ljj.73.2019.10.24.14.10.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2019 14:10:50 -0700 (PDT)
Subject: Re: [PATCH v2] drm/tegra: Do not use ->load() and ->unload()
 callbacks
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org
References: <20191024173137.290420-1-thierry.reding@gmail.com>
 <20191024181539.GA31268@qmqm.qmqm.pl>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <553f12c4-b1f4-b48c-45e4-c4280936d1e4@gmail.com>
Date:   Fri, 25 Oct 2019 00:10:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191024181539.GA31268@qmqm.qmqm.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

24.10.2019 21:15, Michał Mirosław пишет:
> On Thu, Oct 24, 2019 at 07:31:37PM +0200, Thierry Reding wrote:
>> From: Thierry Reding <treding@nvidia.com>
>>
>> The ->load() and ->unload() drivers are midlayers and should be avoided
>> in modern drivers. Fix this by moving the code into the driver ->probe()
>> and ->remove() implementations, respectively.
>>
>> v2: kick out conflicting framebuffers before initializing fbdev
>>
>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>> ---
>> Michał, Dmitry,
>>
>> do you guys have a way of testing that the removal of the conflicting
>> framebuffer actually works?
> [...]
> 
> I might be able to check during the weekend. Is this patch alone enough
> for v5.3?

I don't think it will apply cleanly on top of 5.3, but should work with
linux-next or by cherry-picking 9d5a54987265.

Regarding the testing, I never used simple-fb on Tegra before and it's
not working for me now. Hopefully it will work for you, Michał.

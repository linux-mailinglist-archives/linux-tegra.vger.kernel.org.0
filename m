Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8100A2654E3
	for <lists+linux-tegra@lfdr.de>; Fri, 11 Sep 2020 00:15:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725308AbgIJWPI (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 10 Sep 2020 18:15:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725294AbgIJWPF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 10 Sep 2020 18:15:05 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C23F8C061573
        for <linux-tegra@vger.kernel.org>; Thu, 10 Sep 2020 15:15:04 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id b19so10174385lji.11
        for <linux-tegra@vger.kernel.org>; Thu, 10 Sep 2020 15:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Raxmaoh7OKaV16dqQJzdv854oFz0jczIivRr3ttN/Wg=;
        b=nOBdnrrM2tDd4cZzxU6CZ+rLBVylo7DjL640mbNV6iqlg0Jvz7hls6ktca77bvJi6t
         GI2VFKYHYjegT6m9Bl/BAWZu+A8StL3zhTOt/ftX6YTKHUOa30rJJ9njlI8APR+yjQ/R
         SHsqM3cjMMPAfkJTFjDb96RVmuFKBvEDY9q/gYfo+QntEHkl6CZqzu6kGUJ1ADSzWz0F
         OAr5VYruqD+kqYQOeBp1DZwI9lxaqQinCX5DDbyYWAkPpoc9nxIId7yiyF0VI8c/pqeY
         4/pGeNF5NkM9xbDobivvxCvsjp/lmyjQREZWrEywS8lo68q76qHbYxekdwUyqoY5JfEZ
         86eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Raxmaoh7OKaV16dqQJzdv854oFz0jczIivRr3ttN/Wg=;
        b=j72Wg2KxHBudOC5HKLvYgaItaO1UcrzftYIAVcobV9gLrhsfhy1sQP5ZBxX9r5HABi
         IcCre+7ajrmasTV8Cd01EkiNan08y5XPvWyV6mC1xqIrAoV9NYaA+B8qbpriRoy20JOm
         Oeltfc58KBzwioRSkyjYjtF/JHslEyivvZT+AGujwx6Un0+sycvrOQSf07x3Cs4hMtEK
         ilHzpTlVh4o0AmoeE+XO+z+jl5pbFCb+OYCoOpbuT6CdGHJ5ehOv264v/jZlrsBlMdtq
         +mym/w8UfcX6kEvddXeqQqvw5UXBaz9wtXXbzAErDZ7DELXpW8FwQabApbv6ydkdYXlE
         wvdQ==
X-Gm-Message-State: AOAM5311ybsOgk+GJ5uN1HPBQ/pBnqbz7eU0Laao4x7cQBHiK6AHKBgo
        D+elsUsx9vg5C/8wjX+L4OQ=
X-Google-Smtp-Source: ABdhPJwN8obc5OJsxAvU8E/JWbo+vImVEZnAmvcDkxEiZzVb3hpDHb1DyoIdeUo1Sn9exmAZQgRB4w==
X-Received: by 2002:a05:651c:102c:: with SMTP id w12mr5705354ljm.8.1599776103305;
        Thu, 10 Sep 2020 15:15:03 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id h17sm69385ljj.4.2020.09.10.15.15.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2020 15:15:02 -0700 (PDT)
Subject: Re: DRM_TEGRA_SUBMIT_BUF_WRITE_RELOC
To:     Mikko Perttunen <cyndis@kapsi.fi>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <20200905103420.3021852-15-mperttunen@nvidia.com>
 <54aff7f1-86b2-6bd7-1e47-2078edcf94b3@gmail.com>
 <a734a45f-2366-8a9f-1029-c052bd03bf78@kapsi.fi>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <17e24d23-3b1e-44e3-57ca-35721dbd4af2@gmail.com>
Date:   Fri, 11 Sep 2020 01:15:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a734a45f-2366-8a9f-1029-c052bd03bf78@kapsi.fi>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

09.09.2020 11:10, Mikko Perttunen пишет:
> On 9/9/20 2:45 AM, Dmitry Osipenko wrote:
>> 05.09.2020 13:34, Mikko Perttunen пишет:
>> ...
>>> +/* Submission */
>>> +
>>> +/** Patch address of the specified mapping in the submitted gather. */
>>> +#define DRM_TEGRA_SUBMIT_BUF_WRITE_RELOC        (1<<0)
>>
>> Shouldn't the kernel driver be aware about what relocations need to be
>> patched? Could you please explain the purpose of this flag?
>>
> 
> Sure, the kernel knows if it returned the IOVA to the user or not, so we
> could remove this flag and determine it implicitly. I don't think there
> is much harm in it though; if we have the flag an application can decide
> to ignore the iova field and just pass WRITE_RELOC always, and it's not
> really any extra code on kernel side.

Sounds like there is no real practical use for this flag other than for
testing purposes, correct?

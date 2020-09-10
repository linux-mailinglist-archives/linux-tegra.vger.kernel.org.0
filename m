Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98BAE26543F
	for <lists+linux-tegra@lfdr.de>; Thu, 10 Sep 2020 23:53:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725710AbgIJVxl (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 10 Sep 2020 17:53:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725763AbgIJVxg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 10 Sep 2020 17:53:36 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2317C061573
        for <linux-tegra@vger.kernel.org>; Thu, 10 Sep 2020 14:53:35 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id s205so10151192lja.7
        for <linux-tegra@vger.kernel.org>; Thu, 10 Sep 2020 14:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ZTz92FZRLYQUuL1AGrMY217U2x0D5xTTHk4tSTwZ26I=;
        b=P3SZ+1wII1hoifG4XlZEtd9JsxZ4/tEiGdEipNFTMxBw37+k0HJq9qm0gJWi/h2Snl
         oVjaJqZQKhl6qCxV3rLbYbdpM3zAYYJpoiw2kMRnNRVGN5O3ayGT3pvM5KUjidgguW66
         o62Sc7Fs20xtD+WRJxf03Vb5W24pdCYdWKJdR04WQH1OAFl0oQBlACGRu8ytakrn1Iv0
         ZiUMR6aPfNwE/VCt7UWamSe+LIosHJKc7wHClWT0oR3kpBvnox7jZ7bXUpyGH0UHUNen
         Wa1VtC2B3HoS8739wAzvdrcr8sU0RwzI417UYDvBy4SqJL1+UiQJU+VTvoTi8Izf6h59
         cPyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZTz92FZRLYQUuL1AGrMY217U2x0D5xTTHk4tSTwZ26I=;
        b=gDuXh3i341RXdEjkKooczmCZhfD+zF1O0uyiwcOiMVHyh1rbLXe8GG5QTGnZKUafV/
         mGJzBw+aWybOMuJn/B6HvyLPlKU0PNBEWYIUofrXmlcE6L9g+EFbbxqOpkUeHrFsm/fm
         MA50LTWUvXOwmo6G47n4Y3wim5B6KGG+n92LUtddDIWUqlZVip0vV8d6EpwDIVRPcHkj
         +Un4l4L5G8WQuJY01AukaXmI/P7K3vKpfI9E8reiNnOk04/Ynazgrs7HKPJTMdny1ZHM
         Dn9XdjjAIywXPKeOPz4Y6CJjiNkZHEAgGsa6nWxjXfrdPf0TkA0wkYiFs21KfBYUzCnO
         Z2Wg==
X-Gm-Message-State: AOAM530q3o2BKJo8J8DYaAi6ajvKs7r5d3cxWv+ch174R+kZp3aVhKkc
        PRX8NkaaFBzoi5iNByj1qzQ=
X-Google-Smtp-Source: ABdhPJzAtxOdImQW7Iwj61TpQ/70njlX6JUG7pEszRZjYGlGI0N+d8Ack9GN8s5OhVspUeQbOWzvBg==
X-Received: by 2002:a2e:90ca:: with SMTP id o10mr5756072ljg.155.1599774814213;
        Thu, 10 Sep 2020 14:53:34 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id j127sm21998lfd.6.2020.09.10.14.53.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2020 14:53:33 -0700 (PDT)
Subject: Re: [RFC PATCH v2 00/17] Host1x/TegraDRM UAPI
To:     Mikko Perttunen <cyndis@kapsi.fi>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <963bb17d-9501-0118-b5c2-a06d68c3eb9f@gmail.com>
 <8fb335d3-5af9-5922-579c-e3575772732a@kapsi.fi>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ae922486-5e10-e795-54a7-565b87abfa4d@gmail.com>
Date:   Fri, 11 Sep 2020 00:53:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <8fb335d3-5af9-5922-579c-e3575772732a@kapsi.fi>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

09.09.2020 11:44, Mikko Perttunen пишет:
...
>> Could you please enumerate all the currently opened questions?
>>
> 
> Which open questions do you refer to?

Anything related to the UAPI definition that needs more thought. If
there is nothing outstanding, then good!

> The open items of v1 should be
> closed now; for fences we setup an SW timeout to prevent them from
> sticking around forever, and regarding GEM the GEM IOCTLs are again
> being used.
> 

We'll see how it will be in practice! For now it's a bit difficult to
decide what is good and what needs more improvement.

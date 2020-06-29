Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41B2520D755
	for <lists+linux-tegra@lfdr.de>; Mon, 29 Jun 2020 22:07:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727020AbgF2T26 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 29 Jun 2020 15:28:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732775AbgF2T2u (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 29 Jun 2020 15:28:50 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E00BFC061755
        for <linux-tegra@vger.kernel.org>; Mon, 29 Jun 2020 12:28:49 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id m26so9808753lfo.13
        for <linux-tegra@vger.kernel.org>; Mon, 29 Jun 2020 12:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rr1sMHaAHEqgN/A83QolssAtZFeS7HWBgBdeKPZlkb8=;
        b=J/4rVlThiZdqc+W6qpVn9xdc0UzZOqkZwwXpsYkpKKACtsEZtFxm1iVzgotduMZp1T
         ZianxvUI5g34ekPzGm00NcjYFPYki6XH8N3On57grO8jnWYvS5jfhEu02YMF9321i4o0
         L3M6Eo0an2DjrejCVGpfFzPOKgw5yadMnde5EsBd03Vq5kDr8Iwn22Ge3j4wfH4L/Bi5
         XM21Uv+N+yaOQnFRtSqC9KGZfRtHKHXEoYYzgE8WJkpdGxmM6a+UxG1/xjANxisFO0BM
         NuS0CddJepYh6V0kAdXLcd0vkq6WQzRs3T+/eyFxg1ic2BwVDwEnyb7XeNoTRiGl8P5X
         onXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rr1sMHaAHEqgN/A83QolssAtZFeS7HWBgBdeKPZlkb8=;
        b=kk+RLWHLy/r7hDBjQxfjW/7uQlAd5y2XKEZOmlDgTU7tuhRCrmXypWGhK7vPPk13gi
         +Grh4PsA/avBpAFE7ptxdRpIPI5YYsNWyjqIW6ph2a8ZpR1IeGupiVfPfgl7rYeIIrbK
         D1/r51k5TbyMx37KLqvqKtRCn2FP6iZ/RyyKwKaI54cNy6W9fSpbicvL56UaAloASw4w
         5mi9/KylHBf1ZBdLAX5i0iR39KRt4N1BSWj7IVRs7pMacKxKrTPnCiP6Z85zvxafhgHI
         9N2ZQmgCE63pY1zl8sIh6s6rS6BvRxvcTgzLg4+pGl9AZaKFJURpmdeR84TD+4eUf3OX
         TjkQ==
X-Gm-Message-State: AOAM531c4eQXM/Ik0nqdSdOqpNGIj7QHuoq5RN4qgv+Qeh+X7Id6DWE9
        HU5kMB9dcQELxHeIWQbg4uY=
X-Google-Smtp-Source: ABdhPJzkzCc8zio3InqZD3UrNliu1whaWmf5kHDuZkB1KAdY5hvFvL4Dm018z8bgJRKH2qjmcn1t8Q==
X-Received: by 2002:ac2:4c03:: with SMTP id t3mr9873318lfq.72.1593458927957;
        Mon, 29 Jun 2020 12:28:47 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru. [79.139.237.54])
        by smtp.googlemail.com with ESMTPSA id f9sm184418ljf.27.2020.06.29.12.28.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2020 12:28:46 -0700 (PDT)
Subject: Re: [RFC] Host1x/TegraDRM UAPI (sync points)
To:     Mikko Perttunen <cyndis@kapsi.fi>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, sumit.semwal@linaro.org,
        gustavo@padovan.org
Cc:     "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>, talho@nvidia.com,
        bhuntsman@nvidia.com, Erik Faye-Lund <kusmabite@gmail.com>
References: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
 <5b1edaad-ba36-7b0f-5b02-457ae5b6d91e@gmail.com>
 <62859775-514c-2941-75ed-6905e9282a6f@kapsi.fi>
 <623c1eaa-31fb-8dff-f6c0-d8cd0be60070@gmail.com>
 <827c92a6-7fed-a81c-ba8e-6c69416c4ab9@kapsi.fi>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <e117a4a3-5a7d-6fc2-af63-9614cf6f9280@gmail.com>
Date:   Mon, 29 Jun 2020 22:28:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <827c92a6-7fed-a81c-ba8e-6c69416c4ab9@kapsi.fi>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

29.06.2020 13:27, Mikko Perttunen пишет:
...
>> We don't need a dedicated sync point FD for all kinds of jobs, don't we?
>> For example, I don't see why a sync point FD may be needed in a case of
>> Opentegra jobs.
> 
> I think it's cleaner if we have just one way to allocate syncpoints, and
> then those syncpoints can be passed to different things depending on the
> situation.
> 
> If we want to protect direct incrementing while a job is submitted, we
> could have a locking API where an ongoing job can take a lock refcount
> in the syncpoint, and incrementing would return -EBUSY.

Okay, let's go with this for now.

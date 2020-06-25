Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD76320980A
	for <lists+linux-tegra@lfdr.de>; Thu, 25 Jun 2020 02:59:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388862AbgFYA7d (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 24 Jun 2020 20:59:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388789AbgFYA7d (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 24 Jun 2020 20:59:33 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1724C061573
        for <linux-tegra@vger.kernel.org>; Wed, 24 Jun 2020 17:59:31 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id c11so2271935lfh.8
        for <linux-tegra@vger.kernel.org>; Wed, 24 Jun 2020 17:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=U7REP6InW27QF4cjlx544bdQ5rpHtibNJad6s2Fb/qE=;
        b=pJ+GwEm/hITNli8ltpxBHuXzyRogeXvrqAquU8W4QgksanJOmjkeR/2atFJmeJOo/3
         75g45pnn4qQhwCLDdKweqQnvCYqMq7O1swLT2MGWp3JQXRLgu+fTO4D4GJLQ6q9zaZyI
         ugyXjAw44uUYlWcGNQzhJK2Y6kiixs/kSyfO3KAa/zAuhIsmp2+hCGKwO96zS1WmydLY
         KaZJEux+f0t05I9rANLAQffoEJj6JZ6BnAbJuMizRRAJfOvxgiSknR+aW1JqLCJtp832
         hk2sMvwPlshn7h0TXm1VpKs+zboQvesTpjroBqkFqJzys5LXme5We7FmLpwclsvYex7b
         zbUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=U7REP6InW27QF4cjlx544bdQ5rpHtibNJad6s2Fb/qE=;
        b=oVBkJrIbANDJQKGJl7lc8pak3gKXk1ae6wecFzYuvigv7sn9TDE8Jnn1LE+39s092E
         EoLvfGiyFKKur6Krd+t265tU9KSUhJzjFUNqd6bxQuZ4d2N5anDbkQN80e3jJfcv+cxo
         1m3QZgwPmXa4d+GD3NjP0M1Ts8x42p6kdA7vLrb9RZj0Zc+cVfUvLJOjzRM7Mnh5MDnP
         QgV74mkUrbMpHqVKs3Tc90EcfEezzI2/IEya98SAKmiXiPV2v82Tq8cS2JuxDS38INXE
         UlwqUE07gz1gW2jgNJPivO20Ck1ZTsXEN7hUljlkmDM7LMxAVrH1YORym77BFXkCLfU0
         kx6Q==
X-Gm-Message-State: AOAM5307IW28RrsDOfTxc9nlaNlE9gBUBQjdlkOd/gyUjaj9BVeGcGQt
        svofgZUViKN4buN2etnmKns=
X-Google-Smtp-Source: ABdhPJxQAKxPQtHZm5CnlnMHT9rf3jpNUguoZXXmSvnsJ7hBBKy9RMSBU9a7A9koZAX7TxQO4Ch8dw==
X-Received: by 2002:ac2:44cd:: with SMTP id d13mr16536048lfm.13.1593046769359;
        Wed, 24 Jun 2020 17:59:29 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru. [79.139.237.54])
        by smtp.googlemail.com with ESMTPSA id j19sm1773411ljg.28.2020.06.24.17.59.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2020 17:59:28 -0700 (PDT)
Subject: Re: [RFC] Host1x/TegraDRM UAPI
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Mikko Perttunen <cyndis@kapsi.fi>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, sumit.semwal@linaro.org,
        gustavo@padovan.org
Cc:     "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>, talho@nvidia.com,
        bhuntsman@nvidia.com
References: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
 <f85f3fa0-ba18-ddd5-2bac-158dfed9b792@gmail.com>
Message-ID: <c695bb1a-28d3-963f-868c-483005e3dd1d@gmail.com>
Date:   Thu, 25 Jun 2020 03:59:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <f85f3fa0-ba18-ddd5-2bac-158dfed9b792@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

25.06.2020 02:18, Dmitry Osipenko пишет:
> 23.06.2020 15:09, Mikko Perttunen пишет:
>> struct drm_tegra_channel_submit {
>>         __u32 channel_id;
>>         __u32 flags;
>>
>>         /**
>>          * [in] Timeout in microseconds after which the kernel may
>>          *   consider the job to have hung and may reap it and
>>          *   fast-forward its syncpoint increments.
>>          *
>>          *   The value may be capped by the kernel.
>>          */
>>         __u32 timeout;
>>
>>         __u32 num_syncpt_incrs;
>>         __u32 num_relocations;
>>         __u32 num_commands;
>>
>>         __u64 syncpt_incrs;
>>         __u64 relocations;
>>         __u64 commands;
> 
> Do we really need to retain the multi-gather support? The code-bloat
> (both userspace and kernel driver) is very significant just for
> preparing and patching of the multi-buffer cmdstreams.
> 
> If userspace runs out of a free space within the pushbuffer, then it
> should simply reallocate a larger pushbuffer.
> 
> I'm suggesting that we should have a single gather per-job, any objections?
> 

Oh, I just recalled that the later Host1x versions do not allow  to
switch class from gather! Let me think a bit more about it..

Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E760209709
	for <lists+linux-tegra@lfdr.de>; Thu, 25 Jun 2020 01:18:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728697AbgFXXSv (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 24 Jun 2020 19:18:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728035AbgFXXSu (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 24 Jun 2020 19:18:50 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04AC8C061573
        for <linux-tegra@vger.kernel.org>; Wed, 24 Jun 2020 16:18:50 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id s1so4471069ljo.0
        for <linux-tegra@vger.kernel.org>; Wed, 24 Jun 2020 16:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=N/dDcXBXWDwC4zyxlYEZ8P29kM4LWeAUwOY2s7cR5+s=;
        b=fqM00r7Whpw/s41yvxtsj7ZFnpeEirTMoXbgfkefjZDx6lV6bh/PJLDMEVgguxKCZj
         hHzU7dp3hhWnbebldN1402iG9BRwMGohjp0pKKpCiOWUITydWoAfQ+uc4ZTEo03xa0yl
         Ag5AdM7v5bIT5MAlny7lpTCICWIEApnXaKYtM1TYEVWg97Nqgzqhcgn4Qj2v6NOaZ9nZ
         8qnp0Dry5jXvS3fCiGfarER5mZpub8Ro7VxvQhhRp8u2Kc0RG29Xq6jAB6cw9qb9g814
         wyoRoEw7Byvxmu0bbSXMsUI/ARZGdupMbCnMXqCmbioJFDI/D+v4IfphUybO9bnY0w6+
         AByg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=N/dDcXBXWDwC4zyxlYEZ8P29kM4LWeAUwOY2s7cR5+s=;
        b=Go5EWR8gAJ9wqQk5F7BspSy5PkDh8DeivgKK16LiZnEtj2MPi/vUpSH51NOaqabFWX
         K4mcvCCAOLN1opOIerghmJqTG58P8NleXwevWPXKSP1ooCingwnbiHTXy9X0jMBwZl5S
         EmLdOb5TF0td+bhfngnnyVRObLtb1SF5dvYYs9WczsbfZyiWg5BqDhw96hSY4omFeDmR
         9BlSa3Y260LjsutOOKuVaFCNPAfx0W2otmQ5NKXj7fkOhFq3xgAOunj/9O1jtxgvMpMW
         Hvfo9utGxKXyuJqG/6lPxtLdm6IBcf799wn8hoagFUxfsB+M4UKP6bV5GAgSyzIR61AP
         DRcA==
X-Gm-Message-State: AOAM530VtdMIm0VqEBKZNjLkxgmxr8t3aA7+gnU1aCXODdzW6kG5lyLC
        ctCpIEzHMA8Wu/SaQbGoFO0=
X-Google-Smtp-Source: ABdhPJy9180N0f6oZuoxSax4qbvjlu8TUcc9a5AEolEiwH9y/uOercIBbtHsBwCCWZLoMuvHsrs0zg==
X-Received: by 2002:a2e:b0fa:: with SMTP id h26mr14657715ljl.148.1593040728541;
        Wed, 24 Jun 2020 16:18:48 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru. [79.139.237.54])
        by smtp.googlemail.com with ESMTPSA id d6sm1640894lja.77.2020.06.24.16.18.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2020 16:18:47 -0700 (PDT)
Subject: Re: [RFC] Host1x/TegraDRM UAPI
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
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <f85f3fa0-ba18-ddd5-2bac-158dfed9b792@gmail.com>
Date:   Thu, 25 Jun 2020 02:18:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

23.06.2020 15:09, Mikko Perttunen пишет:
> struct drm_tegra_channel_submit {
>         __u32 channel_id;
>         __u32 flags;
> 
>         /**
>          * [in] Timeout in microseconds after which the kernel may
>          *   consider the job to have hung and may reap it and
>          *   fast-forward its syncpoint increments.
>          *
>          *   The value may be capped by the kernel.
>          */
>         __u32 timeout;
> 
>         __u32 num_syncpt_incrs;
>         __u32 num_relocations;
>         __u32 num_commands;
> 
>         __u64 syncpt_incrs;
>         __u64 relocations;
>         __u64 commands;

Do we really need to retain the multi-gather support? The code-bloat
(both userspace and kernel driver) is very significant just for
preparing and patching of the multi-buffer cmdstreams.

If userspace runs out of a free space within the pushbuffer, then it
should simply reallocate a larger pushbuffer.

I'm suggesting that we should have a single gather per-job, any objections?

Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16BBD20C461
	for <lists+linux-tegra@lfdr.de>; Sat, 27 Jun 2020 23:47:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725912AbgF0VrR (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sat, 27 Jun 2020 17:47:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725907AbgF0VrR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 27 Jun 2020 17:47:17 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA842C061794
        for <linux-tegra@vger.kernel.org>; Sat, 27 Jun 2020 14:47:16 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id o4so6979059lfi.7
        for <linux-tegra@vger.kernel.org>; Sat, 27 Jun 2020 14:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ekENi2JYHEuJAdUbeYjX727t9pq4C9ly4N7cklnjims=;
        b=Y+HHlMeUG0RxTatZAp0BPfDVMCKaT90nwXFPWAs42ZQKMIoxCS5yVC0FIxLIfp+tO1
         ZhMq5RHuqS53fl9CjjZCU1GOElYN3Ze9brBStc5gSyzYbnSBrdJyggIfuwjwsh6DPRHv
         xzaUq6GgjCTNyYCwL7kSB/bdDMlfD7nIhXsWU288Qj/4cLfno5qfnk1H4ToFlYVckZE4
         orHv6ex4e+qr7MRXvbh713z9FQPxkXIKiuIus1rcG27AG7jNTvW9zoHoFszHOCgwYPUI
         m1GbQRKuG7rGf8oe2iEAMXaymIev9tpn+bI9BTzOjsDkea0L53e7rYvG87vd2TNHx9WK
         MFrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ekENi2JYHEuJAdUbeYjX727t9pq4C9ly4N7cklnjims=;
        b=C89DeoHhw3E8WruWdat6l6GmKVKJ8YhrsR4g9qOAnm4mUKk1/5PkyHozT96hYcS3+m
         R98tP6ho/ToZPnSGyr9zL612sl0HY4Uhv70dUriwJ2JTH98Jt0tC0SDZpTSiSHKcd9xF
         0wrRtnFulotlkxzxu87L1dMmBPJe5Oqw5M4DFBTaVxHozgpmb12qhdxgxZOrBBEC49cJ
         /7Pr5j1euwsFgqvEjxKOdsgxPFPNMrFC5kbCUUV3TykOyahXMqRjGc5c8ASnFwso7qa3
         YcRIhDTiw6cbW/ppnuSBXVwQRQumbXXl8YLwmoYFl7aCBE89FJolGDvvpqEf/RsM78/c
         ARkQ==
X-Gm-Message-State: AOAM533qqFAizqpJ3ICXTn9R//TupVOhM0PRbHeKQ4/xuYafJG4UiOys
        vGOzOLtcpbbFnEhYY14WFpyySh6jwm0=
X-Google-Smtp-Source: ABdhPJzDdiwU3twKlFT/dTT9VX4bQgwiRxsN/AhDhVDQqgiKa4z3Ss5iaPiYiwbzaI9FkKhAunhr3g==
X-Received: by 2002:a19:ef09:: with SMTP id n9mr5354460lfh.215.1593294435138;
        Sat, 27 Jun 2020 14:47:15 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru. [79.139.237.54])
        by smtp.googlemail.com with ESMTPSA id u19sm854922ljk.0.2020.06.27.14.47.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Jun 2020 14:47:14 -0700 (PDT)
Subject: Re: [RFC] Host1x/TegraDRM UAPI (drm_tegra_submit_syncpt_incr)
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
Message-ID: <9ddfedff-f465-b22d-5d6f-c7ba01731455@gmail.com>
Date:   Sun, 28 Jun 2020 00:47:13 +0300
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
> struct drm_tegra_submit_syncpt_incr {
>         /*
>          * [in] Syncpoint FD of the syncpoint that the job will
>          *   increment.
>          */
>         __s32 syncpt_fd;
> 
>         /*
>          * [in] Number of increments that the job will do.
>          */
>         __u32 num_incrs;
> 
>         /*
>          * [out] Value the syncpoint will have once all increments have
>          *   executed.
>          */
>         __u32 fence_value;
> 
>         __u32 reserved[1];
> };

The job should be considered executed once the final sync point is
incremented.

Hence, there should be only one sync point per-job for increment, why
would you ever need more than one?

Could you please explain what this submit_syncpt_incr is about?

Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5225520C4D2
	for <lists+linux-tegra@lfdr.de>; Sun, 28 Jun 2020 01:27:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726776AbgF0X14 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sat, 27 Jun 2020 19:27:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726449AbgF0X14 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 27 Jun 2020 19:27:56 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8094C061794
        for <linux-tegra@vger.kernel.org>; Sat, 27 Jun 2020 16:27:55 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id q7so799221ljm.1
        for <linux-tegra@vger.kernel.org>; Sat, 27 Jun 2020 16:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=EnXw4bugMF7c8ntOpSKESccHjrLLw0Pd5rUigUujDqI=;
        b=VCniF0Hzjz6JyX4nYw0h6UPyJfbrQWSnrlNaCrHsUBqw5QAd/QTTZBeMQxscgIaDzn
         S/vWixqU92/Qte51MrGZqHQfoUNHkZPRf8bnVqSjZxCkO0f+q4O1NzdIZpblvTYhAKWU
         KM6GwnNdsENy/Sx+Z64DxepIpKaS5pj+Tw7FMTzvaBn/UtHZpC/hVtC4Abrv2dxrndQW
         KNO9G9GcE4UrOO+21RZjmiuFjKtMGRAiTQAjrMWaNLH+n/Cz9rNPoG//riYZQ33tM2TG
         oBySDPBHItcdJ13d9spS1gETtFn05sKZACmiYvJHNrLuIPWpIgWbbCAyVvUFFMpohHZC
         oEZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EnXw4bugMF7c8ntOpSKESccHjrLLw0Pd5rUigUujDqI=;
        b=Df/jpfvkC0oCYXOTkvjRL3boULOmvPfXWjm/PUWBgqbKxyZF8yoNxz/gNSqAnerFPm
         sWfAOw5xh5p+2ZQH+qbTvgd3Wog5dMR4xgQBgnuLbPUn7f+R8RBmCemos8fOWknSppKl
         w03I10L3nUIsyYWGbqR+dvBUpdYArTcqG+G+DnEOfqdcrHulMv4mqhlCarT1vVmpuJZd
         LgsUigGCWYta08j19WihoJIDyfA/D4SxmzPOZY5X2OtkpBPLDUL2eBBC4/SV/n2AKPB9
         3geXWVwtkCmJ5h38Y9be9PMlekXhFckILJAK+N6a6kduZ3b9WKy9appKGIu6ZPPGXsUM
         OxuQ==
X-Gm-Message-State: AOAM531BwnF+r1ipWPqRe2flGTXuAdHJIW/V7R/wWGpSVpEQMlxwbqce
        GLxiU6/jwtVJPz94wp/IFj0=
X-Google-Smtp-Source: ABdhPJx+klT8Fl5w2gwaFvqvhDrsTl+BjgeuD9WY+fCibnM04chA6gXvARpm/t+PVHgt1KdhE7qsRg==
X-Received: by 2002:a2e:b889:: with SMTP id r9mr4868742ljp.92.1593300474199;
        Sat, 27 Jun 2020 16:27:54 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru. [79.139.237.54])
        by smtp.googlemail.com with ESMTPSA id b6sm7733197lfe.28.2020.06.27.16.27.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Jun 2020 16:27:53 -0700 (PDT)
Subject: Re: [RFC] Host1x/TegraDRM UAPI (sync points)
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
Message-ID: <5b1edaad-ba36-7b0f-5b02-457ae5b6d91e@gmail.com>
Date:   Sun, 28 Jun 2020 02:27:51 +0300
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
> 
> ### IOCTL HOST1X_ALLOCATE_SYNCPOINT (on /dev/host1x)
> 
> Allocates a free syncpoint, returning a file descriptor representing it.
> Only the owner of the file descriptor is allowed to mutate the value of
> the syncpoint.
> 
> ```
> struct host1x_ctrl_allocate_syncpoint {
>        /**
>         * @fd:
>         *
>         * [out] New file descriptor representing the allocated syncpoint.
>         */
>        __s32 fd;
> 
>        __u32 reserved[3];
> };

We should need at least these basic things from the sync points API:

- Execution context shouldn't be able to tamper sync points of the other
contexts.

- Sync point could be shared with other contexts for explicit fencing.

- Sync points should work reliably.

Some problems of the current Host1x driver, like where it falls over if
sync point value is out-of-sync + all the hang-job recovery labor could
be easily reduced if sync point health is protected by extra UAPI
constraints.

So I think we may want the following:

1. We still should need to assign sync point ID to a DRM-channel's
context. This sync point ID will be used for a commands stream forming,
like it is done by the current staging UAPI.

So we should need to retain the DRM_TEGRA_GET_SYNCPT IOCTL, but improve it.

2. Allocated sync point must have a clean hardware state.

3. Sync points should be properly refcounted. Job's sync points
shouldn't be re-used while job is alive.

4. The job's sync point can't be re-used after job's submission (UAPI
constraint!). Userspace must free sync point and allocate a new one for
the next job submission. And now we:

  - Know that job's sync point is always in a healthy state!

  - We're not limited by a number of physically available hardware sync
points! Allocation should block until free sync point is available.

  - The logical number of job's sync point increments matches the SP
hardware state! Which is handy for a job's debugging.

Optionally, the job's sync point could be auto-removed from the DRM's
context after job's submission, avoiding a need for an extra SYNCPT_PUT
IOCTL invocation to be done by userspace after the job's submission.
Could be a job's flag.

We could avoid a need for a statically-allocated sync points at all for
a patched cmdstreams! The sync point could be dynamically allocated at a
job's submission time by the kernel driver and then cmdstream will be
patched with this sync point.

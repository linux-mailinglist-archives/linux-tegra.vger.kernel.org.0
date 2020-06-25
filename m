Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9359C2097F7
	for <lists+linux-tegra@lfdr.de>; Thu, 25 Jun 2020 02:48:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388685AbgFYAr7 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 24 Jun 2020 20:47:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729175AbgFYAr7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 24 Jun 2020 20:47:59 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C9A5C061573
        for <linux-tegra@vger.kernel.org>; Wed, 24 Jun 2020 17:47:57 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id x18so4620284lji.1
        for <linux-tegra@vger.kernel.org>; Wed, 24 Jun 2020 17:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=cEe6tz7Y8y564FV1ImrFoRZs0TUgSgWk1EJfVpk6/Tw=;
        b=KJKdS6nIbLsi/NZMdl+edwkpR/AEMjMrDISA570AJHe+L3ZopniZhiYwFiC/miTSG0
         L+wb2bjzTsoYwH6uwFcfWHjG6NwhUYO7mTFSJowH9iEsPWA6BZLcbkZoj4oCj3uQTkgj
         at2pPwu/SPvO5AT/+3mLgTv4wjeTpTIHSAy03XVgV42IpqDqArph/wW5BOOwh8sctCWT
         2tcsVsh21Qi9AblpEN6N0I18UXoDDbrKFGl78Q4J3vfDSkMCI2mC4KJ1xWIV+Zw+yTv4
         AezoHBxON+ATxTl1T62ncVjxqZCZZ7ALR6XTID5muUyXzW86jysEv3Bw+GO+z+UC0YtJ
         pzDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cEe6tz7Y8y564FV1ImrFoRZs0TUgSgWk1EJfVpk6/Tw=;
        b=MWo3fhmCF4FCqUuXz6dsKUXLurLM3ozxq6OLNoTR0Mjb3G0QYYEHjSeEVNF1Fu3unB
         3bQvImk0kJjy2CPJxud/FfbnyEQCsSjnGlMGX5fS9V20Mi/KqBq5MPiPjLtuDDCOeqkR
         7bFBRkXW2g0pHhcrD/+YGjfV6SHpgFbSw3HJeGX3L2GnfWGo3j/aovt/s60t2aLC7DA+
         s3TvWW532LA8jSjqvi5V7CBfZ5HqqV1XzeF6E49dMO6m07aGIuTz1wSFxrOT6oKH5qoE
         eocokxhxL4shXrPDhzwqnSG8tB4fME8cgd3tC1CMVZRXTMAJQ1CDiscHsiNRXg79Yefz
         ZN4A==
X-Gm-Message-State: AOAM5333FsilIYyIupb4ksPQP9qdKlp0EpfPYM4bkmeOeE8uDN21v50n
        Q7smTYy1mL8r46caMnM+EIy3Wfvx
X-Google-Smtp-Source: ABdhPJyz6q75BxU6kcQO5oV91VyFLqQNwvHbAYwjswzIMHVYc4yvNgqD1rrDZvzUfbh9LOYy8pqfeg==
X-Received: by 2002:a2e:2f1e:: with SMTP id v30mr4268405ljv.202.1593046075984;
        Wed, 24 Jun 2020 17:47:55 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru. [79.139.237.54])
        by smtp.googlemail.com with ESMTPSA id v22sm4515152ljg.12.2020.06.24.17.47.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2020 17:47:55 -0700 (PDT)
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
Message-ID: <10f9a8e5-9972-76bc-f60a-1bf1211e55e1@gmail.com>
Date:   Thu, 25 Jun 2020 03:47:53 +0300
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
> #define DRM_TEGRA_SUBMIT_CREATE_POST_SYNC_FILE      (1<<0)
> #define DRM_TEGRA_SUBMIT_CREATE_POST_SYNCOBJ        (1<<1)

The sync object shouldn't be created by the kernel driver and we
shouldn't need the sync-file FD.

Please consider this example of how syncobj may be used:

  1. Syncobj is created by userspace.

  2. Syncobj's handle (post_fence) is passed with the job to the kernel
driver.

  3. Userspace waits on syncobj for the job's submission.

  4. Kernel driver attaches job-completion dma-fence(s) to the syncobj
after starting to execute the job.

  5. Userspace waits on syncobj for the job's completion.

Syncobj is a superset of the sync-file fence:

  a) Syncobj doesn't have a backing file descriptor when it's created.
For example, why would you need an FD if you're not going to share fence
with other processes. It's possible to get FD out of syncobj later on,
please see [1][2].

  b) Syncobj is designed to be used with a GPU jobs. For example,
userspace passes job to the GPU driver's scheduler and then waits until
job has been started to execute on hardware, this is already supported
by syncobj.

  c) It is possible to attach sync-file's fence to a syncobj [1][2][3]
and now:

  - Userspace may attach sync-file's fence to a syncobj.

  - Userspace may use this syncobj for the job's pre-fence.

  - Kernel driver will take out the pre-fence from the syncobj during of
the job's submission and reset the syncobj's fence to NULL.

  - Job's scheduler will wait on this pre-fence before starting to
execute job.

  - Once the job is started to execute, the job's scheduler will attach
the job's completion-fence to the syncobj. Now syncobj has a post-fence!

  d) It is possible to get sync-file FD out of syncobj [1][2][4].

[1]
https://elixir.bootlin.com/linux/v5.7.2/source/include/uapi/drm/drm.h#L730
[2]
https://elixir.bootlin.com/linux/v5.7.2/source/include/uapi/drm/drm.h#L933
[3]
https://elixir.bootlin.com/linux/v5.7.2/source/drivers/gpu/drm/drm_syncobj.c#L653
[4]
https://elixir.bootlin.com/linux/v5.7.2/source/drivers/gpu/drm/drm_syncobj.c#L674

===

So, sync object can carry both pre-fence and post-fence, and they could
be sync-file FDs!

The corollary is that we can get away by using a single syncobj handle
for the job's submission IOCTL.

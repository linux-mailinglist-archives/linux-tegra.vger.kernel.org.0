Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4C6F209BD3
	for <lists+linux-tegra@lfdr.de>; Thu, 25 Jun 2020 11:23:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390842AbgFYJXY (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Thu, 25 Jun 2020 05:23:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390836AbgFYJXX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 25 Jun 2020 05:23:23 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77CE8C061573
        for <linux-tegra@vger.kernel.org>; Thu, 25 Jun 2020 02:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=nPwZbg/W8hi1/Z36vPO9FW4pNGo6LVTFLK2wHXSfEEM=; b=OHrz23bhyr754Vc/VOq1V0UFMi
        srBUrtfjSMEtnr6TFhgEsa0d7GoD9Hmyk3E/0rvQarh7chhHGbcMYpeoYXIX+l4Fh/NFmzAH946P9
        ZRl44+aoxd0qhUlHqUrhslPHgWHvt05aq/3Ms0alQEu8iIy8j+vOSrG7hKsXkmjEwa5WglKDiagPX
        kYTD3gd5JrXtvE/xBUkbnl+ZSTjrITas7LG/OEhvqMJfYR7PDr1bRwtVSDtyIOZN0syjPRpg+Vmq3
        ZZ0SSrVIGok93IFmyKb7/5lW8wQ3tWyIst9b/0MaeRfkQLq4pTTOgdNMUhAPL2lP3AA7CfrZUMIFG
        nARzoqIA==;
Received: from dsl-hkibng22-54faab-65.dhcp.inet.fi ([84.250.171.65] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1joO6I-00036p-II; Thu, 25 Jun 2020 12:23:18 +0300
Subject: Re: [RFC] Host1x/TegraDRM UAPI
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, sumit.semwal@linaro.org,
        gustavo@padovan.org
Cc:     "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>, talho@nvidia.com,
        bhuntsman@nvidia.com
References: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
 <10f9a8e5-9972-76bc-f60a-1bf1211e55e1@gmail.com>
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <d635556c-6fdf-44a4-664b-e7d8449cd27a@kapsi.fi>
Date:   Thu, 25 Jun 2020 12:23:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <10f9a8e5-9972-76bc-f60a-1bf1211e55e1@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.250.171.65
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 6/25/20 3:47 AM, Dmitry Osipenko wrote:
> 23.06.2020 15:09, Mikko Perttunen пишет:
>> #define DRM_TEGRA_SUBMIT_CREATE_POST_SYNC_FILE      (1<<0)
>> #define DRM_TEGRA_SUBMIT_CREATE_POST_SYNCOBJ        (1<<1)
> 
> The sync object shouldn't be created by the kernel driver and we
> shouldn't need the sync-file FD.
> 
> Please consider this example of how syncobj may be used:
> 
>    1. Syncobj is created by userspace.
> 
>    2. Syncobj's handle (post_fence) is passed with the job to the kernel
> driver.
> 
>    3. Userspace waits on syncobj for the job's submission.
> 
>    4. Kernel driver attaches job-completion dma-fence(s) to the syncobj
> after starting to execute the job.
> 
>    5. Userspace waits on syncobj for the job's completion.
> 
> Syncobj is a superset of the sync-file fence:
> 
>    a) Syncobj doesn't have a backing file descriptor when it's created.
> For example, why would you need an FD if you're not going to share fence
> with other processes. It's possible to get FD out of syncobj later on,
> please see [1][2].
> 
>    b) Syncobj is designed to be used with a GPU jobs. For example,
> userspace passes job to the GPU driver's scheduler and then waits until
> job has been started to execute on hardware, this is already supported
> by syncobj.
> 
>    c) It is possible to attach sync-file's fence to a syncobj [1][2][3]
> and now:
> 
>    - Userspace may attach sync-file's fence to a syncobj.
> 
>    - Userspace may use this syncobj for the job's pre-fence.
> 
>    - Kernel driver will take out the pre-fence from the syncobj during of
> the job's submission and reset the syncobj's fence to NULL.
> 
>    - Job's scheduler will wait on this pre-fence before starting to
> execute job.
> 
>    - Once the job is started to execute, the job's scheduler will attach
> the job's completion-fence to the syncobj. Now syncobj has a post-fence!
> 
>    d) It is possible to get sync-file FD out of syncobj [1][2][4].
> 
> [1]
> https://elixir.bootlin.com/linux/v5.7.2/source/include/uapi/drm/drm.h#L730
> [2]
> https://elixir.bootlin.com/linux/v5.7.2/source/include/uapi/drm/drm.h#L933
> [3]
> https://elixir.bootlin.com/linux/v5.7.2/source/drivers/gpu/drm/drm_syncobj.c#L653
> [4]
> https://elixir.bootlin.com/linux/v5.7.2/source/drivers/gpu/drm/drm_syncobj.c#L674
> 
> ===
> 
> So, sync object can carry both pre-fence and post-fence, and they could
> be sync-file FDs!
> 
> The corollary is that we can get away by using a single syncobj handle
> for the job's submission IOCTL.
> 

Ah, clearly I hadn't understood syncobjs properly :) Last time I spent 
significant time with this they didn't exist yet.. I'll check this out.

Mikko

Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1840E23B461
	for <lists+linux-tegra@lfdr.de>; Tue,  4 Aug 2020 07:25:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727064AbgHDFZP (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 4 Aug 2020 01:25:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726797AbgHDFZO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 4 Aug 2020 01:25:14 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BA64C061756
        for <linux-tegra@vger.kernel.org>; Mon,  3 Aug 2020 22:25:14 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id j19so21462965pgm.11
        for <linux-tegra@vger.kernel.org>; Mon, 03 Aug 2020 22:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=VyvJTV65QYrZba9SIfzf3Qah/NqVWDrTLrkNojuqHV0=;
        b=SafJSNqu2HzopBQNzSMzXgtQyoN95IoHlxuM48onRYrNr0jx5X5Yx4nbz7n1qxZTaz
         BBLmwCHy6ILOfFAj4CVMMmylSVMacwrWKkcJQHwIk7vN5K3c9K4FBhLNWH2UDK0qjPuR
         YGUpqI6YFRmyyfYhhfJDeZht6Y+jZjY7iT5DkLaaNJe5xOHeoArcGLnKyrwUVYgWgrzO
         j1kh4lVdzME9oNVocVV+RTxxFppvbtEuHgVfDLkCKZT8qhtbHe7/vfLu2r0h/KLji4uj
         RI5P+HSeGJFYjBdWLInTEPaOTXwpLsJZ2dkncuYuY/PF5XAQYjUlZEzY0oCevMx0Arni
         uAoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=VyvJTV65QYrZba9SIfzf3Qah/NqVWDrTLrkNojuqHV0=;
        b=iJlj/xNLJf5Kg4OpDyKT9l/XXCKQCHdqfKuCy7VXuliCfQbQ90Aw/PMve7szJawLtT
         dzbQDFgo1DePS4cD1ml2/hY0fRTWDwZAM5gB9i01eUce5gs4qfUh2jtdNLKYNV9VpC5y
         sfzXQd9Bu+veZCbFSCdo8oKnx/fARUOQU7ktiZzWJ3NUWQpghXyaIaYVuLQFOIF49zqr
         rjZY7hUdHEDLWlYf2NQU2NbKVgUtnWJIeTrBstt8phDUysrK35pevMl5Goata2nQ2kil
         kvryEV5pB7Y41lnf8eF5cSJa3OqkZaOK6RRgKZKc3Wh9TWTBfdrOyOGaJmuXRwqSZE4s
         tKQQ==
X-Gm-Message-State: AOAM5307MjCrdxFtD3B5oJ7qG3I67rxgPrwokL+rShWP9i7OOWRHEFgf
        f5dV9IlksqmxwDevAgrlxcRfuA==
X-Google-Smtp-Source: ABdhPJzQBa7GAz/BaRtEtdELU/h9ZsuAAyasELfzNQnsQprm5zGlYxyfDe3Uz3t1K1kJ/+YPjsWlhg==
X-Received: by 2002:a63:5d11:: with SMTP id r17mr17546649pgb.146.1596518713836;
        Mon, 03 Aug 2020 22:25:13 -0700 (PDT)
Received: from localhost ([122.162.244.227])
        by smtp.gmail.com with ESMTPSA id v11sm19518479pgs.22.2020.08.03.22.25.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Aug 2020 22:25:12 -0700 (PDT)
Date:   Tue, 4 Aug 2020 10:55:09 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] cpufreq: tegra186: Fix initial frequency
Message-ID: <20200804052509.24en7voy2bg6vdbc@vireshk-mac-ubuntu>
References: <20200712100645.13927-1-jonathanh@nvidia.com>
 <20200713032554.cykywnygxln6ukrl@vireshk-i7>
 <3d6091f2-6b04-185f-6c23-e39a34b87877@nvidia.com>
 <20200714034635.2zdv3wzmftjg2t4a@vireshk-i7>
 <8c6d3c32-c142-3981-3a52-6560e885f4c9@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c6d3c32-c142-3981-3a52-6560e885f4c9@nvidia.com>
User-Agent: NeoMutt/20170609 (1.8.3)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 31-07-20, 13:14, Jon Hunter wrote:
> I have been doing some more testing on Tegra, I noticed that when
> reading the current CPU frequency via the sysfs scaling_cur_freq entry,
> this always returns the cached value (at least for Tegra). Looking at
> the implementation of scaling_cur_freq I see ...
> 
> static ssize_t show_scaling_cur_freq(struct cpufreq_policy *policy, char *buf)
> {
>         ssize_t ret; 
>         unsigned int freq;
> 
>         freq = arch_freq_get_on_cpu(policy->cpu);
>         if (freq)
>                 ret = sprintf(buf, "%u\n", freq);
>         else if (cpufreq_driver && cpufreq_driver->setpolicy &&
>                         cpufreq_driver->get)
>                 ret = sprintf(buf, "%u\n", cpufreq_driver->get(policy->cpu));
>         else
>                 ret = sprintf(buf, "%u\n", policy->cur);
>         return ret; 
> }
> 
> The various Tegra CPU frequency drivers do not implement the
> set_policy callback and hence why we always get the cached value. I
> see the following commit added this and before it simply return the
> cached value ...
> 
> commit c034b02e213d271b98c45c4a7b54af8f69aaac1e
> Author: Dirk Brandewie <dirk.j.brandewie@intel.com>
> Date:   Mon Oct 13 08:37:40 2014 -0700
> 
>     cpufreq: expose scaling_cur_freq sysfs file for set_policy() drivers
> 
> Is this intentional? 

Yes, it is.

There are two sysfs files to read the current frequency.

- scaling_cur_freq: as you noticed it returns cached value unless it is for
  setpolicy drivers in whose case cpufreq core doesn't control the frequency and
  so doesn't cache any values.

- cpuinfo_cur_freq: This will return the value as read from hardware using
  ->get() callback.

-- 
viresh

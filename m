Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 991462B58DB
	for <lists+linux-tegra@lfdr.de>; Tue, 17 Nov 2020 05:37:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727161AbgKQEgD (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 16 Nov 2020 23:36:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726211AbgKQEgD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 16 Nov 2020 23:36:03 -0500
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38859C0617A6
        for <linux-tegra@vger.kernel.org>; Mon, 16 Nov 2020 20:36:03 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id q28so4711242pgk.1
        for <linux-tegra@vger.kernel.org>; Mon, 16 Nov 2020 20:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=GXmmDGf+Ql390cIFcG7bVcYsBCCOZ8KyowjvFWUw4do=;
        b=W5MwZyGZouVl3P4IMf7TuS8nrhz1X2sfj6Tx5PDGw7b8zEslxsX4DD6Wc/d3f63Lh9
         jWuWdWnKjhrPsWfHRRG4PBQGyGJ4gARr+xcJ+fDBV10gD9O0ywrJctsAlOh+eCHYt380
         bzwzHipfMZ9fWxQHyTTW7W0CgL6g9GyPCHhQvY/sn3Kci005p1xeb7svbNFUBnkQWB1K
         S+JbwwJ4vgukWB3zFnNPzpBUMctsk+ItOa1aYjRhg8WlLhJyOSmTgmXKb2rf4YVqLD4Q
         vWuVV9rzvNyzLsqVQjPtSXH9KpRlK9lLFOmSBLGMLYsu2xFhlCOYDC4j6PjH5ceqDKBB
         wqMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=GXmmDGf+Ql390cIFcG7bVcYsBCCOZ8KyowjvFWUw4do=;
        b=qdXqA7na0PCWxjMNuD2YacVHB7bM8D4wDQMa0mdJEh6bMos90ASeQIM+Js9weJmzg2
         TjTRyBWKi9DU+vgguDB+T+mSd4oC0qgukKRcEUqoIvHuOnWAOamNE67+uMvLZ6tUWnoo
         u2f8XQ8jnZj1r/VYCDB/ee8+1H59rwUkSKTmQmJAqivEb8ipFj8Dd3/cA+KQPmZ+q1H4
         T2FXiI7TPPbP5s2BEzxBD4GBqsLyQNMTMfDyuo3WEeYzQw2iFjNvCo7WihUjZrhPb1hS
         BVPQ8YSuAB7xn4qB0M6e1L3MSYn+/tYZgWiXwjVZOm3Hor0M24N1SGmjMBLGWQ0oVolO
         tnEw==
X-Gm-Message-State: AOAM532Xdqe6kqrQItN5rjF2AMK9U3FesVUxT+3bU/QeR32aSlQfD7d/
        WShZ1pao5D+xpXYFcYsEfNCDlQ==
X-Google-Smtp-Source: ABdhPJwCsvKqJnATAFc1CG4/cKeaAaFwvK+9nVK27eKk0paNUS1Td2ckt/DKW6KQHHvYpgHJu2bbmg==
X-Received: by 2002:a17:90a:df93:: with SMTP id p19mr2783061pjv.170.1605587762764;
        Mon, 16 Nov 2020 20:36:02 -0800 (PST)
Received: from localhost ([122.172.12.172])
        by smtp.gmail.com with ESMTPSA id s21sm5726680pgm.65.2020.11.16.20.36.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2020 20:36:01 -0800 (PST)
Date:   Tue, 17 Nov 2020 10:06:00 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sumit Gupta <sumitg@nvidia.com>, linux-pm@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cpufreq: tegra186: Fix get frequency callback
Message-ID: <20201117043600.bqzr3zmw6n7vj3fj@vireshk-i7>
References: <20201103115514.547047-1-jonathanh@nvidia.com>
 <20201104093349.l3r3eftwyvaoqjf2@vireshk-i7>
 <c4c384cd-2d8f-6f19-cd6b-18450cbf957b@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4c384cd-2d8f-6f19-cd6b-18450cbf957b@nvidia.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 16-11-20, 15:55, Jon Hunter wrote:
> Hi Rafael,
> 
> On 04/11/2020 09:33, Viresh Kumar wrote:
> > On 03-11-20, 11:55, Jon Hunter wrote:
> >> Commit b89c01c96051 ("cpufreq: tegra186: Fix initial frequency")
> >> implemented the CPUFREQ 'get' callback to determine the current
> >> operating frequency for each CPU. This implementation used a simple
> >> looked up to determine the current operating frequency. The problem
> >> with this is that frequency table for different Tegra186 devices may
> >> vary and so the default boot frequency for Tegra186 device may or may
> >> not be present in the frequency table. If the default boot frequency is
> >> not present in the frequency table, this causes the function
> >> tegra186_cpufreq_get() to return 0 and in turn causes cpufreq_online()
> >> to fail which prevents CPUFREQ from working.
> >>
> >> Fix this by always calculating the CPU frequency based upon the current
> >> 'ndiv' setting for the CPU. Note that the CPU frequency for Tegra186 is
> >> calculated by reading the current 'ndiv' setting, multiplying by the
> >> CPU reference clock and dividing by a constant divisor.
> >>
> >> Fixes: b89c01c96051 ("cpufreq: tegra186: Fix initial frequency")
> >>
> >> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> >> ---
> >>  drivers/cpufreq/tegra186-cpufreq.c | 33 +++++++++++++++++++-----------
> >>  1 file changed, 21 insertions(+), 12 deletions(-)
> > 
> > Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> > 
> > Rafael: This needs to go in the next rc and so I am not applying it
> > in my tree as this is the only fix I have for now.
> 
> 
> Are you able to pick this up for v5.10 fixes?

Applied to my tree now, will send a PULL request soon.

-- 
viresh

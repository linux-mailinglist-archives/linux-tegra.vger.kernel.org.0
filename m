Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3518821E67D
	for <lists+linux-tegra@lfdr.de>; Tue, 14 Jul 2020 05:46:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726545AbgGNDqj (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 13 Jul 2020 23:46:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726432AbgGNDqj (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 13 Jul 2020 23:46:39 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78DE5C061755
        for <linux-tegra@vger.kernel.org>; Mon, 13 Jul 2020 20:46:39 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id p3so7009795pgh.3
        for <linux-tegra@vger.kernel.org>; Mon, 13 Jul 2020 20:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=DLRiKT8ElQL4w9dBG1pNFf3WLE40Y4LTcfhyA4y89Qg=;
        b=ErCujttnnbjTupMWYjrWFgnPa1oXUoINHMPQBlPbtAnMaDXkLDbtWq/V+Ugy3P31v9
         kHcJD5sAtUisZHts9jZ6C+fj3CPgOweMZhm8K2+2q0Fj+/Fd56TdQOK3RIr+J7tXH5Kn
         gKB75yAzc8Oqp9WaojlhgtbOhjnxnmEbFhWTDVUuSwtfwOt7GYE+12BaMJWdBSP7vcuj
         aR9AdFjCaS3KhrTLPqNi5bXOojrdm82i532F8H4xOlpfTbEhHU0f3RMS4mQLiPFm6n0Q
         zfWygUQKn1A0eEK8J3+aLCc/+W//Q2+1tTk9b0nyrfITzsbQZmzlzm43hfb0kPvCRCCq
         c4Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=DLRiKT8ElQL4w9dBG1pNFf3WLE40Y4LTcfhyA4y89Qg=;
        b=qQJBID9AZDkIU/M3l2H9e7mCJ81beCp+/KqxzfmeFpbTqnNDJ2ODzIj38LZlywyTg8
         D37IXPHeQggejE78B0PdRobEV+dp4KW3l02ixM7cZ3grDlA+v78RJWnVLzjjH1AIhmYg
         +7cdWJ5R/df/JltUD7/0iECXcBt6AuVp52mgYKxeR8fJ0K6+glRiuDpPR7SF4cT7PHMg
         yzXHb/sZ7nv1bR1lMWnE5RRgz3ywzHr31g3BcqIaBHIFPhpaYAjDU7lUX4J1z3/b/88G
         WVYU10Us6QAhBh49AeyhPU4RYErH4IIKCegObM8ELCfjOWB48cIhYrFDb1Rw79DoVGVt
         NGUQ==
X-Gm-Message-State: AOAM532epJ74fD9zAOPK7YE3rWe/dghVDZMCuWu+YkaT/e445j8yzwMB
        tc/uj5QOaNFnRbr+bojHO55Ssg==
X-Google-Smtp-Source: ABdhPJyz3cTpIEc3XjTCeTBHIKlPszPqw/k3+779CPTNFynf8xRq8tfMhpGs7ZQRwryAXZEwCm93gg==
X-Received: by 2002:aa7:98c1:: with SMTP id e1mr2726090pfm.318.1594698398707;
        Mon, 13 Jul 2020 20:46:38 -0700 (PDT)
Received: from localhost ([122.172.34.142])
        by smtp.gmail.com with ESMTPSA id o2sm15692355pfh.160.2020.07.13.20.46.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 Jul 2020 20:46:37 -0700 (PDT)
Date:   Tue, 14 Jul 2020 09:16:35 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] cpufreq: tegra186: Fix initial frequency
Message-ID: <20200714034635.2zdv3wzmftjg2t4a@vireshk-i7>
References: <20200712100645.13927-1-jonathanh@nvidia.com>
 <20200713032554.cykywnygxln6ukrl@vireshk-i7>
 <3d6091f2-6b04-185f-6c23-e39a34b87877@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d6091f2-6b04-185f-6c23-e39a34b87877@nvidia.com>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 13-07-20, 17:37, Jon Hunter wrote:
> 
> On 13/07/2020 04:25, Viresh Kumar wrote:
> > On 12-07-20, 11:06, Jon Hunter wrote:
> >> Commit 6cc3d0e9a097 ("cpufreq: tegra186: add
> >> CPUFREQ_NEED_INITIAL_FREQ_CHECK flag") fixed CPUFREQ support for
> >> Tegra186 but as a consequence the following warnings are now seen on
> >> boot ...
> >>
> >>  cpufreq: cpufreq_online: CPU0: Running at unlisted freq: 0 KHz
> >>  cpufreq: cpufreq_online: CPU0: Unlisted initial frequency changed to: 2035200 KHz
> >>  cpufreq: cpufreq_online: CPU1: Running at unlisted freq: 0 KHz
> >>  cpufreq: cpufreq_online: CPU1: Unlisted initial frequency changed to: 2035200 KHz
> >>  cpufreq: cpufreq_online: CPU2: Running at unlisted freq: 0 KHz
> >>  cpufreq: cpufreq_online: CPU2: Unlisted initial frequency changed to: 2035200 KHz
> >>  cpufreq: cpufreq_online: CPU3: Running at unlisted freq: 0 KHz
> >>  cpufreq: cpufreq_online: CPU3: Unlisted initial frequency changed to: 2035200 KHz
> >>  cpufreq: cpufreq_online: CPU4: Running at unlisted freq: 0 KHz
> >>  cpufreq: cpufreq_online: CPU4: Unlisted initial frequency changed to: 2035200 KHz
> >>  cpufreq: cpufreq_online: CPU5: Running at unlisted freq: 0 KHz
> >>  cpufreq: cpufreq_online: CPU5: Unlisted initial frequency changed to: 2035200 KHz
> >>
> >> Although we could fix this by adding a 'get' operator for the Tegra186
> >> CPUFREQ driver, there is really little point because the CPUFREQ on
> >> Tegra186 is set by writing a value stored in the frequency table to a
> >> register and we just need to set the initial frequency.
> > 
> > The hardware still runs at the frequency requested by cpufreq core here, right ?
> 
> Yes.
> 
> > It is better to provide the get() callback as it is also used to show the
> > current frequency in userspace.
> 
> I looked at that and I saw that if the get() callback is not provided,
> the current frequency showed by userspace is policy->cur. For this
> device, policy->cur is accurate and so if we added the get() callback we
> essentially just going to return policy->cur. Therefore, given that we
> already know policy->cur, I did not see the point in adding a device
> specific handler to do the same thing.

The get() callback is supposed to read the frequency from hardware and
return it, no cached value here. policy->cur may end up being wrong in
case there is a bug.

-- 
viresh

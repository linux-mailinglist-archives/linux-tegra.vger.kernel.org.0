Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D4371A7318
	for <lists+linux-tegra@lfdr.de>; Tue, 14 Apr 2020 07:45:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405568AbgDNFpJ (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 14 Apr 2020 01:45:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729113AbgDNFpJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 14 Apr 2020 01:45:09 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7192C0A3BDC
        for <linux-tegra@vger.kernel.org>; Mon, 13 Apr 2020 22:45:07 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id x3so5332517pfp.7
        for <linux-tegra@vger.kernel.org>; Mon, 13 Apr 2020 22:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=y6dutUz+30OTRDfg3t8Pl2gIYhm9Chd9KMn0w/7vtgI=;
        b=VouzMP8cBdaVTNf4cBS+Lqgxn2DGWJ9tqJdiwXtybFJ9IMcnceKdjCSFOLtQJx5kk7
         OJbQMxqKIDYHxAXFRyrKdhpX7ngXcR25NtYh1aZFT7UzeXdRu4OYfsGproJYrLxLH/V6
         aCKTIhEmArxjdu5ZPoaULSawf55qspM3wlBMnzbNewddQ0HAFHdul2uxm0hvB3Zi+yqF
         RlSE6c6ebdpxtAa9+8gZXKTUiup4Gkq1FX4rE7cdiL6X88x6dAFyhdJSnxp1p0rGS2E3
         osTeZFeRIWwv7MC9Yxt5ujqApF2SQB1F0C7GNJ7PmpTBa2htp1t2XLYxff69bLgKFiWz
         RWtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=y6dutUz+30OTRDfg3t8Pl2gIYhm9Chd9KMn0w/7vtgI=;
        b=dQO2G9qm/1kWN6JbNHlNtuhoFWkNd1S5fR0mdCGMVxps9f/xFJuO401gF1h0LQnlBq
         M3LHfW8OiRTRZPT8994SnsPJSYWRZUnsASMMjpwDYD5idw0Ss8nyRrik/8rUZa1UJpon
         ALgD/yDzY9MM/CTgMEqExjcBbw6No3UFZTPpHdUkRTRh+wbjPYN5JeQi4P98qyNqZf2I
         gllYM4+tPJunF4bqfBhdyamvFax6TTI0PaiYng5BaP/P6r4CJJkaJLoRZm4ghTKYBUcZ
         Jg1rDKiHfiH9M/8aOvCh7dbfh2wSV8xAGEl+j/pGY+sDtBitUC9E70jplMmIcGyvJPKd
         4eHA==
X-Gm-Message-State: AGi0PuZdre0ilaHYRYNSu6LXHyS+Nu0Rsjm5w49Og15nb5SnHwB1yWqc
        csjoXGJDlHDs6ByYDXsy3oopcw==
X-Google-Smtp-Source: APiQypJMakzgo2Op5kuz+/4pNaCYEt7PY+7a3jClylVbKOOvkfuZrrv0E3uO5uJ53ip22+eTJCSCsA==
X-Received: by 2002:a62:e80e:: with SMTP id c14mr12551415pfi.83.1586843107252;
        Mon, 13 Apr 2020 22:45:07 -0700 (PDT)
Received: from localhost ([122.171.118.46])
        by smtp.gmail.com with ESMTPSA id t103sm10781479pjb.46.2020.04.13.22.45.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 Apr 2020 22:45:06 -0700 (PDT)
Date:   Tue, 14 Apr 2020 11:15:04 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Sumit Gupta <sumitg@nvidia.com>
Cc:     rjw@rjwysocki.net, catalin.marinas@arm.com, will@kernel.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com, talho@nvidia.com,
        linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        bbasu@nvidia.com, mperttunen@nvidia.com
Subject: Re: [TEGRA194_CPUFREQ Patch 2/3] cpufreq: Add Tegra194 cpufreq driver
Message-ID: <20200414054504.e3qn2cnxqur4sclw@vireshk-i7>
References: <20200326115023.xy3n5bl7uetuw7mx@vireshk-i7>
 <d233b26b-6b50-7d41-9f33-a5dc151e0e7d@nvidia.com>
 <20200406025549.qfwzlk3745y3r274@vireshk-i7>
 <3ab4136c-8cca-c2f9-d286-b82dac23e720@nvidia.com>
 <20200408055301.jhvu5bc2luu3b5qr@vireshk-i7>
 <08307e54-0e14-14a3-7d6a-d59e1e04a683@nvidia.com>
 <20200409074415.twpzu2n4frqlde7b@vireshk-i7>
 <00390070-38a1-19aa-ca59-42c4658bee7e@nvidia.com>
 <20200413062141.a6hmwipexhv3sctq@vireshk-i7>
 <64b609f1-efb1-425f-a91a-27a492bd3ec4@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64b609f1-efb1-425f-a91a-27a492bd3ec4@nvidia.com>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 13-04-20, 17:50, Sumit Gupta wrote:
> This was done considering long delay value as explained previously.
> Do you think that smp_call_function_single() would be better than work queue
> here?

Don't work with assumptions, you should test both and see which one
works better. Workqueue should never be faster than
smp_call_function_single() with my understanding.

-- 
viresh

Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 559911126D9
	for <lists+linux-tegra@lfdr.de>; Wed,  4 Dec 2019 10:17:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726958AbfLDJRG (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 4 Dec 2019 04:17:06 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:45105 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726632AbfLDJRG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 4 Dec 2019 04:17:06 -0500
Received: by mail-pj1-f68.google.com with SMTP id r11so2726876pjp.12
        for <linux-tegra@vger.kernel.org>; Wed, 04 Dec 2019 01:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=lMKKy9t0iWSR4/z3gVbW2YwCWQytCz8n363Y9SgDkLg=;
        b=AoaXn3dDFHX0ZWRCrotiHldBlB/HrbAlLuyfSzBLpifiSH9AVjZ1dj8Z7BaKH9srKf
         +nfYSDrlBV6KEf5TTRTVE940MSjDQV5a16P6WEbM93mSde6KBiZeA6nRAxw5Y25B/vnZ
         T5iVOgAJFmwHkTXfejyEXhk0jryeVIjlkrgZDB+IANQ7Ppjjw+WCfSoIoPyOmBk5/SC3
         m/4WwJOBPjBTvU3lKW7RnA9rmf7fJOKSPmSgGfctK+2LjzCuZV2ewflB92JKr429LENu
         2QaqPrTAuB5bm8jp/Y8wRk+pRvFHvaKUThzf3wRGmFAoCUvm0aIETHDh35mLioE6VHZK
         diMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=lMKKy9t0iWSR4/z3gVbW2YwCWQytCz8n363Y9SgDkLg=;
        b=CLSugjucgyVzo5WS0lN1ffZHm0Ni/dY3gTrHyom7/LVjTqnQiKVvr8aexBfjaJ24sS
         sBQt8SnF0oWPbIY4GJUaamoiqzuiQOXNYjJc3lwS0ljc+Wg791EbORY9mQXsapIqeJpW
         lRu6Lf3TtppqOnCoPiKlZIbUacFY+I1l+rORkkVjF1Fj9S7MxF8pmgiJL8LJTaUjo9kc
         Poir7CqiDynngjcVIP4JgRbfalswomRyE4CX7U9NsRyy6y0hiBSVMXxMGX+3nOHvzpEa
         Xk7hwOtNaRTXrRRvtwm3FkYFTMYNVafowLTrTZcDRIiW6KtobSHDzig6ore9dwQXcbXp
         xWkw==
X-Gm-Message-State: APjAAAU9LQG3SPvHY/L8oKtTgAlCH0oKED7adVEI6PC7r69edzNOlBAD
        vqgUF8mh46WiE33cM4Gdgmcoqg==
X-Google-Smtp-Source: APXvYqyPYVArtaO2xDdvtLX/Iko7lEdMxiXPCNH/Ly1Vnt2lfYUTEc78zQ+nQkBgCTp9YuIdrXgr5g==
X-Received: by 2002:a17:902:8507:: with SMTP id bj7mr2349143plb.69.1575451025955;
        Wed, 04 Dec 2019 01:17:05 -0800 (PST)
Received: from localhost ([122.171.112.123])
        by smtp.gmail.com with ESMTPSA id n26sm6717142pgd.46.2019.12.04.01.17.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Dec 2019 01:17:04 -0800 (PST)
Date:   Wed, 4 Dec 2019 14:47:03 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Mikko Perttunen <cyndis@kapsi.fi>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Sumit Gupta <sumitg@nvidia.com>, rjw@rjwysocki.net,
        catalin.marinas@arm.com, will@kernel.org, jonathanh@nvidia.com,
        talho@nvidia.com, linux-pm@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, bbasu@nvidia.com,
        mperttunen@nvidia.com
Subject: Re: [TEGRA194_CPUFREQ Patch 1/3] firmware: tegra: adding function to
 get BPMP data
Message-ID: <20191204091703.d32to5omdm3eynon@vireshk-i7>
References: <1575394348-17649-1-git-send-email-sumitg@nvidia.com>
 <20191203174229.GA1721849@ulmo>
 <9404232d-84ce-a117-89dd-f2d8de80993e@kapsi.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9404232d-84ce-a117-89dd-f2d8de80993e@kapsi.fi>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 04-12-19, 10:45, Mikko Perttunen wrote:
> Now, my original patchset (which this series is based on) did add
> nvidia,bpmp properties on the CPU DT nodes itself and query BPMP based on
> that. A change is still required for that since tegra_bpmp_get() currently
> takes a 'struct device *' which we don't have for a CPU DT node.

I may be missing the context, but the CPUs always have a struct device
* for them, which we get via a call to get_cpu_device(cpu), isn't ?

-- 
viresh

Return-Path: <linux-tegra+bounces-3092-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5018393BC4C
	for <lists+linux-tegra@lfdr.de>; Thu, 25 Jul 2024 08:02:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B706DB21672
	for <lists+linux-tegra@lfdr.de>; Thu, 25 Jul 2024 06:02:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 916F14CB2B;
	Thu, 25 Jul 2024 06:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yByTCVu+"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5922B9A6
	for <linux-tegra@vger.kernel.org>; Thu, 25 Jul 2024 06:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721887336; cv=none; b=KB6tqdOhlaQGW/knMnURVSfUVMq6I8mdZtylpqwDyh6rFaTk7wrscJ/5H+LfRIOcDGqFm3DHbVs1Gkd0m1rA7aQ10B93ezHagbX4xnfWnxJAkMVq5nuobNNmTKK/qEoVSeSZsQDUn3MmO4hxP51HM8QxpSLysrtKKmmoXxgPBCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721887336; c=relaxed/simple;
	bh=CEJSUnaa5jIf4nyG6AIV3kMsICNFCuXqAz7oD3ADV+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jE12VkDfaaNfqsWcfFpz7RazDlzeqkJKiykzEn5HfQ7UGZBqLcnyWxZOtsonbU7pV2zliDdsaFTe889swHyHZaqkVUTUmDTduPUM2hBUapDGg13W4riQwhVPq2q5iIOpFrbwCS2kyUms+wwf4jYoSSd2EcXOgsQfjRfjVdSCBHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yByTCVu+; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1fc47abc040so3416465ad.0
        for <linux-tegra@vger.kernel.org>; Wed, 24 Jul 2024 23:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721887334; x=1722492134; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lT7pVgmY6+k5PdKkioS4N3aBOVBxViwY3ci9i1PhHtU=;
        b=yByTCVu+WCmDwJM8cIxwxNnWk04q+ziEOznrCWhnQHJsDf9acnlhIvGGPOOIu+hR9x
         c6GtwO5hzQ2GQr+KbGYJICNhfrJNIIn1o4rwcjEHpc4wwUyUnnVZrhB2hSAvYk0syBN5
         pR/oDZ/5f0bvSGrKi8OxcAr3Ez0QXcRJU8Ci5F9pANLoxqvnlrSy7P8x0RxrSFvqpX+7
         t/bnvF+DAXojBUYDtyD/TBZArH9Q3P0PlkVeCun1SCFNmElGy8GknCXMcWgSMicAkynw
         pTcxbW2xUanCanghN64Pr9zx6S6qR4HN1tHrtiHDOSdyz/k79G2O+6QOHNpTuLKaA9eK
         mrMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721887334; x=1722492134;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lT7pVgmY6+k5PdKkioS4N3aBOVBxViwY3ci9i1PhHtU=;
        b=br7Inql6DTetiLqnqxHeeMR0ajTYqTorUbTAqFOgVhQ8qjJL7K/yIkhwm7OTY/fAQ6
         o4IjckcuKKUcU/S6q+svazWpmnSwT+TbGk30DzTCV4MFF61SR2mp4A0zGzfM6jymVmSq
         1s+oXnm2pJHUM54PGj64QcWas2P+WANiodR45NgChOPACjAAgObNg44t32ZQPggrPaao
         ue72ayn1xzSxmG/qaUBoRe52JmLm/kkeadxM8dLuMIi9IpBUb5vbJqhmVOgv3nGpHqXK
         x2n+hm7/tFC52B5tHCsVkYf/RkZEbEn2zF02bHCYuS/vi9evpL856sowMktJqFha75k2
         fQvw==
X-Forwarded-Encrypted: i=1; AJvYcCUuS0GUV7H7NXCLsUmRGwyMlWSHhMWMRv/mAlc2tZ6hkBjxO9GM9picocA5XXSaWqOQdw3r/e0/kbwBIf+tm/rqX8K6UBjnObSA3z0=
X-Gm-Message-State: AOJu0Yz6spg2sQ3dtXnV4KdiLu7a8mivUfs8fRdboMbRoaSjXb5WgrX5
	sG3x/7U1rWbxYa59V1ViH5E6krb0BuGF0Y2JSrl14rOzf+9KW8seq+B9NlPpIeM=
X-Google-Smtp-Source: AGHT+IFe2E3BGyxWknIirjIQ6011l9JnES0NRsCiqCFVXsQdUs6+INPxuFjsH8/OVGUavXN6Ey161g==
X-Received: by 2002:a17:902:e804:b0:1f9:fc92:1b65 with SMTP id d9443c01a7336-1fed35360c8mr22007925ad.9.1721887334263;
        Wed, 24 Jul 2024 23:02:14 -0700 (PDT)
Received: from localhost ([122.172.84.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7ee82bdsm5623535ad.141.2024.07.24.23.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 23:02:13 -0700 (PDT)
Date: Thu, 25 Jul 2024 11:32:11 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>, Nikunj Kela <nkela@quicinc.com>,
	Prasad Sodagudi <psodagud@quicinc.com>, linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] OPP: Fix support for required OPPs for multiple PM
 domains
Message-ID: <20240725060211.e5pnfk46c6lxedpg@vireshk-i7>
References: <20240701114748.hodf6pngk7opx373@vireshk-i7>
 <20240702051526.hyqhvmxnywofsjp2@vireshk-i7>
 <CAPDyKFoA9O5a6xZ+948QOzYqsRjk_0jJaSxeYRwx=76YsLHzXQ@mail.gmail.com>
 <20240711031356.rl2j6fqxrykmqfoy@vireshk-i7>
 <CAPDyKFocjOt+JyzcAqOfCnmTxBMZmPjMerSh6RZ-hSMajRhzEA@mail.gmail.com>
 <CAPDyKFoWgX=r1QtrcpEF-Y4BkiOtVnz4jaztL9zggo-=uiKsUg@mail.gmail.com>
 <20240711131637.opzrayksfadimgq4@vireshk-i7>
 <CAPDyKFqczrJzHApBOYRSg=MXzzd1_nSgQQ3QwKYLWzgZ+XY32A@mail.gmail.com>
 <20240718030556.dmgzs24d2bk3hmpb@vireshk-i7>
 <CAPDyKFqCqDqSz2AGrNvkoWzn8-oYnS2fT1dyiMC8ZP1yqYvLKg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFqCqDqSz2AGrNvkoWzn8-oYnS2fT1dyiMC8ZP1yqYvLKg@mail.gmail.com>

On 18-07-24, 12:38, Ulf Hansson wrote:
> I understand your point, but we don't need to call
> dev_pm_opp_set_opp() from _set_required_opps() to accomplish this.

I _strongly_ feel that the OPP core should be doing what other frameworks, like
clk, regulator, genpd, are doing in this case. Call recursively.

> In fact, I have realized that calling dev_pm_opp_set_opp() from there
> doesn't work the way we expected.
>
> More precisely, at each recursive call to dev_pm_opp_set_opp() we are
> changing the OPP for a genpd's OPP table for a device that has been
> attached to it. The problem with this, is that we may have several
> devices being attached to the same genpd, thus sharing the same
> OPP-table that is being used for their required OPPs. So, we may have
> several active requests for different OPPs for a genpd's OPP table
> simultaneously. It seems wrong from the OPP library point of view. To
> me, it's would be better to leave any kind of aggregation to be
> managed by genpd itself.

Right. I see this problem too and that's why I said earlier that OPP core was
designed for a different use case and genpd doesn't fit perfectly. Though I
don't see how several calls the dev_pm_opp_set_opp() simultaneously is a
problem. This can happen without recursive calling too, where simultaneous calls
for genpds occur.

I think the main problem here, on how genpd doesn't fit with OPP core, is that
the OPP core is trying to do some sort of aggregation generally at its level,
like avoiding a change of OPP if the OPP is same. I think the right way to fix
this is by not doing any aggregation at OPP core level and genpd handle it all.
Which you are also aligned with I guess. This would also mean that OPP core
shouldn't try configuring, clk, regulator, bandwidth, etc for a genpd. The Genpd
core should handle that, else we may end up incorrectly configuring things.

I guess this is what you were trying to say as well, when you were trying to
replace the recursive call with set-level only.

I think, we don't need that change but rather avoid all these extra settings
from dev_pm_opp_set_opp() itself.

Also consider that genpd configuration doesn't only happen with recursive call,
but can happen with a call to dev_pm_opp_set_opp() directly too for the genpd.

> The API as such isn't the problem, but rather that we are recursivly
> calling dev_pm_opp_set_opp() for the required-devs.

I think that design is rather correct, just like other frameworks. Just that we
need to do only set-level for genpds and nothing else. That will have exactly
the same behavior that you want.

> In the single PM domain case, this would simply not work, as there is
> not a separate virtual device we can assign to the required-dev to.

We can assign the real device in that case, why is that a problem ?

-- 
viresh


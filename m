Return-Path: <linux-tegra+bounces-3117-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EFC93ED1F
	for <lists+linux-tegra@lfdr.de>; Mon, 29 Jul 2024 08:06:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ECF0A282028
	for <lists+linux-tegra@lfdr.de>; Mon, 29 Jul 2024 06:06:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E560783CC8;
	Mon, 29 Jul 2024 06:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tZvJdmDa"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA7382D83
	for <linux-tegra@vger.kernel.org>; Mon, 29 Jul 2024 06:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722233155; cv=none; b=fqeQwDiGpDNVyeBr654qTCyzSvEuTES9k1GOO4aMn4fiPtSejTtQ7RwFtgx/PZ7JtIMVx94eWtdWl6XMHQuPs1eJW0az3qAGiJEZND14sK2svB1nNmZF3M8vo6IYuS5WN3K0Cqt639BIph31JWjxEn+smZm5yp3hBfpspkNm15Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722233155; c=relaxed/simple;
	bh=wdI1WmZ5gZzQsRNJn1qhc254kAh7G3Wla4gye/XD6YU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jqZYMYJA1TZcqfqoqEGMlYznBTJK6h0c8AGZllq9cItYnPJnc3FmMglZaP1CpeDBRrQ4RYvtdyegGIEGNBo8zEw1xFblDa2nvhlT9HFSNrvzpK3UJWQo6sO3YDbWghObbSHYFBBalGNIhThbrdQ+4FyAgx/Ulu/v+JkIXfjOfhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tZvJdmDa; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1fc4fccdd78so15104645ad.2
        for <linux-tegra@vger.kernel.org>; Sun, 28 Jul 2024 23:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722233153; x=1722837953; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PboHevTVnqGXRG8Sx3ifW5AKM7DLdqT7xZ2GPBlCnjI=;
        b=tZvJdmDa1c2eGQ4dOD0vs8peuracE/oBrNoSdoHnr52sw5onmVe8Q7USHGh+ZzxRId
         9fxX0wChSwCNWqVttG4g1pYwoQzzMFEezz92ihZmpII11Q3AfTa5B3jf22MkRE6Pu5Ro
         P4OhPZLqcwhwUH8vX1qj5AG2zySW7jjzdPmoPqWxu7jF2e9g6M/qT8D0eEtVfEtRtRoR
         scatqS4Yk2KeoVyzr/gafzp+Vi5oPpjFMqJMHIygLX4xBZOXllSbHFq7k3XaRdltT1xL
         /RN4g8hQBKXlAmU8EryoC4cBr6sVh+Q9FIt9hQXebNtToBogt5fdbQMEeVuK61FHH4u6
         wMLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722233153; x=1722837953;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PboHevTVnqGXRG8Sx3ifW5AKM7DLdqT7xZ2GPBlCnjI=;
        b=p41ARcU+6cbMJOlWAp237z8mkaRb22fIg8x7UbfsGK6moH0EtxUH3aJd7HIUZYyYk3
         +wKywEZGT0kqKLVOSWoPuDEv1fndnLdaS/a6KoQxHCFEDru9qwuKuuUdYFCJl6cwzGWn
         vkYA7/eEm8ip7M69JOdMscJZRXGziz3x2QQ5rq/4VH1PtBpGpaG9uVCFO4e7hFVprqyc
         2lnC8j5WfqymBnPstKN/aCuaABNgeg1gmqTlmDWeNTeWH04MjV2A8DEK6Usbb1r7wKqF
         RlZnrULXTq2UTmEgqIalMTjtDAD5ZEMybOy+AiY8JyxrimS6k9K2HHIsna0Tuy05c7FZ
         Zd/A==
X-Forwarded-Encrypted: i=1; AJvYcCVjtxavZnA76RXYQCzrALT0zpSGWN6O0hVSJv45n18GCfpCT8PPmGOO3nXnS7G5t3Rp+mMT12V8Nu/gFcl/B5hlXPLhvnxWpw/su1I=
X-Gm-Message-State: AOJu0YxuRR6cgOTP7eW2AbR/ayjdXIgI4fVJV+v7qvh2818CRr1V6a7u
	/YDWrhaO7XBddQRehtM1ivcZr1LIv4xw/BWMAmz8MF3zrS+7CA0/QsGQVV9C0ok=
X-Google-Smtp-Source: AGHT+IFYgdp+iVQ1/XSuyzq4QVSdk4OFHZuD424Vvi2niU5cVUKBT7JKHVZ055ZeDc0Exz36js6Zcw==
X-Received: by 2002:a17:903:244a:b0:1fd:a503:88f0 with SMTP id d9443c01a7336-1ff0485b418mr50544315ad.34.1722233153634;
        Sun, 28 Jul 2024 23:05:53 -0700 (PDT)
Received: from localhost ([122.172.84.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7c85930sm73991795ad.29.2024.07.28.23.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jul 2024 23:05:53 -0700 (PDT)
Date: Mon, 29 Jul 2024 11:35:50 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>, Nikunj Kela <nkela@quicinc.com>,
	Prasad Sodagudi <psodagud@quicinc.com>, linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] OPP: Fix support for required OPPs for multiple PM
 domains
Message-ID: <20240729060550.crgrmbnlv66645w2@vireshk-i7>
References: <CAPDyKFocjOt+JyzcAqOfCnmTxBMZmPjMerSh6RZ-hSMajRhzEA@mail.gmail.com>
 <CAPDyKFoWgX=r1QtrcpEF-Y4BkiOtVnz4jaztL9zggo-=uiKsUg@mail.gmail.com>
 <20240711131637.opzrayksfadimgq4@vireshk-i7>
 <CAPDyKFqczrJzHApBOYRSg=MXzzd1_nSgQQ3QwKYLWzgZ+XY32A@mail.gmail.com>
 <20240718030556.dmgzs24d2bk3hmpb@vireshk-i7>
 <CAPDyKFqCqDqSz2AGrNvkoWzn8-oYnS2fT1dyiMC8ZP1yqYvLKg@mail.gmail.com>
 <20240725060211.e5pnfk46c6lxedpg@vireshk-i7>
 <CAPDyKFpSmZgxtmCtiTrFOwgj7ZpNpkDMhxsK0KnuGsWi1a9U5g@mail.gmail.com>
 <20240725112519.d6ec7obtclsf3ace@vireshk-i7>
 <CAPDyKFqTtqYEFfaHq-jbxnp5gD7qm9TbLrah=k=VD2TRArvU8A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFqTtqYEFfaHq-jbxnp5gD7qm9TbLrah=k=VD2TRArvU8A@mail.gmail.com>

On 28-07-24, 22:05, Ulf Hansson wrote:
> > > > I think that design is rather correct, just like other frameworks. Just that we
> > > > need to do only set-level for genpds and nothing else. That will have exactly
> > > > the same behavior that you want.
> > >
> > > I don't quite understand what you are proposing. Do you want to add a
> > > separate path for opp-levels?
> >
> > Not separate paths, but ignore clk/regulator changes if the table belongs to a
> > genpd.
> >
> > > The problem with that would be that platforms (Tegra at least) are
> > > already using a combination of opp-level and clocks.
> >
> > If they are using both for a genpd's OPP table (and changes are made for both
> > opp-level and clock by the OPP core), then it should already be wrong, isn't it?
> 
> They are changing the clock through the device's OPP table and the
> level (performance-state) via genpd's table (using required OPPs).
> This works fine as of today.

There is a problem here I guess then. Lets say there are two devices A and B,
that depend on a genpd.

A requests required OPP 5 (level 5, clk 1.4 GHz), followed by 
B requests required OPP 3 (level 3, clk 1 GHz).

After this level will be configured to 5 and clk to 1 GHz I think.

> It's working today for *opp-level* only, because of the commit above.
> That's correct.

Good.

> My point is that calling dev_pm_opp_set_opp() recursively from
> _set_required_opps() doesn't make sense for the single PM domain case,
> as we can't assign a required-dev for it. This leads to an
> inconsistent behaviour when managing the required-OPPs.

We won't be calling that because of the above patch. In case of a single dev,
the required device isn't set and so we will never end up calling
dev_pm_opp_set_opp() for a single genpd case.

-- 
viresh

